<?php

	if(!defined('__IN_SYMPHONY__')) die('<h2>Error</h2><p>You cannot directly access this file</p>');
	
	require_once(DOCROOT . '/extensions/asdc/lib/class.asdc.php');
	
	Class eventForum_Resend_Activation_Email extends Event{
		
		private static $_fields;
		private static $_sections;
		
		
		public static function about(){
					
			return array(
						 'name' => 'Forum: Resend Activation Email',
						 'author' => array('name' => 'Alistair Kearney',
										   'website' => 'http://www.pointybeard.com',
										   'email' => 'alistair@pointybeard.com'),
						 'version' => '1.0',
						 'release-date' => '2009-05-03',
						 'trigger-condition' => 'Inactive member logged in + fields[resend-activation-email]',						 
					);						 
		}
				
		public function load(){			
			if(isset($_POST['action']['resend-activation-email'])) return $this->__trigger();
		}

		public static function documentation(){
			return new XMLElement('p', 'resend activation email of an inactive member.');
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
			
			redirect(URL . '/members/activate/sent/');
			
		}
	}

