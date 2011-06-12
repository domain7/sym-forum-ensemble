<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcemembers_forum_discussion_count extends Datasource{

		public $dsParamROOTELEMENT = 'members-forum-discussion-count';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'yes';

		public $dsParamFILTERS = array(
				'13' => '{$member}',
		);

		public $dsParamINCLUDEDELEMENTS = array(
				'system:pagination'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'Members: Forum Discussion Count',
				'author' => array(
					'name' => 'Stephen Bau',
					'website' => 'http://home/sym/forum-update',
					'email' => 'bauhouse@gmail.com'),
				'version' => '1.0',
				'release-date' => '2011-06-12T00:12:58+00:00'
			);
		}

		public function getSource(){
			return '2';
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
