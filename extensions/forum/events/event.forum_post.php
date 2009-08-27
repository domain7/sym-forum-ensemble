<?php

	if(!defined('__IN_SYMPHONY__')) die('<h2>Error</h2><p>You cannot directly access this file</p>');

	Class eventForum_Post extends Event{

		public static function about(){
					
			return array(
						 'name' => 'Forum: Discussions &amp; Comments',
						 'author' => array('name' => 'Alistair Kearney',
										   'website' => 'http://www.pointybeard.com',
										   'email' => 'alistair@pointybeard.com'),
						 'version' => '1.0',
						 'release-date' => '2008-04-12',						 
					);						 
		}
				
		public function load(){
			return (isset($_POST['fields']) ? $this->__trigger() : NULL);
		}

		public static function documentation(){
			return new XMLElement('p', 'adding/editing of comments and discussions');
		}

		private static function prepareFieldValues($fields, $files){

			## Combine FILES and POST arrays, indexed by their custom field handles
			if(isset($files)){
				$filedata = General::processFilePostData($files);

				foreach($filedata as $handle => $data){
					if(!isset($fields[$handle])) $fields[$handle] = $data;
					elseif(isset($data['error']) && $data['error'] == 4) $fields['handle'] = NULL;
					else{

						foreach($data as $ii => $d){
							if(isset($d['error']) && $d['error'] == 4) $fields[$handle][$ii] = NULL;
							elseif(is_array($d) && !empty($d)){

								foreach($d as $key => $val)
									$fields[$handle][$ii][$key] = $val;
							}						
						}
					}
				}
			}
			
			return $fields;
						
		}
		
		private function __doit($source, $fields, &$result, $entry_id=NULL, $cookie=NULL){
			
			include_once(TOOLKIT . '/class.sectionmanager.php');
			include_once(TOOLKIT . '/class.entrymanager.php');

			$sectionManager = new SectionManager($this->_Parent);

			if(!$section = $sectionManager->fetch($source)){
				$result->setAttribute('result', 'error');			
				$result->appendChild(new XMLElement('message', 'Section is invalid'));
				return false;
			}
			$entryManager = new EntryManager($this->_Parent);

			if(isset($entry_id) && $entry_id != NULL){
				
				$entry =& $entryManager->fetch($entry_id);
				$entry = $entry[0];

				if(!is_object($entry)){
					$result->setAttribute('result', 'error');			
					$result->appendChild(new XMLElement('message', 'Invalid Entry ID specified. Could not create Entry object.'));
					return false;
				}

			}

			else{
				$entry =& $entryManager->create();
				$entry->set('section_id', $source);
			}
			

			if(__ENTRY_FIELD_ERROR__ == $entry->checkPostData($fields, $errors, ($entry->get('id') ? true : false))):
				$result->setAttribute('result', 'error');
				$result->appendChild(new XMLElement('message', 'Entry encountered errors when saving.'));

				foreach($errors as $field_id => $message){
					$field = $entryManager->fieldManager->fetch($field_id);
					$result->appendChild(new XMLElement($field->get('element_name'), NULL, array('type' => ($fields[$field->get('element_name')] == '' ? 'missing' : 'invalid'))));
				}

				if(isset($cookie) && is_object($cookie)) $result->appendChild($cookie);		

				return false;

			elseif(__ENTRY_OK__ != $entry->setDataFromPost($fields, $errors, false, ($entry->get('id') ? true : false))):
				$result->setAttribute('result', 'error');
				$result->appendChild(new XMLElement('message', 'Entry encountered errors when saving.'));

				foreach($errors as $err){
					$field = $entryManager->fieldManager->fetch($err['field_id']);
					$result->appendChild(new XMLElement($field->get('element_name'), NULL, array('type' => 'invalid')));
				}		

				if(isset($cookie) && is_object($cookie)) $result->appendChild($cookie);			

				return false;

			else:

				if(!$entry->commit()){
					$result->setAttribute('result', 'error');
					$result->appendChild(new XMLElement('message', 'Unknown errors where encountered when saving.'));
					if(isset($cookie) && is_object($cookie)) $result->appendChild($cookie);		
					return false;
				}

			endif;
			
			return $entry;
						
		}
		
		protected function __trigger(){

			$result = new XMLElement('forum-post');
			
			$fields = $_POST['fields'];
			$entry_id = NULL;

			if(isset($_POST['id']) && is_numeric($_POST['id'])) $entry_id = $_POST['id'];
			
			$fields = self::prepareFieldValues($_POST['fields'], $_FILES['fields']);		
			
			## Create the post data cookie element
			if(is_array($fields) && !empty($fields)){
				$cookie = new XMLElement('post-values');
				foreach($fields as $element_name => $value){
					if(strlen($value) == 0) continue;
					$cookie->appendChild(new XMLElement($element_name, General::sanitize($value)));
				}
			}
			
			$discussion = $comment = $fields;

			$action = $_POST['action'];
			
			$Forum =& $this->_Parent->ExtensionManager->create('forum');
			$Members =& $this->_Parent->ExtensionManager->create('members');

			$Members->initialiseCookie();
			$isLoggedIn = $Members->isLoggedIn();
		
			$Members->initialiseMemberObject();		
			
			if($isLoggedIn && is_object($Members->Member)){
				$role_data = $Members->Member->getData($Members->roleField());
			}

			$role = $Members->fetchRole(($isLoggedIn ? $role_data['role_id'] : 1), true);
			
/*			if(!$loggedin || !$member = $Members->initialiseMemberObject()){
				$result->setAttribute('result', 'error');
				$result->appendChild(new XMLElement('message', 'Not authorised'));
				return $result;
			}
*/

					
/*
		add_comment
	<action name="edit_comment" />
	<action name="edit_discussion" />
	<action name="edit_own_comment" />
	<action name="edit_own_discussion" />
	<action name="start_discussion" />
	
	
	if($role->canPerformEventAction('forum', $action.'_discussion')){ 
		$Forum->Discussion->$action($discussion_id);
		$success = true;
	}
	
*/
			$success = false;
			$discussion_id = NULL;
			
			$comment_discussion_id_field_handle = Symphony::Database()->fetchVar('element_name', 0, 
				"SELECT `element_name` FROM `tbl_fields` 
				WHERE `id` = ".(int)Symphony::Configuration()->get('comment-discussion-link-field', 'forum')." LIMIT 1"
			);
			
			if(isset($action['forum-new-discussion'])):

				if($role->canPerformEventAction('forum', 'start_discussion')){
				
					if(!$oDiscussion = $this->__doit($Forum->getDiscussionSectionID(), $discussion, $result, NULL, $cookie)) return $result;

					$comment[$comment_discussion_id_field_handle] = $oDiscussion->get('id');
				
					if(!$oComment = $this->__doit($Forum->getCommentSectionID(), $comment, $result, NULL, $cookie)){
	
						$Forum->Discussion->remove($oDiscussion->get('id'));
					
						return $result;
					}

					if($isLoggedIn) $Forum->Discussion->updateRead($Members->Member->get('id'), $oDiscussion->get('id'));
				
					$success = true;
					$discussion_id = $oDiscussion->get('id');
				}
				
				else $result->appendChild(new XMLElement('message', 'Not authorised'));
				
			
			
			elseif(isset($action['forum-edit-discussion'])):
				
				$is_owner = ($isLoggedIn ? $Forum->Discussion->isDiscussionOwner((int)$Members->Member->get('id'), $entry_id) : false);
				
				if($role->canPerformEventAction('forum', 'edit_discussion') || ($is_owner && $role->canPerformEventAction('forum', 'edit_own_discussion'))){
				
					if(!$oDiscussion = $this->__doit($Forum->getDiscussionSectionID(), $discussion, $result, $entry_id, $cookie)) return $result;
					if(!$oComment = $this->__doit($Forum->getCommentSectionID(), $comment, $result, $discussion['comment-id'], $cookie)) return $result;
				
					$success = true;
					$discussion_id = $entry_id;
				}
				
				else $result->appendChild(new XMLElement('message', 'Not authorised'));
						
			
			
			elseif(isset($action['forum-new-comment'])):

				$oDiscussion = new Discussion($this->_Parent, $comment[$comment_discussion_id_field_handle]);

				$isOpen = Symphony::Database()->fetchVar('value', 0, 'SELECT `value` FROM `sym_entries_data_'.$oDiscussion->getLockedField().'` WHERE `entry_id` = '.$oDiscussion->Entry()->get('id').' LIMIT 1');
								
				if($role->canPerformEventAction('forum', 'add_comment') && $isOpen == 'no'){

					//if(!$oDiscussion = $this->__doit($Forum->getDiscussionSectionID(), $discussion, $result, $comment[$comment_discussion_id_field_handle], $cookie)) return $result;
					
					try{
						if(!$oComment = $this->__doit($Forum->getCommentSectionID(), $comment, $result, NULL, $cookie)) return $result;

						if($isLoggedIn){
							$username_and_password = $Members->Member->getData($Members->usernameAndPasswordField());
							
							$oDiscussion->Entry()->setData(Discussion::getLastActiveField(), array(
								'local' => strtotime($oComment->get('creation_date')),
								'gmt' => strtotime($oComment->get('creation_date_gmt')),
								'value' => DateTimeObj::get('c', strtotime($oComment->get('creation_date')))
							));
							
							$oDiscussion->Entry()->setData(Discussion::getLastPostField(), array(
								'member_id' => $Members->Member->get('id'),
								'username' => $username_and_password['username']
							));
							
							$oDiscussion->Entry()->commit();
							
							$Forum->Discussion->updateRead($Members->Member->get('id'), $comment[$comment_discussion_id_field_handle]);
						}
				
						$success = true;
						$discussion_id = $oDiscussion->Entry()->get('id');

					}
					catch(Exception $e){
						$result->appendChild(new XMLElement('error', General::sanitize($e->getMessage())));
						$success = false;
					}
				}
				
				else $result->appendChild(new XMLElement('message', 'Not authorised'));				
			
			
			elseif(isset($action['forum-edit-comment'])):
				
				$is_owner = ($isLoggedIn ? $Forum->Discussion->isCommentOwner((int)$Members->Member->get('id'), $entry_id) : false);
				
				if($role->canPerformEventAction('forum', 'edit_comment') || ($is_owner && $role->canPerformEventAction('forum', 'edit_own_comment'))){

					if(!$oComment = $this->__doit($Forum->getCommentSectionID(), $comment, $result, $entry_id, $cookie)) return $result;
				
					$success = true;
					$discussion_id = $comment[$comment_discussion_id_field_handle];
				}
				
				else $result->appendChild(new XMLElement('message', 'Not authorised'));
				
			endif;

			if($success && isset($_REQUEST['redirect'])){
				redirect(str_replace('{$id}', $discussion_id, $_REQUEST['redirect']));
			}
						
			$result->setAttributeArray(array('result' => ($success ? 'success' : 'failed'), 'type' => (isset($entry_id) ? 'edited' : 'created')));
			
			if($success) $result->appendChild(new XMLElement('message', 'Entry '.(isset($entry_id) ? 'edited' : 'created').' successfully.'));
			
			return $result;
			
		}
	}