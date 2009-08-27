<?php

	require_once(TOOLKIT . '/class.datasource.php');
	require_once(DOCROOT . '/extensions/asdc/lib/class.asdc.php');
		
	Class datasourceSearch_Comments extends Datasource{
		
		public $dsParamROOTELEMENT = 'search-comments';
		
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '{$url-pg:1}';
		
		public $dsParamFILTERS = array(
				'query' => '{$query:$url-query}'
		);
		
		private static $_fields;
		private static $_sections;
			
		public function about(){
			return array(
					 'name' => 'Search: Forum Comments',
					 'author' => array(
							'name' => 'Alistair Kearney',
							'website' => 'http://overture.projects.local:8888',
							'email' => 'alistair@pointybeard.com'),
					 'version' => '1.0',
					 'release-date' => '2009-05-01');	
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

		private function __search($query){

			$result = new XMLElement($this->dsParamROOTELEMENT);

			if(strlen(trim($query)) == 0){
				return $this->emptyXMLSet($result);
			}
			
			$db = ASDCLoader::instance();

			$result->appendChild(new XMLElement('query-string', General::sanitize($query), array('encoded' => urlencode($query))));

			$sql = "SELECT SQL_CALC_FOUND_ROWS 
						MATCH(comment.value) AGAINST ('%6\$s') AS `score`,
						comment.entry_id AS `id`,
						date.local AS `date`,
						comment.value_formatted AS `description`,
						member.member_id AS `member-id`, 
						member.username AS `username`,
						topic.value AS `topic`,
						parent.relation_id AS `discussion-id`
						
					FROM `tbl_entries_data_%1\$d` AS `date`
					LEFT JOIN `tbl_entries_data_%2\$d` AS `comment` ON date.entry_id = comment.entry_id
					LEFT JOIN `tbl_entries_data_%3\$d` AS `member` ON date.entry_id = member.entry_id
					LEFT JOIN `tbl_entries_data_%4\$d` AS `parent` ON date.entry_id = parent.entry_id
					LEFT JOIN `tbl_entries_data_%5\$d` AS `topic` ON parent.relation_id = topic.entry_id

					WHERE MATCH(comment.value) AGAINST ('%6\$s')
					ORDER BY `score` DESC
					LIMIT %7\$d, %8\$d";
					
				//MATCH(comment.value) AGAINST ('%s') AS `score`,
				//OR MATCH(comment.value) AGAINST ('%1\$s') 
				//WITH QUERY EXPANSION	
				//member.username = '%6\$s' OR comment.value LIKE '%%%6\$s%%' OR topic.value LIKE '%%%6\$s%%'
			try{
				$rows = $db->query(
					sprintf(
						$sql,
						self::findFieldID('date', 'comments'),
						self::findFieldID('comment', 'comments'),
						self::findFieldID('created-by', 'comments'),						
						self::findFieldID('parent-id', 'comments'),
						self::findFieldID('topic', 'discussions'),						
						$db->escape($query),
						max(0, ($this->dsParamSTARTPAGE - 1) * $this->dsParamLIMIT),
						$this->dsParamLIMIT
					)
				);	
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', General::sanitize(vsprintf('%d: %s on query %s', $db->lastError()))));
				return $result;
			}
				
			if($rows->length() == 0){
				return $this->emptyXMLSet($result);
			}	
					
			$total = $db->query('SELECT FOUND_ROWS() AS `total`;')->current()->total;

			$result->prependChild(
				General::buildPaginationElement($total, ceil($total * (1/$this->dsParamLIMIT)), $this->dsParamLIMIT, $this->dsParamSTARTPAGE)
			);
			
			
			/*

		        <entry id="19753">
		            <name>Section Schema</name>
		            <member id="2101">Allen</member>
		            <description><p>Sect ... ollow).</p></description>
		        </entry>

			*/
			
			foreach($rows as $r){

				$entry = new XMLElement('entry', NULL, array('discussion-id' => $r->{'discussion-id'}, 'id' => $r->id, 'score' => number_format($r->score, 3)));
				
				// Topic
				$entry->appendChild(new XMLElement('topic', General::sanitize($r->topic)));
								
				// Date
				$entry->appendChild(General::createXMLDateObject($r->date, 'date'));
				
				// Member
				$entry->appendChild(
					new XMLElement('member', General::sanitize($r->{'username'}), array('id' => $r->{'member-id'}))
				);
								
				// Comment
				$entry->appendChild(new XMLElement('comment', trim($r->description)));
				
				$result->appendChild($entry);
			}
			
			return $result;
		}
		
		public function grab(&$param_pool){
			
			self::__init();

			$query = urldecode($this->dsParamFILTERS['query']);
					
			return $this->__search($query);
		
		}		

	}

