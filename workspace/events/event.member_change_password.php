<?php

	require_once(TOOLKIT . '/class.event.php');
	
	require_once(DOCROOT . '/extensions/asdc/lib/class.asdc.php');
		
	Class eventMember_Change_Password extends Event{
		
		private static $_fields;
		private static $_sections;
				
		const ROOTELEMENT = 'member-change-password';

		public static function about(){
			return array(
					 'name' => 'Member: Change Password',
					 'author' => array(
							'name' => 'Allen Chang',
							'website' => 'http://symphony.local:8888',
							'email' => 'allen@symphony21.com'),
					 'version' => '1.0',
					 'release-date' => '2009-04-30T18:28:05+00:00',
					 'trigger-condition' => 'action[member-change-password]');	
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


		public static function documentation(){
			return '';
		}
		
		public static function showInRolePermissions(){
			return true;
		}
		
		public function load(){			
			if(isset($_POST['action']['member-change-password']) && isset($_POST['fields'])){
				return $this->__trigger();
			}
		}
		
		protected function __trigger(){

			
			$success = true;

			$Members = $this->_Parent->ExtensionManager->create('members');
			$Members->initialiseCookie();
			
			// Make sure the user is logged in
			if($Members->isLoggedIn() !== true){
				redirect(URL . '/forbidden/');
			}
		
			$Members->initialiseMemberObject();
			
			
			$result = new XMLElement(self::ROOTELEMENT);
			
			// This event will listen for either a New Password + Old Password 
			// or New Password + Valid Code. Codes are issued via the Forgot Password feature
			
			$fields = $_POST['fields'];
			
			$old_password = $new_password = $code = NULL;
			if(!isset($fields['new-password']) || strlen(trim($fields['new-password'])) == 0){
				$success = false;
				$result->appendChild(new XMLElement('new-password', NULL, array('type' => 'missing')));
			}
			else{
				$new_password = trim($fields['new-password']);
			}
			
			if(!isset($fields['old-password']) || strlen(trim($fields['old-password'])) == 0){
				$success = false;
				$result->appendChild(new XMLElement('old-password', NULL, array('type' => 'missing')));
				$result->appendChild(new XMLElement('code', NULL, array('type' => 'missing')));								
			}
			else{
				$old_password = trim($fields['old-password']);
			}
			

			if($success === true){
				
				self::__init();
				$db = ASDCLoader::instance();
				
				$current_credentials = $Members->Member->getData($Members->usernameAndPasswordField());
				
				## Check the old password
				if(md5($old_password) != $current_credentials['password']){
					// Redirect to the failed page
					redirect(URL . '/members/change-pass/failed/');
				}
				
				// Attempt to update the password
				$db->query(sprintf(
					"UPDATE `tbl_entries_data_%d` SET `password` = '%s' WHERE `entry_id` = %d LIMIT 1",
					$Members->usernameAndPasswordField(),
					md5($new_password),
					(int)$Members->Member->get('id')
				));
				
				// Update the cookie by simulating login
				if($Members->login($current_credentials['username'], $new_password) === true){
					redirect(URL . '/members/change-pass/success/');
				}
				
				redirect(URL . '/members/change-pass/failed/');			
			}
			
			$result->setAttribute('status', ($success === true ? 'success' : 'error'));

			return $result;
		}		

	}

