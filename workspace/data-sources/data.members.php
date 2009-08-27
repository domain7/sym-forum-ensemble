<?php

	require_once(TOOLKIT . '/class.datasource.php');
	require_once(DOCROOT . '/extensions/asdc/lib/class.asdc.php');

	Class datasourceMembers extends Datasource{

		private static $_fields;
		private static $_sections;

		public $dsParamROOTELEMENT = 'members';

		public $dsParamFILTERS = array(
				'username' => '{$member}',
		);

		public function about(){
			return array(
					 'name' => 'Members',
					 'author' => array(
							'name' => 'Allen Chang',
							'website' => 'http://symphony.local:8888',
							'email' => 'allen@symphony21.com'),
					 'version' => '1.0',
					 'release-date' => '2009-04-29T15:57:43+00:00');	
		}

		public static function findSectionID($handle){
			return self::$_sections[$handle];
		}

		public static function findFieldID($handle, $section){
			return self::$_fields[$section][$handle];
		}


		private function __init(){
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
			$result = new XMLElement($this->dsParamROOTELEMENT);

			self::__init();

			$db = ASDCLoader::instance();

			$sql = "SELECT 
						e.id,
						e.creation_date_gmt AS `date`,
						name.value AS `name`,
						role.name AS `role`,
						website.value AS `website`,
						city.value AS `city`,
						timezone_offset.value AS `timezone-offset`,						
						username.username AS `username`,
						email.value AS `email`,
						MD5(email.value) AS `hash`
						
					FROM `tbl_entries_data_%d` AS `name`
					LEFT JOIN `tbl_entries` AS `e` ON name.entry_id = e.id
					LEFT JOIN `tbl_entries_data_%d` AS `r` ON e.id = r.entry_id
					LEFT JOIN `tbl_members_roles` AS `role` ON r.role_id = role.id
					LEFT JOIN `tbl_entries_data_%d` AS `username` ON e.id = username.entry_id	
					LEFT JOIN `tbl_entries_data_%d` AS `email` ON e.id = email.entry_id
					LEFT JOIN `tbl_entries_data_%d` AS `city` ON e.id = city.entry_id
					LEFT JOIN `tbl_entries_data_%d` AS `website` ON e.id = website.entry_id
					LEFT JOIN `tbl_entries_data_%d` AS `timezone_offset` ON e.id = timezone_offset.entry_id
					
					WHERE username.username = '%s'
					LIMIT 0, 1";

			try{
				$member = $db->query(
					sprintf(
						$sql,
						self::findFieldID('name', 'members'),
						self::findFieldID('role', 'members'),
						self::findFieldID('username-and-password', 'members'),
						self::findFieldID('email-address', 'members'),
						self::findFieldID('city', 'members'),
						self::findFieldID('website', 'members'),
						self::findFieldID('timezone-offset', 'members'),		
						$db->escape($this->dsParamFILTERS['username'])
					)
				)->current();	
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if(!($member instanceof StdClass) || is_null($member)){
				$this->__redirectToErrorPage();	
			}

			/*

			  	<entry id="2101">
		            <creation-date time="19:31" weekday="3">2009-01-07</creation-date>			
		            <name handle="allen-chang">Allen Chang</name>
		            <role id="2">Administrator</role>
		            <username-and-password username="Allen" password="86b100a6c3a0d856be4e630959df6de9" />
		        </entry>
		    
			*/
			
			$entry = new XMLElement('entry', NULL, array('id' => $member->id, 'email-hash' => $member->hash));

			$entry->appendChild(new XMLElement('name', General::sanitize($member->name)));
			
			if(isset($member->website) && strlen(trim($member->website)) > 0 ){
				$entry->appendChild(new XMLElement('website', General::sanitize($member->website)));	
			}

			if(isset($member->city) && strlen(trim($member->city)) > 0 ){
				$entry->appendChild(new XMLElement('city', General::sanitize($member->city)));	
			}
			
			$offset = (!is_null($member->{'timezone-offset'}) ? min(max($member->{'timezone-offset'}, -12), 12) : 0);
			$entry->appendChild(new XMLElement('timezone-offset', $offset));	
			
			$entry->appendChild(new XMLElement('role', General::sanitize($member->role)));
			$entry->appendChild(new XMLElement('username', General::sanitize($member->username)));
			$entry->appendChild(General::createXMLDateObject(strtotime($member->date.'+00:00'), 'date-joined'));

			$result->appendChild($entry);


			return $result;
		}
	}

