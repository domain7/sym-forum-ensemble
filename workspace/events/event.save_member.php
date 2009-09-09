<?php

	require_once(TOOLKIT . '/class.event.php');
	
	Class eventsave_member extends Event{
		
		const ROOTELEMENT = 'save-member';
		
		public $eParamFILTERS = array(
			
		);
			
		public static function about(){
			return array(
					 'name' => 'Save Member',
					 'author' => array(
							'name' => 'Allen Chang',
							'website' => 'http://symphony.local:8888',
							'email' => 'allen@symphony21.com'),
					 'version' => '1.0',
					 'release-date' => '2009-04-30T18:28:05+00:00',
					 'trigger-condition' => 'action[save-member]');	
		}

		public static function getSource(){
			return '1';
		}

		public static function documentation(){
			return '';
		}
		
		public function load(){			
			if(isset($_POST['action']['save-member'])) return $this->__trigger();
		}
		
		protected function __trigger(){
			$_POST['fields']['role'] = 4;

			include(TOOLKIT . '/events/event.section.php');
			
			$xml = new SimpleXMLElement($result->generate());
			
			if((string)$xml->attributes()->result == 'success'){
				$Members = $this->_Parent->ExtensionManager->create('members');
				
				if($Members->login($_POST['fields']['username-and-password']['username'], $_POST['fields']['username-and-password']['password']) === true){
					redirect(URL . '/members/activate/');
				}
				
			}
			
			return $result;
		}		

	}

