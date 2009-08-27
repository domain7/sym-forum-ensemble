<?php

	include_once(TOOLKIT . '/class.entrymanager.php');
	include_once(DOCROOT . '/extensions/library/lib/class.configurationaccessor.php');
	include_once('lib/class.discussion.php');
	
	Class extension_forum extends Extension{

		public $Discussion;

		public function about(){
			return array('name' => 'Forum',
						 'version' => '1.0',
						 'release-date' => '2008-04-12',
						 'author' => array('name' => 'Symphony Team',
										   'website' => 'http://www.symphony21.com',
										   'email' => 'team@symphony21.com')
				 		);
		}

		function __construct($args){
			parent::__construct($args);

			$this->Discussion = new Discussion($this->_Parent);

		}

		public function uninstall(){
			Symphony::Configuration()->remove('forum');			
			$this->_Parent->saveConfig();
			Symphony::Database()->query("DROP TABLE `tbl_forum_read_discussions`");
		}

		public function install(){

			return Symphony::Database()->query("CREATE TABLE `tbl_forum_read_discussions` (
		 			 `id` int(11) unsigned NOT NULL auto_increment,
		 			 `member_id` int(11) unsigned NOT NULL,
					  `discussion_id` int(11) unsigned NOT NULL,
					  `last_viewed` int(11) unsigned NOT NULL,
					  `comments` int(11) unsigned NOT NULL,
				  PRIMARY KEY  (`id`),
		  		  KEY `member_id` (`member_id`,`discussion_id`)
				 )");

		}

		public function getSubscribedDelegates(){
			return array(

						//array(
						//	'page' => '/blueprints/events/new/',
						//	'delegate' => 'AppendEventFilter',
						//	'callback' => 'addFilterToEventEditor'
						//),

						//array(
						//	'page' => '/blueprints/events/edit/',
						//	'delegate' => 'AppendEventFilter',
						//	'callback' => 'addFilterToEventEditor'
						//),	

						//array(
						//	'page' => '/blueprints/events/new/',
						//	'delegate' => 'AppendEventFilterDocumentation',
						//	'callback' => 'addFilterDocumentationToEvent'
						//),

						//array(
						//	'page' => '/blueprints/events/edit/',
						//	'delegate' => 'AppendEventFilterDocumentation',
						//	'callback' => 'addFilterDocumentationToEvent'
						//),

						array(
							'page' => '/system/preferences/',
							'delegate' => 'AddCustomPreferenceFieldsets',
							'callback' => 'appendPreferences'
						),

						array(
							'page' => '/extension/members/new/',
							'delegate' => 'MemberRolePermissionFieldsetsNew',
							'callback' => 'appendMemberRolePermissionFieldsets'
						),
						
						array(
							'page' => '/extension/members/edit/',
							'delegate' => 'MemberRolePermissionFieldsetsEdit',
							'callback' => 'appendMemberRolePermissionFieldsets'
						),						

/*						array(
							'page' => '/frontend/',
							'delegate' => 'EventPreSaveFilter',
							'callback' => 'processPreSaveEventData'
						),

						array(
							'page' => '/frontend/',
							'delegate' => 'EventPostSaveFilter',
							'callback' => 'processPostSaveEventData'
						),			*/			
			);
		}

		public function appendMemberRolePermissionFieldsets($context){
			
			$fieldset = new XMLElement('fieldset');
			$fieldset->setAttribute('class', 'settings type-file');
			$fieldset->appendChild(new XMLElement('legend', 'Forum Permissions'));	
		
			$aTableHead = array(
				array('Action', 'col'),
				array('Allowed', 'col'),
			);	

			
			$permissions = $context['permissions']['forum'];

			$group = new XMLElement('div', NULL, array('class' => 'group'));
			
			/** FIRST TABLE **/			
			$aTableBody = extension_Members::buildRolePermissionTableBody(			
				array(
					array('Start New Discussion', 'forum', 'start_discussion', isset($permissions['start_discussion'])),
					array('Edit Discussions', 'forum', 'edit_discussion', isset($permissions['edit_discussion'])),
					array('Edit Own Discussions*', 'forum', 'edit_own_discussion', isset($permissions['edit_own_discussion'])),
					array('Remove Discussions', 'forum', 'remove_discussion', isset($permissions['remove_discussion'])),
					array('Remove Own Discussions*', 'forum', 'remove_own_discussion', isset($permissions['remove_own_discussion'])),
				)
			);
			

			$table = Widget::Table(
								Widget::TableHead($aTableHead), 
								NULL, 
								Widget::TableBody($aTableBody),
								'role-permissions narrow'
						);
				
			$group->appendChild($table);
			
			
			/** SECOND TABLE **/			
			$aTableBody = extension_Members::buildRolePermissionTableBody(			
				array(
					array('Add Comment', 'forum', 'add_comment', isset($permissions['add_comment'])),
					array('Edit Comment', 'forum', 'edit_comment', isset($permissions['edit_comment'])),
					array('Edit Own Comment*', 'forum', 'edit_own_comment', isset($permissions['edit_own_comment'])),
					array('Remove Comment', 'forum', 'remove_comment', isset($permissions['remove_comment'])),
					array('Remove Own Comment*', 'forum', 'remove_own_comment', isset($permissions['remove_own_comment'])),
				)
			);
			
			
			$table = Widget::Table(
								Widget::TableHead($aTableHead), 
								NULL, 
								Widget::TableBody($aTableBody),
								'role-permissions narrow'
						);
				
			$group->appendChild($table);			


			/** THIRD TABLE **/			
			$aTableBody = extension_Members::buildRolePermissionTableBody(			
				array(
					array('Pin/Unpin Discussion', 'forum', 'pin_discussion', isset($permissions['pin_discussion'])),
					array('Open/Close Discussion', 'forum', 'close_discussion', isset($permissions['close_discussion'])),
				)
			);
			
			
			$table = Widget::Table(
								Widget::TableHead($aTableHead), 
								NULL, 
								Widget::TableBody($aTableBody),
								'role-permissions narrow'
						);
				
			$group->appendChild($table);

			
			$fieldset->appendChild($group);	
		

			$fieldset->appendChild(new XMLElement('p', '* <em>Does not apply if global edit/remove is allowed</em>', array('class' => 'help')));
			
			$context['form']->appendChild($fieldset);
						
		}

		public function appendPreferences($context){

			include_once(TOOLKIT . '/class.sectionmanager.php');
			$sectionManager = new SectionManager($context['parent']);
		    $sections = $sectionManager->fetch(NULL, 'ASC', 'name');
			$field_groups = array();

			$group = new XMLElement('fieldset');
			$group->setAttribute('class', 'settings');

			$group->appendChild(new XMLElement('legend', 'Forum'));

			$p = new XMLElement('p', 'This field is the section link that ties comments to discussions.');
			$p->setAttribute('class', 'help');
			$group->appendChild($p);
			
			$div = new XMLElement('div', NULL, array('class' => 'group'));

			$label = Widget::Label('Discussion Section');
			
			$options = array();

			foreach($sections as $s){
				$options[] = array($s->get('id'), (Symphony::Configuration()->get('discussion-section', 'forum') == $s->get('id')), $s->get('name'));
			}

			$label->appendChild(Widget::Select('settings[forum][discussion-section]', $options));
			$div->appendChild($label);


			$label = Widget::Label('Comment Section');
			
			$options = array();

			foreach($sections as $s){
				$options[] = array($s->get('id'), (Symphony::Configuration()->get('comment-section', 'forum') == $s->get('id')), $s->get('name'));
			}

			$label->appendChild(Widget::Select('settings[forum][comment-section]', $options));
			$div->appendChild($label);
			
			$group->appendChild($div);

			$div = new XMLElement('div', NULL, array('class' => 'group'));
			$div->appendChild($this->createFieldSelector('Discussion Member Link', 'member-link-field', 'memberlink', $sections));
			$div->appendChild($this->createFieldSelector('Discussion Last Post', 'discussion-last-post-field', 'memberlink', $sections));
			$group->appendChild($div);
			
			$div = new XMLElement('div', NULL, array('class' => 'group'));
			$div->appendChild($this->createFieldSelector('Discussion Last Active (Date)', 'discussion-last-active-field', 'date', $sections));
			$div->appendChild($this->createFieldSelector('Earliest Unread Discussion Cutoff (Date)', 'unread-cutoff-field', 'date', $sections));
			$group->appendChild($div);
						

			$div = new XMLElement('div', NULL, array('class' => 'group'));
			$div->appendChild($this->createFieldSelector('Pinned Flag', 'pinned-field', 'checkbox', $sections));			
			$div->appendChild($this->createFieldSelector('Locked Flag', 'locked-field', 'checkbox', $sections));
			$group->appendChild($div);
				
			$div = new XMLElement('div', NULL, array('class' => 'group'));
			$div->appendChild($this->createFieldSelector('Comment Discussion Link', 'comment-discussion-link-field', 'selectbox_link', $sections));
			$div->appendChild($this->createFieldSelector('Comment Member Link', 'comment-member-link-field', 'memberlink', $sections));
			$group->appendChild($div);			

			$div = new XMLElement('div', NULL, array('class' => 'group'));
			$div->appendChild($this->createFieldSelector('Comment Creation Date', 'comment-creation-date-field', 'date', $sections));
			$group->appendChild($div);

			$context['wrapper']->appendChild($group);

		}
		
		public function createFieldSelector($title, $handle, $type, $sections){
			$label = Widget::Label($title);
			
			if(is_array($sections) && !empty($sections))
				foreach($sections as $section) $field_groups[$section->get('id')] = array('fields' => $section->fetchFields($type), 'section' => $section);

			$options = array();

			foreach($field_groups as $g){

				if(!is_array($g['fields'])) continue;

				$fields = array();
				foreach($g['fields'] as $f){
					$fields[] = array($f->get('id'), (Symphony::Configuration()->get($handle, 'forum') == $f->get('id')), $f->get('label'));
				}

				if(is_array($fields) && !empty($fields)) $options[] = array('label' => $g['section']->get('name'), 'options' => $fields);
			}

			$label->appendChild(Widget::Select('settings[forum]['.$handle.']', $options));	
			return $label;		
		}

/*
		public function processPreSaveEventData($context){

			if(in_array('sync-discussion-id', $context['event']->eParamFILTERS)){
				if(defined('__FORUM_NEW_DISCUSSION_ID__') && empty($context['fields']['discussion-id'])){
					$context['fields']['discussion-id'] = __FORUM_NEW_DISCUSSION_ID__;
				}
			}

			if(in_array('check-poster-credentials', $context['event']->eParamFILTERS)){
				$members =& $this->_Parent->ExtensionManager->create('members');
				$members->initialiseCookie();
				$loggedin = $members->isLoggedIn();

				$poster = $members->initialiseMemberObject();

				if(isset($context['fields']['created-by']) && $poster->get('id') != (int)$context['fields']['created-by']){
					$context['messages'][] = array('check-poster-credentials', false, 'member cookie id did not match supplied member id');
				}

				else $context['messages'][] = array('check-poster-credentials', true);

			}

		}

		public function processPostSaveEventData($context){	

			if(in_array('update-discussion-meta', $context['event']->eParamFILTERS)){
				$success = true;

				$entryManager = new EntryManager($this->_Parent);
				$discussion = $entryManager->fetch((int)$context['fields']['discussion-id'], NULL, NULL, NULL, NULL, NULL, false, true);

				if(count($discussion) < 1) $success = false;

				$member_id = ($context['fields']['created-by'] ? $context['fields']['created-by'] : NULL);

				$members =& $this->_Parent->ExtensionManager->create('members');
				$members->initialiseCookie();
				$loggedin = $members->isLoggedIn();

				if(!$poster = $members->initialiseMemberObject()) $success = false;

				if($success){
					$username = $poster->getData($members->usernameField());
					$username = $username['value'];

					$discussion[0]->setData(143, array('member_id' => $poster->get('id'), 'username' => $username));
					$discussion[0]->setData(119, array('value' => DateTimeObj::get('c'), 'local' => strtotime(DateTimeObj::get('c')), 'gmt' => strtotime(DateTimeObj::getGMT('c'))));
					$discussion[0]->commit();

					$this->Discussion->updateRead($poster->get('id'), $discussion[0]->get('id'));

				}

				$context['messages'][] = array('update-discussion-meta', $success);
			}

			if(in_array('publicise-new-discussion-id', $context['event']->eParamFILTERS)){
				define_safe('__FORUM_NEW_DISCUSSION_ID__', $context['entry']->get('id'));
			}

		}
*/

		public function getDiscussionSectionID(){
			return (int)Symphony::Configuration()->get('discussion-section', 'forum');
		}
		
		public function getCommentSectionID(){
			return (int)Symphony::Configuration()->get('comment-section', 'forum');
		}
		
	}

?>