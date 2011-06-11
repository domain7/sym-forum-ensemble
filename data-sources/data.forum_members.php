<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourceforum_members extends Datasource{

		public $dsParamROOTELEMENT = 'forum-members';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		public $dsParamFILTERS = array(
				'id' => '{$ds-forum-comments}',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'email-address'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-forum-comments');
		}

		public function about(){
			return array(
				'name' => 'Forum: Members',
				'author' => array(
					'name' => 'Stephen Bau',
					'website' => 'http://home/domain7/team-members',
					'email' => 'stephen@domain7.com'),
				'version' => '1.0',
				'release-date' => '2011-05-04T16:37:42+00:00'
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
