<?php

	if(!defined('__IN_SYMPHONY__')) die('<h2>Error</h2><p>You cannot directly access this file</p>');

	Class eventForum_Utilities extends Event{

		public $eParamFILTERS = array(
			'low-priority',
		);
		
		public static function about(){
					
			return array(
						 'name' => 'Forum: Utilities',
						 'author' => array('name' => 'Alistair Kearney',
										   'website' => 'http://www.pointybeard.com',
										   'email' => 'alistair@pointybeard.com'),
						 'version' => '1.0',
						 'release-date' => '2008-04-12',
						 'trigger-condition' => 'existence of a member cookie and discussion id',						 
					);						 
		}
				
		public function load(){			
			return $this->__trigger();
		}

		public static function documentation(){
			return new XMLElement('p', 'This will perform actions like deletion, open/close, pin/unpin and updating read');
		}
		
		protected function __trigger(){

			$success = false;
			$action = $_REQUEST['forum-action'];	
			
			$Forum =& $this->_Parent->ExtensionManager->create('forum');
			$members =& $this->_Parent->ExtensionManager->create('members');
		
			$discussion_id = (int)$this->_env['param']['discussion-id'];
			if($action != 'mark-all-as-read' && $discussion_id < 1) return;
			
			$members->initialiseCookie();
			$isLoggedIn = $members->isLoggedIn();
			
			if($isLoggedIn){
				$members->initialiseMemberObject();	
			}
			
			if(isset($action) 
					&& (
						$action == 'mark-all-as-read' 
						|| (
							isset($this->_env['param']['discussion-id']) 
							|| is_numeric($this->_env['param']['discussion-id'])
						)
					)
				)
			{

				if(isset($action)){
					
					if($isLoggedIn && is_object($members->Member)){
						$role_data = $members->Member->getData($members->roleField());
					}

					$role = $members->fetchRole(($isLoggedIn ? $role_data['role_id'] : 1), true);
					
					$result = new XMLElement('forum-utilities');
					
		            /*<action name="add_comment" />
		            <action name="close_discussion" />
		            <action name="edit_comment" />
		            <action name="edit_discussion" />
		            <action name="pin_discussion" />
		            <action name="remove_comment" />
		            <action name="remove_discussion" />
		
		            <action name="remove_own_comment" />
		            <action name="remove_own_discussion" />
		            <action name="edit_own_comment" />
		            <action name="edit_own_discussion" />
			
		            <action name="start_discussion" />*/
		
					switch($action){
						
						case 'pin':
						case 'unpin':	
						case 'open':
						case 'close':		
							
							$action_resolved = $action;
							
							if($action == 'unpin') $action_resolved = 'pin';
							elseif($action == 'open') $action_resolved = 'close';
							
							if($role->canPerformEventAction('forum', $action_resolved.'_discussion')){ 
								$Forum->Discussion->$action($discussion_id);
								$success = true;
							}

							break;						
					
						case 'remove':
								
								$is_owner = ($isLoggedIn ? $Forum->Discussion->isDiscussionOwner((int)$members->Member->get('id'), $discussion_id) : false);
								
								if($role->canPerformEventAction('forum', $action.'_discussion') || ($is_owner && $role->canPerformEventAction('forum', $action.'_own_discussion'))){
									$Forum->Discussion->remove($discussion_id);
									redirect(URL . '/forum/');
								}
											
							break;
						
						case 'remove-comment':
							
							$comment_id = (int)$_REQUEST['comment-id'];
							
							if($comment_id < 1) break;
							
							$is_owner = ($isLoggedIn ? $Forum->Discussion->isCommentOwner((int)$members->Member->get('id'), $comment_id) : false);
							
							if($role->canPerformEventAction('forum', 'remove_comment') || ($is_owner && $role->canPerformEventAction('forum', 'remove_own_comment'))){
								$Forum->Discussion->removeComment($comment_id, $discussion_id);
								$success = true;								
							}
							
							break;
							
						case 'mark-all-as-read':
							$Forum->Discussion->markAllAsRead($members->Member->get('id'));
							$success = true;
							break;
					}
					
					if($action != 'mark-all-as-read' && $isLoggedIn) $Forum->Discussion->updateRead($members->Member->get('id'), $discussion_id);
					
					if($success) redirect(preg_replace('/\?.*$/i', NULL, $_SERVER['REQUEST_URI']));
					else{
						$result->setAttributeArray(array('result' => 'fail', 'type' => $action));
						$result->appendChild(new XMLElement('message', 'not authorised'));
						return $result;
					}
				
				}	

				
			}

			if(is_object($members->Member)){
				try{
					$Forum->Discussion->updateRead($members->Member->get('id'), $discussion_id);
				}
				catch(Exception $e){
					//Do nothing
				}
			}
			
			return NULL;
			
		}
	}

