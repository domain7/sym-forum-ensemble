<?php

	require_once(TOOLKIT . '/class.datasource.php');
	
	Class datasourceforum_edit_comment extends Datasource{
		
		var $dsParamROOTELEMENT = 'forum-edit-comment';
		var $dsParamREDIRECTONEMPTY = 'yes';
		var $dsParamSTARTPAGE = '1';
		var $dsParamHTMLENCODE = 'yes';
		var $dsParamLIMIT = '1';
		var $dsParamSORT = 'system:id';
		var $dsParamORDER = 'asc';
		
		var $dsParamFILTERS = array(
				'id' => '{$comment-id}'
		);
		
		var $dsParamINCLUDEDELEMENTS = array(
				'comment',
				'discussion-id'
		);

		
		function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}
		
		function about(){
			return array(
					 'name' => 'Forum: Edit Comment',
					 'author' => array(
							'name' => 'Symphony Team',
							'website' => 'http://randomhouse.local:8888',
							'email' => 'team@symphony21.com'),
					 'version' => '1.0',
					 'release-date' => '2008-04-13T14:13:47+00:00');	
		}
		
		function getSource(){
			return '3';
		}
		
		function allowEditorToParse(){
			return true;
		}
		
		function grab(&$param_pool){
			$discussionID = (int)$this->_Parent->Database->fetchVar('relation_id', 0, "SELECT `relation_id` FROM `tbl_entries_data_18` WHERE `entry_id` = ".(int)$this->dsParamFILTERS['id']." LIMIT 1");

			$xml = new XMLElement($this->dsParamROOTELEMENT);

			$xml->setAttribute('id', (int)$this->dsParamFILTERS['id']);
			$xml->setAttribute('discussion-id', $discussionID);
			
			$body = $this->_Parent->Database->fetchVar('value', 0, "SELECT `value` FROM `tbl_entries_data_17` WHERE `entry_id` = ".(int)$this->dsParamFILTERS['id']." LIMIT 1");
		
			if(is_null($body) || strlen(trim($body)) == 0){
				return $this->emptyXMLSet();
			}
			
			$xml->setValue(General::sanitize($body));
			return $xml;
			
			//$result = NULL;
				
			//include(TOOLKIT . '/data-sources/datasource.section.php');
			
			//if($this->_force_empty_result) $result = $this->emptyXMLSet();
			//return $result;
		}
	}

?>