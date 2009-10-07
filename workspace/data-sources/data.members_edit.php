<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcemembers_edit extends Datasource{
		
		public $dsParamROOTELEMENT = 'members-edit';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '1';
		public $dsParamREDIRECTONEMPTY = 'yes';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		
		public $dsParamFILTERS = array(
				'id' => NULL,
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'username-and-password',
				'email-address',
				'role',
				'location',
				'email-opt-in',
				'city',
				'website',
				'timezone-offset'
		);

		public function about(){
			return array(
					 'name' => 'Members: Edit',
					 'author' => array(
							'name' => 'Allen Chang',
							'website' => 'http://symphony.local:8888',
							'email' => 'allen@symphony21.com'),
					 'version' => '1.0',
					 'release-date' => '2009-05-01T17:40:29+00:00');	
		}
		
		public function getSource(){
			return '1';
		}

		public function grab(&$param_pool){
			
			$Members = Frontend::instance()->ExtensionManager->create('members');
			$Members->initialiseCookie();

			if($Members->isLoggedIn() !== true){
				$this->__redirectToErrorPage();	
			}
			
			$this->dsParamFILTERS['id'] = (int)$Members->Member->get('id');

			$result = new XMLElement($this->dsParamROOTELEMENT);
				
			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}	

			if($this->_force_empty_result) $result = $this->emptyXMLSet();
			return $result;
		}
	}

