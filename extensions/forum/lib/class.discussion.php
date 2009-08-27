<?php

	Class Discussion{

		private $_discussion_id;
		private $_Parent;
		private $_entry;

		public $EntryManager;

		function __construct(&$parent, $discussion_id=NULL){
			$this->_Parent = $parent;
			if($discussion_id) $this->load($discussion_id);
		}

		public function __distruct(){
			unset($this->EntryManager);
		}
		
		public function Entry(){
			return $this->_entry;
		}
		
		public function load($discussion_id){
			if(!is_object($this->EntryManager)) $this->EntryManager = new EntryManager($this->_Parent);

			$this->_discussion_id = $discussion_id;
			if(!$tmp = $this->EntryManager->fetch($discussion_id)) throw new Exception('Invalid Discussion ID Specified');
			$this->_entry = $tmp[0];
		}

		private function __toggle($field_id, $value){

			$field = $this->EntryManager->fieldManager->fetch($field_id);

			$this->_entry->setData($field_id, $field->toggleFieldData($this->_entry->getData($field_id), $value));							
			$this->_entry->commit();

		}
		
		public function updateLastActive($date){
			
		}
		
		public function updateLastPost($member_id, $username){
			
		}
		
		public static function getLastActiveField(){
			return (int)Symphony::Configuration()->get('discussion-last-active-field', 'forum');
		}
		
		public static function getLastPostField(){
			return (int)Symphony::Configuration()->get('discussion-last-post-field', 'forum');
		}
		
		public static function getUnreadCutoffField(){
			return (int)Symphony::Configuration()->get('unread-cutoff-field', 'forum');
		}		
		
		public static function getCommentField(){
			return (int)Symphony::Configuration()->get('comment-discussion-link-field', 'forum');
		}

		public static function getCommentCreationDateField(){
			return (int)Symphony::Configuration()->get('comment-creation-date-field', 'forum');
		}

		public static function getCommentMemberField(){
			return (int)Symphony::Configuration()->get('comment-member-link-field', 'forum');	
		}

		public static function getPinnedField(){
			return (int)Symphony::Configuration()->get('pinned-field', 'forum');
		}

		public static function getLockedField(){
			return (int)Symphony::Configuration()->get('locked-field', 'forum');
		}

		public static function getMemberField(){
			return (int)Symphony::Configuration()->get('member-link-field', 'forum');
		}

		public function open($discussion_id=NULL){
		
			if($discussion_id) $this->load($discussion_id);
			elseif(!$discussion_id && !is_object($this->_entry)) throw new Exception('No discussion specified');
		
			$this->__toggle(self::getLockedField(), 'no');
		}

		public function close($discussion_id=NULL){
		
			if($discussion_id) $this->load($discussion_id);
			elseif(!$discussion_id && !is_object($this->_entry)) throw new Exception('No discussion specified');
		
			$this->__toggle(self::getLockedField(), 'yes');
		}

		public function unpin($discussion_id=NULL){
		
			if($discussion_id) $this->load($discussion_id);
			elseif(!$discussion_id && !is_object($this->_entry)) throw new Exception('No discussion specified');
		
			$this->__toggle(self::getPinnedField(), 'no');
		}

		public function pin($discussion_id=NULL){
		
			if($discussion_id) $this->load($discussion_id);
			elseif(!$discussion_id && !is_object($this->_entry)) throw new Exception('No discussion specified');
		
			$this->__toggle(self::getPinnedField(), 'yes');
		}

		
		public function remove($discussion_id=NULL){
		
			if($discussion_id) $this->load($discussion_id);
			elseif(!$discussion_id && !is_object($this->_entry)) throw new Exception('No discussion specified');
		
			$this->EntryManager->delete($this->_discussion_id);
			Symphony::Database()->query("DELETE FROM `tbl_forum_read_discussions` WHERE `discussion_id` = ".$this->_discussion_id." LIMIT 1");		
		}
		
		public function removeComment($comment_id, $discussion_id){
		
			$this->load($discussion_id);
			
			$this->EntryManager->delete($comment_id);

			Symphony::Database()->query(
				"UPDATE `tbl_forum_read_discussions` 
				SET `comments` = (`comments` - 1) 	 
				WHERE `discussion_id` = " . $this->_discussion_id
			);
			
			// Find information about the new last comment for this discussion
			$last_comment = Symphony::Database()->fetchRow(0,
				sprintf(
					"SELECT d.local, d.gmt, d.value, m.member_id, m.username
					FROM `tbl_entries_data_%d` AS `p`
					LEFT JOIN `tbl_entries_data_%d` AS `d` ON p.entry_id = d.entry_id
					LEFT JOIN `tbl_entries_data_%d` AS `m` ON p.entry_id = m.entry_id
					WHERE p.relation_id = %d
					ORDER BY d.local DESC
					LIMIT 1",
			
					self::getCommentField(),
					self::getCommentCreationDateField(),
					self::getCommentMemberField(),
					$discussion_id
				)
			);
			
			/*
			    [0] => stdClass Object
	                (
	                    [local] => 1249429200
	                    [gmt] => 1249429200
	                    [value] => 2009-08-04T23:40:00+00:00
	                    [member_id] => 22864
	                    [username] => Throlkim
	                )
			*/
			
			// Update 'Last Post' (Member)
			$this->_entry->setData(self::getLastPostField(), array('member_id' => $last_comment['member_id'], 'username' => $last_comment['username']));
			
			// Update 'Last Active' (Date)
			$this->_entry->setData(self::getLastActiveField(), array('local' => $last_comment['local'], 'gmt' => $last_comment['gmt'], 'value' => $last_comment['value']));

			$this->_entry->commit();
		}

		public function replyCount($discussion_id=NULL){
		
			if($discussion_id) $this->load($discussion_id);
			elseif(!$discussion_id && !is_object($this->_entry)) throw new Exception('No discussion specified');
		
			return Symphony::Database()->fetchVar('count', 0, "SELECT COUNT(*) as `count` FROM `tbl_entries_data_".self::getCommentField()."` WHERE `relation_id` = ".$this->_discussion_id);
		}
		
		public function isDiscussionOwner($member_id, $discussion_id=NULL){
		
			if($discussion_id) $this->load($discussion_id);
			elseif(!$discussion_id && !is_object($this->_entry)) throw new Exception('No discussion specified');
			
			$member = $this->_entry->getData(self::getMemberField());

			return ($member['member_id'] == $member_id);			
			
		}
		
		public function isCommentOwner($member_id, $comment_id){
			
			if(!is_object($this->EntryManager)) $this->EntryManager = new EntryManager($this->_Parent);
			
			if(!$comment = $this->EntryManager->fetch($comment_id)) throw new Exception('Invalid Comment ID specified');

			$member = $comment[0]->getData(self::getCommentMemberField());

			return ($member['member_id'] == $member_id);

		}	
	
		public function markAllAsRead($member_id){
			
			Symphony::Database()->query(sprintf(
				'DELETE FROM `tbl_entries_data_%d` WHERE `entry_id` = %d',
				Discussion::getUnreadCutoffField(),
				(int)$member_id
			));
			
			Symphony::Database()->query(sprintf(
				"INSERT INTO `tbl_entries_data_%d` VALUES (NULL, %d, '%s', %d, %d)",
				Discussion::getUnreadCutoffField(),	
				(int)$member_id,
				DateTimeObj::get('c'),
				strtotime(DateTimeObj::get('c')),
				strtotime(DateTimeObj::getGMT('Y-m-d H:i:s'))
			));

		}
	
		public function updateRead($member_id, $discussion_id=NULL){
		
			if($discussion_id) $this->load($discussion_id);
			elseif(!$discussion_id && !is_object($this->_entry)) throw new Exception('No discussion specified');
		
		
			$existing = Symphony::Database()->fetchVar('id', 0, "SELECT `id` 
																	 FROM `tbl_forum_read_discussions` 
																	 WHERE `discussion_id` = ".$this->_discussion_id." AND `member_id` = $member_id LIMIT 1");

			if($existing)
				return Symphony::Database()->query("UPDATE `tbl_forum_read_discussions` 
														SET `last_viewed` = ".time().", `comments` = ".$this->replyCount()." 
														WHERE `id` = $existing LIMIT 1");
		
			else
				return Symphony::Database()->query("INSERT INTO `tbl_forum_read_discussions` VALUES (NULL, $member_id, ".$this->_discussion_id.", ".time().", ".$this->replyCount().")");
	
		}

	}
