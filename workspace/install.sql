
-- *** STRUCTURE: `tbl_fields_author` ***
DROP TABLE IF EXISTS `tbl_fields_author`;
CREATE TABLE `tbl_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_author_change` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_author` ***

-- *** STRUCTURE: `tbl_fields_checkbox` ***
DROP TABLE IF EXISTS `tbl_fields_checkbox`;
CREATE TABLE `tbl_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_checkbox` ***
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (1, 9, 'off', 'Send me email when there is important news.');
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (2, 15, 'off', 'Pin discussion');
INSERT INTO `tbl_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (3, 16, 'off', 'Close this discussion');

-- *** STRUCTURE: `tbl_fields_date` ***
DROP TABLE IF EXISTS `tbl_fields_date`;
CREATE TABLE `tbl_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `calendar` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_date` ***
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`, `calendar`) VALUES (1, 12, 'yes', 'no');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`, `calendar`) VALUES (2, 14, 'yes', 'no');
INSERT INTO `tbl_fields_date` (`id`, `field_id`, `pre_populate`, `calendar`) VALUES (4, 19, 'yes', 'no');

-- *** STRUCTURE: `tbl_fields_input` ***
DROP TABLE IF EXISTS `tbl_fields_input`;
CREATE TABLE `tbl_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_input` ***
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (1, 1, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (2, 3, '/^[^\\s:\\/?#]+:(?:\\/{2,3})?[^\\s.\\/?#]+(?:\\.[^\\s.\\/?#]+)*(?:\\/[^\\s?#]*\\??[^\\s?#]*(#[^\\s#]*)?)?$/');
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (3, 4, '/^\\w(?:\\.?[\\w%+-]+)*@\\w(?:[\\w-]*\\.)+?[a-z]{2,}$/i');
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (4, 6, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (5, 7, NULL);
INSERT INTO `tbl_fields_input` (`id`, `field_id`, `validator`) VALUES (6, 10, NULL);

-- *** STRUCTURE: `tbl_fields_member` ***
DROP TABLE IF EXISTS `tbl_fields_member`;
CREATE TABLE `tbl_fields_member` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_member` ***
INSERT INTO `tbl_fields_member` (`id`, `field_id`) VALUES (1, 2);

-- *** STRUCTURE: `tbl_fields_memberlink` ***
DROP TABLE IF EXISTS `tbl_fields_memberlink`;
CREATE TABLE `tbl_fields_memberlink` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_memberlink` ***
INSERT INTO `tbl_fields_memberlink` (`id`, `field_id`) VALUES (1, 11);
INSERT INTO `tbl_fields_memberlink` (`id`, `field_id`) VALUES (2, 13);
INSERT INTO `tbl_fields_memberlink` (`id`, `field_id`) VALUES (4, 20);

-- *** STRUCTURE: `tbl_fields_memberrole` ***
DROP TABLE IF EXISTS `tbl_fields_memberrole`;
CREATE TABLE `tbl_fields_memberrole` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_memberrole` ***
INSERT INTO `tbl_fields_memberrole` (`id`, `field_id`) VALUES (1, 5);

-- *** STRUCTURE: `tbl_fields_number` ***
DROP TABLE IF EXISTS `tbl_fields_number`;
CREATE TABLE `tbl_fields_number` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_number` ***

-- *** STRUCTURE: `tbl_fields_select` ***
DROP TABLE IF EXISTS `tbl_fields_select`;
CREATE TABLE `tbl_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `static_options` text COLLATE utf8_unicode_ci,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_select` ***

-- *** STRUCTURE: `tbl_fields_selectbox_link` ***
DROP TABLE IF EXISTS `tbl_fields_selectbox_link`;
CREATE TABLE `tbl_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `related_field_id` varchar(255) NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_fields_selectbox_link` ***
INSERT INTO `tbl_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `related_field_id`, `limit`) VALUES (2, 18, 'no', 10, 20);

-- *** STRUCTURE: `tbl_fields_taglist` ***
DROP TABLE IF EXISTS `tbl_fields_taglist`;
CREATE TABLE `tbl_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_populate_source` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_taglist` ***

-- *** STRUCTURE: `tbl_fields_textarea` ***
DROP TABLE IF EXISTS `tbl_fields_textarea`;
CREATE TABLE `tbl_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_textarea` ***
INSERT INTO `tbl_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (2, 17, 'markdownextrasmartypants', 15);

-- *** STRUCTURE: `tbl_fields_uniqueupload` ***
DROP TABLE IF EXISTS `tbl_fields_uniqueupload`;
CREATE TABLE `tbl_fields_uniqueupload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_uniqueupload` ***

-- *** STRUCTURE: `tbl_fields_upload` ***
DROP TABLE IF EXISTS `tbl_fields_upload`;
CREATE TABLE `tbl_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_fields_upload` ***

-- *** STRUCTURE: `tbl_fields_xml` ***
DROP TABLE IF EXISTS `tbl_fields_xml`;
CREATE TABLE `tbl_fields_xml` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `tbl_fields_xml` ***

-- *** STRUCTURE: `tbl_entries_cache_reference` ***
DROP TABLE IF EXISTS `tbl_entries_cache_reference`;
CREATE TABLE `tbl_entries_cache_reference` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `cache_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`,`cache_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `tbl_entries_cache_reference` ***

-- *** STRUCTURE: `tbl_entries_data_1` ***
DROP TABLE IF EXISTS `tbl_entries_data_1`;
CREATE TABLE `tbl_entries_data_1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_1` ***

-- *** STRUCTURE: `tbl_entries_data_10` ***
DROP TABLE IF EXISTS `tbl_entries_data_10`;
CREATE TABLE `tbl_entries_data_10` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_10` ***

-- *** STRUCTURE: `tbl_entries_data_11` ***
DROP TABLE IF EXISTS `tbl_entries_data_11`;
CREATE TABLE `tbl_entries_data_11` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_11` ***

-- *** STRUCTURE: `tbl_entries_data_12` ***
DROP TABLE IF EXISTS `tbl_entries_data_12`;
CREATE TABLE `tbl_entries_data_12` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_12` ***

-- *** STRUCTURE: `tbl_entries_data_13` ***
DROP TABLE IF EXISTS `tbl_entries_data_13`;
CREATE TABLE `tbl_entries_data_13` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_13` ***

-- *** STRUCTURE: `tbl_entries_data_14` ***
DROP TABLE IF EXISTS `tbl_entries_data_14`;
CREATE TABLE `tbl_entries_data_14` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_14` ***

-- *** STRUCTURE: `tbl_entries_data_15` ***
DROP TABLE IF EXISTS `tbl_entries_data_15`;
CREATE TABLE `tbl_entries_data_15` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_15` ***

-- *** STRUCTURE: `tbl_entries_data_16` ***
DROP TABLE IF EXISTS `tbl_entries_data_16`;
CREATE TABLE `tbl_entries_data_16` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_16` ***

-- *** STRUCTURE: `tbl_entries_data_17` ***
DROP TABLE IF EXISTS `tbl_entries_data_17`;
CREATE TABLE `tbl_entries_data_17` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text,
  `value_formatted` text,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_17` ***

-- *** STRUCTURE: `tbl_entries_data_18` ***
DROP TABLE IF EXISTS `tbl_entries_data_18`;
CREATE TABLE `tbl_entries_data_18` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_18` ***

-- *** STRUCTURE: `tbl_entries_data_19` ***
DROP TABLE IF EXISTS `tbl_entries_data_19`;
CREATE TABLE `tbl_entries_data_19` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_19` ***

-- *** STRUCTURE: `tbl_entries_data_2` ***
DROP TABLE IF EXISTS `tbl_entries_data_2`;
CREATE TABLE `tbl_entries_data_2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_2` ***

-- *** STRUCTURE: `tbl_entries_data_20` ***
DROP TABLE IF EXISTS `tbl_entries_data_20`;
CREATE TABLE `tbl_entries_data_20` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `member_id` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `member_id` (`member_id`),
  KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_20` ***

-- *** STRUCTURE: `tbl_entries_data_3` ***
DROP TABLE IF EXISTS `tbl_entries_data_3`;
CREATE TABLE `tbl_entries_data_3` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_3` ***

-- *** STRUCTURE: `tbl_entries_data_4` ***
DROP TABLE IF EXISTS `tbl_entries_data_4`;
CREATE TABLE `tbl_entries_data_4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_4` ***

-- *** STRUCTURE: `tbl_entries_data_5` ***
DROP TABLE IF EXISTS `tbl_entries_data_5`;
CREATE TABLE `tbl_entries_data_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`,`role_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_5` ***

-- *** STRUCTURE: `tbl_entries_data_6` ***
DROP TABLE IF EXISTS `tbl_entries_data_6`;
CREATE TABLE `tbl_entries_data_6` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_6` ***

-- *** STRUCTURE: `tbl_entries_data_7` ***
DROP TABLE IF EXISTS `tbl_entries_data_7`;
CREATE TABLE `tbl_entries_data_7` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_7` ***

-- *** STRUCTURE: `tbl_entries_data_8` ***
DROP TABLE IF EXISTS `tbl_entries_data_8`;
CREATE TABLE `tbl_entries_data_8` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_8` ***

-- *** STRUCTURE: `tbl_entries_data_9` ***
DROP TABLE IF EXISTS `tbl_entries_data_9`;
CREATE TABLE `tbl_entries_data_9` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- *** DATA: `tbl_entries_data_9` ***

-- *** DATA: `tbl_entries` ***

-- *** DATA: `tbl_extensions` ***
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (1, 'asdc', 'enabled', 1.2);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (2, 'content_type_mappings', 'enabled', 1);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (3, 'debugdevkit', 'enabled', 1);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (4, 'export_ensemble', 'enabled', 1.9);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (5, 'numberfield', 'enabled', 1.4);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (6, 'selectbox_link_field', 'enabled', 1.9);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (7, 'forum', 'enabled', 1);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (8, 'jit_image_manipulation', 'enabled', 1.02);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (9, 'maintenance_mode', 'enabled', 1.1);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (10, 'markdown', 'enabled', 1.8);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (11, 'members', 'enabled', 1);
INSERT INTO `tbl_extensions` (`id`, `name`, `status`, `version`) VALUES (12, 'profiledevkit', 'enabled', 1);

-- *** DATA: `tbl_extensions_delegates` ***
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (1, 2, '/frontend/', 'FrontendOutputPreGenerate', 'setContentType');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (2, 3, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (3, 3, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (4, 4, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (5, 7, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (6, 7, '/extension/members/new/', 'MemberRolePermissionFieldsetsNew', 'appendMemberRolePermissionFieldsets');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (7, 7, '/extension/members/edit/', 'MemberRolePermissionFieldsetsEdit', 'appendMemberRolePermissionFieldsets');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (8, 8, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (9, 8, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (10, 9, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (11, 9, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (12, 9, '/system/preferences/', 'CustomActions', '__toggleMaintenanceMode');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (13, 9, '/frontend/', 'FrontendPrePageResolve', '__checkForMaintenanceMode');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (14, 9, '/frontend/', 'FrontendParamsResolve', '__addParam');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (15, 9, '/backend/', 'AppendPageAlert', '__appendAlert');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (16, 11, '/frontend/', 'FrontendPageResolved', 'checkFrontendPagePermissions');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (17, 11, '/frontend/', 'FrontendProcessEvents', 'appendLoginStatusToEventXML');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (18, 11, '/frontend/', 'EventPostSaveFilter', 'processEventData');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (19, 11, '/frontend/', 'EventPreSaveFilter', 'checkEventPermissions');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (20, 11, '/publish/new/', 'EntryPostCreate', 'emailNewMember');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (21, 12, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `tbl_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (22, 12, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');

-- *** DATA: `tbl_fields` ***
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (1, 'Name', 'name', 'input', 1, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (2, 'Username and Password', 'username-and-password', 'member', 1, 'yes', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (3, 'Website', 'website', 'input', 1, 'no', 2, 'main', 'no');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (4, 'Email Address', 'email-address', 'input', 1, 'yes', 3, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (5, 'Role', 'role', 'memberrole', 1, 'no', 4, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (6, 'Location', 'location', 'input', 1, 'no', 5, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (7, 'City', 'city', 'input', 1, 'no', 6, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (8, 'Timezone Offset', 'timezone-offset', 'number', 1, 'no', 7, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (9, 'Email Opt-in', 'email-opt-in', 'checkbox', 1, 'no', 8, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (10, 'Topic', 'topic', 'input', 2, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (11, 'Created By', 'created-by', 'memberlink', 2, 'yes', 1, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (12, 'Creation Date', 'creation-date', 'date', 2, 'no', 2, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (13, 'Last Post', 'last-post', 'memberlink', 2, 'yes', 3, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (14, 'Last Active', 'last-active', 'date', 2, 'no', 4, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (15, 'Pinned', 'pinned', 'checkbox', 2, 'no', 5, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (16, 'Closed', 'closed', 'checkbox', 2, 'no', 6, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (17, 'Comment', 'comment', 'textarea', 3, 'yes', 0, 'main', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (18, 'Parent ID', 'parent-id', 'selectbox_link', 3, 'yes', 1, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (19, 'Date', 'date', 'date', 3, 'no', 2, 'sidebar', 'yes');
INSERT INTO `tbl_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (20, 'Created By', 'created-by', 'memberlink', 3, 'yes', 3, 'sidebar', 'yes');

-- *** DATA: `tbl_pages` ***
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (1, NULL, 'Forum', 'forum', NULL, 'dpage', 'forum_discussions,forum_read_discussions,search_comments,whosonline', 'forum_utilities', 1);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (2, 1, 'Filter', 'forum-filter', 'forum', 'dpage', 'forum_discussions_filtered,forum_read_discussions,whosonline', 'forum_utilities', 2);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (3, 1, 'Discussions', 'discussions', 'forum', 'discussion-id/cpage', 'forum_comments,forum_discussions,forum_moderators,whosonline', 'forum_post,forum_utilities', 3);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (4, 3, 'New Discussion', 'new', 'forum/discussions', NULL, 'whosonline', 'forum_post,forum_utilities', 4);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (5, 3, 'Edit Discussion', 'edit-discussion', 'forum/discussions', 'discussion-id', 'forum_discussions,forum_edit_discussion,whosonline', 'forum_post', 5);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (6, 3, 'Edit Comment', 'edit-comment', 'forum/discussions', 'comment-id/cpage/position', 'forum_edit_comment,whosonline', 'forum_post', 6);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (7, 1, 'Code Source', 'code-source', 'forum', 'comment-id/position', 'forum_code_source', NULL, 7);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (8, NULL, 'Members', 'members', NULL, 'member', 'members,members_forum_comment_count,members_forum_discussion_count,whosonline', NULL, 8);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (9, 8, 'New', 'new', 'members', NULL, 'members_location,whosonline', 'save_member', 9);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (10, 8, 'Edit', 'edit', 'members', NULL, 'members_edit', 'edit_member', 10);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (11, 8, 'Activate', 'activate', 'members', 'mode', 'whosonline', 'forum_activate_member,forum_resend_activation_email', 11);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (12, 8, 'Reset Password', 'reset-pass', 'members', 'mode', 'whosonline', 'forgot_password', 12);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (13, 8, 'Change Password', 'change-pass', 'members', 'mode', 'whosonline', 'member_change_password', 13);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (14, NULL, 'Forbidden', 'forbidden', NULL, NULL, 'whosonline', NULL, 14);
INSERT INTO `tbl_pages` (`id`, `parent`, `title`, `handle`, `path`, `params`, `data_sources`, `events`, `sortorder`) VALUES (15, NULL, 'Page Not Found', 'page-not-found', NULL, NULL, 'whosonline', NULL, 15);

-- *** DATA: `tbl_pages_types` ***
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (1, 1, 'index');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (2, 7, 'text');
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (3, 14, 403);
INSERT INTO `tbl_pages_types` (`id`, `page_id`, `type`) VALUES (4, 15, 404);

-- *** DATA: `tbl_sections` ***
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (1, 'Members', 'members', 1, NULL, 'asc', 'no', 'Forum');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (2, 'Discussions', 'discussions', 2, NULL, 'asc', 'no', 'Forum');
INSERT INTO `tbl_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (3, 'Comments', 'comments', 3, NULL, 'asc', 'no', 'Forum');

-- *** DATA: `tbl_sections_association` ***
INSERT INTO `tbl_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `cascading_deletion`) VALUES (2, 2, 10, 3, 18, 'no');

-- *** DATA: `tbl_forum_read_discussions` ***

-- *** DATA: `tbl_members_login_tokens` ***
INSERT INTO `tbl_members_login_tokens` (`member_id`, `token`, `expiry`) VALUES (1, 17360046, 1254933194);
INSERT INTO `tbl_members_login_tokens` (`member_id`, `token`, `expiry`) VALUES (2, 92402536, 1254935702);

-- *** DATA: `tbl_members_roles` ***
INSERT INTO `tbl_members_roles` (`id`, `name`, `email_subject`, `email_body`) VALUES (1, 'Guest', NULL, NULL);
INSERT INTO `tbl_members_roles` (`id`, `name`, `email_subject`, `email_body`) VALUES (2, 'Administrator', NULL, NULL);
INSERT INTO `tbl_members_roles` (`id`, `name`, `email_subject`, `email_body`) VALUES (3, 'Forum Member', 'Symphony Membership Activated!', 'Dear {$name},\r\n\r\nCongratulations on obtaining your citizenship!\r\n\r\nRegards,\r\n\r\nForum Moderation Team');
INSERT INTO `tbl_members_roles` (`id`, `name`, `email_subject`, `email_body`) VALUES (4, 'Inactive', 'Symphony Website Membership', 'Dear {$name},\r\n\r\nThanks for registering!\r\n\r\nTo activate your account, head to {$root}/members/activate/ and enter \"{$activation-token}\" (without quotes) where it asks for your activation code.\r\n\r\nThis code will expire in one hour, so if you miss your window, simply head to the link above and click \"Resend activation email\" to get a new one.\r\n\r\nIf you have problems activating your account, please email us at support@symphony-cms.com and we\'ll do our best to help.\r\n\r\nWe don\'t know you yet, but we can already tell -- you\'ll be a wonderful addition to our growing community!\r\n\r\nRegards,\r\n\r\nSymphony Team');

-- *** DATA: `tbl_members_roles_event_permissions` ***
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (1, 1, 'save_member', 'add', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (2, 2, 'edit_member', 'edit', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (3, 2, 'edit_member', 'edit_own', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (4, 2, 'member_change_password', 'edit_own', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (5, 2, 'save_member', 'edit_own', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (6, 2, 'forum', 'start_discussion', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (7, 2, 'forum', 'edit_discussion', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (8, 2, 'forum', 'edit_own_discussion', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (9, 2, 'forum', 'remove_discussion', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (10, 2, 'forum', 'remove_own_discussion', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (11, 2, 'forum', 'add_comment', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (12, 2, 'forum', 'edit_comment', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (13, 2, 'forum', 'edit_own_comment', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (14, 2, 'forum', 'remove_comment', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (15, 2, 'forum', 'remove_own_comment', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (16, 2, 'forum', 'pin_discussion', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (17, 2, 'forum', 'close_discussion', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (18, 3, 'edit_member', 'edit', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (19, 3, 'edit_member', 'edit_own', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (20, 3, 'member_change_password', 'edit_own', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (21, 3, 'save_member', 'edit_own', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (22, 3, 'forum', 'start_discussion', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (23, 3, 'forum', 'edit_own_discussion', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (24, 3, 'forum', 'add_comment', 'yes');
INSERT INTO `tbl_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `allow`) VALUES (25, 3, 'forum', 'edit_own_comment', 'yes');

-- *** DATA: `tbl_members_roles_forbidden_pages` ***
INSERT INTO `tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (1, 1, 13);
INSERT INTO `tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (2, 1, 10);
INSERT INTO `tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (3, 1, 6);
INSERT INTO `tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (4, 1, 5);
INSERT INTO `tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (5, 1, 2);
INSERT INTO `tbl_members_roles_forbidden_pages` (`id`, `role_id`, `page_id`) VALUES (6, 1, 4);
