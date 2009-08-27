
-- *** STRUCTURE: `tbl_fields_author` ***
DROP TABLE IF EXISTS `tbl_fields_author`;
CREATE TABLE `tbl_fields_author` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `allow_author_change` enum('yes','no') collate utf8_unicode_ci NOT NULL,
  `allow_multiple_selection` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'no',
  `default_to_current_user` enum('yes','no') collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_author` ***

-- *** STRUCTURE: `tbl_fields_checkbox` ***
DROP TABLE IF EXISTS `tbl_fields_checkbox`;
CREATE TABLE `tbl_fields_checkbox` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') collate utf8_unicode_ci NOT NULL default 'on',
  `description` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=195 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_checkbox` ***
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (188, 130, 'off', 'Pin discussion');
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (189, 131, 'off', 'Close this discussion');
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (194, 176, 'off', 'Send me email when there is important Symphony news.');

-- *** STRUCTURE: `tbl_fields_date` ***
DROP TABLE IF EXISTS `tbl_fields_date`;
CREATE TABLE `tbl_fields_date` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'no',
  `calendar` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'no',
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_date` ***
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`, `calendar`) VALUES (187, 134, 'yes', 'no');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`, `calendar`) VALUES (188, 133, 'yes', 'no');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`, `calendar`) VALUES (189, 119, 'yes', 'no');

-- *** STRUCTURE: `tbl_fields_input` ***
DROP TABLE IF EXISTS `tbl_fields_input`;
CREATE TABLE `tbl_fields_input` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(100) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=675 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_input` ***
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (672, 123, '/^\\w(?:\\.?[\\w%+-]+)*@\\w(?:[\\w-]*\\.)+?[a-z]{2,}$/i');
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (649, 114, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (670, 122, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (673, 175, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (671, 203, '/^[^\\s:\\/?#]+:(?:\\/{2,3})?[^\\s.\\/?#]+(?:\\.[^\\s.\\/?#]+)*(?:\\/[^\\s?#]*\\??[^\\s?#]*(#[^\\s#]*)?)?$/');
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (674, 204, NULL);

-- *** STRUCTURE: `tbl_fields_member` ***
DROP TABLE IF EXISTS `tbl_fields_member`;
CREATE TABLE `tbl_fields_member` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_member` ***
INSERT INTO `tbl_fields_member` (`id`, `field_id`) VALUES (28, 144);

-- *** STRUCTURE: `tbl_fields_memberlink` ***
DROP TABLE IF EXISTS `tbl_fields_memberlink`;
CREATE TABLE `tbl_fields_memberlink` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_memberlink` ***
INSERT INTO `tbl_fields_memberlink` (`id`, `field_id`) VALUES (76, 141);
INSERT INTO `tbl_fields_memberlink` (`id`, `field_id`) VALUES (77, 142);
INSERT INTO `tbl_fields_memberlink` (`id`, `field_id`) VALUES (78, 143);

-- *** STRUCTURE: `tbl_fields_memberrole` ***
DROP TABLE IF EXISTS `tbl_fields_memberrole`;
CREATE TABLE `tbl_fields_memberrole` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_memberrole` ***
INSERT INTO `tbl_fields_memberrole` (`id`, `field_id`) VALUES (15, 146);

-- *** STRUCTURE: `tbl_fields_number` ***
DROP TABLE IF EXISTS `tbl_fields_number`;
CREATE TABLE `tbl_fields_number` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_number` ***

-- *** STRUCTURE: `tbl_fields_select` ***
DROP TABLE IF EXISTS `tbl_fields_select`;
CREATE TABLE `tbl_fields_select` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'no',
  `static_options` text collate utf8_unicode_ci,
  `dynamic_options` int(11) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_select` ***

-- *** STRUCTURE: `tbl_fields_selectbox_link` ***
DROP TABLE IF EXISTS `tbl_fields_selectbox_link`;
CREATE TABLE `tbl_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'no',
  `related_field_id` varchar(255) collate utf8_unicode_ci NOT NULL,
  `limit` int(4) unsigned NOT NULL default '20',
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_selectbox_link` ***
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`) VALUES (16, 117, 'no', '192,114', 20);

-- *** STRUCTURE: `tbl_fields_taglist` ***
DROP TABLE IF EXISTS `tbl_fields_taglist`;
CREATE TABLE `tbl_fields_taglist` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(100) collate utf8_unicode_ci default NULL,
  `pre_populate_source` varchar(15) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_taglist` ***

-- *** STRUCTURE: `tbl_fields_textarea` ***
DROP TABLE IF EXISTS `tbl_fields_textarea`;
CREATE TABLE `tbl_fields_textarea` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) collate utf8_unicode_ci default NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=381 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_textarea` ***
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (380, 115, 'markdownextrasmartypants', 15);

-- *** STRUCTURE: `tbl_fields_uniqueupload` ***
DROP TABLE IF EXISTS `tbl_fields_uniqueupload`;
CREATE TABLE `tbl_fields_uniqueupload` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) collate utf8_unicode_ci NOT NULL,
  `validator` varchar(50) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_uniqueupload` ***

-- *** STRUCTURE: `tbl_fields_upload` ***
DROP TABLE IF EXISTS `tbl_fields_upload`;
CREATE TABLE `tbl_fields_upload` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) collate utf8_unicode_ci NOT NULL,
  `validator` varchar(50) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_upload` ***

-- *** STRUCTURE: `tbl_fields_xml` ***
DROP TABLE IF EXISTS `tbl_fields_xml`;
CREATE TABLE `tbl_fields_xml` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `field_id` int(11) unsigned NOT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_fields_xml` ***

-- *** STRUCTURE: `tbl_entries_cache_reference` ***
DROP TABLE IF EXISTS `tbl_entries_cache_reference`;
CREATE TABLE `tbl_entries_cache_reference` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `cache_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`,`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_cache_reference` ***

-- *** STRUCTURE: `tbl_entries_data_114` ***
DROP TABLE IF EXISTS `tbl_entries_data_114`;
CREATE TABLE `tbl_entries_data_114` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) collate utf8_unicode_ci default NULL,
  `value` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_114` ***

-- *** STRUCTURE: `tbl_entries_data_115` ***
DROP TABLE IF EXISTS `tbl_entries_data_115`;
CREATE TABLE `tbl_entries_data_115` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text collate utf8_unicode_ci,
  `value_formatted` text collate utf8_unicode_ci,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_115` ***

-- *** STRUCTURE: `tbl_entries_data_117` ***
DROP TABLE IF EXISTS `tbl_entries_data_117`;
CREATE TABLE `tbl_entries_data_117` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_117` ***

-- *** STRUCTURE: `tbl_entries_data_119` ***
DROP TABLE IF EXISTS `tbl_entries_data_119`;
CREATE TABLE `tbl_entries_data_119` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) collate utf8_unicode_ci default NULL,
  `local` int(11) default NULL,
  `gmt` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_119` ***

-- *** STRUCTURE: `tbl_entries_data_122` ***
DROP TABLE IF EXISTS `tbl_entries_data_122`;
CREATE TABLE `tbl_entries_data_122` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) collate utf8_unicode_ci default NULL,
  `value` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_122` ***

-- *** STRUCTURE: `tbl_entries_data_123` ***
DROP TABLE IF EXISTS `tbl_entries_data_123`;
CREATE TABLE `tbl_entries_data_123` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) collate utf8_unicode_ci default NULL,
  `value` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_123` ***

-- *** STRUCTURE: `tbl_entries_data_130` ***
DROP TABLE IF EXISTS `tbl_entries_data_130`;
CREATE TABLE `tbl_entries_data_130` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'no',
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_130` ***

-- *** STRUCTURE: `tbl_entries_data_131` ***
DROP TABLE IF EXISTS `tbl_entries_data_131`;
CREATE TABLE `tbl_entries_data_131` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'no',
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_131` ***

-- *** STRUCTURE: `tbl_entries_data_133` ***
DROP TABLE IF EXISTS `tbl_entries_data_133`;
CREATE TABLE `tbl_entries_data_133` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) collate utf8_unicode_ci default NULL,
  `local` int(11) default NULL,
  `gmt` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_133` ***

-- *** STRUCTURE: `tbl_entries_data_134` ***
DROP TABLE IF EXISTS `tbl_entries_data_134`;
CREATE TABLE `tbl_entries_data_134` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) collate utf8_unicode_ci default NULL,
  `local` int(11) default NULL,
  `gmt` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_134` ***

-- *** STRUCTURE: `tbl_entries_data_141` ***
DROP TABLE IF EXISTS `tbl_entries_data_141`;
CREATE TABLE `tbl_entries_data_141` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `member_id` int(11) default NULL,
  `username` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_141` ***

-- *** STRUCTURE: `tbl_entries_data_142` ***
DROP TABLE IF EXISTS `tbl_entries_data_142`;
CREATE TABLE `tbl_entries_data_142` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `member_id` int(11) default NULL,
  `username` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_142` ***

-- *** STRUCTURE: `tbl_entries_data_143` ***
DROP TABLE IF EXISTS `tbl_entries_data_143`;
CREATE TABLE `tbl_entries_data_143` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `member_id` int(11) default NULL,
  `username` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_143` ***

-- *** STRUCTURE: `tbl_entries_data_144` ***
DROP TABLE IF EXISTS `tbl_entries_data_144`;
CREATE TABLE `tbl_entries_data_144` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `username` varchar(50) collate utf8_unicode_ci default NULL,
  `password` varchar(32) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_144` ***

-- *** STRUCTURE: `tbl_entries_data_146` ***
DROP TABLE IF EXISTS `tbl_entries_data_146`;
CREATE TABLE `tbl_entries_data_146` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_146` ***

-- *** STRUCTURE: `tbl_entries_data_175` ***
DROP TABLE IF EXISTS `tbl_entries_data_175`;
CREATE TABLE `tbl_entries_data_175` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) collate utf8_unicode_ci default NULL,
  `value` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_175` ***

-- *** STRUCTURE: `tbl_entries_data_176` ***
DROP TABLE IF EXISTS `tbl_entries_data_176`;
CREATE TABLE `tbl_entries_data_176` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'no',
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_176` ***

-- *** STRUCTURE: `tbl_entries_data_203` ***
DROP TABLE IF EXISTS `tbl_entries_data_203`;
CREATE TABLE `tbl_entries_data_203` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) collate utf8_unicode_ci default NULL,
  `value` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_203` ***

-- *** STRUCTURE: `tbl_entries_data_204` ***
DROP TABLE IF EXISTS `tbl_entries_data_204`;
CREATE TABLE `tbl_entries_data_204` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) collate utf8_unicode_ci default NULL,
  `value` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_204` ***

-- *** STRUCTURE: `tbl_entries_data_205` ***
DROP TABLE IF EXISTS `tbl_entries_data_205`;
CREATE TABLE `tbl_entries_data_205` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double default NULL,
  PRIMARY KEY  (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_data_205` ***

-- *** STRUCTURE: `sym_forum_read_discussions` ***
CREATE TABLE IF NOT EXISTS `sym_forum_read_discussions` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `member_id` int(11) unsigned NOT NULL,
  `discussion_id` int(11) unsigned NOT NULL,
  `last_viewed` int(11) unsigned NOT NULL,
  `comments` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `member_id` (`member_id`,`discussion_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1;

-- *** DATA: `sym_forum_read_discussions` ***

-- *** STRUCTURE: `sym_members_login_tokens` ***
CREATE TABLE IF NOT EXISTS `sym_members_login_tokens` (
  `member_id` int(11) unsigned NOT NULL,
  `token` varchar(8) collate utf8_unicode_ci NOT NULL,
  `expiry` int(11) NOT NULL,
  PRIMARY KEY  (`member_id`),
  KEY `token` (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_members_login_tokens` ***

-- *** STRUCTURE: `sym_members_roles` ***
CREATE TABLE IF NOT EXISTS `sym_members_roles` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `name` varchar(60) collate utf8_unicode_ci NOT NULL,
  `email_subject` varchar(255) collate utf8_unicode_ci default NULL,
  `email_body` longtext collate utf8_unicode_ci,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

-- *** DATA: `sym_members_roles` ***
INSERT INTO `sym_members_roles` VALUES (1, 'Guest', NULL, NULL);
INSERT INTO `sym_members_roles` VALUES (2, 'Administrator', NULL, NULL);
INSERT INTO `sym_members_roles` VALUES (3, 'Forum Member', 'Symphony Membership Activated!', 'Dear {$name},\r\n\r\nCongratulations on obtaining your citizenship!\r\n\r\nRegards,\r\n\r\nForum Moderation Team');
INSERT INTO `sym_members_roles` VALUES (4, 'Inactive', 'Symphony Website Membership', 'Dear {$name},\r\n\r\nThanks for registering!\r\n\r\nTo activate your account, head to {$root}/members/activate/ and enter "{$activation-token}" (without quotes) where it asks for your activation code.\r\n\r\nThis code will expire in one hour, so if you miss your window, simply head to the link above and click "Resend activation email" to get a new one.\r\n\r\nIf you have problems activating your account, please email us at support@symphony-cms.com and we''ll do our best to help.\r\n\r\nWe don''t know you yet, but we can already tell -- you''ll be a wonderful addition to our growing community!\r\n\r\nRegards,\r\n\r\nSymphony Team');

-- *** STRUCTURE: `sym_members_roles_event_permissions` ***
CREATE TABLE IF NOT EXISTS `sym_members_roles_event_permissions` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `role_id` int(11) unsigned NOT NULL,
  `event` varchar(50) collate utf8_unicode_ci NOT NULL,
  `action` varchar(60) collate utf8_unicode_ci NOT NULL,
  `allow` enum('yes','no') collate utf8_unicode_ci NOT NULL default 'no',
  PRIMARY KEY  (`id`),
  KEY `role_id` (`role_id`,`event`,`action`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=891 ;

-- *** DATA: `sym_members_roles_event_permissions` ***
INSERT INTO `sym_members_roles_event_permissions` VALUES (670, 2, 'forum', 'close_discussion', 'yes');
INSERT INTO `sym_members_roles_event_permissions` VALUES (669, 2, 'forum', 'pin_discussion', 'yes');
INSERT INTO `sym_members_roles_event_permissions` VALUES (668, 2, 'forum', 'remove_own_comment', 'yes');
INSERT INTO `sym_members_roles_event_permissions` VALUES (667, 2, 'forum', 'remove_comment', 'yes');
INSERT INTO `sym_members_roles_event_permissions` VALUES (666, 2, 'forum', 'edit_own_comment', 'yes');
INSERT INTO `sym_members_roles_event_permissions` VALUES (665, 2, 'forum', 'edit_comment', 'yes');
INSERT INTO `sym_members_roles_event_permissions` VALUES (664, 2, 'forum', 'add_comment', 'yes');
INSERT INTO `sym_members_roles_event_permissions` VALUES (663, 2, 'forum', 'remove_own_discussion', 'yes');
INSERT INTO `sym_members_roles_event_permissions` VALUES (662, 2, 'forum', 'remove_discussion', 'yes');
INSERT INTO `sym_members_roles_event_permissions` VALUES (661, 2, 'forum', 'edit_own_discussion', 'yes');
INSERT INTO `sym_members_roles_event_permissions` VALUES (660, 2, 'forum', 'edit_discussion', 'yes');
INSERT INTO `sym_members_roles_event_permissions` VALUES (659, 2, 'forum', 'start_discussion', 'yes');
INSERT INTO `sym_members_roles_event_permissions` VALUES (890, 3, 'forum', 'edit_own_comment', 'yes');
INSERT INTO `sym_members_roles_event_permissions` VALUES (889, 3, 'forum', 'add_comment', 'yes');
INSERT INTO `sym_members_roles_event_permissions` VALUES (888, 3, 'forum', 'edit_own_discussion', 'yes');
INSERT INTO `sym_members_roles_event_permissions` VALUES (887, 3, 'forum', 'start_discussion', 'yes');

-- *** STRUCTURE: `sym_members_roles_forbidden_pages` ***
CREATE TABLE IF NOT EXISTS `sym_members_roles_forbidden_pages` (
  `id` int(11) unsigned NOT NULL auto_increment,
  `role_id` int(11) unsigned NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `role_id` (`role_id`,`page_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=48 ;

-- *** DATA: `sym_members_roles_forbidden_pages` ***
INSERT INTO `sym_members_roles_forbidden_pages` VALUES (42, 1, 121);
INSERT INTO `sym_members_roles_forbidden_pages` VALUES (41, 1, 117);
INSERT INTO `sym_members_roles_forbidden_pages` VALUES (40, 1, 80);
INSERT INTO `sym_members_roles_forbidden_pages` VALUES (39, 1, 105);
INSERT INTO `sym_members_roles_forbidden_pages` VALUES (38, 1, 115);
INSERT INTO `sym_members_roles_forbidden_pages` VALUES (37, 1, 129);
INSERT INTO `sym_members_roles_forbidden_pages` VALUES (36, 1, 84);
INSERT INTO `sym_members_roles_forbidden_pages` VALUES (35, 1, 81);
INSERT INTO `sym_members_roles_forbidden_pages` VALUES (34, 1, 128);
INSERT INTO `sym_members_roles_forbidden_pages` VALUES (33, 1, 120);
INSERT INTO `sym_members_roles_forbidden_pages` VALUES (32, 1, 111);
INSERT INTO `sym_members_roles_forbidden_pages` VALUES (31, 1, 126);

-- *** DATA: `tbl_entries` ***

-- *** DATA: `tbl_extensions` ***
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (87, 'markdown', 'enabled', 1.8);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (85, 'numberfield', 'enabled', 1.4);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (110, 'export_ensemble', 'enabled', 1.9);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (98, 'members', 'enabled', 1);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (109, 'content_type_mappings', 'enabled', 1);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (91, 'forum', 'enabled', 1);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (81, 'selectbox_link_field', 'enabled', 1.9);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (82, 'jit_image_manipulation', 'enabled', 1.02);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (83, 'maintenance_mode', 'enabled', 1.1);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (84, 'asdc', 'enabled', 1.2);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (105, 'debugdevkit', 'enabled', 1);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (106, 'profiledevkit', 'enabled', 1);

-- *** DATA: `tbl_extensions_delegates` ***
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (43, 57, '/backend/', 'ModifyTextareaFieldPublishWidget', 'modifyTextarea');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (161, 98, '/frontend/', 'EventPostSaveFilter', 'processEventData');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (160, 98, '/frontend/', 'FrontendProcessEvents', 'appendLoginStatusToEventXML');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (148, 91, '/extension/members/new/', 'MemberRolePermissionFieldsetsNew', 'appendMemberRolePermissionFieldsets');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (149, 91, '/extension/members/edit/', 'MemberRolePermissionFieldsetsEdit', 'appendMemberRolePermissionFieldsets');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (147, 91, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (134, 82, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (135, 82, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (136, 83, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (137, 83, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (138, 83, '/system/preferences/', 'CustomActions', '__toggleMaintenanceMode');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (139, 83, '/frontend/', 'FrontendPrePageResolve', '__checkForMaintenanceMode');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (140, 83, '/frontend/', 'FrontendParamsResolve', '__addParam');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (141, 83, '/backend/', 'AppendPageAlert', '__appendAlert');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (176, 110, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (175, 109, '/frontend/', 'FrontendOutputPreGenerate', 'setContentType');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (152, 94, '/backend/', 'InitaliseAdminPageHead', '__hijack');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (159, 98, '/frontend/', 'FrontendPageResolved', 'checkFrontendPagePermissions');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (162, 98, '/publish/new/', 'EntryPostCreate', 'emailNewMember');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (171, 105, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (170, 105, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (172, 106, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (173, 106, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');

-- *** DATA: `tbl_fields` ***
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (142, 'Created By', 'created-by', 'memberlink', 38, 'yes', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (131, 'Closed', 'closed', 'checkbox', 38, 'no', 6, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (122, 'Name', 'name', 'input', 40, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (123, 'Email Address', 'email-address', 'input', 40, 'yes', 3, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (134, 'Date', 'date', 'date', 39, 'no', 2, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (119, 'Last Active', 'last-active', 'date', 38, 'no', 4, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (146, 'Role', 'role', 'memberrole', 40, 'no', 4, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (143, 'Last Post', 'last-post', 'memberlink', 38, 'yes', 3, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (130, 'Pinned', 'pinned', 'checkbox', 38, 'no', 5, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (114, 'Topic', 'topic', 'input', 38, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (115, 'Comment', 'comment', 'textarea', 39, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (141, 'Created By', 'created-by', 'memberlink', 39, 'yes', 3, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (117, 'Parent ID', 'parent-id', 'selectbox_link', 39, 'yes', 1, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (133, 'Creation Date', 'creation-date', 'date', 38, 'no', 2, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (144, 'Username and Password', 'username-and-password', 'member', 40, 'yes', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (175, 'Location', 'location', 'input', 40, 'no', 5, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (176, 'Email Opt-in', 'email-opt-in', 'checkbox', 40, 'no', 8, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (203, 'Website', 'website', 'input', 40, 'no', 2, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (204, 'City', 'city', 'input', 40, 'no', 6, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (205, 'Timezone Offset', 'timezone-offset', 'number', 40, 'no', 7, 'sidebar', 'yes');

-- *** DATA: `tbl_pages` ***
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (64, NULL, 'Forum', 'forum', NULL, 'dpage', 'forum_discussions,forum_read_discussions,search_comments,whosonline', 'forum_utilities', 41);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (79, 64, 'Discussions', 'discussions', 'forum', 'discussion-id/cpage', 'forum_comments,forum_discussions,forum_moderators,whosonline', 'forum_post,forum_utilities', 43);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (81, 79, 'Edit Comment', 'edit-comment', 'forum/discussions', 'comment-id/cpage/position', 'forum_edit_comment,whosonline', 'forum_post', 46);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (80, 79, 'New Discussion', 'new', 'forum/discussions', NULL, 'whosonline', 'forum_post,forum_utilities', 44);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (86, NULL, 'Members', 'members', NULL, 'member', 'members,members_forum_comment_count,members_forum_discussion_count,whosonline', NULL, 68);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (84, 79, 'Edit Discussion', 'edit-discussion', 'forum/discussions', 'discussion-id', 'forum_discussions,forum_edit_discussion,whosonline', 'forum_post', 45);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (87, 86, 'New', 'new', 'members', NULL, 'members_location,whosonline', 'save_member', 69);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (111, 86, 'Edit', 'edit', 'members', NULL, 'members_edit,members_location,whosonline', 'edit_member', 70);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (113, 64, 'Code Source', 'code-source', 'forum', 'comment-id/position', 'forum_code_source', NULL, 47);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (114, NULL, 'Page Not Found', 'page-not-found', NULL, NULL, 'whosonline', NULL, 83);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (125, 86, 'Reset Password', 'reset-pass', 'members', 'mode', 'whosonline', 'forgot_password', 72);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (126, 86, 'Change Password', 'change-pass', 'members', 'mode', 'whosonline', 'member_change_password', 73);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (127, 86, 'Activate', 'activate', 'members', 'mode', 'whosonline', 'forum_activate_member,forum_resend_activation_email', 71);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (129, 64, 'Filter', 'forum-filter', 'forum', 'dpage', 'forum_discussions_filtered,forum_read_discussions,whosonline', 'forum_utilities', 42);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (136, NULL, 'Forbidden', 'forbidden', NULL, NULL, 'whosonline', NULL, 82);

-- *** DATA: `tbl_pages_types` ***
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (747, 64, 'index');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (748, 113, 'text');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (749, 136, 403);
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (750, 114, 404);

-- *** DATA: `tbl_sections` ***
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (38, 'Discussions', 'discussions', 1, 133, 'desc', 'no', 'Forum');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (39, 'Comments', 'comments', 2, 134, 'desc', 'no', 'Forum');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (40, 'Members', 'members', 0, NULL, NULL, 'no', 'Forum');

-- *** DATA: `tbl_sections_association` ***
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `cascading_deletion`) VALUES (122, 38, 114, 39, 117, 'no');