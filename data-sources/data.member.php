<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourcemember extends Datasource{
		
		public $dsParamROOTELEMENT = 'member';
		public $dsParamORDER = 'desc';
		public $dsParamLIMIT = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamSTARTPAGE = '1';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		
		public $dsParamFILTERS = array(
				'1' => '{$team-member}',
		);
		
		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'username-and-password',
				'website',
				'email-address',
				'role',
				'location',
				'city',
				'timezone-offset',
				'email-opt-in'
		);

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		public function about(){
			return array(
					 'name' => 'Member',
					 'author' => array(
							'name' => 'Stephen Bau',
							'website' => 'http://home/domain7/site',
							'email' => 'stephen@domain7.com'),
					 'version' => '1.0',
					 'release-date' => '2010-05-04T15:34:44+00:00');	
		}
		
		public function getSource(){
			return '1';
		}
		
		public function allowEditorToParse(){
			return true;
		}
		
		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);
				
			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}			
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}	

			if($this->_force_empty_result) $result = $this->emptyXMLSet();
			return $result;
		}
	}

