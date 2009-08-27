<?php

	require_once(TOOLKIT . '/class.datasource.php');
	require_once(DOCROOT . '/extensions/asdc/lib/class.asdc.php');
		
	Class datasourceforum_discussions_filtered extends Datasource{
		
		private static $_fields;
		private static $_sections;
				
		public $dsParamROOTELEMENT = 'forum-discussions';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '{$dpage:1}';
		
		public $dsParamFILTERS = array(
				'id' => '{$discussion-id}',
		);

		public function about(){
			return array(
					 'name' => 'Forum: Discussions (Filtered)',
					 'author' => array(
							'name' => 'Alistair Kearney',
							'website' => 'http://overture.projects.local:8888',
							'email' => 'alistair@pointybeard.com'),
					 'version' => '1.0',
					 'release-date' => '2009-05-02');	
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

			$Members = Frontend::instance()->ExtensionManager->create('members');
			$Members->initialiseCookie();

			if($Members->isLoggedIn() !== true){
				// Oi! you can't be here
				redirect(URL . '/forbidden/');
				exit();
			}

			$result = new XMLElement($this->dsParamROOTELEMENT);
		
			self::__init();
	
			$db = ASDCLoader::instance();
		
			$sql = 'SELECT SQL_CALC_FOUND_ROWS 
						pinned.entry_id AS `id`, 
						pinned.value AS `pinned`, 
						closed.value AS `closed`, 
						creation_date.local AS `creation-date`,
						last_active.local AS `last-active`,							
						created_by.member_id AS `created-by-member-id`,
						created_by.username AS `created-by-username`,
						last_post.member_id AS `last-post-member-id`,
						last_post.username AS `last-post-username`,							
						topic.value AS `topic`
					
					FROM `tbl_entries_data_%d` AS `pinned`
					LEFT JOIN `tbl_entries_data_%d` AS `closed` ON pinned.entry_id = closed.entry_id
					LEFT JOIN `tbl_entries_data_%d` AS `creation_date` ON pinned.entry_id = creation_date.entry_id	
					LEFT JOIN `tbl_entries_data_%d` AS `last_active` ON pinned.entry_id = last_active.entry_id					
					LEFT JOIN `tbl_entries_data_%d` AS `created_by` ON pinned.entry_id = created_by.entry_id	
					LEFT JOIN `tbl_entries_data_%d` AS `last_post` ON pinned.entry_id = last_post.entry_id	
					LEFT JOIN `tbl_entries_data_%d` AS `topic` ON pinned.entry_id = topic.entry_id
					LEFT JOIN `tbl_entries_data_%d` AS `comments` ON pinned.entry_id = comments.relation_id
					LEFT JOIN `tbl_entries_data_%d` AS `discussion_comments_member` ON comments.entry_id = discussion_comments_member.entry_id	
					WHERE 1 %s
					AND (created_by.member_id = %11$d || discussion_comments_member.member_id = %11$d)
					GROUP BY pinned.entry_id
					ORDER BY pinned.value ASC, last_active.local DESC
					LIMIT %12$d, %13$d';
				
			try{
				$rows = $db->query(
					sprintf(
						$sql,
						self::findFieldID('pinned', 'discussions'),
						self::findFieldID('closed', 'discussions'),
						self::findFieldID('creation-date', 'discussions'),
						self::findFieldID('last-active', 'discussions'),
						self::findFieldID('created-by', 'discussions'),
						self::findFieldID('last-post', 'discussions'),
						self::findFieldID('topic', 'discussions'),
						self::findFieldID('parent-id', 'comments'),	
						self::findFieldID('created-by', 'comments'),
						(isset($this->dsParamFILTERS['id']) && (int)$this->dsParamFILTERS['id'] > 0 ? " AND pinned.entry_id  = ".(int)$this->dsParamFILTERS['id'] : NULL),		
						(int)$Members->Member->get('id'),			
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
				return $this->emptyXMLSet();
			}
		
			$total = $db->query('SELECT FOUND_ROWS() AS `total`;')->current()->total;

			$result->prependChild(
				General::buildPaginationElement($total, ceil($total * (1/$this->dsParamLIMIT)), $this->dsParamLIMIT, $this->dsParamSTARTPAGE)
			);

			
			/*
				stdClass Object
				(
				    [id] => 666
				    [pinned] => yes
				    [closed] => no
				    [creation-date] => 1233599808
				    [last-active] => 1237161637
				    [created-by-member-id] => 2126
				    [created-by-username] => Lewis
				    [last-post-member-id] => 2126
				    [last-post-username] => Lewis
				    [topic] => Symphony 2 Documentation
				    [comments] => 18
				)
			
			   <entry id="595" comments="7">
		            <created-by id="2150">newnomad</created-by>
		            <closed>No</closed>
		            <last-active time="18:30" weekday="1">2009-02-09</last-active>
		            <last-post id="2150">newnomad</last-post>
		            <pinned>No</pinned>
		            <topic handle="viewing-feeds">viewing feeds</topic>
		            <creation-date time="19:31" weekday="3">2009-01-07</creation-date>
			    </entry>
			*/
		
			$param_pool['ds-' . $this->dsParamROOTELEMENT] = DatabaseUtilities::resultColumn($rows, 'id');
		
			foreach($rows as $r){
				
				// Need to do a seperate query to find the comment counts.
				try{
					$comments = $db->query(
						sprintf(
							"SELECT COUNT(*) AS `count` FROM `tbl_entries_data_%d` WHERE `relation_id` = %d ",
							self::findFieldID('parent-id', 'comments'),	
							$r->id
						)
					)->current()->count;
				}
				catch(Exception $e){
					$result->appendChild(new XMLElement('error', General::sanitize(vsprintf('%d: %s on query %s', $db->lastError()))));
					return $result;
				}				
				
				$entry = new XMLElement('entry', NULL, array('id' => $r->id, 'comments' => $comments));
				
				$entry->appendChild(
					new XMLElement('created-by', General::sanitize($r->{'created-by-username'}), array('id' => $r->{'created-by-member-id'}))
				);
				
				$entry->appendChild(
					new XMLElement('last-post', General::sanitize($r->{'last-post-username'}), array('id' => $r->{'last-post-member-id'}))
				);
				
				$entry->appendChild(new XMLElement('closed', ucfirst($r->closed)));
				$entry->appendChild(new XMLElement('pinned', ucfirst($r->pinned)));
				
				$entry->appendChild(new XMLElement('topic', General::sanitize($r->topic)));
				
				$entry->appendChild(General::createXMLDateObject($r->{'creation-date'}, 'creation-date'));
				$entry->appendChild(General::createXMLDateObject($r->{'last-active'}, 'last-active'));
				
				$result->appendChild($entry);
			}
		
			return $result;
		}
	}

