<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourceforum_read_discussions extends Datasource{
		
		var $dsParamROOTELEMENT = 'forum-read-discussions';
		
		var $dsParamFILTERS = array(
				'id' => '{$ds-forum-discussions}',
		);
		
		function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-forum-discussions');
		}
		
		function about(){
			return array(
					 'name' => 'Forum: Read Discussions List',
					 'author' => array(
							'name' => 'Symphony Team',
							'website' => 'http://symphony21.com',
							'email' => 'team@symphony21.com'),
					 'version' => '1.0',
					 'release-date' => '2008-04-12');	
		}

		
		function grab(&$param_pool){
			$result = NULL;
		
			$Forum = $this->_Parent->ExtensionManager->create('forum');
			$members = $this->_Parent->ExtensionManager->create('members');
			
			$members->initialiseCookie();

			if(!$members->isLoggedIn() || !isset($param_pool['ds-forum-discussions']) || empty($param_pool['ds-forum-discussions'])) 
				$result = $this->emptyXMLSet();
			
			else{
				
				if(!$members->Member) $members->initialiseMemberObject();
				$member_id = $members->Member->get('id');
				
				
				$member_read_cutoff_date = Symphony::Database()->fetchVar('local', 0, 
					sprintf("SELECT `local` FROM `tbl_entries_data_%d` WHERE `entry_id` = %d LIMIT 1", Discussion::getUnreadCutoffField(), $member_id)
				);
				
				if(is_null($member_read_cutoff_date)){
					$member_read_cutoff_date = strtotime(Symphony::Database()->fetchVar('creation_date', 0, 
						"SELECT `creation_date` FROM `tbl_entries` WHERE `id` = {$member_id} LIMIT 1"
					));
				}
				
				
				$pre_dated_discussions = Symphony::Database()->fetchCol('entry_id', 
					sprintf(
						"SELECT `entry_id` 
						FROM `tbl_entries_data_%d` 
						WHERE `entry_id` IN (".@implode(',', $param_pool['ds-forum-discussions']).") 
						AND `local` <= '%s'",
						119, 
						$member_read_cutoff_date
					)
				);
				
				$read = $this->_Parent->Database->fetch(
					sprintf(
						"SELECT * FROM `tbl_forum_read_discussions` 
						WHERE `member_id` = $member_id 
						AND `discussion_id` IN (%s)",
						
						@implode(',', array_diff($param_pool['ds-forum-discussions'], $pre_dated_discussions))
					)
				);
				
				if(empty($read) && empty($pre_dated_discussions)) $result = $this->emptyXMLSet();
				else{
					$result = new XMLElement($this->dsParamROOTELEMENT);
					
					foreach($read as $r){
						$result->appendChild(new XMLElement('discussion', NULL, array('id' => $r['discussion_id'], 'comments' => $r['comments'], 'last-viewed' => DateTimeObj::get('c', $r['last_viewed']))));
						if(isset($pre_dated_discussions[$r['discussion_id']])) unset($pre_dated_discussions[$r['discussion_id']]);
					}
					
					foreach($pre_dated_discussions as $id){
						$result->appendChild(new XMLElement('discussion', NULL, array('id' => $id, 'comments' => '100000', 'last-viewed' => DateTimeObj::get('c', strtotime($member_registration_date)))));	
					}
				}
						
			}
			
			return $result;
		}
	}

