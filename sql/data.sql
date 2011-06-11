
-- *** STRUCTURE: `sym_cache` ***
DROP TABLE IF EXISTS `sym_cache`;
CREATE TABLE `sym_cache` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `creation` int(14) NOT NULL DEFAULT '0',
  `expiry` int(14) unsigned DEFAULT NULL,
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `expiry` (`expiry`),
  KEY `hash` (`hash`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** STRUCTURE: `sym_entries` ***
DROP TABLE IF EXISTS `sym_entries`;
CREATE TABLE `sym_entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `section_id` int(11) unsigned NOT NULL,
  `author_id` int(11) unsigned NOT NULL,
  `creation_date` datetime NOT NULL,
  `creation_date_gmt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `section_id` (`section_id`),
  KEY `author_id` (`author_id`),
  KEY `creation_date` (`creation_date`),
  KEY `creation_date_gmt` (`creation_date_gmt`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_entries` ***

-- *** STRUCTURE: `sym_entries_data_1` ***
DROP TABLE IF EXISTS `sym_entries_data_1`;
CREATE TABLE `sym_entries_data_1` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_1` ***

-- *** STRUCTURE: `sym_entries_data_10` ***
DROP TABLE IF EXISTS `sym_entries_data_10`;
CREATE TABLE `sym_entries_data_10` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_10` ***

-- *** STRUCTURE: `sym_entries_data_11` ***
DROP TABLE IF EXISTS `sym_entries_data_11`;
CREATE TABLE `sym_entries_data_11` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_11` ***

-- *** STRUCTURE: `sym_entries_data_12` ***
DROP TABLE IF EXISTS `sym_entries_data_12`;
CREATE TABLE `sym_entries_data_12` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_12` ***

-- *** STRUCTURE: `sym_entries_data_13` ***
DROP TABLE IF EXISTS `sym_entries_data_13`;
CREATE TABLE `sym_entries_data_13` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_13` ***

-- *** STRUCTURE: `sym_entries_data_14` ***
DROP TABLE IF EXISTS `sym_entries_data_14`;
CREATE TABLE `sym_entries_data_14` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_14` ***

-- *** STRUCTURE: `sym_entries_data_15` ***
DROP TABLE IF EXISTS `sym_entries_data_15`;
CREATE TABLE `sym_entries_data_15` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_15` ***

-- *** STRUCTURE: `sym_entries_data_16` ***
DROP TABLE IF EXISTS `sym_entries_data_16`;
CREATE TABLE `sym_entries_data_16` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_16` ***

-- *** STRUCTURE: `sym_entries_data_17` ***
DROP TABLE IF EXISTS `sym_entries_data_17`;
CREATE TABLE `sym_entries_data_17` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_17` ***

-- *** STRUCTURE: `sym_entries_data_18` ***
DROP TABLE IF EXISTS `sym_entries_data_18`;
CREATE TABLE `sym_entries_data_18` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` enum('yes','no') NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_18` ***

-- *** STRUCTURE: `sym_entries_data_19` ***
DROP TABLE IF EXISTS `sym_entries_data_19`;
CREATE TABLE `sym_entries_data_19` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` text,
  `value_formatted` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  FULLTEXT KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_19` ***

-- *** STRUCTURE: `sym_entries_data_2` ***
DROP TABLE IF EXISTS `sym_entries_data_2`;
CREATE TABLE `sym_entries_data_2` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`value`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_2` ***

-- *** STRUCTURE: `sym_entries_data_20` ***
DROP TABLE IF EXISTS `sym_entries_data_20`;
CREATE TABLE `sym_entries_data_20` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_20` ***

-- *** STRUCTURE: `sym_entries_data_21` ***
DROP TABLE IF EXISTS `sym_entries_data_21`;
CREATE TABLE `sym_entries_data_21` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(80) DEFAULT NULL,
  `local` int(11) DEFAULT NULL,
  `gmt` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_21` ***

-- *** STRUCTURE: `sym_entries_data_22` ***
DROP TABLE IF EXISTS `sym_entries_data_22`;
CREATE TABLE `sym_entries_data_22` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `relation_id` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `relation_id` (`relation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_22` ***

-- *** STRUCTURE: `sym_entries_data_3` ***
DROP TABLE IF EXISTS `sym_entries_data_3`;
CREATE TABLE `sym_entries_data_3` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `password` varchar(40) DEFAULT NULL,
  `recovery-code` varchar(40) DEFAULT NULL,
  `length` tinyint(2) NOT NULL,
  `strength` enum('weak','good','strong') NOT NULL,
  `reset` enum('yes','no') DEFAULT 'no',
  `expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recovery-code` (`recovery-code`),
  KEY `entry_id` (`entry_id`),
  KEY `length` (`length`),
  KEY `password` (`password`),
  KEY `expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_3` ***

-- *** STRUCTURE: `sym_entries_data_4` ***
DROP TABLE IF EXISTS `sym_entries_data_4`;
CREATE TABLE `sym_entries_data_4` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`value`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_4` ***

-- *** STRUCTURE: `sym_entries_data_5` ***
DROP TABLE IF EXISTS `sym_entries_data_5`;
CREATE TABLE `sym_entries_data_5` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `role_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_5` ***

-- *** STRUCTURE: `sym_entries_data_6` ***
DROP TABLE IF EXISTS `sym_entries_data_6`;
CREATE TABLE `sym_entries_data_6` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `activated` enum('yes','no') NOT NULL DEFAULT 'no',
  `timestamp` datetime DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `entry_id` (`entry_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_6` ***

-- *** STRUCTURE: `sym_entries_data_7` ***
DROP TABLE IF EXISTS `sym_entries_data_7`;
CREATE TABLE `sym_entries_data_7` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_7` ***

-- *** STRUCTURE: `sym_entries_data_8` ***
DROP TABLE IF EXISTS `sym_entries_data_8`;
CREATE TABLE `sym_entries_data_8` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_8` ***

-- *** STRUCTURE: `sym_entries_data_9` ***
DROP TABLE IF EXISTS `sym_entries_data_9`;
CREATE TABLE `sym_entries_data_9` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `handle` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`),
  KEY `handle` (`handle`),
  KEY `value` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_entries_data_9` ***

-- *** STRUCTURE: `sym_extensions` ***
DROP TABLE IF EXISTS `sym_extensions`;
CREATE TABLE `sym_extensions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
  `version` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_extensions` ***
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (1, 'xssfilter', 'enabled', 1.0);
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (2, 'debugdevkit', 'enabled', 1.1);
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (3, 'export_ensemble', 'enabled', 1.15);
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (4, 'selectbox_link_field', 'enabled', 1.19);
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (5, 'jit_image_manipulation', 'enabled', 1.10);
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (6, 'maintenance_mode', 'enabled', 1.4);
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (7, 'profiledevkit', 'enabled', '1.0.4');
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (8, 'markdown', 'enabled', 1.13);
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (9, 'asdc', 'enabled', 1.3);
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (10, 'content_type_mappings', 'enabled', 1.3);
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (11, 'numberfield', 'enabled', 1.4);
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (12, 'forum', 'enabled', '2.0 Alpha');
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (13, 'members', 'enabled', 1.0);
INSERT INTO `sym_extensions` (`id`, `name`, `status`, `version`) VALUES (14, 'dump_db', 'enabled', 1.08);

-- *** STRUCTURE: `sym_extensions_delegates` ***
DROP TABLE IF EXISTS `sym_extensions_delegates`;
CREATE TABLE `sym_extensions_delegates` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `extension_id` int(11) NOT NULL,
  `page` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `delegate` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `callback` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `extension_id` (`extension_id`),
  KEY `page` (`page`),
  KEY `delegate` (`delegate`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_extensions_delegates` ***
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (1, 1, '/blueprints/events/new/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (2, 1, '/blueprints/events/edit/', 'AppendEventFilter', 'appendEventFilter');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (3, 1, '/frontend/', 'EventPreSaveFilter', 'eventPreSaveFilter');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (4, 2, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (5, 2, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (6, 3, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (7, 5, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (8, 5, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (9, 6, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (10, 6, '/system/preferences/', 'Save', '__SavePreferences');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (11, 6, '/system/preferences/', 'CustomActions', '__toggleMaintenanceMode');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (12, 6, '/backend/', 'AppendPageAlert', '__appendAlert');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (13, 6, '/blueprints/pages/', 'AppendPageContent', '__appendType');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (14, 6, '/frontend/', 'FrontendPrePageResolve', '__checkForMaintenanceMode');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (15, 6, '/frontend/', 'FrontendParamsResolve', '__addParam');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (16, 7, '/frontend/', 'FrontendDevKitResolve', 'frontendDevKitResolve');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (17, 7, '/frontend/', 'ManipulateDevKitNavigation', 'manipulateDevKitNavigation');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (18, 10, '/frontend/', 'FrontendPreRenderHeaders', 'setContentType');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (19, 12, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (20, 13, '/frontend/', 'FrontendPageResolved', 'checkFrontendPagePermissions');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (21, 13, '/frontend/', 'FrontendParamsResolve', 'addMemberDetailsToPageParams');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (22, 13, '/frontend/', 'FrontendProcessEvents', 'appendLoginStatusToEventXML');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (23, 13, '/frontend/', 'EventPreSaveFilter', 'checkEventPermissions');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (24, 13, '/frontend/', 'EventPostSaveFilter', 'processPostSaveFilter');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (25, 13, '/backend/', 'AdminPagePreGenerate', 'appendAssets');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (26, 13, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (27, 13, '/system/preferences/', 'Save', 'savePreferences');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (28, 13, '/blueprints/events/new/', 'AppendEventFilter', 'appendFilter');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (29, 13, '/blueprints/events/edit/', 'AppendEventFilter', 'appendFilter');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (30, 14, '/system/preferences/', 'AddCustomPreferenceFieldsets', 'appendPreferences');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (31, 14, '/backend/', 'InitaliseAdminPageHead', 'initaliseAdminPageHead');
INSERT INTO `sym_extensions_delegates` (`id`, `extension_id`, `page`, `delegate`, `callback`) VALUES (32, 14, '/backend/', 'AppendPageAlert', 'appendAlert');

-- *** STRUCTURE: `sym_fields` ***
DROP TABLE IF EXISTS `sym_fields`;
CREATE TABLE `sym_fields` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `element_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `parent_section` int(11) NOT NULL DEFAULT '0',
  `required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `sortorder` int(11) NOT NULL DEFAULT '1',
  `location` enum('main','sidebar') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'main',
  `show_column` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `index` (`element_name`,`type`,`parent_section`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_fields` ***
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (1, 'Name', 'name', 'input', 1, 'yes', 0, 'main', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (2, 'Username', 'username', 'memberusername', 1, 'yes', 1, 'main', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (3, 'Password', 'password', 'memberpassword', 1, 'yes', 2, 'main', 'no');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (4, 'Email', 'email', 'memberemail', 1, 'yes', 3, 'main', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (5, 'Role', 'role', 'memberrole', 1, 'yes', 4, 'sidebar', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (6, 'Activation', 'activation', 'memberactivation', 1, 'no', 5, 'sidebar', 'no');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (7, 'Website', 'website', 'input', 1, 'no', 6, 'main', 'no');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (8, 'Location', 'location', 'input', 1, 'no', 7, 'sidebar', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (9, 'City', 'city', 'input', 1, 'no', 8, 'sidebar', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (10, 'Timezone', 'timezone', 'membertimezone', 1, 'no', 9, 'sidebar', 'no');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (11, 'Email Opt-in', 'email-opt-in', 'checkbox', 1, 'no', 10, 'sidebar', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (12, 'Topic', 'topic', 'input', 2, 'yes', 0, 'main', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (13, 'Created By', 'created-by', 'selectbox_link', 2, 'yes', 1, 'main', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (14, 'Creation Date', 'creation-date', 'date', 2, 'no', 2, 'main', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (15, 'Last Post', 'last-post', 'selectbox_link', 2, 'yes', 3, 'main', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (16, 'Last Active', 'last-active', 'date', 2, 'no', 4, 'main', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (17, 'Pinned', 'pinned', 'checkbox', 2, 'no', 5, 'sidebar', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (18, 'Closed', 'closed', 'checkbox', 2, 'no', 6, 'sidebar', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (19, 'Comment', 'comment', 'textarea', 3, 'yes', 0, 'main', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (20, 'Parent ID', 'parent-id', 'selectbox_link', 3, 'yes', 1, 'sidebar', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (21, 'Date', 'date', 'date', 3, 'no', 2, 'sidebar', 'yes');
INSERT INTO `sym_fields` (`id`, `label`, `element_name`, `type`, `parent_section`, `required`, `sortorder`, `location`, `show_column`) VALUES (22, 'Created By', 'created-by', 'selectbox_link', 3, 'yes', 3, 'sidebar', 'yes');

-- *** STRUCTURE: `sym_fields_author` ***
DROP TABLE IF EXISTS `sym_fields_author`;
CREATE TABLE `sym_fields_author` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_author_change` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `default_to_current_user` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_fields_author` ***

-- *** STRUCTURE: `sym_fields_checkbox` ***
DROP TABLE IF EXISTS `sym_fields_checkbox`;
CREATE TABLE `sym_fields_checkbox` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_state` enum('on','off') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'on',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_fields_checkbox` ***
INSERT INTO `sym_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (2, 11, 'off', 'Send me email when there is important news.');
INSERT INTO `sym_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (3, 17, 'off', 'Pin discussion');
INSERT INTO `sym_fields_checkbox` (`id`, `field_id`, `default_state`, `description`) VALUES (4, 18, 'off', 'Close this discussion');

-- *** STRUCTURE: `sym_fields_date` ***
DROP TABLE IF EXISTS `sym_fields_date`;
CREATE TABLE `sym_fields_date` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `pre_populate` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_fields_date` ***
INSERT INTO `sym_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (1, 14, 'yes');
INSERT INTO `sym_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (2, 16, 'yes');
INSERT INTO `sym_fields_date` (`id`, `field_id`, `pre_populate`) VALUES (3, 21, 'yes');

-- *** STRUCTURE: `sym_fields_input` ***
DROP TABLE IF EXISTS `sym_fields_input`;
CREATE TABLE `sym_fields_input` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_fields_input` ***
INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`) VALUES (5, 1, NULL);
INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`) VALUES (6, 7, '/^[^\\s:\\/?#]+:(?:\\/{2,3})?[^\\s.\\/?#]+(?:\\.[^\\s.\\/?#]+)*(?:\\/[^\\s?#]*\\??[^\\s?#]*(#[^\\s#]*)?)?$/');
INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`) VALUES (7, 8, NULL);
INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`) VALUES (8, 9, NULL);
INSERT INTO `sym_fields_input` (`id`, `field_id`, `validator`) VALUES (9, 12, NULL);

-- *** STRUCTURE: `sym_fields_memberactivation` ***
DROP TABLE IF EXISTS `sym_fields_memberactivation`;
CREATE TABLE `sym_fields_memberactivation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `code_expiry` varchar(50) NOT NULL,
  `activation_role_id` int(11) unsigned NOT NULL,
  `deny_login` enum('yes','no') NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- *** DATA: `sym_fields_memberactivation` ***
INSERT INTO `sym_fields_memberactivation` (`id`, `field_id`, `code_expiry`, `activation_role_id`, `deny_login`) VALUES (2, 6, '1 hour', 1, 'no');

-- *** STRUCTURE: `sym_fields_memberemail` ***
DROP TABLE IF EXISTS `sym_fields_memberemail`;
CREATE TABLE `sym_fields_memberemail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- *** DATA: `sym_fields_memberemail` ***
INSERT INTO `sym_fields_memberemail` (`id`, `field_id`) VALUES (2, 4);

-- *** STRUCTURE: `sym_fields_memberpassword` ***
DROP TABLE IF EXISTS `sym_fields_memberpassword`;
CREATE TABLE `sym_fields_memberpassword` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `length` tinyint(2) NOT NULL,
  `strength` enum('weak','good','strong') NOT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `code_expiry` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- *** DATA: `sym_fields_memberpassword` ***
INSERT INTO `sym_fields_memberpassword` (`id`, `field_id`, `length`, `strength`, `salt`, `code_expiry`) VALUES (2, 3, 6, 'good', 'LXPj5GAJi6fWLY1K', '1 hour');

-- *** STRUCTURE: `sym_fields_memberrole` ***
DROP TABLE IF EXISTS `sym_fields_memberrole`;
CREATE TABLE `sym_fields_memberrole` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `default_role` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- *** DATA: `sym_fields_memberrole` ***
INSERT INTO `sym_fields_memberrole` (`id`, `field_id`, `default_role`) VALUES (2, 5, 1);

-- *** STRUCTURE: `sym_fields_membertimezone` ***
DROP TABLE IF EXISTS `sym_fields_membertimezone`;
CREATE TABLE `sym_fields_membertimezone` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `available_zones` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- *** DATA: `sym_fields_membertimezone` ***
INSERT INTO `sym_fields_membertimezone` (`id`, `field_id`, `available_zones`) VALUES (2, 10, 'AFRICA,AMERICA,ANTARCTICA,ARCTIC,ASIA,ATLANTIC,AUSTRALIA,EUROPE,INDIAN,PACIFIC');

-- *** STRUCTURE: `sym_fields_memberusername` ***
DROP TABLE IF EXISTS `sym_fields_memberusername`;
CREATE TABLE `sym_fields_memberusername` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- *** DATA: `sym_fields_memberusername` ***
INSERT INTO `sym_fields_memberusername` (`id`, `field_id`, `validator`) VALUES (2, 2, NULL);

-- *** STRUCTURE: `sym_fields_number` ***
DROP TABLE IF EXISTS `sym_fields_number`;
CREATE TABLE `sym_fields_number` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_fields_number` ***

-- *** STRUCTURE: `sym_fields_select` ***
DROP TABLE IF EXISTS `sym_fields_select`;
CREATE TABLE `sym_fields_select` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `sort_options` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `static_options` text COLLATE utf8_unicode_ci,
  `dynamic_options` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_fields_select` ***

-- *** STRUCTURE: `sym_fields_selectbox_link` ***
DROP TABLE IF EXISTS `sym_fields_selectbox_link`;
CREATE TABLE `sym_fields_selectbox_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `allow_multiple_selection` enum('yes','no') NOT NULL DEFAULT 'no',
  `show_association` enum('yes','no') NOT NULL DEFAULT 'yes',
  `related_field_id` varchar(255) NOT NULL,
  `limit` int(4) unsigned NOT NULL DEFAULT '20',
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- *** DATA: `sym_fields_selectbox_link` ***
INSERT INTO `sym_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (1, 13, 'no', 'no', 2, 100);
INSERT INTO `sym_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (2, 15, 'no', 'no', 2, 100);
INSERT INTO `sym_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (3, 20, 'no', 'yes', 12, 20);
INSERT INTO `sym_fields_selectbox_link` (`id`, `field_id`, `allow_multiple_selection`, `show_association`, `related_field_id`, `limit`) VALUES (4, 22, 'no', 'no', 2, 100);

-- *** STRUCTURE: `sym_fields_taglist` ***
DROP TABLE IF EXISTS `sym_fields_taglist`;
CREATE TABLE `sym_fields_taglist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_populate_source` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `pre_populate_source` (`pre_populate_source`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_fields_taglist` ***

-- *** STRUCTURE: `sym_fields_textarea` ***
DROP TABLE IF EXISTS `sym_fields_textarea`;
CREATE TABLE `sym_fields_textarea` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `formatter` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` int(3) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_fields_textarea` ***
INSERT INTO `sym_fields_textarea` (`id`, `field_id`, `formatter`, `size`) VALUES (1, 19, 'markdown_with_purifier', 15);

-- *** STRUCTURE: `sym_fields_upload` ***
DROP TABLE IF EXISTS `sym_fields_upload`;
CREATE TABLE `sym_fields_upload` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `field_id` int(11) unsigned NOT NULL,
  `destination` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `validator` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_fields_upload` ***

-- *** STRUCTURE: `sym_forum_read_discussions` ***
DROP TABLE IF EXISTS `sym_forum_read_discussions`;
CREATE TABLE `sym_forum_read_discussions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `member_id` int(11) unsigned NOT NULL,
  `discussion_id` int(11) unsigned NOT NULL,
  `last_viewed` int(11) unsigned NOT NULL,
  `comments` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`,`discussion_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_forum_read_discussions` ***

-- *** STRUCTURE: `sym_members_roles` ***
DROP TABLE IF EXISTS `sym_members_roles`;
CREATE TABLE `sym_members_roles` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- *** DATA: `sym_members_roles` ***
INSERT INTO `sym_members_roles` (`id`, `name`, `handle`) VALUES (1, 'Public', 'public');
INSERT INTO `sym_members_roles` (`id`, `name`, `handle`) VALUES (2, 'Inactive', 'inactive');
INSERT INTO `sym_members_roles` (`id`, `name`, `handle`) VALUES (3, 'Member', 'member');
INSERT INTO `sym_members_roles` (`id`, `name`, `handle`) VALUES (4, 'Administrator', 'administrator');

-- *** STRUCTURE: `sym_members_roles_event_permissions` ***
DROP TABLE IF EXISTS `sym_members_roles_event_permissions`;
CREATE TABLE `sym_members_roles_event_permissions` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL,
  `event` varchar(50) NOT NULL,
  `action` varchar(60) NOT NULL,
  `level` smallint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`,`event`,`action`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- *** DATA: `sym_members_roles_event_permissions` ***
INSERT INTO `sym_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (1, 2, 'edit_member', 'edit', 0);
INSERT INTO `sym_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (2, 2, 'forum_post', 'edit', 0);
INSERT INTO `sym_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (3, 2, 'forum_utilities', 'edit', 0);
INSERT INTO `sym_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (4, 2, 'members_register', 'edit', 0);
INSERT INTO `sym_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (5, 2, 'members_update_password', 'edit', 0);
INSERT INTO `sym_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (6, 3, 'edit_member', 'edit', 0);
INSERT INTO `sym_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (7, 3, 'forum_post', 'edit', 0);
INSERT INTO `sym_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (8, 3, 'forum_utilities', 'edit', 0);
INSERT INTO `sym_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (9, 3, 'members_register', 'edit', 0);
INSERT INTO `sym_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (10, 3, 'members_update_password', 'edit', 0);
INSERT INTO `sym_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (11, 4, 'edit_member', 'edit', 0);
INSERT INTO `sym_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (12, 4, 'forum_post', 'edit', 0);
INSERT INTO `sym_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (13, 4, 'forum_utilities', 'edit', 0);
INSERT INTO `sym_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (14, 4, 'members_register', 'edit', 0);
INSERT INTO `sym_members_roles_event_permissions` (`id`, `role_id`, `event`, `action`, `level`) VALUES (15, 4, 'members_update_password', 'edit', 0);

-- *** STRUCTURE: `sym_members_roles_forbidden_pages` ***
DROP TABLE IF EXISTS `sym_members_roles_forbidden_pages`;
CREATE TABLE `sym_members_roles_forbidden_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(11) unsigned NOT NULL,
  `page_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`,`page_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- *** DATA: `sym_members_roles_forbidden_pages` ***

-- *** STRUCTURE: `sym_pages` ***
DROP TABLE IF EXISTS `sym_pages`;
CREATE TABLE `sym_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `params` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data_sources` text COLLATE utf8_unicode_ci,
  `events` text COLLATE utf8_unicode_ci,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_pages` ***

-- *** STRUCTURE: `sym_pages_types` ***
DROP TABLE IF EXISTS `sym_pages_types`;
CREATE TABLE `sym_pages_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `page_id` int(11) unsigned NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`,`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_pages_types` ***

-- *** STRUCTURE: `sym_sections` ***
DROP TABLE IF EXISTS `sym_sections`;
CREATE TABLE `sym_sections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` int(11) NOT NULL DEFAULT '0',
  `entry_order` varchar(7) COLLATE utf8_unicode_ci DEFAULT NULL,
  `entry_order_direction` enum('asc','desc') COLLATE utf8_unicode_ci DEFAULT 'asc',
  `hidden` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `navigation_group` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Content',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_sections` ***
INSERT INTO `sym_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (1, 'Members', 'members', 1, NULL, 'asc', 'no', 'Forum');
INSERT INTO `sym_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (2, 'Discussions', 'discussions', 2, NULL, 'asc', 'no', 'Forum');
INSERT INTO `sym_sections` (`id`, `name`, `handle`, `sortorder`, `entry_order`, `entry_order_direction`, `hidden`, `navigation_group`) VALUES (3, 'Comments', 'comments', 3, NULL, 'asc', 'no', 'Forum');

-- *** STRUCTURE: `sym_sections_association` ***
DROP TABLE IF EXISTS `sym_sections_association`;
CREATE TABLE `sym_sections_association` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_section_id` int(11) unsigned NOT NULL,
  `parent_section_field_id` int(11) unsigned DEFAULT NULL,
  `child_section_id` int(11) unsigned NOT NULL,
  `child_section_field_id` int(11) unsigned NOT NULL,
  `hide_association` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  PRIMARY KEY (`id`),
  KEY `parent_section_id` (`parent_section_id`,`child_section_id`,`child_section_field_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- *** DATA: `sym_sections_association` ***
INSERT INTO `sym_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (1, 1, 2, 2, 13, 'yes');
INSERT INTO `sym_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (2, 1, 2, 2, 15, 'yes');
INSERT INTO `sym_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (3, 2, 12, 3, 20, 'no');
INSERT INTO `sym_sections_association` (`id`, `parent_section_id`, `parent_section_field_id`, `child_section_id`, `child_section_field_id`, `hide_association`) VALUES (4, 1, 2, 3, 22, 'yes');
