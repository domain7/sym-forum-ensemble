<?php

	if(!defined('__IN_SYMPHONY__')) die('<h2>Error</h2><p>You cannot directly access this file</p>');
	
	require_once(DOCROOT . '/extensions/asdc/lib/class.asdc.php');
	
	Class eventForum_Activate_Member extends Event{
		
		private static $_fields;
		private static $_sections;
		
		const ROOTELEMENT = 'activate-member';
		
		public static function about(){
					
			return array(
						 'name' => 'Forum: Activate Member',
						 'author' => array('name' => 'Alistair Kearney',
										   'website' => 'http://www.pointybeard.com',
										   'email' => 'alistair@pointybeard.com'),
						 'version' => '1.0',
						 'release-date' => '2009-05-03',
						 'trigger-condition' => 'Inactive member logged in + fields[activation-code]',						 
					);						 
		}
				
		public function load(){			
			if(isset($_POST['action']['activate-account']) && isset($_POST['fields']['code'])) return $this->__trigger();
		}

		public static function documentation(){
			return new XMLElement('p', 'Activates an inactive member.');
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

		
		protected function __trigger(){
			
			self::__init();
			$db = ASDCLoader::instance();
			
			$success = false;

			$Members = $this->_Parent->ExtensionManager->create('members');
			$Members->initialiseCookie();
			
			if($Members->isLoggedIn() !== true){
				redirect(URL . '/forbidden/');
			}
		
			$Members->initialiseMemberObject();
			
			// Make sure we dont accidently use an expired token
			extension_Members::purgeTokens();

			$activation_row = $db->query(
				sprintf(
					"SELECT * FROM `tbl_members_login_tokens` WHERE `token` = '%s' AND `member_id` = %d LIMIT 1", 
					$db->escape($_POST['fields']['code']), 
					(int)$Members->Member->get('id')
				)
			)->current();

			// No code, you are a spy!
			if($activation_row === false){
				redirect(URL . '/members/activate/failed/');
			}
			
			// Got this far, all is well.
			$db->query(sprintf(
				"UPDATE `tbl_entries_data_%d` SET `role_id` = %d WHERE `entry_id` = %d LIMIT 1",
				$Members->roleField(),
				3,
				(int)$Members->Member->get('id')
			));
			
			extension_Members::purgeTokens((int)$Members->Member->get('id'));
			
			$em = new EntryManager($this->_Parent);
			$entry = end($em->fetch((int)$Members->Member->get('id')));
		
			$email = $entry->getData(self::findFieldID('email-address', 'members'));
			$name = $entry->getData(self::findFieldID('name', 'members'));
		
			$Members->emailNewMember(
				array(
					'section' => $Members->memberSectionHandle(),
					'entry' => $entry,
					'fields' => array(
						'username-and-password' => $entry->getData(self::findFieldID('username-and-password', 'members')),
						'name' => $name['value'],
						'email-address' => $email['value']
					)
				)
			);
			
			redirect(URL . '/members/activate/success/');
			
		}
	}

