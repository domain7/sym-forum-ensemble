<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcemember_email extends Datasource{

		public $dsParamROOTELEMENT = 'member-email';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$email';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'149' => '{$email}',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'username',
				'password',
				'email-address',
				'role',
				'role: permissions',
				'activation',
				'website',
				'location',
				'city',
				'timezone',
				'email-opt-in'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Member: Email',
				'author' => array(
					'name' => 'Stephen Bau',
					'website' => 'http://home/domain7/team-members',
					'email' => 'stephen@domain7.com'),
				'version' => '1.0',
				'release-date' => '2011-04-19T23:35:30+00:00'
			);
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
