<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcemember_username extends Datasource{

		public $dsParamROOTELEMENT = 'member-username';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamREQUIREDPARAM = '$member';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';

		public $dsParamFILTERS = array(
				'148' => '{$member}',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'username',
				'password',
				'email-address',
				'role',
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
				'name' => 'Member: Username',
				'author' => array(
					'name' => 'Stephen Bau',
					'website' => 'http://chnl7.com',
					'email' => 'stephen@domain7.com'),
				'version' => '1.0',
				'release-date' => '2011-05-04T18:28:12+00:00'
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
