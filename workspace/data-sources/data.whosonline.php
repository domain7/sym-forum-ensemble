<?php

	require_once(TOOLKIT . '/class.datasource.php');
	require_once(DOCROOT . '/extensions/asdc/lib/class.asdc.php');	
		
	define_safe('PS_DELIMITER', '|');
	define_safe('PS_UNDEF_MARKER', '!');
	
	Class datasourceWhosOnline extends Datasource{

		private static $_fields;
		private static $_sections;

		
		public $dsParamROOTELEMENT = 'whos-online';
		
		const AGE = 600; //10 minutes
		
		public function about(){
			return array(
					 'name' => 'Who\'s Online',
					 'author' => array(
							'name' => 'Alistair Kearney',
							'website' => 'http://symphony-cms.com',
							'email' => 'alistair@pointybeard.com'),
					 'version' => '1.0',
					 'release-date' => '2009-07-14');	
		}
		
		public static function findSectionID($handle){
			return self::$_sections[$handle];
		}

		public static function findFieldID($handle, $section){
			return self::$_fields[$section][$handle];
		}

		private static function __init(){
			if(!is_array(self::$_fields)){
				self::$_fields = array();

				$rows = ASDCLoader::instance()->query("SELECT s.handle AS `section`, f.`element_name` AS `handle`, f.`id` 
					FROM `tbl_fields` AS `f` 
					LEFT JOIN `tbl_sections` AS `s` ON f.parent_section = s.id 
					ORDER BY `id` ASC");

				if($rows->length() > 0){
					foreach($rows as $r){
						self::$_fields[$r->section][$r->handle] = $r->id;
					}							
				}
			}

			if(!is_array(self::$_sections)){
				self::$_sections = array();

				$rows = ASDCLoader::instance()->query("SELECT s.handle, s.id 
					FROM `tbl_sections` AS `s`
					ORDER BY s.id ASC");

				if($rows->length() > 0){
					foreach($rows as $r){
						self::$_sections[$r->handle] = $r->id;
					}							
				}
			}			
		}
	
		public function grab(&$param_pool){
			
			self::__init();
			
			$result = new XMLElement($this->dsParamROOTELEMENT);
			
			$rows = Symphony::Database()->fetch(
				"SELECT *
				FROM `tbl_sessions` 
				WHERE `session_data` != 'sym-|a:0:{}sym-members|a:0:{}' 
				AND `session_data` REGEXP 'sym-members'
				AND `session_expires` > (UNIX_TIMESTAMP() - ".self::AGE.") 
				ORDER BY `session_expires` DESC"
			);
			
			$added = array();
			
			if(count($rows) > 0){
				foreach($rows as $r){
					
					$raw = $r['session_data'];
					$data = self::session_real_decode($raw);
					
					if(!isset($data['sym-members'])) continue;
					
					$record = ASDCLoader::instance()->query(
						sprintf(
							"SELECT
								email.value AS `email`,
								MD5(email.value) AS `hash`,
								created_by.username AS `username`
						
							FROM `tbl_entries_data_%d` AS `created_by`
							LEFT JOIN `tbl_entries_data_%d` AS `email` ON created_by.member_id = email.entry_id
							WHERE `created_by`.username = '%s'
							LIMIT 1",
						
							self::findFieldID('created-by', 'comments'),
							self::findFieldID('email-address', 'members'),
							ASDCLoader::instance()->escape($data['sym-members']['username'])
						)
					);
					
					if($record->length() == 0) continue;
					
					$member = $record->current();
					
					// This is so we dont end up with accidental duplicates. No way to select 
					// distinct via the SQL since we grab raw session data
					if(in_array($member->username, $added)) continue;
					$added[] = $member->username;
					
					$result->appendChild(new XMLElement('member', General::sanitize($member->username), array('email-hash' => $member->hash)));
				}
			}
			else{
				$result->setValue('No Records Found.'); //This should never happen!
			}
			
			return $result;

		}


		public static function session_real_decode($str)
		{
		    $str = (string)$str;

		    $endptr = strlen($str);
		    $p = 0;

		    $serialized = '';
		    $items = 0;
		    $level = 0;

		    while ($p < $endptr) {
		        $q = $p;
		        while ($str[$q] != PS_DELIMITER)
		            if (++$q >= $endptr) break 2;

		        if ($str[$p] == PS_UNDEF_MARKER) {
		            $p++;
		            $has_value = false;
		        } else {
		            $has_value = true;
		        }

		        $name = substr($str, $p, $q - $p);
		        $q++;

		        $serialized .= 's:' . strlen($name) . ':"' . $name . '";';

		        if ($has_value) {
		            for (;;) {
		                $p = $q;
		                switch ($str[$q]) {
		                    case 'N': /* null */
		                    case 'b': /* boolean */
		                    case 'i': /* integer */
		                    case 'd': /* decimal */
		                        do $q++;
		                        while ( ($q < $endptr) && ($str[$q] != ';') );
		                        $q++;
		                        $serialized .= substr($str, $p, $q - $p);
		                        if ($level == 0) break 2;
		                        break;
		                    case 'R': /* reference  */
		                        $q+= 2;
		                        for ($id = ''; ($q < $endptr) && ($str[$q] != ';'); $q++) $id .= $str[$q];
		                        $q++;
		                        $serialized .= 'R:' . ($id + 1) . ';'; /* increment pointer because of outer array */
		                        if ($level == 0) break 2;
		                        break;
		                    case 's': /* string */
		                        $q+=2;
		                        for ($length=''; ($q < $endptr) && ($str[$q] != ':'); $q++) $length .= $str[$q];
		                        $q+=2;
		                        $q+= (int)$length + 2;
		                        $serialized .= substr($str, $p, $q - $p);
		                        if ($level == 0) break 2;
		                        break;
		                    case 'a': /* array */
		                    case 'O': /* object */
		                        do $q++;
		                        while ( ($q < $endptr) && ($str[$q] != '{') );
		                        $q++;
		                        $level++;
		                        $serialized .= substr($str, $p, $q - $p);
		                        break;
		                    case '}': /* end of array|object */
		                        $q++;
		                        $serialized .= substr($str, $p, $q - $p);
		                        if (--$level == 0) break 2;
		                        break;
		                    default:
		                        return false;
		                }
		            }
		        } else {
		            $serialized .= 'N;';
		            $q+= 2;
		        }
		        $items++;
		        $p = $q;
		    }
		    return @unserialize( 'a:' . $items . ':{' . $serialized . '}' );
		}

	}

