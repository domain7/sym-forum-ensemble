<?php

	require_once(TOOLKIT . '/class.datasource.php');
	require_once(DOCROOT . '/extensions/asdc/lib/class.asdc.php');
	
	Class datasourceforum_comments extends Datasource{
		
		var $dsParamROOTELEMENT = 'forum-comments';

		var $dsParamSTARTPAGE = '{$cpage:1}';
		var $dsParamLIMIT = '20';
		
		var $dsParamFILTERS = array(
				'discussion_id' => '{$discussion-id}',
		);
		
		private static $_fields;	
		private static $_sections;

		function about(){
			return array(
					 'name' => 'Forum: Comments',
					 'author' => array(
							'name' => 'Symphony Team',
							'website' => 'http://randomhouse.local:8888',
							'email' => 'team@symphony21.com'),
					 'version' => '1.0',
					 'release-date' => '2008-04-16T12:22:36+00:00');	
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

			/*
		
		var $dsParamINCLUDEDELEMENTS = array(
				'system:pagination',
				'comment',
				'date',
				'created-by'
		);
		
    <pagination total-entries="28" total-pages="2" entries-per-page="20" current-page="2" />
    <section id="39" handle="comments">Comments</section>

		
		
			*/

			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				$comments = ASDCLoader::instance()->query(
					sprintf(
						"SELECT SQL_CALC_FOUND_ROWS
							comment.entry_id AS `id`,
							comment.value_formatted AS `comment`, 
							created_by.member_id, 
							created_by.username, 
							date.local AS `date`,
							email.value AS `email`

						FROM `tbl_entries_data_%d` AS `comment`
						LEFT JOIN `tbl_entries_data_%d` AS `created_by` ON comment.entry_id = created_by.entry_id
						LEFT JOIN `tbl_entries_data_%d` AS `date` ON comment.entry_id = date.entry_id
						LEFT JOIN `tbl_entries_data_%d` AS `email` ON created_by.member_id = email.entry_id
						LEFT JOIN `tbl_entries_data_%d` AS `discussion` ON comment.entry_id = discussion.entry_id
						WHERE discussion.relation_id = %d
						ORDER BY date.local ASC
						LIMIT %d, %d",

						self::findFieldID('comment', 'comments'),
						self::findFieldID('created-by', 'comments'),
						self::findFieldID('date', 'comments'),
						self::findFieldID('email-address', 'members'),
						self::findFieldID('parent-id', 'comments'),
						(int)$this->dsParamFILTERS['discussion_id'],
						max(0, ($this->dsParamSTARTPAGE - 1) * $this->dsParamLIMIT),
						(int)$this->dsParamLIMIT
					)	
				);	
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', General::sanitize(vsprintf('%d: %s on query %s', ASDCLoader::instance()->lastError()))));
				return $result;
			}

			
			if($comments->length() == 0){
				$this->__redirectToErrorPage();
			}	
					
			$total = ASDCLoader::instance()->query('SELECT FOUND_ROWS() AS `total`;')->current()->total;
			
			$result->prependChild(
				General::buildPaginationElement($total, ceil($total * (1/$this->dsParamLIMIT)), $this->dsParamLIMIT, $this->dsParamSTARTPAGE)
			);

			foreach($comments as $c){
				

				/*
					stdClass Object
					(
					    [id] => 20589
					    [comment] => <p>blah blah</p>

					    [member_id] => 2103
					    [username] => Alistair
					    [date] => 1241576727
					    [email] => alistair@21degrees.com.au
					)
					
					<entry id="20515">
				        <date time="01:32" weekday="3">2009-05-06</date>
				        <comment word-count="6"><p>This site looks awesome guys! Congrats!</p></comment>
				        <created-by id="2694">davethegr8</created-by>
				    </entry>
				*/


				$entry = new XMLElement('entry', NULL, array('id' => $c->id));

				$entry->appendChild(new XMLElement('created-by', General::sanitize($c->username), 
					array('email-address-hash' => md5($c->email), 
					'email-address' => General::sanitize($c->email), 
					'id' => $c->member_id))
				);

				$entry->appendChild(General::createXMLDateObject($c->date, 'date'));
				

				$c->comment = str_replace(array('<script', '</script'), array('&lt;script', '&lt;/script'), $c->comment);
				
				$entry->appendChild(new XMLElement('comment', trim($c->comment)));
				$result->appendChild($entry);

			}


			return $result;
		}
	}
