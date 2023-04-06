-- Started: 2023-04-06 20:56:30
SET NAMES 'utf8';
-- -----------------------------------
-- Dumping table b_admin_notify
-- -----------------------------------
DROP TABLE IF EXISTS `b_admin_notify`;
CREATE TABLE `b_admin_notify` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `ENABLE_CLOSE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `PUBLIC_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NOTIFY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'M',
  PRIMARY KEY (`ID`),
  KEY `IX_AD_TAG` (`TAG`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_admin_notify_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_admin_notify_lang`;
CREATE TABLE `b_admin_notify_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NOTIFY_ID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_ADM_NTFY_LANG` (`NOTIFY_ID`,`LID`),
  KEY `IX_ADM_NTFY_LID` (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_agent
-- -----------------------------------
DROP TABLE IF EXISTS `b_agent`;
CREATE TABLE `b_agent` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `NAME` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LAST_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime NOT NULL,
  `DATE_CHECK` datetime DEFAULT NULL,
  `AGENT_INTERVAL` int(11) DEFAULT '86400',
  `IS_PERIOD` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `USER_ID` int(11) DEFAULT NULL,
  `RUNNING` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RETRY_COUNT` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_act_next_exec` (`ACTIVE`,`NEXT_EXEC`),
  KEY `ix_agent_user_id` (`USER_ID`),
  KEY `ix_agent_name` (`NAME`(100)),
  KEY `ix_agent_act_period_next_exec` (`ACTIVE`,`IS_PERIOD`,`NEXT_EXEC`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_agent` VALUES
(1, 'main', 100, '\\Bitrix\\Main\\Analytics\\CounterDataTable::submitData();', 'Y', '2023-05-14 01:37:36', '2023-05-14 01:38:36', NULL, 60, 'N', NULL, 'N', 0),
(2, 'main', 100, 'CCaptchaAgent::DeleteOldCaptcha(3600);', 'Y', '2023-05-14 01:37:36', '2023-05-14 02:37:36', NULL, 3600, 'N', NULL, 'N', 0),
(3, 'main', 100, 'CSiteCheckerTest::CommonTest();', 'Y', '2023-05-14 01:37:36', '2023-05-15 01:37:36', NULL, 86400, 'N', NULL, 'N', 0),
(4, 'main', 100, 'CEvent::CleanUpAgent();', 'Y', '2023-05-14 01:37:36', '2023-05-15 01:37:36', NULL, 86400, 'N', NULL, 'N', 0),
(5, 'main', 100, 'CUser::CleanUpHitAuthAgent();', 'Y', '2023-05-14 01:37:36', '2023-05-15 01:37:36', NULL, 86400, 'N', NULL, 'N', 0),
(6, 'main', 100, 'CUndo::CleanUpOld();', 'Y', '2023-05-14 01:37:36', '2023-05-15 01:37:36', NULL, 86400, 'N', NULL, 'N', 0),
(7, 'main', 100, 'CUserCounter::DeleteOld();', 'Y', '2023-05-14 01:37:36', '2023-05-15 01:37:36', NULL, 86400, 'N', NULL, 'N', 0),
(8, 'main', 100, '\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable::deleteOldAgent(22, 20);', 'Y', '2023-05-14 01:37:36', '2023-05-15 01:37:36', NULL, 86400, 'N', NULL, 'N', 0),
(9, 'main', 100, 'CUser::AuthActionsCleanUpAgent();', 'Y', '2023-05-14 01:37:36', '2023-05-15 01:37:36', NULL, 86400, 'N', NULL, 'N', 0),
(10, 'main', 100, 'CUser::CleanUpAgent();', 'Y', '2023-05-14 01:37:36', '2023-05-15 01:37:36', NULL, 86400, 'N', NULL, 'N', 0),
(11, 'main', 100, 'CUser::DeactivateAgent();', 'Y', '2023-05-14 01:37:36', '2023-05-15 01:37:36', NULL, 86400, 'N', NULL, 'N', 0),
(12, 'main', 100, 'CEventLog::CleanUpAgent();', 'Y', '2023-05-14 01:37:36', '2023-05-15 01:37:36', NULL, 86400, 'N', NULL, 'N', 0),
(14, 'landing', 100, 'Bitrix\\Landing\\Agent::clearRecycle();', 'Y', '2023-05-14 01:37:36', '2023-05-14 03:37:36', NULL, 7200, 'N', NULL, 'N', 0),
(15, 'landing', 100, 'Bitrix\\Landing\\Agent::clearFiles(30);', 'Y', '2023-05-14 01:37:36', '2023-05-14 02:37:36', NULL, 3600, 'N', NULL, 'N', 0),
(16, 'landing', 100, 'Bitrix\\Landing\\Agent::sendRestStatistic();', 'Y', '2023-05-14 01:37:36', '2023-05-15 01:37:36', NULL, 86400, 'N', NULL, 'N', 0),
(17, 'landing', 100, 'Bitrix\\Landing\\Agent::clearTempFiles();', 'Y', '2023-05-14 01:37:36', '2023-05-15 01:37:36', NULL, 86400, 'N', NULL, 'N', 0),
(18, 'messageservice', 100, '\\Bitrix\\MessageService\\Queue::cleanUpAgent();', 'Y', '2023-05-14 01:37:40', '2023-04-11 00:00:00', NULL, 86400, 'Y', NULL, 'N', 0),
(19, 'rest', 100, 'Bitrix\\Rest\\Marketplace\\Client::getNumUpdates();', 'Y', '2023-05-14 01:37:36', '2023-05-15 01:37:36', NULL, 86400, 'N', NULL, 'N', 0),
(20, 'rest', 100, '\\Bitrix\\Rest\\EventOfflineTable::cleanProcessAgent();', 'Y', '2023-05-14 01:37:36', '2023-05-15 01:37:36', NULL, 86400, 'N', NULL, 'N', 0),
(21, 'rest', 100, '\\Bitrix\\Rest\\LogTable::cleanUpAgent();', 'Y', '2023-05-14 01:37:36', '2023-05-15 01:37:36', NULL, 86400, 'N', NULL, 'N', 0),
(22, 'rest', 100, '\\Bitrix\\Rest\\Configuration\\Helper::sendStatisticAgent();', 'Y', '2023-05-14 01:37:36', '2023-05-15 01:37:36', NULL, 86400, 'N', NULL, 'N', 0),
(23, 'rest', 100, '\\Bitrix\\Rest\\UsageStatTable::sendAgent();', 'Y', '2023-05-14 01:37:36', '2023-05-14 02:37:36', NULL, 3600, 'N', NULL, 'N', 0),
(24, 'rest', 100, '\\Bitrix\\Rest\\UsageStatTable::cleanUpAgent();', 'Y', '2023-05-14 01:37:36', '2023-05-14 02:37:36', NULL, 3600, 'N', NULL, 'N', 0),
(25, 'rest', 100, '\\Bitrix\\Rest\\Marketplace\\Notification::checkAgent();', 'Y', '2023-05-14 01:37:36', '2023-05-15 01:37:36', NULL, 86400, 'N', NULL, 'N', 0),
(26, 'rest', 100, '\\Bitrix\\Rest\\Marketplace\\Immune::load();', 'Y', '2023-05-14 01:37:36', '2023-05-15 01:37:36', NULL, 86400, 'N', NULL, 'N', 0),
(27, 'rest', 100, '\\Bitrix\\Rest\\Configuration\\Structure::clearContentAgent();', 'Y', '2023-05-14 01:37:36', '2023-05-15 01:37:36', NULL, 86400, 'N', NULL, 'N', 0),
(28, 'rest', 100, '\\Bitrix\\Rest\\Helper::recoveryAgents();', 'Y', '2023-05-14 01:37:36', '2023-05-21 01:37:36', NULL, 604800, 'N', NULL, 'N', 0),
(38, 'messageservice', 100, '\\Bitrix\\MessageService\\IncomingMessage::cleanUpAgent();', 'Y', '2023-05-14 01:37:40', '2023-04-11 00:00:00', NULL, 86400, 'Y', NULL, 'N', 0),
(42, 'ui', 100, '\\Bitrix\\UI\\FileUploader\\TempFileAgent::clearOldRecords();', 'Y', '2023-05-14 01:37:36', '2023-05-14 02:07:36', NULL, 1800, 'N', NULL, 'N', 0);
-- -----------------------------------
-- Dumping table b_app_password
-- -----------------------------------
DROP TABLE IF EXISTS `b_app_password`;
CREATE TABLE `b_app_password` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DIGEST_PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SYSCOMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_app_password_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_b24connector_button_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_b24connector_button_site`;
CREATE TABLE `b_b24connector_button_site` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `BUTTON_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_BUTTON_ID` (`BUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_b24connector_buttons
-- -----------------------------------
DROP TABLE IF EXISTS `b_b24connector_buttons`;
CREATE TABLE `b_b24connector_buttons` (
  `ID` int(11) NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `ADD_DATE` datetime NOT NULL,
  `ADD_BY` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SCRIPT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_cache_tag
-- -----------------------------------
DROP TABLE IF EXISTS `b_cache_tag`;
CREATE TABLE `b_cache_tag` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CACHE_SALT` char(4) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RELATIVE_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAG` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_cache_tag_0` (`SITE_ID`,`CACHE_SALT`,`RELATIVE_PATH`(50)),
  KEY `ix_b_cache_tag_1` (`TAG`)
) ENGINE=InnoDB AUTO_INCREMENT=886 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_cache_tag` VALUES
(4, NULL, NULL, '0:1680802690', '**'),
(53, 's1', '/494', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(60, 's1', '/771', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(63, 's1', '/a67', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(70, 's1', '/e25', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(71, 's1', '/a67', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(72, 's1', '/001', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(73, 's1', '/906', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(74, 's1', '/e25', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(78, 's1', '/56a', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(84, 's1', '/d15', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(85, 's1', '/d15', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(86, 's1', '/35a', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(100, 's1', '/611', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(108, 's1', '/492', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(109, 's1', '/492', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(110, 's1', '/6f9', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(111, 's1', '/454', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(112, 's1', '/684', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(113, 's1', '/f2d', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(117, 's1', '/35a', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(141, 's1', '/c02', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(142, 's1', '/b0e', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(143, 's1', '/b41', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(144, 's1', '/e60', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(145, 's1', '/07c', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(147, 's1', '/b0e', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(150, 's1', '/67c', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(151, 's1', '/f30', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(176, 's1', '/054', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(177, 's1', '/2d3', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(178, 's1', '/f2d', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(181, 's1', '/054', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(184, 's1', '/519', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(185, 's1', '/519', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(192, 's1', '/f6d', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(193, 's1', '/054', '/s1/bitrix/menu.sections/06f', 'iblock_id_30'),
(209, 's1', '/9c6', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(211, 's1', '/0aa', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(213, 's1', '/04c', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(215, 's1', '/436', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(217, 's1', '/436', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(225, 's1', '/04c', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(228, 's1', '/a14', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(230, 's1', '/a14', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(232, 's1', '/b5d', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(234, 's1', '/00b', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(236, 's1', '/e75', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(238, 's1', '/e75', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(264, 's1', '/183', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(270, 's1', '/9c6', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(275, 's1', '/d71', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(281, 's1', '/779', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(322, 's1', '/512', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(325, 's1', '/01f', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(327, 's1', '/01f', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(333, 's1', '/6e4', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(336, 's1', '/779', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(369, 's1', '/59a', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(414, 's1', '/512', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(419, 's1', '/e9c', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(420, 's1', '/e9c', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(424, 's1', '/55a', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(433, 's1', '/2ee', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(434, 's1', '/fb5', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(436, 's1', '/fb5', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(448, 's1', '/a26', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(449, 's1', '/a26', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(454, 's1', '/d71', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(463, 's1', '/6e4', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(521, 's1', '/9ef', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(528, 's1', '/343', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(530, 's1', '/343', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(686, 's1', '/208', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(693, 's1', '/dd7', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(746, 's1', '/daa', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(749, 's1', '/daa', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(757, 's1', '/2d3', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(761, 's1', '/196', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(764, 's1', '/196', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(768, 's1', '/107', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(770, 's1', '/107', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(777, 's1', '/867', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(780, 's1', '/7e4', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(782, 's1', '/7e4', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(790, 's1', '/7df', '533502770b7f91e3fd80d10ffb035804', 'SocialNetwork'),
(792, 's1', '/7df', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(803, 's1', '/350', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(805, 's1', '/a32', '/s1/bitrix/menu/06f', 'bitrix:menu'),
(866, 's1', '/512', '/s1/bitrix/menu.sections/06f', 'iblock_id_1'),
(867, 's1', '/512', 'a3149992a8ca1a03cfa70338273a0ee6', 'iblock_id_1'),
(868, 's1', '/512', 'b1e5108a6b2d6ac651e2365476fb08cc', 'iblock_id_1'),
(869, 's1', '/512', 'd6b2801070013abc951cb25527b9cad5', 'iblock_id_1'),
(870, 's1', '/512', '7a554aa696eb99b34c3f32d31644caa6', 'iblock_id_1'),
(871, 's1', '/f2d', 'd6b2801070013abc951cb25527b9cad5', 'iblock_id_1'),
(872, 's1', '/e25', '/s1/bitrix/menu.sections/06f', 'iblock_id_1'),
(873, 's1', '/e25', '6d88d2da3ea001864f5c28cf027ab1d1', 'iblock_id_1'),
(874, 's1', '/e25', '60c5f26bf5b59dd1aa8ab0a9d636d246', 'iblock_id_1'),
(875, 's1', '/e25', 'd6b2801070013abc951cb25527b9cad5', 'iblock_id_1'),
(876, 's1', '/e25', '7a554aa696eb99b34c3f32d31644caa6', 'iblock_id_1'),
(877, 's1', '/35a', 'd6b2801070013abc951cb25527b9cad5', 'iblock_id_1');
-- -----------------------------------
-- Dumping table b_captcha
-- -----------------------------------
DROP TABLE IF EXISTS `b_captcha`;
CREATE TABLE `b_captcha` (
  `ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  UNIQUE KEY `UX_B_CAPTCHA` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_captcha` VALUES
('01bbd2ed3f0c38a7c45f3efba2f2e0e4', 'J997E', '172.18.0.1', '2023-04-06 07:21:10'),
('053ba1f9f53f2bdcf743a697db8d9bf7', 'NH2CJ', '172.18.0.1', '2023-04-06 07:05:07'),
('086cb786d996ac6229dbdf4ee2b67cb4', 'MW9MR', '172.18.0.1', '2023-04-06 07:14:31'),
('0b3031a03e5db2b3fd54164742da506d', '37DGB', '172.18.0.1', '2023-04-06 07:04:43');
-- -----------------------------------
-- Dumping table b_checklist
-- -----------------------------------
DROP TABLE IF EXISTS `b_checklist`;
CREATE TABLE `b_checklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_CREATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TESTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMPANY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `SUCCESS` int(11) DEFAULT NULL,
  `FAILED` int(11) DEFAULT NULL,
  `PENDING` int(11) DEFAULT NULL,
  `SKIP` int(11) DEFAULT NULL,
  `STATE` longtext COLLATE utf8_unicode_ci,
  `REPORT_COMMENT` text COLLATE utf8_unicode_ci,
  `REPORT` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `EMAIL` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PHONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SENDED_TO_BITRIX` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_component_params
-- -----------------------------------
DROP TABLE IF EXISTS `b_component_params`;
CREATE TABLE `b_component_params` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `COMPONENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TEMPLATE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REAL_PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SEF_MODE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SEF_FOLDER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `START_CHAR` int(11) NOT NULL,
  `END_CHAR` int(11) NOT NULL,
  `PARAMETERS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_comp_params_name` (`COMPONENT_NAME`),
  KEY `ix_comp_params_path` (`SITE_ID`,`REAL_PATH`),
  KEY `ix_comp_params_sname` (`SITE_ID`,`COMPONENT_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_component_params` VALUES
(34, 's1', 'project:social', 'header', '/local/templates/main/header.php', 'N', NULL, 1535, 1790, 'a:2:{s:10:\"CACHE_TIME\";s:4:\"3600\";s:10:\"CACHE_TYPE\";s:1:\"A\";}'),
(35, 's1', 'bitrix:menu', 'header_top', '/local/templates/main/header.php', 'N', NULL, 2707, 3263, 'a:11:{s:18:\"ALLOW_MULTI_SELECT\";s:1:\"N\";s:15:\"CHILD_MENU_TYPE\";s:4:\"left\";s:5:\"DELAY\";s:1:\"N\";s:9:\"MAX_LEVEL\";s:1:\"2\";s:19:\"MENU_CACHE_GET_VARS\";N;s:15:\"MENU_CACHE_TIME\";s:4:\"3600\";s:15:\"MENU_CACHE_TYPE\";s:1:\"A\";s:21:\"MENU_CACHE_USE_GROUPS\";s:1:\"Y\";s:14:\"ROOT_MENU_TYPE\";s:3:\"top\";s:7:\"USE_EXT\";s:1:\"Y\";s:18:\"COMPONENT_TEMPLATE\";s:10:\"header_top\";}'),
(36, 's1', 'project:main.slider', 'mainpage', '/local/templates/main/header.php', 'N', NULL, 3284, 3657, 'a:10:{s:18:\"COMPONENT_TEMPLATE\";s:8:\"mainpage\";s:11:\"IBLOCK_TYPE\";s:4:\"blog\";s:11:\"IBLOCK_CODE\";s:5:\"Posts\";s:5:\"COUNT\";s:1:\"8\";s:11:\"SORT_FIELD1\";s:4:\"SORT\";s:15:\"SORT_DIRECTION1\";s:3:\"ASC\";s:11:\"SORT_FIELD2\";s:12:\"SHOW_COUNTER\";s:15:\"SORT_DIRECTION2\";s:3:\"ASC\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:10:\"CACHE_TIME\";s:4:\"3600\";}'),
(58, 's1', 'project:blog', 'blog', '/categories/index.php', 'Y', '/categories/', 142, 765, 'a:16:{s:18:\"COMPONENT_TEMPLATE\";s:4:\"blog\";s:11:\"IBLOCK_TYPE\";s:4:\"blog\";s:11:\"IBLOCK_CODE\";s:5:\"Posts\";s:11:\"SORT_FIELD1\";s:11:\"ACTIVE_FROM\";s:15:\"SORT_DIRECTION1\";s:4:\"DESC\";s:11:\"SORT_FIELD2\";s:4:\"SORT\";s:15:\"SORT_DIRECTION2\";s:3:\"ASC\";s:5:\"COUNT\";s:1:\"6\";s:8:\"SHOW_NAV\";s:1:\"Y\";s:8:\"SEF_MODE\";s:1:\"Y\";s:10:\"SEF_FOLDER\";s:12:\"/categories/\";s:4:\"AJAX\";s:1:\"Y\";s:8:\"AJAX_KEY\";s:4:\"AJAX\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:10:\"CACHE_TIME\";s:4:\"3600\";s:17:\"SEF_URL_TEMPLATES\";a:3:{s:5:\"index\";s:9:\"index.php\";s:7:\"section\";s:15:\"#SECTION_CODE#/\";s:6:\"detail\";s:30:\"#SECTION_CODE#/#ELEMENT_CODE#/\";}}'),
(67, 's1', 'bitrix:main.feedback', '.default', '/contact/index.php', 'N', NULL, 99, 419, 'a:6:{s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:8:\"EMAIL_TO\";s:12:\"my@email.com\";s:16:\"EVENT_MESSAGE_ID\";a:1:{i:0;s:1:\"7\";}s:7:\"OK_TEXT\";s:59:\"Спасибо, ваше сообщение принято.\";s:15:\"REQUIRED_FIELDS\";a:2:{i:0;s:4:\"NAME\";i:1;s:5:\"EMAIL\";}s:11:\"USE_CAPTCHA\";s:1:\"N\";}'),
(72, 's1', 'project:blog.element.list', 'mainpage', '/index.php', 'N', NULL, 130, 813, 'a:19:{s:10:\"CACHE_TIME\";s:4:\"3600\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:18:\"COMPONENT_TEMPLATE\";s:8:\"mainpage\";s:5:\"COUNT\";s:1:\"6\";s:11:\"IBLOCK_CODE\";s:5:\"Posts\";s:11:\"IBLOCK_TYPE\";s:4:\"blog\";s:12:\"SECTION_CODE\";s:9:\"lifestyle\";s:8:\"SHOW_NAV\";s:1:\"Y\";s:15:\"SORT_DIRECTION1\";s:3:\"ASC\";s:15:\"SORT_DIRECTION2\";s:3:\"ASC\";s:11:\"SORT_FIELD1\";s:11:\"ACTIVE_FROM\";s:11:\"SORT_FIELD2\";s:4:\"SORT\";s:14:\"PAGER_TEMPLATE\";s:12:\"project.main\";s:17:\"DISPLAY_TOP_PAGER\";s:1:\"N\";s:20:\"DISPLAY_BOTTOM_PAGER\";s:1:\"N\";s:11:\"PAGER_TITLE\";s:18:\"Навигация\";s:17:\"PAGER_SHOW_ALWAYS\";s:1:\"N\";s:20:\"PAGER_DESC_NUMBERING\";s:1:\"N\";s:31:\"PAGER_DESC_NUMBERING_CACHE_TIME\";s:5:\"36000\";}'),
(73, 's1', 'bitrix:main.include', '.default', '/index.php', 'N', NULL, 818, 1087, 'a:5:{s:14:\"AREA_FILE_SHOW\";s:4:\"file\";s:16:\"AREA_FILE_SUFFIX\";s:3:\"inc\";s:13:\"EDIT_TEMPLATE\";s:0:\"\";s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:4:\"PATH\";s:38:\"/local/include_areas/templates/bio.php\";}'),
(74, 's1', 'bitrix:main.include', '.default', '/local/templates/main/footer.php', 'N', NULL, 661, 930, 'a:5:{s:14:\"AREA_FILE_SHOW\";s:4:\"file\";s:16:\"AREA_FILE_SUFFIX\";s:3:\"inc\";s:13:\"EDIT_TEMPLATE\";s:0:\"\";s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:4:\"PATH\";s:38:\"/local/include_areas/template/foto.php\";}'),
(75, 's1', 'bitrix:main.include', '.default', '/local/templates/main/footer.php', 'N', NULL, 1086, 1570, 'a:5:{s:14:\"AREA_FILE_SHOW\";s:4:\"file\";s:16:\"AREA_FILE_SUFFIX\";s:3:\"inc\";s:13:\"EDIT_TEMPLATE\";s:0:\"\";s:18:\"COMPONENT_TEMPLATE\";s:8:\".default\";s:4:\"PATH\";s:37:\"/local/include_areas/template/bio.php\";}'),
(76, 's1', 'project:social', 'sidebar', '/local/templates/main/footer.php', 'N', NULL, 1596, 1938, 'a:3:{s:10:\"CACHE_TIME\";s:4:\"3600\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:18:\"COMPONENT_TEMPLATE\";s:7:\"sidebar\";}'),
(77, 's1', 'project:blog.element.list', 'popular.posts', '/local/templates/main/footer.php', 'N', NULL, 2002, 2591, 'a:12:{s:18:\"COMPONENT_TEMPLATE\";s:13:\"popular.posts\";s:11:\"IBLOCK_TYPE\";s:4:\"blog\";s:11:\"IBLOCK_CODE\";s:5:\"Posts\";s:5:\"COUNT\";s:1:\"3\";s:11:\"SORT_FIELD1\";s:12:\"SHOW_COUNTER\";s:15:\"SORT_DIRECTION1\";s:4:\"DESC\";s:11:\"SORT_FIELD2\";s:4:\"SORT\";s:15:\"SORT_DIRECTION2\";s:4:\"DESC\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:10:\"CACHE_TIME\";s:4:\"3600\";s:12:\"SECTION_CODE\";s:0:\"\";s:8:\"SHOW_NAV\";s:1:\"N\";}'),
(78, 's1', 'project:blog.section.list', 'sidebar.list', '/local/templates/main/footer.php', 'N', NULL, 2610, 3132, 'a:10:{s:18:\"COMPONENT_TEMPLATE\";s:12:\"sidebar.list\";s:11:\"IBLOCK_TYPE\";s:4:\"blog\";s:11:\"IBLOCK_CODE\";s:5:\"Posts\";s:5:\"COUNT\";s:1:\"5\";s:11:\"SORT_FIELD1\";s:12:\"SHOW_COUNTER\";s:15:\"SORT_DIRECTION1\";s:4:\"DESC\";s:11:\"SORT_FIELD2\";s:4:\"SORT\";s:15:\"SORT_DIRECTION2\";s:4:\"DESC\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:10:\"CACHE_TIME\";s:4:\"3600\";}'),
(80, 's1', 'project:social', 'sidebar', '/local/include_areas/template/bio.php', 'N', NULL, 555, 716, 'a:3:{s:10:\"CACHE_TIME\";s:4:\"3600\";s:10:\"CACHE_TYPE\";s:1:\"A\";s:18:\"COMPONENT_TEMPLATE\";s:7:\"sidebar\";}');
-- -----------------------------------
-- Dumping table b_composite_log
-- -----------------------------------
DROP TABLE IF EXISTS `b_composite_log`;
CREATE TABLE `b_composite_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HOST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci,
  `AJAX` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `USER_ID` int(11) NOT NULL DEFAULT '0',
  `PAGE_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_B_COMPOSITE_LOG_PAGE_ID` (`PAGE_ID`),
  KEY `IX_B_COMPOSITE_LOG_HOST` (`HOST`),
  KEY `IX_B_COMPOSITE_LOG_TYPE` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_composite_page
-- -----------------------------------
DROP TABLE IF EXISTS `b_composite_page`;
CREATE TABLE `b_composite_page` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CACHE_KEY` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `HOST` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED` datetime NOT NULL,
  `CHANGED` datetime NOT NULL,
  `LAST_VIEWED` datetime NOT NULL,
  `VIEWS` int(11) NOT NULL DEFAULT '0',
  `REWRITES` int(11) NOT NULL DEFAULT '0',
  `SIZE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_B_COMPOSITE_PAGE_CACHE_KEY` (`CACHE_KEY`(100)),
  KEY `IX_B_COMPOSITE_PAGE_VIEWED` (`LAST_VIEWED`),
  KEY `IX_B_COMPOSITE_PAGE_HOST` (`HOST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_consent_agreement
-- -----------------------------------
DROP TABLE IF EXISTS `b_consent_agreement`;
CREATE TABLE `b_consent_agreement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_INSERT` datetime NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA_PROVIDER` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AGREEMENT_TEXT` longtext COLLATE utf8_unicode_ci,
  `LABEL_TEXT` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_CODE` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USE_URL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_AGREEMENT_TEXT_HTML` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_AGREEMENT_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_consent_field
-- -----------------------------------
DROP TABLE IF EXISTS `b_consent_field`;
CREATE TABLE `b_consent_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `AGREEMENT_ID` int(11) NOT NULL,
  `CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_FIELD_AG_ID` (`AGREEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_consent_user_consent
-- -----------------------------------
DROP TABLE IF EXISTS `b_consent_user_consent`;
CREATE TABLE `b_consent_user_consent` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `AGREEMENT_ID` int(11) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `IP` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(4000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGIN_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ORIGINATOR_ID` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_USER_CONSENT` (`AGREEMENT_ID`),
  KEY `IX_CONSENT_USER_CONSENT_USER_ORIGIN` (`USER_ID`,`ORIGIN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_consent_user_consent_item
-- -----------------------------------
DROP TABLE IF EXISTS `b_consent_user_consent_item`;
CREATE TABLE `b_consent_user_consent_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_CONSENT_ID` int(11) NOT NULL,
  `VALUE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CONSENT_USER_ITEM_AG_ID` (`USER_CONSENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_counter_data
-- -----------------------------------
DROP TABLE IF EXISTS `b_counter_data`;
CREATE TABLE `b_counter_data` (
  `ID` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_culture
-- -----------------------------------
DROP TABLE IF EXISTS `b_culture`;
CREATE TABLE `b_culture` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT '1',
  `CHARSET` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `SHORT_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'n/j/Y',
  `MEDIUM_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'M j, Y',
  `LONG_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'F j, Y',
  `FULL_DATE_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'l, F j, Y',
  `DAY_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'F j',
  `DAY_SHORT_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'M j',
  `DAY_OF_WEEK_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'l, F j',
  `SHORT_DAY_OF_WEEK_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'D, F j',
  `SHORT_DAY_OF_WEEK_SHORT_MONTH_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'D, M j',
  `SHORT_TIME_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'g:i a',
  `LONG_TIME_FORMAT` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'g:i:s a',
  `AM_VALUE` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'am',
  `PM_VALUE` varchar(20) COLLATE utf8_unicode_ci DEFAULT 'pm',
  `NUMBER_THOUSANDS_SEPARATOR` varchar(10) COLLATE utf8_unicode_ci DEFAULT ',',
  `NUMBER_DECIMAL_SEPARATOR` varchar(10) COLLATE utf8_unicode_ci DEFAULT '.',
  `NUMBER_DECIMALS` tinyint(4) DEFAULT '2',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_culture` VALUES
(1, 'ru', 'ru', 'DD.MM.YYYY', 'DD.MM.YYYY HH:MI:SS', '#NAME# #LAST_NAME#', 1, 'UTF-8', 'Y', 'd.m.Y', 'j M Y', 'j F Y', 'l, j F Y', 'j F', 'j M', 'l, j F', 'D, j F', 'D, j M', 'H:i', 'H:i:s', 'am', 'pm', ' ', ',', 2),
(2, 'en', 'en', 'MM/DD/YYYY', 'MM/DD/YYYY H:MI:SS T', '#NAME# #LAST_NAME#', 0, 'UTF-8', 'Y', 'n/j/Y', 'M j, Y', 'F j, Y', 'l, F j, Y', 'F j', 'M j', 'l, F j', 'D, F j', 'D, M j', 'g:i a', 'g:i:s a', 'am', 'pm', ',', '.', 2);
-- -----------------------------------
-- Dumping table b_entity_usage
-- -----------------------------------
DROP TABLE IF EXISTS `b_entity_usage`;
CREATE TABLE `b_entity_usage` (
  `USER_ID` int(11) NOT NULL,
  `CONTEXT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID_INT` int(11) NOT NULL DEFAULT '0',
  `PREFIX` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `LAST_USE_DATE` datetime NOT NULL,
  PRIMARY KEY (`USER_ID`,`CONTEXT`,`ENTITY_ID`,`ITEM_ID`),
  KEY `IX_ENTITY_USAGE_ITEM_ID_INT` (`ITEM_ID_INT`),
  KEY `IX_ENTITY_USAGE_LAST_USE_DATE` (`LAST_USE_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_event
-- -----------------------------------
DROP TABLE IF EXISTS `b_event`;
CREATE TABLE `b_event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` int(11) DEFAULT NULL,
  `LID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `C_FIELDS` longtext COLLATE utf8_unicode_ci,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DUPLICATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_success` (`SUCCESS_EXEC`),
  KEY `ix_b_event_date_exec` (`DATE_EXEC`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_event` VALUES
(1, 'NEW_DEVICE_LOGIN', NULL, 's1', 'a:14:{s:5:\"EMAIL\";s:30:\"a.kiselevich@digital-sector.ru\";s:5:\"LOGIN\";s:5:\"admin\";s:4:\"NAME\";s:14:\"Алексей\";s:9:\"LAST_NAME\";s:18:\"Киселевич\";s:6:\"DEVICE\";s:20:\"Неизвестно\";s:7:\"BROWSER\";s:0:\"\";s:8:\"PLATFORM\";s:0:\"\";s:10:\"USER_AGENT\";s:101:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36\";s:2:\"IP\";s:10:\"172.18.0.1\";s:4:\"DATE\";s:19:\"02.04.2023 05:28:29\";s:7:\"COUNTRY\";s:0:\"\";s:6:\"REGION\";s:0:\"\";s:4:\"CITY\";s:0:\"\";s:8:\"LOCATION\";s:0:\"\";}', '2023-04-02 05:28:29', '2023-04-02 05:28:30', 'Y', 'Y', 'ru'),
(2, 'FEEDBACK_FORM', 5, 's1', 'a:4:{s:6:\"AUTHOR\";s:33:\"Алексей Киселевич\";s:12:\"AUTHOR_EMAIL\";s:30:\"a.kiselevich@digital-sector.ru\";s:8:\"EMAIL_TO\";s:12:\"my@email.com\";s:4:\"TEXT\";s:5:\"21312\";}', '2023-04-06 05:44:49', '2023-04-06 05:44:54', 'F', 'N', 'ru'),
(3, 'FEEDBACK_FORM', 5, 's1', 'a:4:{s:6:\"AUTHOR\";s:33:\"Алексей Киселевич\";s:12:\"AUTHOR_EMAIL\";s:30:\"a.kiselevich@digital-sector.ru\";s:8:\"EMAIL_TO\";s:12:\"my@email.com\";s:4:\"TEXT\";s:15:\"asdasdasd  asd \";}', '2023-04-06 05:53:18', '2023-04-06 05:53:18', 'F', 'N', 'ru'),
(4, 'FEEDBACK_FORM', 5, 's1', 'a:4:{s:6:\"AUTHOR\";s:33:\"Алексей Киселевич\";s:12:\"AUTHOR_EMAIL\";s:30:\"a.kiselevich@digital-sector.ru\";s:8:\"EMAIL_TO\";s:12:\"my@email.com\";s:4:\"TEXT\";s:8:\"dgf fd g\";}', '2023-04-06 05:53:25', '2023-04-06 05:53:25', 'F', 'N', 'ru'),
(5, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:33:\"Алексей Киселевич\";s:12:\"AUTHOR_EMAIL\";s:30:\"a.kiselevich@digital-sector.ru\";s:8:\"EMAIL_TO\";s:12:\"my@email.com\";s:4:\"TEXT\";s:9:\"regrg reg\";}', '2023-04-06 05:54:19', '2023-04-06 05:54:20', 'Y', 'N', 'ru'),
(6, 'FEEDBACK_FORM', 7, 's1', 'a:4:{s:6:\"AUTHOR\";s:33:\"Алексей Киселевич\";s:12:\"AUTHOR_EMAIL\";s:30:\"a.kiselevich@digital-sector.ru\";s:8:\"EMAIL_TO\";s:12:\"my@email.com\";s:4:\"TEXT\";s:4:\"fdgg\";}', '2023-04-06 07:23:28', '2023-04-06 07:23:29', 'Y', 'N', 'ru'),
(7, 'FEEDBACK_FORM', 7, 's1', 'a:5:{s:6:\"AUTHOR\";s:3:\"weq\";s:12:\"AUTHOR_EMAIL\";s:29:\"kiselevich.alexey97@gmail.com\";s:8:\"EMAIL_TO\";s:12:\"my@email.com\";s:5:\"PHONE\";s:17:\"+7 (989) 230-6039\";s:4:\"TEXT\";s:8:\"12312312\";}', '2023-04-06 07:40:02', '2023-04-06 07:40:03', 'Y', 'N', 'ru'),
(8, 'FEEDBACK_FORM', 7, 's1', 'a:5:{s:6:\"AUTHOR\";s:33:\"Алексей Киселевич\";s:12:\"AUTHOR_EMAIL\";s:30:\"a.kiselevich@digital-sector.ru\";s:8:\"EMAIL_TO\";s:12:\"my@email.com\";s:5:\"PHONE\";s:18:\"+7 (213) 213-23-33\";s:4:\"TEXT\";s:10:\"fdsdfasdfd\";}', '2023-04-06 07:40:15', '2023-04-06 07:40:16', 'Y', 'N', 'ru'),
(9, 'FEEDBACK_FORM', 7, 's1', 'a:5:{s:6:\"AUTHOR\";s:33:\"Алексей Киселевич\";s:12:\"AUTHOR_EMAIL\";s:30:\"a.kiselevich@digital-sector.ru\";s:8:\"EMAIL_TO\";s:12:\"my@email.com\";s:5:\"PHONE\";s:0:\"\";s:4:\"TEXT\";s:7:\"89980as\";}', '2023-04-06 07:43:26', '2023-04-06 07:43:28', 'Y', 'N', 'ru'),
(10, 'FEEDBACK_FORM', 7, 's1', 'a:5:{s:6:\"AUTHOR\";s:5:\"asdas\";s:12:\"AUTHOR_EMAIL\";s:30:\"a.kiselevich@digital-sector.ru\";s:8:\"EMAIL_TO\";s:12:\"my@email.com\";s:5:\"PHONE\";s:5:\"asdas\";s:4:\"TEXT\";s:6:\"asdasd\";}', '2023-04-06 07:43:41', '2023-04-06 07:43:42', 'Y', 'N', 'ru'),
(11, 'FEEDBACK_FORM', 7, 's1', 'a:5:{s:6:\"AUTHOR\";s:3:\"weq\";s:12:\"AUTHOR_EMAIL\";s:30:\"a.kiselevich@digital-sector.ru\";s:8:\"EMAIL_TO\";s:12:\"my@email.com\";s:5:\"PHONE\";s:17:\"+7 (989) 230-6039\";s:4:\"TEXT\";s:5:\"21312\";}', '2023-04-06 08:23:29', '2023-04-06 08:23:30', 'Y', 'N', 'ru'),
(12, 'NEW_DEVICE_LOGIN', NULL, 's1', 'a:14:{s:5:\"EMAIL\";s:30:\"a.kiselevich@digital-sector.ru\";s:5:\"LOGIN\";s:5:\"admin\";s:4:\"NAME\";s:14:\"Алексей\";s:9:\"LAST_NAME\";s:18:\"Киселевич\";s:6:\"DEVICE\";s:20:\"Неизвестно\";s:7:\"BROWSER\";s:0:\"\";s:8:\"PLATFORM\";s:0:\"\";s:10:\"USER_AGENT\";s:101:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36\";s:2:\"IP\";s:10:\"172.19.0.1\";s:4:\"DATE\";s:19:\"06.04.2023 08:25:16\";s:7:\"COUNTRY\";s:0:\"\";s:6:\"REGION\";s:0:\"\";s:4:\"CITY\";s:0:\"\";s:8:\"LOCATION\";s:0:\"\";}', '2023-04-06 08:25:16', '2023-04-06 08:25:17', 'Y', 'Y', 'ru');
-- -----------------------------------
-- Dumping table b_event_attachment
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_attachment`;
CREATE TABLE `b_event_attachment` (
  `EVENT_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  `IS_FILE_COPIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  PRIMARY KEY (`EVENT_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_event_log
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_log`;
CREATE TABLE `b_event_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SEVERITY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `GUEST_ID` int(11) DEFAULT NULL,
  `DESCRIPTION` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_log_time` (`TIMESTAMP_X`),
  KEY `ix_b_event_log_audit_type_time` (`AUDIT_TYPE_ID`,`TIMESTAMP_X`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_event_log` VALUES
(23, '2023-05-07 01:37:23', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/bitrix/tools/public_session.php?k=e8a92e5a7be7b1f007ac8abe4723220d.1c09ec7f8dab8ffff625db360b8601fff2f3efd2575fc9edff9a8dc0014af977', 's1', NULL, NULL, ''),
(24, '2023-05-14 01:37:36', 'WARNING', 'SITE_CHECKER_ERROR', 'main', 'CSiteCheckerTest::CommonTest();', '-', '-', '/bitrix/tools/public_session.php?k=5c5383ea070e9b959c2167d31582c2e6.08fbe8014669deefa6faa5f80810927ee5080ae47c132bb7eb6b4a38009e892c', 's1', NULL, NULL, ''),
(25, '2023-04-02 05:28:46', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=en&site=s1&templateID=main&path=%2F&back_url=%2F%3Fback_url_admin%3D%252Fbitrix%252Fadmin%252F&siteTemplateId=main', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:12:\"new-page.php\";}'),
(26, '2023-04-02 18:58:25', 'UNKNOWN', 'MENU_ADD', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&new=Y&lang=en&site=s1&back_url=%2F%3Fbitrix_include_areas%3DY%26clear_cache%3DY&path=&name=top&siteTemplateId=main', NULL, 1, NULL, 'a:2:{s:9:\"menu_name\";N;s:4:\"path\";s:0:\"\";}'),
(27, '2023-04-02 19:16:22', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=en&site=s1&back_url=%2F%3Fbitrix_include_areas%3DN%26clear_cache%3DY&path=%2F&name=top&siteTemplateId=main', NULL, 1, NULL, 'a:2:{s:9:\"menu_name\";N;s:4:\"path\";s:0:\"\";}'),
(28, '2023-04-02 19:17:17', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=en&site=s1&templateID=main&newFolder=Y&path=%2F&back_url=%2Fcategories&siteTemplateId=main', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:20:\"categories/index.php\";}'),
(29, '2023-04-02 19:17:17', 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=en&site=s1&templateID=main&newFolder=Y&path=%2F&back_url=%2Fcategories&siteTemplateId=main', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:10:\"categories\";}'),
(30, '2023-04-02 19:33:47', 'UNKNOWN', 'MENU_ADD', 'fileman', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/fileman_menu_edit.php?', NULL, 1, NULL, 'a:2:{s:9:\"menu_name\";N;s:4:\"path\";s:0:\"\";}'),
(31, '2023-04-02 19:35:19', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=main&newFolder=Y&path=%2Fcategories%2F&back_url=%2Fcategories%2F&siteTemplateId=main', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:32:\"categoriesnovyy-razdel/index.php\";}'),
(32, '2023-04-02 19:35:19', 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=main&newFolder=Y&path=%2Fcategories%2F&back_url=%2Fcategories%2F&siteTemplateId=main', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:23:\"categories/novyy-razdel\";}'),
(33, '2023-04-02 19:35:19', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=main&newFolder=Y&path=%2Fcategories%2F&back_url=%2Fcategories%2F&siteTemplateId=main', NULL, 1, NULL, 'a:2:{s:4:\"path\";s:10:\"categories\";s:9:\"menu_name\";N;}'),
(34, '2023-04-02 19:35:20', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:33:\"categories/novyy-razdel/index.php\";}'),
(35, '2023-04-02 19:43:36', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2F%3Fclear_cache%3DY&path=%2F&name=top&siteTemplateId=main', NULL, 1, NULL, 'a:2:{s:9:\"menu_name\";s:23:\"Верхнее меню\";s:4:\"path\";s:0:\"\";}'),
(36, '2023-04-02 19:46:59', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2F&path=%2F&name=top&siteTemplateId=main', NULL, 1, NULL, 'a:2:{s:9:\"menu_name\";s:23:\"Верхнее меню\";s:4:\"path\";s:0:\"\";}'),
(37, '2023-04-02 19:49:55', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Fcategories%2Findex.html%3Fclear_cache%3DY&path=%2F&name=top&siteTemplateId=main', NULL, 1, NULL, 'a:2:{s:9:\"menu_name\";s:23:\"Верхнее меню\";s:4:\"path\";s:0:\"\";}'),
(38, '2023-04-02 19:52:27', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Fcategories%2F%3Fclear_cache%3DY&path=%2F&name=top&siteTemplateId=main', NULL, 1, NULL, 'a:2:{s:9:\"menu_name\";s:23:\"Верхнее меню\";s:4:\"path\";s:0:\"\";}'),
(39, '2023-04-02 20:13:19', 'UNKNOWN', 'MENU_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_menu_edit.php?bxsender=core_window_cdialog&lang=ru&site=s1&back_url=%2Fblog-single.html%3Fclear_cache%3DY&path=%2F&name=top&siteTemplateId=main', NULL, 1, NULL, 'a:2:{s:9:\"menu_name\";s:23:\"Верхнее меню\";s:4:\"path\";s:0:\"\";}'),
(40, '2023-04-04 22:47:59', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(41, '2023-04-04 22:48:22', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(42, '2023-04-05 21:29:27', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=main&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=main', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:15:\"about/index.php\";}'),
(43, '2023-04-05 21:29:27', 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=main&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=main', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:5:\"about\";}'),
(44, '2023-04-05 21:31:38', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:15:\"about/index.php\";}'),
(45, '2023-04-05 21:32:06', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:15:\"about/index.php\";}'),
(46, '2023-04-05 23:10:08', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:15:\"about/index.php\";}'),
(47, '2023-04-05 23:12:59', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:15:\"about/index.php\";}'),
(48, '2023-04-05 23:13:57', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:15:\"about/index.php\";}'),
(49, '2023-04-05 23:14:32', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:15:\"about/index.php\";}'),
(50, '2023-04-05 23:14:56', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:15:\"about/index.php\";}'),
(51, '2023-04-05 23:15:59', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:15:\"about/index.php\";}'),
(52, '2023-04-05 23:22:33', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:15:\"about/index.php\";}'),
(53, '2023-04-05 23:24:28', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:15:\"about/index.php\";}'),
(54, '2023-04-05 23:25:41', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:15:\"about/index.php\";}'),
(55, '2023-04-06 05:44:17', 'UNKNOWN', 'PAGE_ADD', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=main&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=main', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:17:\"contact/index.php\";}'),
(56, '2023-04-06 05:44:17', 'UNKNOWN', 'SECTION_ADD', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_new.php?bxsender=core_window_cdialog&lang=ru&site=s1&templateID=main&newFolder=Y&path=%2F&back_url=%2F&siteTemplateId=main', NULL, 1, NULL, 'a:1:{s:4:\"path\";s:7:\"contact\";}'),
(57, '2023-04-06 05:44:22', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '172.18.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:17:\"contact/index.php\";}'),
(58, '2023-04-06 07:50:46', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '172.19.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:17:\"contact/index.php\";}'),
(59, '2023-04-06 07:51:50', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '172.19.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:9:\"index.php\";}'),
(60, '2023-04-06 07:53:49', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '172.19.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:29:\"local/include_areas/templates\";}'),
(61, '2023-04-06 08:16:16', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '172.19.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:36:\"local/include_areas/template/bio.php\";}'),
(62, '2023-04-06 08:16:36', 'UNKNOWN', 'PAGE_EDIT', 'main', 'UNKNOWN', '172.19.0.1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', '/bitrix/admin/public_file_edit.php', 's1', 1, NULL, 'a:1:{s:4:\"path\";s:36:\"local/include_areas/template/bio.php\";}');
-- -----------------------------------
-- Dumping table b_event_message
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_message`;
CREATE TABLE `b_event_message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EMAIL_FROM` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_FROM#',
  `EMAIL_TO` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#EMAIL_TO#',
  `SUBJECT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` longtext COLLATE utf8_unicode_ci,
  `MESSAGE_PHP` longtext COLLATE utf8_unicode_ci,
  `BODY_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `BCC` text COLLATE utf8_unicode_ci,
  `REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CC` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_REPLY_TO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRIORITY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD1_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD2_VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_FIELD` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_event_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_event_message` VALUES
(1, '2023-03-31 22:20:39', 'NEW_USER', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#DEFAULT_EMAIL_FROM#', '#SITE_NAME#: Зарегистрировался новый пользователь', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nНа сайте #SERVER_NAME# успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: #USER_ID#\n\nИмя: #NAME#\nФамилия: #LAST_NAME#\nE-Mail: #EMAIL#\n\nLogin: #LOGIN#\n\nПисьмо сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nНа сайте <?=$arParams[\"SERVER_NAME\"];?> успешно зарегистрирован новый пользователь.\n\nДанные пользователя:\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\n\nИмя: <?=$arParams[\"NAME\"];?>\n\nФамилия: <?=$arParams[\"LAST_NAME\"];?>\n\nE-Mail: <?=$arParams[\"EMAIL\"];?>\n\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nПисьмо сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(2, '2023-03-31 22:20:39', 'USER_INFO', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Регистрационная информация', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nВы можете изменить пароль, перейдя по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(3, '2023-03-31 22:20:39', 'USER_PASS_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос на смену пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=#CHECKWORD#&USER_LOGIN=#URL_LOGIN#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?change_password=yes&lang=ru&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(4, '2023-03-31 22:20:39', 'USER_PASS_CHANGED', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение смены пароля', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n#NAME# #LAST_NAME#,\n\n#MESSAGE#\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nLogin: #LOGIN#\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n<?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>,\n\n<?=$arParams[\"MESSAGE\"];?>\n\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(5, '2023-03-31 22:20:39', 'NEW_USER_CONFIRM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Подтверждение регистрации нового пользователя', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере #SERVER_NAME#.\n\nВаш код для подтверждения регистрации: #CONFIRM_CODE#\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#&confirm_code=#CONFIRM_CODE#\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://#SERVER_NAME#/auth/index.php?confirm_registration=yes&confirm_user_id=#USER_ID#\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\n\nЗдравствуйте,\n\nВы получили это сообщение, так как ваш адрес был использован при регистрации нового пользователя на сервере <?=$arParams[\"SERVER_NAME\"];?>.\n\nВаш код для подтверждения регистрации: <?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nДля подтверждения регистрации перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>&confirm_code=<?=$arParams[\"CONFIRM_CODE\"];?>\n\n\nВы также можете ввести код для подтверждения регистрации на странице:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth/index.php?confirm_registration=yes&confirm_user_id=<?=$arParams[\"USER_ID\"];?>\n\n\nВнимание! Ваш профиль не будет активным, пока вы не подтвердите свою регистрацию.\n\n---------------------------------------------------------------------\n\nСообщение сгенерировано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(6, '2023-03-31 22:20:39', 'USER_INVITE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Приглашение на сайт', 'Информационное сообщение сайта #SITE_NAME#\n------------------------------------------\nЗдравствуйте, #NAME# #LAST_NAME#!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: #ID#\nLogin: #LOGIN#\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://#SERVER_NAME#/auth.php?change_password=yes&USER_LOGIN=#URL_LOGIN#&USER_CHECKWORD=#CHECKWORD#\n', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\n\n------------------------------------------\nЗдравствуйте, <?=$arParams[\"NAME\"];?> <?=$arParams[\"LAST_NAME\"];?>!\n\nАдминистратором сайта вы добавлены в число зарегистрированных пользователей.\n\nПриглашаем Вас на наш сайт.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"ID\"];?>\n\nLogin: <?=$arParams[\"LOGIN\"];?>\n\n\nРекомендуем вам сменить установленный автоматически пароль.\n\nДля смены пароля перейдите по следующей ссылке:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/auth.php?change_password=yes&USER_LOGIN=<?=$arParams[\"URL_LOGIN\"];?>&USER_CHECKWORD=<?=$arParams[\"CHECKWORD\"];?>\n\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(7, '2023-04-06 07:03:17', 'FEEDBACK_FORM', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#SITE_NAME#: Сообщение из формы обратной связи', 'Информационное сообщение сайта #SITE_NAME#\r\n------------------------------------------\r\n\r\nВам было отправлено сообщение через форму обратной связи\r\n\r\nАвтор: #AUTHOR#\r\nE-mail автора: #AUTHOR_EMAIL#\r\n\r\nТекст сообщения:\r\n#TEXT#\r\n\r\nТелефон :\r\n#PHONE#\r\nСообщение сгенерировано автоматически.', 'Информационное сообщение сайта <?=$arParams[\"SITE_NAME\"];?>\r\n\r\n------------------------------------------\r\n\r\nВам было отправлено сообщение через форму обратной связи\r\n\r\nАвтор: <?=$arParams[\"AUTHOR\"];?>\r\n\r\nE-mail автора: <?=$arParams[\"AUTHOR_EMAIL\"];?>\r\n\r\n\r\nТекст сообщения:\r\n<?=$arParams[\"TEXT\"];?>\r\n\r\n\r\nТелефон :\r\n<?=$arParams[\"PHONE\"];?>\r\n\r\nСообщение сгенерировано автоматически.', 'text', '', '', '', '', '', '', '', '', '', '', 'a:0:{}', 'ru'),
(8, '2023-03-31 22:20:39', 'MAIN_MAIL_CONFIRM_CODE', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL_TO#', '#MESSAGE_SUBJECT#', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', '<? EventMessageThemeCompiler::includeComponent(\'bitrix:main.mail.confirm\', \'\', $arParams); ?>', 'html', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'mail_join', NULL, NULL),
(9, '2023-03-31 22:20:39', 'EVENT_LOG_NOTIFICATION', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', 'Оповещение журнала событий: #NAME#', 'Зафиксированы события в журнале, соответствующие параметрам оповещения:\n\nТип события: #AUDIT_TYPE_ID#\nОбъект: #ITEM_ID#\nПользователь: #USER_ID# \nIP-адрес: #REMOTE_ADDR#\nБраузер: #USER_AGENT#\nСтраница: #REQUEST_URI# \n\nКоличество записей: #EVENT_COUNT# \n\n#ADDITIONAL_TEXT#\n\nПерейти в журнал событий:\nhttp://#SERVER_NAME#/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=#AUDIT_TYPE_ID#', 'Зафиксированы события в журнале, соответствующие параметрам оповещения:\n\nТип события: <?=$arParams[\"AUDIT_TYPE_ID\"];?>\n\nОбъект: <?=$arParams[\"ITEM_ID\"];?>\n\nПользователь: <?=$arParams[\"USER_ID\"];?> \nIP-адрес: <?=$arParams[\"REMOTE_ADDR\"];?>\n\nБраузер: <?=$arParams[\"USER_AGENT\"];?>\n\nСтраница: <?=$arParams[\"REQUEST_URI\"];?> \n\nКоличество записей: <?=$arParams[\"EVENT_COUNT\"];?> \n\n<?=$arParams[\"ADDITIONAL_TEXT\"];?>\n\n\nПерейти в журнал событий:\nhttp://<?=$arParams[\"SERVER_NAME\"];?>/bitrix/admin/event_log.php?set_filter=Y&find_audit_type_id=<?=$arParams[\"AUDIT_TYPE_ID\"];?>', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(10, '2023-03-31 22:20:39', 'USER_CODE_REQUEST', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', '#SITE_NAME#: Запрос кода авторизации', 'Используйте для авторизации код:\n\n#CHECKWORD#\n\nПосле авторизации вы сможете изменить свой пароль в редактировании профиля.\n\nВаша регистрационная информация:\n\nID пользователя: #USER_ID#\nСтатус профиля: #STATUS#\nЛогин: #LOGIN#\n\nСообщение создано автоматически.', 'Используйте для авторизации код:\n\n<?=$arParams[\"CHECKWORD\"];?>\n\n\nПосле авторизации вы сможете изменить свой пароль в редактировании профиля.\n\nВаша регистрационная информация:\n\nID пользователя: <?=$arParams[\"USER_ID\"];?>\n\nСтатус профиля: <?=$arParams[\"STATUS\"];?>\n\nЛогин: <?=$arParams[\"LOGIN\"];?>\n\n\nСообщение создано автоматически.', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru'),
(11, '2023-03-31 22:51:39', 'NEW_DEVICE_LOGIN', 's1', 'Y', '#DEFAULT_EMAIL_FROM#', '#EMAIL#', 'Вход с нового устройства', 'Здравствуйте, #NAME#,\n\nНовое устройство авторизовалось под вашим логином #LOGIN#.\n \nУстройство: #DEVICE# \nБраузер: #BROWSER#\nПлатформа: #PLATFORM#\nМестоположение: #LOCATION# (может быть неточным)\nДата: #DATE#\n\nЕсли вы не знаете, кто это был, рекомендуем немедленно сменить пароль.\n', 'Здравствуйте, <?=$arParams[\"NAME\"];?>,\n\nНовое устройство авторизовалось под вашим логином <?=$arParams[\"LOGIN\"];?>.\n \nУстройство: <?=$arParams[\"DEVICE\"];?> \nБраузер: <?=$arParams[\"BROWSER\"];?>\n\nПлатформа: <?=$arParams[\"PLATFORM\"];?>\n\nМестоположение: <?=$arParams[\"LOCATION\"];?> (может быть неточным)\nДата: <?=$arParams[\"DATE\"];?>\n\n\nЕсли вы не знаете, кто это был, рекомендуем немедленно сменить пароль.\n', 'text', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'ru');
-- -----------------------------------
-- Dumping table b_event_message_attachment
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_message_attachment`;
CREATE TABLE `b_event_message_attachment` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_event_message_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_message_site`;
CREATE TABLE `b_event_message_site` (
  `EVENT_MESSAGE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`EVENT_MESSAGE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_event_message_site` VALUES
(1, 's1'),
(2, 's1'),
(3, 's1'),
(4, 's1'),
(5, 's1'),
(6, 's1'),
(7, 's1'),
(8, 's1'),
(9, 's1'),
(10, 's1'),
(11, 's1');
-- -----------------------------------
-- Dumping table b_event_type
-- -----------------------------------
DROP TABLE IF EXISTS `b_event_type`;
CREATE TABLE `b_event_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `SORT` int(11) NOT NULL DEFAULT '150',
  `EVENT_TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'email',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_1` (`EVENT_NAME`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_event_type` VALUES
(1, 'ru', 'NEW_USER', 'Зарегистрировался новый пользователь', '\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n', 1, 'email'),
(2, 'ru', 'USER_INFO', 'Информация о пользователе', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 2, 'email'),
(3, 'ru', 'NEW_USER_CONFIRM', 'Подтверждение регистрации нового пользователя', '\n\n\n#USER_ID# - ID пользователя\n#LOGIN# - Логин\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#USER_IP# - IP пользователя\n#USER_HOST# - Хост пользователя\n#CONFIRM_CODE# - Код подтверждения\n', 3, 'email'),
(4, 'ru', 'USER_PASS_REQUEST', 'Запрос на смену пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 4, 'email'),
(5, 'ru', 'USER_PASS_CHANGED', 'Подтверждение смены пароля', '\n\n#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#MESSAGE# - Сообщение пользователю\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#CHECKWORD# - Контрольная строка для смены пароля\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - E-Mail пользователя\n', 5, 'email'),
(6, 'ru', 'USER_INVITE', 'Приглашение на сайт нового пользователя', '#ID# - ID пользователя\n#LOGIN# - Логин\n#URL_LOGIN# - Логин, закодированный для использования в URL\n#EMAIL# - EMail\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#PASSWORD# - пароль пользователя \n#CHECKWORD# - Контрольная строка для смены пароля\n#XML_ID# - ID пользователя для связи с внешними источниками\n', 6, 'email'),
(7, 'ru', 'FEEDBACK_FORM', 'Отправка сообщения через форму обратной связи', '#AUTHOR# - Автор сообщения\r\n#AUTHOR_EMAIL# - Email автора сообщения\r\n#TEXT# - Текст сообщения\r\n#EMAIL_FROM# - Email отправителя письма\r\n#EMAIL_TO# - Email получателя письма\r\n#PHONE# -Телефон', 7, 'email'),
(8, 'ru', 'MAIN_MAIL_CONFIRM_CODE', 'Подтверждение email-адреса отправителя', '\n\n#EMAIL_TO# - Email-адрес для подтверждения\n#MESSAGE_SUBJECT# - Тема сообщения\n#CONFIRM_CODE# - Код подтверждения', 8, 'email'),
(9, 'ru', 'EVENT_LOG_NOTIFICATION', 'Оповещение журнала событий', '#EMAIL# - Email получателя\n#ADDITIONAL_TEXT# - Дополнительный текст действия\n#NAME# - Название оповещения\n#AUDIT_TYPE_ID# - Тип события\n#ITEM_ID# - Объект\n#USER_ID# - Пользователь\n#REMOTE_ADDR# - IP-адрес\n#USER_AGENT# - Браузер\n#REQUEST_URI# - Страница\n#EVENT_COUNT# - Количество записей', 9, 'email'),
(10, 'ru', 'USER_CODE_REQUEST', 'Запрос кода авторизации', '#USER_ID# - ID пользователя\n#STATUS# - Статус логина\n#LOGIN# - Логин\n#CHECKWORD# - Код для авторизации\n#NAME# - Имя\n#LAST_NAME# - Фамилия\n#EMAIL# - Email пользователя\n', 10, 'email'),
(11, 'ru', 'SMS_USER_CONFIRM_NUMBER', 'Подтверждение номера телефона по СМС', '#USER_PHONE# - номер телефона\n#CODE# - код подтверждения\n', 100, 'sms'),
(12, 'ru', 'SMS_USER_RESTORE_PASSWORD', 'Восстановление пароля через СМС', '#USER_PHONE# - номер телефона\n#CODE# - код для восстановления\n', 100, 'sms'),
(13, 'ru', 'SMS_EVENT_LOG_NOTIFICATION', 'Оповещение журнала событий', '#PHONE_NUMBER# - Номер телефона получателя\n#ADDITIONAL_TEXT# - Дополнительный текст действия\n#NAME# - Название оповещения\n#AUDIT_TYPE_ID# - Тип события\n#ITEM_ID# - Объект\n#USER_ID# - Пользователь\n#REMOTE_ADDR# - IP-адрес\n#USER_AGENT# - Браузер\n#REQUEST_URI# - Страница\n#EVENT_COUNT# - Количество записей', 100, 'sms'),
(14, 'en', 'NEW_USER', 'New user was registered', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#USER_IP# - User IP\n#USER_HOST# - User Host\n', 1, 'email'),
(15, 'en', 'USER_INFO', 'Account Information', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 2, 'email'),
(16, 'en', 'NEW_USER_CONFIRM', 'New user registration confirmation', '\n\n#USER_ID# - User ID\n#LOGIN# - Login\n#EMAIL# - E-mail\n#NAME# - First name\n#LAST_NAME# - Last name\n#USER_IP# - User IP\n#USER_HOST# - User host\n#CONFIRM_CODE# - Confirmation code\n', 3, 'email'),
(17, 'en', 'USER_PASS_REQUEST', 'Password Change Request', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 4, 'email'),
(18, 'en', 'USER_PASS_CHANGED', 'Password Change Confirmation', '\n\n#USER_ID# - User ID\n#STATUS# - Account status\n#MESSAGE# - Message for user\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#CHECKWORD# - Check string for password change\n#NAME# - Name\n#LAST_NAME# - Last Name\n#EMAIL# - User E-Mail\n', 5, 'email'),
(19, 'en', 'USER_INVITE', 'Invitation of a new site user', '#ID# - User ID\n#LOGIN# - Login\n#URL_LOGIN# - Encoded login for use in URL\n#EMAIL# - EMail\n#NAME# - Name\n#LAST_NAME# - Last Name\n#PASSWORD# - User password \n#CHECKWORD# - Password check string\n#XML_ID# - User ID to link with external data sources\n\n', 6, 'email'),
(20, 'en', 'FEEDBACK_FORM', 'Sending a message using a feedback form', '#AUTHOR# - Message author\r\n#AUTHOR_EMAIL# - Author\'s e-mail address\r\n#TEXT# - Message text\r\n#EMAIL_FROM# - Sender\'s e-mail address\r\n#EMAIL_TO# - Recipient\'s e-mail address', 7, 'email'),
(21, 'en', 'MAIN_MAIL_CONFIRM_CODE', 'Confirm sender\'s email address', '\n\n#EMAIL_TO# - confirmation email address\n#MESSAGE_SUBJECT# - Message subject\n#CONFIRM_CODE# - Confirmation code', 8, 'email'),
(22, 'en', 'EVENT_LOG_NOTIFICATION', 'Event log notification', '#EMAIL# - Recipient email\n#ADDITIONAL_TEXT# - Action additional text\n#NAME# - Notification name\n#AUDIT_TYPE_ID# - Event type\n#ITEM_ID# - Object\n#USER_ID# - User\n#REMOTE_ADDR# - IP address\n#USER_AGENT# - Browser\n#REQUEST_URI# - Page URL\n#EVENT_COUNT# - Number of events', 9, 'email'),
(23, 'en', 'USER_CODE_REQUEST', 'Request for verification code', '#USER_ID# - user ID\n#STATUS# - Login status\n#LOGIN# - Login\n#CHECKWORD# - Verification code\n#NAME# - First name\n#LAST_NAME# - Last name\n#EMAIL# - User email\n', 10, 'email'),
(24, 'en', 'SMS_USER_CONFIRM_NUMBER', 'Verify phone number using SMS', '#USER_PHONE# - phone number\n#CODE# - confirmation code', 100, 'sms'),
(25, 'en', 'SMS_USER_RESTORE_PASSWORD', 'Recover password using SMS', '#USER_PHONE# - phone number\n#CODE# - recovery confirmation code', 100, 'sms'),
(26, 'en', 'SMS_EVENT_LOG_NOTIFICATION', 'Event log notification', '#PHONE_NUMBER# - Recipient phone number\n#ADDITIONAL_TEXT# - Action additional text\n#NAME# - Notification name\n#AUDIT_TYPE_ID# - Event type\n#ITEM_ID# - Object\n#USER_ID# - User\n#REMOTE_ADDR# - IP address\n#USER_AGENT# - Browser\n#REQUEST_URI# - Page URL\n#EVENT_COUNT# - Number of events', 100, 'sms'),
(27, 'ru', 'NEW_DEVICE_LOGIN', 'Вход с нового устройства', '#USER_ID# - ID пользователя\n#EMAIL# - Email пользователя\n#LOGIN# - Логин пользователя\n#NAME# - Имя пользователя\n#LAST_NAME# - Фамилия пользователя\n#DEVICE# - Устройство\n#BROWSER# - Браузер\n#PLATFORM# - Платформа\n#USER_AGENT# - User agent\n#IP# - IP-адрес\n#DATE# - Дата\n#COUNTRY# - Страна\n#REGION# - Регион\n#CITY# - Город\n#LOCATION# - Объединенные город, регион, страна\n', 150, 'email'),
(28, 'en', 'NEW_DEVICE_LOGIN', 'New device signed in', '#USER_ID# - User ID\n#EMAIL# - User email:\n#LOGIN# - User login\n#NAME# - User first name\n#LAST_NAME# - User last name\n#DEVICE# - Device\n#BROWSER# - Browser\n#PLATFORM# - Platform\n#USER_AGENT# - User agent\n#IP# - IP address\n#DATE# - Date\n#COUNTRY# - Country\n#REGION# - Region\n#CITY# - City\n#LOCATION# - Full location (city, region, country)\n', 150, 'email');
-- -----------------------------------
-- Dumping table b_favorite
-- -----------------------------------
DROP TABLE IF EXISTS `b_favorite`;
CREATE TABLE `b_favorite` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `C_SORT` int(11) NOT NULL DEFAULT '100',
  `MODIFIED_BY` int(11) DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` text COLLATE utf8_unicode_ci,
  `COMMENTS` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `CODE_ID` int(11) DEFAULT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `MENU_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_file
-- -----------------------------------
DROP TABLE IF EXISTS `b_file`;
CREATE TABLE `b_file` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `FILE_SIZE` bigint(20) DEFAULT NULL,
  `CONTENT_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'IMAGE',
  `SUBDIR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ORIGINAL_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HANDLER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_EXTERNAL_ID` (`EXTERNAL_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_file` VALUES
(1, '2023-04-02 18:29:29', 'iblock', 534, 800, 77532, 'image/jpeg', 'iblock/580', 'qdgmz481phzbiljk2j40x8sw8zf0ogy9.jpg', 'img_5.jpg', '', NULL, '7b1fdd5484e0920bc1be1e4e5aabcc79'),
(2, '2023-04-02 18:30:13', 'iblock', 534, 800, 141963, 'image/jpeg', 'iblock/f80', 'nho1thx6dtap2dl9mozvzw6ne487h6sq.jpg', 'img_9.jpg', '', NULL, 'd5e167ffa267df7a21761bd6061713b7'),
(3, '2023-04-02 18:30:42', 'iblock', 534, 800, 77532, 'image/jpeg', 'iblock/580', 'qdgmz481phzbiljk2j40x8sw8zf0ogy9.jpg', 'img_5.jpg', '', NULL, '7bbe47b5222786b096234e57545c18ae'),
(4, '2023-04-02 18:31:10', 'iblock', 534, 800, 77532, 'image/jpeg', 'iblock/580', 'qdgmz481phzbiljk2j40x8sw8zf0ogy9.jpg', 'img_5.jpg', '', NULL, 'a3d0daf80ca965fce1e640fa44ed6d53'),
(5, '2023-04-02 18:33:05', 'iblock', 800, 1200, 170712, 'image/jpeg', 'iblock/f8a', 'l821l5nmhwku3odfzu95ruxv90te6usw.jpg', 'person_testimonial_1.jpg', '', NULL, 'd93e9da7250dc501e7923a3964f8aa73'),
(6, '2023-04-02 18:33:25', 'iblock', 534, 800, 62676, 'image/jpeg', 'iblock/e0f', 'zxe233j3x3h9vrpg9r0qc7sxxd25k8pu.jpg', 'img_3.jpg', '', NULL, '73ec2f31d47471cfdd4bc266894223ad'),
(7, '2023-04-02 18:34:15', 'iblock', 534, 800, 94323, 'image/jpeg', 'iblock/fa6', 'dqou2xqb354v4sszp494uwbv7qeklyw9.jpg', 'img_12.jpg', '', NULL, '38f9295503d044e4235bba16cb84e873'),
(8, '2023-04-02 18:34:43', 'iblock', 534, 800, 63133, 'image/jpeg', 'iblock/d0e', '9sifixuea629c5ao3w6ojfvksz4qpmnf.jpg', 'img_10.jpg', '', NULL, '1642c89b4923905735967c9a611108bf'),
(9, '2023-04-02 18:35:23', 'iblock', 534, 800, 116339, 'image/jpeg', 'iblock/6a5', 'ada76xe0xntoc6k7uwd0x3dhhi90b6ou.jpg', 'img_11.jpg', '', NULL, 'df7f9a3ac8e1321c886c79cdd0808251'),
(10, '2023-04-06 09:35:06', 'iblock', 534, 800, 60117, 'image/jpeg', 'iblock/ab3', 'w2hh6tf657bvuaxdqwy11b37ui0m99kx.jpg', 'img_7.jpg', '', NULL, 'f8ef5182001d72060e4ca439fea6397e'),
(11, '2023-04-02 18:37:11', 'iblock', 534, 800, 60116, 'image/jpeg', 'iblock/bed', 'wsglttzcn42cu2jvn225ddapuvsjk47q.jpg', 'img_2.jpg', '', NULL, 'a18483a9a459fb6ec1de56aeba9998bb'),
(12, '2023-04-02 18:37:46', 'iblock', 534, 800, 141963, 'image/jpeg', 'iblock/f80', 'nho1thx6dtap2dl9mozvzw6ne487h6sq.jpg', 'img_9.jpg', '', NULL, 'd7f2cfa06a9a6480581b0d5dbb6ad20e'),
(13, '2023-04-05 04:24:22', 'iblock', 534, 800, 63133, 'image/jpeg', 'iblock/d0e', '9sifixuea629c5ao3w6ojfvksz4qpmnf.jpg', 'img_10.jpg', '', NULL, '7fd16ec2c41baf6c5f316b7ebf6c1d97'),
(14, '2023-04-05 04:24:36', 'iblock', 534, 800, 94323, 'image/jpeg', 'iblock/fa6', 'dqou2xqb354v4sszp494uwbv7qeklyw9.jpg', 'img_12.jpg', '', NULL, 'e29ea4b63d999805525f2fddb010bfa4'),
(15, '2023-04-05 04:25:08', 'iblock', 534, 800, 70630, 'image/jpeg', 'iblock/5c9', 'q7yo04nfeqav7zlz8d6lwtttpvjbcgzs.jpg', 'img_1.jpg', '', NULL, 'fc80abc2537c818d490ac852f970730c'),
(16, '2023-04-05 04:25:23', 'iblock', 800, 1200, 170712, 'image/jpeg', 'iblock/f8a', 'l821l5nmhwku3odfzu95ruxv90te6usw.jpg', 'person_testimonial_1.jpg', '', NULL, '10efc480e6c06287b3b7c10a581294b7'),
(17, '2023-04-05 04:25:37', 'iblock', 534, 800, 60116, 'image/jpeg', 'iblock/bed', 'wsglttzcn42cu2jvn225ddapuvsjk47q.jpg', 'img_2.jpg', '', NULL, '0f28feacc9576647efe1fb364a995741'),
(18, '2023-04-05 04:25:51', 'iblock', 1267, 1900, 345330, 'image/jpeg', 'iblock/ccf', '4m1w0vt2130i2s10rtljjtb6zjpi8wsy.jpg', 'big_image_1.jpg', '', NULL, 'bd0adda25385e84f10240140202a0f2f'),
(19, '2023-04-05 04:26:33', 'iblock', 1267, 1900, 111822, 'image/jpeg', 'iblock/047', '3jk45aq1u51vl2zsomosmrewkk0b4ymf.jpg', 'big_image_3.jpg', '', NULL, '38e4731c65afb70043c760a51aee6152'),
(20, '2023-04-05 04:26:52', 'iblock', 534, 800, 62676, 'image/jpeg', 'iblock/e0f', 'zxe233j3x3h9vrpg9r0qc7sxxd25k8pu.jpg', 'img_3.jpg', '', NULL, '4cd6a641b5850145aa176f9f754370a7'),
(21, '2023-04-05 04:27:09', 'iblock', 534, 800, 114203, 'image/jpeg', 'iblock/934', '5bvjg2dkm29wakidw5z7fg3ib0kw7wup.jpg', 'img_4.jpg', '', NULL, '3f5452a8c21a4faf347b381e6dd90512'),
(22, '2023-04-05 04:27:22', 'iblock', 534, 800, 77532, 'image/jpeg', 'iblock/580', 'qdgmz481phzbiljk2j40x8sw8zf0ogy9.jpg', 'img_5.jpg', '', NULL, 'a11f2f744d05d41ec046c6ccaa2ff2ae'),
(23, '2023-04-05 04:27:31', 'iblock', 534, 800, 86018, 'image/jpeg', 'iblock/47a', 'l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg', 'img_6.jpg', '', NULL, '4d9438f0de1056e5fce23a37b775d718'),
(24, '2023-04-05 04:27:50', 'iblock', 800, 1200, 170712, 'image/jpeg', 'iblock/f8a', 'l821l5nmhwku3odfzu95ruxv90te6usw.jpg', 'person_testimonial_1.jpg', '', NULL, 'e554b6cc9d300ecc89a6a1d29e8761fa'),
(25, '2023-04-05 04:28:03', 'iblock', 534, 800, 60117, 'image/jpeg', 'iblock/ab3', 'w2hh6tf657bvuaxdqwy11b37ui0m99kx.jpg', 'img_7.jpg', '', NULL, '09c03418d0b5ffe04cdd87be9640f61f'),
(26, '2023-04-05 04:28:16', 'iblock', 534, 800, 101877, 'image/jpeg', 'iblock/bc4', 'g91fo3akjfuf6y01tllwz57ubw1gu038.jpg', 'img_8.jpg', '', NULL, '5a56ba3596956ccb46815d9f9fa8dc0e'),
(27, '2023-04-05 04:28:33', 'iblock', 1267, 1900, 345330, 'image/jpeg', 'iblock/ccf', '4m1w0vt2130i2s10rtljjtb6zjpi8wsy.jpg', 'big_image_1.jpg', '', NULL, 'b0beaba7c254afb82536597cf518da42'),
(28, '2023-04-05 04:28:44', 'iblock', 534, 800, 62676, 'image/jpeg', 'iblock/e0f', 'zxe233j3x3h9vrpg9r0qc7sxxd25k8pu.jpg', 'img_3.jpg', '', NULL, 'cbff84485077a74b9ab7ff39026546ad'),
(29, '2023-04-05 04:28:52', 'iblock', 534, 800, 62676, 'image/jpeg', 'iblock/e0f', 'zxe233j3x3h9vrpg9r0qc7sxxd25k8pu.jpg', 'img_3.jpg', '', NULL, '1ee9f1c31beff3aafa21dbe4b5b014b3'),
(30, '2023-04-05 04:29:00', 'iblock', 534, 800, 62676, 'image/jpeg', 'iblock/e0f', 'zxe233j3x3h9vrpg9r0qc7sxxd25k8pu.jpg', 'img_3.jpg', '', NULL, 'e5c1f549691dca4ab44714fe7e412ad0'),
(31, '2023-04-05 04:29:55', 'iblock', 800, 1200, 170712, 'image/jpeg', 'iblock/f8a', 'l821l5nmhwku3odfzu95ruxv90te6usw.jpg', 'person_testimonial_1.jpg', '', NULL, '031139acdb98cc1448f3aac6238dc2d6'),
(33, '2023-04-05 04:30:14', 'iblock', 534, 800, 114203, 'image/jpeg', 'iblock/934', '5bvjg2dkm29wakidw5z7fg3ib0kw7wup.jpg', 'img_4.jpg', '', NULL, '0fabb858a1d0b08dee8349d06687da47'),
(34, '2023-04-05 04:30:25', 'iblock', 534, 800, 77532, 'image/jpeg', 'iblock/580', 'qdgmz481phzbiljk2j40x8sw8zf0ogy9.jpg', 'img_5.jpg', '', NULL, '7643375771eb850020d682313273cb7e'),
(35, '2023-04-05 04:30:36', 'iblock', 534, 800, 101877, 'image/jpeg', 'iblock/bc4', 'g91fo3akjfuf6y01tllwz57ubw1gu038.jpg', 'img_8.jpg', '', NULL, '18c694f1521b262bcee153d0650e19cc'),
(36, '2023-04-05 04:30:45', 'iblock', 534, 800, 141963, 'image/jpeg', 'iblock/f80', 'nho1thx6dtap2dl9mozvzw6ne487h6sq.jpg', 'img_9.jpg', '', NULL, '58bcd4c211341cdb2ca0c7ba07e9ff3b'),
(37, '2023-04-05 04:30:56', 'iblock', 534, 800, 60117, 'image/jpeg', 'iblock/ab3', 'w2hh6tf657bvuaxdqwy11b37ui0m99kx.jpg', 'img_7.jpg', '', NULL, '8fbf2d23b1d52b33d980ccca76dd4eaa'),
(38, '2023-04-05 04:31:05', 'iblock', 534, 800, 101877, 'image/jpeg', 'iblock/bc4', 'g91fo3akjfuf6y01tllwz57ubw1gu038.jpg', 'img_8.jpg', '', NULL, '5473469bbf65efbf8c5100b3b2caee27'),
(39, '2023-04-05 04:31:14', 'iblock', 800, 1200, 170712, 'image/jpeg', 'iblock/f8a', 'l821l5nmhwku3odfzu95ruxv90te6usw.jpg', 'person_testimonial_1.jpg', '', NULL, 'a4a7891d50e905f9ff4889b0152546d2'),
(40, '2023-04-05 04:32:35', 'iblock', 534, 800, 60116, 'image/jpeg', 'iblock/bed', 'wsglttzcn42cu2jvn225ddapuvsjk47q.jpg', 'img_2.jpg', '', NULL, '3a4c17a84598ddd836a49b86a2030c22'),
(41, '2023-04-05 21:31:25', 'fileman', 534, 800, 86018, 'image/jpeg', 'iblock/47a', 'l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg', 'img_6.jpg', '', NULL, 'e43540aa46b2ac4b458c0cdbf2ea5a2c'),
(42, '2023-04-06 08:56:11', 'iblock', 534, 800, 60117, 'image/jpeg', 'iblock/ab3', 'w2hh6tf657bvuaxdqwy11b37ui0m99kx.jpg', 'img_7.jpg', '', NULL, '90c631859b7e8bee3471cc3aa3895f06'),
(43, '2023-04-06 08:56:11', 'iblock', 534, 800, 77532, 'image/jpeg', 'iblock/580', 'qdgmz481phzbiljk2j40x8sw8zf0ogy9.jpg', 'img_5.jpg', '', NULL, '4850f88eb2b756d1ff6b30c565808337'),
(44, '2023-04-06 08:56:11', 'iblock', 800, 1200, 170712, 'image/jpeg', 'iblock/f8a', 'l821l5nmhwku3odfzu95ruxv90te6usw.jpg', 'person_testimonial_1.jpg', '', NULL, 'f205c596e877045fc7f3e8391f738dd0'),
(45, '2023-04-06 09:34:43', 'iblock', 534, 800, 60117, 'image/jpeg', 'iblock/ab3', 'w2hh6tf657bvuaxdqwy11b37ui0m99kx.jpg', 'img_7.jpg', '', NULL, 'f7fc6133293a2e8a1d6191f3b96c65d2'),
(46, '2023-04-06 09:34:43', 'iblock', 534, 800, 141963, 'image/jpeg', 'iblock/f80', 'nho1thx6dtap2dl9mozvzw6ne487h6sq.jpg', 'img_9.jpg', '', NULL, '2e02114f1955cac05c0460b2f1181c7b'),
(47, '2023-04-06 09:34:43', 'iblock', 534, 800, 70630, 'image/jpeg', 'iblock/5c9', 'q7yo04nfeqav7zlz8d6lwtttpvjbcgzs.jpg', 'img_1.jpg', '', NULL, '5d909066d4770ef414e3b0abb1f2263b'),
(48, '2023-04-06 09:34:43', 'iblock', 534, 800, 63133, 'image/jpeg', 'iblock/d0e', '9sifixuea629c5ao3w6ojfvksz4qpmnf.jpg', 'img_10.jpg', '', NULL, '8bf2c29ea27616a0c55ba30d5e492a3b'),
(49, '2023-04-06 09:34:43', 'iblock', 1267, 1900, 345330, 'image/jpeg', 'iblock/ccf', '4m1w0vt2130i2s10rtljjtb6zjpi8wsy.jpg', 'big_image_1.jpg', '', NULL, '60aa50c02f7651885b192a7e5bf81594'),
(50, '2023-04-06 09:34:43', 'iblock', 534, 800, 60116, 'image/jpeg', 'iblock/bed', 'wsglttzcn42cu2jvn225ddapuvsjk47q.jpg', 'img_2.jpg', '', NULL, '3102bb5e05218924811a5a9959deafaf');
-- -----------------------------------
-- Dumping table b_file_duplicate
-- -----------------------------------
DROP TABLE IF EXISTS `b_file_duplicate`;
CREATE TABLE `b_file_duplicate` (
  `DUPLICATE_ID` int(11) NOT NULL,
  `ORIGINAL_ID` int(11) NOT NULL,
  `COUNTER` int(11) NOT NULL DEFAULT '1',
  `ORIGINAL_DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`DUPLICATE_ID`,`ORIGINAL_ID`),
  KEY `ix_file_duplicate_duplicate` (`ORIGINAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_file_duplicate` VALUES
(3, 1, 1, 'N'),
(4, 1, 1, 'N'),
(12, 2, 1, 'N'),
(13, 8, 1, 'N'),
(14, 7, 1, 'N'),
(16, 5, 1, 'N'),
(17, 11, 1, 'N'),
(20, 6, 1, 'N'),
(22, 1, 1, 'N'),
(24, 5, 1, 'N'),
(25, 10, 1, 'N'),
(27, 18, 1, 'N'),
(28, 6, 1, 'N'),
(29, 6, 1, 'N'),
(30, 6, 1, 'N'),
(31, 5, 1, 'N'),
(33, 21, 1, 'N'),
(34, 1, 1, 'N'),
(35, 26, 1, 'N'),
(36, 2, 1, 'N'),
(37, 10, 1, 'N'),
(38, 26, 1, 'N'),
(39, 5, 1, 'N'),
(40, 11, 1, 'N'),
(41, 23, 1, 'N'),
(42, 10, 1, 'N'),
(43, 1, 1, 'N'),
(44, 5, 1, 'N'),
(45, 10, 1, 'N'),
(46, 2, 1, 'N'),
(47, 15, 1, 'N'),
(48, 8, 1, 'N'),
(49, 18, 1, 'N'),
(50, 11, 1, 'N');
-- -----------------------------------
-- Dumping table b_file_hash
-- -----------------------------------
DROP TABLE IF EXISTS `b_file_hash`;
CREATE TABLE `b_file_hash` (
  `FILE_ID` int(11) NOT NULL,
  `FILE_SIZE` bigint(20) NOT NULL,
  `FILE_HASH` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`FILE_ID`),
  KEY `ix_file_hash_size_hash` (`FILE_SIZE`,`FILE_HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_file_hash` VALUES
(1, 77532, '257c684bfa8b2a6aa866a2c4f8fe6a53'),
(2, 141963, '991cd854a5a1798c3e1e6df18a7e1c77'),
(5, 170712, '9a220b93f0b8679d701d1172cd17e70e'),
(6, 62676, 'd0bcc6147cefa18a5ed97d998d81d354'),
(7, 94323, 'bb39d1a543365d33313775984755eb5c'),
(8, 63133, '7173a4d6ec39ba0ab041b0f6c1de9e59'),
(9, 116339, 'ef14fecf2aa0de05af8fb044b06675bc'),
(10, 60117, '21cce5e1d4f4a28d94fcb4261e0e3a86'),
(11, 60116, '93e467349794339a79e4d0eeec5638dc'),
(15, 70630, '2e331b4277b65ea08bf33acdfe279c44'),
(18, 345330, '5f968d7c090e7d751bad972c2bc6e68a'),
(19, 111822, '8c96423f02fe64948dbc3151628426fc'),
(21, 114203, 'f53bb262ebe68b976106935ab88d9cbd'),
(23, 86018, 'da0d957c5cd36f415a0ad4757f2938e1'),
(26, 101877, '2b401317e02013316f12ace0954d29df');
-- -----------------------------------
-- Dumping table b_file_preview
-- -----------------------------------
DROP TABLE IF EXISTS `b_file_preview`;
CREATE TABLE `b_file_preview` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `FILE_ID` int(11) NOT NULL,
  `PREVIEW_ID` int(11) DEFAULT NULL,
  `PREVIEW_IMAGE_ID` int(11) DEFAULT NULL,
  `CREATED_AT` datetime NOT NULL,
  `TOUCHED_AT` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_FILE_PL_TOUCH` (`TOUCHED_AT`),
  KEY `IX_B_FILE_PL_FILE` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_file_search
-- -----------------------------------
DROP TABLE IF EXISTS `b_file_search`;
CREATE TABLE `b_file_search` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SESS_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `F_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `B_DIR` int(11) NOT NULL DEFAULT '0',
  `F_SIZE` int(11) NOT NULL DEFAULT '0',
  `F_TIME` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_file_version
-- -----------------------------------
DROP TABLE IF EXISTS `b_file_version`;
CREATE TABLE `b_file_version` (
  `ORIGINAL_ID` int(11) NOT NULL,
  `VERSION_ID` int(11) NOT NULL,
  `META` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ORIGINAL_ID`),
  UNIQUE KEY `ux_file_version_version` (`VERSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_filters
-- -----------------------------------
DROP TABLE IF EXISTS `b_filters`;
CREATE TABLE `b_filters` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `FILTER_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELDS` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PRESET_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `SORT_FIELD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_finder_dest
-- -----------------------------------
DROP TABLE IF EXISTS `b_finder_dest`;
CREATE TABLE `b_finder_dest` (
  `USER_ID` int(11) NOT NULL,
  `CODE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_USER_ID` int(11) DEFAULT NULL,
  `CODE_TYPE` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTEXT` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_USE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE`,`CONTEXT`),
  KEY `IX_FINDER_DEST` (`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_geoip_handlers
-- -----------------------------------
DROP TABLE IF EXISTS `b_geoip_handlers`;
CREATE TABLE `b_geoip_handlers` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `CLASS_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_geoip_handlers` VALUES
(1, 100, 'N', '\\Bitrix\\Main\\Service\\GeoIp\\MaxMind', NULL),
(2, 110, 'Y', '\\Bitrix\\Main\\Service\\GeoIp\\SypexGeo', NULL),
(3, 80, 'Y', '\\Bitrix\\Main\\Service\\GeoIp\\GeoIP2', NULL);
-- -----------------------------------
-- Dumping table b_geoname
-- -----------------------------------
DROP TABLE IF EXISTS `b_geoname`;
CREATE TABLE `b_geoname` (
  `ID` bigint(20) unsigned NOT NULL,
  `LANGUAGE_CODE` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(600) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`,`LANGUAGE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_group`;
CREATE TABLE `b_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `C_SORT` int(11) NOT NULL DEFAULT '100',
  `ANONYMOUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECURITY_POLICY` text COLLATE utf8_unicode_ci,
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_group` VALUES
(1, '2023-03-31 22:20:39', 'Y', 1, 'N', 'Y', 'Администраторы', 'Полный доступ к управлению сайтом.', NULL, NULL),
(2, '2023-03-31 22:20:39', 'Y', 2, 'Y', 'Y', 'Все пользователи (в том числе неавторизованные)', 'Все пользователи, включая неавторизованных.', NULL, NULL),
(3, '2023-03-31 22:20:39', 'Y', 3, 'N', 'Y', 'Пользователи, имеющие право голосовать за рейтинг', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE'),
(4, '2023-03-31 22:20:39', 'Y', 4, 'N', 'Y', 'Пользователи имеющие право голосовать за авторитет', 'В эту группу пользователи добавляются автоматически.', NULL, 'RATING_VOTE_AUTHORITY');
-- -----------------------------------
-- Dumping table b_group_collection_task
-- -----------------------------------
DROP TABLE IF EXISTS `b_group_collection_task`;
CREATE TABLE `b_group_collection_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `COLLECTION_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_group_subordinate
-- -----------------------------------
DROP TABLE IF EXISTS `b_group_subordinate`;
CREATE TABLE `b_group_subordinate` (
  `ID` int(11) NOT NULL,
  `AR_SUBGROUP_ID` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_group_task
-- -----------------------------------
DROP TABLE IF EXISTS `b_group_task`;
CREATE TABLE `b_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `EXTERNAL_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_hlblock_entity
-- -----------------------------------
DROP TABLE IF EXISTS `b_hlblock_entity`;
CREATE TABLE `b_hlblock_entity` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `TABLE_NAME` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_hlblock_entity` VALUES
(1, 'SocialNetwork', 'social_network');
-- -----------------------------------
-- Dumping table b_hlblock_entity_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_hlblock_entity_lang`;
CREATE TABLE `b_hlblock_entity_lang` (
  `ID` int(11) unsigned NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_hlblock_entity_lang` VALUES
(1, 'ru', 'Социальные сети'),
(1, 'en', 'Social network');
-- -----------------------------------
-- Dumping table b_hlblock_entity_rights
-- -----------------------------------
DROP TABLE IF EXISTS `b_hlblock_entity_rights`;
CREATE TABLE `b_hlblock_entity_rights` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `HL_ID` int(11) unsigned NOT NULL,
  `TASK_ID` int(11) unsigned NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_hot_keys
-- -----------------------------------
DROP TABLE IF EXISTS `b_hot_keys`;
CREATE TABLE `b_hot_keys` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `KEYS_STRING` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_hot_keys_co_u` (`CODE_ID`,`USER_ID`),
  KEY `ix_hot_keys_user` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_hot_keys` VALUES
(1, 'Ctrl+Alt+85', 139, 0),
(2, 'Ctrl+Alt+80', 17, 0),
(3, 'Ctrl+Alt+70', 120, 0),
(4, 'Ctrl+Alt+68', 117, 0),
(5, 'Ctrl+Alt+81', 3, 0),
(6, 'Ctrl+Alt+75', 106, 0),
(7, 'Ctrl+Alt+79', 133, 0),
(8, 'Ctrl+Alt+70', 121, 0),
(9, 'Ctrl+Alt+69', 118, 0),
(10, 'Ctrl+Shift+83', 87, 0),
(11, 'Ctrl+Shift+88', 88, 0),
(12, 'Ctrl+Shift+76', 89, 0),
(13, 'Ctrl+Alt+85', 139, 1),
(14, 'Ctrl+Alt+80', 17, 1),
(15, 'Ctrl+Alt+70', 120, 1),
(16, 'Ctrl+Alt+68', 117, 1),
(17, 'Ctrl+Alt+81', 3, 1),
(18, 'Ctrl+Alt+75', 106, 1),
(19, 'Ctrl+Alt+79', 133, 1),
(20, 'Ctrl+Alt+70', 121, 1),
(21, 'Ctrl+Alt+69', 118, 1),
(22, 'Ctrl+Shift+83', 87, 1),
(23, 'Ctrl+Shift+88', 88, 1),
(24, 'Ctrl+Shift+76', 89, 1);
-- -----------------------------------
-- Dumping table b_hot_keys_code
-- -----------------------------------
DROP TABLE IF EXISTS `b_hot_keys_code`;
CREATE TABLE `b_hot_keys_code` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLASS_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TITLE_OBJ` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_CUSTOM` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ix_hot_keys_code_cn` (`CLASS_NAME`),
  KEY `ix_hot_keys_code_url` (`URL`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_hot_keys_code` VALUES
(3, 'CAdminTabControl', 'NextTab();', 'HK_DB_CADMINTC', 'HK_DB_CADMINTC_C', 'tab-container', '', 0),
(5, 'btn_new', 'var d=BX (\'btn_new\'); if (d) location.href = d.href;', 'HK_DB_BUT_ADD', 'HK_DB_BUT_ADD_C', 'btn_new', '', 0),
(6, 'btn_excel', 'var d=BX(\'btn_excel\'); if (d) location.href = d.href;', 'HK_DB_BUT_EXL', 'HK_DB_BUT_EXL_C', 'btn_excel', '', 0),
(7, 'btn_settings', 'var d=BX(\'btn_settings\'); if (d) location.href = d.href;', 'HK_DB_BUT_OPT', 'HK_DB_BUT_OPT_C', 'btn_settings', '', 0),
(8, 'btn_list', 'var d=BX(\'btn_list\'); if (d) location.href = d.href;', 'HK_DB_BUT_LST', 'HK_DB_BUT_LST_C', 'btn_list', '', 0),
(9, 'Edit_Save_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'save\'}}, true );  if (d) d.click();', 'HK_DB_BUT_SAVE', 'HK_DB_BUT_SAVE_C', 'Edit_Save_Button', '', 0),
(10, 'btn_delete', 'var d=BX(\'btn_delete\'); if (d) location.href = d.href;', 'HK_DB_BUT_DEL', 'HK_DB_BUT_DEL_C', 'btn_delete', '', 0),
(12, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'find\'}}, true ); if (d) d.focus();', 'HK_DB_FLT_FND', 'HK_DB_FLT_FND_C', 'find', '', 0),
(13, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'set_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_F', 'HK_DB_FLT_BUT_F_C', 'set_filter', '', 0),
(14, 'CAdminFilter', 'var d=BX .findChild(document, {attribute: {\'name\': \'del_filter\'}}, true );  if (d) d.click();', 'HK_DB_FLT_BUT_CNL', 'HK_DB_FLT_BUT_CNL_C', 'del_filter', '', 0),
(15, 'bx-panel-admin-button-help-icon-id', 'var d=BX(\'bx-panel-admin-button-help-icon-id\'); if (d) location.href = d.href;', 'HK_DB_BUT_HLP', 'HK_DB_BUT_HLP_C', 'bx-panel-admin-button-help-icon-id', '', 0),
(17, 'Global', 'BXHotKeys.ShowSettings();', 'HK_DB_SHW_L', 'HK_DB_SHW_L_C', 'bx-panel-hotkeys', '', 0),
(19, 'Edit_Apply_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'apply\'}}, true );  if (d) d.click();', 'HK_DB_BUT_APPL', 'HK_DB_BUT_APPL_C', 'Edit_Apply_Button', '', 0),
(20, 'Edit_Cancel_Button', 'var d=BX .findChild(document, {attribute: {\'name\': \'cancel\'}}, true );  if (d) d.click();', 'HK_DB_BUT_CANCEL', 'HK_DB_BUT_CANCEL_C', 'Edit_Cancel_Button', '', 0),
(54, 'top_panel_org_fav', '', '-=AUTONAME=-', NULL, 'top_panel_org_fav', NULL, 0),
(55, 'top_panel_module_settings', '', '-=AUTONAME=-', NULL, 'top_panel_module_settings', '', 0),
(56, 'top_panel_interface_settings', '', '-=AUTONAME=-', NULL, 'top_panel_interface_settings', '', 0),
(57, 'top_panel_help', '', '-=AUTONAME=-', NULL, 'top_panel_help', '', 0),
(58, 'top_panel_bizproc_tasks', '', '-=AUTONAME=-', NULL, 'top_panel_bizproc_tasks', '', 0),
(59, 'top_panel_add_fav', '', '-=AUTONAME=-', NULL, 'top_panel_add_fav', NULL, 0),
(60, 'top_panel_create_page', '', '-=AUTONAME=-', NULL, 'top_panel_create_page', '', 0),
(62, 'top_panel_create_folder', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder', '', 0),
(63, 'top_panel_edit_page', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page', '', 0),
(64, 'top_panel_page_prop', '', '-=AUTONAME=-', NULL, 'top_panel_page_prop', '', 0),
(65, 'top_panel_edit_page_html', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_html', '', 0),
(67, 'top_panel_edit_page_php', '', '-=AUTONAME=-', NULL, 'top_panel_edit_page_php', '', 0),
(68, 'top_panel_del_page', '', '-=AUTONAME=-', NULL, 'top_panel_del_page', '', 0),
(69, 'top_panel_folder_prop', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop', '', 0),
(70, 'top_panel_access_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_access_folder_new', '', 0),
(71, 'main_top_panel_struct_panel', '', '-=AUTONAME=-', NULL, 'main_top_panel_struct_panel', '', 0),
(72, 'top_panel_cache_page', '', '-=AUTONAME=-', NULL, 'top_panel_cache_page', '', 0),
(73, 'top_panel_cache_comp', '', '-=AUTONAME=-', NULL, 'top_panel_cache_comp', '', 0),
(74, 'top_panel_cache_not', '', '-=AUTONAME=-', NULL, 'top_panel_cache_not', '', 0),
(75, 'top_panel_edit_mode', '', '-=AUTONAME=-', NULL, 'top_panel_edit_mode', '', 0),
(76, 'top_panel_templ_site_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site_css', '', 0),
(77, 'top_panel_templ_templ_css', '', '-=AUTONAME=-', NULL, 'top_panel_templ_templ_css', '', 0),
(78, 'top_panel_templ_site', '', '-=AUTONAME=-', NULL, 'top_panel_templ_site', '', 0),
(81, 'top_panel_debug_time', '', '-=AUTONAME=-', NULL, 'top_panel_debug_time', '', 0),
(82, 'top_panel_debug_incl', '', '-=AUTONAME=-', NULL, 'top_panel_debug_incl', '', 0),
(83, 'top_panel_debug_sql', '', '-=AUTONAME=-', NULL, 'top_panel_debug_sql', NULL, 0),
(84, 'top_panel_debug_compr', '', '-=AUTONAME=-', NULL, 'top_panel_debug_compr', '', 0),
(85, 'MTP_SHORT_URI1', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI1', '', 0),
(86, 'MTP_SHORT_URI_LIST', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI_LIST', '', 0),
(87, 'FMST_PANEL_STICKER_ADD', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKER_ADD', '', 0),
(88, 'FMST_PANEL_STICKERS_SHOW', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS_SHOW', '', 0),
(89, 'FMST_PANEL_CUR_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_CUR_STICKER_LIST', '', 0),
(90, 'FMST_PANEL_ALL_STICKER_LIST', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_ALL_STICKER_LIST', '', 0),
(91, 'top_panel_menu', 'var d=BX(\"bx-panel-menu\"); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-menu', '', 0),
(92, 'top_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(93, 'admin_panel_site', 'var d=BX(\'bx-panel-view-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-view-tab', '', 0),
(94, 'admin_panel_admin', 'var d=BX(\'bx-panel-admin-tab\'); if (d) location.href = d.href;', '-=AUTONAME=-', NULL, 'bx-panel-admin-tab', '', 0),
(96, 'top_panel_folder_prop_new', '', '-=AUTONAME=-', NULL, 'top_panel_folder_prop_new', '', 0),
(97, 'main_top_panel_structure', '', '-=AUTONAME=-', NULL, 'main_top_panel_structure', '', 0),
(98, 'top_panel_clear_cache', '', '-=AUTONAME=-', NULL, 'top_panel_clear_cache', '', 0),
(99, 'top_panel_templ', '', '-=AUTONAME=-', NULL, 'top_panel_templ', '', 0),
(100, 'top_panel_debug', '', '-=AUTONAME=-', NULL, 'top_panel_debug', '', 0),
(101, 'MTP_SHORT_URI', '', '-=AUTONAME=-', NULL, 'MTP_SHORT_URI', '', 0),
(102, 'FMST_PANEL_STICKERS', '', '-=AUTONAME=-', NULL, 'FMST_PANEL_STICKERS', '', 0),
(103, 'top_panel_settings', '', '-=AUTONAME=-', NULL, 'top_panel_settings', '', 0),
(104, 'top_panel_fav', '', '-=AUTONAME=-', NULL, 'top_panel_fav', '', 0),
(106, 'Global', 'location.href=\'/bitrix/admin/hot_keys_list.php?lang=ru\';', 'HK_DB_SHW_HK', '', '', '', 0),
(107, 'top_panel_edit_new', '', '-=AUTONAME=-', NULL, 'top_panel_edit_new', '', 0),
(108, 'FLOW_PANEL_CREATE_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_CREATE_WITH_WF', '', 0),
(109, 'FLOW_PANEL_EDIT_WITH_WF', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_EDIT_WITH_WF', '', 0),
(110, 'FLOW_PANEL_HISTORY', '', '-=AUTONAME=-', NULL, 'FLOW_PANEL_HISTORY', '', 0),
(111, 'top_panel_create_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_new', '', 0),
(112, 'top_panel_create_folder_new', '', '-=AUTONAME=-', NULL, 'top_panel_create_folder_new', '', 0),
(116, 'bx-panel-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-toggle', '', 0),
(117, 'bx-panel-small-toggle', '', '-=AUTONAME=-', NULL, 'bx-panel-small-toggle', '', 0),
(118, 'bx-panel-expander', 'var d=BX(\'bx-panel-expander\'); if (d) BX.fireEvent(d, \'click\');', '-=AUTONAME=-', NULL, 'bx-panel-expander', '', 0),
(119, 'bx-panel-hider', 'var d=BX(\'bx-panel-hider\'); if (d) d.click();', '-=AUTONAME=-', NULL, 'bx-panel-hider', '', 0),
(120, 'search-textbox-input', 'var d=BX(\'search-textbox-input\'); if (d) { d.click(); d.focus();}', '-=AUTONAME=-', '', 'search', '', 0),
(121, 'bx-search-input', 'var d=BX(\'bx-search-input\'); if (d) { d.click(); d.focus(); }', '-=AUTONAME=-', '', 'bx-search-input', '', 0),
(133, 'bx-panel-logout', 'var d=BX(\'bx-panel-logout\'); if (d) location.href = d.href;', '-=AUTONAME=-', '', 'bx-panel-logout', '', 0),
(135, 'CDialog', 'var d=BX(\'cancel\'); if (d) d.click();', 'HK_DB_D_CANCEL', '', 'cancel', '', 0),
(136, 'CDialog', 'var d=BX(\'close\'); if (d) d.click();', 'HK_DB_D_CLOSE', '', 'close', '', 0),
(137, 'CDialog', 'var d=BX(\'savebtn\'); if (d) d.click();', 'HK_DB_D_SAVE', '', 'savebtn', '', 0),
(138, 'CDialog', 'var d=BX(\'btn_popup_save\'); if (d) d.click();', 'HK_DB_D_EDIT_SAVE', '', 'btn_popup_save', '', 0),
(139, 'Global', 'location.href=\'/bitrix/admin/user_admin.php?lang=\'+phpVars.LANGUAGE_ID;', 'HK_DB_SHW_U', '', '', '', 0);
-- -----------------------------------
-- Dumping table b_iblock
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock`;
CREATE TABLE `b_iblock` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `API_CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REST_ON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `LIST_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CANONICAL_PAGE_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `RSS_TTL` int(11) NOT NULL DEFAULT '24',
  `RSS_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `RSS_FILE_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `RSS_FILE_LIMIT` int(11) DEFAULT NULL,
  `RSS_FILE_DAYS` int(11) DEFAULT NULL,
  `RSS_YANDEX_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INDEX_ELEMENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INDEX_SECTION` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `WORKFLOW` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `BIZPROC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SECTION_CHOOSER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RIGHTS_MODE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_PROPERTY` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROPERTY_INDEX` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `LAST_CONV_ELEMENT` int(11) NOT NULL DEFAULT '0',
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENTS_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_iblock_api_code` (`API_CODE`),
  KEY `ix_iblock` (`IBLOCK_TYPE_ID`,`LID`,`ACTIVE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock` VALUES
(1, '2023-04-06 01:05:47', 'blog', 's1', 'Posts', NULL, 'N', 'Публикации', 'Y', 500, '#SITE_DIR#/categories/', '#SITE_DIR#/categories/#SECTION_CODE#/#ELEMENT_CODE#/', '#SITE_DIR#/categories/#SECTION_CODE#/', '', NULL, '', 'text', 24, 'Y', 'N', NULL, NULL, 'N', NULL, 'c525d7c7a81329b1fb50db647caf3d87', 'Y', 'N', 'N', 'N', 'L', '', 'S', 'N', 'N', 2, 0, NULL, '', '', 'Разделы', 'Раздел', 'Элементы', 'Элемент');
-- -----------------------------------
-- Dumping table b_iblock_cache
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_cache`;
CREATE TABLE `b_iblock_cache` (
  `CACHE_KEY` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `CACHE` longtext COLLATE utf8_unicode_ci NOT NULL,
  `CACHE_DATE` datetime NOT NULL,
  PRIMARY KEY (`CACHE_KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_element
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element`;
CREATE TABLE `b_iblock_element` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` datetime DEFAULT NULL,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL DEFAULT '0',
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `ACTIVE_FROM` datetime DEFAULT NULL,
  `ACTIVE_TO` datetime DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREVIEW_PICTURE` int(18) DEFAULT NULL,
  `PREVIEW_TEXT` text COLLATE utf8_unicode_ci,
  `PREVIEW_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `DETAIL_TEXT` longtext COLLATE utf8_unicode_ci,
  `DETAIL_TEXT_TYPE` varchar(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `WF_STATUS_ID` int(18) DEFAULT '1',
  `WF_PARENT_ELEMENT_ID` int(11) DEFAULT NULL,
  `WF_NEW` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LOCKED_BY` int(18) DEFAULT NULL,
  `WF_DATE_LOCK` datetime DEFAULT NULL,
  `WF_COMMENTS` text COLLATE utf8_unicode_ci,
  `IN_SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TAGS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WF_LAST_HISTORY_ID` int(11) DEFAULT NULL,
  `SHOW_COUNTER` int(18) DEFAULT NULL,
  `SHOW_COUNTER_START` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_element_4` (`IBLOCK_ID`,`XML_ID`,`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_3` (`WF_PARENT_ELEMENT_ID`),
  KEY `ix_iblock_element_code` (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_element` VALUES
(1, '2023-04-05 04:22:38', 1, '2023-04-02 18:28:32', 1, 1, 2, 'Y', '2023-03-21 00:00:00', NULL, 500, 'Как сделать идеальный завтрак: рецепты и советы', 1, 'В этом посте мы поделимся с вами лучшими рецептами для идеального завтрака, а также дадим советы по его приготовлению и подаче', 'text', NULL, '<p>\r\n	 Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n</p>\r\n<p>\r\n	 Temporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n</p>\r\n<p>\r\n	 Porro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n</p>\r\n<p>\r\n	 Illo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n</p>\r\n<p>\r\n	 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?\r\n</p>', 'html', 'Как сделать идеальный завтрак: рецепты и советы\r\nВ этом посте мы поделимся с вами лучшими рецептами для идеального завтрака, а также дадим советы по его приготовлению и подаче\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam \r\nvel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum. \r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis \r\nrecusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima. \r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero \r\nexpedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia. \r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque \r\nquis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur! \r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni \r\nexplicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '1', 'kak-sdelat-idealnyy-zavtrak-retsepty-i-sovety', '', '0', NULL, 1, '2023-04-06 04:00:08'),
(2, '2023-04-05 04:22:38', 1, '2023-04-02 18:30:13', 1, 1, 2, 'Y', '2023-03-09 00:00:00', NULL, 500, '5 здоровых закусок для перекуса на работе', 2, 'Если вы хотите перекусывать на работе не только вредную еду, то этот пост для вас. Мы подготовили 5 здоровых закусок, которые можно приготовить заранее и взять с собой на работу.', 'html', NULL, '', 'text', '5 здоровых закусок для перекуса на работе\r\nЕсли вы хотите перекусывать на работе не \r\nтолько вредную еду, то этот пост для вас. Мы подготовили 5 здоровых закусок, которые можно приготовить заранее и взять с собой на работу.\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '2', '5-zdorovykh-zakusok-dlya-perekusa-na-rabote', '', '0', NULL, NULL, NULL),
(3, '2023-04-05 04:22:38', 1, '2023-04-02 18:30:42', 1, 1, 2, 'Y', '2023-04-02 00:00:00', NULL, 500, 'Как приготовить пасту с овощами: рецепты и советы', 3, 'Паста с овощами - это не только вкусно, но и полезно. В этом посте мы поделимся лучшими рецептами и советами по приготовлению этого блюда', 'text', NULL, '', 'text', 'Как приготовить пасту с овощами: рецепты и советы\r\nПаста с овощами - это не только вкусно, но и полезно. В этом посте мы поделимся лучшими рецептами и советами по приготовлению этого блюда\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '3', 'kak-prigotovit-pastu-s-ovoshchami-retsepty-i-sovety', '', '0', NULL, 1, '2023-04-06 04:00:35'),
(4, '2023-04-05 04:22:38', 1, '2023-04-02 18:31:10', 1, 1, 2, 'Y', '2023-02-10 00:00:00', NULL, 500, '10 лучших рецептов для веганов', 4, 'Если вы веган или просто хотите попробовать что-то новое, то этот пост для вас. Мы подготовили 10 лучших рецептов для веганов, которые точно понравятся вам и вашим гостям', 'text', NULL, '', 'text', '10 лучших рецептов для веганов\r\nЕсли вы веган или просто хотите попробовать что-то новое, то этот пост для вас. Мы подготовили 10 лучших рецептов для веганов, которые точно понравятся вам и вашим гостям\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '4', '10-luchshikh-retseptov-dlya-veganov', '', '0', NULL, 1, '2023-04-06 05:27:43'),
(5, '2023-04-05 04:22:38', 1, '2023-04-02 18:32:59', 1, 1, 4, 'Y', '2023-03-22 00:00:00', NULL, 500, '5 стратегий эффективного управления временем в бизнесе', 5, 'В этом посте мы поделимся с вами 5 проверенными стратегиями, которые помогут вам эффективно управлять своим временем и достигать большего успеха в бизнесе', 'text', NULL, '', 'text', '5 стратегий эффективного управления временем в бизнесе\r\nВ этом посте мы поделимся с вами 5 проверенными стратегиями, которые помогут вам эффективно управлять своим временем и достигать большего успеха в бизнесе\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '5', '5-strategiy-effektivnogo-upravleniya-vremenem-v-biznese', '', '0', NULL, NULL, NULL),
(6, '2023-04-05 04:22:38', 1, '2023-04-02 18:33:25', 1, 1, 4, 'Y', '2023-03-16 00:00:00', NULL, 500, 'Как привлечь новых клиентов: советы и техники', 6, 'Привлечение новых клиентов - это одна из ключевых задач любого бизнеса. В этом посте мы расскажем о лучших советах и техниках, которые помогут вам привлечь больше клиентов и увеличить свой доход', 'text', NULL, '', 'text', 'Как привлечь новых клиентов: советы и техники\r\nПривлечение новых клиентов - это одна из ключевых задач любого бизнеса. В этом посте мы расскажем о лучших советах и техниках, которые помогут вам привлечь больше клиентов и увеличить свой доход\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '6', 'kak-privlech-novykh-klientov-sovety-i-tekhniki', '', '0', NULL, NULL, NULL),
(7, '2023-04-05 04:22:38', 1, '2023-04-02 18:34:09', 1, 1, 4, 'Y', '2023-03-02 00:00:00', NULL, 500, 'Как создать эффективную команду: секреты успеха', 7, 'Успешный бизнес зависит от эффективной работы команды. В этом посте мы поделимся с вами секретами создания эффективной команды и расскажем, как достичь большего успеха благодаря ее работе', 'text', NULL, '<p>\r\n	 Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n</p>\r\n<p>\r\n	 Temporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n</p>\r\n<p>\r\n	 Porro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n</p>\r\n<p>\r\n	 Illo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n</p>\r\n<p>\r\n	 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?\r\n</p>', 'html', 'Как создать эффективную команду: секреты успеха\r\nУспешный бизнес зависит от эффективной работы команды. В этом посте мы поделимся с вами секретами создания эффективной команды и расскажем, как достичь большего успеха благодаря ее работе\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam \r\nvel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum. \r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis \r\nrecusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima. \r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero \r\nexpedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia. \r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque \r\nquis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur! \r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni \r\nexplicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '7', 'kak-sozdat-effektivnuyu-komandu-sekrety-uspekha', '', '0', NULL, 1, '2023-04-06 04:29:55'),
(8, '2023-04-05 04:22:38', 1, '2023-04-02 18:34:43', 1, 1, 1, 'Y', '2023-04-02 00:00:00', NULL, 500, 'Как создать здоровый образ жизни: советы и рекомендации', 8, 'Здоровый образ жизни - это не только модно, но и полезно для нашего организма. В этом посте мы расскажем о лучших советах и рекомендациях, которые помогут вам создать здоровый образ жизни и улучшить свое самочувствие.', 'text', NULL, '', 'text', 'Как создать здоровый образ жизни: советы и рекомендации\r\nЗдоровый образ жизни - это не только модно, но и полезно для нашего организма. В этом посте мы расскажем о лучших советах и рекомендациях, которые помогут вам создать здоровый образ жизни и улучшить свое самочувствие.\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '8', 'kak-sozdat-zdorovyy-obraz-zhizni-sovety-i-rekomendatsii', '', '0', NULL, NULL, NULL),
(9, '2023-04-05 04:22:38', 1, '2023-04-02 18:35:09', 1, 1, 1, 'Y', '2023-03-22 00:00:00', NULL, 500, 'Как сохранить молодость и красоту: секреты успеха', 9, 'Молодость и красота - это то, что мы все хотим сохранить на долгие годы. В этом посте мы поделимся с вами секретами сохранения молодости и красоты, которые помогут вам выглядеть прекрасно даже в зрелом возрасте.', 'text', NULL, '', 'text', 'Как сохранить молодость и красоту: секреты успеха\r\nМолодость и красота - это то, что мы все хотим сохранить на долгие годы. В этом посте мы поделимся с вами секретами сохранения молодости и красоты, которые помогут вам выглядеть прекрасно даже в зрелом возрасте.\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '9', 'kak-sokhranit-molodost-i-krasotu-sekrety-uspekha', '', '0', NULL, NULL, NULL),
(10, '2023-04-06 09:35:06', 1, '2023-04-02 18:36:01', 1, 1, 1, 'Y', '2023-03-12 00:00:00', NULL, 500, 'Как создать уютный дом: советы и рекомендацииs2', 10, 'Уютный дом - это то, что мы все хотим иметь. В этом посте мы поделимся с вами советами и рекомендациями, которые помогут вам создать уютный дом, где будет приятно находиться и отдыхать после трудного дня.', 'html', NULL, 'Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.<br>\r\n<br>\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.<br>\r\n<br>\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.<br>\r\n<br>\r\n#IMAGE_BLOCK1#\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!<br>\r\n<br>\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?\r\n#IMAGE_BLOCK2#', 'html', 'Как создать уютный дом: советы и рекомендацииs2\r\nУютный дом - это то, что мы все хотим иметь. \r\nВ этом посте мы поделимся с вами советами и рекомендациями, которые помогут вам создать уютный дом, где будет приятно находиться и отдыхать после трудного дня.\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam \r\nvel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis \r\nrecusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero \r\nexpedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\n#IMAGE_BLOCK1# Illo magnam at dolore ad enim fugiat ut maxime facilis autem, \r\nnulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni \r\nexplicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit? #IMAGE_BLOCK2#', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '10', 'kak-sozdat-uyutnyy-dom-sovety-i-rekomendatsii', '', '0', NULL, 3, '2023-04-06 03:58:56'),
(11, '2023-04-05 04:22:38', 1, '2023-04-02 18:37:11', 1, 1, 3, 'Y', '2023-03-16 00:00:00', NULL, 500, 'Путешествие в Азию: лучшие места для посещения', 11, 'Азия - это удивительный континент, где можно найти множество культурных и природных достопримечательностей. В этом посте мы расскажем о лучших местах для посещения в Азии, которые стоит добавить в свой список путешествий.', 'text', NULL, 'Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 'text', 'Путешествие в Азию: лучшие места для посещения\r\nАзия - это удивительный континент, где можно найти множество культурных и природных достопримечательностей. В этом посте мы расскажем о лучших местах для посещения в Азии, которые стоит добавить в свой список путешествий.\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '11', 'puteshestvie-v-aziyu-luchshie-mesta-dlya-poseshcheniya', '', '0', NULL, 1, '2023-04-06 05:25:59'),
(12, '2023-04-05 04:22:38', 1, '2023-04-02 18:37:44', 1, 1, 3, 'Y', '2023-03-10 00:00:00', NULL, 500, 'Отдых на море: лучшие курорты Европы', 12, 'Лето - это время отдыха на море. В этом посте мы представим вам лучшие курорты Европы, где можно насладиться солнцем, морем и пляжами, а также посетить множество достопримечательностей и насладиться местной кухней.', 'text', NULL, 'Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 'text', 'Отдых на море: лучшие курорты Европы\r\nЛето - это время отдыха на море. В этом посте мы представим вам лучшие курорты Европы, где можно насладиться солнцем, морем и пляжами, а также посетить множество достопримечательностей и насладиться местной кухней.\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '12', 'otdykh-na-more-luchshie-kurorty-evropy', '', '0', NULL, 1, '2023-04-06 05:42:12'),
(13, '2023-04-05 04:24:22', 1, '2023-04-05 04:24:22', 1, 1, 2, 'Y', '2023-03-21 00:00:00', NULL, 500, 'Как сделать идеальный завтрак: рецепты и советы1', 13, 'В этом посте мы поделимся с вами лучшими рецептами для идеального завтрака, а также дадим советы по его приготовлению и подаче', 'text', NULL, '<p>\r\n	 Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n</p>\r\n<p>\r\n	 Temporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n</p>\r\n<p>\r\n	 Porro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n</p>\r\n<p>\r\n	 Illo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n</p>\r\n<p>\r\n	 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?\r\n</p>', 'html', 'Как сделать идеальный завтрак: рецепты и советы1\r\nВ этом посте мы поделимся с вами лучшими рецептами для идеального завтрака, а также дадим советы по его приготовлению и подаче\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam \r\nvel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum. \r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis \r\nrecusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima. \r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero \r\nexpedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia. \r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque \r\nquis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur! \r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni \r\nexplicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '13', 'kak-sdelat-idealnyy-zavtrak-retsepty-i-sovety1', '', '0', NULL, NULL, NULL),
(14, '2023-04-05 04:24:36', 1, '2023-04-05 04:24:36', 1, 1, 2, 'Y', '2023-03-21 00:00:00', NULL, 500, 'Как сделать идеальный завтрак: рецепты и советы2', 14, 'В этом посте мы поделимся с вами лучшими рецептами для идеального завтрака, а также дадим советы по его приготовлению и подаче', 'text', NULL, '<p>\r\n	 Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n</p>\r\n<p>\r\n	 Temporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n</p>\r\n<p>\r\n	 Porro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n</p>\r\n<p>\r\n	 Illo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n</p>\r\n<p>\r\n	 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?\r\n</p>', 'html', 'Как сделать идеальный завтрак: рецепты и советы2\r\nВ этом посте мы поделимся с вами лучшими рецептами для идеального завтрака, а также дадим советы по его приготовлению и подаче\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam \r\nvel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum. \r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis \r\nrecusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima. \r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero \r\nexpedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia. \r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque \r\nquis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur! \r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni \r\nexplicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '14', 'kak-sdelat-idealnyy-zavtrak-retsepty-i-sovety2', '', '0', NULL, NULL, NULL),
(15, '2023-04-05 04:25:08', 1, '2023-04-05 04:25:08', 1, 1, 2, 'Y', '2023-03-21 00:00:00', NULL, 500, 'Как сделать идеальный завтрак: рецепты и советы11', 15, 'В этом посте мы поделимся с вами лучшими рецептами для идеального завтрака, а также дадим советы по его приготовлению и подаче', 'text', NULL, '<p>\r\n	 Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n</p>\r\n<p>\r\n	 Temporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n</p>\r\n<p>\r\n	 Porro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n</p>\r\n<p>\r\n	 Illo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n</p>\r\n<p>\r\n	 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?\r\n</p>', 'html', 'Как сделать идеальный завтрак: рецепты и советы11\r\nВ этом посте мы поделимся с вами лучшими рецептами для идеального завтрака, а также дадим советы по его приготовлению и подаче\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam \r\nvel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum. \r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis \r\nrecusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima. \r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero \r\nexpedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia. \r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque \r\nquis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur! \r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni \r\nexplicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '15', 'kak-sdelat-idealnyy-zavtrak-retsepty-i-sovety11', '', '0', NULL, NULL, NULL),
(16, '2023-04-05 04:25:23', 1, '2023-04-05 04:25:23', 1, 1, 3, 'Y', '2023-03-10 00:00:00', NULL, 500, 'Отдых на море: лучшие курорты Европы12', 16, 'Лето - это время отдыха на море. В этом посте мы представим вам лучшие курорты Европы, где можно насладиться солнцем, морем и пляжами, а также посетить множество достопримечательностей и насладиться местной кухней.', 'text', NULL, 'Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 'text', 'Отдых на море: лучшие курорты Европы12\r\nЛето - это время отдыха на море. В этом посте мы представим вам лучшие курорты Европы, где можно насладиться солнцем, морем и пляжами, а также посетить множество достопримечательностей и насладиться местной кухней.\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '16', 'otdykh-na-more-luchshie-kurorty-evropy12', '', '0', NULL, NULL, NULL),
(17, '2023-04-05 04:25:37', 1, '2023-04-05 04:25:37', 1, 1, 3, 'Y', '2023-03-10 00:00:00', NULL, 500, 'Отдых на море: лучшие курорты Европы a', 17, 'Лето - это время отдыха на море. В этом посте мы представим вам лучшие курорты Европы, где можно насладиться солнцем, морем и пляжами, а также посетить множество достопримечательностей и насладиться местной кухней.', 'text', NULL, 'Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 'text', 'Отдых на море: лучшие курорты Европы a\r\nЛето - это время отдыха на море. В этом посте мы представим вам лучшие курорты Европы, где можно насладиться солнцем, морем и пляжами, а также посетить множество достопримечательностей и насладиться местной кухней.\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '17', 'otdykh-na-more-luchshie-kurorty-evropy-a', '', '0', NULL, NULL, NULL),
(18, '2023-04-05 04:25:51', 1, '2023-04-05 04:25:51', 1, 1, 2, 'Y', '2023-03-21 00:00:00', NULL, 500, 'Как сделать идеальный завтрак: рецепты и советы 12', 18, 'В этом посте мы поделимся с вами лучшими рецептами для идеального завтрака, а также дадим советы по его приготовлению и подаче', 'text', NULL, '<p>\r\n	 Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n</p>\r\n<p>\r\n	 Temporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n</p>\r\n<p>\r\n	 Porro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n</p>\r\n<p>\r\n	 Illo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n</p>\r\n<p>\r\n	 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?\r\n</p>', 'html', 'Как сделать идеальный завтрак: рецепты и советы 12\r\nВ этом посте мы поделимся с вами лучшими рецептами для идеального завтрака, а также дадим советы по его приготовлению и подаче\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam \r\nvel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum. \r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis \r\nrecusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima. \r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero \r\nexpedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia. \r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque \r\nquis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur! \r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni \r\nexplicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '18', 'kak-sdelat-idealnyy-zavtrak-retsepty-i-sovety-12', '', '0', NULL, NULL, NULL),
(19, '2023-04-05 04:26:33', 1, '2023-04-05 04:26:33', 1, 1, 2, 'Y', '2023-03-09 00:00:00', NULL, 500, '5 здоровых закусок для перекуса на работе 12', 19, 'Если вы хотите перекусывать на работе не только вредную еду, то этот пост для вас. Мы подготовили 5 здоровых закусок, которые можно приготовить заранее и взять с собой на работу.', 'html', NULL, '', 'text', '5 здоровых закусок для перекуса на работе 12\r\nЕсли вы хотите перекусывать на работе не \r\nтолько вредную еду, то этот пост для вас. Мы подготовили 5 здоровых закусок, которые можно приготовить заранее и взять с собой на работу.\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '19', '5-zdorovykh-zakusok-dlya-perekusa-na-rabote-12', '', '0', NULL, NULL, NULL),
(20, '2023-04-05 04:26:52', 1, '2023-04-05 04:26:52', 1, 1, 4, 'Y', '2023-03-16 00:00:00', NULL, 500, 'Как привлечь новых клиентов: советы и техники s', 20, 'Привлечение новых клиентов - это одна из ключевых задач любого бизнеса. В этом посте мы расскажем о лучших советах и техниках, которые помогут вам привлечь больше клиентов и увеличить свой доход', 'text', NULL, '', 'text', 'Как привлечь новых клиентов: советы и техники s\r\nПривлечение новых клиентов - это одна из ключевых задач любого бизнеса. В этом посте мы расскажем о лучших советах и техниках, которые помогут вам привлечь больше клиентов и увеличить свой доход\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '20', 'kak-privlech-novykh-klientov-sovety-i-tekhniki-s', '', '0', NULL, NULL, NULL),
(21, '2023-04-05 04:27:09', 1, '2023-04-05 04:27:09', 1, 1, 4, 'Y', '2023-03-02 00:00:00', NULL, 500, 'Как создать эффективную команду: секреты успеха 123', 21, 'Успешный бизнес зависит от эффективной работы команды. В этом посте мы поделимся с вами секретами создания эффективной команды и расскажем, как достичь большего успеха благодаря ее работе', 'text', NULL, '<p>\r\n	 Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n</p>\r\n<p>\r\n	 Temporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n</p>\r\n<p>\r\n	 Porro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n</p>\r\n<p>\r\n	 Illo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n</p>\r\n<p>\r\n	 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?\r\n</p>', 'html', 'Как создать эффективную команду: секреты успеха 123\r\nУспешный бизнес зависит от эффективной работы команды. В этом посте мы поделимся с вами секретами создания эффективной команды и расскажем, как достичь большего успеха благодаря ее работе\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam \r\nvel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum. \r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis \r\nrecusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima. \r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero \r\nexpedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia. \r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque \r\nquis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur! \r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni \r\nexplicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '21', 'kak-sozdat-effektivnuyu-komandu-sekrety-uspekha-123', '', '0', NULL, NULL, NULL),
(22, '2023-04-05 04:27:22', 1, '2023-04-05 04:27:22', 1, 1, 3, 'Y', '2023-03-10 00:00:00', NULL, 500, 'Отдых на море: лучшие курорты Европы 1234', 22, 'Лето - это время отдыха на море. В этом посте мы представим вам лучшие курорты Европы, где можно насладиться солнцем, морем и пляжами, а также посетить множество достопримечательностей и насладиться местной кухней.', 'text', NULL, 'Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 'text', 'Отдых на море: лучшие курорты Европы 1234\r\nЛето - это время отдыха на море. В этом посте мы представим вам лучшие курорты Европы, где можно насладиться солнцем, морем и пляжами, а также посетить множество достопримечательностей и насладиться местной кухней.\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '22', 'otdykh-na-more-luchshie-kurorty-evropy-1234', '', '0', NULL, NULL, NULL),
(23, '2023-04-05 04:27:31', 1, '2023-04-05 04:27:31', 1, 1, 4, 'Y', '2023-03-02 00:00:00', NULL, 500, 'Как создать эффективную команду: секреты успеха 12312', 23, 'Успешный бизнес зависит от эффективной работы команды. В этом посте мы поделимся с вами секретами создания эффективной команды и расскажем, как достичь большего успеха благодаря ее работе', 'text', NULL, '<p>\r\n	 Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n</p>\r\n<p>\r\n	 Temporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n</p>\r\n<p>\r\n	 Porro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n</p>\r\n<p>\r\n	 Illo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n</p>\r\n<p>\r\n	 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?\r\n</p>', 'html', 'Как создать эффективную команду: секреты успеха 12312\r\nУспешный бизнес зависит от эффективной работы команды. В этом посте мы поделимся с вами секретами создания эффективной команды и расскажем, как достичь большего успеха благодаря ее работе\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam \r\nvel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum. \r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis \r\nrecusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima. \r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero \r\nexpedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia. \r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque \r\nquis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur! \r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni \r\nexplicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '23', 'kak-sozdat-effektivnuyu-komandu-sekrety-uspekha-12312', '', '0', NULL, NULL, NULL),
(24, '2023-04-05 04:27:50', 1, '2023-04-05 04:27:50', 1, 1, 4, 'Y', '2023-03-02 00:00:00', NULL, 500, 'Как создать эффективную команду: секреты успеха 121', 24, 'Успешный бизнес зависит от эффективной работы команды. В этом посте мы поделимся с вами секретами создания эффективной команды и расскажем, как достичь большего успеха благодаря ее работе', 'text', NULL, '<p>\r\n	 Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n</p>\r\n<p>\r\n	 Temporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n</p>\r\n<p>\r\n	 Porro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n</p>\r\n<p>\r\n	 Illo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n</p>\r\n<p>\r\n	 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?\r\n</p>', 'html', 'Как создать эффективную команду: секреты успеха 121\r\nУспешный бизнес зависит от эффективной работы команды. В этом посте мы поделимся с вами секретами создания эффективной команды и расскажем, как достичь большего успеха благодаря ее работе\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam \r\nvel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum. \r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis \r\nrecusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima. \r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero \r\nexpedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia. \r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque \r\nquis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur! \r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni \r\nexplicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '24', 'kak-sozdat-effektivnuyu-komandu-sekrety-uspekha-121', '', '0', NULL, NULL, NULL),
(25, '2023-04-05 04:28:03', 1, '2023-04-05 04:28:03', 1, 1, 4, 'Y', '2023-03-16 00:00:00', NULL, 500, 'Как привлечь новых клиентов: советы и техники s1', 25, 'Привлечение новых клиентов - это одна из ключевых задач любого бизнеса. В этом посте мы расскажем о лучших советах и техниках, которые помогут вам привлечь больше клиентов и увеличить свой доход', 'text', NULL, '', 'text', 'Как привлечь новых клиентов: советы и техники s1\r\nПривлечение новых клиентов - это одна из ключевых задач любого бизнеса. В этом посте мы расскажем о лучших советах и техниках, которые помогут вам привлечь больше клиентов и увеличить свой доход\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '25', 'kak-privlech-novykh-klientov-sovety-i-tekhniki-s1', '', '0', NULL, NULL, NULL),
(26, '2023-04-05 04:28:16', 1, '2023-04-05 04:28:16', 1, 1, 4, 'Y', '2023-03-02 00:00:00', NULL, 500, 'Как создать эффективную команду: секреты успехаa sa', 26, 'Успешный бизнес зависит от эффективной работы команды. В этом посте мы поделимся с вами секретами создания эффективной команды и расскажем, как достичь большего успеха благодаря ее работе', 'text', NULL, '<p>\r\n	 Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n</p>\r\n<p>\r\n	 Temporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n</p>\r\n<p>\r\n	 Porro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n</p>\r\n<p>\r\n	 Illo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n</p>\r\n<p>\r\n	 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?\r\n</p>', 'html', 'Как создать эффективную команду: секреты успехаa sa\r\nУспешный бизнес зависит от эффективной работы команды. В этом посте мы поделимся с вами секретами создания эффективной команды и расскажем, как достичь большего успеха благодаря ее работе\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam \r\nvel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum. \r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis \r\nrecusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima. \r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero \r\nexpedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia. \r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque \r\nquis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur! \r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni \r\nexplicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '26', 'kak-sozdat-effektivnuyu-komandu-sekrety-uspekhaa-sa', '', '0', NULL, NULL, NULL),
(27, '2023-04-05 04:28:33', 1, '2023-04-05 04:28:33', 1, 1, 4, 'Y', '2023-03-16 00:00:00', NULL, 500, 'Как привлечь новых клиентов: советы и техники sa', 27, 'Привлечение новых клиентов - это одна из ключевых задач любого бизнеса. В этом посте мы расскажем о лучших советах и техниках, которые помогут вам привлечь больше клиентов и увеличить свой доход', 'text', NULL, '', 'text', 'Как привлечь новых клиентов: советы и техники sa\r\nПривлечение новых клиентов - это одна из ключевых задач любого бизнеса. В этом посте мы расскажем о лучших советах и техниках, которые помогут вам привлечь больше клиентов и увеличить свой доход\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '27', 'kak-privlech-novykh-klientov-sovety-i-tekhniki-sa', '', '0', NULL, NULL, NULL),
(28, '2023-04-05 04:28:44', 1, '2023-04-05 04:28:44', 1, 1, 2, 'Y', '2023-03-21 00:00:00', NULL, 500, 'Как сделать идеальный завтрак: рецепты и советы 123', 28, 'В этом посте мы поделимся с вами лучшими рецептами для идеального завтрака, а также дадим советы по его приготовлению и подаче', 'text', NULL, '<p>\r\n	 Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n</p>\r\n<p>\r\n	 Temporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n</p>\r\n<p>\r\n	 Porro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n</p>\r\n<p>\r\n	 Illo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n</p>\r\n<p>\r\n	 Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?\r\n</p>', 'html', 'Как сделать идеальный завтрак: рецепты и советы 123\r\nВ этом посте мы поделимся с вами лучшими рецептами для идеального завтрака, а также дадим советы по его приготовлению и подаче\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam \r\nvel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum. \r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis \r\nrecusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima. \r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero \r\nexpedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia. \r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque \r\nquis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur! \r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni \r\nexplicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '28', 'kak-sdelat-idealnyy-zavtrak-retsepty-i-sovety-123', '', '0', NULL, 1, '2023-04-06 04:29:46'),
(29, '2023-04-05 04:28:52', 1, '2023-04-05 04:28:52', 1, 1, 2, 'Y', '2023-02-10 00:00:00', NULL, 500, '10 лучших рецептов для веганов 213', 29, 'Если вы веган или просто хотите попробовать что-то новое, то этот пост для вас. Мы подготовили 10 лучших рецептов для веганов, которые точно понравятся вам и вашим гостям', 'text', NULL, '', 'text', '10 лучших рецептов для веганов 213\r\nЕсли вы веган или просто хотите попробовать что-то новое, то этот пост для вас. Мы подготовили 10 лучших рецептов для веганов, которые точно понравятся вам и вашим гостям\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '29', '10-luchshikh-retseptov-dlya-veganov-213', '', '0', NULL, NULL, NULL),
(30, '2023-04-05 04:29:00', 1, '2023-04-05 04:29:00', 1, 1, 2, 'Y', '2023-02-10 00:00:00', NULL, 500, '10 лучших рецептов для веганов 213132', 30, 'Если вы веган или просто хотите попробовать что-то новое, то этот пост для вас. Мы подготовили 10 лучших рецептов для веганов, которые точно понравятся вам и вашим гостям', 'text', NULL, '', 'text', '10 лучших рецептов для веганов 213132\r\nЕсли вы веган или просто хотите попробовать что-то новое, то этот пост для вас. Мы подготовили 10 лучших рецептов для веганов, которые точно понравятся вам и вашим гостям\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '30', '10-luchshikh-retseptov-dlya-veganov-213132', '', '0', NULL, NULL, NULL),
(31, '2023-04-05 04:29:55', 1, '2023-04-05 04:29:55', 1, 1, 1, 'Y', '2023-03-12 00:00:00', NULL, 500, 'Как создать уютный дом: советы и рекомендацииasd ', 31, 'Уютный дом - это то, что мы все хотим иметь. В этом посте мы поделимся с вами советами и рекомендациями, которые помогут вам создать уютный дом, где будет приятно находиться и отдыхать после трудного дня.', 'html', NULL, 'Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 'text', 'Как создать уютный дом: советы и рекомендацииasd \r\nУютный дом - это то, что мы все хотим иметь. \r\nВ этом посте мы поделимся с вами советами и рекомендациями, которые помогут вам создать уютный дом, где будет приятно находиться и отдыхать после трудного дня.\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '31', 'kak-sozdat-uyutnyy-dom-sovety-i-rekomendatsiiasd-', '', '0', NULL, 1, '2023-04-06 04:00:19'),
(32, '2023-04-05 04:32:35', 1, '2023-04-05 04:30:04', 1, 1, 1, 'Y', '2023-03-12 00:00:00', NULL, 500, 'Как создать уютный дом: советы и рекомендацииasd asd as', 40, 'Уютный дом - это то, что мы все хотим иметь. В этом посте мы поделимся с вами советами и рекомендациями, которые помогут вам создать уютный дом, где будет приятно находиться и отдыхать после трудного дня.', 'html', NULL, 'Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 'text', 'Как создать уютный дом: советы и рекомендацииasd asd as\r\nУютный дом - это то, что мы все хотим иметь. \r\nВ этом посте мы поделимся с вами советами и рекомендациями, которые помогут вам создать уютный дом, где будет приятно находиться и отдыхать после трудного дня.\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '32', 'kak-sozdat-uyutnyy-dom-sovety-i-rekomendatsiiasd-asd-as', '', '0', NULL, 1, '2023-04-06 05:40:44'),
(33, '2023-04-05 04:30:14', 1, '2023-04-05 04:30:14', 1, 1, 1, 'Y', '2023-03-12 00:00:00', NULL, 500, 'Как создать уютный дом: советы и рекомендацииasd  as', 33, 'Уютный дом - это то, что мы все хотим иметь. В этом посте мы поделимся с вами советами и рекомендациями, которые помогут вам создать уютный дом, где будет приятно находиться и отдыхать после трудного дня.', 'html', NULL, 'Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 'text', 'Как создать уютный дом: советы и рекомендацииasd  as\r\nУютный дом - это то, что мы все хотим иметь. \r\nВ этом посте мы поделимся с вами советами и рекомендациями, которые помогут вам создать уютный дом, где будет приятно находиться и отдыхать после трудного дня.\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '33', 'kak-sozdat-uyutnyy-dom-sovety-i-rekomendatsiiasd-as', '', '0', NULL, 1, '2023-04-06 04:00:24'),
(34, '2023-04-05 04:30:25', 1, '2023-04-05 04:30:25', 1, 1, 1, 'Y', '2023-04-02 00:00:00', NULL, 500, 'Как создать здоровый образ жизни: советы и рекомендацииaaa', 34, 'Здоровый образ жизни - это не только модно, но и полезно для нашего организма. В этом посте мы расскажем о лучших советах и рекомендациях, которые помогут вам создать здоровый образ жизни и улучшить свое самочувствие.', 'text', NULL, '', 'text', 'Как создать здоровый образ жизни: советы и рекомендацииaaa\r\nЗдоровый образ жизни - это не только модно, но и полезно для нашего организма. В этом посте мы расскажем о лучших советах и рекомендациях, которые помогут вам создать здоровый образ жизни и улучшить свое самочувствие.\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '34', 'kak-sozdat-zdorovyy-obraz-zhizni-sovety-i-rekomendatsiiaaa', '', '0', NULL, NULL, NULL),
(35, '2023-04-05 04:30:36', 1, '2023-04-05 04:30:36', 1, 1, 1, 'Y', '2023-03-12 00:00:00', NULL, 500, 'Как создать уютный дом: советы и рекомендацииasd asd asa', 35, 'Уютный дом - это то, что мы все хотим иметь. В этом посте мы поделимся с вами советами и рекомендациями, которые помогут вам создать уютный дом, где будет приятно находиться и отдыхать после трудного дня.', 'html', NULL, 'Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 'text', 'Как создать уютный дом: советы и рекомендацииasd asd asa\r\nУютный дом - это то, что мы все хотим иметь. \r\nВ этом посте мы поделимся с вами советами и рекомендациями, которые помогут вам создать уютный дом, где будет приятно находиться и отдыхать после трудного дня.\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '35', 'kak-sozdat-uyutnyy-dom-sovety-i-rekomendatsiiasd-asd-asa', '', '0', NULL, 1, '2023-04-06 05:39:18'),
(36, '2023-04-05 04:30:45', 1, '2023-04-05 04:30:45', 1, 1, 1, 'Y', '2023-03-12 00:00:00', NULL, 500, 'Как создать уютный дом: советы и рекомендации11', 36, 'Уютный дом - это то, что мы все хотим иметь. В этом посте мы поделимся с вами советами и рекомендациями, которые помогут вам создать уютный дом, где будет приятно находиться и отдыхать после трудного дня.', 'html', NULL, 'Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 'text', 'Как создать уютный дом: советы и рекомендации11\r\nУютный дом - это то, что мы все хотим иметь. \r\nВ этом посте мы поделимся с вами советами и рекомендациями, которые помогут вам создать уютный дом, где будет приятно находиться и отдыхать после трудного дня.\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '36', 'kak-sozdat-uyutnyy-dom-sovety-i-rekomendatsii11', '', '0', NULL, NULL, NULL),
(37, '2023-04-05 04:30:56', 1, '2023-04-05 04:30:56', 1, 1, 1, 'Y', '2023-03-12 00:00:00', NULL, 500, 'Как создать уютный дом: советы и рекомендации 12', 37, 'Уютный дом - это то, что мы все хотим иметь. В этом посте мы поделимся с вами советами и рекомендациями, которые помогут вам создать уютный дом, где будет приятно находиться и отдыхать после трудного дня.', 'html', NULL, 'Quibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 'text', 'Как создать уютный дом: советы и рекомендации 12\r\nУютный дом - это то, что мы все хотим иметь. \r\nВ этом посте мы поделимся с вами советами и рекомендациями, которые помогут вам создать уютный дом, где будет приятно находиться и отдыхать после трудного дня.\r\nQuibusdam autem, quas molestias recusandae aperiam molestiae modi qui ipsam vel. Placeat tenetur veritatis tempore quos impedit dicta, error autem, quae sint inventore ipsa quidem. Quo voluptate quisquam reiciendis, minus, animi minima eum officia doloremque repellat eos, odio doloribus cum.\r\n\r\nTemporibus quo dolore veritatis doloribus delectus dolores perspiciatis recusandae ducimus, nisi quod, incidunt ut quaerat, magnam cupiditate. Aut, laboriosam magnam, nobis dolore fugiat impedit necessitatibus nisi cupiditate, quas repellat itaque molestias sit libero voluptas eveniet omnis illo ullam dolorem minima.\r\n\r\nPorro amet accusantium libero fugit totam, deserunt ipsa, dolorem, vero expedita illo similique saepe nisi deleniti. Cumque, laboriosam, porro! Facilis voluptatem sequi nulla quidem, provident eius quos pariatur maxime sapiente illo nostrum quibusdam aliquid fugiat! Earum quod fuga id officia.\r\n\r\nIllo magnam at dolore ad enim fugiat ut maxime facilis autem, nulla cumque quis commodi eos nisi unde soluta, ipsa eius aspernatur sint atque! Nihil, eveniet illo ea, mollitia fuga accusamus dolor dolorem perspiciatis rerum hic, consectetur error rem aspernatur!\r\n\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus magni explicabo id molestiae, minima quas assumenda consectetur, nobis neque rem, incidunt quam tempore perferendis provident obcaecati sapiente, animi vel expedita omnis quae ipsa! Obcaecati eligendi sed odio labore vero reiciendis facere accusamus molestias eaque impedit, consequuntur quae fuga vitae fugit?', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '37', 'kak-sozdat-uyutnyy-dom-sovety-i-rekomendatsii-12', '', '0', NULL, NULL, NULL),
(38, '2023-04-05 04:31:05', 1, '2023-04-05 04:31:05', 1, 1, 1, 'Y', '2023-04-02 00:00:00', NULL, 500, 'Как создать здоровый образ жизни: советы и рекомендации 12', 38, 'Здоровый образ жизни - это не только модно, но и полезно для нашего организма. В этом посте мы расскажем о лучших советах и рекомендациях, которые помогут вам создать здоровый образ жизни и улучшить свое самочувствие.', 'text', NULL, '', 'text', 'Как создать здоровый образ жизни: советы и рекомендации 12\r\nЗдоровый образ жизни - это не только модно, но и полезно для нашего организма. В этом посте мы расскажем о лучших советах и рекомендациях, которые помогут вам создать здоровый образ жизни и улучшить свое самочувствие.\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '38', 'kak-sozdat-zdorovyy-obraz-zhizni-sovety-i-rekomendatsii-12', '', '0', NULL, NULL, NULL),
(39, '2023-04-05 04:31:14', 1, '2023-04-05 04:31:14', 1, 1, 1, 'Y', '2023-04-02 00:00:00', NULL, 500, 'Как создать здоровый образ жизни: советы и рекомендации 12 12', 39, 'Здоровый образ жизни - это не только модно, но и полезно для нашего организма. В этом посте мы расскажем о лучших советах и рекомендациях, которые помогут вам создать здоровый образ жизни и улучшить свое самочувствие.', 'text', NULL, '', 'text', 'Как создать здоровый образ жизни: советы и рекомендации 12 12\r\nЗдоровый образ жизни - это не только модно, но и полезно для нашего организма. В этом посте мы расскажем о лучших советах и рекомендациях, которые помогут вам создать здоровый образ жизни и улучшить свое самочувствие.\r\n', 1, NULL, NULL, NULL, NULL, NULL, 'Y', '39', 'kak-sozdat-zdorovyy-obraz-zhizni-sovety-i-rekomendatsii-12-12', '', '0', NULL, 1, '2023-04-06 05:40:21');
-- -----------------------------------
-- Dumping table b_iblock_element_iprop
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element_iprop`;
CREATE TABLE `b_iblock_element_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ELEMENT_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_element_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_element_lock
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element_lock`;
CREATE TABLE `b_iblock_element_lock` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `DATE_LOCK` datetime DEFAULT NULL,
  `LOCKED_BY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_element_prop_m1
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element_prop_m1`;
CREATE TABLE `b_iblock_element_prop_m1` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_elem_prop_m1_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_elem_prop_m1_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_elem_prop_m1_3` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_element_prop_m1` VALUES
(32, 10, 2, '18', NULL, 18.0000, ''),
(33, 10, 2, '19', NULL, 19.0000, ''),
(34, 10, 2, '4', NULL, 4.0000, ''),
(35, 10, 3, '42', NULL, 42.0000, NULL),
(36, 10, 3, '43', NULL, 43.0000, NULL),
(37, 10, 3, '44', NULL, 44.0000, NULL),
(38, 10, 3, '45', NULL, 45.0000, NULL),
(39, 10, 3, '46', NULL, 46.0000, NULL),
(40, 10, 3, '47', NULL, 47.0000, NULL),
(41, 10, 3, '48', NULL, 48.0000, NULL),
(42, 10, 3, '49', NULL, 49.0000, NULL),
(43, 10, 3, '50', NULL, 50.0000, NULL);
-- -----------------------------------
-- Dumping table b_iblock_element_prop_s1
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element_prop_s1`;
CREATE TABLE `b_iblock_element_prop_s1` (
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `PROPERTY_1` int(11) DEFAULT NULL,
  `PROPERTY_2` longtext COLLATE utf8_unicode_ci,
  `PROPERTY_3` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_element_prop_s1` VALUES
(1, 1, NULL, NULL),
(2, NULL, NULL, NULL),
(3, 1, NULL, NULL),
(4, NULL, 'a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}', NULL),
(5, NULL, NULL, NULL),
(6, NULL, NULL, NULL),
(7, 1, 'a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}', NULL),
(8, NULL, NULL, NULL),
(9, NULL, NULL, NULL),
(10, 1, 'a:3:{s:5:\"VALUE\";a:3:{i:0;s:2:\"18\";i:1;s:2:\"19\";i:2;s:1:\"4\";}s:11:\"DESCRIPTION\";a:3:{i:0;s:0:\"\";i:1;s:0:\"\";i:2;s:0:\"\";}s:2:\"ID\";a:3:{i:0;s:2:\"32\";i:1;s:2:\"33\";i:2;s:2:\"34\";}}', 'a:3:{s:5:\"VALUE\";a:9:{i:0;s:2:\"42\";i:1;s:2:\"43\";i:2;s:2:\"44\";i:3;s:2:\"45\";i:4;s:2:\"46\";i:5;s:2:\"47\";i:6;s:2:\"48\";i:7;s:2:\"49\";i:8;s:2:\"50\";}s:11:\"DESCRIPTION\";a:9:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;N;i:5;N;i:6;N;i:7;N;i:8;N;}s:2:\"ID\";a:9:{i:0;s:2:\"35\";i:1;s:2:\"36\";i:2;s:2:\"37\";i:3;s:2:\"38\";i:4;s:2:\"39\";i:5;s:2:\"40\";i:6;s:2:\"41\";i:7;s:2:\"42\";i:8;s:2:\"43\";}}'),
(11, 1, 'a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}', NULL),
(12, 1, 'a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}', NULL),
(13, 1, NULL, NULL),
(14, 1, NULL, NULL),
(15, 1, NULL, NULL),
(16, 1, NULL, NULL),
(17, 1, NULL, NULL),
(18, 1, NULL, NULL),
(19, NULL, NULL, NULL),
(20, NULL, NULL, NULL),
(21, 1, NULL, NULL),
(22, 1, NULL, NULL),
(23, 1, NULL, NULL),
(24, 1, NULL, NULL),
(25, NULL, NULL, NULL),
(26, 1, NULL, NULL),
(27, NULL, NULL, NULL),
(28, 1, 'a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}', NULL),
(29, NULL, NULL, NULL),
(30, NULL, NULL, NULL),
(31, 1, NULL, NULL),
(32, 1, 'a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}', NULL),
(33, 1, NULL, NULL),
(34, NULL, NULL, NULL),
(35, 1, 'a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}', NULL),
(36, 1, NULL, NULL),
(37, 1, NULL, NULL),
(38, NULL, NULL, NULL),
(39, NULL, 'a:3:{s:5:\"VALUE\";a:0:{}s:11:\"DESCRIPTION\";a:0:{}s:2:\"ID\";a:0:{}}', NULL);
-- -----------------------------------
-- Dumping table b_iblock_element_property
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element_property`;
CREATE TABLE `b_iblock_element_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_PROPERTY_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  `VALUE_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `VALUE_ENUM` int(11) DEFAULT NULL,
  `VALUE_NUM` decimal(18,4) DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_element_property_1` (`IBLOCK_ELEMENT_ID`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_property_2` (`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_enum` (`VALUE_ENUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_num` (`VALUE_NUM`,`IBLOCK_PROPERTY_ID`),
  KEY `ix_iblock_element_prop_val` (`VALUE`(50),`IBLOCK_PROPERTY_ID`,`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_element_right
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_element_right`;
CREATE TABLE `b_iblock_element_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `ELEMENT_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`ELEMENT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_element_right_1` (`ELEMENT_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_element_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_fields
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_fields`;
CREATE TABLE `b_iblock_fields` (
  `IBLOCK_ID` int(18) NOT NULL,
  `FIELD_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`IBLOCK_ID`,`FIELD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_fields` VALUES
(1, 'ACTIVE', 'Y', 'Y'),
(1, 'ACTIVE_FROM', 'N', '=today'),
(1, 'ACTIVE_TO', 'N', ''),
(1, 'CODE', 'Y', 'a:8:{s:6:\"UNIQUE\";s:1:\"Y\";s:15:\"TRANSLITERATION\";s:1:\"Y\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(1, 'DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";}'),
(1, 'DETAIL_TEXT', 'N', ''),
(1, 'DETAIL_TEXT_TYPE', 'Y', 'text'),
(1, 'DETAIL_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'IBLOCK_SECTION', 'N', 'a:1:{s:22:\"KEEP_IBLOCK_SECTION_ID\";s:1:\"N\";}'),
(1, 'LOG_ELEMENT_ADD', 'N', NULL),
(1, 'LOG_ELEMENT_DELETE', 'N', NULL),
(1, 'LOG_ELEMENT_EDIT', 'N', NULL),
(1, 'LOG_SECTION_ADD', 'N', NULL),
(1, 'LOG_SECTION_DELETE', 'N', NULL),
(1, 'LOG_SECTION_EDIT', 'N', NULL),
(1, 'NAME', 'Y', ''),
(1, 'PREVIEW_PICTURE', 'Y', 'a:20:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";s:11:\"FROM_DETAIL\";s:1:\"Y\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),
(1, 'PREVIEW_TEXT', 'N', ''),
(1, 'PREVIEW_TEXT_TYPE', 'Y', 'text'),
(1, 'PREVIEW_TEXT_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'SECTION_CODE', 'Y', 'a:8:{s:6:\"UNIQUE\";s:1:\"Y\";s:15:\"TRANSLITERATION\";s:1:\"Y\";s:9:\"TRANS_LEN\";i:100;s:10:\"TRANS_CASE\";s:1:\"L\";s:11:\"TRANS_SPACE\";s:1:\"-\";s:11:\"TRANS_OTHER\";s:1:\"-\";s:9:\"TRANS_EAT\";s:1:\"Y\";s:10:\"USE_GOOGLE\";s:1:\"N\";}'),
(1, 'SECTION_DESCRIPTION', 'N', ''),
(1, 'SECTION_DESCRIPTION_TYPE', 'Y', 'text'),
(1, 'SECTION_DESCRIPTION_TYPE_ALLOW_CHANGE', 'N', 'Y'),
(1, 'SECTION_DETAIL_PICTURE', 'N', 'a:17:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";}'),
(1, 'SECTION_NAME', 'Y', ''),
(1, 'SECTION_PICTURE', 'N', 'a:20:{s:5:\"SCALE\";s:1:\"N\";s:5:\"WIDTH\";s:0:\"\";s:6:\"HEIGHT\";s:0:\"\";s:13:\"IGNORE_ERRORS\";s:1:\"N\";s:6:\"METHOD\";s:8:\"resample\";s:11:\"COMPRESSION\";i:95;s:18:\"USE_WATERMARK_TEXT\";s:1:\"N\";s:14:\"WATERMARK_TEXT\";s:0:\"\";s:19:\"WATERMARK_TEXT_FONT\";s:0:\"\";s:20:\"WATERMARK_TEXT_COLOR\";s:0:\"\";s:19:\"WATERMARK_TEXT_SIZE\";s:0:\"\";s:23:\"WATERMARK_TEXT_POSITION\";s:2:\"tl\";s:18:\"USE_WATERMARK_FILE\";s:1:\"N\";s:14:\"WATERMARK_FILE\";s:0:\"\";s:20:\"WATERMARK_FILE_ALPHA\";s:0:\"\";s:23:\"WATERMARK_FILE_POSITION\";s:2:\"tl\";s:20:\"WATERMARK_FILE_ORDER\";s:0:\"\";s:11:\"FROM_DETAIL\";s:1:\"N\";s:18:\"DELETE_WITH_DETAIL\";s:1:\"N\";s:18:\"UPDATE_WITH_DETAIL\";s:1:\"N\";}'),
(1, 'SECTION_XML_ID', 'N', ''),
(1, 'SORT', 'N', '500'),
(1, 'TAGS', 'N', ''),
(1, 'XML_ID', 'Y', ''),
(1, 'XML_IMPORT_START_TIME', 'N', NULL);
-- -----------------------------------
-- Dumping table b_iblock_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_group`;
CREATE TABLE `b_iblock_group` (
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `PERMISSION` char(1) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `ux_iblock_group_1` (`IBLOCK_ID`,`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_group` VALUES
(1, 1, 'X'),
(1, 2, 'R');
-- -----------------------------------
-- Dumping table b_iblock_iblock_iprop
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_iblock_iprop`;
CREATE TABLE `b_iblock_iblock_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_iblock_iprop_0` (`IPROP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_iproperty
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_iproperty`;
CREATE TABLE `b_iblock_iproperty` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `TEMPLATE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_iprop_0` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_messages
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_messages`;
CREATE TABLE `b_iblock_messages` (
  `IBLOCK_ID` int(18) NOT NULL,
  `MESSAGE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_TEXT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`MESSAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_messages` VALUES
(1, 'ELEMENT_ADD', 'Добавить элемент'),
(1, 'ELEMENT_DELETE', 'Удалить элемент'),
(1, 'ELEMENT_EDIT', 'Изменить элемент'),
(1, 'ELEMENT_NAME', 'Элемент'),
(1, 'ELEMENTS_NAME', 'Элементы'),
(1, 'SECTION_ADD', 'Добавить раздел'),
(1, 'SECTION_DELETE', 'Удалить раздел'),
(1, 'SECTION_EDIT', 'Изменить раздел'),
(1, 'SECTION_NAME', 'Раздел'),
(1, 'SECTIONS_NAME', 'Разделы');
-- -----------------------------------
-- Dumping table b_iblock_offers_tmp
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_offers_tmp`;
CREATE TABLE `b_iblock_offers_tmp` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PRODUCT_IBLOCK_ID` int(11) unsigned NOT NULL,
  `OFFERS_IBLOCK_ID` int(11) unsigned NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_property
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_property`;
CREATE TABLE `b_iblock_property` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `IBLOCK_ID` int(11) NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `CODE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DEFAULT_VALUE` text COLLATE utf8_unicode_ci,
  `PROPERTY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `ROW_COUNT` int(11) NOT NULL DEFAULT '1',
  `COL_COUNT` int(11) NOT NULL DEFAULT '30',
  `LIST_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `XML_ID` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILE_TYPE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MULTIPLE_CNT` int(11) DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LINK_IBLOCK_ID` int(18) DEFAULT NULL,
  `WITH_DESCRIPTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FILTRABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IS_REQUIRED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) NOT NULL DEFAULT '1',
  `USER_TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_SETTINGS` text COLLATE utf8_unicode_ci,
  `HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_property_1` (`IBLOCK_ID`),
  KEY `ix_iblock_property_3` (`LINK_IBLOCK_ID`),
  KEY `ix_iblock_property_2` (`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_property` VALUES
(1, '2023-04-06 02:20:31', 1, 'Выводить в слайдер на главной', 'Y', 500, 'VIEW_MAINPAGE_SLIDER', '', 'E', 1, 30, 'L', 'N', NULL, '', 5, NULL, 1, 'N', 'N', 'N', 'N', 2, NULL, NULL, ''),
(2, '2023-04-06 03:39:33', 1, 'Рекомендации', 'Y', 500, 'RELATED_POST', '', 'E', 1, 30, 'L', 'Y', NULL, '', 1, NULL, 1, 'N', 'N', 'N', 'N', 2, NULL, NULL, ''),
(3, '2023-04-06 08:41:27', 1, 'Фотогрифии', 'Y', 500, 'IMAGES', '', 'F', 1, 30, 'L', 'Y', NULL, 'jpg, gif, bmp, png, jpeg, webp', 5, NULL, 0, 'N', 'N', 'N', 'N', 2, NULL, NULL, '');
-- -----------------------------------
-- Dumping table b_iblock_property_enum
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_property_enum`;
CREATE TABLE `b_iblock_property_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_iblock_property_enum` (`PROPERTY_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_property_feature
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_property_feature`;
CREATE TABLE `b_iblock_property_feature` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROPERTY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FEATURE_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `IS_ENABLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_iblock_property_feature` (`PROPERTY_ID`,`MODULE_ID`,`FEATURE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_property_feature` VALUES
(1, 1, 'iblock', 'LIST_PAGE_SHOW', 'N'),
(2, 1, 'iblock', 'DETAIL_PAGE_SHOW', 'N'),
(3, 2, 'iblock', 'LIST_PAGE_SHOW', 'N'),
(4, 2, 'iblock', 'DETAIL_PAGE_SHOW', 'N'),
(5, 3, 'iblock', 'LIST_PAGE_SHOW', 'N'),
(6, 3, 'iblock', 'DETAIL_PAGE_SHOW', 'N');
-- -----------------------------------
-- Dumping table b_iblock_right
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_right`;
CREATE TABLE `b_iblock_right` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `GROUP_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `DO_INHERIT` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `OP_SREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OP_EREAD` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_iblock_right_iblock_id` (`IBLOCK_ID`,`ENTITY_TYPE`,`ENTITY_ID`),
  KEY `ix_b_iblock_right_group_code` (`GROUP_CODE`,`IBLOCK_ID`),
  KEY `ix_b_iblock_right_entity` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `ix_b_iblock_right_op_eread` (`ID`,`OP_EREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_op_sread` (`ID`,`OP_SREAD`,`GROUP_CODE`),
  KEY `ix_b_iblock_right_task_id` (`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_rss
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_rss`;
CREATE TABLE `b_iblock_rss` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `IBLOCK_ID` int(11) NOT NULL,
  `NODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NODE_VALUE` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_section
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_section`;
CREATE TABLE `b_iblock_section` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `MODIFIED_BY` int(18) DEFAULT NULL,
  `DATE_CREATE` datetime DEFAULT NULL,
  `CREATED_BY` int(18) DEFAULT NULL,
  `IBLOCK_ID` int(11) NOT NULL,
  `IBLOCK_SECTION_ID` int(11) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `GLOBAL_ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PICTURE` int(18) DEFAULT NULL,
  `LEFT_MARGIN` int(18) DEFAULT NULL,
  `RIGHT_MARGIN` int(18) DEFAULT NULL,
  `DEPTH_LEVEL` int(18) DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DESCRIPTION_TYPE` char(4) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TMP_ID` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DETAIL_PICTURE` int(18) DEFAULT NULL,
  `SOCNET_GROUP_ID` int(18) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_iblock_section_1` (`IBLOCK_ID`,`IBLOCK_SECTION_ID`),
  KEY `ix_iblock_section_depth_level` (`IBLOCK_ID`,`DEPTH_LEVEL`),
  KEY `ix_iblock_section_code` (`IBLOCK_ID`,`CODE`),
  KEY `ix_iblock_section_left_margin2` (`IBLOCK_ID`,`LEFT_MARGIN`),
  KEY `ix_iblock_section_right_margin2` (`IBLOCK_ID`,`RIGHT_MARGIN`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_section` VALUES
(1, '2023-04-02 18:19:00', 1, '2023-04-02 18:19:00', 1, 1, NULL, 'Y', 'Y', 500, 'Lifestyle', NULL, 5, 6, 1, '', 'text', 'LIFESTYLE\r\n', 'lifestyle', NULL, NULL, NULL, NULL),
(2, '2023-04-02 18:19:45', 1, '2023-04-02 18:19:45', 1, 1, NULL, 'Y', 'Y', 500, 'Food', NULL, 3, 4, 1, '', 'text', 'FOOD\r\n', 'food', NULL, NULL, NULL, NULL),
(3, '2023-04-02 18:19:57', 1, '2023-04-02 18:19:57', 1, 1, NULL, 'Y', 'Y', 500, 'Travel', NULL, 7, 8, 1, '', 'text', 'TRAVEL\r\n', 'travel', NULL, NULL, NULL, NULL),
(4, '2023-04-02 18:20:12', 1, '2023-04-02 18:20:12', 1, 1, NULL, 'Y', 'Y', 500, 'Bussines', NULL, 1, 2, 1, '', 'text', 'BUSSINES\r\n', 'bussines', NULL, NULL, NULL, NULL);
-- -----------------------------------
-- Dumping table b_iblock_section_element
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_section_element`;
CREATE TABLE `b_iblock_section_element` (
  `IBLOCK_SECTION_ID` int(11) NOT NULL,
  `IBLOCK_ELEMENT_ID` int(11) NOT NULL,
  `ADDITIONAL_PROPERTY_ID` int(18) DEFAULT NULL,
  UNIQUE KEY `ux_iblock_section_element` (`IBLOCK_SECTION_ID`,`IBLOCK_ELEMENT_ID`,`ADDITIONAL_PROPERTY_ID`),
  KEY `UX_IBLOCK_SECTION_ELEMENT2` (`IBLOCK_ELEMENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_section_element` VALUES
(1, 8, NULL),
(1, 9, NULL),
(1, 10, NULL),
(1, 31, NULL),
(1, 32, NULL),
(1, 33, NULL),
(1, 34, NULL),
(1, 35, NULL),
(1, 36, NULL),
(1, 37, NULL),
(1, 38, NULL),
(1, 39, NULL),
(2, 1, NULL),
(2, 2, NULL),
(2, 3, NULL),
(2, 4, NULL),
(2, 10, NULL),
(2, 13, NULL),
(2, 14, NULL),
(2, 15, NULL),
(2, 18, NULL),
(2, 19, NULL),
(2, 28, NULL),
(2, 29, NULL),
(2, 30, NULL),
(3, 10, NULL),
(3, 11, NULL),
(3, 12, NULL),
(3, 16, NULL),
(3, 17, NULL),
(3, 22, NULL),
(4, 5, NULL),
(4, 6, NULL),
(4, 7, NULL),
(4, 20, NULL),
(4, 21, NULL),
(4, 23, NULL),
(4, 24, NULL),
(4, 25, NULL),
(4, 26, NULL),
(4, 27, NULL);
-- -----------------------------------
-- Dumping table b_iblock_section_iprop
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_section_iprop`;
CREATE TABLE `b_iblock_section_iprop` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `IPROP_ID` int(11) NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`SECTION_ID`,`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_0` (`IPROP_ID`),
  KEY `ix_b_iblock_section_iprop_1` (`IBLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_section_property
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_section_property`;
CREATE TABLE `b_iblock_section_property` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `PROPERTY_ID` int(11) NOT NULL,
  `SMART_FILTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DISPLAY_EXPANDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FILTER_HINT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SECTION_ID`,`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_1` (`PROPERTY_ID`),
  KEY `ix_b_iblock_section_property_2` (`SECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_section_right
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_section_right`;
CREATE TABLE `b_iblock_section_right` (
  `IBLOCK_ID` int(11) NOT NULL,
  `SECTION_ID` int(11) NOT NULL,
  `RIGHT_ID` int(11) NOT NULL,
  `IS_INHERITED` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`RIGHT_ID`,`SECTION_ID`),
  KEY `ix_b_iblock_section_right_1` (`SECTION_ID`,`IBLOCK_ID`),
  KEY `ix_b_iblock_section_right_2` (`IBLOCK_ID`,`RIGHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_sequence
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_sequence`;
CREATE TABLE `b_iblock_sequence` (
  `IBLOCK_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SEQ_VALUE` int(11) DEFAULT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_iblock_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_site`;
CREATE TABLE `b_iblock_site` (
  `IBLOCK_ID` int(18) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`IBLOCK_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_site` VALUES
(1, 's1');
-- -----------------------------------
-- Dumping table b_iblock_type
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_type`;
CREATE TABLE `b_iblock_type` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SECTIONS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_FILE_BEFORE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EDIT_FILE_AFTER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IN_RSS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(18) NOT NULL DEFAULT '500',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_type` VALUES
('blog', 'Y', '', '', 'N', 500),
('rest_entity', 'Y', NULL, NULL, 'N', 1000);
-- -----------------------------------
-- Dumping table b_iblock_type_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_iblock_type_lang`;
CREATE TABLE `b_iblock_type_lang` (
  `IBLOCK_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SECTION_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ELEMENT_NAME` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_iblock_type_lang` VALUES
('rest_entity', 'ru', 'Хранилище данных для приложений', 'Разделы', 'Элементы'),
('blog', 'ru', 'Блог', 'Категории', 'Посты'),
('blog', 'en', 'Blog', 'Categories', 'Posts');
-- -----------------------------------
-- Dumping table b_landing
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing`;
CREATE TABLE `b_landing` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIATOR_APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RULE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `VIEWS` int(18) NOT NULL DEFAULT '0',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TPL_ID` int(18) DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` int(18) NOT NULL,
  `SITEMAP` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FOLDER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `FOLDER_ID` int(18) DEFAULT NULL,
  `SEARCH_CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `VERSION` int(18) NOT NULL DEFAULT '1',
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DATE_PUBLIC` timestamp NULL DEFAULT NULL,
  `HISTORY_STEP` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_B_LAND_CODE` (`CODE`),
  KEY `IX_B_LAND_ACTIVE` (`ACTIVE`),
  KEY `IX_B_LAND_DELETED` (`DELETED`),
  KEY `IX_B_LAND_SYS` (`SYS`),
  KEY `IX_B_LAND_XML_ID` (`XML_ID`),
  KEY `IX_B_LAND_SITE_ID` (`SITE_ID`),
  KEY `IX_B_LAND_SITEMAP` (`SITEMAP`),
  KEY `IX_B_LAND_FOLDER` (`FOLDER`),
  KEY `IX_B_LAND_FOLDER_ID` (`FOLDER_ID`),
  FULLTEXT KEY `IX_B_LANDING_SEARCH` (`SEARCH_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_binding
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_binding`;
CREATE TABLE `b_landing_binding` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `BINDING_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `BINDING_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_BINDING` (`BINDING_ID`,`BINDING_TYPE`),
  KEY `IX_B_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_B_BINDING_TYPE` (`BINDING_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_block
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_block`;
CREATE TABLE `b_landing_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) DEFAULT NULL,
  `LID` int(18) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CODE_ORIGINAL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `INITIATOR_APP_CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ANCHOR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT '500',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESIGNED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACCESS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'X',
  `SOURCE_PARAMS` mediumtext COLLATE utf8_unicode_ci,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `SEARCH_CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `ASSETS` text COLLATE utf8_unicode_ci,
  `FAVORITE_META` text COLLATE utf8_unicode_ci,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `HISTORY_STEP_DESIGNER` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_B_BLOCK_LID` (`LID`),
  KEY `IX_B_BLOCK_CODE` (`CODE`),
  KEY `IX_B_BLOCK_ACTIVE` (`ACTIVE`),
  KEY `IX_B_BLOCK_PUBLIC` (`PUBLIC`,`DATE_CREATE`),
  KEY `IX_B_BLOCK_DELETED` (`DELETED`),
  KEY `IX_B_BLOCK_LID_PUBLIC` (`LID`,`PUBLIC`),
  FULLTEXT KEY `IX_B_BLOCK_SEARCH` (`SEARCH_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_block_last_used
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_block_last_used`;
CREATE TABLE `b_landing_block_last_used` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(18) NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_B_BLOCK_LU_USER` (`USER_ID`),
  KEY `IX_B_BLOCK_LU_CODE` (`CODE`),
  KEY `IX_B_BLOCK_LU_USER_CODE` (`USER_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_chat
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_chat`;
CREATE TABLE `b_landing_chat` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CHAT_ID` int(18) NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `AVATAR` int(18) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHAT` (`CHAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_chat_binding
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_chat_binding`;
CREATE TABLE `b_landing_chat_binding` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `INTERNAL_CHAT_ID` int(18) NOT NULL,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHAT` (`INTERNAL_CHAT_ID`),
  KEY `IX_B_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_cookies_agreement
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_cookies_agreement`;
CREATE TABLE `b_landing_cookies_agreement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SITE_ID` int(18) NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_SITE` (`SITE_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_demo
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_demo`;
CREATE TABLE `b_landing_demo` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TYPE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `TPL_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW_URL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW2X` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW3X` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MANIFEST` mediumtext COLLATE utf8_unicode_ci,
  `LANG` text COLLATE utf8_unicode_ci,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_DEMO_ACTIVE` (`ACTIVE`),
  KEY `IX_B_DEMO_SHOW_IN_LIST` (`SHOW_IN_LIST`),
  KEY `IX_B_DEMO_XML_ID` (`XML_ID`),
  KEY `IX_B_DEMO_APP_CODE` (`APP_CODE`),
  KEY `IX_B_DEMO_TEMPLATE_ID` (`SITE_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_designer_repo
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_designer_repo`;
CREATE TABLE `b_landing_designer_repo` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(18) DEFAULT '100',
  `HTML` text COLLATE utf8_unicode_ci NOT NULL,
  `MANIFEST` text COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_XML_ID` (`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_domain
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_domain`;
CREATE TABLE `b_landing_domain` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PREV_DOMAIN` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PROTOCOL` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `PROVIDER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FAIL_COUNT` int(2) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_DOMAIN_ACTIVE` (`ACTIVE`),
  KEY `IX_B_DOMAIN_DOMAIN` (`DOMAIN`),
  KEY `IX_B_DOMAIN_PROVIDER` (`PROVIDER`),
  KEY `IX_B_DOMAIN_XML_ID` (`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_entity_lock
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_entity_lock`;
CREATE TABLE `b_landing_entity_lock` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `LOCK_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_TYPE` (`LOCK_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_entity_rights
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_entity_rights`;
CREATE TABLE `b_landing_entity_rights` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ROLE_ID` int(18) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_ROLE` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_file
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_file`;
CREATE TABLE `b_landing_file` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_ID` int(18) NOT NULL,
  `TEMP` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IX_FILE` (`FILE_ID`),
  KEY `IX_TEMP` (`TEMP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_filter_block
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_filter_block`;
CREATE TABLE `b_landing_filter_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `FILTER_ID` int(18) NOT NULL,
  `BLOCK_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_FILTER_BLOCK` (`FILTER_ID`,`BLOCK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_filter_entity
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_filter_entity`;
CREATE TABLE `b_landing_filter_entity` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SOURCE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER_HASH` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `FILTER` text COLLATE utf8_unicode_ci,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_FILTER_HASH` (`FILTER_HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_folder
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_folder`;
CREATE TABLE `b_landing_folder` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `PARENT_ID` int(18) DEFAULT NULL,
  `SITE_ID` int(18) NOT NULL,
  `INDEX_ID` int(18) DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_FOLDER_SITE_ID` (`SITE_ID`),
  KEY `IX_B_FOLDER_ACTIVE` (`ACTIVE`),
  KEY `IX_B_FOLDER_DELETED` (`DELETED`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_history
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_history`;
CREATE TABLE `b_landing_history` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'L',
  `ENTITY_ID` int(18) NOT NULL,
  `ACTION` text COLLATE utf8_unicode_ci NOT NULL,
  `ACTION_PARAMS` text COLLATE utf8_unicode_ci NOT NULL,
  `MULTIPLY_ID` int(18) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_B_LAND_HISTORY_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_hook_data
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_hook_data`;
CREATE TABLE `b_landing_hook_data` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `HOOK` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` text COLLATE utf8_unicode_ci,
  `PUBLIC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `K_HOOK_CODE` (`HOOK`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_placement
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_placement`;
CREATE TABLE `b_landing_placement` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(18) DEFAULT NULL,
  `PLACEMENT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_repo
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_repo`;
CREATE TABLE `b_landing_repo` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `APP_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECTIONS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_TEMPLATE_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PREVIEW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MANIFEST` text COLLATE utf8_unicode_ci,
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_REPO_ACTIVE` (`ACTIVE`),
  KEY `IX_B_REPO_XML_ID` (`XML_ID`),
  KEY `IX_B_REPO_APP_CODE` (`APP_CODE`),
  KEY `IX_B_REPO_TEMPLATE_ID` (`SITE_TEMPLATE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_role
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_role`;
CREATE TABLE `b_landing_role` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODES` text COLLATE utf8_unicode_ci,
  `ADDITIONAL_RIGHTS` text COLLATE utf8_unicode_ci,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_B_ROLE_TYPE` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_site`;
CREATE TABLE `b_landing_site` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'PAGE',
  `TPL_ID` int(18) DEFAULT NULL,
  `TPL_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_ID` int(18) NOT NULL,
  `SMN_SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANDING_ID_INDEX` int(18) DEFAULT NULL,
  `LANDING_ID_404` int(18) DEFAULT NULL,
  `LANDING_ID_503` int(18) DEFAULT NULL,
  `LANG` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SPECIAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `VERSION` int(18) DEFAULT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_B_SITE_CODE` (`CODE`),
  KEY `IX_B_SITE_ACTIVE` (`ACTIVE`),
  KEY `IX_B_SITE_DELETED` (`DELETED`),
  KEY `IX_B_SITE_XML_ID` (`XML_ID`),
  KEY `IX_B_SITE_SPECIAL` (`SPECIAL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_syspage
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_syspage`;
CREATE TABLE `b_landing_syspage` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SITE_ID` int(18) NOT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_SITE_ID` (`SITE_ID`),
  KEY `IX_LANDING_ID` (`LANDING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_template
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_template`;
CREATE TABLE `b_landing_template` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(18) DEFAULT '100',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` text COLLATE utf8_unicode_ci NOT NULL,
  `AREA_COUNT` int(2) NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_landing_template` VALUES
(1, 'Y', '#EMPTY#', 100, 'empty', '#CONTENT#', 0, 1, 1, '2023-03-31 22:20:42', '2023-03-31 22:20:42'),
(2, 'Y', '#SIDEBAR_LEFT#', 200, 'sidebar_left', '<div class=\"landing-layout-flex\">\n								<div class=\"landing-sidebar g-max-width-100x g-overflow-hidden\">#AREA_1#</div>\n								<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n							</div>', 1, 1, 1, '2023-03-31 22:20:42', '2023-03-31 22:20:42'),
(3, 'Y', '#SIDEBAR_RIGHT#', 300, 'sidebar_right', '<div class=\"landing-layout-flex sidebar-right\">\n								<div class=\"landing-sidebar g-max-width-100x\">#AREA_1#</div>\n								<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n							</div>', 1, 1, 1, '2023-03-31 22:20:42', '2023-03-31 22:20:42'),
(4, 'Y', '#HEADER_ONLY#', 400, 'header_only', '<div class=\"landing-header\">#AREA_1#</div> \n								<div class=\"landing-main\">#CONTENT#</div>', 1, 1, 1, '2023-03-31 22:20:42', '2023-03-31 22:20:42'),
(5, 'Y', '#HEADER_FOOTER#', 500, 'header_footer', '<div class=\"landing-header\">#AREA_1#</div> \n								<div class=\"landing-main\">#CONTENT#</div> \n							<div class=\"landing-footer\">#AREA_2#</div>', 2, 1, 1, '2023-03-31 22:20:42', '2023-03-31 22:20:42'),
(6, 'Y', '#WITHOUT_LEFT#', 600, 'without_left', '<div class=\"landing-header\">#AREA_1#</div>\n								<div class=\"landing-layout-flex without-left\">\n									<div class=\"landing-sidebar g-max-width-100x\">#AREA_2#</div>\n									<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n								</div>\n							<div class=\"landing-footer\">#AREA_3#</div>', 3, 1, 1, '2023-03-31 22:20:42', '2023-03-31 22:20:42'),
(7, 'Y', '#WITHOUT_RIGHT#', 700, 'without_right', '<div class=\"landing-header\">#AREA_1#</div>\n								<div class=\"landing-layout-flex\">\n									<div class=\"landing-sidebar g-max-width-100x\">#AREA_2#</div>\n									<div class=\"landing-main g-max-width-100x\">#CONTENT#</div>\n								</div>\n							<div class=\"landing-footer\">#AREA_3#</div>', 3, 1, 1, '2023-03-31 22:20:42', '2023-03-31 22:20:42');
-- -----------------------------------
-- Dumping table b_landing_template_ref
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_template_ref`;
CREATE TABLE `b_landing_template_ref` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` int(18) NOT NULL,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `AREA` int(2) NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `K_LANDING_ID` (`LANDING_ID`),
  KEY `K_ENTITY` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_update_block
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_update_block`;
CREATE TABLE `b_landing_update_block` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LAST_BLOCK_ID` int(18) DEFAULT '0',
  `PARAMS` text COLLATE utf8_unicode_ci,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_urlchecker_host
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_urlchecker_host`;
CREATE TABLE `b_landing_urlchecker_host` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `STATUS_ID` int(18) NOT NULL,
  `HOST` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHECKER_STATUS_HOST` (`STATUS_ID`,`HOST`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_urlchecker_status
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_urlchecker_status`;
CREATE TABLE `b_landing_urlchecker_status` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `HASH` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `STATUS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHECKER_HASH` (`HASH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_urlchecker_whitelist
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_urlchecker_whitelist`;
CREATE TABLE `b_landing_urlchecker_whitelist` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_B_CHECKER_DOMAIN` (`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_urlrewrite
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_urlrewrite`;
CREATE TABLE `b_landing_urlrewrite` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `SITE_ID` int(18) NOT NULL,
  `RULE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `LANDING_ID` int(18) NOT NULL,
  `CREATED_BY_ID` int(18) NOT NULL,
  `MODIFIED_BY_ID` int(18) NOT NULL,
  `DATE_CREATE` timestamp NULL DEFAULT NULL,
  `DATE_MODIFY` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`ID`),
  KEY `IX_SITE_RULE` (`SITE_ID`,`RULE`),
  KEY `IX_LANDING_ID` (`LANDING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_landing_view
-- -----------------------------------
DROP TABLE IF EXISTS `b_landing_view`;
CREATE TABLE `b_landing_view` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `LID` int(18) NOT NULL,
  `USER_ID` int(18) NOT NULL,
  `VIEWS` int(18) NOT NULL,
  `FIRST_VIEW` datetime NOT NULL,
  `LAST_VIEW` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_VIEW_LIDUID` (`LID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_lang`;
CREATE TABLE `b_lang` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DIR` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOC_ROOT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOMAIN_LIMITED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SERVER_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_lang` VALUES
('s1', 1, 'Y', 'Y', 'Balita', '/', NULL, NULL, NULL, NULL, NULL, 'ru', '/var/www/html/minimal-blog', 'N', '', 'Balita', 'test@test.ru', 1);
-- -----------------------------------
-- Dumping table b_lang_domain
-- -----------------------------------
DROP TABLE IF EXISTS `b_lang_domain`;
CREATE TABLE `b_lang_domain` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `DOMAIN` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`LID`,`DOMAIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_language
-- -----------------------------------
DROP TABLE IF EXISTS `b_language`;
CREATE TABLE `b_language` (
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `FORMAT_DATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_DATETIME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FORMAT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WEEK_START` int(11) DEFAULT NULL,
  `CHARSET` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DIRECTION` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CULTURE_ID` int(11) DEFAULT NULL,
  `CODE` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_language` VALUES
('en', 2, 'N', 'Y', 'English', NULL, NULL, NULL, NULL, NULL, NULL, 2, 'en'),
('ru', 1, 'Y', 'Y', 'Russian', NULL, NULL, NULL, NULL, NULL, NULL, 1, 'ru');
-- -----------------------------------
-- Dumping table b_location
-- -----------------------------------
DROP TABLE IF EXISTS `b_location`;
CREATE TABLE `b_location` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CODE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SOURCE_CODE` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LATITUDE` decimal(8,6) DEFAULT NULL,
  `LONGITUDE` decimal(9,6) DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `TYPE` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CODE` (`CODE`),
  UNIQUE KEY `IX_LOC_SE` (`EXTERNAL_ID`,`SOURCE_CODE`),
  KEY `IX_LOC_LAT` (`LATITUDE`),
  KEY `IX_LOC_LON` (`LONGITUDE`),
  KEY `IX_LOC_T` (`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_location_addr_fld
-- -----------------------------------
DROP TABLE IF EXISTS `b_location_addr_fld`;
CREATE TABLE `b_location_addr_fld` (
  `ADDRESS_ID` int(11) NOT NULL,
  `TYPE` int(11) NOT NULL,
  `VALUE` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VALUE_NORMALIZED` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ADDRESS_ID`,`TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_location_addr_link
-- -----------------------------------
DROP TABLE IF EXISTS `b_location_addr_link`;
CREATE TABLE `b_location_addr_link` (
  `ADDRESS_ID` int(11) NOT NULL,
  `ENTITY_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ADDRESS_ID`,`ENTITY_ID`,`ENTITY_TYPE`),
  KEY `IDX_BLAL_EI_ET` (`ENTITY_ID`,`ENTITY_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_location_address
-- -----------------------------------
DROP TABLE IF EXISTS `b_location_address`;
CREATE TABLE `b_location_address` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOCATION_ID` int(11) DEFAULT '0',
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `LATITUDE` decimal(8,6) DEFAULT NULL,
  `LONGITUDE` decimal(9,6) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_LOC_BLA_LOC` (`LOCATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_location_area
-- -----------------------------------
DROP TABLE IF EXISTS `b_location_area`;
CREATE TABLE `b_location_area` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL,
  `GEOMETRY` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TYPE` (`TYPE`,`CODE`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_location_area` VALUES
(1, 'DISPUTED', 'CRIMEA', 0, '{\"type\":\"Polygon\",\"coordinates\":[[[32.201579,45.396892],[32.2052178,45.3690507],[32.2090567,45.3553206],[32.2172905,45.3355145],[32.2240585,45.3025866],[32.235686,45.2758033],[32.2434204,45.2628881],[32.2625503,45.2383126],[32.2738567,45.2267674],[32.2996887,45.2054331],[32.329404,45.1867687],[32.3624492,45.1711247],[32.3982085,45.1587952],[32.4168995,45.1539484],[32.4554687,45.1470047],[32.4878048,45.1442331],[32.5164102,45.1327887],[32.5532795,45.1222016],[32.5918488,45.115254],[32.6313994,45.1120768],[32.6711947,45.1127297],[32.729727,45.1208441],[32.8314558,45.1507864],[32.853076,45.1219934],[32.8767811,45.0994253],[32.8902144,45.0890467],[32.9199297,45.0703442],[32.9451894,45.0580954],[32.9796287,45.0321305],[33.0110823,45.0148866],[33.0279839,45.0074406],[33.0637432,44.9950757],[33.0879643,44.989073],[33.1342119,44.9689946],[33.192902,44.9506562],[33.2511697,44.9416162],[33.2951871,44.9405202],[33.5542562,44.8402319],[33.5621787,44.8410979],[33.5671526,44.838601],[33.5736666,44.8238183],[33.5866523,44.807848],[33.6044231,44.8103433],[33.6586481,44.7965631],[33.6693271,44.7918226],[33.6774224,44.7858657],[33.6827993,44.7703386],[33.6355485,44.7529449],[33.6136625,44.7497551],[33.6148368,44.7391957],[33.6111957,44.738286],[33.6105707,44.7329396],[33.611606,44.7296545],[33.6146258,44.729927],[33.6161203,44.711976],[33.6589663,44.7142533],[33.6708014,44.7097439],[33.7006932,44.7148119],[33.7072434,44.7105734],[33.7051533,44.7086069],[33.7050933,44.7049158],[33.7145084,44.705868],[33.715643,44.715848],[33.7265921,44.716636],[33.7348624,44.7075832],[33.7462868,44.7010307],[33.7518027,44.6987863],[33.7615132,44.7009902],[33.7769711,44.690265],[33.7674787,44.6820761],[33.754625,44.6753399],[33.7518666,44.6637439],[33.7300323,44.6470751],[33.7254762,44.6401041],[33.7176817,44.6375914],[33.7168675,44.6332156],[33.7218757,44.631584],[33.7162703,44.6204383],[33.7272166,44.6085501],[33.7286926,44.6046812],[33.735653,44.6009246],[33.7419126,44.6053835],[33.7496197,44.60791],[33.7651672,44.6091022],[33.7795796,44.6131096],[33.7828306,44.6059825],[33.781845,44.5971035],[33.7872108,44.5856602],[33.7920091,44.5848619],[33.7951987,44.5802969],[33.8004378,44.5814222],[33.8056839,44.5753186],[33.8093847,44.5769972],[33.8114458,44.5738111],[33.8139036,44.5771175],[33.8173303,44.577274],[33.8272108,44.5712636],[33.8273394,44.563316],[33.8310821,44.5548411],[33.8345552,44.5499395],[33.8372152,44.548782],[33.8337314,44.5416787],[33.8394649,44.5384748],[33.8401482,44.5304315],[33.8494976,44.5306195],[33.8572702,44.5258757],[33.8456566,44.519124],[33.85315,44.5154015],[33.8603572,44.5067568],[33.868911,44.5073968],[33.8707581,44.5054113],[33.8673484,44.5025419],[33.8672494,44.5003522],[33.8736292,44.4926938],[33.8869091,44.4822103],[33.8971535,44.4787873],[33.8934902,44.4732254],[33.8972198,44.4692246],[33.9262025,44.4213251],[33.9094099,44.4188846],[33.9024805,44.4193681],[33.8980569,44.4214726],[33.8828051,44.4210572],[33.8706281,44.4188467],[33.8591887,44.4199143],[33.8469623,44.4171293],[33.8292787,44.4089158],[33.8245729,44.411664],[33.8140922,44.4100258],[33.797829,44.4041246],[33.781585,44.4057444],[33.7840022,44.402866],[33.7855572,44.3968776],[33.7623083,44.3900862],[33.696591,44.1910397],[33.7357422,44.1858835],[33.7755079,44.184598],[33.8151473,44.1872073],[33.8567133,44.1943491],[33.9116725,44.1858835],[33.9514382,44.184598],[33.9910776,44.1872073],[34.0298524,44.1936623],[34.0670401,44.2038415],[34.0927335,44.2136353],[34.1417952,44.2137713],[34.2003274,44.2220125],[34.2375152,44.2321868],[34.2552959,44.2386127],[34.2888171,44.2539909],[34.3191029,44.2724903],[34.3328536,44.282804],[34.3551268,44.3032135],[34.3834932,44.3128241],[34.4170144,44.3281829],[34.4325985,44.3370516],[34.4579166,44.3546118],[34.4947227,44.3688605],[34.5111166,44.3769423],[34.5414024,44.3954029],[34.5678887,44.4166315],[34.590082,44.4402299],[34.607569,44.4657558],[34.6144422,44.4790935],[34.6220858,44.4994412],[34.6450122,44.5206113],[34.6661359,44.547163],[34.7006849,44.5628297],[34.735755,44.5848013],[34.7764494,44.5934492],[34.8085382,44.6038903],[34.8324881,44.6023351],[34.8722834,44.6029938],[34.9291911,44.6108698],[34.963432,44.598995],[35.0012394,44.590126],[35.0602428,44.5838827],[35.1197957,44.5863196],[35.1774068,44.5973337],[35.1957581,44.6028408],[35.2306662,44.6164595],[35.2586785,44.6310857],[35.2852182,44.6416945],[35.3171962,44.6585585],[35.3318979,44.668113],[35.3583842,44.6892424],[35.3805775,44.7127305],[35.3975542,44.7373268],[35.4116276,44.7442895],[35.4626979,44.7517865],[35.4998857,44.7618689],[35.5176664,44.7682366],[35.5511876,44.7834757],[35.5667717,44.7922754],[35.5952241,44.8120281],[35.6196208,44.8343376],[35.6322493,44.8491155],[35.670408,44.8272773],[35.7048906,44.8131714],[35.7230689,44.8074017],[35.7803291,44.7955387],[35.8397932,44.7921897],[35.8794326,44.7947719],[35.9241291,44.8026019],[35.9742343,44.8026778],[36.013533,44.8071728],[36.051603,44.8154218],[36.1028199,44.8336163],[36.1372853,44.8256548],[36.1764365,44.8205545],[36.2162022,44.8192829],[36.2558416,44.821864],[36.3134527,44.8328333],[36.3630225,44.8503296],[36.4154063,44.8528108],[36.454181,44.8591924],[36.4913688,44.869256],[36.5262768,44.8828121],[36.5426707,44.8908227],[36.5729565,44.9091205],[36.5994428,44.9301619],[36.6097225,44.9406672],[36.5679872,45.0506562],[36.5428648,45.1340402],[36.5338353,45.1751824],[36.530486,45.1992024],[36.5542469,45.2216309],[36.5859391,45.2441721],[36.5941742,45.252542],[36.5937019,45.2823897],[36.6030245,45.3093876],[36.6227602,45.3280113],[36.6635019,45.3599397],[36.6815681,45.4566115],[36.6684499,45.6266206],[36.583205,45.635158],[36.3387005,45.6715002],[36.1353542,45.6476547],[36.1034835,45.638376],[36.0723795,45.6256431],[36.028427,45.6242237],[35.9817734,45.6167329],[35.9534794,45.6280572],[35.9215589,45.6372534],[35.8711492,45.6454011],[35.8366954,45.6469342],[35.8022501,45.6453103],[35.7518847,45.6370298],[35.7200141,45.6277494],[35.6901483,45.6156372],[35.6627986,45.6008987],[35.6384328,45.5837842],[35.6174678,45.5645842],[35.6002625,45.5436256],[35.587111,45.5212652],[35.5764936,45.4903874],[35.5747509,45.4895333],[35.5487365,45.5142538],[35.5242787,45.5313252],[35.4968497,45.5460096],[35.459695,45.5603381],[35.4555162,45.5730522],[35.4443574,45.5959169],[35.4290297,45.6175579],[35.4198817,45.6278035],[35.3869834,45.6557223],[35.3609843,45.6715964],[35.3373014,45.6827713],[35.3237297,45.7127561],[35.3165721,45.7237303],[35.299254,45.7445762],[35.2663557,45.7724368],[35.2334204,45.7917299],[34.9750748,45.7619919],[34.9597746,45.7565682],[34.9411705,45.7658247],[34.876163,45.7904304],[34.7990874,45.8104643],[34.8021689,45.9006479],[34.7540112,45.9088363],[34.6699108,45.9676437],[34.628541,45.9864034],[34.6011392,45.9941699],[34.5816123,45.9956678],[34.5611691,45.9943843],[34.5542176,45.9904652],[34.5448398,45.9790277],[34.5443875,45.9761218],[34.5269998,45.9590021],[34.5109022,45.9480281],[34.4985264,45.9425606],[34.4762212,45.9441393],[34.459176,45.9512094],[34.4430184,45.9618096],[34.4233801,45.9786713],[34.4131796,45.9897359],[34.4107666,45.9992636],[34.4049875,46.0092864],[34.3471695,46.0549489],[34.3326403,46.0598467],[34.320021,46.0682092],[34.2648618,46.0548851],[34.2521968,46.0531749],[34.1843736,46.0668628],[34.1450093,46.0866862],[34.1359107,46.0966617],[34.1218931,46.1057194],[34.0809285,46.117556],[34.0695052,46.1166994],[34.0526389,46.1091293],[33.9982336,46.1264504],[33.971714,46.1411991],[33.9405553,46.1546515],[33.8973358,46.1706248],[33.86133,46.1945116],[33.8486859,46.1996667],[33.811324,46.203796],[33.7968936,46.2030156],[33.7726027,46.1976249],[33.7503231,46.18772],[33.7399776,46.1852474],[33.6995994,46.2028553],[33.6892658,46.2047794],[33.670864,46.2117939],[33.6661371,46.2207141],[33.6467708,46.22958],[33.6152408,46.2262179],[33.6177993,46.215981],[33.6135506,46.2139172],[33.6185932,46.213932],[33.6355706,46.1463365],[33.6412746,46.1424429],[33.6147111,46.1346624],[33.5870932,46.1191796],[33.5721329,46.1025643],[33.5911874,46.0612472],[33.5407189,46.0120312],[32.7727018,45.8266419],[32.7396744,45.8073204],[32.7259238,45.7972779],[32.7026395,45.7764183],[32.6659033,45.7625368],[32.6339252,45.7459969],[32.6054729,45.7265666],[32.5890615,45.7123247],[32.5685226,45.7063996],[32.5336146,45.6930389],[32.5016366,45.6764785],[32.4779329,45.660501],[32.4354921,45.6517736],[32.39936,45.6400966],[32.3822327,45.6329918],[32.3502547,45.6164136],[32.3218024,45.5969383],[32.2974057,45.5749258],[32.2868735,45.5630938],[32.2775192,45.5507836],[32.2643049,45.5283722],[32.2405042,45.5038633],[32.2230173,45.4787954],[32.2105624,45.4522796],[32.2062983,45.4386318],[32.2017961,45.4108733],[32.201579,45.396892]]]}'),
(2, 'DISPUTED', 'SEVASTOPOL', 0, '{\"type\":\"Polygon\",\"coordinates\":[[[33.3779569,44.5838462],[33.3930152,44.5681987],[33.3996503,44.5643423],[33.4016594,44.5610614],[33.4004612,44.5592715],[33.4071732,44.5565894],[33.4100748,44.5535486],[33.414671,44.5526219],[33.4163465,44.5493377],[33.4274077,44.5457891],[33.4284008,44.543313],[33.4350539,44.5419983],[33.4348217,44.5409146],[33.4497224,44.5320144],[33.4573813,44.5290313],[33.464198,44.5233092],[33.4788113,44.5192613],[33.4788555,44.5174026],[33.4814623,44.5157171],[33.4897719,44.5122984],[33.4927974,44.5125433],[33.4930381,44.5174183],[33.4889039,44.5249823],[33.5078625,44.5311455],[33.5264968,44.5459033],[33.5395687,44.539262],[33.542912,44.5395173],[33.5372403,44.5484954],[33.5389717,44.5502823],[33.5485239,44.554409],[33.5500686,44.5525636],[33.5478351,44.5516093],[33.5487427,44.5497441],[33.5539774,44.5515491],[33.562927,44.5488265],[33.5684734,44.5559147],[33.5608581,44.55859],[33.563492,44.5617802],[33.5728005,44.5610282],[33.5747846,44.5592686],[33.5792988,44.5620965],[33.5702383,44.5724854],[33.578923,44.5730758],[33.5847547,44.5754084],[33.5895307,44.5805367],[33.5923472,44.5877529],[33.5923331,44.5924807],[33.5842788,44.5996505],[33.576377,44.6033141],[33.5738875,44.606603],[33.5673845,44.6074099],[33.5672286,44.6088974],[33.5706902,44.6149581],[33.5828279,44.6132154],[33.5835438,44.6150882],[33.5782058,44.6192201],[33.5859866,44.6374677],[33.5960725,44.6407591],[33.6034952,44.651651],[33.5993199,44.6632008],[33.6103428,44.6726833],[33.5991785,44.6709085],[33.5935735,44.67909],[33.5975627,44.6990734],[33.5945586,44.7071473],[33.5873092,44.7054915],[33.5868975,44.7004837],[33.5518827,44.711301],[33.5560938,44.7201787],[33.5554076,44.7221413],[33.5466985,44.7220158],[33.5474959,44.6897199],[33.5424577,44.6576964],[33.5313548,44.6400224],[33.5168858,44.636586],[33.5105038,44.6309138],[33.5075866,44.6209989],[33.5047582,44.6165579],[33.5013126,44.6151564],[33.5019782,44.6118966],[33.4973069,44.6098852],[33.5001394,44.6082374],[33.5007351,44.603576],[33.4993233,44.6074879],[33.4978317,44.607504],[33.4957525,44.6109471],[33.4981029,44.6121538],[33.4952779,44.6148727],[33.4864865,44.612926],[33.4843169,44.6092739],[33.4812423,44.6085388],[33.4805395,44.6110345],[33.4739853,44.6119977],[33.4730492,44.6057619],[33.4706817,44.6050402],[33.4746431,44.6017974],[33.4707787,44.6005913],[33.4714544,44.5926046],[33.4684703,44.5946123],[33.4680171,44.6001056],[33.4662354,44.6009409],[33.4662572,44.6065902],[33.468789,44.6078146],[33.4681762,44.6119631],[33.4636229,44.6117513],[33.4602628,44.6093012],[33.4571182,44.6105217],[33.4482092,44.6078374],[33.4475432,44.6041441],[33.4498455,44.6016442],[33.4468175,44.5979061],[33.4481208,44.5973543],[33.4476833,44.5948093],[33.4441644,44.5987997],[33.4404307,44.599419],[33.4413997,44.6015135],[33.4400636,44.605054],[33.4339409,44.6038632],[33.4313517,44.5969346],[33.4262966,44.5989669],[33.4198732,44.5924681],[33.4241188,44.5947288],[33.4264939,44.5934479],[33.4248662,44.581237],[33.4314365,44.574999],[33.4359306,44.5745808],[33.4376948,44.572334],[33.4353869,44.571057],[33.4344226,44.5719787],[33.4366416,44.5730618],[33.4356493,44.573903],[33.4267301,44.5733978],[33.428097,44.5756042],[33.419624,44.5838806],[33.4191592,44.5871545],[33.4170871,44.5878755],[33.4168157,44.5928239],[33.4161384,44.587998],[33.4136207,44.5857566],[33.412809,44.5782986],[33.4143867,44.5766282],[33.4119291,44.572169],[33.4136588,44.5699718],[33.4122288,44.564404],[33.4110539,44.5650361],[33.4098393,44.5712544],[33.4107359,44.575972],[33.4094392,44.5779911],[33.4065798,44.5767197],[33.4024217,44.5708259],[33.4043875,44.5825173],[33.4024193,44.5834106],[33.4030967,44.5911368],[33.3984799,44.5914294],[33.395001,44.5875713],[33.383653,44.5863156],[33.3779569,44.5838462]]]}');
-- -----------------------------------
-- Dumping table b_location_field
-- -----------------------------------
DROP TABLE IF EXISTS `b_location_field`;
CREATE TABLE `b_location_field` (
  `LOCATION_ID` int(11) NOT NULL,
  `TYPE` int(11) NOT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`LOCATION_ID`,`TYPE`),
  KEY `IDX_BLLFL_VAL` (`VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_location_hierarchy
-- -----------------------------------
DROP TABLE IF EXISTS `b_location_hierarchy`;
CREATE TABLE `b_location_hierarchy` (
  `ANCESTOR_ID` int(11) NOT NULL,
  `DESCENDANT_ID` int(11) NOT NULL,
  `LEVEL` int(11) NOT NULL,
  PRIMARY KEY (`ANCESTOR_ID`,`DESCENDANT_ID`),
  KEY `IX_LOC_LH_D` (`DESCENDANT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_location_name
-- -----------------------------------
DROP TABLE IF EXISTS `b_location_name`;
CREATE TABLE `b_location_name` (
  `LOCATION_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `NAME_NORMALIZED` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`LOCATION_ID`,`LANGUAGE_ID`),
  KEY `IX_LOC_LNN` (`NAME_NORMALIZED`(200),`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_location_source
-- -----------------------------------
DROP TABLE IF EXISTS `b_location_source`;
CREATE TABLE `b_location_source` (
  `CODE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_location_source` VALUES
('GOOGLE', 'Google', 'a:4:{i:0;a:4:{s:4:\"code\";s:16:\"API_KEY_FRONTEND\";s:4:\"type\";s:6:\"string\";s:4:\"sort\";i:10;s:5:\"value\";s:0:\"\";}i:1;a:4:{s:4:\"code\";s:15:\"API_KEY_BACKEND\";s:4:\"type\";s:6:\"string\";s:4:\"sort\";i:20;s:5:\"value\";s:0:\"\";}i:2;a:4:{s:4:\"code\";s:18:\"SHOW_PHOTOS_ON_MAP\";s:4:\"type\";s:4:\"bool\";s:4:\"sort\";i:30;s:5:\"value\";b:1;}i:3;a:4:{s:4:\"code\";s:21:\"USE_GEOCODING_SERVICE\";s:4:\"type\";s:4:\"bool\";s:4:\"sort\";i:40;s:5:\"value\";b:1;}}'),
('OSM', 'OpenStreetMap', 'a:3:{i:0;a:5:{s:4:\"code\";s:11:\"SERVICE_URL\";s:4:\"type\";s:6:\"string\";s:10:\"is_visible\";b:1;s:4:\"sort\";i:10;s:5:\"value\";s:30:\"https://osm-ru-002.bitrix.info\";}i:1;a:5:{s:4:\"code\";s:15:\"MAP_SERVICE_URL\";s:4:\"type\";s:6:\"string\";s:10:\"is_visible\";b:1;s:4:\"sort\";i:15;s:5:\"value\";s:30:\"https://osm-ru-001.bitrix.info\";}i:2;a:5:{s:4:\"code\";s:5:\"TOKEN\";s:4:\"type\";s:6:\"string\";s:10:\"is_visible\";b:0;s:4:\"sort\";i:20;s:5:\"value\";N;}}');
-- -----------------------------------
-- Dumping table b_log_notification
-- -----------------------------------
DROP TABLE IF EXISTS `b_log_notification`;
CREATE TABLE `b_log_notification` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AUDIT_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECK_INTERVAL` int(11) DEFAULT NULL,
  `ALERT_COUNT` int(11) DEFAULT NULL,
  `DATE_CHECKED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_log_notification_action
-- -----------------------------------
DROP TABLE IF EXISTS `b_log_notification_action`;
CREATE TABLE `b_log_notification_action` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOTIFICATION_ID` int(10) unsigned NOT NULL,
  `NOTIFICATION_TYPE` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `RECIPIENT` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ADDITIONAL_TEXT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_log_notification_action_notification_id` (`NOTIFICATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_main_mail_blacklist
-- -----------------------------------
DROP TABLE IF EXISTS `b_main_mail_blacklist`;
CREATE TABLE `b_main_mail_blacklist` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime NOT NULL,
  `CATEGORY_ID` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B_MAIN_MAIL_BLACKLIST_CODE` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_main_mail_sender
-- -----------------------------------
DROP TABLE IF EXISTS `b_main_mail_sender`;
CREATE TABLE `b_main_mail_sender` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `IS_CONFIRMED` tinyint(4) NOT NULL DEFAULT '0',
  `IS_PUBLIC` tinyint(4) NOT NULL DEFAULT '0',
  `OPTIONS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_B_MAIN_MAIL_SENDER_USER_ID` (`USER_ID`,`IS_CONFIRMED`,`IS_PUBLIC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_main_mail_sender_send_counter
-- -----------------------------------
DROP TABLE IF EXISTS `b_main_mail_sender_send_counter`;
CREATE TABLE `b_main_mail_sender_send_counter` (
  `DATE_STAT` date NOT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CNT` int(11) NOT NULL,
  PRIMARY KEY (`DATE_STAT`,`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_medialib_collection
-- -----------------------------------
DROP TABLE IF EXISTS `b_medialib_collection`;
CREATE TABLE `b_medialib_collection` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `DATE_UPDATE` datetime NOT NULL,
  `OWNER_ID` int(11) DEFAULT NULL,
  `PARENT_ID` int(11) DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ITEMS_COUNT` int(11) DEFAULT NULL,
  `ML_TYPE` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_medialib_collection` VALUES
(1, 'foto', '', 'Y', '2023-04-05 21:30:47', 1, 0, NULL, '', NULL, 1);
-- -----------------------------------
-- Dumping table b_medialib_collection_item
-- -----------------------------------
DROP TABLE IF EXISTS `b_medialib_collection_item`;
CREATE TABLE `b_medialib_collection_item` (
  `COLLECTION_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ITEM_ID`,`COLLECTION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_medialib_collection_item` VALUES
(1, 1);
-- -----------------------------------
-- Dumping table b_medialib_item
-- -----------------------------------
DROP TABLE IF EXISTS `b_medialib_item`;
CREATE TABLE `b_medialib_item` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ITEM_TYPE` char(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `SOURCE_ID` int(11) NOT NULL,
  `KEYWORDS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SEARCHABLE_CONTENT` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_medialib_item` VALUES
(1, 'img_6.jpg', '', '', '2023-04-05 21:31:25', '2023-04-05 21:31:25', 41, '', NULL);
-- -----------------------------------
-- Dumping table b_medialib_type
-- -----------------------------------
DROP TABLE IF EXISTS `b_medialib_type`;
CREATE TABLE `b_medialib_type` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SYSTEM` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_medialib_type` VALUES
(1, 'image_name', 'image', 'jpg,jpeg,gif,png', 'Y', 'image_desc'),
(2, 'video_name', 'video', 'flv,mp4,wmv', 'Y', 'video_desc'),
(3, 'sound_name', 'sound', 'mp3,wma,aac', 'Y', 'sound_desc');
-- -----------------------------------
-- Dumping table b_messageservice_incoming_message
-- -----------------------------------
DROP TABLE IF EXISTS `b_messageservice_incoming_message`;
CREATE TABLE `b_messageservice_incoming_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `REQUEST_BODY` longtext COLLATE utf8_unicode_ci,
  `DATE_EXEC` datetime DEFAULT NULL,
  `SENDER_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `EXTERNAL_ID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_MS_INCOMING_MESSAGE_1` (`SENDER_ID`,`EXTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_messageservice_message
-- -----------------------------------
DROP TABLE IF EXISTS `b_messageservice_message`;
CREATE TABLE `b_messageservice_message` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `SENDER_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `AUTHOR_ID` int(18) NOT NULL DEFAULT '0',
  `MESSAGE_FROM` varchar(260) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE_TO` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_HEADERS` longtext COLLATE utf8_unicode_ci,
  `MESSAGE_BODY` longtext COLLATE utf8_unicode_ci NOT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `DATE_EXEC` datetime DEFAULT NULL,
  `NEXT_EXEC` datetime DEFAULT NULL,
  `SUCCESS_EXEC` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `EXEC_ERROR` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `STATUS_ID` int(18) NOT NULL DEFAULT '0',
  `EXTERNAL_ID` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EXTERNAL_STATUS` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLUSTER_GROUP` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `B_MESSAGESERVICE_MESSAGE_1` (`DATE_EXEC`),
  KEY `B_MESSAGESERVICE_MESSAGE_3` (`SENDER_ID`,`EXTERNAL_ID`),
  KEY `B_MESSAGESERVICE_MESSAGE_2` (`SUCCESS_EXEC`,`CLUSTER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_messageservice_rest_app
-- -----------------------------------
DROP TABLE IF EXISTS `b_messageservice_rest_app`;
CREATE TABLE `b_messageservice_rest_app` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `HANDLER` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ADD` datetime DEFAULT NULL,
  `AUTHOR_ID` int(18) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `B_MESSAGESERVICE_REST_APP_1` (`APP_ID`,`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_messageservice_rest_app_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_messageservice_rest_app_lang`;
CREATE TABLE `b_messageservice_rest_app_lang` (
  `ID` int(18) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(18) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APP_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_module
-- -----------------------------------
DROP TABLE IF EXISTS `b_module`;
CREATE TABLE `b_module` (
  `ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_ACTIVE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_module` VALUES
('b24connector', '2023-03-31 22:20:39'),
('bitrix.sitecorporate', '2023-03-31 22:20:40'),
('fileman', '2023-03-31 22:20:40'),
('highloadblock', '2023-03-31 22:20:41'),
('iblock', '2023-03-31 22:20:41'),
('landing', '2023-03-31 22:20:42'),
('location', '2023-03-31 22:51:37'),
('main', '2023-03-31 22:20:39'),
('messageservice', '2023-03-31 22:20:42'),
('rest', '2023-03-31 22:20:43'),
('ui', '2023-03-31 22:20:45');
-- -----------------------------------
-- Dumping table b_module_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_module_group`;
CREATE TABLE `b_module_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `G_ACCESS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_GROUP_MODULE` (`MODULE_ID`,`GROUP_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_module_to_module
-- -----------------------------------
DROP TABLE IF EXISTS `b_module_to_module`;
CREATE TABLE `b_module_to_module` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `FROM_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MESSAGE_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `TO_MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `TO_PATH` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_CLASS` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TO_METHOD_ARG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` int(11) DEFAULT NULL,
  `UNIQUE_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_module_to_module_unique_id` (`UNIQUE_ID`),
  KEY `ix_module_to_module` (`FROM_MODULE_ID`(20),`MESSAGE_ID`(20),`TO_MODULE_ID`(20),`TO_CLASS`(20),`TO_METHOD`(20))
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_module_to_module` VALUES
(1, '2023-03-31 22:20:39', 100, 'iblock', 'OnIBlockPropertyBuildList', 'main', '/modules/main/tools/prop_userid.php', 'CIBlockPropertyUserID', 'GetUserTypeDescription', '', 1, '2b30c309bf87645959b9bfbed51b49c6'),
(2, '2023-03-31 22:20:39', 100, 'main', 'OnUserDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnUserDelete', '', 1, 'f437e170e4daf957766b0b0579f08fb4'),
(3, '2023-03-31 22:20:39', 100, 'main', 'OnLanguageDelete', 'main', '/modules/main/classes/mysql/favorites.php', 'CFavorites', 'OnLanguageDelete', '', 1, '9211999c5cfc3a4d374e4f957d5079f6'),
(4, '2023-03-31 22:20:39', 100, 'main', 'OnUserDelete', 'main', '', 'CUserOptions', 'OnUserDelete', '', 1, '9ef4e969f975b6425c7113444d210a90'),
(5, '2023-03-31 22:20:39', 100, 'main', 'OnChangeFile', 'main', '', 'CMain', 'OnChangeFileComponent', '', 1, '332179402f77c4d41c6c2e524acde4d0'),
(6, '2023-03-31 22:20:39', 100, 'main', 'OnUserTypeRightsCheck', 'main', '', 'CUser', 'UserTypeRightsCheck', '', 1, 'e1aae03ea8eb08e7bbb6d8d42cbc2ebe'),
(7, '2023-03-31 22:20:39', 100, 'main', 'OnUserLogin', 'main', '', 'UpdateTools', 'CheckUpdates', '', 1, 'a2986b9f6e9a99c0351c2ba858dafc85'),
(8, '2023-03-31 22:20:39', 100, 'main', 'OnModuleUpdate', 'main', '', 'UpdateTools', 'SetUpdateResult', '', 1, 'f9b70c6a75b6341063b23bde5d32e582'),
(9, '2023-03-31 22:20:39', 100, 'main', 'OnUpdateCheck', 'main', '', 'UpdateTools', 'SetUpdateError', '', 1, 'a0aecef95a192ec3dd134f71f0f4f175'),
(10, '2023-03-31 22:20:39', 100, 'main', 'OnPanelCreate', 'main', '', 'CUndo', 'CheckNotifyMessage', '', 1, '6476f96ffba6ab2b4a7dbe644f42edf6'),
(11, '2023-03-31 22:20:39', 100, 'main', 'OnAfterAddRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterAddRating', '', 1, '6122bee2ad083f8f72e35655cee48859'),
(12, '2023-03-31 22:20:39', 100, 'main', 'OnAfterUpdateRating', 'main', '', 'CRatingsComponentsMain', 'OnAfterUpdateRating', '', 1, 'f8f806e33dc35737bdbe6b9bc42626a4'),
(13, '2023-03-31 22:20:39', 100, 'main', 'OnSetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnSetRatingConfigs', '', 1, '9244ca7fd6964757ca191c9407cb1218'),
(14, '2023-03-31 22:20:39', 100, 'main', 'OnGetRatingsConfigs', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingConfigs', '', 1, 'd8ae8e1f8889b1fbb6af276fb14c8411'),
(15, '2023-03-31 22:20:39', 100, 'main', 'OnGetRatingsObjects', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingObject', '', 1, '129315715250c195ee115002b445a156'),
(16, '2023-03-31 22:20:39', 100, 'main', 'OnGetRatingContentOwner', 'main', '', 'CRatingsComponentsMain', 'OnGetRatingContentOwner', '', 1, 'bf1f5deaa1532fe9a28acd6d19d23a80'),
(17, '2023-03-31 22:20:39', 100, 'main', 'OnAfterAddRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterAddRatingRule', '', 1, '298e763431f7f7d6c3af9798663f410d'),
(18, '2023-03-31 22:20:39', 100, 'main', 'OnAfterUpdateRatingRule', 'main', '', 'CRatingRulesMain', 'OnAfterUpdateRatingRule', '', 1, '4ecdc4a15e24c49f0fa8f44064bf1511'),
(19, '2023-03-31 22:20:39', 100, 'main', 'OnGetRatingRuleObjects', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleObjects', '', 1, '6ac10928b76183004ba0e88ace0a1b5b'),
(20, '2023-03-31 22:20:39', 100, 'main', 'OnGetRatingRuleConfigs', 'main', '', 'CRatingRulesMain', 'OnGetRatingRuleConfigs', '', 1, '06769c4f6bbba4fad79c1619a874ee97'),
(21, '2023-03-31 22:20:39', 100, 'main', 'OnAfterUserAdd', 'main', '', 'CRatings', 'OnAfterUserRegister', '', 1, 'ecb9ae0476db69da6c95b06bcb3aebbb'),
(22, '2023-03-31 22:20:39', 100, 'main', 'OnUserDelete', 'main', '', 'CRatings', 'OnUserDelete', '', 1, '9fe6984fd29b7ab9508ac02c23690094'),
(23, '2023-03-31 22:20:39', 100, 'main', 'OnAfterGroupAdd', 'main', '', 'CGroupAuthProvider', 'OnAfterGroupAdd', '', 1, '02f2fe70b9068a6b307192321fe74430'),
(24, '2023-03-31 22:20:39', 100, 'main', 'OnBeforeGroupUpdate', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupUpdate', '', 1, 'ef0f2e4d0ae7bbf59d0798e8078143f9'),
(25, '2023-03-31 22:20:39', 100, 'main', 'OnBeforeGroupDelete', 'main', '', 'CGroupAuthProvider', 'OnBeforeGroupDelete', '', 1, 'd3ec9527c0e77709402a05ae4249afca'),
(26, '2023-03-31 22:20:39', 100, 'main', 'OnAfterSetUserGroup', 'main', '', 'CGroupAuthProvider', 'OnAfterSetUserGroup', '', 1, '0de6c5b48e9382f6e857d79f76d95f25'),
(27, '2023-03-31 22:20:39', 100, 'main', 'OnEventLogGetAuditTypes', 'main', '', 'CEventMain', 'GetAuditTypes', '', 1, 'ac0b8b7a5e703131a3bd41b4399bc032'),
(28, '2023-03-31 22:20:39', 100, 'main', 'OnEventLogGetAuditHandlers', 'main', '', 'CEventMain', 'MakeMainObject', '', 1, '1ddb38ccf35a8a9da5d3b2bc80591ad6'),
(29, '2023-03-31 22:20:39', 100, 'perfmon', 'OnGetTableSchema', 'main', '', 'CTableSchema', 'OnGetTableSchema', '', 1, 'c1f65f88d449e8b8a3b7af9d54ef3f50'),
(30, '2023-03-31 22:20:39', 100, 'sender', 'OnConnectorList', 'main', '', '\\Bitrix\\Main\\SenderEventHandler', 'onConnectorListUser', '', 1, '8af99568465a1ccdb6a84e868cf5aad8'),
(31, '2023-03-31 22:20:39', 110, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeString', 'GetUserTypeDescription', '', 1, '09f8200652932044934bd3c522e920c5'),
(32, '2023-03-31 22:20:39', 120, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeInteger', 'GetUserTypeDescription', '', 1, '71ef247b3eb3b07e4bd6940791b89497'),
(33, '2023-03-31 22:20:39', 130, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDouble', 'GetUserTypeDescription', '', 1, '4fe2008255fe567423cc0c2f080ca741'),
(34, '2023-03-31 22:20:39', 140, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDateTime', 'GetUserTypeDescription', '', 1, '686c0679e60bee52dbcc27f5502277b6'),
(35, '2023-03-31 22:20:39', 145, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeDate', 'GetUserTypeDescription', '', 1, '7e19b5fc5fc48b1cd317a6ac44d84236'),
(36, '2023-03-31 22:20:39', 150, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeBoolean', 'GetUserTypeDescription', '', 1, '4d5e1dd2369089f2db9480549241205f'),
(37, '2023-03-31 22:20:39', 155, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeUrl', 'GetUserTypeDescription', '', 1, '79fcd650625b296abf13216cd5af2428'),
(38, '2023-03-31 22:20:39', 160, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeFile', 'GetUserTypeDescription', '', 1, '67b9a4fbc45240a7887b73e3a246eba0'),
(39, '2023-03-31 22:20:39', 170, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeEnum', 'GetUserTypeDescription', '', 1, 'fbebdb289fe38c1fbfeda4d3d8ee43ef'),
(40, '2023-03-31 22:20:39', 180, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockSection', 'GetUserTypeDescription', '', 1, '2065f8305645790970bac0b99f127f47'),
(41, '2023-03-31 22:20:39', 190, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeIBlockElement', 'GetUserTypeDescription', '', 1, '65bda5818e3545f1683a3ff5271cc891'),
(42, '2023-03-31 22:20:39', 200, 'main', 'OnUserTypeBuildList', 'main', '', 'CUserTypeStringFormatted', 'GetUserTypeDescription', '', 1, '47e3cf1c280e01dbaed43f9989a6747b'),
(43, '2023-03-31 22:20:39', 210, 'main', 'OnUserTypeBuildList', 'main', '', '\\Bitrix\\Main\\UrlPreview\\UrlPreviewUserType', 'getUserTypeDescription', '', 1, '719d15ee5f60f6348d2bd6a8911aeed1'),
(44, '2023-03-31 22:20:39', 100, 'main', 'OnBeforeEndBufferContent', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeEndBufferContent', '', 1, 'ff5eb984fe6ce3e8d769bf3ba646b902'),
(45, '2023-03-31 22:20:39', 100, 'main', 'OnBeforeRestartBuffer', 'main', '', '\\Bitrix\\Main\\Analytics\\Counter', 'onBeforeRestartBuffer', '', 1, '0782f5a6df6dd52d834caea88c3ba3a7'),
(46, '2023-03-31 22:20:39', 100, 'main', 'OnFileDelete', 'main', '', '\\Bitrix\\Main\\UI\\Viewer\\FilePreviewTable', 'onFileDelete', '', 1, '54c80cd94412db221338aeb59902f059'),
(47, '2023-03-31 22:20:39', 100, 'socialnetwork', 'OnSocNetLogDelete', 'main', '', 'CUserCounter', 'OnSocNetLogDelete', '', 1, '33e603755a0bc07abd51a1f8ed52966e'),
(48, '2023-03-31 22:20:39', 100, 'socialnetwork', 'OnSocNetLogCommentDelete', 'main', '', 'CUserCounter', 'OnSocNetLogCommentDelete', '', 1, '51ee2214895be904a880046f43e84138'),
(49, '2023-03-31 22:20:39', 100, 'main', 'OnAdminInformerInsertItems', 'main', '', 'CMpNotifications', 'OnAdminInformerInsertItemsHandlerMP', '', 1, 'c89c0e94ac1110c334a24c70e1773daa'),
(50, '2023-03-31 22:20:39', 100, 'rest', 'OnRestServiceBuildDescription', 'main', '', '\\Bitrix\\Main\\Rest\\Handlers', 'onRestServiceBuildDescription', '', 1, 'c0b0c358a21b648d4f9c5d29d17a5ab2'),
(51, '2023-03-31 22:20:39', 100, 'main', 'OnBeforeUserTypeAdd', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'OnBeforeUserTypeAdd', '', 1, 'e204684efc0764af9431ca94b950619a'),
(52, '2023-03-31 22:20:39', 100, 'main', 'OnAfterUserTypeAdd', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onAfterUserTypeAdd', '', 1, '50932fb244caf7af686fac906caf3e73'),
(53, '2023-03-31 22:20:39', 100, 'main', 'OnBeforeUserTypeDelete', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'OnBeforeUserTypeDelete', '', 1, 'd22a86deba0ff4bd031d022e331033b4'),
(54, '2023-03-31 22:20:39', 100, 'main', 'OnAuthProvidersBuildList', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessAuthProvider', 'getProviders', '', 1, '3a2839dac113bf47bce01812903e768a'),
(55, '2023-03-31 22:20:39', 100, 'iblock', 'OnBeforeIBlockSectionUpdate', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionUpdate', '', 1, 'dde505dba68c59bd4661b7680c329485'),
(56, '2023-03-31 22:20:39', 100, 'iblock', 'OnBeforeIBlockSectionAdd', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionAdd', '', 1, 'd3a665b1890dabbba32ff01e3e46ec57'),
(57, '2023-03-31 22:20:39', 100, 'iblock', 'OnBeforeIBlockSectionDelete', 'main', '', '\\Bitrix\\Main\\Access\\Auth\\AccessEventHandler', 'onBeforeIBlockSectionDelete', '', 1, '157add4b02621a60fabf1369c3e7ea9b'),
(58, '2023-03-31 22:20:39', 100, 'sale', 'OnSaleBasketItemSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogBasket', '', 2, 'fa4fc3924ff2585e92f8bdabaf287864'),
(59, '2023-03-31 22:20:39', 100, 'sale', 'OnSaleOrderSaved', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrder', '', 2, '6b358bb17b30da91b105fb1451ed9aaa'),
(60, '2023-03-31 22:20:39', 100, 'sale', 'OnSaleOrderPaid', 'main', '', '\\Bitrix\\Main\\Analytics\\Catalog', 'catchCatalogOrderPayment', '', 2, '8f5ca6e1c5136cb4bbf30474f0ff4183'),
(61, '2023-03-31 22:20:39', 1000, 'sale', 'onBuildDiscountConditionInterfaceControls', 'main', '', '\\Bitrix\\Main\\Discount\\UserConditionControl', 'onBuildDiscountConditionInterfaceControls', '', 1, '9f0d91c081704e52b52f540b3acaf52e'),
(62, '2023-03-31 22:20:39', 100, 'main', 'OnBeforePhpMail', 'main', '', '\\Bitrix\\Main\\Mail\\Sender', 'applyCustomSmtp', '', 2, '10fbf5b8dec05a02d8d7010e594f16ec'),
(63, '2023-03-31 22:20:39', 100, 'main', 'OnBuildFilterFactoryMethods', 'main', '', '\\Bitrix\\Main\\Filter\\FactoryMain', 'onBuildFilterFactoryMethods', '', 2, '19f10c2686a955bd8b8116ea1f1ad829'),
(64, '2023-03-31 22:20:39', 100, 'main', 'onGetUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onGetUserFieldValues', '', 2, '7f9a5e25d638a6bff29f0bf4666da1a9'),
(65, '2023-03-31 22:20:39', 100, 'main', 'onUpdateUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onUpdateUserFieldValues', '', 2, 'd78761f994d74258421d271810f03ebf'),
(66, '2023-03-31 22:20:39', 100, 'main', 'onDeleteUserFieldValues', 'main', '', '\\Bitrix\\Main\\UserField\\Internal\\UserFieldHelper', 'onDeleteUserFieldValues', '', 2, '074b2e25238a00ffc809ad12b609db2c'),
(67, '2023-03-31 22:20:39', 100, 'main', 'OnAfterUserTypeAdd', 'main', '', '\\Bitrix\\Main\\ORM\\Entity', 'onUserTypeChange', '', 2, '37b1b1538fa6a6c5f41c9ce4afbf2789'),
(68, '2023-03-31 22:20:39', 100, 'main', 'OnAfterUserTypeUpdate', 'main', '', '\\Bitrix\\Main\\ORM\\Entity', 'onUserTypeChange', '', 2, '6a53bbd6e85686f4aa8a69d3d75f7e37'),
(69, '2023-03-31 22:20:39', 100, 'main', 'OnAfterUserTypeDelete', 'main', '', '\\Bitrix\\Main\\ORM\\Entity', 'onUserTypeChange', '', 2, '010cc1e3107418a1fd9f9a4cde7d93b9'),
(70, '2023-03-31 22:20:39', 100, 'main', 'OnBuildGlobalMenu', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBuildGlobalMenu', '', 1, '9c4452a442bacc2d4d70635962485be1'),
(71, '2023-03-31 22:20:39', 100, 'main', 'OnBeforeProlog', 'b24connector', '', '\\Bitrix\\B24Connector\\Helper', 'onBeforeProlog', '', 1, '641053ff6ee8ff57518d7c30724530e5'),
(72, '2023-03-31 22:20:40', 100, 'main', 'OnBeforeProlog', 'bitrix.sitecorporate', '', 'CSiteCorporate', 'ShowPanel', '', 1, 'bc7c322534797a9ed3493c40e1b8fdac'),
(97, '2023-03-31 22:20:40', 100, 'main', 'OnGroupDelete', 'fileman', '', 'CFileman', 'OnGroupDelete', '', 1, 'd10f791d422ba0e7551ab267db50404c'),
(98, '2023-03-31 22:20:40', 100, 'main', 'OnPanelCreate', 'fileman', '', 'CFileman', 'OnPanelCreate', '', 1, 'b00a6174fb1763684c299ccf5e054c65'),
(99, '2023-03-31 22:20:40', 100, 'main', 'OnModuleUpdate', 'fileman', '', 'CFileman', 'OnModuleUpdate', '', 1, '58ae853e2b7c230b5cdb51129efd8a05'),
(100, '2023-03-31 22:20:40', 100, 'main', 'OnModuleInstalled', 'fileman', '', 'CFileman', 'ClearComponentsListCache', '', 1, '7bdbd354eab11f376fa257a998587277'),
(101, '2023-03-31 22:20:40', 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapGoogle', 'GetUserTypeDescription', '', 1, 'd9d06fd05f80b33379359ebd8e36e655'),
(102, '2023-03-31 22:20:40', 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyMapYandex', 'GetUserTypeDescription', '', 1, '20ca1d02998884b5abec68b32fdb561d'),
(103, '2023-03-31 22:20:40', 100, 'iblock', 'OnIBlockPropertyBuildList', 'fileman', '', 'CIBlockPropertyVideo', 'GetUserTypeDescription', '', 1, '991c32062e05844708a5cf7aba37bf9a'),
(104, '2023-03-31 22:20:40', 100, 'main', 'OnUserTypeBuildList', 'fileman', '', 'CUserTypeVideo', 'GetUserTypeDescription', '', 1, '41bc5efb49ebf8d165acd4e4d556f60c'),
(105, '2023-03-31 22:20:40', 100, 'main', 'OnEventLogGetAuditTypes', 'fileman', '', 'CEventFileman', 'GetAuditTypes', '', 1, 'e0a610651ffec1fbddb2f261223fb2e9'),
(106, '2023-03-31 22:20:40', 100, 'main', 'OnEventLogGetAuditHandlers', 'fileman', '', 'CEventFileman', 'MakeFilemanObject', '', 1, 'fbfef1ef99530f6eae191da293f9566c'),
(107, '2023-03-31 22:20:40', 154, 'main', 'OnUserTypeBuildList', 'fileman', '', '\\Bitrix\\Fileman\\UserField\\Address', 'getUserTypeDescription', '', 1, 'f0583a376e38d3d2675513b1a367ed3c'),
(108, '2023-03-31 22:20:41', 100, 'main', 'OnBeforeUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeAdd', '', 1, 'f9dcff287cf7753e5c56974d37975507'),
(109, '2023-03-31 22:20:41', 100, 'main', 'OnAfterUserTypeAdd', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'onAfterUserTypeAdd', '', 1, 'd1fa2865e72eca144b964b6fb1eefc15'),
(110, '2023-03-31 22:20:41', 100, 'main', 'OnBeforeUserTypeDelete', 'highloadblock', '', '\\Bitrix\\Highloadblock\\HighloadBlockTable', 'OnBeforeUserTypeDelete', '', 1, '1bf13707e1a45b8320c2ecd35534cbb4'),
(111, '2023-03-31 22:20:41', 100, 'main', 'OnUserTypeBuildList', 'highloadblock', '', 'CUserTypeHlblock', 'GetUserTypeDescription', '', 1, '2ac4a2154f4fd85d67b50f412ed5ed48'),
(112, '2023-03-31 22:20:41', 100, 'iblock', 'OnIBlockPropertyBuildList', 'highloadblock', '', 'CIBlockPropertyDirectory', 'GetUserTypeDescription', '', 1, 'a6f7df502db8a04590e43188d7cbfc99'),
(113, '2023-03-31 22:20:41', 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlock', 'OnGroupDelete', '', 1, 'f2320df213f38adf32364d3169d5b197'),
(114, '2023-03-31 22:20:41', 100, 'main', 'OnBeforeLangDelete', 'iblock', '', 'CIBlock', 'OnBeforeLangDelete', '', 1, '46aef774958db327c1170a12d3a70ee5'),
(115, '2023-03-31 22:20:41', 100, 'main', 'OnLangDelete', 'iblock', '', 'CIBlock', 'OnLangDelete', '', 1, '861f6ee2ca56bf63c3af07db0553606b'),
(116, '2023-03-31 22:20:41', 100, 'main', 'OnUserTypeRightsCheck', 'iblock', '', 'CIBlockSection', 'UserTypeRightsCheck', '', 1, '2a6d446893d46f04f2c151f458d2908c'),
(117, '2023-03-31 22:20:41', 100, 'search', 'OnReindex', 'iblock', '', 'CIBlock', 'OnSearchReindex', '', 1, 'c6c8111f129e0eb19e558106e354e6f6'),
(118, '2023-03-31 22:20:41', 100, 'search', 'OnSearchGetURL', 'iblock', '', 'CIBlock', 'OnSearchGetURL', '', 1, '0ae9fc756bfb1273309240cd8f535672'),
(119, '2023-03-31 22:20:41', 100, 'main', 'OnEventLogGetAuditTypes', 'iblock', '', 'CIBlock', 'GetAuditTypes', '', 1, '182d19c163e3a5a965bca170c3fb0e83'),
(120, '2023-03-31 22:20:41', 100, 'main', 'OnEventLogGetAuditHandlers', 'iblock', '', 'CEventIBlock', 'MakeIBlockObject', '', 1, 'f7a182e8d9b204970d111e4703b9f523'),
(121, '2023-03-31 22:20:41', 200, 'main', 'OnGetRatingContentOwner', 'iblock', '', 'CRatingsComponentsIBlock', 'OnGetRatingContentOwner', '', 1, '6da245944e376d586a3fa2aaee02c70b'),
(122, '2023-03-31 22:20:41', 100, 'main', 'OnTaskOperationsChanged', 'iblock', '', 'CIBlockRightsStorage', 'OnTaskOperationsChanged', '', 1, '01b3f9984fa07b1dfb4bc35d107d5672'),
(123, '2023-03-31 22:20:41', 100, 'main', 'OnGroupDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnGroupDelete', '', 1, '2dbbccdee3f2e7bd86446bec02be1d54'),
(124, '2023-03-31 22:20:41', 100, 'main', 'OnUserDelete', 'iblock', '', 'CIBlockRightsStorage', 'OnUserDelete', '', 1, '78f090ee29030c54788098b0782d28f9'),
(125, '2023-03-31 22:20:41', 100, 'perfmon', 'OnGetTableSchema', 'iblock', '', 'iblock', 'OnGetTableSchema', '', 1, '4b71a345c136beed338aa7137943d80b'),
(126, '2023-03-31 22:20:41', 100, 'sender', 'OnConnectorList', 'iblock', '', '\\Bitrix\\Iblock\\SenderEventHandler', 'onConnectorListIblock', '', 1, '3de75587a47352dd3cb6d10866f69385'),
(127, '2023-03-31 22:20:41', 10, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDate', 'GetUserTypeDescription', '', 1, 'fa608e2c397b6793c54ad296619a22e2'),
(128, '2023-03-31 22:20:41', 20, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyDateTime', 'GetUserTypeDescription', '', 1, '78554c9e3c38ac383d51f0ee4d013120'),
(129, '2023-03-31 22:20:41', 30, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyXmlID', 'GetUserTypeDescription', '', 1, '952fe5f2ea67493fb9f9b924ce1b992b'),
(130, '2023-03-31 22:20:41', 40, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyFileMan', 'GetUserTypeDescription', '', 1, 'fd688441d5e8203751fb47374931e011'),
(131, '2023-03-31 22:20:41', 50, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyHTML', 'GetUserTypeDescription', '', 1, '27645f81ce5d6d9f19a47cc171860beb'),
(132, '2023-03-31 22:20:41', 60, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementList', 'GetUserTypeDescription', '', 1, 'c53e9314ae43c30267b32310a02d7df4'),
(133, '2023-03-31 22:20:41', 70, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySequence', 'GetUserTypeDescription', '', 1, '3ff9528d1264fc77697248957aafdab5'),
(134, '2023-03-31 22:20:41', 80, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertyElementAutoComplete', 'GetUserTypeDescription', '', 1, '0d233a1e7a0d6a52a52e13df88291024'),
(135, '2023-03-31 22:20:41', 90, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySKU', 'GetUserTypeDescription', '', 1, '8678bc826ced4f66640fba3775b18516'),
(136, '2023-03-31 22:20:41', 100, 'iblock', 'OnIBlockPropertyBuildList', 'iblock', '', 'CIBlockPropertySectionAutoComplete', 'GetUserTypeDescription', '', 1, '26ff6f651cb94a1fe4ce9827566f0730'),
(137, '2023-03-31 22:20:41', 100, 'main', 'onVirtualClassBuildList', 'iblock', '', 'Bitrix\\Iblock\\IblockTable', 'compileAllEntities', '', 2, '8a4e85071d25e6ba7f9ed315874c411b'),
(138, '2023-03-31 22:20:42', 100, 'crm', 'onAfterCrmCompanyAdd', 'landing', '', '\\Bitrix\\Landing\\Connector\\Crm', 'onAfterCompanyChange', '', 2, '7e8fed841380d8075d45525f328e8940'),
(139, '2023-03-31 22:20:42', 100, 'crm', 'onAfterCrmCompanyUpdate', 'landing', '', '\\Bitrix\\Landing\\Connector\\Crm', 'onAfterCompanyChange', '', 2, '688027a0f389137b02ac0a834f0a8495'),
(140, '2023-03-31 22:20:42', 100, 'iblock', 'onAfterIBlockSectionDelete', 'landing', '', '\\Bitrix\\Landing\\Connector\\Iblock', 'onAfterIBlockSectionDelete', '', 2, 'ffe8a984ae7ff50064ac74e788a80118'),
(141, '2023-03-31 22:20:42', 100, 'intranet', 'onBuildBindingMenu', 'landing', '', '\\Bitrix\\Landing\\Connector\\Intranet', 'onBuildBindingMenu', '', 2, 'd5464da9aea2308d3d5f13c2387c4c40'),
(142, '2023-03-31 22:20:42', 100, 'landing', 'onBuildSourceList', 'landing', '', '\\Bitrix\\Landing\\Connector\\Landing', 'onSourceBuildHandler', '', 2, 'fc391addc82a816df68510b0ae3363a5'),
(143, '2023-03-31 22:20:42', 100, 'main', 'onBeforeSiteDelete', 'landing', '', '\\Bitrix\\Landing\\Site', 'onBeforeMainSiteDelete', '', 2, '5faa9b5de931dbb101e2e0aef6fc594b'),
(144, '2023-03-31 22:20:42', 100, 'main', 'onSiteDelete', 'landing', '', '\\Bitrix\\Landing\\Site', 'onMainSiteDelete', '', 2, 'af029bceca7ea9cc809515e95bd3a710'),
(145, '2023-03-31 22:20:42', 100, 'main', 'onUserConsentProviderList', 'landing', '', '\\Bitrix\\Landing\\Site\\Cookies', 'onUserConsentProviderList', '', 2, 'f59a96e272348f934d62ba5d3ee79f21'),
(146, '2023-03-31 22:20:42', 100, 'mobile', 'onMobileMenuStructureBuilt', 'landing', '', '\\Bitrix\\Landing\\Connector\\Mobile', 'onMobileMenuStructureBuilt', '', 2, '01fd8a44b83b5f7fcd2f36a626657ad0'),
(147, '2023-03-31 22:20:42', 100, 'rest', 'onRestServiceBuildDescription', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'restBase', '', 2, '9af99ddecf2dd8c3c5b14721f23e8fef'),
(148, '2023-03-31 22:20:42', 100, 'rest', 'onBeforeApplicationUninstall', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'beforeRestApplicationDelete', '', 2, 'ef1f080a088ad54298a4ba9bf2896313'),
(149, '2023-03-31 22:20:42', 100, 'rest', 'onRestAppDelete', 'landing', '', '\\Bitrix\\Landing\\Publicaction', 'restApplicationDelete', '', 2, '031cfc016e3be91368376a391c351dea'),
(150, '2023-03-31 22:20:42', 100, 'rest', 'onRestApplicationConfigurationGetManifest', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'getManifestList', '', 2, 'b88124aac7c2c8ddecf2ce127a9c6ef8'),
(151, '2023-03-31 22:20:42', 100, 'rest', 'onRestApplicationConfigurationExport', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onEventExportController', '', 2, '917b00a9f82e6b8f7899a6e8c3b22236'),
(152, '2023-03-31 22:20:42', 100, 'rest', 'onRestApplicationConfigurationGetManifestSetting', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onInitManifest', '', 2, '99fa9aa37a23a371cca0153c840c7802'),
(153, '2023-03-31 22:20:42', 100, 'rest', 'onRestApplicationConfigurationEntity', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'getEntityList', '', 2, '820df699b9abf22ce0356fc9957be794'),
(154, '2023-03-31 22:20:42', 100, 'rest', 'onRestApplicationConfigurationImport', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onEventImportController', '', 2, 'e65daaed01b2c52e6098ee47ddb7f07a'),
(155, '2023-03-31 22:20:42', 100, 'rest', 'onRestApplicationConfigurationFinish', 'landing', '', '\\Bitrix\\Landing\\Transfer\\AppConfiguration', 'onFinish', '', 2, '45343e5617dca2ad06a5d13050232caf'),
(156, '2023-03-31 22:20:42', 100, 'seo', 'onExtensionInstall', 'landing', '', '\\Bitrix\\Landing\\Hook\\Page\\PixelFb', 'changeBusinessPixel', '', 2, '27bf01f04349ff82ede423de62df5384'),
(157, '2023-03-31 22:20:42', 100, 'socialnetwork', 'onFillSocNetFeaturesList', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onFillSocNetFeaturesList', '', 2, '9825d91c89b53b69655aa98ea4f3a6cf'),
(158, '2023-03-31 22:20:42', 100, 'socialnetwork', 'onFillSocNetMenu', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onFillSocNetMenu', '', 2, '14ecfb8fb4fc20f22ddb5ac64783461d'),
(159, '2023-03-31 22:20:42', 100, 'socialnetwork', 'onSocNetGroupDelete', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onSocNetGroupDelete', '', 2, '78202f1461a8822a105a19f45502c327'),
(160, '2023-03-31 22:20:42', 100, 'main', 'OnAfterEpilog', 'messageservice', '', '\\Bitrix\\MessageService\\Queue', 'run', '', 1, '6bcb21b0ccc5ac89d9531ddf8b94683c'),
(161, '2023-03-31 22:20:42', 100, 'rest', 'OnRestServiceBuildDescription', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestServiceBuildDescription', '', 1, '7524628243223e572590eea87cc03f73'),
(162, '2023-03-31 22:20:42', 100, 'rest', 'OnRestAppDelete', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestAppDelete', '', 1, '5febc41cd526ecba95dbb4843dd9c134'),
(163, '2023-03-31 22:20:42', 100, 'rest', 'OnRestAppUpdate', 'messageservice', '', '\\Bitrix\\MessageService\\RestService', 'onRestAppUpdate', '', 1, '7e77b4d550c200a4ec06872af7857ee6'),
(165, '2023-03-31 22:20:43', 49, 'main', 'OnBeforeProlog', 'rest', '', 'CRestEventHandlers', 'OnBeforeProlog', '', 2, '395c9c42c3cc9392de1e5887617afe6d'),
(166, '2023-03-31 22:20:43', 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', 'CBitrixRestEntity', 'OnRestServiceBuildDescription', '', 2, 'f63068b1eb62c36219518206e1e2827c'),
(167, '2023-03-31 22:20:43', 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\User', 'onRestServiceBuildDescription', '', 2, 'c9a03e9019564649e55f5409b661e050'),
(168, '2023-03-31 22:20:43', 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\Placement', 'onRestServiceBuildDescription', '', 2, '9751a266c2b6f6be5c34b1541bf7c194'),
(169, '2023-03-31 22:20:43', 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\Event', 'onRestServiceBuildDescription', '', 2, '842ad63f19aff6d810059c7e56739aae'),
(170, '2023-03-31 22:20:43', 100, 'rest', 'OnRestServiceBuildDescription', 'rest', '', '\\Bitrix\\Rest\\Api\\UserFieldType', 'onRestServiceBuildDescription', '', 2, '4caf68a5256aabe4abef37f24562e59b'),
(171, '2023-03-31 22:20:43', 100, 'rest', 'onFindMethodDescription', 'rest', '', '\\Bitrix\\Rest\\Engine\\RestManager', 'onFindMethodDescription', '', 2, '4d0614f880674af333326dd5ba9b2828'),
(172, '2023-03-31 22:20:43', 100, 'main', 'OnApplicationsBuildList', 'main', 'modules/rest/lib/apauth/application.php', '\\Bitrix\\Rest\\APAuth\\Application', 'onApplicationsBuildList', '', 2, '9c39129872987f8dcc8baacc0c446ed7'),
(173, '2023-03-31 22:20:43', 100, 'im', 'OnAfterConfirmNotify', 'rest', '', '\\Bitrix\\Rest\\NotifyIm', 'receive', '', 2, '2ac9c19fe69d4e106deaa6f4a7a4371b'),
(174, '2023-03-31 22:20:43', 100, 'rest', '\\Bitrix\\Rest\\APAuth\\Password::OnDelete', 'rest', '', '\\Bitrix\\Rest\\APAuth\\PermissionTable', 'onPasswordDelete', '', 2, 'f04447ca635f045ec1a64e593964fc90'),
(175, '2023-03-31 22:20:43', 100, 'perfmon', 'OnGetTableSchema', 'rest', '', 'rest', 'OnGetTableSchema', '', 2, '47a76003c8f9f2d8c820f446e084ff39'),
(176, '2023-03-31 22:20:43', 100, 'rest', 'OnRestApplicationConfigurationImport', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventImportController', '', 2, '3fc1dd7e523b33f9d76c19e54d45c2fb'),
(177, '2023-03-31 22:20:43', 100, 'rest', 'OnRestApplicationConfigurationExport', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventExportController', '', 2, 'b90a349060c693506b740c4d36f75f5f'),
(178, '2023-03-31 22:20:43', 100, 'rest', 'OnRestApplicationConfigurationClear', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'onEventClearController', '', 2, '75dccda637a740c033b2d014a84a8009'),
(179, '2023-03-31 22:20:43', 100, 'rest', 'OnRestApplicationConfigurationEntity', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'getEntityList', '', 2, '8d83d219eaf2f415d55fb67e221b7c3d'),
(180, '2023-03-31 22:20:43', 100, 'rest', 'OnRestApplicationConfigurationGetManifest', 'rest', '', '\\Bitrix\\Rest\\Configuration\\AppConfiguration', 'getManifestList', '', 2, '6ba35b1f4b01d1e358e1b3a79ac437d6'),
(181, '2023-03-31 22:20:43', 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\OAuth\\Auth', 'onRestCheckAuth', '', 2, '70e923729089b8cba69bb3b4311da11e'),
(182, '2023-03-31 22:20:43', 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\APAuth\\Auth', 'onRestCheckAuth', '', 2, '3550e6c95772564101770e0c9cb54470'),
(183, '2023-03-31 22:20:43', 100, 'rest', 'onRestCheckAuth', 'rest', '', '\\Bitrix\\Rest\\SessionAuth\\Auth', 'onRestCheckAuth', '', 2, '8e33ae5a47b59d21df7d26f916d19e38'),
(184, '2023-03-31 22:20:43', 100, 'main', 'OnAfterRegisterModule', 'rest', '', '\\Bitrix\\Rest\\Engine\\ScopeManager', 'onChangeRegisterModule', '', 2, '900fb8bbf0d59d1924bedae5da1b6eb1'),
(185, '2023-03-31 22:20:43', 100, 'main', 'OnAfterUnRegisterModule', 'rest', '', '\\Bitrix\\Rest\\Engine\\ScopeManager', 'onChangeRegisterModule', '', 2, 'e97e569fe3fc7775aa4ece09cdf209bc'),
(186, '2023-03-31 22:20:43', 100, 'main', 'OnAfterRegisterModule', 'rest', '', '\\Bitrix\\Rest\\Marketplace\\TagTable', 'onAfterRegisterModule', '', 2, '80afec537db1eeda99462f0676dbb835'),
(187, '2023-03-31 22:20:43', 100, 'main', 'OnAfterUnRegisterModule', 'rest', '', '\\Bitrix\\Rest\\Marketplace\\TagTable', 'onAfterUnRegisterModule', '', 2, 'fe9cb5af7e8ca277ca29b4a5423bd08b'),
(197, '2023-03-31 22:20:44', 100, 'main', 'OnPanelCreate', 'seo', '', 'CSeoEventHandlers', 'SeoOnPanelCreate', '', 2, '79688b0b4a106b805d09e63ffe88f580'),
(198, '2023-03-31 22:20:44', 100, 'fileman', 'OnIncludeHTMLEditorScript', 'seo', '', 'CSeoEventHandlers', 'OnIncludeHTMLEditorScript', '', 2, '7995eac5813e40f6b3e82b146631397e'),
(236, '2023-03-31 22:20:45', 100, 'perfmon', 'OnGetTableSchema', 'translate', '', 'translate', 'onGetTableSchema', '', 1, '00347f45b2f48480b1a521c32036beb5'),
(239, '2023-03-31 22:21:02', 100, 'main', 'OnBeforeProlog', 'main', '/modules/main/install/wizard_sol/panel_button.php', 'CWizardSolPanel', 'ShowPanel', '', 1, 'bbd7b8c1e518a0b3eae815eb91a95c11'),
(240, '2023-03-31 22:51:03', 100, 'main', 'OnUserDelete', 'ui', '', '\\Bitrix\\UI\\Integration\\Main\\User', 'onDelete', '', 2, '5e748ff204d0dac471be127b136eeb1d'),
(241, '2023-03-31 22:51:03', 100, 'main', 'OnFileDelete', 'ui', '', '\\Bitrix\\UI\\Avatar\\Mask\\Item', 'onFileDelete', '', 2, 'bdf678d45b7e9f3ce906099a5e4fc975'),
(242, '2023-03-31 22:51:03', 100, 'rest', 'onRestAppDelete', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\App', 'onRestAppDelete', '', 2, 'b213605cfa38675d5e4b60f257f6acce'),
(243, '2023-03-31 22:51:03', 100, 'rest', 'OnRestAppInstall', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\App', 'OnRestAppInstall', '', 2, '206ce4eafe25cc4b5fbaddfa36eaba47'),
(244, '2023-03-31 22:51:03', 100, 'rest', 'onRestApplicationConfigurationGetManifest', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\MaskManifest', 'onRestApplicationConfigurationGetManifest', '', 2, 'daad84620a1a84daef4884f1162e2099'),
(245, '2023-03-31 22:51:03', 100, 'rest', 'onRestApplicationConfigurationGetManifestSetting', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\MaskManifest', 'onRestApplicationConfigurationGetManifestSetting', '', 2, 'b3290d964ad532e24a892bae6001146c'),
(246, '2023-03-31 22:51:03', 100, 'rest', 'onRestApplicationConfigurationExport', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\MaskManifest', 'onRestApplicationConfigurationExport', '', 2, 'ac9b60f1d69d98c3980413800a3524f7'),
(247, '2023-03-31 22:51:03', 100, 'rest', 'onRestApplicationConfigurationEntity', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\MaskManifest', 'onRestApplicationConfigurationEntity', '', 2, '8d609b415b9bfa097d137ab69ba6903f'),
(248, '2023-03-31 22:51:03', 100, 'rest', 'onRestApplicationConfigurationImport', 'ui', '', '\\Bitrix\\UI\\Integration\\Rest\\MaskManifest', 'onRestApplicationConfigurationImport', '', 2, 'b1a5ce1bd868f8c86462c5b60eec1307'),
(249, '2023-03-31 22:51:09', 100, 'main', 'OnAfterFileDeleteDuplicate', 'landing', '', '\\Bitrix\\Landing\\Update\\Block\\DuplicateImages', 'onAfterFileDeleteDuplicate', '', 2, 'b80f7597db6200591a0e0e41c14e0ee0'),
(250, '2023-03-31 22:51:21', 100, 'socialnetwork', 'onSocNetFeaturesUpdate', 'landing', '', '\\Bitrix\\Landing\\Connector\\SocialNetwork', 'onSocNetFeaturesUpdate', '', 2, 'd385df085957d9e418b63017d75630fe'),
(251, '2023-03-31 22:51:37', 100, 'ui', 'onUIFormInitialize', 'location', '', '\\Bitrix\\Location\\Infrastructure\\EventHandler', 'onUIFormInitialize', '', 2, '462272192a150e16b28f1e1bd33ed62b'),
(252, '2023-03-31 22:51:39', 100, 'main', 'OnAfterSetOption_~mp24_paid_date', 'rest', '', '\\Bitrix\\Rest\\Marketplace\\Client', 'onChangeSubscriptionDate', '', 2, 'b6ab5bafe2befd82726761f5a8b38a0b');
-- -----------------------------------
-- Dumping table b_numerator
-- -----------------------------------
DROP TABLE IF EXISTS `b_numerator`;
CREATE TABLE `b_numerator` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SETTINGS` text COLLATE utf8_unicode_ci,
  `CREATED_AT` datetime DEFAULT NULL,
  `CREATED_BY` int(11) DEFAULT NULL,
  `UPDATED_AT` datetime DEFAULT NULL,
  `UPDATED_BY` int(11) DEFAULT NULL,
  `CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_numerator_code` (`CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_numerator_sequence
-- -----------------------------------
DROP TABLE IF EXISTS `b_numerator_sequence`;
CREATE TABLE `b_numerator_sequence` (
  `NUMERATOR_ID` int(11) NOT NULL DEFAULT '0',
  `KEY` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `TEXT_KEY` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NEXT_NUMBER` int(11) DEFAULT NULL,
  `LAST_INVOCATION_TIME` int(11) DEFAULT NULL,
  PRIMARY KEY (`NUMERATOR_ID`,`KEY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_operation
-- -----------------------------------
DROP TABLE IF EXISTS `b_operation`;
CREATE TABLE `b_operation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_operation` VALUES
(1, 'edit_php', 'main', NULL, 'module'),
(2, 'view_own_profile', 'main', NULL, 'module'),
(3, 'edit_own_profile', 'main', NULL, 'module'),
(4, 'view_all_users', 'main', NULL, 'module'),
(5, 'view_groups', 'main', NULL, 'module'),
(6, 'view_tasks', 'main', NULL, 'module'),
(7, 'view_other_settings', 'main', NULL, 'module'),
(8, 'view_subordinate_users', 'main', NULL, 'module'),
(9, 'edit_subordinate_users', 'main', NULL, 'module'),
(10, 'edit_all_users', 'main', NULL, 'module'),
(11, 'edit_groups', 'main', NULL, 'module'),
(12, 'edit_tasks', 'main', NULL, 'module'),
(13, 'edit_other_settings', 'main', NULL, 'module'),
(14, 'cache_control', 'main', NULL, 'module'),
(15, 'lpa_template_edit', 'main', NULL, 'module'),
(16, 'view_event_log', 'main', NULL, 'module'),
(17, 'edit_ratings', 'main', NULL, 'module'),
(18, 'manage_short_uri', 'main', NULL, 'module'),
(19, 'fm_view_permission', 'main', NULL, 'file'),
(20, 'fm_view_file', 'main', NULL, 'file'),
(21, 'fm_view_listing', 'main', NULL, 'file'),
(22, 'fm_edit_existent_folder', 'main', NULL, 'file'),
(23, 'fm_create_new_file', 'main', NULL, 'file'),
(24, 'fm_edit_existent_file', 'main', NULL, 'file'),
(25, 'fm_create_new_folder', 'main', NULL, 'file'),
(26, 'fm_delete_file', 'main', NULL, 'file'),
(27, 'fm_delete_folder', 'main', NULL, 'file'),
(28, 'fm_edit_in_workflow', 'main', NULL, 'file'),
(29, 'fm_rename_file', 'main', NULL, 'file'),
(30, 'fm_rename_folder', 'main', NULL, 'file'),
(31, 'fm_upload_file', 'main', NULL, 'file'),
(32, 'fm_add_to_menu', 'main', NULL, 'file'),
(33, 'fm_download_file', 'main', NULL, 'file'),
(34, 'fm_lpa', 'main', NULL, 'file'),
(35, 'fm_edit_permission', 'main', NULL, 'file'),
(36, 'bitrixcloud_monitoring', 'bitrixcloud', NULL, 'module'),
(37, 'bitrixcloud_backup', 'bitrixcloud', NULL, 'module'),
(42, 'fileman_view_all_settings', 'fileman', '', 'module'),
(43, 'fileman_edit_menu_types', 'fileman', '', 'module'),
(44, 'fileman_add_element_to_menu', 'fileman', '', 'module'),
(45, 'fileman_edit_menu_elements', 'fileman', '', 'module'),
(46, 'fileman_edit_existent_files', 'fileman', '', 'module'),
(47, 'fileman_edit_existent_folders', 'fileman', '', 'module'),
(48, 'fileman_admin_files', 'fileman', '', 'module'),
(49, 'fileman_admin_folders', 'fileman', '', 'module'),
(50, 'fileman_view_permissions', 'fileman', '', 'module'),
(51, 'fileman_edit_all_settings', 'fileman', '', 'module'),
(52, 'fileman_upload_files', 'fileman', '', 'module'),
(53, 'fileman_view_file_structure', 'fileman', '', 'module'),
(54, 'fileman_install_control', 'fileman', '', 'module'),
(55, 'medialib_view_collection', 'fileman', '', 'medialib'),
(56, 'medialib_new_collection', 'fileman', '', 'medialib'),
(57, 'medialib_edit_collection', 'fileman', '', 'medialib'),
(58, 'medialib_del_collection', 'fileman', '', 'medialib'),
(59, 'medialib_access', 'fileman', '', 'medialib'),
(60, 'medialib_new_item', 'fileman', '', 'medialib'),
(61, 'medialib_edit_item', 'fileman', '', 'medialib'),
(62, 'medialib_del_item', 'fileman', '', 'medialib'),
(63, 'sticker_view', 'fileman', '', 'stickers'),
(64, 'sticker_edit', 'fileman', '', 'stickers'),
(65, 'sticker_new', 'fileman', '', 'stickers'),
(66, 'sticker_del', 'fileman', '', 'stickers'),
(67, 'hl_element_read', 'highloadblock', NULL, 'module'),
(68, 'hl_element_write', 'highloadblock', NULL, 'module'),
(69, 'hl_element_delete', 'highloadblock', NULL, 'module'),
(70, 'section_read', 'iblock', NULL, 'iblock'),
(71, 'element_read', 'iblock', NULL, 'iblock'),
(72, 'section_element_bind', 'iblock', NULL, 'iblock'),
(73, 'iblock_admin_display', 'iblock', NULL, 'iblock'),
(74, 'element_edit', 'iblock', NULL, 'iblock'),
(75, 'element_edit_price', 'iblock', NULL, 'iblock'),
(76, 'element_delete', 'iblock', NULL, 'iblock'),
(77, 'element_bizproc_start', 'iblock', NULL, 'iblock'),
(78, 'section_edit', 'iblock', NULL, 'iblock'),
(79, 'section_delete', 'iblock', NULL, 'iblock'),
(80, 'section_section_bind', 'iblock', NULL, 'iblock'),
(81, 'element_edit_any_wf_status', 'iblock', NULL, 'iblock'),
(82, 'iblock_edit', 'iblock', NULL, 'iblock'),
(83, 'iblock_delete', 'iblock', NULL, 'iblock'),
(84, 'iblock_rights_edit', 'iblock', NULL, 'iblock'),
(85, 'iblock_export', 'iblock', NULL, 'iblock'),
(86, 'section_rights_edit', 'iblock', NULL, 'iblock'),
(87, 'element_rights_edit', 'iblock', NULL, 'iblock'),
(88, 'landing_read', 'landing', NULL, 'module'),
(89, 'landing_edit', 'landing', NULL, 'module'),
(90, 'landing_sett', 'landing', NULL, 'module'),
(91, 'landing_public', 'landing', NULL, 'module'),
(92, 'landing_delete', 'landing', NULL, 'module');
-- -----------------------------------
-- Dumping table b_option
-- -----------------------------------
DROP TABLE IF EXISTS `b_option`;
CREATE TABLE `b_option` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MODULE_ID`,`NAME`),
  KEY `ix_option_name` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_option` VALUES
('fileman', '~allowed_components', '', NULL, NULL),
('fileman', '~script_files', 'php,php3,php4,php5,php6,phtml,pl,asp,aspx,cgi,exe,ico,shtm,shtml', NULL, NULL),
('fileman', 'archive_step_time', '30', NULL, NULL),
('fileman', 'default_edit', 'html', NULL, NULL),
('fileman', 'default_edit_groups', '', NULL, NULL),
('fileman', 'different_set', 'N', NULL, NULL),
('fileman', 'editor_body_class', '', NULL, NULL),
('fileman', 'editor_body_id', '', NULL, NULL),
('fileman', 'google_map_api_key', '', NULL, NULL),
('fileman', 'GROUP_DEFAULT_RIGHT', 'D', NULL, NULL),
('fileman', 'GROUP_DEFAULT_TASK', '18', NULL, NULL),
('fileman', 'hide_physical_struc', '', NULL, NULL),
('fileman', 'log_menu', 'Y', NULL, NULL),
('fileman', 'log_page', 'Y', NULL, NULL),
('fileman', 'menutypes', 'a:2:{s:4:\\\"left\\\";s:19:\\\"Левое меню\\\";s:3:\\\"top\\\";s:23:\\\"Верхнее меню\\\";}', NULL, NULL),
('fileman', 'ml_max_height', '1024', NULL, NULL),
('fileman', 'ml_max_width', '1024', NULL, NULL),
('fileman', 'ml_media_available_ext', 'jpg,jpeg,gif,png,flv,mp4,wmv,wma,mp3,ppt,aac', NULL, NULL),
('fileman', 'ml_media_extentions', 'jpg,jpeg,gif,png,flv,mp4,wmv,wma,mp3,ppt', NULL, NULL),
('fileman', 'ml_thumb_height', '105', NULL, NULL),
('fileman', 'ml_thumb_width', '140', NULL, NULL),
('fileman', 'ml_use_default', '1', NULL, NULL),
('fileman', 'num_menu_param', '1', NULL, NULL),
('fileman', 'propstypes', 'a:2:{s:11:\\\"description\\\";s:16:\\\"Описание\\\";s:8:\\\"keywords\\\";s:27:\\\"Ключевые слова\\\";}', NULL, NULL),
('fileman', 'replace_new_lines', 'Y', NULL, NULL),
('fileman', 'search_mask', '*.php', NULL, NULL),
('fileman', 'search_max_open_file_size', '1024', NULL, NULL),
('fileman', 'search_max_res_count', '', NULL, NULL),
('fileman', 'search_time_step', '5', NULL, NULL),
('fileman', 'show_inc_icons', 'N', NULL, NULL),
('fileman', 'stickers_use_hotkeys', 'N', NULL, NULL),
('fileman', 'use_code_editor', 'Y', NULL, NULL),
('fileman', 'use_custom_spell', 'N', NULL, NULL),
('fileman', 'use_editor_3', 'Y', NULL, NULL),
('fileman', 'use_medialib', 'Y', NULL, NULL),
('fileman', 'use_pspell', 'N', NULL, NULL),
('fileman', 'use_separeted_dics', 'N', NULL, NULL),
('fileman', 'use_translit', '1', NULL, NULL),
('fileman', 'use_translit_google', '1', NULL, NULL),
('fileman', 'user_dics_path', '/bitrix/modules/fileman/u_dics', NULL, NULL),
('fileman', 'yandex_map_api_key', '', NULL, NULL),
('landing', 'new_blocks', 'a:2:{s:4:\"date\";i:1680292270;s:5:\"items\";a:6:{i:0;s:8:\"68.1.faq\";i:1;s:8:\"68.2.faq\";i:2;s:8:\"68.3.faq\";i:3;s:8:\"68.4.faq\";i:4;s:8:\"68.5.faq\";i:5;s:8:\"68.6.faq\";}}', NULL, NULL),
('landing', 'pub_path_s1', '/lp/', NULL, NULL),
('location', 'address_format_code', 'RU', NULL, NULL),
('main', '~crypto_b_socialservices_user', 'a:2:{s:7:\"OATOKEN\";b:1;s:13:\"REFRESH_TOKEN\";b:1;}', NULL, NULL),
('main', '~crypto_b_user_auth_code', 'a:1:{s:10:\"OTP_SECRET\";b:1;}', NULL, NULL),
('main', '~crypto_b_user_phone_auth', 'a:1:{s:10:\"OTP_SECRET\";b:1;}', NULL, NULL),
('main', '~mp24_paid', '', NULL, NULL),
('main', '~mp24_paid_date', '', NULL, NULL),
('main', '~new_license18_0_sign', 'Y', NULL, NULL),
('main', '~PARAM_CLIENT_LANG', 'ru', NULL, NULL),
('main', '~PARAM_COMPOSITE', 'N', NULL, NULL),
('main', '~PARAM_FINISH_DATE', '235c520b91fafe2f2442ed785617f1d942ea5118a38252b1a46d06cfdc7da369.2023-05-01', NULL, NULL),
('main', '~PARAM_MAX_SERVERS', '2', NULL, NULL),
('main', '~PARAM_MAX_USERS', '663efd624457bcc6b40d2044b6c9fc7e28602c35802bfd00f11ca01883bcec63.0', NULL, NULL),
('main', '~PARAM_PARTNER_ID', '', NULL, NULL),
('main', '~PARAM_PHONE_SIP', 'N', NULL, NULL),
('main', '~support_finish_date', '2023-05-01', NULL, NULL),
('main', '~update_autocheck_result', 'a:4:{s:10:\"check_date\";i:1680292318;s:6:\"result\";b:0;s:5:\"error\";s:0:\"\";s:7:\"modules\";a:0:{}}', NULL, NULL),
('main', 'admin_lid', 'ru', NULL, NULL),
('main', 'admin_passwordh', 'FVsQfGYUBgUtCUVcBBcHCgsTAQ==', NULL, NULL),
('main', 'all_bcc', 'test@test.ru', NULL, NULL),
('main', 'allow_qrcode_auth', 'N', NULL, NULL),
('main', 'allow_socserv_authorization', 'Y', NULL, NULL),
('main', 'ALLOW_SPREAD_COOKIE', 'Y', NULL, NULL),
('main', 'attach_images', 'N', NULL, NULL),
('main', 'auth_components_template', '', NULL, NULL),
('main', 'auth_controller_sso', 'N', NULL, NULL),
('main', 'auth_multisite', 'Y', NULL, NULL),
('main', 'auto_time_zone', 'N', NULL, NULL),
('main', 'bx_fast_download', 'N', NULL, NULL),
('main', 'captcha_registration', 'N', NULL, NULL),
('main', 'captcha_restoring_password', 'N', NULL, NULL),
('main', 'collect_geonames', 'N', NULL, NULL),
('main', 'compres_css_js_files', 'N', NULL, NULL),
('main', 'control_file_duplicates', 'Y', NULL, NULL),
('main', 'convert_mail_header', 'Y', NULL, NULL),
('main', 'convert_original_file_name', 'Y', NULL, NULL),
('main', 'CONVERT_UNIX_NEWLINE_2_WINDOWS', 'N', NULL, NULL),
('main', 'cookie_name', 'BITRIX_SM', NULL, NULL),
('main', 'custom_register_page', '', NULL, NULL),
('main', 'device_history_cleanup_days', '180', NULL, NULL),
('main', 'disk_space', '', NULL, NULL),
('main', 'dump_archive_size_limit', '104857600', NULL, NULL),
('main', 'dump_base', '1', NULL, NULL),
('main', 'dump_base_skip_log', '0', NULL, NULL),
('main', 'dump_base_skip_search', '0', NULL, NULL),
('main', 'dump_base_skip_stat', '0', NULL, NULL),
('main', 'dump_bucket_id', '0', NULL, NULL),
('main', 'dump_do_clouds', '0', NULL, NULL),
('main', 'dump_encrypt', '0', NULL, NULL),
('main', 'dump_file_kernel', '0', NULL, NULL),
('main', 'dump_file_public', '0', NULL, NULL),
('main', 'dump_integrity_check', '0', NULL, NULL),
('main', 'dump_max_exec_time', '20', NULL, NULL),
('main', 'dump_max_exec_time_sleep', '3', NULL, NULL),
('main', 'dump_max_file_size', '0', NULL, NULL),
('main', 'dump_site_id', 'a:0:{}', NULL, NULL),
('main', 'dump_use_compression', '1', NULL, NULL),
('main', 'duplicates_max_size', '100', NULL, NULL),
('main', 'email_from', 'a.kiselevich@digital-sector.ru', NULL, NULL),
('main', 'error_reporting', '85', NULL, NULL),
('main', 'event_log_block_user', 'N', NULL, NULL),
('main', 'event_log_cleanup_days', '7', NULL, NULL),
('main', 'event_log_file_access', 'N', NULL, NULL),
('main', 'event_log_group_policy', 'N', NULL, NULL),
('main', 'event_log_login_fail', 'N', NULL, NULL),
('main', 'event_log_login_success', 'N', NULL, NULL),
('main', 'event_log_logout', 'N', NULL, NULL),
('main', 'event_log_marketplace', 'N', NULL, NULL),
('main', 'event_log_module_access', 'N', NULL, NULL),
('main', 'event_log_password_change', 'N', NULL, NULL),
('main', 'event_log_password_request', 'N', NULL, NULL),
('main', 'event_log_permissions_fail', 'N', NULL, NULL),
('main', 'event_log_register', 'N', NULL, NULL),
('main', 'event_log_register_fail', 'N', NULL, NULL),
('main', 'event_log_task', 'N', NULL, NULL),
('main', 'event_log_user_delete', 'N', NULL, NULL),
('main', 'event_log_user_edit', 'N', NULL, NULL),
('main', 'event_log_user_groups', 'N', NULL, NULL),
('main', 'fill_to_mail', 'N', NULL, NULL),
('main', 'gather_catalog_stat', 'Y', NULL, NULL),
('main', 'GROUP_DEFAULT_RIGHT', 'D', NULL, NULL),
('main', 'GROUP_DEFAULT_TASK', '1', NULL, NULL),
('main', 'hide_panel_for_users', 'N;', NULL, NULL),
('main', 'image_resize_quality', '95', NULL, NULL),
('main', 'imageeditor_proxy_enabled', 'N', NULL, NULL),
('main', 'imageeditor_proxy_white_list', 'N;', NULL, NULL),
('main', 'inactive_users_block_days', '0', NULL, NULL),
('main', 'last_mp_modules_result', 'a:4:{s:10:\"check_date\";i:1683412649;s:13:\"update_module\";a:0:{}s:10:\"end_update\";a:0:{}s:10:\"new_module\";a:0:{}}', NULL, NULL),
('main', 'mail_additional_parameters', '', NULL, NULL),
('main', 'mail_event_bulk', '5', NULL, NULL),
('main', 'mail_event_period', '14', NULL, NULL),
('main', 'mail_gen_text_version', 'Y', NULL, NULL),
('main', 'mail_link_protocol', 'http', NULL, NULL),
('main', 'map_left_menu_type', 'left', NULL, NULL),
('main', 'map_top_menu_type', 'top', NULL, NULL),
('main', 'max_file_size', '0', NULL, NULL),
('main', 'move_js_to_body', 'Y', NULL, NULL),
('main', 'new_user_email_auth', 'Y', NULL, NULL),
('main', 'new_user_email_required', 'Y', NULL, NULL),
('main', 'new_user_email_uniq_check', 'Y', NULL, NULL),
('main', 'new_user_phone_auth', 'N', NULL, NULL),
('main', 'new_user_phone_required', 'N', NULL, NULL),
('main', 'new_user_registration', 'Y', NULL, NULL),
('main', 'new_user_registration_cleanup_days', '7', NULL, NULL),
('main', 'new_user_registration_def_group', NULL, NULL, NULL),
('main', 'new_user_registration_email_confirmation', 'N', NULL, NULL),
('main', 'optimize_css_files', 'Y', NULL, NULL),
('main', 'optimize_js_files', 'Y', NULL, NULL),
('main', 'PARAM_MAX_SITES', '2', NULL, NULL),
('main', 'PARAM_MAX_USERS', '0', NULL, NULL),
('main', 'phone_number_default_country', '16', NULL, NULL),
('main', 'profile_history_cleanup_days', '0', NULL, NULL),
('main', 'profile_image_height', '', NULL, NULL),
('main', 'profile_image_size', '', NULL, NULL),
('main', 'profile_image_width', '', NULL, NULL),
('main', 'rating_assign_authority_group', '4', NULL, NULL),
('main', 'rating_assign_authority_group_add', '2', NULL, NULL),
('main', 'rating_assign_authority_group_delete', '2', NULL, NULL),
('main', 'rating_assign_rating_group', '3', NULL, NULL),
('main', 'rating_assign_rating_group_add', '1', NULL, NULL),
('main', 'rating_assign_rating_group_delete', '1', NULL, NULL),
('main', 'rating_assign_type', 'auto', NULL, NULL),
('main', 'rating_authority_rating', '2', NULL, NULL),
('main', 'rating_authority_weight_formula', 'Y', NULL, NULL),
('main', 'rating_community_authority', '30', NULL, NULL),
('main', 'rating_community_last_visit', '90', NULL, NULL),
('main', 'rating_community_size', '1', NULL, NULL),
('main', 'rating_count_vote', '10', NULL, NULL),
('main', 'rating_normalization', '10', NULL, NULL),
('main', 'rating_normalization_type', 'auto', NULL, NULL),
('main', 'rating_self_vote', 'Y', NULL, NULL),
('main', 'rating_start_authority', '3', NULL, NULL),
('main', 'rating_text_like_d', 'Это нравится', NULL, NULL),
('main', 'rating_text_like_n', 'Не нравится', NULL, NULL),
('main', 'rating_text_like_y', 'Нравится', NULL, NULL),
('main', 'rating_vote_show', 'Y', NULL, NULL),
('main', 'rating_vote_template', 'like', NULL, NULL),
('main', 'rating_vote_type', 'like', NULL, NULL),
('main', 'rating_vote_weight', '10', NULL, NULL),
('main', 'save_original_file_name', 'N', NULL, NULL),
('main', 'secure_logout', 'Y', NULL, NULL),
('main', 'send_mid', 'N', NULL, NULL),
('main', 'server_name', 'localhost', NULL, NULL),
('main', 'server_uniq_id', '983bf2732cd7fae0c50b06a30e923610', NULL, NULL),
('main', 'session_auth_only', 'Y', NULL, NULL),
('main', 'session_expand', 'Y', NULL, NULL),
('main', 'session_show_message', 'Y', NULL, NULL),
('main', 'show_panel_for_users', 'N;', NULL, NULL),
('main', 'signer_default_key', 'ba4da58863a9723618af88eebafe7005da2e81458889b51cd8c981f63c3b3abc76ffcabff1ed85d65d31ac1f16988e1484dbef7c760c0e0b191289c17038956e', NULL, NULL),
('main', 'site_name', 'Balita', NULL, NULL),
('main', 'skip_mask', '0', NULL, NULL),
('main', 'smile_gallery_id', '1', NULL, NULL),
('main', 'sms_default_service', '', NULL, NULL),
('main', 'stable_versions_only', 'Y', NULL, NULL),
('main', 'store_password', 'Y', NULL, NULL),
('main', 'strong_update_check', 'Y', NULL, NULL),
('main', 'track_outgoing_emails_click', 'Y', NULL, NULL),
('main', 'track_outgoing_emails_read', 'Y', NULL, NULL),
('main', 'translate_key_yandex', '', NULL, NULL),
('main', 'translit_original_file_name', 'N', NULL, NULL),
('main', 'update_autocheck', '', NULL, NULL),
('main', 'update_devsrv', 'Y', NULL, NULL),
('main', 'update_is_gzip_installed', 'Y', NULL, NULL),
('main', 'update_load_timeout', '30', NULL, NULL),
('main', 'update_safe_mode', 'N', NULL, NULL),
('main', 'update_site', 'www.1c-bitrix.ru', NULL, NULL),
('main', 'update_site_ns', 'Y', NULL, NULL),
('main', 'update_site_proxy_addr', '', NULL, NULL),
('main', 'update_site_proxy_pass', '', NULL, NULL),
('main', 'update_site_proxy_port', '', NULL, NULL),
('main', 'update_site_proxy_user', '', NULL, NULL),
('main', 'update_stop_autocheck', 'N', NULL, NULL),
('main', 'update_system_check', '31.03.2023 22:55:17', NULL, NULL),
('main', 'update_system_update', '31.03.2023 22:51:58', NULL, NULL),
('main', 'upload_dir', 'upload', NULL, NULL),
('main', 'url_preview_enable', 'N', NULL, NULL),
('main', 'url_preview_save_images', 'N', NULL, NULL),
('main', 'use_digest_auth', 'N', NULL, NULL),
('main', 'use_encrypted_auth', 'N', NULL, NULL),
('main', 'use_hot_keys', 'Y', NULL, NULL),
('main', 'use_minified_assets', 'Y', NULL, NULL),
('main', 'use_secure_password_cookies', 'Y', NULL, NULL),
('main', 'use_time_zones', 'N', NULL, NULL),
('main', 'user_device_geodata', 'N', NULL, NULL),
('main', 'user_device_history', 'Y', NULL, NULL),
('main', 'user_device_notify', 'Y', NULL, NULL),
('main', 'user_profile_history', 'Y', NULL, NULL),
('main', 'vendor', '1c_bitrix', NULL, NULL),
('main.stepper.messageservice', '\\Bitrix\\MessageService\\Update\\SettingsEncryptor', 'a:0:{}', NULL, NULL),
('messageservice', 'clean_up_period', '14', NULL, NULL),
('rest', 'app_immune', '[\"infoservice.migrator_amocrm\",\"informunity.excel\",\"integrations24ru.pipedrive\",\"integrations24ru.asana\",\"integrations24ru.sugar\",\"bitrix.eshop\",\"bitrix.1cdoc\",\"bitrix.assistant\",\"bitrix.denominationby\",\"bitrix.propertiesbot\",\"bitrix.giphybot\",\"bitrix.1c\",\"bitrix.restapi\",\"bitrix.partnerlandingexport\",\"bitrix.partnerapplication\",\"bitrix.partnerlanding\",\"bitrix.1ctotal\",\"integrations24.pipedrive\",\"integrations24ru.pipedrive\",\"integrations24.zoho\",\"integrations24.asana\",\"integrations24ru.asana\",\"integrations24.sugar\",\"integrations24ru.sugar\",\"integrations24.jira_migration\",\"integrations24.qbinventory\",\"integrations24.zohoinventory\",\"SEVERCODE.trello_migrator\",\"htmls.ms_migrator\",\"integrations24.mns_kazakhstan_poisk_po_bin\",\"integrations24.portal_nalog_gov_by\",\"bitrix.khellouin_ru\",\"bitrix.den_zashchitnika_otechestva_2_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_ua\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_ua\",\"bitrix.mezhdunarodnyy_zhenskiy_den_ua\",\"bitrix.den_smekha_ua\",\"bitrix.den_svyatogo_valentina_ua\",\"bitrix.den_vsekh_vlyublyennykh_ua\",\"bitrix.katolicheskaya_paskha_ua\",\"bitrix.novyy_god_ua\",\"bitrix.rozhdestvo_ua\",\"bitrix.valentinov_den_ua\",\"bitrix.pravoslavnaya_paskha_ua\",\"bitrix.chernaya_pyatnitsa_ua\",\"bitrix.khellouin_ua\",\"bitrix.den_zashchitnika_otechestva_3_ru\",\"bitrix.den_zashchitnika_otechestva_ru\",\"bitrix.den_zashchitnika_otechestva_by\",\"bitrix.den_zashchitnika_otechestva_2_by\",\"bitrix.den_zashchitnika_otechestva_3_by\",\"bitrix.den_zashchitnika_otechestva_kz\",\"bitrix.den_zashchitnika_otechestva_2_kz\",\"bitrix.den_zashchitnika_otechestva_3_kz\",\"bitrix.pravoslavnaya_paskha_ru\",\"bitrix.pravoslavnaya_paskha_by\",\"bitrix.pravoslavnaya_paskha_kz\",\"bitrix.den_smekha_ru\",\"bitrix.den_smekha_by\",\"bitrix.den_smekha_kz\",\"bitrix.valentinov_den_ru\",\"bitrix.valentinov_den_by\",\"bitrix.valentinov_den_kz\",\"bitrix.rozhdestvo_ru\",\"bitrix.rozhdestvo_by\",\"bitrix.rozhdestvo_kz\",\"bitrix.novyy_god_ru\",\"bitrix.novyy_god_by\",\"bitrix.novyy_god_kz\",\"bitrix.katolicheskaya_paskha_ru\",\"bitrix.katolicheskaya_paskha_by\",\"bitrix.katolicheskaya_paskha_kz\",\"bitrix.den_vsekh_vlyublyennykh_ru\",\"bitrix.den_vsekh_vlyublyennykh_by\",\"bitrix.den_vsekh_vlyublyennykh_kz\",\"bitrix.den_svyatogo_valentina_ru\",\"bitrix.den_svyatogo_valentina_by\",\"bitrix.den_svyatogo_valentina_kz\",\"bitrix.mezhdunarodnyy_zhenskiy_den_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_by\",\"bitrix.mezhdunarodnyy_zhenskiy_den_kz\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_by\",\"bitrix.mezhdunarodnyy_zhenskiy_den_2_kz\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_ru\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_by\",\"bitrix.mezhdunarodnyy_zhenskiy_den_3_kz\",\"bitrix.thanksgiving_day_en\",\"bitrix.april_fools_day_en\",\"bitrix.valentine_s_day_en\",\"bitrix.valentine_s_day_2_en\",\"bitrix.valentine_s_day_3_en\",\"bitrix.chernaya_pyatnitsa_ru\",\"bitrix.chernaya_pyatnitsa_by\",\"bitrix.chernaya_pyatnitsa_kz\",\"bitrix.khellouin_by\",\"bitrix.khellouin_kz\",\"bitrix.easter_en\",\"bitrix.halloween_en\",\"bitrix.christmas_en\",\"bitrix.new_year_en\",\"bitrix.black_friday_en\",\"bitrix.kraytvirtualtravel_ru\",\"bitrix.kraytvirtualtravel_by\",\"bitrix.kraytvirtualtravel_kz\",\"bitrix.kraytvirtualtravel_ua\",\"bitrix.kraytnutritionist_ru\",\"bitrix.kraytnutritionist_by\",\"bitrix.delobotcorporatetraining_en\",\"bitrix.delobotblackfriday_en\",\"bitrix.delobotcleaningcompany_en\",\"bitrix.delobotfitness_en\",\"bitrix.delobotfooddelivery_en\",\"bitrix.delobotvisagiste_en\",\"bitrix.delobotpsychologist_en\",\"bitrix.delobotflorist_en\",\"bitrix.delobotdecoration_en\",\"bitrix.delobotcarservice_en\",\"bitrix.kraytagency_en\",\"bitrix.kraytagriculture_en\",\"bitrix.kraytarchitecture_en\",\"bitrix.kraytbusiness_en\",\"bitrix.kraytdelivery_en\",\"bitrix.kraytevents_en\",\"bitrix.kraythalloween_en\",\"bitrix.kraytvetclinic_en\",\"bitrix.kraytmasterforhour_en\",\"bitrix.kraytinstagramcontacts_en\",\"bitrix.kraytinstagramstock_en\",\"bitrix.kraytinstagramtarget_en\",\"bitrix.kraytonlinebabysitter_en\",\"bitrix.kraytpetservice_en\",\"bitrix.kraytsolarenergy_en\",\"bitrix.kraytsportonline_en\",\"bitrix.kraytsummersale_en\",\"bitrix.krayttravelblog_en\",\"bitrix.kraytvebinar_en\",\"bitrix.kraytartificialintelligence_en\",\"bitrix.kraytbakeryproducts_en\",\"bitrix.kraytchildrensschool_en\",\"bitrix.kraytfooddelivery_en\",\"bitrix.kraytfurniture_en\",\"bitrix.kraytvirtualtravel_en\",\"bitrix.kraytyoutubechannel_en\",\"bitrix.kraytknitting_en\",\"bitrix.kraytnutritionist_en\",\"bitrix.kraytnailservice_en\",\"bitrix.kraytmedicine_en\",\"bitrix.kraytprofipage_en\",\"bitrix.kraytsale11_en\",\"bitrix.delobotblackfriday_ua\",\"bitrix.delobotcleaning_ua\",\"bitrix.delobotcorporatetraining_ua\",\"bitrix.delobotfitness_ua\",\"bitrix.delobotfooddelivery_ua\",\"bitrix.delobotvisagiste_ua\",\"bitrix.kraytagency_ua\",\"bitrix.kraytagriculture_ua\",\"bitrix.kraytarchitecture_ua\",\"bitrix.kraytbusiness_ua\",\"bitrix.kraytevents_ua\",\"bitrix.kraythalloween_ua\",\"bitrix.kraytinstagramcontacts_ua\",\"bitrix.kraytinstagramstock_ua\",\"bitrix.kraytinstagramtarget_ua\",\"bitrix.kraytpetservice_ua\",\"bitrix.kraytsolarenergy_ua\",\"bitrix.kraytsummersale_ua\",\"bitrix.krayttravelblog_ua\",\"bitrix.kraytvebinar_ua\",\"bitrix.kraytvetclinic_ua\",\"bitrix.kraytnutritionist_ua\",\"bitrix.kraytnutritionist_kz\",\"bitrix.kraytfurniture_by\",\"bitrix.kraytfurniture_ru\",\"bitrix.kraytfurniture_kz\",\"bitrix.kraytfurniture_ua\",\"bitrix.kraytmedicine_ru\",\"bitrix.kraytmedicine_by\",\"bitrix.kraytmedicine_kz\",\"bitrix.kraytmedicine_ua\",\"bitrix.kraytsale11_ru\",\"bitrix.kraytsale11_by\",\"bitrix.kraytsale11_kz\",\"bitrix.kraytsale11_ua\",\"bitrix.kraytnailservice_ru\",\"bitrix.kraytnailservice_by\",\"bitrix.kraytnailservice_kz\",\"bitrix.kraytnailservice_ua\",\"bitrix.kraytknitting_ru\",\"bitrix.kraytknitting_by\",\"bitrix.kraytknitting_kz\",\"bitrix.kraytknitting_ua\",\"bitrix.kraytfooddelivery_ru\",\"bitrix.kraytfooddelivery_by\",\"bitrix.kraytfooddelivery_kz\",\"bitrix.kraytfooddelivery_ua\",\"bitrix.kraytbakeryproducts_ru\",\"bitrix.kraytbakeryproducts_by\",\"bitrix.kraytbakeryproducts_kz\",\"bitrix.kraytbakeryproducts_ua\",\"bitrix.kraytschoolmusic_ru\",\"bitrix.kraytschoolmusic_by\",\"bitrix.kraytschoolmusic_kz\",\"bitrix.kraytschoolmusic_ua\",\"bitrix.kraytautomechanic_ru\",\"bitrix.kraytautomechanic_by\",\"bitrix.kraytautomechanic_kz\",\"bitrix.kraytautomechanic_ua\",\"bitrix.kraytpresents_ru\",\"bitrix.kraytpresents_by\",\"bitrix.kraytpresents_kz\",\"bitrix.kraytpresents_ua\",\"bitrix.kraytportfoliophotographer_ru\",\"bitrix.kraytportfoliophotographer_by\",\"bitrix.kraytportfoliophotographer_kz\",\"bitrix.kraytportfoliophotographer_ua\",\"bitrix.kraytcrm_ru\",\"bitrix.delobotcleaningcompany_ru\",\"bitrix.delobotblackfriday_ru\",\"bitrix.delobotblackfriday_by\",\"bitrix.delobotblackfriday_kz\",\"bitrix.delobotcleaningcompany_by\",\"bitrix.delobotcleaningcompany_kz\",\"bitrix.delobotcorporatetraining_ru\",\"bitrix.delobotcorporatetraining_by\",\"bitrix.delobotcorporatetraining_kz\",\"bitrix.delobotfitness_ru\",\"bitrix.delobotfitness_by\",\"bitrix.delobotfitness_kz\",\"bitrix.delobotfooddelivery_ru\",\"bitrix.delobotfooddelivery_by\",\"bitrix.delobotfooddelivery_kz\",\"bitrix.delobotvisagiste_ru\",\"bitrix.delobotvisagiste_by\",\"bitrix.delobotvisagiste_kz\",\"bitrix.delobotgiftsforwomensday_ru\",\"bitrix.delobotgiftsforwomensday_by\",\"bitrix.delobotgiftsforwomensday_kz\",\"bitrix.delobotgiftsforwomensday_ua\",\"bitrix.delobotwebdesigner_ru\",\"bitrix.delobotwebdesigner_by\",\"bitrix.delobotwebdesigner_kz\",\"bitrix.delobotwebdesigner_ua\",\"bitrix.delobotatelier_ru\",\"bitrix.delobotatelier_by\",\"bitrix.delobotatelier_kz\",\"bitrix.delobotatelier_ua\",\"bitrix.delobotconstructioncompany_ru\",\"bitrix.delobotconstructioncompany_by\",\"bitrix.delobotconstructioncompany_ua\",\"bitrix.delobotlanguageschool_ru\",\"bitrix.delobotlanguageschool_by\",\"bitrix.delobotlanguageschool_kz\",\"bitrix.delobotlanguageschool_ua\",\"bitrix.delobotcoffee_ru\",\"bitrix.delobotcoffee_by\",\"bitrix.delobotcoffee_kz\",\"bitrix.delobotcoffee_ua\",\"bitrix.kraytcrm_by\",\"bitrix.kraytcrm_kz\",\"bitrix.kraytcrm_ua\",\"bitrix.kraytonlinebabysitter_ru\",\"bitrix.kraytonlinebabysitter_by\",\"bitrix.kraytonlinebabysitter_kz\",\"bitrix.kraytonlinebabysitter_uaa\",\"bitrix.kraytsportonline_ru\",\"bitrix.kraytsportonline_by\",\"bitrix.kraytsportonline_kz\",\"bitrix.kraytsportonline_ua\",\"bitrix.kraytmasterforhour_ru\",\"bitrix.kraytmasterforhour_by\",\"bitrix.kraytmasterforhour_kz\",\"bitrix.kraytmasterforhour_ua\",\"bitrix.kraytdelivery_ru\",\"bitrix.kraytdelivery_by\",\"bitrix.kraytdelivery_kz\",\"bitrix.kraytdelivery_ua\",\"bitrix.kraytrepairservice_ru\",\"bitrix.kraytrepairservice_by\",\"bitrix.kraytrepairservice_kz\",\"bitrix.kraytrepairservice_ua\",\"bitrix.kraytprofipage_ru\",\"bitrix.kraytprofipage_by\",\"bitrix.kraytprofipage_kz\",\"bitrix.kraytprofipage_ua\",\"bitrix.krayttutor_ru\",\"bitrix.krayttutor_by\",\"bitrix.krayttutor_kz\",\"bitrix.krayttutor_ua\",\"bitrix.kraytartificialintelligence_ru\",\"bitrix.kraytartificialintelligence_by\",\"bitrix.kraytartificialintelligence_kz\",\"bitrix.kraytartificialintelligence_ua\",\"bitrix.kraytyoutubechannel_ru\",\"bitrix.kraytyoutubechannel_by\",\"bitrix.kraytyoutubechannel_kz\",\"bitrix.kraytyoutubechannel_ua\",\"bitrix.kraytchildrensschool_ru\",\"bitrix.kraytchildrensschool_by\",\"bitrix.kraytchildrensschool_kz\",\"bitrix.kraytchildrensschool_ua\",\"bitrix.krayttravelagency_ru\",\"bitrix.krayttravelagency_by\",\"bitrix.krayttravelagency_kz\",\"bitrix.krayttravelagency_ua\",\"bitrix.krayttranslator_ru\",\"bitrix.krayttranslator_by\",\"bitrix.krayttranslator_kz\",\"bitrix.krayttranslator_ua\",\"bitrix.kraytstylist_ru\",\"bitrix.kraytstylist_by\",\"bitrix.kraytstylist_kz\",\"bitrix.kraytstylist_ua\",\"bitrix.kraytstretchingstudio_ru\",\"bitrix.kraytstretchingstudio_by\",\"bitrix.kraytstretchingstudio_kz\",\"bitrix.kraytstretchingstudio_ua\",\"bitrix.kraytsportschool_ru\",\"bitrix.kraytsportschool_by\",\"bitrix.kraytsportschool_kz\",\"bitrix.kraytsportschool_ua\",\"bitrix.kraytsitedesigner_ru\",\"bitrix.kraytsitedesigner_by\",\"bitrix.kraytsitedesigner_kz\",\"bitrix.kraytsitedesigner_ua\",\"bitrix.kraytsport_ru\",\"bitrix.kraytsport_by\",\"bitrix.kraytsport_kz\",\"bitrix.kraytsport_ua\",\"bitrix.kraytmobileapp_ru\",\"bitrix.kraytmobileapp_by\",\"bitrix.kraytmobileapp_kz\",\"bitrix.kraytmobileapp_ua\",\"bitrix.kraytrealestate_ru\",\"bitrix.kraytrealestate_by\",\"bitrix.kraytrealestate_kz\",\"bitrix.kraytrealestate_ua\",\"bitrix.delobotnewyearsale_ru\",\"bitrix.delobotnewyearsale_by\",\"bitrix.delobotnewyearsale_kz\",\"bitrix.delobotnewyearsale_ua\",\"bitrix.delobotyoga_ru\",\"bitrix.delobotyoga_by\",\"bitrix.delobotyoga_kz\",\"bitrix.delobotyoga_ua\",\"bitrix.delobotcake_ru\",\"bitrix.delobotcake_by\",\"bitrix.delobotcake_kz\",\"bitrix.delobotcake_ua\",\"bitrix.delobotveterinarian_ru\",\"bitrix.delobotveterinarian_by\",\"bitrix.delobotveterinarian_kz\",\"bitrix.delobotveterinarian_ua\",\"bitrix.delobotpsychologist_ru\",\"bitrix.delobotpsychologist_by\",\"bitrix.delobotpsychologist_kz\",\"bitrix.delobotpsychologist_ua\",\"bitrix.delobotdecoration_ru\",\"bitrix.delobotdecoration_by\",\"bitrix.delobotdecoration_kz\",\"bitrix.delobotdecoration_ua\",\"bitrix.delobotflorist_ru\",\"bitrix.delobotflorist_by\",\"bitrix.delobotflorist_kz\",\"bitrix.delobotflorist_ua\",\"bitrix.delobotcarservice_ru\",\"bitrix.delobotcarservice_by\",\"bitrix.delobotcarservice_kz\",\"bitrix.delobotcarservice_ua\",\"bitrix.delobotcargotransportation_ru\",\"bitrix.delobotcargotransportation_by\",\"bitrix.delobotcargotransportation_kz\",\"bitrix.delobotcargotransportation_ua\",\"bitrix.delobotrealtor_ru\",\"bitrix.delobotrealtor_by\",\"bitrix.delobotrealtor_kz\",\"bitrix.delobotrealtor_ua\",\"bitrix.delobotfurnituremanufacturing_ru\",\"bitrix.delobotfurnituremanufacturing_by\",\"bitrix.delobotfurnituremanufacturing_kz\",\"bitrix.delobotfurnituremanufacturing_ua\",\"bitrix.delobotorganizationofholidays_ru\",\"bitrix.delobotorganizationofholidays_by\",\"bitrix.delobotorganizationofholidays_kz\",\"bitrix.delobotorganizationofholidays_ua\",\"bitrix.delobotconcertannounce_ru\",\"bitrix.delobotconcertannounce_by\",\"bitrix.delobotconcertannounce_kz\",\"bitrix.delobotconcertannounce_ua\",\"bitrix.delobotphotographersservice_ru\",\"bitrix.delobotphotographersservice_by\",\"bitrix.delobotphotographersservice_kz\",\"bitrix.delobotphotographersservice_ua\",\"bitrix.kraytsecurityagency_ru\",\"bitrix.kraytsecurityagency_by\",\"bitrix.kraytsecurityagency_kz\",\"bitrix.kraytsecurityagency_ua\",\"bitrix.kraytrecordingstudio_ru\",\"bitrix.kraytrecordingstudio_by\",\"bitrix.kraytrecordingstudio_kz\",\"bitrix.kraytrecordingstudio_ua\",\"bitrix.kraytrealestateagent_ru\",\"bitrix.kraytrealestateagent_by\",\"bitrix.kraytrealestateagent_kz\",\"bitrix.kraytrealestateagent_ua\",\"bitrix.delobotdecorationhouses_ru\",\"bitrix.delobotdecorationhouses_by\",\"bitrix.delobotdecorationhouses_kz\",\"bitrix.delobotdecorationhouses_ua\",\"bitrix.delobotairconditioners_ru\",\"bitrix.delobotairconditioners_by\",\"bitrix.delobotairconditioners_kz\",\"bitrix.delobotairconditioners_ua\",\"bitrix.delobotdesignworkshop_ru\",\"bitrix.delobotdesignworkshop_by\",\"bitrix.delobotdesignworkshop_kz\",\"bitrix.delobotdesignworkshop_ua\",\"bitrix.delobotcitygreeningproject_ru\",\"bitrix.delobotcitygreeningproject_by\",\"bitrix.delobotcitygreeningproject_kz\",\"bitrix.delobotcitygreeningproject_ua\",\"bitrix.delobotecoproducts_ru\",\"bitrix.delobotecoproducts_by\",\"bitrix.delobotecoproducts_kz\",\"bitrix.delobotecoproducts_ua\",\"bitrix.delobotsoundrecordingservices_ru\",\"bitrix.delobotsoundrecordingservices_by\",\"bitrix.delobotsoundrecordingservices_kz\",\"bitrix.delobotsoundrecordingservices_ua\",\"bitrix.delobotsecurityservice_ru\",\"bitrix.delobotsecurityservice_by\",\"bitrix.delobotsecurityservice_kz\",\"bitrix.delobotsecurityservice_ua\",\"bitrix.delobotsportschool_ru\",\"bitrix.delobotsportschool_by\",\"bitrix.delobotsportschool_kz\",\"bitrix.delobotsportschool_ua\",\"bitrix.delobotfamilyleisure_ru\",\"bitrix.delobotfamilyleisure_by\",\"bitrix.delobotfamilyleisure_kz\",\"bitrix.delobotfamilyleisure_ua\",\"bitrix.delobotdoctortherapist_ru\",\"bitrix.delobotdoctortherapist_by\",\"bitrix.delobotdoctortherapist_kz\",\"bitrix.delobotdoctortherapist_ua\",\"bitrix.kraytagency_ru\",\"bitrix.kraytagency_by\",\"bitrix.kraytagency_kz\",\"bitrix.kraytarchitecture_ru\",\"bitrix.kraytarchitecture_by\",\"bitrix.kraytarchitecture_kz\",\"bitrix.kraytagriculture_ru\",\"bitrix.kraytagriculture_by\",\"bitrix.kraytagriculture_kz\",\"bitrix.kraytbusiness_ru\",\"bitrix.kraytbusiness_by\",\"bitrix.kraytbusiness_kz\",\"bitrix.kraytevents_ru\",\"bitrix.kraytevents_by\",\"bitrix.kraytevents_kz\",\"bitrix.kraythalloween_ru\",\"bitrix.kraythalloween_by\",\"bitrix.kraythalloween_kz\",\"bitrix.kraytinstagramtarget_ru\",\"bitrix.kraytinstagramtarget_by\",\"bitrix.kraytinstagramtarget_kz\",\"bitrix.kraytinstagramcontacts_ru\",\"bitrix.kraytinstagramcontacts_by\",\"bitrix.kraytinstagramcontacts_kz\",\"bitrix.kraytinstagramstock_ru\",\"bitrix.kraytinstagramstock_by\",\"bitrix.kraytinstagramstock_kz\",\"bitrix.kraytpetservice_ru\",\"bitrix.kraytpetservice_by\",\"bitrix.kraytpetservice_kz\",\"bitrix.kraytsolarenergy_ru\",\"bitrix.kraytsolarenergy_by\",\"bitrix.kraytsolarenergy_kz\",\"bitrix.kraytsummersale_ru\",\"bitrix.kraytsummersale_by\",\"bitrix.kraytsummersale_kz\",\"bitrix.krayttravelblog_ru\",\"bitrix.krayttravelblog_by\",\"bitrix.krayttravelblog_kz\",\"bitrix.kraytvebinar_ru\",\"bitrix.kraytvebinar_by\",\"bitrix.kraytvebinar_kz\",\"bitrix.kraytvetclinic_ru\",\"bitrix.kraytvetclinic_by\",\"bitrix.kraytvetclinic_kz\",\"bitrix.kraytrestaurant_ru\",\"bitrix.kraytrestaurant_by\",\"bitrix.kraytrestaurant_kz\",\"bitrix.kraytrestaurant_ua\",\"bitrix.kraytweddingservices_ru\",\"bitrix.kraytweddingservices_by\",\"bitrix.kraytweddingservices_kz\",\"bitrix.kraytweddingservices_ua\",\"bitrix.kraytoptics_ru\",\"bitrix.kraytoptics_by\",\"bitrix.kraytoptics_kz\",\"bitrix.kraytoptics_ua\",\"bitrix.krayt3dprint_ru\",\"bitrix.krayt3dprint_by\",\"bitrix.krayt3dprint_kz\",\"bitrix.krayt3dprint_ua\",\"bitrix.kraytbusinesspremisesdesign_ru\",\"bitrix.kraytbusinesspremisesdesign_by\",\"bitrix.kraytbusinesspremisesdesign_kz\",\"bitrix.kraytbusinesspremisesdesign_ua\",\"bitrix.kraytcentersproject_ru\",\"bitrix.kraytcentersproject_by\",\"bitrix.kraytcentersproject_kz\",\"bitrix.kraytcentersproject_ua\",\"bitrix.kraytcitygreening_ru\",\"bitrix.kraytcitygreening_by\",\"bitrix.kraytcitygreening_kz\",\"bitrix.kraytcitygreening_ua\",\"bitrix.kraytclimatesystems_ru\",\"bitrix.kraytclimatesystems_by\",\"bitrix.kraytclimatesystems_kz\",\"bitrix.kraytclimatesystems_ua\",\"bitrix.kraytclinicmomandbaby_ru\",\"bitrix.kraytclinicmomandbaby_by\",\"bitrix.kraytclinicmomandbaby_kz\",\"bitrix.kraytclinicmomandbaby_ua\",\"bitrix.kraytdesignerclothing_ru\",\"bitrix.kraytdesignerclothing_by\",\"bitrix.kraytdesignerclothing_kz\",\"bitrix.kraytdesignerclothing_ua\",\"bitrix.kraytprivatedoctor_ru\",\"bitrix.kraytprivatedoctor_by\",\"bitrix.kraytprivatedoctor_kz\",\"bitrix.kraytprivatedoctor_ua\",\"bitrix.kraytprintinghouse_ru\",\"bitrix.kraytprintinghouse_by\",\"bitrix.kraytprintinghouse_kz\",\"bitrix.kraytprintinghouse_ua\",\"bitrix.kraytpersonalcoach_ru\",\"bitrix.kraytpersonalcoach_by\",\"bitrix.kraytpersonalcoach_kz\",\"bitrix.kraytpersonalcoach_ua\",\"bitrix.kraytperfumer_ru\",\"bitrix.kraytperfumer_by\",\"bitrix.kraytperfumer_kz\",\"bitrix.kraytperfumer_ua\",\"bitrix.kraytnewsblog_ru\",\"bitrix.kraytnewsblog_by\",\"bitrix.kraytnewsblog_kz\",\"bitrix.kraytnewsblog_ua\",\"bitrix.kraytmakeupstudio_ru\",\"bitrix.kraytmakeupstudio_by\",\"bitrix.kraytmakeupstudio_kz\",\"bitrix.kraytmakeupstudio_ua\",\"bitrix.kraytlawyer_ru\",\"bitrix.kraytlawyer_by\",\"bitrix.kraytlawyer_kz\",\"bitrix.kraytlawyer_ua\",\"bitrix.kraytlandscapedesign_ru\",\"bitrix.kraytlandscapedesign_by\",\"bitrix.kraytlandscapedesign_kz\",\"bitrix.kraytlandscapedesign_ua\",\"bitrix.kraytjewelryrepairshop_ru\",\"bitrix.kraytjewelryrepairshop_by\",\"bitrix.kraytjewelryrepairshop_kz\",\"bitrix.kraytjewelryrepairshop_ua\",\"bitrix.kraytinteriordesign_ru\",\"bitrix.kraytinteriordesign_by\",\"bitrix.kraytinteriordesign_kz\",\"bitrix.kraytinsurancecompany_ru\",\"bitrix.kraytinsurancecompany_kz\",\"bitrix.kraytinsurancecompany_ua\",\"bitrix.kraytillustrator_ru\",\"bitrix.kraytillustrator_by\",\"bitrix.kraytillustrator_kz\",\"bitrix.kraytillustrator_ua\",\"bitrix.kraytgiftsvalentineday_ru\",\"bitrix.kraytgiftsvalentineday_by\",\"bitrix.kraytgiftsvalentineday_kz\",\"bitrix.kraytgiftsvalentineday_ua\",\"bitrix.kraytfebruary23_ru\",\"bitrix.kraytfebruary23_by\",\"bitrix.kraytfebruary23_kz\",\"bitrix.kraytfebruary23_ua\",\"bitrix.kraytequipmentrepair_ru\",\"bitrix.kraytequipmentrepair_by\",\"bitrix.kraytequipmentrepair_kz\",\"bitrix.kraytequipmentrepair_ua\",\"bitrix.kraytdentistry_ru\",\"bitrix.kraytdentistry_by\",\"bitrix.kraytdentistry_kz\",\"bitrix.kraytdentistry_ua\",\"bitrix.kraytdancemarathon_ru\",\"bitrix.kraytdancemarathon_by\",\"bitrix.kraytdancemarathon_kz\",\"bitrix.kraytdancemarathon_ua\",\"bitrix.kraytcourseformothers_ru\",\"bitrix.kraytcourseformothers_by\",\"bitrix.kraytcourseformothers_kz\",\"bitrix.kraytcourseformothers_ua\",\"bitrix.kraytcosmetologist_ru\",\"bitrix.kraytcosmetologist_by\",\"bitrix.kraytcosmetologist_kz\",\"bitrix.kraytcosmetologist_ua\",\"bitrix.kraytconstructionofprivatehouses_ru\",\"bitrix.kraytconstructionofprivatehouses_by\",\"bitrix.kraytconstructionofprivatehouses_kz\",\"bitrix.kraytconstructionofprivatehouses_ua\",\"bitrix.kraytconfectionery_ru\",\"bitrix.kraytconfectionery_by\",\"bitrix.kraytconfectionery_kz\",\"bitrix.kraytconfectionery_ua\",\"bitrix.kraytcoffeehouse_ru\",\"bitrix.kraytcoffeehouse_by\",\"bitrix.kraytcoffeehouse_kz\",\"bitrix.kraytcoffeehouse_ua\",\"bitrix.kraytcleaningservice_ru\",\"bitrix.kraytcleaningservice_by\",\"bitrix.kraytcleaningservice_kz\",\"bitrix.kraytcleaningservice_ua\",\"bitrix.kraytbeautystudio_ru\",\"bitrix.kraytbeautystudio_by\",\"bitrix.kraytbeautystudio_kz\",\"bitrix.kraytbeautystudio_ua\",\"bitrix.kraytbarbershop_ru\",\"bitrix.kraytbarbershop_by\",\"bitrix.kraytartworkshop_by\",\"bitrix.kraytbarbershop_kz\",\"bitrix.kraytbarbershop_ua\",\"bitrix.kraytartworkshop_ru\",\"bitrix.kraytartworkshop_kz\",\"bitrix.kraytartworkshop_ua\",\"bitrix.kraytaprilfoolsdaygifts_ru\",\"bitrix.kraytaprilfoolsdaygifts_by\",\"bitrix.kraytaprilfoolsdaygifts_kz\",\"bitrix.kraytaprilfoolsdaygifts_ua\",\"bitrix.kraytwindowinstallation_ru\",\"bitrix.kraytwindowinstallation_by\",\"bitrix.kraytwindowinstallation_kz\",\"bitrix.kraytwindowinstallation_ua\",\"bitrix.kraytwindowdesign_ru\",\"bitrix.kraytwindowdesign_by\",\"bitrix.kraytwindowdesign_kz\",\"bitrix.kraytwindowdesign_ua\",\"bitrix.krayttelecommunications_ru\",\"bitrix.krayttelecommunications_by\",\"bitrix.krayttelecommunications_kz\",\"bitrix.krayttelecommunications_ua\",\"bitrix.kraytsportsnutritionorder_ru\",\"bitrix.kraytsportsnutritionorder_by\",\"bitrix.kraytsportsnutritionorder_kz\",\"bitrix.kraytsportsnutritionorder_ua\",\"bitrix.kraytreconstructionoffices_ru\",\"bitrix.kraytreconstructionoffices_by\",\"bitrix.kraytreconstructionoffices_kz\",\"bitrix.kraytreconstructionoffices_ua\",\"bitrix.kraytpremisestrade_ru\",\"bitrix.kraytpremisestrade_by\",\"bitrix.kraytpremisestrade_ua\",\"bitrix.kraytinsulationhouses_ru\",\"bitrix.kraytinsulationhouses_by\",\"bitrix.kraytinsulationhouses_kz\",\"bitrix.kraytinsulationhouses_ua\",\"bitrix.kraytinstallsecuritysystems_ru\",\"bitrix.kraytinstallsecuritysystems_by\",\"bitrix.kraytinstallsecuritysystems_kz\",\"bitrix.kraytinstallsecuritysystems_ua\",\"bitrix.kraytinstallbathrooms_ru\",\"bitrix.kraytinstallbathrooms_by\",\"bitrix.kraytinstallbathrooms_kz\",\"bitrix.kraytinstallbathrooms_ua\",\"bitrix.kraythousedesign_ru\",\"bitrix.kraythousedesign_by\",\"bitrix.kraythousedesign_kz\",\"bitrix.kraythousedesign_ua\",\"bitrix.kraythospitalforfamily_ru\",\"bitrix.kraythospitalforfamily_by\",\"bitrix.kraythospitalforfamily_kz\",\"bitrix.kraythospitalforfamily_ua\",\"bitrix.kraythomedecoration_ru\",\"bitrix.kraythomedecoration_by\",\"bitrix.kraythomedecoration_kz\",\"bitrix.kraythomedecoration_ua\",\"bitrix.kraytfurniturettransformer_ru\",\"bitrix.kraytfurniturettransformer_by\",\"bitrix.kraytfurniturettransformer_kz\",\"bitrix.kraytfurniturettransformer_ua\",\"bitrix.kraytfloristics_ru\",\"bitrix.kraytfloristics_by\",\"bitrix.kraytfloristics_kz\",\"bitrix.kraytfloristics_ua\",\"bitrix.kraytfestiveevents_ru\",\"bitrix.kraytfestiveevents_by\",\"bitrix.kraytfestiveevents_kz\",\"bitrix.kraytfestiveevents_ua\",\"bitrix.kraytecogreen_ru\",\"bitrix.kraytecogreen_by\",\"bitrix.kraytecogreen_kz\",\"bitrix.kraytecogreen_ua\",\"bitrix.kraytdoorinstallation_ru\",\"bitrix.kraytdoorinstallation_by\",\"bitrix.kraytdoorinstallation_kz\",\"bitrix.kraytdoorinstallation_ua\",\"bitrix.kraytdoordesign_ru\",\"bitrix.kraytdoordesign_by\",\"bitrix.kraytdoordesign_kz\",\"bitrix.kraytdoordesign_ua\",\"bitrix.kraytdesigningpeopledisabilities_ru\",\"bitrix.kraytdesigningpeopledisabilities_by\",\"bitrix.kraytdesigningpeopledisabilities_kz\",\"bitrix.kraytdesigningpeopledisabilities_ua\",\"bitrix.delobotkindergarten_ru\",\"bitrix.kraytvideostudio_ru\",\"bitrix.kraytlegalservices_ru\",\"bitrix.kraytaccountingservices_ru\",\"bitrix.kraytbookannouncement_ru\",\"bitrix.kraytcharity_ru\",\"bitrix.kraytspa_ru\",\"bitrix.kraythandmadecosmetics_ru\",\"bitrix.delobotmusic_ru\",\"bitrix.kraythotelforanimals_ru\",\"bitrix.kraytcityguide_ru\",\"bitrix.delobotfoodblog_ru\",\"bitrix.delobotgamedeveloper_ru\",\"bitrix.delobotrenovationoffices_ru\",\"bitrix.delobotcourses_ru\",\"bitrix.delobotcityb__beautification_ru\",\"bitrix.delobotaidfund_ru\",\"bitrix.delobotnewsblog_ru\",\"bitrix.delobottransportservices_ru\",\"bitrix.delobotguide_ru\",\"bitrix.delobotnnturalcosmetic_ru\",\"bitrix.delobotboutiqueforsale_ru\",\"bitrix.delobotorganizationweddings_ru\",\"bitrix.delobotbeautyandrecreationcenter_ru\",\"bitrix.delobotwriter_ru\",\"bitrix.kraytotel\",\"bitrix.kraytigrovoyklub\",\"bitrix.kraytbazaotdykha\",\"bitrix.kraytkurspotiktoku\",\"bitrix.kraytkadrovoeagenstvo\",\"bitrix.kraytportfoliomodeli\",\"bitrix.kraytminecraftserver\",\"bitrix.kraytigrovayakompaniya\",\"bitrix.delobotuslugivideoproizvodstva\",\"bitrix.delobotportfolioaktera\",\"bitrix.delobotpub\",\"bitrix.delobotminihotel\",\"bitrix.delobotcamping\",\"bitrix.delobotcafe\",\"bitrix.delobotizgotovlenieduxov\",\"bitrix.delobotbuhgalterskoeobslujivanie\",\"bitrix.delobotarendanedvizimosti\",\"bitrix.delobotalternativnayaenergetika\",\"bitrix.delobotagentstvoponaimy\",\"bitrix.kraytpodarkikjenskomydny\",\"bitrix.kraytinstagramcontacts_ru1\",\"bitrix.kraytinstagramstock_ru1\",\"bitrix.kraytinstagramtarget_ru1\",\"bitrix.kraytkhimchistka\",\"bitrix.krayt_detskaya_odezhda_na_zakaz\",\"bitrix.krayt_retsepty_blyud\",\"bitrix.krayt_detskaya_mebel\",\"bitrix.krayt_biblioteka\",\"bitrix.krayt_pitomnik_rasteniy\",\"bitrix.delobot_lawyer\",\"bitrix.delobot_oformlenie_dverey\",\"bitrix.delobot_montaj_dverey\",\"bitrix.delobot_manicure_and_pedicure\",\"bitrix.delobot_printing_services\",\"bitrix.delobot_plants\",\"bitrix.delobot_nutritionist\",\"bitrix.delobot_designer_tableware\",\"bitrix.delobot_montaj_okon\",\"bitrix.delobot_oformlenie_okon\",\"bitrix.krayt_zhurnalist\",\"bitrix.krayt_tato_salon\",\"bitrix.krayt_massajist\",\"bitrix.krayt_consulting\",\"bitrix.krayt_elektromontazh\",\"bitrix.krayt_rezyume_spetsialista\",\"bitrix.kraytportfoliophotographer\",\"bitrix.kraytbeautystudio_en\",\"bitrix.kraytautomechanic_en\",\"bitrix.kraytequipmentrepair_en\",\"bitrix.delobot_furniture_for_children\",\"bitrix.delobot_architectural_projects\",\"bitrix.delobot_scientists_page\",\"bitrix.delobot_tatoo_studio\",\"bitrix.delobot_journalist_resume\",\"bitrix.delobot_leather_goods\",\"bitrix.delobot_dance_marathon\",\"bitrix.krayt_art_gallery\",\"bitrix.krayt_leather_products\",\"bitrix.krayt_scientific_researcher\",\"bitrix.krayt_bureau_of_architecture\",\"bitrix.krayt_jewelry_designer\",\"bitrix.krayt_food_photographer\",\"bitrix.krayt_acting_studio\",\"bitrix.krayt_farm\",\"bitrix.krayt_fashion_blog\",\"bitrix.krayt_birthday_cakes\",\"bitrix.krayt_plussize_fashion\",\"bitrix.krayt_diving\",\"bitrix.krayt_it_services\",\"bitrix.krayt_beauty_blog\",\"bitrix.krayt_aquarium\",\"bitrix.krayt_sport_blog\",\"bitrix.delobot_online_library\",\"bitrix.delobot_diving_center\",\"bitrix.delobot_designer_jewelry\",\"bitrix.delobot_nail_art_course\",\"bitrix.delobot_art_galery\",\"bitrix.delobot_fashion_for_everyone\",\"bitrix.delobot_handmade_chocolate\",\"bitrix.krayt_chocolate_shop\",\"bitrix.krayt_advertising_agency\",\"bitrix.krayt_asian_food\",\"bitrix.krayt_avtorskiy_master_klass\",\"bitrix.krayt_utilizatsiya_otkhodov\",\"bitrix.krayt_italyanskaya_kukhnya\",\"bitrix.krayt_kurs_po_nogtevomu_servisu\",\"bitrix.krayt_begovoy_klub\",\"bitrix.krayt_gornyy_turizm\",\"bitrix.krayt_biznes_prostranstvo\",\"bitrix.krayt_shkola_iskusstv\",\"bitrix.krayt_onlayn_intensiv_inostrannogo_yazyka\",\"bitrix.delobot_reklama_brenda\",\"bitrix.delobot_italyanskiy_restoran\",\"bitrix.delobot_modnaya_stranichka\",\"bitrix.delobot_fotografiya_edy\",\"bitrix.krayt_pishchevoe_proizvodstvo\",\"bitrix.krayt_appetitnyy_blog\",\"bitrix.krayt_uslugi_remonta\",\"bitrix.krayt_onlayn_kurs_kreativnogo_prodyusera\",\"bitrix.krayt_detskie_prazdniki\",\"bitrix.krayt_svetotekhnika\",\"bitrix.krayt_urbanistika\",\"bitrix.krayt_otdykh_na_prirode\",\"bitrix.krayt_sportivnye_ploshchadki\",\"bitrix.krayt_oborudovanie_dlya_turizma\",\"bitrix.krayt_meksikanskaya_kukhnya\",\"bitrix.delobot_sports_blog_20\",\"bitrix.delobot_aziatskie_blyuda\",\"bitrix.delobot_beauty_blog\",\"bitrix.delobot_meksikanskiy_restoran_2_0\",\"bitrix.delobot_urban_project\",\"bitrix.delobot_drawing_school\",\"bitrix.delobot_tourism\",\"bitrix.delobot_runnig_club\",\"bitrix.delobot_lighting_company\",\"bitrix.delobot_garbage_disposal\",\"bitrix.delobot_master_class\",\"bitrix.delobot_it_outsourcing\",\"bitrix.krayt_rent_car\",\"bitrix.krayt_aviation\",\"bitrix.krayt_street_sport_club\",\"bitrix.krayt_kofemaniya\",\"bitrix.krayt_corporate_events\",\"bitrix.krayt_cooking_school\",\"bitrix.krayt_blacksmith_craft\",\"bitrix.krayt_med_lab\",\"bitrix.krayt_music_studio\",\"bitrix.krayt_web_application_development\",\"bitrix.krayt_tennis_club\",\"bitrix.krayt_bank_services\",\"bitrix.krayt_smart_furniture\",\"bitrix.krayt_dom_pod_klyuch\",\"bitrix.krayt_uslugi_mediatora\",\"bitrix.krayt_child_club\",\"bitrix.delobot_custom_made_cakes\",\"bitrix.delobot_online_yoga_classes\",\"bitrix.krayt_pevitsa\",\"bitrix.krayt_ozelenenie_pomeshcheniy\",\"bitrix.krayt_internet_agentstvo\",\"bitrix.krayt_kinolog\",\"bitrix.krayt_poleznye_sneki\",\"bitrix.krayt_oformlenie_interera\",\"bitrix.delobot_tourist_equipment\",\"bitrix.delobot_creative_producer\",\"bitrix.delobot_aviation_services\",\"bitrix.delobot_blacksmith_services\",\"bitrix.delobot_coffee_subscription\",\"bitrix.delobot_construction_company\",\"bitrix.delobot_business_premises\",\"bitrix.delobot_pet_hotel\",\"bitrix.delobot_food_industry\",\"bitrix.delobot_cars_for_rent\",\"bitrix.krayt_klub_dlya_geymerov\",\"bitrix.krayt_relaks_uslugi\",\"bitrix.krayt_sportivnyy_inventar\",\"bitrix.krayt_universitet\",\"bitrix.delobot_uslugi_kinologa\",\"bitrix.delobot_business_training\",\"bitrix.krayt_vebinar\",\"bitrix.krayt_kurs_po_iskusstvennomu_intellektu\",\"bitrix.delobot_vypechka_na_zakaz\",\"bitrix.delobot_osennaya_rasprodazh\",\"bitrix.krayt_onlayn_shkola_dlya_detey\",\"bitrix.krayt_arkhitekturnaya_kompaniya\",\"bitrix.krayt_den_blagodareniya\",\"bitrix.krayt_uslugi_nyani\",\"bitrix.krayt_uslugi_repetitora\",\"bitrix.krayt_logoped\",\"bitrix.krayt_chyernaya_pyatnitsa\",\"bitrix.krayt_sladosti_na_rozhdestvo\",\"bitrix.krayt_podarki_na_novyy_god\",\"bitrix.delobot_laboratory\",\"bitrix.delobot_street_sports_grounds\",\"bitrix.delobot_about_webinar\",\"bitrix.krayt_dostavka_gruza\",\"bitrix.delobot_online_travel\",\"bitrix.delobot_youtube_channel\",\"bitrix.delobot_interior_design\",\"bitrix.krayt_kursy_po_interesam\",\"bitrix.krayt_zimnyaya_rasprodazha\",\"bitrix.krayt_tsifrovye_kommunikatsii\",\"bitrix.krayt_avtosalon\",\"bitrix.krayt_uslugi_stroitelnoy_kompanii\",\"bitrix.krayt_vysshee_uchebnoe_zavedenie\",\"bitrix.krayt_veterinar\",\"bitrix.krayt_akademiya_iskusstv\",\"bitrix.krayt_master_po_domu\",\"bitrix.krayt_onlayn_trenirovki\",\"bitrix.krayt_apart_otel\",\"bitrix.krayt_tsvety_i_bukety_na_zakaz\",\"bitrix.krayt_biznes_forum\",\"bitrix.krayt_uslugi_stomatologii\",\"bitrix.krayt_uslugi_avtoservisa\",\"bitrix.delobot_winter_sale\",\"bitrix.krayt_christmas_treats\",\"bitrix.krayt_eksperty_tochnogo_zemledeliya\",\"bitrix.krayt_servis_ukhoda_za_domom\",\"bitrix.delobot_repetitor\",\"bitrix.delobot_babysitter_for_children\",\"bitrix.delobot_speech_therapist_services\",\"bitrix.empty_template\",\"bitrix.krayt_gift_wrapping\",\"bitrix.delobot_fitness_clothes\",\"bitrix.delobot_bathroom_renovation\",\"bitrix.delobot_travel_arrangements\",\"bitrix.krayt_music_classes\",\"bitrix.delobot_klinika_dlya_mam_i_detok\",\"bitrix.delobot_bankovskie_uslugi\",\"bitrix.krayt_videoproizvodstvo\",\"bitrix.krayt_manikyur\",\"bitrix.krayt_meditsinskaya_pomoshch_onlayn\",\"bitrix.krayt_oblagorazhivanie_goroda\",\"bitrix.krayt_uslugi_barbershopa\",\"bitrix.krayt_taksi\",\"bitrix.delobot_optika\",\"bitrix.delobot_klinika_stomatologii\",\"bitrix.delobot_konditer\",\"bitrix.delobot_3d_print_services\",\"bitrix.delobot_uslugi_khimchistki\",\"bitrix.delobot_obuchenie_po_iskusstvennomu_intellektu\",\"bitrix.krayt_nutritsiologiya\",\"bitrix.krayt_salon_krasoty\",\"bitrix.krayt_uslugi_perevoda\",\"bitrix.krayt_landshaftnyy_dizayner\",\"bitrix.krayt_mebel_gotovaya_i_na_zakaz\",\"bitrix.krayt_uslugi_yurista\",\"bitrix.krayt_uslugi_po_bukhgalterii\",\"bitrix.krayt_yuvelir\",\"bitrix.krayt_stranichka_s_aktsiey\",\"bitrix.krayt_den_vsekh_vlyublennykh\",\"bitrix.krayt_stranichka_kontaktov\",\"bitrix.krayt_uslugi_massazhista\",\"bitrix.krayt_dostavka_edy_i_napitkov\",\"bitrix.krayt_podarki_na_zhenskiy_den\",\"bitrix.krayt_ekskursii\",\"bitrix.krayt_proizvodstvo_kosmetiki\",\"bitrix.krayt_logistika\",\"bitrix.krayt_fotograf\",\"bitrix.krayt_arenda_zhilya\",\"bitrix.krayt_kliningovye_uslugi\",\"bitrix.krayt_agentstvo_po_naymu\",\"bitrix.krayt_dukhi_na_zakaz\"]', NULL, NULL),
('rest', 'entity_iblock_type', 'rest_entity', NULL, NULL),
('rest', 'server_path', '/rest', NULL, NULL),
('search', 'dbnode_id', 'N', NULL, NULL),
('search', 'dbnode_status', 'ok', NULL, NULL),
('search', 'version', 'v2.0', NULL, NULL),
('seo', 'yandex_direct_region_last_update', '0', NULL, NULL),
('socialservices', 'allow_encrypted_tokens', '1', NULL, NULL),
('socialservices', 'bitrix24net_domain', 'http://localhost', NULL, NULL),
('socialservices', 'bitrix24net_id', 'ext.6427328d2c2e21.16721852', NULL, NULL),
('socialservices', 'bitrix24net_secret', 'QpWiragW8XoVmJCt3dqOQ51pL67RHgW9HLkQmPaarB41MAOpUD', NULL, NULL),
('socialservices', 'google_api_key', 'AIzaSyA7puwZwGDJgOjcAWsFsY7hQcrioC13A18', NULL, NULL),
('socialservices', 'google_appid', '798910771106.apps.googleusercontent.com', NULL, NULL);
-- -----------------------------------
-- Dumping table b_option_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_option_site`;
CREATE TABLE `b_option_site` (
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`MODULE_ID`,`NAME`,`SITE_ID`),
  KEY `ix_option_site_module_site` (`MODULE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating`;
CREATE TABLE `b_rating` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(512) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CALCULATION_METHOD` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SUM',
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `POSITION` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `AUTHORITY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `CALCULATED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONFIGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_rating` VALUES
(1, 'N', 'Рейтинг', 'USER', 'SUM', '2023-03-31 22:20:39', NULL, NULL, 'Y', 'N', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:16:\"TODAY_TOPIC_COEF\";s:3:\"0.4\";s:15:\"WEEK_TOPIC_COEF\";s:3:\"0.2\";s:16:\"MONTH_TOPIC_COEF\";s:3:\"0.1\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.2\";s:14:\"WEEK_POST_COEF\";s:3:\"0.1\";s:15:\"MONTH_POST_COEF\";s:4:\"0.05\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.5\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:3:\"0.1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:9:{s:6:\"ACTIVE\";s:1:\"Y\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}'),
(2, 'N', 'Авторитет', 'USER', 'SUM', '2023-03-31 22:20:39', NULL, NULL, 'Y', 'Y', 'N', 'a:3:{s:4:\"MAIN\";a:2:{s:4:\"VOTE\";a:1:{s:4:\"USER\";a:3:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:1:\"0\";}}s:6:\"RATING\";a:1:{s:5:\"BONUS\";a:2:{s:6:\"ACTIVE\";s:1:\"Y\";s:11:\"COEFFICIENT\";s:1:\"1\";}}}s:5:\"FORUM\";a:2:{s:4:\"VOTE\";a:2:{s:5:\"TOPIC\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:16:\"TODAY_TOPIC_COEF\";s:2:\"20\";s:15:\"WEEK_TOPIC_COEF\";s:2:\"10\";s:16:\"MONTH_TOPIC_COEF\";s:1:\"5\";s:14:\"ALL_TOPIC_COEF\";s:1:\"0\";s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";}}}s:4:\"BLOG\";a:2:{s:4:\"VOTE\";a:2:{s:4:\"POST\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}s:7:\"COMMENT\";a:2:{s:11:\"COEFFICIENT\";s:1:\"1\";s:5:\"LIMIT\";s:2:\"30\";}}s:6:\"RATING\";a:1:{s:8:\"ACTIVITY\";a:8:{s:15:\"TODAY_POST_COEF\";s:3:\"0.4\";s:14:\"WEEK_POST_COEF\";s:3:\"0.2\";s:15:\"MONTH_POST_COEF\";s:3:\"0.1\";s:13:\"ALL_POST_COEF\";s:1:\"0\";s:18:\"TODAY_COMMENT_COEF\";s:3:\"0.2\";s:17:\"WEEK_COMMENT_COEF\";s:3:\"0.1\";s:18:\"MONTH_COMMENT_COEF\";s:4:\"0.05\";s:16:\"ALL_COMMENT_COEF\";s:1:\"0\";}}}}');
-- -----------------------------------
-- Dumping table b_rating_component
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_component`;
CREATE TABLE `b_rating_component` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CALC_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EXCEPTION_METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `NEXT_CALCULATION` datetime DEFAULT NULL,
  `REFRESH_INTERVAL` int(11) NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_ID_1` (`RATING_ID`,`ACTIVE`,`NEXT_CALCULATION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_component_results
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_component_results`;
CREATE TABLE `b_rating_component_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `RATING_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `COMPLEX_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `IX_COMPLEX_NAME` (`COMPLEX_NAME`),
  KEY `IX_RATING_ID_2` (`RATING_ID`,`COMPLEX_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_prepare
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_prepare`;
CREATE TABLE `b_rating_prepare` (
  `ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_results
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_results`;
CREATE TABLE `b_rating_results` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `CURRENT_VALUE` decimal(18,4) DEFAULT NULL,
  `PREVIOUS_VALUE` decimal(18,4) DEFAULT NULL,
  `CURRENT_POSITION` int(11) DEFAULT '0',
  `PREVIOUS_POSITION` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_3` (`RATING_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`),
  KEY `IX_RATING_4` (`RATING_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_rule
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_rule`;
CREATE TABLE `b_rating_rule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `NAME` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_MODULE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONDITION_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTION_NAME` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `ACTION_CONFIG` text COLLATE utf8_unicode_ci,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `ACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DEACTIVATE_CLASS` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEACTIVATE_METHOD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_MODIFIED` datetime DEFAULT NULL,
  `LAST_APPLIED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_rating_rule` VALUES
(1, 'N', 'Добавление в группу пользователей, имеющих право голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:1;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2023-03-31 22:20:39', '2023-03-31 22:20:39', NULL),
(2, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за рейтинг', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:1;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"3\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2023-03-31 22:20:39', '2023-03-31 22:20:39', NULL),
(3, 'N', 'Добавление в группу пользователей, имеющих право голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:1;s:12:\"RATING_VALUE\";i:2;}}', 'ADD_TO_GROUP', 'a:1:{s:12:\"ADD_TO_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'addToGroup', 'N', 'CRatingRulesMain ', 'addToGroup', '2023-03-31 22:20:39', '2023-03-31 22:20:39', NULL),
(4, 'N', 'Удаление из группы пользователей, не имеющих права голосовать за авторитет', 'USER', 'AUTHORITY', NULL, 'CRatingRulesMain', 'ratingCheck', 'a:1:{s:9:\"AUTHORITY\";a:2:{s:16:\"RATING_CONDITION\";i:2;s:12:\"RATING_VALUE\";i:2;}}', 'REMOVE_FROM_GROUP', 'a:1:{s:17:\"REMOVE_FROM_GROUP\";a:1:{s:8:\"GROUP_ID\";s:1:\"4\";}}', 'N', 'CRatingRulesMain', 'removeFromGroup', 'N', 'CRatingRulesMain ', 'removeFromGroup', '2023-03-31 22:20:39', '2023-03-31 22:20:39', NULL),
(5, 'Y', 'Автоматическое голосование за авторитет пользователя', 'USER', 'VOTE', NULL, 'CRatingRulesMain', 'voteCheck', 'a:1:{s:4:\"VOTE\";a:6:{s:10:\"VOTE_LIMIT\";i:90;s:11:\"VOTE_RESULT\";i:10;s:16:\"VOTE_FORUM_TOPIC\";d:0.5;s:15:\"VOTE_FORUM_POST\";d:0.1;s:14:\"VOTE_BLOG_POST\";d:0.5;s:17:\"VOTE_BLOG_COMMENT\";d:0.1;}}', 'empty', 'a:0:{}', 'N', 'empty', 'empty', 'N', 'empty ', 'empty', '2023-03-31 22:20:39', '2023-03-31 22:20:39', NULL);
-- -----------------------------------
-- Dumping table b_rating_rule_vetting
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_rule_vetting`;
CREATE TABLE `b_rating_rule_vetting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RULE_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ACTIVATE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `APPLIED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `RULE_ID` (`RULE_ID`,`ENTITY_TYPE_ID`,`ENTITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_user
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_user`;
CREATE TABLE `b_rating_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_ID` int(11) NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `BONUS` decimal(18,4) DEFAULT '0.0000',
  `VOTE_WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `VOTE_COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`RATING_ID`,`ENTITY_ID`),
  KEY `IX_B_RAT_USER_2` (`ENTITY_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_rating_user` VALUES
(1, 2, 1, 3.0000, 30.0000, 13);
-- -----------------------------------
-- Dumping table b_rating_vote
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_vote`;
CREATE TABLE `b_rating_vote` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `VALUE` decimal(18,4) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_IP` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `REACTION` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RAT_VOTE_ID` (`RATING_VOTING_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_3` (`OWNER_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_5` (`CREATED`,`VALUE`),
  KEY `IX_RAT_VOTE_ID_6` (`ACTIVE`),
  KEY `IX_RAT_VOTE_ID_7` (`RATING_VOTING_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_8` (`ENTITY_TYPE_ID`,`CREATED`),
  KEY `IX_RAT_VOTE_ID_9` (`CREATED`,`USER_ID`),
  KEY `IX_RAT_VOTE_ID_10` (`USER_ID`,`OWNER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_vote_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_vote_group`;
CREATE TABLE `b_rating_vote_group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` int(11) NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `RATING_ID` (`GROUP_ID`,`TYPE`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_rating_vote_group` VALUES
(1, 1, 'R'),
(2, 3, 'R'),
(3, 1, 'R'),
(4, 3, 'R'),
(5, 1, 'A'),
(6, 4, 'A');
-- -----------------------------------
-- Dumping table b_rating_voting
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_voting`;
CREATE TABLE `b_rating_voting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `OWNER_ID` int(11) NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_CALCULATED` datetime DEFAULT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_ENTITY_TYPE_ID_2` (`ENTITY_TYPE_ID`,`ENTITY_ID`,`ACTIVE`),
  KEY `IX_ENTITY_TYPE_ID_4` (`TOTAL_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_voting_prepare
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_voting_prepare`;
CREATE TABLE `b_rating_voting_prepare` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_VOTING_ID` int(11) NOT NULL,
  `TOTAL_VALUE` decimal(18,4) NOT NULL,
  `TOTAL_VOTES` int(11) NOT NULL,
  `TOTAL_POSITIVE_VOTES` int(11) NOT NULL,
  `TOTAL_NEGATIVE_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_RATING_VOTING_ID` (`RATING_VOTING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_voting_reaction
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_voting_reaction`;
CREATE TABLE `b_rating_voting_reaction` (
  `ENTITY_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `REACTION` varchar(8) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `TOTAL_VOTES` int(11) NOT NULL,
  PRIMARY KEY (`ENTITY_TYPE_ID`,`ENTITY_ID`,`REACTION`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rating_weight
-- -----------------------------------
DROP TABLE IF EXISTS `b_rating_weight`;
CREATE TABLE `b_rating_weight` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RATING_FROM` decimal(18,4) NOT NULL,
  `RATING_TO` decimal(18,4) NOT NULL,
  `WEIGHT` decimal(18,4) DEFAULT '0.0000',
  `COUNT` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_rating_weight` VALUES
(1, -1000000.0000, 1000000.0000, 1.0000, 10);
-- -----------------------------------
-- Dumping table b_rest_ap
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_ap`;
CREATE TABLE `b_rest_ap` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `PASSWORD` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `DATE_LOGIN` datetime DEFAULT NULL,
  `LAST_IP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_rest_ap` (`USER_ID`,`PASSWORD`,`ACTIVE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_ap_permission
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_ap_permission`;
CREATE TABLE `b_rest_ap_permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PASSWORD_ID` int(11) NOT NULL,
  `PERM` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_ap_perm1` (`PASSWORD_ID`,`PERM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_app
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_app`;
CREATE TABLE `b_rest_app` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CLIENT_ID` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `INSTALLED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `URL` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `URL_DEMO` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `URL_INSTALL` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `VERSION` varchar(4) COLLATE utf8_unicode_ci DEFAULT '1',
  `SCOPE` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `STATUS` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'F',
  `DATE_FINISH` date DEFAULT NULL,
  `IS_TRIALED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `SHARED_KEY` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLIENT_SECRET` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APP_NAME` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS` varchar(2000) COLLATE utf8_unicode_ci DEFAULT '',
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `MOBILE` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `USER_INSTALL` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_app1` (`CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_app_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_app_lang`;
CREATE TABLE `b_rest_app_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `MENU_NAME` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_app_lang1` (`APP_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_app_log
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_app_log`;
CREATE TABLE `b_rest_app_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `APP_ID` int(11) NOT NULL,
  `ACTION_TYPE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `USER_ADMIN` char(1) COLLATE utf8_unicode_ci DEFAULT 'Y',
  PRIMARY KEY (`ID`),
  KEY `ix_b_rest_app_log1` (`APP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_configuration_storage
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_configuration_storage`;
CREATE TABLE `b_rest_configuration_storage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `CREATE_TIME` timestamp NULL DEFAULT NULL,
  `CONTEXT` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `DATA` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_event
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_event`;
CREATE TABLE `b_rest_event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) DEFAULT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `USER_ID` int(11) DEFAULT '0',
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `CONNECTOR_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `INTEGRATION_ID` int(11) DEFAULT NULL,
  `OPTIONS` varchar(1024) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_event_app_event` (`APP_ID`,`EVENT_NAME`(50),`EVENT_HANDLER`(180),`USER_ID`,`CONNECTOR_ID`(70)),
  KEY `ix_b_rest_event_event_name` (`EVENT_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_event_offline
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_event_offline`;
CREATE TABLE `b_rest_event_offline` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `MESSAGE_ID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `EVENT_DATA` text COLLATE utf8_unicode_ci,
  `EVENT_ADDITIONAL` text COLLATE utf8_unicode_ci,
  `PROCESS_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `CONNECTOR_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `ERROR` int(3) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_event_offline1` (`MESSAGE_ID`(50),`APP_ID`,`CONNECTOR_ID`(100),`PROCESS_ID`(50)),
  KEY `ix_b_rest_event_offline2` (`TIMESTAMP_X`),
  KEY `ix_b_rest_event_offline3` (`APP_ID`,`CONNECTOR_ID`),
  KEY `ix_b_rest_event_offline4` (`PROCESS_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_integration
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_integration`;
CREATE TABLE `b_rest_integration` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `ELEMENT_CODE` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD_ID` int(11) DEFAULT NULL,
  `APP_ID` int(11) DEFAULT NULL,
  `SCOPE` text COLLATE utf8_unicode_ci,
  `QUERY` text COLLATE utf8_unicode_ci,
  `OUTGOING_EVENTS` text COLLATE utf8_unicode_ci,
  `OUTGOING_NEEDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OUTGOING_HANDLER_URL` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WIDGET_NEEDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WIDGET_HANDLER_URL` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WIDGET_LIST` text COLLATE utf8_unicode_ci,
  `APPLICATION_TOKEN` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APPLICATION_NEEDED` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APPLICATION_ONLY_API` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BOT_ID` int(11) DEFAULT NULL,
  `BOT_HANDLER_URL` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_log
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_log`;
CREATE TABLE `b_rest_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `CLIENT_ID` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PASSWORD_ID` int(11) DEFAULT NULL,
  `SCOPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `METHOD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_METHOD` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_URI` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REQUEST_AUTH` text COLLATE utf8_unicode_ci,
  `REQUEST_DATA` text COLLATE utf8_unicode_ci,
  `RESPONSE_STATUS` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RESPONSE_DATA` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_owner_entity
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_owner_entity`;
CREATE TABLE `b_rest_owner_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OWNER_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER` int(11) NOT NULL,
  `ENTITY_TYPE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_rest_owner_entity` (`ENTITY_TYPE`,`ENTITY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_placement
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_placement`;
CREATE TABLE `b_rest_placement` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `APP_ID` int(11) DEFAULT NULL,
  `PLACEMENT` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PLACEMENT_HANDLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ICON_ID` int(11) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `GROUP_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `COMMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `DATE_CREATE` datetime DEFAULT NULL,
  `ADDITIONAL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `OPTIONS` varchar(2048) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_ID` int(18) DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_placement1` (`APP_ID`,`PLACEMENT`(100),`PLACEMENT_HANDLER`(200)),
  KEY `ix_b_rest_placement3` (`PLACEMENT`(100),`ADDITIONAL`(100)),
  KEY `ix_b_rest_placement4` (`PLACEMENT`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_placement_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_placement_lang`;
CREATE TABLE `b_rest_placement_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PLACEMENT_ID` int(11) NOT NULL,
  `LANGUAGE_ID` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GROUP_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `b_rest_placement_lang_unique` (`PLACEMENT_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_stat
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_stat`;
CREATE TABLE `b_rest_stat` (
  `STAT_DATE` date NOT NULL,
  `APP_ID` int(11) NOT NULL,
  `METHOD_ID` int(11) NOT NULL,
  `HOUR_0` int(11) NOT NULL DEFAULT '0',
  `HOUR_1` int(11) NOT NULL DEFAULT '0',
  `HOUR_2` int(11) NOT NULL DEFAULT '0',
  `HOUR_3` int(11) NOT NULL DEFAULT '0',
  `HOUR_4` int(11) NOT NULL DEFAULT '0',
  `HOUR_5` int(11) NOT NULL DEFAULT '0',
  `HOUR_6` int(11) NOT NULL DEFAULT '0',
  `HOUR_7` int(11) NOT NULL DEFAULT '0',
  `HOUR_8` int(11) NOT NULL DEFAULT '0',
  `HOUR_9` int(11) NOT NULL DEFAULT '0',
  `HOUR_10` int(11) NOT NULL DEFAULT '0',
  `HOUR_11` int(11) NOT NULL DEFAULT '0',
  `HOUR_12` int(11) NOT NULL DEFAULT '0',
  `HOUR_13` int(11) NOT NULL DEFAULT '0',
  `HOUR_14` int(11) NOT NULL DEFAULT '0',
  `HOUR_15` int(11) NOT NULL DEFAULT '0',
  `HOUR_16` int(11) NOT NULL DEFAULT '0',
  `HOUR_17` int(11) NOT NULL DEFAULT '0',
  `HOUR_18` int(11) NOT NULL DEFAULT '0',
  `HOUR_19` int(11) NOT NULL DEFAULT '0',
  `HOUR_20` int(11) NOT NULL DEFAULT '0',
  `HOUR_21` int(11) NOT NULL DEFAULT '0',
  `HOUR_22` int(11) NOT NULL DEFAULT '0',
  `HOUR_23` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`APP_ID`,`STAT_DATE`,`METHOD_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_stat_app
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_stat_app`;
CREATE TABLE `b_rest_stat_app` (
  `APP_ID` int(11) NOT NULL,
  `APP_CODE` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`APP_ID`),
  KEY `ix_b_rest_stat_app_code` (`APP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_stat_method
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_stat_method`;
CREATE TABLE `b_rest_stat_method` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `METHOD_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'M',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_b_rest_stat_method` (`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_usage_entity
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_usage_entity`;
CREATE TABLE `b_rest_usage_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_ID` int(11) NOT NULL,
  `ENTITY_CODE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUB_ENTITY_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SUB_ENTITY_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_b_rest_usage_entity` (`ENTITY_TYPE`,`ENTITY_ID`,`SUB_ENTITY_TYPE`,`SUB_ENTITY_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_rest_usage_stat
-- -----------------------------------
DROP TABLE IF EXISTS `b_rest_usage_stat`;
CREATE TABLE `b_rest_usage_stat` (
  `STAT_DATE` date NOT NULL,
  `ENTITY_ID` int(11) NOT NULL DEFAULT '0',
  `IS_SENT` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `HOUR_0` int(11) NOT NULL DEFAULT '0',
  `HOUR_1` int(11) NOT NULL DEFAULT '0',
  `HOUR_2` int(11) NOT NULL DEFAULT '0',
  `HOUR_3` int(11) NOT NULL DEFAULT '0',
  `HOUR_4` int(11) NOT NULL DEFAULT '0',
  `HOUR_5` int(11) NOT NULL DEFAULT '0',
  `HOUR_6` int(11) NOT NULL DEFAULT '0',
  `HOUR_7` int(11) NOT NULL DEFAULT '0',
  `HOUR_8` int(11) NOT NULL DEFAULT '0',
  `HOUR_9` int(11) NOT NULL DEFAULT '0',
  `HOUR_10` int(11) NOT NULL DEFAULT '0',
  `HOUR_11` int(11) NOT NULL DEFAULT '0',
  `HOUR_12` int(11) NOT NULL DEFAULT '0',
  `HOUR_13` int(11) NOT NULL DEFAULT '0',
  `HOUR_14` int(11) NOT NULL DEFAULT '0',
  `HOUR_15` int(11) NOT NULL DEFAULT '0',
  `HOUR_16` int(11) NOT NULL DEFAULT '0',
  `HOUR_17` int(11) NOT NULL DEFAULT '0',
  `HOUR_18` int(11) NOT NULL DEFAULT '0',
  `HOUR_19` int(11) NOT NULL DEFAULT '0',
  `HOUR_20` int(11) NOT NULL DEFAULT '0',
  `HOUR_21` int(11) NOT NULL DEFAULT '0',
  `HOUR_22` int(11) NOT NULL DEFAULT '0',
  `HOUR_23` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`STAT_DATE`,`ENTITY_ID`),
  KEY `ix_b_rest_usage` (`ENTITY_ID`,`STAT_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_short_uri
-- -----------------------------------
DROP TABLE IF EXISTS `b_short_uri`;
CREATE TABLE `b_short_uri` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URI` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `URI_CRC` int(11) NOT NULL,
  `SHORT_URI` varbinary(250) NOT NULL,
  `SHORT_URI_CRC` int(11) NOT NULL,
  `STATUS` int(11) NOT NULL DEFAULT '301',
  `MODIFIED` datetime NOT NULL,
  `LAST_USED` datetime DEFAULT NULL,
  `NUMBER_USED` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ux_b_short_uri_1` (`SHORT_URI_CRC`),
  KEY `ux_b_short_uri_2` (`URI_CRC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_site_template
-- -----------------------------------
DROP TABLE IF EXISTS `b_site_template`;
CREATE TABLE `b_site_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `CONDITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '500',
  `TEMPLATE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_site_template_site` (`SITE_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_site_template` VALUES
(10, 's1', '', 1, 'main');
-- -----------------------------------
-- Dumping table b_sm_version_history
-- -----------------------------------
DROP TABLE IF EXISTS `b_sm_version_history`;
CREATE TABLE `b_sm_version_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DATE_INSERT` datetime DEFAULT NULL,
  `VERSIONS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_smile
-- -----------------------------------
DROP TABLE IF EXISTS `b_smile`;
CREATE TABLE `b_smile` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SET_ID` int(11) NOT NULL DEFAULT '0',
  `SORT` int(11) NOT NULL DEFAULT '150',
  `TYPING` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CLICKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `HIDDEN` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IMAGE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `IMAGE_DEFINITION` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'SD',
  `IMAGE_WIDTH` int(11) NOT NULL DEFAULT '0',
  `IMAGE_HEIGHT` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_smile` VALUES
(1, 'S', 2, 100, ':) :-)', 'Y', 'N', 'bx_smile_smile.png', 'UHD', 20, 20),
(2, 'S', 2, 105, ';) ;-)', 'Y', 'N', 'bx_smile_wink.png', 'UHD', 20, 20),
(3, 'S', 2, 110, ':D :-D', 'Y', 'N', 'bx_smile_biggrin.png', 'UHD', 20, 20),
(4, 'S', 2, 115, '8-)', 'Y', 'N', 'bx_smile_cool.png', 'UHD', 20, 20),
(5, 'S', 2, 120, ':facepalm:', 'Y', 'N', 'bx_smile_facepalm.png', 'UHD', 20, 20),
(6, 'S', 2, 125, ':{} :-{}', 'Y', 'N', 'bx_smile_kiss.png', 'UHD', 20, 20),
(7, 'S', 2, 130, ':( :-(', 'Y', 'N', 'bx_smile_sad.png', 'UHD', 20, 20),
(8, 'S', 2, 135, ':| :-|', 'Y', 'N', 'bx_smile_neutral.png', 'UHD', 20, 20),
(9, 'S', 2, 140, ':oops:', 'Y', 'N', 'bx_smile_redface.png', 'UHD', 20, 20),
(10, 'S', 2, 145, ':cry: :~(', 'Y', 'N', 'bx_smile_cry.png', 'UHD', 20, 20),
(11, 'S', 2, 150, ':evil: >:-<', 'Y', 'N', 'bx_smile_evil.png', 'UHD', 20, 20),
(12, 'S', 2, 155, ':o :-o :shock:', 'Y', 'N', 'bx_smile_eek.png', 'UHD', 20, 20),
(13, 'S', 2, 160, ':/ :-/', 'Y', 'N', 'bx_smile_confuse.png', 'UHD', 20, 20),
(14, 'S', 2, 165, ':idea:', 'Y', 'N', 'bx_smile_idea.png', 'UHD', 20, 20),
(15, 'S', 2, 170, ':?:', 'Y', 'N', 'bx_smile_question.png', 'UHD', 20, 20),
(16, 'S', 2, 175, ':!:', 'Y', 'N', 'bx_smile_exclaim.png', 'UHD', 20, 20),
(17, 'S', 2, 180, ':like:', 'Y', 'N', 'bx_smile_like.png', 'UHD', 20, 20),
(18, 'I', 2, 175, 'ICON_NOTE', 'Y', 'N', 'bx_icon_1.gif', 'SD', 15, 15),
(19, 'I', 2, 180, 'ICON_DIRRECTION', 'Y', 'N', 'bx_icon_2.gif', 'SD', 15, 15),
(20, 'I', 2, 185, 'ICON_IDEA', 'Y', 'N', 'bx_icon_3.gif', 'SD', 15, 15),
(21, 'I', 2, 190, 'ICON_ATTANSION', 'Y', 'N', 'bx_icon_4.gif', 'SD', 15, 15),
(22, 'I', 2, 195, 'ICON_QUESTION', 'Y', 'N', 'bx_icon_5.gif', 'SD', 15, 15),
(23, 'I', 2, 200, 'ICON_BAD', 'Y', 'N', 'bx_icon_6.gif', 'SD', 15, 15),
(24, 'I', 2, 205, 'ICON_GOOD', 'Y', 'N', 'bx_icon_7.gif', 'SD', 15, 15);
-- -----------------------------------
-- Dumping table b_smile_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_smile_lang`;
CREATE TABLE `b_smile_lang` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `SID` int(11) NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_SMILE_SL` (`TYPE`,`SID`,`LID`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_smile_lang` VALUES
(1, 'P', 1, 'ru', 'Стандартная галерея'),
(2, 'P', 1, 'en', 'Standard gallery'),
(3, 'G', 2, 'ru', 'Основной набор'),
(4, 'G', 2, 'en', 'Default pack'),
(5, 'S', 1, 'ru', 'С улыбкой'),
(6, 'S', 1, 'en', 'Smile'),
(7, 'S', 2, 'ru', 'Шутливо'),
(8, 'S', 2, 'en', 'Wink'),
(9, 'S', 3, 'ru', 'Широкая улыбка'),
(10, 'S', 3, 'en', 'Big grin'),
(11, 'S', 4, 'ru', 'Здорово'),
(12, 'S', 4, 'en', 'Cool'),
(13, 'S', 5, 'ru', 'Разочарование'),
(14, 'S', 5, 'en', 'Facepalm'),
(15, 'S', 6, 'ru', 'Поцелуй'),
(16, 'S', 6, 'en', 'Kiss'),
(17, 'S', 7, 'ru', 'Печально'),
(18, 'S', 7, 'en', 'Sad'),
(19, 'S', 8, 'ru', 'Скептически'),
(20, 'S', 8, 'en', 'Skeptic'),
(21, 'S', 9, 'ru', 'Смущенный'),
(22, 'S', 9, 'en', 'Embarrassed'),
(23, 'S', 10, 'ru', 'Очень грустно'),
(24, 'S', 10, 'en', 'Crying'),
(25, 'S', 11, 'ru', 'Со злостью'),
(26, 'S', 11, 'en', 'Angry'),
(27, 'S', 12, 'ru', 'Удивленно'),
(28, 'S', 12, 'en', 'Surprised'),
(29, 'S', 13, 'ru', 'Смущенно'),
(30, 'S', 13, 'en', 'Confused'),
(31, 'S', 14, 'ru', 'Идея'),
(32, 'S', 14, 'en', 'Idea'),
(33, 'S', 15, 'ru', 'Вопрос'),
(34, 'S', 15, 'en', 'Question'),
(35, 'S', 16, 'ru', 'Восклицание'),
(36, 'S', 16, 'en', 'Exclamation'),
(37, 'S', 17, 'ru', 'Нравится'),
(38, 'S', 17, 'en', 'Like');
-- -----------------------------------
-- Dumping table b_smile_set
-- -----------------------------------
DROP TABLE IF EXISTS `b_smile_set`;
CREATE TABLE `b_smile_set` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'G',
  `PARENT_ID` int(11) NOT NULL DEFAULT '0',
  `STRING_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '150',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_smile_set` VALUES
(1, 'P', 0, 'bitrix', 150),
(2, 'G', 1, 'bitrix_main', 150);
-- -----------------------------------
-- Dumping table b_sms_template
-- -----------------------------------
DROP TABLE IF EXISTS `b_sms_template`;
CREATE TABLE `b_sms_template` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EVENT_NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `SENDER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RECEIVER` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MESSAGE` text COLLATE utf8_unicode_ci,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_sms_message_name` (`EVENT_NAME`(50))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_sms_template` VALUES
(1, 'SMS_USER_CONFIRM_NUMBER', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Код подтверждения #CODE#', NULL),
(2, 'SMS_USER_RESTORE_PASSWORD', 'Y', '#DEFAULT_SENDER#', '#USER_PHONE#', 'Код для восстановления пароля #CODE#', NULL),
(3, 'SMS_EVENT_LOG_NOTIFICATION', 'Y', '#DEFAULT_SENDER#', '#PHONE_NUMBER#', '#NAME#: #ADDITIONAL_TEXT# (событий: #EVENT_COUNT#)', NULL);
-- -----------------------------------
-- Dumping table b_sms_template_site
-- -----------------------------------
DROP TABLE IF EXISTS `b_sms_template_site`;
CREATE TABLE `b_sms_template_site` (
  `TEMPLATE_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`TEMPLATE_ID`,`SITE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_sms_template_site` VALUES
(1, 's1'),
(2, 's1'),
(3, 's1');
-- -----------------------------------
-- Dumping table b_socialservices_contact
-- -----------------------------------
DROP TABLE IF EXISTS `b_socialservices_contact`;
CREATE TABLE `b_socialservices_contact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `USER_ID` int(11) NOT NULL,
  `CONTACT_USER_ID` int(11) DEFAULT NULL,
  `CONTACT_XML_ID` int(11) DEFAULT NULL,
  `CONTACT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_LAST_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTACT_PHOTO` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  `NOTIFY` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact1` (`USER_ID`),
  KEY `ix_b_socialservices_contact2` (`CONTACT_USER_ID`),
  KEY `ix_b_socialservices_contact3` (`TIMESTAMP_X`),
  KEY `ix_b_socialservices_contact4` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_socialservices_contact_connect
-- -----------------------------------
DROP TABLE IF EXISTS `b_socialservices_contact_connect`;
CREATE TABLE `b_socialservices_contact_connect` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `CONTACT_ID` int(11) DEFAULT NULL,
  `LINK_ID` int(11) DEFAULT NULL,
  `CONTACT_PROFILE_ID` int(11) NOT NULL,
  `CONTACT_PORTAL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONNECT_TYPE` char(1) COLLATE utf8_unicode_ci DEFAULT 'P',
  `LAST_AUTHORIZE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_b_socialservices_contact_connect1` (`CONTACT_ID`),
  KEY `ix_b_socialservices_contact_connect2` (`LINK_ID`),
  KEY `ix_b_socialservices_contact_connect3` (`LAST_AUTHORIZE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_socialservices_zoom_meeting_recording
-- -----------------------------------
DROP TABLE IF EXISTS `b_socialservices_zoom_meeting_recording`;
CREATE TABLE `b_socialservices_zoom_meeting_recording` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EXTERNAL_ID` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `MEETING_ID` int(11) NOT NULL,
  `START_DATE` datetime NOT NULL,
  `END_DATE` datetime NOT NULL,
  `FILE_TYPE` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_SIZE` int(11) NOT NULL,
  `PLAY_URL` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DOWNLOAD_URL` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `RECORDING_TYPE` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `DOWNLOAD_TOKEN` text COLLATE utf8_unicode_ci,
  `PASSWORD` text COLLATE utf8_unicode_ci,
  `FILE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_B_SOCIALSERVICES_ZOOM_MEETING_RECORDING_1` (`MEETING_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sticker
-- -----------------------------------
DROP TABLE IF EXISTS `b_sticker`;
CREATE TABLE `b_sticker` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PAGE_URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `PAGE_TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CREATE` datetime NOT NULL,
  `DATE_UPDATE` datetime NOT NULL,
  `MODIFIED_BY` int(18) NOT NULL,
  `CREATED_BY` int(18) NOT NULL,
  `PERSONAL` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CONTENT` text COLLATE utf8_unicode_ci,
  `POS_TOP` int(11) DEFAULT NULL,
  `POS_LEFT` int(11) DEFAULT NULL,
  `WIDTH` int(11) DEFAULT NULL,
  `HEIGHT` int(11) DEFAULT NULL,
  `COLOR` int(11) DEFAULT NULL,
  `COLLAPSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `COMPLETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `CLOSED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `DELETED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MARKER_TOP` int(11) DEFAULT NULL,
  `MARKER_LEFT` int(11) DEFAULT NULL,
  `MARKER_WIDTH` int(11) DEFAULT NULL,
  `MARKER_HEIGHT` int(11) DEFAULT NULL,
  `MARKER_ADJUST` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_sticker_group_task
-- -----------------------------------
DROP TABLE IF EXISTS `b_sticker_group_task`;
CREATE TABLE `b_sticker_group_task` (
  `GROUP_ID` int(11) NOT NULL,
  `TASK_ID` int(11) NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`TASK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_task
-- -----------------------------------
DROP TABLE IF EXISTS `b_task`;
CREATE TABLE `b_task` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `LETTER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `SYS` char(1) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BINDING` varchar(50) COLLATE utf8_unicode_ci DEFAULT 'module',
  PRIMARY KEY (`ID`),
  KEY `ix_task` (`MODULE_ID`,`BINDING`,`LETTER`,`SYS`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_task` VALUES
(1, 'main_denied', 'D', 'main', 'Y', NULL, 'module'),
(2, 'main_change_profile', 'P', 'main', 'Y', NULL, 'module'),
(3, 'main_view_all_settings', 'R', 'main', 'Y', NULL, 'module'),
(4, 'main_view_all_settings_change_profile', 'T', 'main', 'Y', NULL, 'module'),
(5, 'main_edit_subordinate_users', 'V', 'main', 'Y', NULL, 'module'),
(6, 'main_full_access', 'W', 'main', 'Y', NULL, 'module'),
(7, 'fm_folder_access_denied', 'D', 'main', 'Y', NULL, 'file'),
(8, 'fm_folder_access_read', 'R', 'main', 'Y', NULL, 'file'),
(9, 'fm_folder_access_write', 'W', 'main', 'Y', NULL, 'file'),
(10, 'fm_folder_access_full', 'X', 'main', 'Y', NULL, 'file'),
(11, 'fm_folder_access_workflow', 'U', 'main', 'Y', NULL, 'file'),
(12, 'bitrixcloud_deny', 'D', 'bitrixcloud', 'Y', NULL, 'module'),
(13, 'bitrixcloud_control', 'W', 'bitrixcloud', 'Y', NULL, 'module'),
(18, 'fileman_denied', 'D', 'fileman', 'Y', '', 'module'),
(19, 'fileman_allowed_folders', 'F', 'fileman', 'Y', '', 'module'),
(20, 'fileman_full_access', 'W', 'fileman', 'Y', '', 'module'),
(21, 'medialib_denied', 'D', 'fileman', 'Y', '', 'medialib'),
(22, 'medialib_view', 'F', 'fileman', 'Y', '', 'medialib'),
(23, 'medialib_only_new', 'R', 'fileman', 'Y', '', 'medialib'),
(24, 'medialib_edit_items', 'V', 'fileman', 'Y', '', 'medialib'),
(25, 'medialib_editor', 'W', 'fileman', 'Y', '', 'medialib'),
(26, 'medialib_full', 'X', 'fileman', 'Y', '', 'medialib'),
(27, 'stickers_denied', 'D', 'fileman', 'Y', '', 'stickers'),
(28, 'stickers_read', 'R', 'fileman', 'Y', '', 'stickers'),
(29, 'stickers_edit', 'W', 'fileman', 'Y', '', 'stickers'),
(30, 'hblock_denied', 'D', 'highloadblock', 'Y', NULL, 'module'),
(31, 'hblock_read', 'R', 'highloadblock', 'Y', NULL, 'module'),
(32, 'hblock_write', 'W', 'highloadblock', 'Y', NULL, 'module'),
(33, 'iblock_deny', 'D', 'iblock', 'Y', NULL, 'iblock'),
(34, 'iblock_read', 'R', 'iblock', 'Y', NULL, 'iblock'),
(35, 'iblock_element_add', 'E', 'iblock', 'Y', NULL, 'iblock'),
(36, 'iblock_admin_read', 'S', 'iblock', 'Y', NULL, 'iblock'),
(37, 'iblock_admin_add', 'T', 'iblock', 'Y', NULL, 'iblock'),
(38, 'iblock_limited_edit', 'U', 'iblock', 'Y', NULL, 'iblock'),
(39, 'iblock_full_edit', 'W', 'iblock', 'Y', NULL, 'iblock'),
(40, 'iblock_full', 'X', 'iblock', 'Y', NULL, 'iblock'),
(41, 'landing_right_denied', 'D', 'landing', 'Y', NULL, 'module'),
(42, 'landing_right_read', 'R', 'landing', 'Y', NULL, 'module'),
(43, 'landing_right_edit', 'U', 'landing', 'Y', NULL, 'module'),
(44, 'landing_right_sett', 'V', 'landing', 'Y', NULL, 'module'),
(45, 'landing_right_public', 'W', 'landing', 'Y', NULL, 'module'),
(46, 'landing_right_delete', 'X', 'landing', 'Y', NULL, 'module');
-- -----------------------------------
-- Dumping table b_task_operation
-- -----------------------------------
DROP TABLE IF EXISTS `b_task_operation`;
CREATE TABLE `b_task_operation` (
  `TASK_ID` int(11) NOT NULL,
  `OPERATION_ID` int(11) NOT NULL,
  PRIMARY KEY (`TASK_ID`,`OPERATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_task_operation` VALUES
(2, 2),
(2, 3),
(3, 2),
(3, 4),
(3, 5),
(3, 6),
(3, 7),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(5, 2),
(5, 3),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(5, 9),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 10),
(6, 11),
(6, 12),
(6, 13),
(6, 14),
(6, 15),
(6, 16),
(6, 17),
(6, 18),
(8, 19),
(8, 20),
(8, 21),
(9, 19),
(9, 20),
(9, 21),
(9, 22),
(9, 23),
(9, 24),
(9, 25),
(9, 26),
(9, 27),
(9, 28),
(9, 29),
(9, 30),
(9, 31),
(9, 32),
(9, 33),
(9, 34),
(10, 19),
(10, 20),
(10, 21),
(10, 22),
(10, 23),
(10, 24),
(10, 25),
(10, 26),
(10, 27),
(10, 28),
(10, 29),
(10, 30),
(10, 31),
(10, 32),
(10, 33),
(10, 34),
(10, 35),
(11, 19),
(11, 20),
(11, 21),
(11, 24),
(11, 28),
(13, 36),
(13, 37),
(19, 44),
(19, 45),
(19, 46),
(19, 47),
(19, 48),
(19, 49),
(19, 50),
(19, 52),
(19, 53),
(20, 42),
(20, 43),
(20, 44),
(20, 45),
(20, 46),
(20, 47),
(20, 48),
(20, 49),
(20, 50),
(20, 51),
(20, 52),
(20, 53),
(20, 54),
(22, 55),
(23, 55),
(23, 56),
(23, 60),
(24, 55),
(24, 60),
(24, 61),
(24, 62),
(25, 55),
(25, 56),
(25, 57),
(25, 58),
(25, 60),
(25, 61),
(25, 62),
(26, 55),
(26, 56),
(26, 57),
(26, 58),
(26, 59),
(26, 60),
(26, 61),
(26, 62),
(28, 63),
(29, 63),
(29, 64),
(29, 65),
(29, 66),
(31, 67),
(32, 68),
(32, 69),
(34, 70),
(34, 71),
(35, 72),
(36, 70),
(36, 71),
(36, 73),
(37, 70),
(37, 71),
(37, 72),
(37, 73),
(38, 70),
(38, 71),
(38, 72),
(38, 73),
(38, 74),
(38, 75),
(38, 76),
(38, 77),
(39, 70),
(39, 71),
(39, 72),
(39, 73),
(39, 74),
(39, 75),
(39, 76),
(39, 77),
(39, 78),
(39, 79),
(39, 80),
(39, 81),
(40, 70),
(40, 71),
(40, 72),
(40, 73),
(40, 74),
(40, 75),
(40, 76),
(40, 77),
(40, 78),
(40, 79),
(40, 80),
(40, 81),
(40, 82),
(40, 83),
(40, 84),
(40, 85),
(40, 86),
(40, 87),
(42, 88),
(43, 89),
(44, 90),
(45, 91),
(46, 92);
-- -----------------------------------
-- Dumping table b_ui_avatar_mask_access
-- -----------------------------------
DROP TABLE IF EXISTS `b_ui_avatar_mask_access`;
CREATE TABLE `b_ui_avatar_mask_access` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ITEM_ID` int(11) NOT NULL,
  `ACCESS_CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `B_UI_AVATAR_MASK_RIGHT_3` (`ITEM_ID`,`ACCESS_CODE`),
  KEY `B_UI_AVATAR_MASK_RIGHT_1` (`ITEM_ID`),
  KEY `B_UI_AVATAR_MASK_RIGHT_2` (`ACCESS_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_ui_avatar_mask_file_deleted
-- -----------------------------------
DROP TABLE IF EXISTS `b_ui_avatar_mask_file_deleted`;
CREATE TABLE `b_ui_avatar_mask_file_deleted` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ENTITY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `ORIGINAL_FILE_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `B_UI_AVATAR_MASK_FILE_DELETED_1` (`ENTITY`),
  KEY `B_UI_AVATAR_MASK_FILE_DELETED_2` (`ITEM_ID`),
  KEY `B_UI_AVATAR_MASK_FILE_DELETED_3` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_ui_avatar_mask_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_ui_avatar_mask_group`;
CREATE TABLE `b_ui_avatar_mask_group` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OWNER_TYPE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `IX_B_UI_AVATAR_MASK_GROUP_OWNER` (`OWNER_ID`,`OWNER_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_ui_avatar_mask_item
-- -----------------------------------
DROP TABLE IF EXISTS `b_ui_avatar_mask_item`;
CREATE TABLE `b_ui_avatar_mask_item` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OWNER_TYPE` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `OWNER_ID` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  `GROUP_ID` int(10) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) NOT NULL DEFAULT '100',
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `B_UI_AVATAR_MASK_ITEM_OWNER` (`OWNER_TYPE`,`OWNER_ID`),
  KEY `B_UI_AVATAR_MASK_ITEM_FILE_ID` (`FILE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_ui_avatar_mask_item_applied_to
-- -----------------------------------
DROP TABLE IF EXISTS `b_ui_avatar_mask_item_applied_to`;
CREATE TABLE `b_ui_avatar_mask_item_applied_to` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ORIGINAL_FILE_ID` int(11) NOT NULL,
  `FILE_ID` int(11) NOT NULL,
  `ITEM_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `b_ui_avatar_mask_item_applied1` (`FILE_ID`,`ITEM_ID`),
  KEY `b_ui_avatar_mask_item_applied2` (`ITEM_ID`),
  KEY `b_ui_avatar_mask_item_applied3` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_ui_avatar_mask_recently_used
-- -----------------------------------
DROP TABLE IF EXISTS `b_ui_avatar_mask_recently_used`;
CREATE TABLE `b_ui_avatar_mask_recently_used` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `ITEM_ID` int(11) NOT NULL,
  `USER_ID` int(11) NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `B_UI_AVATAR_MASK_ITEM_R_OWNER` (`ITEM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_ui_entity_editor_config
-- -----------------------------------
DROP TABLE IF EXISTS `b_ui_entity_editor_config`;
CREATE TABLE `b_ui_entity_editor_config` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CATEGORY` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `ENTITY_TYPE_ID` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG` text COLLATE utf8_unicode_ci NOT NULL,
  `COMMON` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ENTITY_TYPE_ID` (`ENTITY_TYPE_ID`),
  KEY `CATEGORY` (`CATEGORY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_ui_entity_editor_config_ac
-- -----------------------------------
DROP TABLE IF EXISTS `b_ui_entity_editor_config_ac`;
CREATE TABLE `b_ui_entity_editor_config_ac` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ACCESS_CODE` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIG_ID` int(10) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ACCESS_CODE` (`ACCESS_CODE`),
  KEY `CONFIG_ID` (`CONFIG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_ui_file_uploader_temp_file
-- -----------------------------------
DROP TABLE IF EXISTS `b_ui_file_uploader_temp_file`;
CREATE TABLE `b_ui_file_uploader_temp_file` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GUID` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `FILE_ID` int(11) DEFAULT NULL,
  `FILENAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SIZE` bigint(20) NOT NULL,
  `PATH` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MIMETYPE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `RECEIVED_SIZE` bigint(20) NOT NULL DEFAULT '0',
  `WIDTH` int(11) NOT NULL DEFAULT '0',
  `HEIGHT` int(11) NOT NULL DEFAULT '0',
  `BUCKET_ID` int(11) DEFAULT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CONTROLLER` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CLOUD` tinyint(1) NOT NULL DEFAULT '0',
  `UPLOADED` tinyint(1) NOT NULL DEFAULT '0',
  `DELETED` tinyint(1) NOT NULL DEFAULT '0',
  `CREATED_BY` int(11) NOT NULL DEFAULT '0',
  `CREATED_AT` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `IX_B_UI_UPLOADER_GUID` (`GUID`),
  KEY `IX_B_UI_UPLOADER_FILE_ID` (`FILE_ID`),
  KEY `IX_B_UI_UPLOADER_CREATED_AT` (`CREATED_AT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_undo
-- -----------------------------------
DROP TABLE IF EXISTS `b_undo`;
CREATE TABLE `b_undo` (
  `ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_TYPE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UNDO_HANDLER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONTENT` mediumtext COLLATE utf8_unicode_ci,
  `USER_ID` int(11) DEFAULT NULL,
  `TIMESTAMP_X` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_undo` VALUES
('100186d1d03e113ff1f5bda358cfd3ce4', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:904:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/header.php\');\n/** @global $APPLICATION */\n?>\n<?php $res = $APPLICATION->IncludeComponent(\n	\"project:blog.element.list\", \n	\"mainpage\", \n	array(\n		\"CACHE_TIME\" => \"3600\",\n		\"CACHE_TYPE\" => \"A\",\n		\"COMPONENT_TEMPLATE\" => \"mainpage\",\n		\"COUNT\" => \"2\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"SECTION_CODE\" => \"lifestyle\",\n		\"SHOW_NAV\" => \"Y\",\n		\"SORT_DIRECTION1\" => \"ASC\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"PAGER_TEMPLATE\" => \"project.main\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"N\",\n		\"PAGER_TITLE\" => \"Навигация\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\"\n	),\n	false\n); ?>\n<?php\n$APPLICATION->SetTitle($res[\'TITLE\']);\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/footer.php\');\n?>\";}', 1, 1680719169),
('1027ad22747bd2cf588d4f3aaa14c32c6', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:58:\"/var/www/html/minimal-blog/local/templates/main/footer.php\";s:7:\"content\";s:5250:\"<?php\n/**\n * @global $APPLICATION;\n */\nif (!defined(\'B_PROLOG_INCLUDED\') || B_PROLOG_INCLUDED !== true) {\n    die();\n}\n?>\n<div class=\"col-md-12 col-lg-4 sidebar\">\n    <div class=\"sidebar-box search-form-wrap\">\n        <form action=\"#\" class=\"search-form\">\n            <div class=\"form-group\">\n                <span class=\"icon fa fa-search\"></span>\n                <input type=\"text\" class=\"form-control\" id=\"s\" placeholder=\"Type a keyword and hit enter\">\n            </div>\n        </form>\n    </div>\n    <!-- END sidebar-box -->\n    <div class=\"sidebar-box\">\n        <div class=\"bio text-center\">\n            <img src=\"<?=MARKUP_PATH?>images/person_1.jpg\" alt=\"Image Placeholder\" class=\"img-fluid\">\n            <div class=\"bio-body\">\n                <h2>Meagan Smith</h2>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem facilis sunt\n                    repellendus\n                    excepturi beatae porro debitis voluptate nulla quo veniam fuga sit molestias minus.</p>\n                <p><a href=\"/about\" class=\"btn btn-primary btn-sm\">Read my bio</a></p>\n                <?php $APPLICATION->IncludeComponent(\n                    \"project:social\",\n                    \"personal.card\",\n                    [\n                        \"CACHE_TIME\" => \"3600\",\n                        \"CACHE_TYPE\" => \"A\",\n                    ]\n                ); ?>\n            </div>\n        </div>\n    </div>\n    <!-- END sidebar-box -->\n    <div class=\"sidebar-box\">\n        <h3 class=\"heading\">Popular Posts</h3>\n        <div class=\"post-entry-sidebar\">\n            <ul>\n                <li>\n                    <a href=\"\">\n                        <img src=\"images/img_2.jpg\" alt=\"Image placeholder\" class=\"mr-4\">\n                        <div class=\"text\">\n                            <h4>There’s a Cool New Way for Men to Wear Socks and Sandals</h4>\n                            <div class=\"post-meta\">\n                                <span class=\"mr-2\">March 15, 2018 </span> •\n                                <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                            </div>\n                        </div>\n                    </a>\n                </li>\n                <li>\n                    <a href=\"\">\n                        <img src=\"images/img_4.jpg\" alt=\"Image placeholder\" class=\"mr-4\">\n                        <div class=\"text\">\n                            <h4>There’s a Cool New Way for Men to Wear Socks and Sandals</h4>\n                            <div class=\"post-meta\">\n                                <span class=\"mr-2\">March 15, 2018 </span> •\n                                <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                            </div>\n                        </div>\n                    </a>\n                </li>\n                <li>\n                    <a href=\"\">\n                        <img src=\"images/img_12.jpg\" alt=\"Image placeholder\" class=\"mr-4\">\n                        <div class=\"text\">\n                            <h4>There’s a Cool New Way for Men to Wear Socks and Sandals</h4>\n                            <div class=\"post-meta\">\n                                <span class=\"mr-2\">March 15, 2018 </span> •\n                                <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                            </div>\n                        </div>\n                    </a>\n                </li>\n            </ul>\n        </div>\n    </div>\n    <?php\n    $APPLICATION->IncludeComponent(\n        \"project:blog.section.list\",\n        \"sidebar.list\",\n        [\n            \"COMPONENT_TEMPLATE\" => \"sidebar.list\",\n        ],\n        false\n    ); ?>\n    <!-- END sidebar-box -->\n    <div class=\"sidebar-box\">\n        <h3 class=\"heading\">Categories</h3>\n        <ul class=\"categories\">\n            <li><a href=\"#\">Courses <span>(12)</span></a></li>\n            <li><a href=\"#\">News <span>(22)</span></a></li>\n            <li><a href=\"#\">Design <span>(37)</span></a></li>\n            <li><a href=\"#\">HTML <span>(42)</span></a></li>\n            <li><a href=\"#\">Web Development <span>(14)</span></a></li>\n        </ul>\n    </div>\n    <!-- END sidebar-box -->\n\n</div>\n</div>\n</section>\n<footer class=\"site-footer\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-12\">\n                <!-- Link back to Colorlib can\'t be removed. Template is licensed under CC BY 3.0. -->\n                Copyright &copy;<?= date(\'Y\') ?>\n                All rights reserved | This template is made with <i class=\"fa fa-heart-o\" aria-hidden=\"true\"></i> by <a\n                        href=\"https://colorlib.com\" target=\"_blank\">Colorlib</a>\n                <!-- Link back to Colorlib can\'t be removed. Template is licensed under CC BY 3.0. -->\n            </div>\n        </div>\n    </div>\n</footer>\n<div id=\"loader\" class=\"show fullscreen\">\n    <svg class=\"circular\" width=\"48px\" height=\"48px\">\n        <circle class=\"path-bg\" cx=\"24\" cy=\"24\" r=\"22\" fill=\"none\" stroke-width=\"4\" stroke=\"#eeeeee\"/>\n        <circle class=\"path\" cx=\"24\" cy=\"24\" r=\"22\" fill=\"none\" stroke-width=\"4\" stroke-miterlimit=\"10\"\n                stroke=\"#f4b214\"/>\n    </svg>\n</div>\n</body>\n</html>\";}', 1, 1680551140),
('102d5c339b2de3262bdc69befc9ddcbf1', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:44:\"/var/www/html/minimal-blog/contact/index.php\";s:7:\"content\";s:561:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"contact\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\", \n	\".default\", \n	array(\n		\"USE_CAPTCHA\" => \"Y\",\n		\"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n		\"EMAIL_TO\" => \"my@email.com\",\n		\"REQUIRED_FIELDS\" => array(\n			0 => \"NAME\",\n			1 => \"EMAIL\",\n			2 => \"MESSAGE\",\n		),\n		\"EVENT_MESSAGE_ID\" => array(\n			0 => \"7\",\n		),\n		\"COMPONENT_TEMPLATE\" => \".default\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680752007),
('1054655ee264eb5efa984c35a1d174afa', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:7539:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/header.php\');\n/** @global $APPLICATION */\n$APPLICATION->SetTitle(\'Главная\');\n//use Carbon\\Carbon;\n//$s = Carbon::now()->locale(Carbon::getLocale());\n////$s->format(\'m\');\n//var_dump($s->format(\'F j, Y\'));\n//blog.element.list\n?>\n<?php\n$APPLICATION->IncludeComponent(\n	\"project:blog.element.list\", \n	\"mainpage\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"mainpage\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"SECTION_CODE\" => \"food\",\n		\"SHOW_NAV\" => \"Y\",\n		\"COUNT\" => \"5\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_DIRECTION1\" => \"ASC\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"3600\"\n	),\n	false\n); ?>\n        <div class=\"row\">\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_5.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Food</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_6.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Travel</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_7.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Travel, Asia</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_8.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Travel</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_9.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Travel</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_10.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Lifestyle</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_11.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Lifestyle</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_12.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Food</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n        </div>\n\n        <div class=\"row\">\n            <div class=\"col-md-12 text-center\">\n                <nav aria-label=\"Page navigation\" class=\"text-center\">\n                    <ul class=\"pagination\">\n                        <li class=\"page-item  active\"><a class=\"page-link\" href=\"#\">Prev</a></li>\n                        <li class=\"page-item\"><a class=\"page-link\" href=\"#\">1</a></li>\n                        <li class=\"page-item\"><a class=\"page-link\" href=\"#\">2</a></li>\n                        <li class=\"page-item\"><a class=\"page-link\" href=\"#\">3</a></li>\n                        <li class=\"page-item\"><a class=\"page-link\" href=\"#\">Next</a></li>\n                    </ul>\n                </nav>\n            </div>\n        </div>\n\n\n    <!-- END main-content -->\n\n<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/footer.php\');\n?>\";}', 1, 1680474140),
('106bf2c5775bdcad98f273a09a552f6bb', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:44:\"/var/www/html/minimal-blog/contact/index.php\";s:7:\"content\";s:488:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"contact\");\n?><?$APPLICATION->IncludeComponent(\"bitrix:main.feedback\",\"\",Array(\n        \"USE_CAPTCHA\" => \"Y\",\n        \"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n        \"EMAIL_TO\" => \"my@email.com\",\n        \"REQUIRED_FIELDS\" => Array(\"NAME\",\"EMAIL\",\"MESSAGE\"),\n        \"EVENT_MESSAGE_ID\" => Array(\"5\")\n    )\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680749656),
('1100ba8ade9c31d1b48c3e138bff35363', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:58:\"/var/www/html/minimal-blog/local/templates/main/header.php\";s:7:\"content\";s:8031:\"<?php\n\nuse Bitrix\\Main\\Page\\Asset;\n\nif (!defined(\"B_PROLOG_INCLUDED\") || B_PROLOG_INCLUDED !== true) {\n    die();\n}\n\n/**\n * @global $APPLICATION\n */\n\n$asset = Asset::getInstance();\n$asset->addString(\"<link href=\'https://fonts.googleapis.com/css?family=Josefin+Sans:300, 400,700\' rel=\'stylesheet\'>\");\n$asset->addCss(MARKUP_PATH . \"css/bootstrap.css\");\n$asset->addCss(MARKUP_PATH . \"css/animate.css\");\n$asset->addCss(MARKUP_PATH . \"css/owl.carousel.min.css\");\n$asset->addCss(MARKUP_PATH . \"fonts/fontawesome/css/font-awesome.min.css\");\n$asset->addCss(MARKUP_PATH . \"fonts/flaticon/font/flaticon.css\");\n$asset->addCss(MARKUP_PATH . \"css/style.css\");\n\n$asset->addJs(MARKUP_PATH . \"js/jquery-3.2.1.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery-migrate-3.0.0.js\");\n$asset->addJs(MARKUP_PATH . \"js/popper.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/bootstrap.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/owl.carousel.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery.waypoints.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery.stellar.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/main.js\");\n?>\n\n<!doctype html>\n<html lang=\"<?= LANGUAGE_ID ?>\">\n<head>\n    <title><?php $APPLICATION->ShowTitle(); ?></title>\n    <meta charset=\"utf-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n    <?php $APPLICATION->ShowHead(); ?>\n</head>\n<body>\n<?php $APPLICATION->ShowPanel(); ?>\n\n<header role=\"banner\">\n    <div class=\"top-bar\">\n        <div class=\"container\">\n            <div class=\"row\">\n                <div class=\"col-9 social\">\n                    <a href=\"#\"><span class=\"fa fa-twitter\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-facebook\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-instagram\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-youtube-play\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-vimeo\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-snapchat\"></span></a>\n                </div>\n                <div class=\"col-3 search-top\">\n                    <!-- <a href=\"#\"><span class=\"fa fa-search\"></span></a> -->\n                    <form action=\"#\" class=\"search-top-form\">\n                        <span class=\"icon fa fa-search\"></span>\n                        <input type=\"text\" id=\"s\" placeholder=\"Type keyword to search...\">\n                    </form>\n                </div>\n            </div>\n        </div>\n    </div>\n\n    <div class=\"container logo-wrap\">\n        <div class=\"row pt-5\">\n            <div class=\"col-12 text-center\">\n                <a class=\"absolute-toggle d-block d-md-none\" data-toggle=\"collapse\" href=\"#navbarMenu\" role=\"button\"\n                   aria-expanded=\"false\" aria-controls=\"navbarMenu\"><span class=\"burger-lines\"></span></a>\n                <h1 class=\"site-logo\"><a href=\"index.html\">Balita</a></h1>\n            </div>\n        </div>\n    </div>\n    <?php\n    $APPLICATION->IncludeComponent(\n	\"bitrix:menu\", \n	\"header_top\", \n	array(\n		\"ALLOW_MULTI_SELECT\" => \"N\",\n		\"CHILD_MENU_TYPE\" => \"left\",\n		\"DELAY\" => \"N\",\n		\"MAX_LEVEL\" => \"2\",\n		\"MENU_CACHE_GET_VARS\" => array(\n		),\n		\"MENU_CACHE_TIME\" => \"3600\",\n		\"MENU_CACHE_TYPE\" => \"A\",\n		\"MENU_CACHE_USE_GROUPS\" => \"Y\",\n		\"ROOT_MENU_TYPE\" => \"top\",\n		\"USE_EXT\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"header_top\"\n	),\n	false\n); ?>\n    </div\n    </nav>\n</header>\n\n<section class=\"site-section pt-5\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-12\">\n\n                <div class=\"owl-carousel owl-theme home-slider\">\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_1.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_2.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_3.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_3.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                </div>\n\n            </div>\n        </div>\n    </div>\n</section>\n\n<section class=\"site-section py-sm\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-6\">\n                <h2 class=\"mb-4\">Lifestyle Category</h2>\n            </div>\n        </div>\n        <div class=\"row blog-entries\">\n            <div class=\"col-md-12 col-lg-8 main-content\">\n						\";}', 1, 1680453964),
('11109be84cd036c4c17fd2533880c0e68', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:721:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/header.php\');\n/** @global $APPLICATION */\n?>\n<?php $res = $APPLICATION->IncludeComponent(\n    \"project:blog.element.list\",\n    \"mainpage\",\n    [\n        \"CACHE_TIME\" => \"3600\",\n        \"CACHE_TYPE\" => \"A\",\n        \"COMPONENT_TEMPLATE\" => \"mainpage\",\n        \"COUNT\" => \"5\",\n        \"IBLOCK_CODE\" => \"Posts\",\n        \"IBLOCK_TYPE\" => \"blog\",\n        \"SECTION_CODE\" => \"lifestyle\",\n        \"SHOW_NAV\" => \"Y\",\n        \"SORT_DIRECTION1\" => \"ASC\",\n        \"SORT_DIRECTION2\" => \"ASC\",\n        \"SORT_FIELD1\" => \"ACTIVE_FROM\",\n        \"SORT_FIELD2\" => \"SORT\",\n    ]\n); ?>\n<?php\n$APPLICATION->SetTitle($res[\'TITLE\']);\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/footer.php\');\n?>\";}', 1, 1680651812),
('116a004fcc60e473a970477ca66bdc870', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:58:\"/var/www/html/minimal-blog/local/templates/main/footer.php\";s:7:\"content\";s:4386:\"<?php\n/**\n * @global $APPLICATION ;\n */\nif (!defined(\'B_PROLOG_INCLUDED\') || B_PROLOG_INCLUDED !== true) {\n    die();\n}\n?>\n</div>\n<div class=\"col-md-12 col-lg-4 sidebar\">\n    <div class=\"sidebar-box search-form-wrap\">\n        <form action=\"#\" class=\"search-form\">\n            <div class=\"form-group\">\n                <span class=\"icon fa fa-search\"></span>\n                <input type=\"text\" class=\"form-control\" id=\"s\" placeholder=\"Type a keyword and hit enter\">\n            </div>\n        </form>\n    </div>\n    <!-- END sidebar-box -->\n    <div class=\"sidebar-box\">\n        <div class=\"bio text-center\">\n            <img src=\"\n                         <?php $APPLICATION->IncludeComponent(\n                \"bitrix:main.include\",\n                \".default\",\n                [\n                    \"AREA_FILE_SHOW\" => \"file\",\n                    \"AREA_FILE_SUFFIX\" => \"inc\",\n                    \"EDIT_TEMPLATE\" => \"\",\n                    \"COMPONENT_TEMPLATE\" => \".default\",\n                    \"PATH\" => \"/local/include_areas/template/foto.php\",\n                ],\n                false,\n            ); ?>\n            <?= MARKUP_PATH ?>images/person_1.jpg\n\" alt=\"Image Placeholder\" class=\"img-fluid\">\n            <div class=\"bio-body\">\n                <?php $APPLICATION->IncludeComponent(\n                    \"bitrix:main.include\",\n                    \".default\",\n                    [\n                        \"AREA_FILE_SHOW\" => \"file\",\n                        \"AREA_FILE_SUFFIX\" => \"inc\",\n                        \"EDIT_TEMPLATE\" => \"\",\n                        \"COMPONENT_TEMPLATE\" => \".default\",\n                        \"PATH\" => \"/local/include_areas/template/bio.php\",\n                    ],\n                    false,\n                ); ?>\n                <?php $APPLICATION->IncludeComponent(\n                    \"project:social\",\n                    \"sidebar\",\n                    [\n                        \"CACHE_TIME\" => \"3600\",\n                        \"CACHE_TYPE\" => \"A\",\n                        \"COMPONENT_TEMPLATE\" => \"sidebar\",\n                    ],\n                    false\n                ); ?>\n            </div>\n        </div>\n    </div>\n\n    <?php\n    $APPLICATION->IncludeComponent(\n        \"project:blog.element.list\",\n        \"popular.posts\",\n        [\n            \"COMPONENT_TEMPLATE\" => \"popular.posts\",\n            \"IBLOCK_TYPE\" => \"blog\",\n            \"IBLOCK_CODE\" => \"Posts\",\n            \"COUNT\" => \"3\",\n            \"SORT_FIELD1\" => \"SHOW_COUNTER\",\n            \"SORT_DIRECTION1\" => \"DESC\",\n            \"SORT_FIELD2\" => \"SORT\",\n            \"SORT_DIRECTION2\" => \"DESC\",\n            \"CACHE_TYPE\" => \"A\",\n            \"CACHE_TIME\" => \"3600\",\n            \"SECTION_CODE\" => \"\",\n            \"SHOW_NAV\" => \"N\",\n        ],\n        false\n    ); ?>\n\n    <?php\n    $APPLICATION->IncludeComponent(\n        \"project:blog.section.list\",\n        \"sidebar.list\",\n        [\n            \"COMPONENT_TEMPLATE\" => \"sidebar.list\",\n            \"IBLOCK_TYPE\" => \"blog\",\n            \"IBLOCK_CODE\" => \"Posts\",\n            \"COUNT\" => \"5\",\n            \"SORT_FIELD1\" => \"SHOW_COUNTER\",\n            \"SORT_DIRECTION1\" => \"DESC\",\n            \"SORT_FIELD2\" => \"SORT\",\n            \"SORT_DIRECTION2\" => \"DESC\",\n            \"CACHE_TYPE\" => \"A\",\n            \"CACHE_TIME\" => \"3600\",\n        ],\n        false\n    ); ?>\n\n</div>\n</div>\n</section>\n<?php $APPLICATION->ShowViewContent(\'blog_detail\'); ?>\n<footer class=\"site-footer\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-12\">\n                <!-- Link back to Colorlib can\'t be removed. Template is licensed under CC BY 3.0. -->\n                Copyright &copy;<?= date(\'Y\') ?>\n                All rights reserved | This template is made with <i class=\"fa fa-heart-o\" aria-hidden=\"true\"></i> by <a\n                    href=\"https://colorlib.com\" target=\"_blank\">Colorlib</a>\n                <!-- Link back to Colorlib can\'t be removed. Template is licensed under CC BY 3.0. -->\n            </div>\n        </div>\n    </div>\n</footer>\n<div id=\"loader\" class=\"show fullscreen\">\n    <svg class=\"circular\" width=\"48px\" height=\"48px\">\n        <circle class=\"path-bg\" cx=\"24\" cy=\"24\" r=\"22\" fill=\"none\" stroke-width=\"4\" stroke=\"#eeeeee\"/>\n        <circle class=\"path\" cx=\"24\" cy=\"24\" r=\"22\" fill=\"none\" stroke-width=\"4\" stroke-miterlimit=\"10\"\n                stroke=\"#f4b214\"/>\n    </svg>\n</div>\n</body>\n</html>\";}', 1, 1680758065),
('117114efd2c7a11e7c8550cbe815455f5', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:42:\"/var/www/html/minimal-blog/about/index.php\";s:7:\"content\";s:1977:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Hi There! I\'m Meagan Smith\");\n?><img width=\"800\" alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" height=\"534\" title=\"img_6.jpg\"> <br>\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\">\n<tbody>\n<tr>\n	<td>\n <img width=\"400\" alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" height=\"267\" title=\"img_6.jpg\">&nbsp;\n	</td>\n	<td>\n		 &nbsp;<img width=\"400\" alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" height=\"267\" title=\"img_6.jpg\">\n	</td>\n</tr>\n</tbody>\n</table>\n Lorem ipsum dolor sit amet, consectetur adipisicin&nbsp;g elit. Ipsum minima eveniet&nbsp;recusandae suscipit eum laboriosam fugit amet deleniti iste et.\n<p>\n</p>\n<p>\n	 Ad dolores, necessitatibus non saepe tenetur impedit commodi quibusdam natus repellat, exercitationem accusantium perferendis officiis. Laboriosam impedit quia minus pariatur! Dignissimos iste consectetur, nemo magnam nulla suscipit eius quibusdam, quo aperiam quia quae est explicabo nostrum ab aliquid vitae obcaecati tenetur beatae animi fugiat officia id ipsam sint?\n</p>\n<p>\n	 Obcaecati ea nisi fugit assumenda error totam molestiae saepe fugiat officiis quam? Culpa porro quod doloribus dolore sint. Distinctio facilis ullam voluptas nemo voluptatum saepe repudiandae adipisci officiis, explicabo eaque itaque sed necessitatibus, fuga, ea eius et aliquam dignissimos repellendus impedit pariatur voluptates. Dicta perferendis assumenda, nihil placeat, illum quibusdam. Vel, incidunt?\n</p>\n Dolorum blanditiis illum quo quaerat, possimus praesentium perferendis! Quod autem optio nobis, placeat officiis dolorem praesentium odit. Vel, cum, a. Adipisci eligendi eaque laudantium dicta tenetur quod, pariatur sunt sed natus officia fuga accusamus reprehenderit ratione, provident possimus ut voluptatum.\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680725672),
('11be94d209b9611264a481354c7d4f645', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:42:\"/var/www/html/minimal-blog/about/index.php\";s:7:\"content\";s:281:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"about\");\n?><img width=\"800\" alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" height=\"534\" title=\"img_6.jpg\"><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680719526),
('12ed684343dde5a791fcdbaa66b870d9b', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:725:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/header.php\');\n/** @global $APPLICATION */\n$APPLICATION->SetTitle(\'Главная\');\n?>\n\n<?php\n$APPLICATION->IncludeComponent(\n    \"project:blog.element.list\",\n    \"mainpage\",\n    [\n        \"COMPONENT_TEMPLATE\" => \"mainpage\",\n        \"IBLOCK_TYPE\" => \"blog\",\n        \"IBLOCK_CODE\" => \"Posts\",\n        \"SECTION_CODE\" => \"lifestyle\",\n        \"SHOW_NAV\" => \"Y\",\n        \"COUNT\" => \"5\",\n        \"SORT_FIELD1\" => \"ACTIVE_FROM\",\n        \"SORT_DIRECTION1\" => \"ASC\",\n        \"SORT_FIELD2\" => \"SORT\",\n        \"SORT_DIRECTION2\" => \"ASC\",\n        \"CACHE_TYPE\" => \"A\",\n        \"CACHE_TIME\" => \"3600\",\n    ],\n    false\n); ?>\n<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/footer.php\');\n?>\";}', 1, 1680498695),
('133b5711f8dfc9bb83ba5299249365302', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:635:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/header.php\');\n/** @global $APPLICATION */\n$APPLICATION->SetTitle(\'Главная\');\n?>\n\n<?php\n$APPLICATION->IncludeComponent(\n	\"project:blog.element.list\", \n	\"mainpage\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"mainpage\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"SECTION_CODE\" => \"\",\n		\"SHOW_NAV\" => \"Y\",\n		\"COUNT\" => \"5\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_DIRECTION1\" => \"ASC\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"3600\"\n	),\n	false\n); ?>\n<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/footer.php\');\n?>\";}', 1, 1680498706),
('143156507e4fe5a010140726632b234be', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:58:\"/var/www/html/minimal-blog/local/templates/main/footer.php\";s:7:\"content\";s:5362:\"<?php\n/**\n * @global $APPLICATION;\n */\nif (!defined(\'B_PROLOG_INCLUDED\') || B_PROLOG_INCLUDED !== true) {\n    die();\n}\n?>\n<div class=\"col-md-12 col-lg-4 sidebar\">\n    <div class=\"sidebar-box search-form-wrap\">\n        <form action=\"#\" class=\"search-form\">\n            <div class=\"form-group\">\n                <span class=\"icon fa fa-search\"></span>\n                <input type=\"text\" class=\"form-control\" id=\"s\" placeholder=\"Type a keyword and hit enter\">\n            </div>\n        </form>\n    </div>\n    <!-- END sidebar-box -->\n    <div class=\"sidebar-box\">\n        <div class=\"bio text-center\">\n            <img src=\"<?=MARKUP_PATH?>images/person_1.jpg\" alt=\"Image Placeholder\" class=\"img-fluid\">\n            <div class=\"bio-body\">\n                <h2>Meagan Smith</h2>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem facilis sunt\n                    repellendus\n                    excepturi beatae porro debitis voluptate nulla quo veniam fuga sit molestias minus.</p>\n                <p><a href=\"/about\" class=\"btn btn-primary btn-sm\">Read my bio</a></p>\n                <?php $APPLICATION->IncludeComponent(\n	\"project:social\", \n	\"sidebar\", \n	array(\n		\"CACHE_TIME\" => \"3600\",\n		\"CACHE_TYPE\" => \"A\",\n		\"COMPONENT_TEMPLATE\" => \"sidebar\"\n	),\n	false\n); ?>\n            </div>\n        </div>\n    </div>\n    <!-- END sidebar-box -->\n    <div class=\"sidebar-box\">\n        <h3 class=\"heading\">Popular Posts</h3>\n        <div class=\"post-entry-sidebar\">\n            <ul>\n                <li>\n                    <a href=\"\">\n                        <img src=\"images/img_2.jpg\" alt=\"Image placeholder\" class=\"mr-4\">\n                        <div class=\"text\">\n                            <h4>There’s a Cool New Way for Men to Wear Socks and Sandals</h4>\n                            <div class=\"post-meta\">\n                                <span class=\"mr-2\">March 15, 2018 </span> •\n                                <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                            </div>\n                        </div>\n                    </a>\n                </li>\n                <li>\n                    <a href=\"\">\n                        <img src=\"images/img_4.jpg\" alt=\"Image placeholder\" class=\"mr-4\">\n                        <div class=\"text\">\n                            <h4>There’s a Cool New Way for Men to Wear Socks and Sandals</h4>\n                            <div class=\"post-meta\">\n                                <span class=\"mr-2\">March 15, 2018 </span> •\n                                <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                            </div>\n                        </div>\n                    </a>\n                </li>\n                <li>\n                    <a href=\"\">\n                        <img src=\"images/img_12.jpg\" alt=\"Image placeholder\" class=\"mr-4\">\n                        <div class=\"text\">\n                            <h4>There’s a Cool New Way for Men to Wear Socks and Sandals</h4>\n                            <div class=\"post-meta\">\n                                <span class=\"mr-2\">March 15, 2018 </span> •\n                                <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                            </div>\n                        </div>\n                    </a>\n                </li>\n            </ul>\n        </div>\n    </div>\n    <?php\n    $APPLICATION->IncludeComponent(\n	\"project:blog.section.list\", \n	\"sidebar.list\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"sidebar.list\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"COUNT\" => \"5\",\n		\"SORT_FIELD1\" => \"SHOW_COUNTER\",\n		\"SORT_DIRECTION1\" => \"DESC\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"SORT_DIRECTION2\" => \"DESC\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"3600\"\n	),\n	false\n); ?>\n    <!-- END sidebar-box -->\n    <div class=\"sidebar-box\">\n        <h3 class=\"heading\">Categories</h3>\n        <ul class=\"categories\">\n            <li><a href=\"#\">Courses <span>(12)</span></a></li>\n            <li><a href=\"#\">News <span>(22)</span></a></li>\n            <li><a href=\"#\">Design <span>(37)</span></a></li>\n            <li><a href=\"#\">HTML <span>(42)</span></a></li>\n            <li><a href=\"#\">Web Development <span>(14)</span></a></li>\n        </ul>\n    </div>\n    <!-- END sidebar-box -->\n\n</div>\n</div>\n</section>\n<footer class=\"site-footer\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-12\">\n                <!-- Link back to Colorlib can\'t be removed. Template is licensed under CC BY 3.0. -->\n                Copyright &copy;<?= date(\'Y\') ?>\n                All rights reserved | This template is made with <i class=\"fa fa-heart-o\" aria-hidden=\"true\"></i> by <a\n                        href=\"https://colorlib.com\" target=\"_blank\">Colorlib</a>\n                <!-- Link back to Colorlib can\'t be removed. Template is licensed under CC BY 3.0. -->\n            </div>\n        </div>\n    </div>\n</footer>\n<div id=\"loader\" class=\"show fullscreen\">\n    <svg class=\"circular\" width=\"48px\" height=\"48px\">\n        <circle class=\"path-bg\" cx=\"24\" cy=\"24\" r=\"22\" fill=\"none\" stroke-width=\"4\" stroke=\"#eeeeee\"/>\n        <circle class=\"path\" cx=\"24\" cy=\"24\" r=\"22\" fill=\"none\" stroke-width=\"4\" stroke-miterlimit=\"10\"\n                stroke=\"#f4b214\"/>\n    </svg>\n</div>\n</body>\n</html>\";}', 1, 1680553035),
('1440e458ef92abf8d3d1ef251e6490b75', 'fileman', 'edit_menu', 'CFileman::UndoNewFile', 'a:3:{s:7:\"absPath\";s:40:\"/var/www/html/minimal-blog/.top.menu.php\";s:4:\"path\";s:14:\"/.top.menu.php\";s:4:\"site\";s:2:\"s1\";}', 1, 1680451105),
('145abd5e13a9ad1b2caaec6bccffc2f24', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:1028:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/header.php\');\n/** @global $APPLICATION */\n?>\n<?php $res = $APPLICATION->IncludeComponent(\n    \"project:blog.element.list\",\n    \"mainpage\",\n    [\n        \"CACHE_TIME\" => \"3600\",\n        \"CACHE_TYPE\" => \"A\",\n        \"COMPONENT_TEMPLATE\" => \"mainpage\",\n        \"COUNT\" => \"10\",\n        \"IBLOCK_CODE\" => \"Posts\",\n        \"IBLOCK_TYPE\" => \"blog\",\n        \"SECTION_CODE\" => \"lifestyle\",\n        \"SHOW_NAV\" => \"Y\",\n        \"SORT_DIRECTION1\" => \"ASC\",\n        \"SORT_DIRECTION2\" => \"ASC\",\n        \"SORT_FIELD1\" => \"ACTIVE_FROM\",\n        \"SORT_FIELD2\" => \"SORT\",\n        \"PAGER_TEMPLATE\" => \"project.main\",\n        \"DISPLAY_TOP_PAGER\" => \"N\",\n        \"DISPLAY_BOTTOM_PAGER\" => \"N\",\n        \"PAGER_TITLE\" => \"Навигация\",\n        \"PAGER_SHOW_ALWAYS\" => \"Y\",\n        \"PAGER_DESC_NUMBERING\" => \"N\",\n        \"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\",\n    ],\n    false\n); ?>\n<?php\n$APPLICATION->SetTitle($res[\'TITLE\']);\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/footer.php\');\n?>\";}', 1, 1680657524),
('14882f2c898f1a80cc17ceaf3684734bd', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:47:\"/var/www/html/minimal-blog/categories/index.php\";s:7:\"content\";s:836:\"<?php\nrequire($_SERVER[\"DOCUMENT_ROOT\"] . \"/bitrix/header.php\");\n\n/**\n * @global $APPLICATION\n */\n$APPLICATION->SetTitle(\"My Blog\");\n?>\n<?php $APPLICATION->IncludeComponent(\n	\"project:blog\", \n	\"blog\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"blog\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_DIRECTION1\" => \"DESC\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"COUNT\" => \"6\",\n		\"SHOW_NAV\" => \"Y\",\n		\"SEF_MODE\" => \"Y\",\n		\"SEF_FOLDER\" => \"/categories/\",\n		\"AJAX\" => \"Y\",\n		\"AJAX_KEY\" => \"AJAX\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"3600\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"index\" => \"index.php\",\n			\"section\" => \"#SECTION_CODE#/\",\n			\"detail\" => \"#SECTION_CODE#/#ELEMENT_CODE#/\",\n		)\n	),\n	false\n); ?>\n<?php require($_SERVER[\"DOCUMENT_ROOT\"] . \"/bitrix/footer.php\"); ?>\";}', 1, 1680733488),
('151074cc96bf4f948237c858620fdcd6a', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:44:\"/var/www/html/minimal-blog/contact/index.php\";s:7:\"content\";s:526:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"contact\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\", \n	\".default\", \n	array(\n		\"USE_CAPTCHA\" => \"Y\",\n		\"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n		\"EMAIL_TO\" => \"my@email.com\",\n		\"REQUIRED_FIELDS\" => array(\n			0 => \"EMAIL\",\n		),\n		\"EVENT_MESSAGE_ID\" => array(\n			0 => \"7\",\n		),\n		\"COMPONENT_TEMPLATE\" => \".default\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680753875),
('1512a61b575b33a8057c9b2160b27648b', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:58:\"/var/www/html/minimal-blog/local/templates/main/footer.php\";s:7:\"content\";s:5159:\"<?php\n/**\n * @global $APPLICATION;\n */\nif (!defined(\'B_PROLOG_INCLUDED\') || B_PROLOG_INCLUDED !== true) {\n    die();\n}\n?>\n<div class=\"col-md-12 col-lg-4 sidebar\">\n    <div class=\"sidebar-box search-form-wrap\">\n        <form action=\"#\" class=\"search-form\">\n            <div class=\"form-group\">\n                <span class=\"icon fa fa-search\"></span>\n                <input type=\"text\" class=\"form-control\" id=\"s\" placeholder=\"Type a keyword and hit enter\">\n            </div>\n        </form>\n    </div>\n    <!-- END sidebar-box -->\n    <div class=\"sidebar-box\">\n        <div class=\"bio text-center\">\n            <img src=\"<?=MARKUP_PATH?>images/person_1.jpg\" alt=\"Image Placeholder\" class=\"img-fluid\">\n            <div class=\"bio-body\">\n                <h2>Meagan Smith</h2>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem facilis sunt\n                    repellendus\n                    excepturi beatae porro debitis voluptate nulla quo veniam fuga sit molestias minus.</p>\n                <p><a href=\"/about\" class=\"btn btn-primary btn-sm\">Read my bio</a></p>\n                <?php $APPLICATION->IncludeComponent(\n	\"project:social\", \n	\"sidebar\", \n	array(\n		\"CACHE_TIME\" => \"3600\",\n		\"CACHE_TYPE\" => \"A\",\n		\"COMPONENT_TEMPLATE\" => \"sidebar\"\n	),\n	false\n); ?>\n            </div>\n        </div>\n    </div>\n    <!-- END sidebar-box -->\n    <div class=\"sidebar-box\">\n        <h3 class=\"heading\">Popular Posts</h3>\n        <div class=\"post-entry-sidebar\">\n            <ul>\n                <li>\n                    <a href=\"\">\n                        <img src=\"images/img_2.jpg\" alt=\"Image placeholder\" class=\"mr-4\">\n                        <div class=\"text\">\n                            <h4>There’s a Cool New Way for Men to Wear Socks and Sandals</h4>\n                            <div class=\"post-meta\">\n                                <span class=\"mr-2\">March 15, 2018 </span> •\n                                <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                            </div>\n                        </div>\n                    </a>\n                </li>\n                <li>\n                    <a href=\"\">\n                        <img src=\"images/img_4.jpg\" alt=\"Image placeholder\" class=\"mr-4\">\n                        <div class=\"text\">\n                            <h4>There’s a Cool New Way for Men to Wear Socks and Sandals</h4>\n                            <div class=\"post-meta\">\n                                <span class=\"mr-2\">March 15, 2018 </span> •\n                                <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                            </div>\n                        </div>\n                    </a>\n                </li>\n                <li>\n                    <a href=\"\">\n                        <img src=\"images/img_12.jpg\" alt=\"Image placeholder\" class=\"mr-4\">\n                        <div class=\"text\">\n                            <h4>There’s a Cool New Way for Men to Wear Socks and Sandals</h4>\n                            <div class=\"post-meta\">\n                                <span class=\"mr-2\">March 15, 2018 </span> •\n                                <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                            </div>\n                        </div>\n                    </a>\n                </li>\n            </ul>\n        </div>\n    </div>\n    <?php\n    $APPLICATION->IncludeComponent(\n        \"project:blog.section.list\",\n        \"sidebar.list\",\n        [\n            \"COMPONENT_TEMPLATE\" => \"sidebar.list\",\n        ],\n        false\n    ); ?>\n    <!-- END sidebar-box -->\n    <div class=\"sidebar-box\">\n        <h3 class=\"heading\">Categories</h3>\n        <ul class=\"categories\">\n            <li><a href=\"#\">Courses <span>(12)</span></a></li>\n            <li><a href=\"#\">News <span>(22)</span></a></li>\n            <li><a href=\"#\">Design <span>(37)</span></a></li>\n            <li><a href=\"#\">HTML <span>(42)</span></a></li>\n            <li><a href=\"#\">Web Development <span>(14)</span></a></li>\n        </ul>\n    </div>\n    <!-- END sidebar-box -->\n\n</div>\n</div>\n</section>\n<footer class=\"site-footer\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-12\">\n                <!-- Link back to Colorlib can\'t be removed. Template is licensed under CC BY 3.0. -->\n                Copyright &copy;<?= date(\'Y\') ?>\n                All rights reserved | This template is made with <i class=\"fa fa-heart-o\" aria-hidden=\"true\"></i> by <a\n                        href=\"https://colorlib.com\" target=\"_blank\">Colorlib</a>\n                <!-- Link back to Colorlib can\'t be removed. Template is licensed under CC BY 3.0. -->\n            </div>\n        </div>\n    </div>\n</footer>\n<div id=\"loader\" class=\"show fullscreen\">\n    <svg class=\"circular\" width=\"48px\" height=\"48px\">\n        <circle class=\"path-bg\" cx=\"24\" cy=\"24\" r=\"22\" fill=\"none\" stroke-width=\"4\" stroke=\"#eeeeee\"/>\n        <circle class=\"path\" cx=\"24\" cy=\"24\" r=\"22\" fill=\"none\" stroke-width=\"4\" stroke-miterlimit=\"10\"\n                stroke=\"#f4b214\"/>\n    </svg>\n</div>\n</body>\n</html>\";}', 1, 1680551203),
('15291fc78fd101bcedc0461de0517cf14', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:42:\"/var/www/html/minimal-blog/about/index.php\";s:7:\"content\";s:1838:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Hi There! I\'m Meagan Smith\");\n?><img width=\"800\" alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" height=\"534\" title=\"img_6.jpg\">\n<p>\n	 Lorem ipsum dolor sit amet, consectetur adipisicin<img width=\"400\" alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" height=\"267\" title=\"img_6.jpg\">   <img width=\"400\" alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" height=\"267\" title=\"img_6.jpg\">g elit. Ipsum minima eveniet&nbsp;recusandae suscipit eum laboriosam fugit amet deleniti iste et.\n</p>\n<p>\n	 Ad dolores, necessitatibus non saepe tenetur impedit commodi quibusdam natus repellat, exercitationem accusantium perferendis officiis. Laboriosam impedit quia minus pariatur! Dignissimos iste consectetur, nemo magnam nulla suscipit eius quibusdam, quo aperiam quia quae est explicabo nostrum ab aliquid vitae obcaecati tenetur beatae animi fugiat officia id ipsam sint?\n</p>\n<p>\n	 Obcaecati ea nisi fugit assumenda error totam molestiae saepe fugiat officiis quam? Culpa porro quod doloribus dolore sint. Distinctio facilis ullam voluptas nemo voluptatum saepe repudiandae adipisci officiis, explicabo eaque itaque sed necessitatibus, fuga, ea eius et aliquam dignissimos repellendus impedit pariatur voluptates. Dicta perferendis assumenda, nihil placeat, illum quibusdam. Vel, incidunt?\n</p>\n Dolorum blanditiis illum quo quaerat, possimus praesentium perferendis! Quod autem optio nobis, placeat officiis dolorem praesentium odit. Vel, cum, a. Adipisci eligendi eaque laudantium dicta tenetur quod, pariatur sunt sed natus officia fuga accusamus reprehenderit ratione, provident possimus ut voluptatum.\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680725637),
('154e387410d220ca03d0b016527ff6101', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:44:\"/var/www/html/minimal-blog/contact/index.php\";s:7:\"content\";s:542:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Contact\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\", \n	\".default\", \n	array(\n		\"USE_CAPTCHA\" => \"N\",\n		\"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n		\"EMAIL_TO\" => \"my@email.com\",\n		\"REQUIRED_FIELDS\" => array(\n			0 => \"NAME\",\n			1 => \"EMAIL\",\n		),\n		\"EVENT_MESSAGE_ID\" => array(\n			0 => \"7\",\n		),\n		\"COMPONENT_TEMPLATE\" => \".default\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680755407),
('15624a3a0f6b03941e415a90838debc63', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:42:\"/var/www/html/minimal-blog/about/index.php\";s:7:\"content\";s:1554:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"about\");\n?><img width=\"800\" alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" height=\"534\" title=\"img_6.jpg\">\n<p>\n	Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsum minima eveniet recusandae suscipit eum laboriosam fugit amet deleniti iste et.\n</p>\n<p>\n	Ad dolores, necessitatibus non saepe tenetur impedit commodi quibusdam natus repellat, exercitationem accusantium perferendis officiis. Laboriosam impedit quia minus pariatur! Dignissimos iste consectetur, nemo magnam nulla suscipit eius quibusdam, quo aperiam quia quae est explicabo nostrum ab aliquid vitae obcaecati tenetur beatae animi fugiat officia id ipsam sint?\n</p>\n<p>\n	Obcaecati ea nisi fugit assumenda error totam molestiae saepe fugiat officiis quam? Culpa porro quod doloribus dolore sint. Distinctio facilis ullam voluptas nemo voluptatum saepe repudiandae adipisci officiis, explicabo eaque itaque sed necessitatibus, fuga, ea eius et aliquam dignissimos repellendus impedit pariatur voluptates. Dicta perferendis assumenda, nihil placeat, illum quibusdam. Vel, incidunt?\n</p>\n Dolorum blanditiis illum quo quaerat, possimus praesentium perferendis! Quod autem optio nobis, placeat officiis dolorem praesentium odit. Vel, cum, a. Adipisci eligendi eaque laudantium dicta tenetur quod, pariatur sunt sed natus officia fuga accusamus reprehenderit ratione, provident possimus ut voluptatum.\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680725455),
('159ef61af358e2b6cb9b5a253c86772f1', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:47:\"/var/www/html/minimal-blog/categories/index.php\";s:7:\"content\";s:836:\"<?php\nrequire($_SERVER[\"DOCUMENT_ROOT\"] . \"/bitrix/header.php\");\n\n/**\n * @global $APPLICATION\n */\n$APPLICATION->SetTitle(\"My Blog\");\n?>\n<?php $APPLICATION->IncludeComponent(\n	\"project:blog\", \n	\"blog\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"blog\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_DIRECTION1\" => \"DESC\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"COUNT\" => \"6\",\n		\"SHOW_NAV\" => \"N\",\n		\"SEF_MODE\" => \"Y\",\n		\"SEF_FOLDER\" => \"/categories/\",\n		\"AJAX\" => \"Y\",\n		\"AJAX_KEY\" => \"AJAX\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"3600\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"index\" => \"index.php\",\n			\"section\" => \"#SECTION_CODE#/\",\n			\"detail\" => \"#SECTION_CODE#/#ELEMENT_CODE#/\",\n		)\n	),\n	false\n); ?>\n<?php require($_SERVER[\"DOCUMENT_ROOT\"] . \"/bitrix/footer.php\"); ?>\";}', 1, 1680733496),
('15a98700ada3965b7f49eae8280c66485', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:58:\"/var/www/html/minimal-blog/local/templates/main/header.php\";s:7:\"content\";s:8032:\"<?php\n\nuse Bitrix\\Main\\Page\\Asset;\n\nif (!defined(\"B_PROLOG_INCLUDED\") || B_PROLOG_INCLUDED !== true) {\n    die();\n}\n\n/**\n * @global $APPLICATION\n */\n\n$asset = Asset::getInstance();\n$asset->addString(\"<link href=\'https://fonts.googleapis.com/css?family=Josefin+Sans:300, 400,700\' rel=\'stylesheet\'>\");\n$asset->addCss(MARKUP_PATH . \"css/bootstrap.css\");\n$asset->addCss(MARKUP_PATH . \"css/animate.css\");\n$asset->addCss(MARKUP_PATH . \"css/owl.carousel.min.css\");\n$asset->addCss(MARKUP_PATH . \"fonts/fontawesome/css/font-awesome.min.css\");\n$asset->addCss(MARKUP_PATH . \"fonts/flaticon/font/flaticon.css\");\n$asset->addCss(MARKUP_PATH . \"css/style.css\");\n\n$asset->addJs(MARKUP_PATH . \"js/jquery-3.2.1.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery-migrate-3.0.0.js\");\n$asset->addJs(MARKUP_PATH . \"js/popper.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/bootstrap.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/owl.carousel.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery.waypoints.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery.stellar.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/main.js\");\n?>\n\n<!doctype html>\n<html lang=\"<?= LANGUAGE_ID ?>\">\n<head>\n    <title><?php $APPLICATION->ShowTitle(); ?></title>\n    <meta charset=\"utf-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n    <?php $APPLICATION->ShowHead(); ?>\n</head>\n<body>\n<?php $APPLICATION->ShowPanel(); ?>\n\n<header role=\"banner\">\n    <div class=\"top-bar\">\n        <div class=\"container\">\n            <div class=\"row\">\n                <div class=\"col-9 social\">\n                    <a href=\"#\"><span class=\"fa fa-twitter\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-facebook\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-instagram\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-youtube-play\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-vimeo\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-snapchat\"></span></a>\n                </div>\n                <div class=\"col-3 search-top\">\n                    <!-- <a href=\"#\"><span class=\"fa fa-search\"></span></a> -->\n                    <form action=\"#\" class=\"search-top-form\">\n                        <span class=\"icon fa fa-search\"></span>\n                        <input type=\"text\" id=\"s\" placeholder=\"Type keyword to search...\">\n                    </form>\n                </div>\n            </div>\n        </div>\n    </div>\n\n    <div class=\"container logo-wrap\">\n        <div class=\"row pt-5\">\n            <div class=\"col-12 text-center\">\n                <a class=\"absolute-toggle d-block d-md-none\" data-toggle=\"collapse\" href=\"#navbarMenu\" role=\"button\"\n                   aria-expanded=\"false\" aria-controls=\"navbarMenu\"><span class=\"burger-lines\"></span></a>\n                <h1 class=\"site-logo\"><a href=\"index.html\">Balita</a></h1>\n            </div>\n        </div>\n    </div>\n    <?php\n    $APPLICATION->IncludeComponent(\n	\"bitrix:menu\", \n	\"header_top\", \n	array(\n		\"ALLOW_MULTI_SELECT\" => \"N\",\n		\"CHILD_MENU_TYPE\" => \"left\",\n		\"DELAY\" => \"N\",\n		\"MAX_LEVEL\" => \"2\",\n		\"MENU_CACHE_GET_VARS\" => array(\n		),\n		\"MENU_CACHE_TIME\" => \"3600\",\n		\"MENU_CACHE_TYPE\" => \"A\",\n		\"MENU_CACHE_USE_GROUPS\" => \"Y\",\n		\"ROOT_MENU_TYPE\" => \"left\",\n		\"USE_EXT\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"header_top\"\n	),\n	false\n); ?>\n    </div\n    </nav>\n</header>\n\n<section class=\"site-section pt-5\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-12\">\n\n                <div class=\"owl-carousel owl-theme home-slider\">\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_1.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_2.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_3.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_3.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                </div>\n\n            </div>\n        </div>\n    </div>\n</section>\n\n<section class=\"site-section py-sm\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-6\">\n                <h2 class=\"mb-4\">Lifestyle Category</h2>\n            </div>\n        </div>\n        <div class=\"row blog-entries\">\n            <div class=\"col-md-12 col-lg-8 main-content\">\n						\";}', 1, 1680454002),
('15aa70a9760021581ade040221306e743', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:905:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/header.php\');\n/** @global $APPLICATION */\n?>\n<?php $res = $APPLICATION->IncludeComponent(\n	\"project:blog.element.list\", \n	\"mainpage\", \n	array(\n		\"CACHE_TIME\" => \"3600\",\n		\"CACHE_TYPE\" => \"A\",\n		\"COMPONENT_TEMPLATE\" => \"mainpage\",\n		\"COUNT\" => \"10\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"SECTION_CODE\" => \"lifestyle\",\n		\"SHOW_NAV\" => \"Y\",\n		\"SORT_DIRECTION1\" => \"ASC\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"PAGER_TEMPLATE\" => \"project.main\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"N\",\n		\"PAGER_TITLE\" => \"Навигация\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\"\n	),\n	false\n); ?>\n<?php\n$APPLICATION->SetTitle($res[\'TITLE\']);\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/footer.php\');\n?>\";}', 1, 1680719108),
('15ba6e6e0a06e3eb56545c6b596f905ab', 'fileman', 'edit_menu', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:40:\"/var/www/html/minimal-blog/.top.menu.php\";s:7:\"content\";s:305:\"<?\n$aMenuLinks = Array(\n	Array(\n		\"home\", \n		\"/\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"about\", \n		\"/about\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"contact\", \n		\"/contact\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"categories\", \n		\"/categories/\", \n		Array(), \n		Array(), \n		\"\" \n	)\n);\n?>\";}', 1, 1680455599),
('15f968547a6d0e95ce70193fc711be7f6', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:58:\"/var/www/html/minimal-blog/local/templates/main/header.php\";s:7:\"content\";s:8343:\"<?php\n\nuse Bitrix\\Main\\Page\\Asset;\n\nif (!defined(\"B_PROLOG_INCLUDED\") || B_PROLOG_INCLUDED !== true) {\n    die();\n}\n\n/**\n * @global $APPLICATION\n */\n\n$asset = Asset::getInstance();\n$asset->addString(\"<link href=\'https://fonts.googleapis.com/css?family=Josefin+Sans:300, 400,700\' rel=\'stylesheet\'>\");\n$asset->addCss(MARKUP_PATH . \"css/bootstrap.css\");\n$asset->addCss(MARKUP_PATH . \"css/animate.css\");\n$asset->addCss(MARKUP_PATH . \"css/owl.carousel.min.css\");\n$asset->addCss(MARKUP_PATH . \"fonts/fontawesome/css/font-awesome.min.css\");\n$asset->addCss(MARKUP_PATH . \"fonts/flaticon/font/flaticon.css\");\n$asset->addCss(MARKUP_PATH . \"css/style.css\");\n\n$asset->addJs(MARKUP_PATH . \"js/jquery-3.2.1.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery-migrate-3.0.0.js\");\n$asset->addJs(MARKUP_PATH . \"js/popper.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/bootstrap.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/owl.carousel.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery.waypoints.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery.stellar.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/main.js\");\n?>\n\n<!doctype html>\n<html lang=\"<?= LANGUAGE_ID ?>\">\n<head>\n    <title><?php $APPLICATION->ShowTitle(); ?></title>\n    <meta charset=\"utf-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n    <?php $APPLICATION->ShowHead(); ?>\n</head>\n<body>\n<?php $APPLICATION->ShowPanel(); ?>\n\n<header role=\"banner\">\n    <div class=\"top-bar\">\n        <div class=\"container\">\n            <div class=\"row\">\n                <div class=\"col-9 social\">\n                    <a href=\"#\"><span class=\"fa fa-twitter\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-facebook\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-instagram\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-youtube-play\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-vimeo\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-snapchat\"></span></a>\n                </div>\n                <div class=\"col-3 search-top\">\n                    <!-- <a href=\"#\"><span class=\"fa fa-search\"></span></a> -->\n                    <form action=\"#\" class=\"search-top-form\">\n                        <span class=\"icon fa fa-search\"></span>\n                        <input type=\"text\" id=\"s\" placeholder=\"Type keyword to search...\">\n                    </form>\n                </div>\n            </div>\n        </div>\n    </div>\n\n    <div class=\"container logo-wrap\">\n        <div class=\"row pt-5\">\n            <div class=\"col-12 text-center\">\n                <a class=\"absolute-toggle d-block d-md-none\" data-toggle=\"collapse\" href=\"#navbarMenu\" role=\"button\"\n                   aria-expanded=\"false\" aria-controls=\"navbarMenu\"><span class=\"burger-lines\"></span></a>\n                <h1 class=\"site-logo\"><a href=\"index.html\">Balita</a></h1>\n            </div>\n        </div>\n    </div>\n            <?php\n            $APPLICATION->IncludeComponent(\n                \"bitrix:menu\",\n                \"header_top\",\n                [\n                    \"ALLOW_MULTI_SELECT\" => \"N\",\n                    \"CHILD_MENU_TYPE\" => \"left\",\n                    \"DELAY\" => \"N\",\n                    \"MAX_LEVEL\" => \"2\",\n                    \"MENU_CACHE_GET_VARS\" => [\n                    ],\n                    \"MENU_CACHE_TIME\" => \"3600\",\n                    \"MENU_CACHE_TYPE\" => \"N\",\n                    \"MENU_CACHE_USE_GROUPS\" => \"Y\",\n                    \"ROOT_MENU_TYPE\" => \"top\",\n                    \"USE_EXT\" => \"N\",\n                    \"COMPONENT_TEMPLATE\" => \"header_top\",\n                ],\n                false\n            ); ?>\n        </div\n    </nav>\n</header>\n\n<section class=\"site-section pt-5\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-12\">\n\n                <div class=\"owl-carousel owl-theme home-slider\">\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_1.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_2.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_3.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_3.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                </div>\n\n            </div>\n        </div>\n    </div>\n</section>\n\n<section class=\"site-section py-sm\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-6\">\n                <h2 class=\"mb-4\">Lifestyle Category</h2>\n            </div>\n        </div>\n        <div class=\"row blog-entries\">\n            <div class=\"col-md-12 col-lg-8 main-content\">\n						\";}', 1, 1680453402),
('1612eeefb94a8ee59444201e94c430fee', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:58:\"/var/www/html/minimal-blog/local/templates/main/header.php\";s:7:\"content\";s:9493:\"<?php\n\nuse Bitrix\\Main\\Page\\Asset;\n\nif (!defined(\"B_PROLOG_INCLUDED\") || B_PROLOG_INCLUDED !== true) {\n    die();\n}\n\n/**\n * @global $APPLICATION\n */\n\n$asset = Asset::getInstance();\n$asset->addString(\"<link href=\'https://fonts.googleapis.com/css?family=Josefin+Sans:300, 400,700\' rel=\'stylesheet\'>\");\n$asset->addCss(MARKUP_PATH . \"css/bootstrap.css\");\n$asset->addCss(MARKUP_PATH . \"css/animate.css\");\n$asset->addCss(MARKUP_PATH . \"css/owl.carousel.min.css\");\n$asset->addCss(MARKUP_PATH . \"fonts/fontawesome/css/font-awesome.min.css\");\n$asset->addCss(MARKUP_PATH . \"fonts/flaticon/font/flaticon.css\");\n$asset->addCss(MARKUP_PATH . \"css/style.css\");\n\n$asset->addJs(MARKUP_PATH . \"js/jquery-3.2.1.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery-migrate-3.0.0.js\");\n$asset->addJs(MARKUP_PATH . \"js/popper.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/bootstrap.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/owl.carousel.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery.waypoints.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery.stellar.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/main.js\");\n?>\n\n<!doctype html>\n<html lang=\"<?= LANGUAGE_ID ?>\">\n<head>\n    <title><?php $APPLICATION->ShowTitle(); ?></title>\n    <meta charset=\"utf-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n    <?php $APPLICATION->ShowHead(); ?>\n</head>\n<body>\n<?php $APPLICATION->ShowPanel(); ?>\n\n<header role=\"banner\">\n    <div class=\"top-bar\">\n        <div class=\"container\">\n            <div class=\"row\">\n                <div class=\"col-9 social\">\n                    <a href=\"#\"><span class=\"fa fa-twitter\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-facebook\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-instagram\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-youtube-play\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-vimeo\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-snapchat\"></span></a>\n                </div>\n                <div class=\"col-3 search-top\">\n                    <!-- <a href=\"#\"><span class=\"fa fa-search\"></span></a> -->\n                    <form action=\"#\" class=\"search-top-form\">\n                        <span class=\"icon fa fa-search\"></span>\n                        <input type=\"text\" id=\"s\" placeholder=\"Type keyword to search...\">\n                    </form>\n                </div>\n            </div>\n        </div>\n    </div>\n\n    <div class=\"container logo-wrap\">\n        <div class=\"row pt-5\">\n            <div class=\"col-12 text-center\">\n                <a class=\"absolute-toggle d-block d-md-none\" data-toggle=\"collapse\" href=\"#navbarMenu\" role=\"button\"\n                   aria-expanded=\"false\" aria-controls=\"navbarMenu\"><span class=\"burger-lines\"></span></a>\n                <h1 class=\"site-logo\"><a href=\"index.html\">Balita</a></h1>\n            </div>\n        </div>\n    </div>\n\n    <nav class=\"navbar navbar-expand-md  navbar-light bg-light\">\n        <div class=\"container\">\n            <div class=\"collapse navbar-collapse\" id=\"navbarMenu\">\n                <ul class=\"navbar-nav mx-auto\">\n                    <li class=\"nav-item\">\n                        <a class=\"nav-link active\" href=\"index.html\">Home</a>\n                    </li>\n\n                    <li class=\"nav-item dropdown\">\n                        <a class=\"nav-link dropdown-toggle\" href=\"category.html\" id=\"dropdown05\" data-toggle=\"dropdown\"\n                           aria-haspopup=\"true\" aria-expanded=\"false\">Categories</a>\n                        <div class=\"dropdown-menu\" aria-labelledby=\"dropdown05\">\n                            <a class=\"dropdown-item\" href=\"category.html\">Lifestyle</a>\n                            <a class=\"dropdown-item\" href=\"category.html\">Food</a>\n                            <a class=\"dropdown-item\" href=\"category.html\">Adventure</a>\n                            <a class=\"dropdown-item\" href=\"category.html\">Travel</a>\n                            <a class=\"dropdown-item\" href=\"category.html\">Business</a>\n                        </div>\n\n                    </li>\n                    <li class=\"nav-item\">\n                        <a class=\"nav-link\" href=\"about.html\">About</a>\n                    </li>\n                    <li class=\"nav-item\">\n                        <a class=\"nav-link\" href=\"contact.html\">Contact</a>\n                    </li>\n                </ul>\n\n            </div>\n            <?php\n            $APPLICATION->IncludeComponent(\n                \"bitrix:menu\",\n                \"header_top\",\n                [\n                    \"ALLOW_MULTI_SELECT\" => \"N\",\n                    \"CHILD_MENU_TYPE\" => \"left\",\n                    \"DELAY\" => \"N\",\n                    \"MAX_LEVEL\" => \"2\",\n                    \"MENU_CACHE_GET_VARS\" => [],\n                    \"MENU_CACHE_TIME\" => \"3600\",\n                    \"MENU_CACHE_TYPE\" => \"N\",\n                    \"MENU_CACHE_USE_GROUPS\" => \"Y\",\n                    \"ROOT_MENU_TYPE\" => \"top\",\n                    \"USE_EXT\" => \"N\",\n                ]\n            ); ?>\n        </div\n    </nav>\n</header>\n\n<section class=\"site-section pt-5\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-12\">\n\n                <div class=\"owl-carousel owl-theme home-slider\">\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\" style=\"background-image: url(\'<?=MARKUP_PATH?>images/img_1.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\" style=\"background-image: url(\'<?=MARKUP_PATH?>images/img_2.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\" style=\"background-image: url(\'<?=MARKUP_PATH?>images/img_3.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\" style=\"background-image: url(\'<?=MARKUP_PATH?>images/img_3.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                </div>\n\n            </div>\n        </div>\n    </div>\n</section>\n\n<section class=\"site-section py-sm\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-6\">\n                <h2 class=\"mb-4\">Lifestyle Category</h2>\n            </div>\n        </div>\n        <div class=\"row blog-entries\">\n            <div class=\"col-md-12 col-lg-8 main-content\">\n						\";}', 1, 1680451128),
('164563c2bb279ba4148a26b6c8686630b', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:58:\"/var/www/html/minimal-blog/local/templates/main/footer.php\";s:7:\"content\";s:3684:\"<?php\n/**\n * @global $APPLICATION ;\n */\nif (!defined(\'B_PROLOG_INCLUDED\') || B_PROLOG_INCLUDED !== true) {\n    die();\n}\n?>\n<div class=\"col-md-12 col-lg-4 sidebar\">\n    <div class=\"sidebar-box search-form-wrap\">\n        <form action=\"#\" class=\"search-form\">\n            <div class=\"form-group\">\n                <span class=\"icon fa fa-search\"></span>\n                <input type=\"text\" class=\"form-control\" id=\"s\" placeholder=\"Type a keyword and hit enter\">\n            </div>\n        </form>\n    </div>\n    <!-- END sidebar-box -->\n    <div class=\"sidebar-box\">\n        <div class=\"bio text-center\">\n            <img src=\"<?= MARKUP_PATH ?>images/person_1.jpg\" alt=\"Image Placeholder\" class=\"img-fluid\">\n            <div class=\"bio-body\">\n                <h2>Meagan Smith</h2>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem facilis sunt\n                    repellendus\n                    excepturi beatae porro debitis voluptate nulla quo veniam fuga sit molestias minus.</p>\n                <p><a href=\"/about\" class=\"btn btn-primary btn-sm\">Read my bio</a></p>\n                <?php $APPLICATION->IncludeComponent(\n                    \"project:social\",\n                    \"sidebar\",\n                    [\n                        \"CACHE_TIME\" => \"3600\",\n                        \"CACHE_TYPE\" => \"A\",\n                        \"COMPONENT_TEMPLATE\" => \"sidebar\",\n                    ],\n                    false\n                ); ?>\n            </div>\n        </div>\n    </div>\n    <!-- END sidebar-box -->\n    <?php\n    $APPLICATION->IncludeComponent(\n        \"project:blog.element.list\",\n        \"popular.posts\",\n        [\n            \"COMPONENT_TEMPLATE\" => \"popular.posts\",\n            \"IBLOCK_TYPE\" => \"blog\",\n            \"IBLOCK_CODE\" => \"Posts\",\n            \"COUNT\" => \"3\",\n            \"SORT_FIELD1\" => \"SHOW_COUNTER\",\n            \"SORT_DIRECTION1\" => \"DESC\",\n            \"SORT_FIELD2\" => \"SORT\",\n            \"SORT_DIRECTION2\" => \"DESC\",\n            \"CACHE_TYPE\" => \"A\",\n            \"CACHE_TIME\" => \"3600\",\n        ],\n        false\n    ); ?>\n    <?php\n    $APPLICATION->IncludeComponent(\n        \"project:blog.section.list\",\n        \"sidebar.list\",\n        [\n            \"COMPONENT_TEMPLATE\" => \"sidebar.list\",\n            \"IBLOCK_TYPE\" => \"blog\",\n            \"IBLOCK_CODE\" => \"Posts\",\n            \"COUNT\" => \"5\",\n            \"SORT_FIELD1\" => \"SHOW_COUNTER\",\n            \"SORT_DIRECTION1\" => \"DESC\",\n            \"SORT_FIELD2\" => \"SORT\",\n            \"SORT_DIRECTION2\" => \"DESC\",\n            \"CACHE_TYPE\" => \"A\",\n            \"CACHE_TIME\" => \"3600\",\n        ],\n        false\n    ); ?>\n    <!-- END sidebar-box -->\n</div>\n</div>\n</section>\n<footer class=\"site-footer\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-12\">\n                <!-- Link back to Colorlib can\'t be removed. Template is licensed under CC BY 3.0. -->\n                Copyright &copy;<?= date(\'Y\') ?>\n                All rights reserved | This template is made with <i class=\"fa fa-heart-o\" aria-hidden=\"true\"></i> by <a\n                    href=\"https://colorlib.com\" target=\"_blank\">Colorlib</a>\n                <!-- Link back to Colorlib can\'t be removed. Template is licensed under CC BY 3.0. -->\n            </div>\n        </div>\n    </div>\n</footer>\n<div id=\"loader\" class=\"show fullscreen\">\n    <svg class=\"circular\" width=\"48px\" height=\"48px\">\n        <circle class=\"path-bg\" cx=\"24\" cy=\"24\" r=\"22\" fill=\"none\" stroke-width=\"4\" stroke=\"#eeeeee\"/>\n        <circle class=\"path\" cx=\"24\" cy=\"24\" r=\"22\" fill=\"none\" stroke-width=\"4\" stroke-miterlimit=\"10\"\n                stroke=\"#f4b214\"/>\n    </svg>\n</div>\n</body>\n</html>\";}', 1, 1680559024),
('16483e23a3116757c24c240f70b671570', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:58:\"/var/www/html/minimal-blog/local/templates/main/footer.php\";s:7:\"content\";s:5770:\"<?php\n/**\n * @global $APPLICATION ;\n */\nif (!defined(\'B_PROLOG_INCLUDED\') || B_PROLOG_INCLUDED !== true) {\n    die();\n}\n?>\n<div class=\"col-md-12 col-lg-4 sidebar\">\n    <div class=\"sidebar-box search-form-wrap\">\n        <form action=\"#\" class=\"search-form\">\n            <div class=\"form-group\">\n                <span class=\"icon fa fa-search\"></span>\n                <input type=\"text\" class=\"form-control\" id=\"s\" placeholder=\"Type a keyword and hit enter\">\n            </div>\n        </form>\n    </div>\n    <!-- END sidebar-box -->\n    <div class=\"sidebar-box\">\n        <div class=\"bio text-center\">\n            <img src=\"<?= MARKUP_PATH ?>images/person_1.jpg\" alt=\"Image Placeholder\" class=\"img-fluid\">\n            <div class=\"bio-body\">\n                <h2>Meagan Smith</h2>\n                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem facilis sunt\n                    repellendus\n                    excepturi beatae porro debitis voluptate nulla quo veniam fuga sit molestias minus.</p>\n                <p><a href=\"/about\" class=\"btn btn-primary btn-sm\">Read my bio</a></p>\n                <?php $APPLICATION->IncludeComponent(\n                    \"project:social\",\n                    \"sidebar\",\n                    [\n                        \"CACHE_TIME\" => \"3600\",\n                        \"CACHE_TYPE\" => \"A\",\n                        \"COMPONENT_TEMPLATE\" => \"sidebar\",\n                    ],\n                    false\n                ); ?>\n            </div>\n        </div>\n    </div>\n    <!-- END sidebar-box -->\n    <div class=\"sidebar-box\">\n        <h3 class=\"heading\">Popular Posts</h3>\n        <div class=\"post-entry-sidebar\">\n            <ul>\n                <li>\n                    <a href=\"\">\n                        <img src=\"images/img_2.jpg\" alt=\"Image placeholder\" class=\"mr-4\">\n                        <div class=\"text\">\n                            <h4>There’s a Cool New Way for Men to Wear Socks and Sandals</h4>\n                            <div class=\"post-meta\">\n                                <span class=\"mr-2\">March 15, 2018 </span> •\n                                <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                            </div>\n                        </div>\n                    </a>\n                </li>\n                <li>\n                    <a href=\"\">\n                        <img src=\"images/img_4.jpg\" alt=\"Image placeholder\" class=\"mr-4\">\n                        <div class=\"text\">\n                            <h4>There’s a Cool New Way for Men to Wear Socks and Sandals</h4>\n                            <div class=\"post-meta\">\n                                <span class=\"mr-2\">March 15, 2018 </span> •\n                                <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                            </div>\n                        </div>\n                    </a>\n                </li>\n                <li>\n                    <a href=\"\">\n                        <img src=\"images/img_12.jpg\" alt=\"Image placeholder\" class=\"mr-4\">\n                        <div class=\"text\">\n                            <h4>There’s a Cool New Way for Men to Wear Socks and Sandals</h4>\n                            <div class=\"post-meta\">\n                                <span class=\"mr-2\">March 15, 2018 </span> •\n                                <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                            </div>\n                        </div>\n                    </a>\n                </li>\n            </ul>\n        </div>\n    </div>\n\n    <!-- END sidebar-box -->\n\n    <?php\n    $APPLICATION->IncludeComponent(\n        \"project:blog.section.list\",\n        \"sidebar.list\",\n        [\n            \"COMPONENT_TEMPLATE\" => \"sidebar.list\",\n            \"IBLOCK_TYPE\" => \"blog\",\n            \"IBLOCK_CODE\" => \"Posts\",\n            \"COUNT\" => \"5\",\n            \"SORT_FIELD1\" => \"SHOW_COUNTER\",\n            \"SORT_DIRECTION1\" => \"DESC\",\n            \"SORT_FIELD2\" => \"SORT\",\n            \"SORT_DIRECTION2\" => \"DESC\",\n            \"CACHE_TYPE\" => \"A\",\n            \"CACHE_TIME\" => \"3600\",\n        ],\n        false\n    ); ?>\n    <?php\n    $APPLICATION->IncludeComponent(\n        \"project:blog.popular.element.list\",\n        \"popular.posts\",\n        [\n            \"COMPONENT_TEMPLATE\" => \"popular.posts\",\n            \"IBLOCK_TYPE\" => \"blog\",\n            \"IBLOCK_CODE\" => \"Posts\",\n            \"COUNT\" => \"3\",\n            \"SORT_FIELD1\" => \"SHOW_COUNTER\",\n            \"SORT_DIRECTION1\" => \"DESC\",\n            \"SORT_FIELD2\" => \"SORT\",\n            \"SORT_DIRECTION2\" => \"DESC\",\n            \"CACHE_TYPE\" => \"A\",\n            \"CACHE_TIME\" => \"3600\",\n        ],\n        false\n    ); ?>\n    <!-- END sidebar-box -->\n\n</div>\n</div>\n</section>\n<footer class=\"site-footer\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-12\">\n                <!-- Link back to Colorlib can\'t be removed. Template is licensed under CC BY 3.0. -->\n                Copyright &copy;<?= date(\'Y\') ?>\n                All rights reserved | This template is made with <i class=\"fa fa-heart-o\" aria-hidden=\"true\"></i> by <a\n                    href=\"https://colorlib.com\" target=\"_blank\">Colorlib</a>\n                <!-- Link back to Colorlib can\'t be removed. Template is licensed under CC BY 3.0. -->\n            </div>\n        </div>\n    </div>\n</footer>\n<div id=\"loader\" class=\"show fullscreen\">\n    <svg class=\"circular\" width=\"48px\" height=\"48px\">\n        <circle class=\"path-bg\" cx=\"24\" cy=\"24\" r=\"22\" fill=\"none\" stroke-width=\"4\" stroke=\"#eeeeee\"/>\n        <circle class=\"path\" cx=\"24\" cy=\"24\" r=\"22\" fill=\"none\" stroke-width=\"4\" stroke-miterlimit=\"10\"\n                stroke=\"#f4b214\"/>\n    </svg>\n</div>\n</body>\n</html>\";}', 1, 1680556930),
('165ec7e90ca314b52326c1aa125c4f1f1', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:44:\"/var/www/html/minimal-blog/contact/index.php\";s:7:\"content\";s:542:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"contact\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\", \n	\".default\", \n	array(\n		\"USE_CAPTCHA\" => \"Y\",\n		\"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n		\"EMAIL_TO\" => \"my@email.com\",\n		\"REQUIRED_FIELDS\" => array(\n			0 => \"NAME\",\n			1 => \"EMAIL\",\n		),\n		\"EVENT_MESSAGE_ID\" => array(\n			0 => \"7\",\n		),\n		\"COMPONENT_TEMPLATE\" => \".default\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680753960),
('16bd0a637154b99a6959d90f9ae4ff02c', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:7544:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/header.php\');\n/** @global $APPLICATION */\n$APPLICATION->SetTitle(\'Главная\');\n//use Carbon\\Carbon;\n//$s = Carbon::now()->locale(Carbon::getLocale());\n////$s->format(\'m\');\n//var_dump($s->format(\'F j, Y\'));\n//blog.element.list\n?>\n<?php\n$APPLICATION->IncludeComponent(\n	\"project:blog.element.list\", \n	\"mainpage\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"mainpage\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"SECTION_CODE\" => \"lifestyle\",\n		\"SHOW_NAV\" => \"Y\",\n		\"COUNT\" => \"5\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_DIRECTION1\" => \"ASC\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"3600\"\n	),\n	false\n); ?>\n        <div class=\"row\">\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_5.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Food</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_6.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Travel</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_7.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Travel, Asia</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_8.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Travel</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_9.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Travel</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_10.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Lifestyle</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_11.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Lifestyle</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_12.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Food</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n        </div>\n\n        <div class=\"row\">\n            <div class=\"col-md-12 text-center\">\n                <nav aria-label=\"Page navigation\" class=\"text-center\">\n                    <ul class=\"pagination\">\n                        <li class=\"page-item  active\"><a class=\"page-link\" href=\"#\">Prev</a></li>\n                        <li class=\"page-item\"><a class=\"page-link\" href=\"#\">1</a></li>\n                        <li class=\"page-item\"><a class=\"page-link\" href=\"#\">2</a></li>\n                        <li class=\"page-item\"><a class=\"page-link\" href=\"#\">3</a></li>\n                        <li class=\"page-item\"><a class=\"page-link\" href=\"#\">Next</a></li>\n                    </ul>\n                </nav>\n            </div>\n        </div>\n\n\n    <!-- END main-content -->\n\n<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/footer.php\');\n?>\";}', 1, 1680473730),
('16d674756a4ae20702afb53f5462dcd78', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:47:\"/var/www/html/minimal-blog/categories/index.php\";s:7:\"content\";s:299:\"<?php\nrequire($_SERVER[\"DOCUMENT_ROOT\"] . \"/bitrix/header.php\");\n\n/**\n * @global $APPLICATION\n */\n$APPLICATION->SetTitle(\"categories\");\n?>\n<?php $APPLICATION->IncludeComponent(\n    \'project:blog\',\n    \'\',\n    [],\n    [],\n    []\n)?>\n<?php require($_SERVER[\"DOCUMENT_ROOT\"] . \"/bitrix/footer.php\"); ?>\";}', 1, 1680642167),
('17166922be400af5807870c3518a05bf4', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:904:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/header.php\');\n/** @global $APPLICATION */\n?>\n<?php $res = $APPLICATION->IncludeComponent(\n	\"project:blog.element.list\", \n	\"mainpage\", \n	array(\n		\"CACHE_TIME\" => \"3600\",\n		\"CACHE_TYPE\" => \"A\",\n		\"COMPONENT_TEMPLATE\" => \"mainpage\",\n		\"COUNT\" => \"8\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"SECTION_CODE\" => \"lifestyle\",\n		\"SHOW_NAV\" => \"Y\",\n		\"SORT_DIRECTION1\" => \"ASC\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"PAGER_TEMPLATE\" => \"project.main\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"N\",\n		\"PAGER_TITLE\" => \"Навигация\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\"\n	),\n	false\n); ?>\n<?php\n$APPLICATION->SetTitle($res[\'TITLE\']);\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/footer.php\');\n?>\";}', 1, 1680719132),
('174713a9527c6d3f34388f62a2b38255a', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:47:\"/var/www/html/minimal-blog/categories/index.php\";s:7:\"content\";s:794:\"<?php\nrequire($_SERVER[\"DOCUMENT_ROOT\"] . \"/bitrix/header.php\");\n\n/**\n * @global $APPLICATION\n */\n$APPLICATION->SetTitle(\"categories\");\n?>\n<?php $APPLICATION->IncludeComponent(\n	\"project:blog\", \n	\".default\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_DIRECTION1\" => \"DESC\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"COUNT\" => \"10\",\n		\"SHOW_NAV\" => \"Y\",\n		\"SEF_MODE\" => \"Y\",\n		\"SEF_FOLDER\" => \"/categories/\",\n		\"AJAX\" => \"N\",\n		\"AJAX_KEY\" => \"AJAX\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"3600\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"index\" => \"index.php\",\n			\"detail\" => \"#ELEMENT_CODE#/\",\n		)\n	),\n	[]\n);?>\n<?php require($_SERVER[\"DOCUMENT_ROOT\"] . \"/bitrix/footer.php\"); ?>\";}', 1, 1680642335),
('17613e083079df52860553c9ffd543653', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:58:\"/var/www/html/minimal-blog/local/templates/main/header.php\";s:7:\"content\";s:8179:\"<?php\n\nuse Bitrix\\Main\\Page\\Asset;\n\nif (!defined(\"B_PROLOG_INCLUDED\") || B_PROLOG_INCLUDED !== true) {\n    die();\n}\n\n/**\n * @global $APPLICATION\n */\n\n$asset = Asset::getInstance();\n$asset->addString(\"<link href=\'https://fonts.googleapis.com/css?family=Josefin+Sans:300, 400,700\' rel=\'stylesheet\'>\");\n$asset->addCss(MARKUP_PATH . \"css/bootstrap.css\");\n$asset->addCss(MARKUP_PATH . \"css/animate.css\");\n$asset->addCss(MARKUP_PATH . \"css/owl.carousel.min.css\");\n$asset->addCss(MARKUP_PATH . \"fonts/fontawesome/css/font-awesome.min.css\");\n$asset->addCss(MARKUP_PATH . \"fonts/flaticon/font/flaticon.css\");\n$asset->addCss(MARKUP_PATH . \"css/style.css\");\n\n$asset->addJs(MARKUP_PATH . \"js/jquery-3.2.1.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery-migrate-3.0.0.js\");\n$asset->addJs(MARKUP_PATH . \"js/popper.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/bootstrap.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/owl.carousel.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery.waypoints.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery.stellar.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/main.js\");\n?>\n\n<!doctype html>\n<html lang=\"<?= LANGUAGE_ID ?>\">\n<head>\n    <title><?php $APPLICATION->ShowTitle(); ?></title>\n    <meta charset=\"utf-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n    <?php $APPLICATION->ShowHead(); ?>\n</head>\n<body>\n<?php $APPLICATION->ShowPanel(); ?>\n\n<header role=\"banner\">\n    <div class=\"top-bar\">\n        <div class=\"container\">\n            <div class=\"row\">\n                <div class=\"col-9 social\">\n                    <a href=\"#\"><span class=\"fa fa-twitter\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-facebook\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-instagram\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-youtube-play\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-vimeo\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-snapchat\"></span></a>\n                </div>\n                <div class=\"col-3 search-top\">\n                    <!-- <a href=\"#\"><span class=\"fa fa-search\"></span></a> -->\n                    <form action=\"#\" class=\"search-top-form\">\n                        <span class=\"icon fa fa-search\"></span>\n                        <input type=\"text\" id=\"s\" placeholder=\"Type keyword to search...\">\n                    </form>\n                </div>\n            </div>\n        </div>\n    </div>\n\n    <div class=\"container logo-wrap\">\n        <div class=\"row pt-5\">\n            <div class=\"col-12 text-center\">\n                <a class=\"absolute-toggle d-block d-md-none\" data-toggle=\"collapse\" href=\"#navbarMenu\" role=\"button\"\n                   aria-expanded=\"false\" aria-controls=\"navbarMenu\"><span class=\"burger-lines\"></span></a>\n                <h1 class=\"site-logo\"><a href=\"index.html\">Balita</a></h1>\n            </div>\n        </div>\n    </div>\n    <?php\n    $APPLICATION->IncludeComponent(\n        \"bitrix:menu\",\n        \"header_top\",\n        [\n            \"ALLOW_MULTI_SELECT\" => \"N\",\n            \"CHILD_MENU_TYPE\" => \"left\",\n            \"DELAY\" => \"N\",\n            \"MAX_LEVEL\" => \"2\",\n            \"MENU_CACHE_GET_VARS\" => [\n            ],\n            \"MENU_CACHE_TIME\" => \"3600\",\n            \"MENU_CACHE_TYPE\" => \"A\",\n            \"MENU_CACHE_USE_GROUPS\" => \"Y\",\n            \"ROOT_MENU_TYPE\" => \"top\",\n            \"USE_EXT\" => \"Y\",\n            \"COMPONENT_TEMPLATE\" => \"header_top\",\n        ],\n        false\n    ); ?>\n    </div\n    </nav>\n</header>\n\n<section class=\"site-section pt-5\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-12\">\n\n                <div class=\"owl-carousel owl-theme home-slider\">\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_1.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_2.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_3.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_3.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                </div>\n\n            </div>\n        </div>\n    </div>\n</section>\n\n<section class=\"site-section py-sm\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-6\">\n                <h2 class=\"mb-4\">Lifestyle Category</h2>\n            </div>\n        </div>\n        <div class=\"row blog-entries\">\n            <div class=\"col-md-12 col-lg-8 main-content\">\n						\";}', 1, 1680453884),
('17761166a2828e6c932d2a16741cd114a', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:1195:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/header.php\');\n$APPLICATION->SetTitle(\"\");\n/** @global $APPLICATION */\n?>\n<?php $res = $APPLICATION->IncludeComponent(\n	\"project:blog.element.list\", \n	\"mainpage\", \n	array(\n		\"CACHE_TIME\" => \"3600\",\n		\"CACHE_TYPE\" => \"A\",\n		\"COMPONENT_TEMPLATE\" => \"mainpage\",\n		\"COUNT\" => \"6\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"SECTION_CODE\" => \"lifestyle\",\n		\"SHOW_NAV\" => \"Y\",\n		\"SORT_DIRECTION1\" => \"ASC\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"PAGER_TEMPLATE\" => \"project.main\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"N\",\n		\"PAGER_TITLE\" => \"Навигация\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\"\n	),\n	false\n); ?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.include\", \n	\".default\", \n	array(\n		\"AREA_FILE_SHOW\" => \"file\",\n		\"AREA_FILE_SUFFIX\" => \"inc\",\n		\"EDIT_TEMPLATE\" => \"\",\n		\"COMPONENT_TEMPLATE\" => \".default\",\n		\"PATH\" => \"/local/include_areas/bio.php\"\n	),\n	false\n);?>\n<?php\n$APPLICATION->SetTitle($res[\'TITLE\']);\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/footer.php\');\n?>\";}', 1, 1680756823),
('179539eb091bb9ff566566c1f23cb0a21', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:42:\"/var/www/html/minimal-blog/about/index.php\";s:7:\"content\";s:1575:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Hi There! I\'m Meagan Smith\");\n?><img width=\"800\" alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" height=\"534\" title=\"img_6.jpg\">\n<p>\n	Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsum minima eveniet recusandae suscipit eum laboriosam fugit amet deleniti iste et.\n</p>\n<p>\n	Ad dolores, necessitatibus non saepe tenetur impedit commodi quibusdam natus repellat, exercitationem accusantium perferendis officiis. Laboriosam impedit quia minus pariatur! Dignissimos iste consectetur, nemo magnam nulla suscipit eius quibusdam, quo aperiam quia quae est explicabo nostrum ab aliquid vitae obcaecati tenetur beatae animi fugiat officia id ipsam sint?\n</p>\n<p>\n	Obcaecati ea nisi fugit assumenda error totam molestiae saepe fugiat officiis quam? Culpa porro quod doloribus dolore sint. Distinctio facilis ullam voluptas nemo voluptatum saepe repudiandae adipisci officiis, explicabo eaque itaque sed necessitatibus, fuga, ea eius et aliquam dignissimos repellendus impedit pariatur voluptates. Dicta perferendis assumenda, nihil placeat, illum quibusdam. Vel, incidunt?\n</p>\n Dolorum blanditiis illum quo quaerat, possimus praesentium perferendis! Quod autem optio nobis, placeat officiis dolorem praesentium odit. Vel, cum, a. Adipisci eligendi eaque laudantium dicta tenetur quod, pariatur sunt sed natus officia fuga accusamus reprehenderit ratione, provident possimus ut voluptatum.\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680725579),
('17a065ad74759b6128a709e5a4d5ced7a', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:47:\"/var/www/html/minimal-blog/categories/index.php\";s:7:\"content\";s:837:\"<?php\nrequire($_SERVER[\"DOCUMENT_ROOT\"] . \"/bitrix/header.php\");\n\n/**\n * @global $APPLICATION\n */\n$APPLICATION->SetTitle(\"My Blog\");\n?>\n<?php $APPLICATION->IncludeComponent(\n	\"project:blog\", \n	\"blog\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"blog\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_DIRECTION1\" => \"DESC\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"COUNT\" => \"10\",\n		\"SHOW_NAV\" => \"Y\",\n		\"SEF_MODE\" => \"Y\",\n		\"SEF_FOLDER\" => \"/categories/\",\n		\"AJAX\" => \"N\",\n		\"AJAX_KEY\" => \"AJAX\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"3600\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"index\" => \"index.php\",\n			\"section\" => \"#SECTION_CODE#/\",\n			\"detail\" => \"#SECTION_CODE#/#ELEMENT_CODE#/\",\n		)\n	),\n	false\n); ?>\n<?php require($_SERVER[\"DOCUMENT_ROOT\"] . \"/bitrix/footer.php\"); ?>\";}', 1, 1680650238),
('17a986064cae2c594dfb00e00d6250e26', 'fileman', 'edit_menu', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:40:\"/var/www/html/minimal-blog/.top.menu.php\";s:7:\"content\";s:89:\"<?\n$aMenuLinks = Array(\n	Array(\n		\"home\", \n		\"/\", \n		Array(), \n		Array(), \n		\"\" \n	)\n);\n?>\";}', 1, 1680452182),
('17ddc72d811bc7314e08671125cd7e017', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:904:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/header.php\');\n/** @global $APPLICATION */\n?>\n<?php $res = $APPLICATION->IncludeComponent(\n	\"project:blog.element.list\", \n	\"mainpage\", \n	array(\n		\"CACHE_TIME\" => \"3600\",\n		\"CACHE_TYPE\" => \"A\",\n		\"COMPONENT_TEMPLATE\" => \"mainpage\",\n		\"COUNT\" => \"6\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"SECTION_CODE\" => \"lifestyle\",\n		\"SHOW_NAV\" => \"Y\",\n		\"SORT_DIRECTION1\" => \"ASC\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"PAGER_TEMPLATE\" => \"project.main\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"N\",\n		\"PAGER_TITLE\" => \"Навигация\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\"\n	),\n	false\n); ?>\n<?php\n$APPLICATION->SetTitle($res[\'TITLE\']);\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/footer.php\');\n?>\";}', 1, 1680756710),
('17e536a36e47350ede1d0a74951227a29', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:3:{s:7:\"absPath\";s:37:\"/var/www/html/minimal-blog/categories\";s:4:\"path\";s:11:\"/categories\";s:4:\"site\";s:2:\"s1\";}', 1, 1680452237),
('1826751e0e315ada8d68f2778aa0ffb19', 'fileman', 'edit_menu', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:40:\"/var/www/html/minimal-blog/.top.menu.php\";s:7:\"content\";s:371:\"<?php\n$aMenuLinks = [\n    [\n        \"home\",\n        \"/\",\n        [],\n        [],\n        \"\",\n    ],\n    [\n        \"categories\",\n        \"/categories\",\n        [],\n        [],\n        \"\",\n    ],\n    [\n        \"about\",\n        \"/about\",\n        [],\n        [],\n        \"\",\n    ],\n    [\n        \"contact\",\n        \"/contact\",\n        [],\n        [],\n        \"\",\n    ],\n];\n?>\";}', 1, 1680453816),
('186775c4af1e95f67de66726008ce9ae0', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:42:\"/var/www/html/minimal-blog/about/index.php\";s:7:\"content\";s:1597:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Hi There! I\'m Meagan Smith\");\n?><img width=\"800\" alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" height=\"534\" title=\"img_6.jpg\"> <br>\n<br>\nLorem ipsum dolor sit amet, consectetur adipisicin&nbsp;g elit. Ipsum minima eveniet&nbsp;recusandae suscipit eum laboriosam fugit amet deleniti iste et.\n<p>\n</p>\n<p>\n	 Ad dolores, necessitatibus non saepe tenetur impedit commodi quibusdam natus repellat, exercitationem accusantium perferendis officiis. Laboriosam impedit quia minus pariatur! Dignissimos iste consectetur, nemo magnam nulla suscipit eius quibusdam, quo aperiam quia quae est explicabo nostrum ab aliquid vitae obcaecati tenetur beatae animi fugiat officia id ipsam sint?\n</p>\n<p>\n	 Obcaecati ea nisi fugit assumenda error totam molestiae saepe fugiat officiis quam? Culpa porro quod doloribus dolore sint. Distinctio facilis ullam voluptas nemo voluptatum saepe repudiandae adipisci officiis, explicabo eaque itaque sed necessitatibus, fuga, ea eius et aliquam dignissimos repellendus impedit pariatur voluptates. Dicta perferendis assumenda, nihil placeat, illum quibusdam. Vel, incidunt?\n</p><p>\n Dolorum blanditiis illum quo quaerat, possimus praesentium perferendis! Quod autem optio nobis, placeat officiis dolorem praesentium odit. Vel, cum, a. Adipisci eligendi eaque laudantium dicta tenetur quod, pariatur sunt sed natus officia fuga accusamus reprehenderit ratione, provident possimus ut voluptatum.\n\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680726268),
('187d0e50d46afa4ab2f88628a649f4ae5', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:64:\"/var/www/html/minimal-blog/local/include_areas/templates/bio.php\";s:7:\"content\";N;}', 1, 1680756829),
('18c8a54811144b18bc602ad0b8b0c4b62', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:58:\"/var/www/html/minimal-blog/local/templates/main/header.php\";s:7:\"content\";s:9299:\"<?php\n\nuse Bitrix\\Main\\Page\\Asset;\n\nif (!defined(\"B_PROLOG_INCLUDED\") || B_PROLOG_INCLUDED !== true) {\n    die();\n}\n\n/**\n * @global $APPLICATION\n */\n\n$asset = Asset::getInstance();\n$asset->addString(\"<link href=\'https://fonts.googleapis.com/css?family=Josefin+Sans:300, 400,700\' rel=\'stylesheet\'>\");\n$asset->addCss(MARKUP_PATH . \"css/bootstrap.css\");\n$asset->addCss(MARKUP_PATH . \"css/animate.css\");\n$asset->addCss(MARKUP_PATH . \"css/owl.carousel.min.css\");\n$asset->addCss(MARKUP_PATH . \"fonts/fontawesome/css/font-awesome.min.css\");\n$asset->addCss(MARKUP_PATH . \"fonts/flaticon/font/flaticon.css\");\n$asset->addCss(MARKUP_PATH . \"css/style.css\");\n\n$asset->addJs(MARKUP_PATH . \"js/jquery-3.2.1.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery-migrate-3.0.0.js\");\n$asset->addJs(MARKUP_PATH . \"js/popper.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/bootstrap.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/owl.carousel.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery.waypoints.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery.stellar.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/main.js\");\n?>\n\n<!doctype html>\n<html lang=\"<?= LANGUAGE_ID ?>\">\n<head>\n    <title><?php $APPLICATION->ShowTitle(); ?></title>\n    <meta charset=\"utf-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n    <?php $APPLICATION->ShowHead(); ?>\n</head>\n<body>\n<?php $APPLICATION->ShowPanel(); ?>\n\n<header role=\"banner\">\n    <div class=\"top-bar\">\n        <div class=\"container\">\n            <div class=\"row\">\n                <div class=\"col-9 social\">\n                    <a href=\"#\"><span class=\"fa fa-twitter\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-facebook\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-instagram\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-youtube-play\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-vimeo\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-snapchat\"></span></a>\n                </div>\n                <div class=\"col-3 search-top\">\n                    <!-- <a href=\"#\"><span class=\"fa fa-search\"></span></a> -->\n                    <form action=\"#\" class=\"search-top-form\">\n                        <span class=\"icon fa fa-search\"></span>\n                        <input type=\"text\" id=\"s\" placeholder=\"Type keyword to search...\">\n                    </form>\n                </div>\n            </div>\n        </div>\n    </div>\n\n    <div class=\"container logo-wrap\">\n        <div class=\"row pt-5\">\n            <div class=\"col-12 text-center\">\n                <a class=\"absolute-toggle d-block d-md-none\" data-toggle=\"collapse\" href=\"#navbarMenu\" role=\"button\"\n                   aria-expanded=\"false\" aria-controls=\"navbarMenu\"><span class=\"burger-lines\"></span></a>\n                <h1 class=\"site-logo\"><a href=\"index.html\">Balita</a></h1>\n            </div>\n        </div>\n    </div>\n\n    <nav class=\"navbar navbar-expand-md  navbar-light bg-light\">\n        <div class=\"container\">\n            <div class=\"collapse navbar-collapse\" id=\"navbarMenu\">\n                <ul class=\"navbar-nav mx-auto\">\n                    <li class=\"nav-item\">\n                        <a class=\"nav-link active\" href=\"index.html\">Home</a>\n                    </li>\n\n                    <li class=\"nav-item dropdown\">\n                        <a class=\"nav-link dropdown-toggle\" href=\"category.html\" id=\"dropdown05\" data-toggle=\"dropdown\"\n                           aria-haspopup=\"true\" aria-expanded=\"false\">Categories</a>\n                        <div class=\"dropdown-menu\" aria-labelledby=\"dropdown05\">\n                            <a class=\"dropdown-item\" href=\"category.html\">Lifestyle</a>\n                            <a class=\"dropdown-item\" href=\"category.html\">Food</a>\n                            <a class=\"dropdown-item\" href=\"category.html\">Adventure</a>\n                            <a class=\"dropdown-item\" href=\"category.html\">Travel</a>\n                            <a class=\"dropdown-item\" href=\"category.html\">Business</a>\n                        </div>\n\n                    </li>\n                    <li class=\"nav-item\">\n                        <a class=\"nav-link\" href=\"about.html\">About</a>\n                    </li>\n                    <li class=\"nav-item\">\n                        <a class=\"nav-link\" href=\"contact.html\">Contact</a>\n                    </li>\n                </ul>\n\n            </div>\n            <?php\n            $APPLICATION->IncludeComponent(\n	\"bitrix:menu\", \n	\".default\", \n	array(\n		\"ALLOW_MULTI_SELECT\" => \"N\",\n		\"CHILD_MENU_TYPE\" => \"left\",\n		\"DELAY\" => \"N\",\n		\"MAX_LEVEL\" => \"2\",\n		\"MENU_CACHE_GET_VARS\" => array(\n		),\n		\"MENU_CACHE_TIME\" => \"3600\",\n		\"MENU_CACHE_TYPE\" => \"N\",\n		\"MENU_CACHE_USE_GROUPS\" => \"Y\",\n		\"ROOT_MENU_TYPE\" => \"top\",\n		\"USE_EXT\" => \"N\",\n		\"COMPONENT_TEMPLATE\" => \".default\"\n	),\n	false\n); ?>\n        </div\n    </nav>\n</header>\n\n<section class=\"site-section pt-5\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-12\">\n\n                <div class=\"owl-carousel owl-theme home-slider\">\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\" style=\"background-image: url(\'<?=MARKUP_PATH?>images/img_1.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\" style=\"background-image: url(\'<?=MARKUP_PATH?>images/img_2.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\" style=\"background-image: url(\'<?=MARKUP_PATH?>images/img_3.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\" style=\"background-image: url(\'<?=MARKUP_PATH?>images/img_3.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                </div>\n\n            </div>\n        </div>\n    </div>\n</section>\n\n<section class=\"site-section py-sm\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-6\">\n                <h2 class=\"mb-4\">Lifestyle Category</h2>\n            </div>\n        </div>\n        <div class=\"row blog-entries\">\n            <div class=\"col-md-12 col-lg-8 main-content\">\n						\";}', 1, 1680451213),
('18d8e6d313a3454677e95c86028137060', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:904:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/header.php\');\n/** @global $APPLICATION */\n?>\n<?php $res = $APPLICATION->IncludeComponent(\n	\"project:blog.element.list\", \n	\"mainpage\", \n	array(\n		\"CACHE_TIME\" => \"3600\",\n		\"CACHE_TYPE\" => \"A\",\n		\"COMPONENT_TEMPLATE\" => \"mainpage\",\n		\"COUNT\" => \"4\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"SECTION_CODE\" => \"lifestyle\",\n		\"SHOW_NAV\" => \"Y\",\n		\"SORT_DIRECTION1\" => \"ASC\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"PAGER_TEMPLATE\" => \"project.main\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"N\",\n		\"PAGER_TITLE\" => \"Навигация\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\"\n	),\n	false\n); ?>\n<?php\n$APPLICATION->SetTitle($res[\'TITLE\']);\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/footer.php\');\n?>\";}', 1, 1680719148),
('190c1fba1ba377a2350e6b869dc5f3780', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:42:\"/var/www/html/minimal-blog/about/index.php\";s:7:\"content\";s:1963:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Hi There! I\'m Meagan Smith\");\n?><img width=\"800\" alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" height=\"534\" title=\"img_6.jpg\"> <br>\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\">\n<tbody>\n<tr>\n	<td>\n <img width=\"400\" alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" height=\"267\" title=\"img_6.jpg\">\n	</td>\n	<td>\n <img width=\"400\" alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" height=\"267\" title=\"img_6.jpg\">\n	</td>\n</tr>\n</tbody>\n</table>\n Lorem ipsum dolor sit amet, consectetur adipisicin&nbsp;g elit. Ipsum minima eveniet&nbsp;recusandae suscipit eum laboriosam fugit amet deleniti iste et.\n<p>\n</p>\n<p>\n	 Ad dolores, necessitatibus non saepe tenetur impedit commodi quibusdam natus repellat, exercitationem accusantium perferendis officiis. Laboriosam impedit quia minus pariatur! Dignissimos iste consectetur, nemo magnam nulla suscipit eius quibusdam, quo aperiam quia quae est explicabo nostrum ab aliquid vitae obcaecati tenetur beatae animi fugiat officia id ipsam sint?\n</p>\n<p>\n	 Obcaecati ea nisi fugit assumenda error totam molestiae saepe fugiat officiis quam? Culpa porro quod doloribus dolore sint. Distinctio facilis ullam voluptas nemo voluptatum saepe repudiandae adipisci officiis, explicabo eaque itaque sed necessitatibus, fuga, ea eius et aliquam dignissimos repellendus impedit pariatur voluptates. Dicta perferendis assumenda, nihil placeat, illum quibusdam. Vel, incidunt?\n</p>\n Dolorum blanditiis illum quo quaerat, possimus praesentium perferendis! Quod autem optio nobis, placeat officiis dolorem praesentium odit. Vel, cum, a. Adipisci eligendi eaque laudantium dicta tenetur quod, pariatur sunt sed natus officia fuga accusamus reprehenderit ratione, provident possimus ut voluptatum.\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680725759),
('196dbaefa5de02f34ac8af77ea5b10751', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:47:\"/var/www/html/minimal-blog/categories/index.php\";s:7:\"content\";s:837:\"<?php\nrequire($_SERVER[\"DOCUMENT_ROOT\"] . \"/bitrix/header.php\");\n\n/**\n * @global $APPLICATION\n */\n$APPLICATION->SetTitle(\"My Blog\");\n?>\n<?php $APPLICATION->IncludeComponent(\n	\"project:blog\", \n	\"blog\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"blog\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_DIRECTION1\" => \"DESC\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"COUNT\" => \"10\",\n		\"SHOW_NAV\" => \"Y\",\n		\"SEF_MODE\" => \"Y\",\n		\"SEF_FOLDER\" => \"/categories/\",\n		\"AJAX\" => \"Y\",\n		\"AJAX_KEY\" => \"AJAX\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"3600\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"index\" => \"index.php\",\n			\"section\" => \"#SECTION_CODE#/\",\n			\"detail\" => \"#SECTION_CODE#/#ELEMENT_CODE#/\",\n		)\n	),\n	false\n); ?>\n<?php require($_SERVER[\"DOCUMENT_ROOT\"] . \"/bitrix/footer.php\"); ?>\";}', 1, 1680720314),
('1992f37e7e4f6c2fc59b771807f94fba4', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:635:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/header.php\');\n/** @global $APPLICATION */\n$APPLICATION->SetTitle(\'Главная\');\n?>\n\n<?php\n$APPLICATION->IncludeComponent(\n	\"project:blog.element.list\", \n	\"mainpage\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"mainpage\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"SECTION_CODE\" => \"\",\n		\"SHOW_NAV\" => \"Y\",\n		\"COUNT\" => \"5\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_DIRECTION1\" => \"ASC\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"3600\"\n	),\n	false\n); ?>\n<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/footer.php\');\n?>\";}', 1, 1680498725),
('1a06ec8b50aa0c12cdfdffcc9e3c3a9e4', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:647:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/header.php\');\n/** @global $APPLICATION */\n$APPLICATION->SetTitle(\'Главная\');\n?>\n<?php\n$APPLICATION->IncludeComponent(\n	\"project:blog.element.list\", \n	\"mainpage\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"mainpage\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"SECTION_CODE\" => \"lifestyle\",\n		\"SHOW_NAV\" => \"Y\",\n		\"COUNT\" => \"5\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_DIRECTION1\" => \"ASC\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"3600\"\n	),\n	false\n); ?>\n<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/footer.php\');\n?>\";}', 1, 1680637679),
('1a5fd4be22c8df1e17387d8af002a7e12', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:47:\"/var/www/html/minimal-blog/categories/index.php\";s:7:\"content\";s:970:\"<?php\nrequire($_SERVER[\"DOCUMENT_ROOT\"] . \"/bitrix/header.php\");\n\n/**\n * @global $APPLICATION\n */\n$APPLICATION->SetTitle(\"categories\");\n?>\n<?php $APPLICATION->IncludeComponent(\n    \"project:blog\",\n    \"blog\",\n    [\n        \"COMPONENT_TEMPLATE\" => \"blog\",\n        \"IBLOCK_TYPE\" => \"blog\",\n        \"IBLOCK_CODE\" => \"Posts\",\n        \"SORT_FIELD1\" => \"ACTIVE_FROM\",\n        \"SORT_DIRECTION1\" => \"DESC\",\n        \"SORT_FIELD2\" => \"SORT\",\n        \"SORT_DIRECTION2\" => \"ASC\",\n        \"COUNT\" => \"10\",\n        \"SHOW_NAV\" => \"Y\",\n        \"SEF_MODE\" => \"Y\",\n        \"SEF_FOLDER\" => \"/categories/\",\n        \"AJAX\" => \"N\",\n        \"AJAX_KEY\" => \"AJAX\",\n        \"CACHE_TYPE\" => \"A\",\n        \"CACHE_TIME\" => \"3600\",\n        \"SEF_URL_TEMPLATES\" => [\n            \"index\" => \"index.php\",\n            \"detail\" => \"#SECTION_CODE#/#ELEMENT_CODE#/\",\n            \"section\" => \"#SECTION_CODE#/\",\n        ],\n    ],\n    []\n); ?>\n<?php require($_SERVER[\"DOCUMENT_ROOT\"] . \"/bitrix/footer.php\"); ?>\";}', 1, 1680643876),
('1a85da43173cc45c4d428a847a49d05a0', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:44:\"/var/www/html/minimal-blog/contact/index.php\";s:7:\"content\";s:542:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Contact\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\", \n	\".default\", \n	array(\n		\"USE_CAPTCHA\" => \"Y\",\n		\"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n		\"EMAIL_TO\" => \"my@email.com\",\n		\"REQUIRED_FIELDS\" => array(\n			0 => \"NAME\",\n			1 => \"EMAIL\",\n		),\n		\"EVENT_MESSAGE_ID\" => array(\n			0 => \"7\",\n		),\n		\"COMPONENT_TEMPLATE\" => \".default\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680754969),
('1ad9b5594e69895fb774db4962b6700f8', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:58:\"/var/www/html/minimal-blog/local/templates/main/header.php\";s:7:\"content\";s:3695:\"<?php\n\nuse Bitrix\\Main\\Page\\Asset;\n\nif (!defined(\"B_PROLOG_INCLUDED\") || B_PROLOG_INCLUDED !== true) {\n    die();\n}\n\n/**\n * @global $APPLICATION\n */\n\n$asset = Asset::getInstance();\n$asset->addString(\"<link href=\'https://fonts.googleapis.com/css?family=Josefin+Sans:300, 400,700\' rel=\'stylesheet\'>\");\n$asset->addCss(MARKUP_PATH . \"css/bootstrap.css\");\n$asset->addCss(MARKUP_PATH . \"css/animate.css\");\n$asset->addCss(MARKUP_PATH . \"css/owl.carousel.min.css\");\n$asset->addCss(MARKUP_PATH . \"fonts/fontawesome/css/font-awesome.min.css\");\n$asset->addCss(MARKUP_PATH . \"fonts/flaticon/font/flaticon.css\");\n$asset->addCss(MARKUP_PATH . \"css/style.css\");\n\n$asset->addJs(MARKUP_PATH . \"js/jquery-3.2.1.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery-migrate-3.0.0.js\");\n$asset->addJs(MARKUP_PATH . \"js/popper.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/bootstrap.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/owl.carousel.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery.waypoints.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery.stellar.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/main.js\");\n?>\n\n<!doctype html>\n<html lang=\"<?= LANGUAGE_ID ?>\">\n<head>\n    <title><?php $APPLICATION->ShowTitle(); ?></title>\n    <meta charset=\"utf-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n    <?php $APPLICATION->ShowHead(); ?>\n</head>\n<?php $APPLICATION->ShowPanel(); ?>\n\n<body>\n\n<header role=\"banner\">\n    <div class=\"top-bar\">\n        <div class=\"container\">\n            <div class=\"row\">\n                <?php $APPLICATION->IncludeComponent(\n                    \"project:social\",\n                    \"header\",\n                    [\n                        \"CACHE_TIME\" => \"3600\",\n                        \"CACHE_TYPE\" => \"A\",\n                    ]\n                ); ?>\n                <div class=\"col-3 search-top\">\n                    <!-- <a href=\"#\"><span class=\"fa fa-search\"></span></a> -->\n                    <form action=\"#\" class=\"search-top-form\">\n                        <span class=\"icon fa fa-search\"></span>\n                        <input type=\"text\" id=\"s\" placeholder=\"Type keyword to search...\">\n                    </form>\n                </div>\n            </div>\n        </div>\n    </div>\n\n    <div class=\"container logo-wrap\">\n        <div class=\"row pt-5\">\n            <div class=\"col-12 text-center\">\n                <a class=\"absolute-toggle d-block d-md-none\" data-toggle=\"collapse\" href=\"#navbarMenu\" role=\"button\"\n                   aria-expanded=\"false\" aria-controls=\"navbarMenu\"><span class=\"burger-lines\"></span></a>\n                <h1 class=\"site-logo\"><a href=\"index.html\">Balita</a></h1>\n            </div>\n        </div>\n    </div>\n    <?php\n    $APPLICATION->IncludeComponent(\n        \"bitrix:menu\",\n        \"header_top\",\n        [\n            \"ALLOW_MULTI_SELECT\" => \"N\",\n            \"CHILD_MENU_TYPE\" => \"left\",\n            \"DELAY\" => \"N\",\n            \"MAX_LEVEL\" => \"2\",\n            \"MENU_CACHE_GET_VARS\" => [\n            ],\n            \"MENU_CACHE_TIME\" => \"3600\",\n            \"MENU_CACHE_TYPE\" => \"A\",\n            \"MENU_CACHE_USE_GROUPS\" => \"Y\",\n            \"ROOT_MENU_TYPE\" => \"top\",\n            \"USE_EXT\" => \"Y\",\n            \"COMPONENT_TEMPLATE\" => \"header_top\",\n        ],\n        false\n    ); ?>\n</header>\n\n<?php\n$APPLICATION->IncludeComponent(\n    \"project:main.slider\",\n    \"mainpage\",\n    [\n        \"COMPONENT_TEMPLATE\" => \"mainpage\",\n    ],\n    false\n); ?>\n\n<section class=\"site-section py-sm\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-6\">\n                <h2 class=\"mb-4\">Lifestyle Category</h2>\n            </div>\n        </div>\n        <div class=\"row blog-entries\">\n						\";}', 1, 1680634656),
('1af1dd31b7471f1ee3fdcf1ceeedecb4c', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:644:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/header.php\');\n/** @global $APPLICATION */\n$APPLICATION->SetTitle(\'Главная\');\n?>\n\n<?php\n$APPLICATION->IncludeComponent(\n	\"project:blog.element.list\", \n	\"mainpage\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"mainpage\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"SECTION_CODE\" => \"lifestyle\",\n		\"SHOW_NAV\" => \"Y\",\n		\"COUNT\" => \"5\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_DIRECTION1\" => \"ASC\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"3600\"\n	),\n	false\n); ?>\n<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/footer.php\');\n?>\";}', 1, 1680498896),
('1b1145290d7215f639c51fd7b602e2d25', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:904:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/header.php\');\n/** @global $APPLICATION */\n?>\n<?php $res = $APPLICATION->IncludeComponent(\n	\"project:blog.element.list\", \n	\"mainpage\", \n	array(\n		\"CACHE_TIME\" => \"3600\",\n		\"CACHE_TYPE\" => \"A\",\n		\"COMPONENT_TEMPLATE\" => \"mainpage\",\n		\"COUNT\" => \"1\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"SECTION_CODE\" => \"lifestyle\",\n		\"SHOW_NAV\" => \"Y\",\n		\"SORT_DIRECTION1\" => \"ASC\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"PAGER_TEMPLATE\" => \"project.main\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"N\",\n		\"PAGER_TITLE\" => \"Навигация\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\"\n	),\n	false\n); ?>\n<?php\n$APPLICATION->SetTitle($res[\'TITLE\']);\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/footer.php\');\n?>\";}', 1, 1680654485),
('1b34287bc7416cb999405390dcd8f1612', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:63:\"/var/www/html/minimal-blog/local/include_areas/template/bio.php\";s:7:\"content\";s:755:\"<div class=\"sidebar-box\">\n    <div class=\"bio text-center\">\n        <img alt=\"Image Placeholder\" src=\"<?= MARKUP_PATH ?>images/person_1.jpg\" class=\"img-fluid\">\n        <div class=\"bio-body\">\n            <h2>Meagan Smith</h2>\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem facilis sunt\n                repellendus\n                excepturi beatae porro debitis voluptate nulla quo veniam fuga sit molestias minus.</p>\n            <p><a href=\"/about\" class=\"btn btn-primary btn-sm\">Read my bio</a></p>\n            <?$APPLICATION->IncludeComponent(\n	\"project:social\",\n	\"sidebar\",\n	Array(\n		\"CACHE_TIME\" => \"3600\",\n		\"CACHE_TYPE\" => \"A\",\n		\"COMPONENT_TEMPLATE\" => \"sidebar\"\n	)\n);?>\n        </div>\n    </div>\n</div><br>\";}', 1, 1680758196),
('1b3cc7c1b0976dc872a5488493beebfcc', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:58:\"/var/www/html/minimal-blog/local/templates/main/header.php\";s:7:\"content\";s:8031:\"<?php\n\nuse Bitrix\\Main\\Page\\Asset;\n\nif (!defined(\"B_PROLOG_INCLUDED\") || B_PROLOG_INCLUDED !== true) {\n    die();\n}\n\n/**\n * @global $APPLICATION\n */\n\n$asset = Asset::getInstance();\n$asset->addString(\"<link href=\'https://fonts.googleapis.com/css?family=Josefin+Sans:300, 400,700\' rel=\'stylesheet\'>\");\n$asset->addCss(MARKUP_PATH . \"css/bootstrap.css\");\n$asset->addCss(MARKUP_PATH . \"css/animate.css\");\n$asset->addCss(MARKUP_PATH . \"css/owl.carousel.min.css\");\n$asset->addCss(MARKUP_PATH . \"fonts/fontawesome/css/font-awesome.min.css\");\n$asset->addCss(MARKUP_PATH . \"fonts/flaticon/font/flaticon.css\");\n$asset->addCss(MARKUP_PATH . \"css/style.css\");\n\n$asset->addJs(MARKUP_PATH . \"js/jquery-3.2.1.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery-migrate-3.0.0.js\");\n$asset->addJs(MARKUP_PATH . \"js/popper.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/bootstrap.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/owl.carousel.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery.waypoints.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery.stellar.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/main.js\");\n?>\n\n<!doctype html>\n<html lang=\"<?= LANGUAGE_ID ?>\">\n<head>\n    <title><?php $APPLICATION->ShowTitle(); ?></title>\n    <meta charset=\"utf-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n    <?php $APPLICATION->ShowHead(); ?>\n</head>\n<body>\n<?php $APPLICATION->ShowPanel(); ?>\n\n<header role=\"banner\">\n    <div class=\"top-bar\">\n        <div class=\"container\">\n            <div class=\"row\">\n                <div class=\"col-9 social\">\n                    <a href=\"#\"><span class=\"fa fa-twitter\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-facebook\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-instagram\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-youtube-play\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-vimeo\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-snapchat\"></span></a>\n                </div>\n                <div class=\"col-3 search-top\">\n                    <!-- <a href=\"#\"><span class=\"fa fa-search\"></span></a> -->\n                    <form action=\"#\" class=\"search-top-form\">\n                        <span class=\"icon fa fa-search\"></span>\n                        <input type=\"text\" id=\"s\" placeholder=\"Type keyword to search...\">\n                    </form>\n                </div>\n            </div>\n        </div>\n    </div>\n\n    <div class=\"container logo-wrap\">\n        <div class=\"row pt-5\">\n            <div class=\"col-12 text-center\">\n                <a class=\"absolute-toggle d-block d-md-none\" data-toggle=\"collapse\" href=\"#navbarMenu\" role=\"button\"\n                   aria-expanded=\"false\" aria-controls=\"navbarMenu\"><span class=\"burger-lines\"></span></a>\n                <h1 class=\"site-logo\"><a href=\"index.html\">Balita</a></h1>\n            </div>\n        </div>\n    </div>\n    <?php\n    $APPLICATION->IncludeComponent(\n	\"bitrix:menu\", \n	\"header_top\", \n	array(\n		\"ALLOW_MULTI_SELECT\" => \"N\",\n		\"CHILD_MENU_TYPE\" => \"left\",\n		\"DELAY\" => \"N\",\n		\"MAX_LEVEL\" => \"2\",\n		\"MENU_CACHE_GET_VARS\" => array(\n		),\n		\"MENU_CACHE_TIME\" => \"3600\",\n		\"MENU_CACHE_TYPE\" => \"A\",\n		\"MENU_CACHE_USE_GROUPS\" => \"Y\",\n		\"ROOT_MENU_TYPE\" => \"top\",\n		\"USE_EXT\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"header_top\"\n	),\n	false\n); ?>\n    </div\n    </nav>\n</header>\n\n<section class=\"site-section pt-5\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-12\">\n\n                <div class=\"owl-carousel owl-theme home-slider\">\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_1.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_2.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_3.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_3.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                </div>\n\n            </div>\n        </div>\n    </div>\n</section>\n\n<section class=\"site-section py-sm\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-6\">\n                <h2 class=\"mb-4\">Lifestyle Category</h2>\n            </div>\n        </div>\n        <div class=\"row blog-entries\">\n            <div class=\"col-md-12 col-lg-8 main-content\">\n						\";}', 1, 1680454050),
('1b677df4c3bf907071892ece579b88346', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:719:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/header.php\');\n/** @global $APPLICATION */\n$APPLICATION->SetTitle(\'Главная\');\n?>\n<?php\n$APPLICATION->IncludeComponent(\n    \"project:blog.element.list\",\n    \"mainpage\",\n    [\n        \"COMPONENT_TEMPLATE\" => \"mainpage\",\n        \"IBLOCK_TYPE\" => \"blog\",\n        \"IBLOCK_CODE\" => \"Posts\",\n        \"SECTION_CODE\" => \"\",\n        \"SHOW_NAV\" => \"Y\",\n        \"COUNT\" => \"5\",\n        \"SORT_FIELD1\" => \"ACTIVE_FROM\",\n        \"SORT_DIRECTION1\" => \"ASC\",\n        \"SORT_FIELD2\" => \"SORT\",\n        \"SORT_DIRECTION2\" => \"ASC\",\n        \"CACHE_TYPE\" => \"A\",\n        \"CACHE_TIME\" => \"3600\",\n    ],\n    false\n); ?>\n<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/footer.php\');\n?>\";}', 1, 1680552050),
('1b797d768905c669d1c239910cc50cea8', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:809:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/header.php\');\n/** @global $APPLICATION */\n$APPLICATION->SetTitle(\"Главная\");\n?><?$APPLICATION->IncludeComponent(\n	\"project:blog.element.list\",\n	\"mainpage\",\n	Array(\n		\"CACHE_TIME\" => \"3600\",\n		\"CACHE_TYPE\" => \"A\",\n		\"COMPONENT_TEMPLATE\" => \"mainpage\",\n		\"COUNT\" => \"5\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"SECTION_CODE\" => \"lifestyle\",\n		\"SHOW_NAV\" => \"Y\",\n		\"SORT_DIRECTION1\" => \"ASC\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_FIELD2\" => \"SORT\"\n	)\n);?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.include\",\n	\"\",\n	Array(\n		\"AREA_FILE_SHOW\" => \"file\",\n		\"AREA_FILE_SUFFIX\" => \"inc\",\n		\"EDIT_TEMPLATE\" => \"\",\n		\"PATH\" => \"\"\n	)\n);?><?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/footer.php\');\n?>\";}', 1, 1680637702),
('1b9820df0b01b8f2f8e172ac468c16863', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:7539:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/header.php\');\n/** @global $APPLICATION */\n$APPLICATION->SetTitle(\'Главная\');\n//use Carbon\\Carbon;\n//$s = Carbon::now()->locale(Carbon::getLocale());\n////$s->format(\'m\');\n//var_dump($s->format(\'F j, Y\'));\n//blog.element.list\n?>\n<?php\n$APPLICATION->IncludeComponent(\n	\"project:blog.element.list\", \n	\"mainpage\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"mainpage\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"SECTION_CODE\" => \"food\",\n		\"SHOW_NAV\" => \"Y\",\n		\"COUNT\" => \"5\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_DIRECTION1\" => \"ASC\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"3600\"\n	),\n	false\n); ?>\n        <div class=\"row\">\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_5.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Food</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_6.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Travel</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_7.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Travel, Asia</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_8.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Travel</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_9.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Travel</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_10.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Lifestyle</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_11.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Lifestyle</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_12.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Food</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n        </div>\n\n        <div class=\"row\">\n            <div class=\"col-md-12 text-center\">\n                <nav aria-label=\"Page navigation\" class=\"text-center\">\n                    <ul class=\"pagination\">\n                        <li class=\"page-item  active\"><a class=\"page-link\" href=\"#\">Prev</a></li>\n                        <li class=\"page-item\"><a class=\"page-link\" href=\"#\">1</a></li>\n                        <li class=\"page-item\"><a class=\"page-link\" href=\"#\">2</a></li>\n                        <li class=\"page-item\"><a class=\"page-link\" href=\"#\">3</a></li>\n                        <li class=\"page-item\"><a class=\"page-link\" href=\"#\">Next</a></li>\n                    </ul>\n                </nav>\n            </div>\n        </div>\n\n\n    <!-- END main-content -->\n\n<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/footer.php\');\n?>\";}', 1, 1680476167),
('1b9a45de81bd640ec96f7016d089d97d1', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:42:\"/var/www/html/minimal-blog/about/index.php\";s:7:\"content\";s:1936:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Hi There! I\'m Meagan Smith\");\n?><img width=\"800\" alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" height=\"534\" title=\"img_6.jpg\"> <br>\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\">\n<tbody>\n<tr>\n	<td>\n <img width=\"400\" alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" height=\"267\" title=\"img_6.jpg\">\n	</td>\n	<td>\n	</td>\n</tr>\n</tbody>\n</table>\n <img alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" title=\"img_6.jpg\">Lorem ipsum dolor sit amet, consectetur adipisicin&nbsp;g elit. Ipsum minima eveniet&nbsp;recusandae suscipit eum laboriosam fugit amet deleniti iste et.\n<p>\n</p>\n<p>\n	 Ad dolores, necessitatibus non saepe tenetur impedit commodi quibusdam natus repellat, exercitationem accusantium perferendis officiis. Laboriosam impedit quia minus pariatur! Dignissimos iste consectetur, nemo magnam nulla suscipit eius quibusdam, quo aperiam quia quae est explicabo nostrum ab aliquid vitae obcaecati tenetur beatae animi fugiat officia id ipsam sint?\n</p>\n<p>\n	 Obcaecati ea nisi fugit assumenda error totam molestiae saepe fugiat officiis quam? Culpa porro quod doloribus dolore sint. Distinctio facilis ullam voluptas nemo voluptatum saepe repudiandae adipisci officiis, explicabo eaque itaque sed necessitatibus, fuga, ea eius et aliquam dignissimos repellendus impedit pariatur voluptates. Dicta perferendis assumenda, nihil placeat, illum quibusdam. Vel, incidunt?\n</p>\n Dolorum blanditiis illum quo quaerat, possimus praesentium perferendis! Quod autem optio nobis, placeat officiis dolorem praesentium odit. Vel, cum, a. Adipisci eligendi eaque laudantium dicta tenetur quod, pariatur sunt sed natus officia fuga accusamus reprehenderit ratione, provident possimus ut voluptatum.\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680726153),
('1baad367431b5ede9de8339a888088333', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:47:\"/var/www/html/minimal-blog/categories/index.php\";s:7:\"content\";s:838:\"<?php\nrequire($_SERVER[\"DOCUMENT_ROOT\"] . \"/bitrix/header.php\");\n\n/**\n * @global $APPLICATION\n */\n$APPLICATION->SetTitle(\"categories\");\n?>\n<?php $APPLICATION->IncludeComponent(\n	\"project:blog\", \n	\"blog\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"blog\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_DIRECTION1\" => \"DESC\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"COUNT\" => \"10\",\n		\"SHOW_NAV\" => \"Y\",\n		\"SEF_MODE\" => \"Y\",\n		\"SEF_FOLDER\" => \"/categories/\",\n		\"AJAX\" => \"N\",\n		\"AJAX_KEY\" => \"AJAX\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"3600\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"index\" => \"index.php\",\n			\"section\" => \"#SECTION_CODE#/\",\n			\"detail\" => \"#SECTION_CODE#/#ELEMENT_CODE#/\",\n		)\n	),false\n); ?>\n<?php require($_SERVER[\"DOCUMENT_ROOT\"] . \"/bitrix/footer.php\"); ?>\";}', 1, 1680644074),
('1bc854a06c0b255a236bb767f7ba12d72', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:651:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/header.php\');\n/** @global $APPLICATION */\n?>\n<?php $res = $APPLICATION->IncludeComponent(\n	\"project:blog.element.list\", \n	\"mainpage\", \n	array(\n		\"CACHE_TIME\" => \"3600\",\n		\"CACHE_TYPE\" => \"A\",\n		\"COMPONENT_TEMPLATE\" => \"mainpage\",\n		\"COUNT\" => \"1\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"SECTION_CODE\" => \"lifestyle\",\n		\"SHOW_NAV\" => \"Y\",\n		\"SORT_DIRECTION1\" => \"ASC\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_FIELD2\" => \"SORT\"\n	),\n	false\n); ?>\n<?php\n$APPLICATION->SetTitle($res[\'TITLE\']);\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/footer.php\');\n?>\";}', 1, 1680653525),
('1c2f5e0940f06f4738edb2ab5b86fa960', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:42:\"/var/www/html/minimal-blog/about/index.php\";s:7:\"content\";s:1594:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Hi There! I\'m Meagan Smith\");\n?><img  alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" class=\"img-fluid\" title=\"img_6.jpg\"> <br>\n <br>\n Lorem ipsum dolor sit amet, consectetur adipisicin&nbsp;g elit. Ipsum minima eveniet&nbsp;recusandae suscipit eum laboriosam fugit amet deleniti iste et.\n<p>\n</p>\n<p>\n	 Ad dolores, necessitatibus non saepe tenetur impedit commodi quibusdam natus repellat, exercitationem accusantium perferendis officiis. Laboriosam impedit quia minus pariatur! Dignissimos iste consectetur, nemo magnam nulla suscipit eius quibusdam, quo aperiam quia quae est explicabo nostrum ab aliquid vitae obcaecati tenetur beatae animi fugiat officia id ipsam sint?\n</p>\n<p>\n	 Obcaecati ea nisi fugit assumenda error totam molestiae saepe fugiat officiis quam? Culpa porro quod doloribus dolore sint. Distinctio facilis ullam voluptas nemo voluptatum saepe repudiandae adipisci officiis, explicabo eaque itaque sed necessitatibus, fuga, ea eius et aliquam dignissimos repellendus impedit pariatur voluptates. Dicta perferendis assumenda, nihil placeat, illum quibusdam. Vel, incidunt?\n</p>\n<p>\n	 Dolorum blanditiis illum quo quaerat, possimus praesentium perferendis! Quod autem optio nobis, placeat officiis dolorem praesentium odit. Vel, cum, a. Adipisci eligendi eaque laudantium dicta tenetur quod, pariatur sunt sed natus officia fuga accusamus reprehenderit ratione, provident possimus ut voluptatum.\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680726341),
('1c4923ff1cd7a9b1e19c432166fce971c', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:58:\"/var/www/html/minimal-blog/local/templates/main/header.php\";s:7:\"content\";s:8051:\"<?php\n\nuse Bitrix\\Main\\Page\\Asset;\n\nif (!defined(\"B_PROLOG_INCLUDED\") || B_PROLOG_INCLUDED !== true) {\n    die();\n}\n\n/**\n * @global $APPLICATION\n */\n\n$asset = Asset::getInstance();\n$asset->addString(\"<link href=\'https://fonts.googleapis.com/css?family=Josefin+Sans:300, 400,700\' rel=\'stylesheet\'>\");\n$asset->addCss(MARKUP_PATH . \"css/bootstrap.css\");\n$asset->addCss(MARKUP_PATH . \"css/animate.css\");\n$asset->addCss(MARKUP_PATH . \"css/owl.carousel.min.css\");\n$asset->addCss(MARKUP_PATH . \"fonts/fontawesome/css/font-awesome.min.css\");\n$asset->addCss(MARKUP_PATH . \"fonts/flaticon/font/flaticon.css\");\n$asset->addCss(MARKUP_PATH . \"css/style.css\");\n\n$asset->addJs(MARKUP_PATH . \"js/jquery-3.2.1.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery-migrate-3.0.0.js\");\n$asset->addJs(MARKUP_PATH . \"js/popper.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/bootstrap.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/owl.carousel.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery.waypoints.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery.stellar.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/main.js\");\n?>\n\n<!doctype html>\n<html lang=\"<?= LANGUAGE_ID ?>\">\n<head>\n    <title><?php $APPLICATION->ShowTitle(); ?></title>\n    <meta charset=\"utf-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n    <?php $APPLICATION->ShowHead(); ?>\n</head>\n<body>\n<?php $APPLICATION->ShowPanel(); ?>\n\n<header role=\"banner\">\n    <div class=\"top-bar\">\n        <div class=\"container\">\n            <div class=\"row\">\n                <div class=\"col-9 social\">\n                    <a href=\"#\"><span class=\"fa fa-twitter\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-facebook\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-instagram\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-youtube-play\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-vimeo\"></span></a>\n                    <a href=\"#\"><span class=\"fa fa-snapchat\"></span></a>\n                </div>\n                <div class=\"col-3 search-top\">\n                    <!-- <a href=\"#\"><span class=\"fa fa-search\"></span></a> -->\n                    <form action=\"#\" class=\"search-top-form\">\n                        <span class=\"icon fa fa-search\"></span>\n                        <input type=\"text\" id=\"s\" placeholder=\"Type keyword to search...\">\n                    </form>\n                </div>\n            </div>\n        </div>\n    </div>\n\n    <div class=\"container logo-wrap\">\n        <div class=\"row pt-5\">\n            <div class=\"col-12 text-center\">\n                <a class=\"absolute-toggle d-block d-md-none\" data-toggle=\"collapse\" href=\"#navbarMenu\" role=\"button\"\n                   aria-expanded=\"false\" aria-controls=\"navbarMenu\"><span class=\"burger-lines\"></span></a>\n                <h1 class=\"site-logo\"><a href=\"index.html\">Balita</a></h1>\n            </div>\n        </div>\n    </div>\n            <?php\n            $APPLICATION->IncludeComponent(\n	\"bitrix:menu\", \n	\"header_top\", \n	array(\n		\"ALLOW_MULTI_SELECT\" => \"N\",\n		\"CHILD_MENU_TYPE\" => \"left\",\n		\"DELAY\" => \"N\",\n		\"MAX_LEVEL\" => \"2\",\n		\"MENU_CACHE_GET_VARS\" => array(\n		),\n		\"MENU_CACHE_TIME\" => \"3600\",\n		\"MENU_CACHE_TYPE\" => \"A\",\n		\"MENU_CACHE_USE_GROUPS\" => \"Y\",\n		\"ROOT_MENU_TYPE\" => \"top\",\n		\"USE_EXT\" => \"Y\",\n		\"COMPONENT_TEMPLATE\" => \"header_top\"\n	),\n	false\n); ?>\n        </div\n    </nav>\n</header>\n\n<section class=\"site-section pt-5\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-12\">\n\n                <div class=\"owl-carousel owl-theme home-slider\">\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_1.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_2.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_3.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                    <div>\n                        <a href=\"blog-single.html\" class=\"a-block d-flex align-items-center height-lg\"\n                           style=\"background-image: url(\'<?= MARKUP_PATH ?>images/img_3.jpg\'); \">\n                            <div class=\"text half-to-full\">\n                                <div class=\"post-meta\">\n                                    <span class=\"category\">Lifestyle</span>\n                                    <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                                    <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                                </div>\n                                <h3>There’s a Cool New Way for Men to Wear Socks and Sandals</h3>\n                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quidem nobis, ut dicta\n                                    eaque ipsa laudantium!</p>\n                            </div>\n                        </a>\n                    </div>\n                </div>\n\n            </div>\n        </div>\n    </div>\n</section>\n\n<section class=\"site-section py-sm\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-6\">\n                <h2 class=\"mb-4\">Lifestyle Category</h2>\n            </div>\n        </div>\n        <div class=\"row blog-entries\">\n            <div class=\"col-md-12 col-lg-8 main-content\">\n						\";}', 1, 1680453423),
('1c66dce30ec62a16d33414d282848a1d1', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:47:\"/var/www/html/minimal-blog/categories/index.php\";s:7:\"content\";s:835:\"<?php\nrequire($_SERVER[\"DOCUMENT_ROOT\"] . \"/bitrix/header.php\");\n\n/**\n * @global $APPLICATION\n */\n$APPLICATION->SetTitle(\"My Blog\");\n?>\n<?php $APPLICATION->IncludeComponent(\n	\"project:blog\", \n	\"blog\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"blog\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_DIRECTION1\" => \"DESC\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"COUNT\" => \"10\",\n		\"SHOW_NAV\" => \"Y\",\n		\"SEF_MODE\" => \"Y\",\n		\"SEF_FOLDER\" => \"/categories/\",\n		\"AJAX\" => \"N\",\n		\"AJAX_KEY\" => \"AJAX\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"3600\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"index\" => \"index.php\",\n			\"section\" => \"#SECTION_CODE#\",\n			\"detail\" => \"#SECTION_CODE#/#ELEMENT_CODE#\",\n		)\n	),\n	false\n); ?>\n<?php require($_SERVER[\"DOCUMENT_ROOT\"] . \"/bitrix/footer.php\"); ?>\";}', 1, 1680645431),
('1ce4d5039e430045fd46cad095868e792', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:44:\"/var/www/html/minimal-blog/contact/index.php\";s:7:\"content\";s:526:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"contact\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\", \n	\".default\", \n	array(\n		\"USE_CAPTCHA\" => \"Y\",\n		\"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n		\"EMAIL_TO\" => \"my@email.com\",\n		\"REQUIRED_FIELDS\" => array(\n			0 => \"EMAIL\",\n		),\n		\"EVENT_MESSAGE_ID\" => array(\n			0 => \"7\",\n		),\n		\"COMPONENT_TEMPLATE\" => \".default\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680753623),
('1d51de1e06784cefb3fba79e8cf4cc389', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:7218:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/header.php\');\n/** @global $APPLICATION */\n$APPLICATION->SetTitle(\'Главная\');\n//use Carbon\\Carbon;\n//$s = Carbon::now()->locale(Carbon::getLocale());\n////$s->format(\'m\');\n//var_dump($s->format(\'F j, Y\'));\n//blog.element.list\n?>\n<?php\n$APPLICATION->IncludeComponent(\n    \"project:blog.element.list\",\n    \"mainpage\",\n    [\n    ],\n    false\n); ?>\n        <div class=\"row\">\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_5.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Food</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_6.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Travel</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_7.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Travel, Asia</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_8.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Travel</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_9.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Travel</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_10.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Lifestyle</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_11.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Lifestyle</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n            <div class=\"col-md-6\">\n                <a href=\"blog-single.html\" class=\"blog-entry element-animate\" data-animate-effect=\"fadeIn\">\n                    <img src=\"images/img_12.jpg\" alt=\"Image placeholder\">\n                    <div class=\"blog-content-body\">\n                        <div class=\"post-meta\">\n                            <span class=\"category\">Food</span>\n                            <span class=\"mr-2\">March 15, 2018 </span> &bullet;\n                            <span class=\"ml-2\"><span class=\"fa fa-comments\"></span> 3</span>\n                        </div>\n                        <h2>There’s a Cool New Way for Men to Wear Socks and Sandals</h2>\n                    </div>\n                </a>\n            </div>\n        </div>\n\n        <div class=\"row\">\n            <div class=\"col-md-12 text-center\">\n                <nav aria-label=\"Page navigation\" class=\"text-center\">\n                    <ul class=\"pagination\">\n                        <li class=\"page-item  active\"><a class=\"page-link\" href=\"#\">Prev</a></li>\n                        <li class=\"page-item\"><a class=\"page-link\" href=\"#\">1</a></li>\n                        <li class=\"page-item\"><a class=\"page-link\" href=\"#\">2</a></li>\n                        <li class=\"page-item\"><a class=\"page-link\" href=\"#\">3</a></li>\n                        <li class=\"page-item\"><a class=\"page-link\" href=\"#\">Next</a></li>\n                    </ul>\n                </nav>\n            </div>\n        </div>\n\n\n    <!-- END main-content -->\n\n<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'].\'/bitrix/footer.php\');\n?>\";}', 1, 1680473709),
('1d77671678eba991833fcbc37e107eca1', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:63:\"/var/www/html/minimal-blog/local/include_areas/template/bio.php\";s:7:\"content\";s:901:\"<div class=\"sidebar-box\">\n    <div class=\"bio text-center\">\n        <img src=\"<?= MARKUP_PATH ?>images/person_1.jpg\" alt=\"Image Placeholder\" class=\"img-fluid\">\n        <div class=\"bio-body\">\n            <h2>Meagan Smith</h2>\n            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Exercitationem facilis sunt\n                repellendus\n                excepturi beatae porro debitis voluptate nulla quo veniam fuga sit molestias minus.</p>\n            <p><a href=\"/about\" class=\"btn btn-primary btn-sm\">Read my bio</a></p>\n            <?php $APPLICATION->IncludeComponent(\n                \"project:social\",\n                \"sidebar\",\n                [\n                    \"CACHE_TIME\" => \"3600\",\n                    \"CACHE_TYPE\" => \"A\",\n                    \"COMPONENT_TEMPLATE\" => \"sidebar\",\n                ],\n                false\n            ); ?>\n        </div>\n    </div>\n</div>\";}', 1, 1680758176),
('1da22cab48868dcf17662f73815fa4d91', 'fileman', 'edit_menu', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:40:\"/var/www/html/minimal-blog/.top.menu.php\";s:7:\"content\";s:305:\"<?\n$aMenuLinks = Array(\n	Array(\n		\"home\", \n		\"/\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"categories\", \n		\"/categories/\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"about\", \n		\"/about\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"contact\", \n		\"/contact\", \n		Array(), \n		Array(), \n		\"\" \n	)\n);\n?>\";}', 1, 1680454019),
('1daea8a3b1fcd3af39a7abfe1956271c5', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:58:\"/var/www/html/minimal-blog/local/templates/main/header.php\";s:7:\"content\";s:3923:\"<?php\n\nuse Bitrix\\Main\\Page\\Asset;\n\nif (!defined(\"B_PROLOG_INCLUDED\") || B_PROLOG_INCLUDED !== true) {\n    die();\n}\n\n/**\n * @global $APPLICATION\n */\n\n$asset = Asset::getInstance();\n$asset->addString(\"<link href=\'https://fonts.googleapis.com/css?family=Josefin+Sans:300, 400,700\' rel=\'stylesheet\'>\");\n$asset->addCss(MARKUP_PATH . \"css/bootstrap.css\");\n$asset->addCss(MARKUP_PATH . \"css/animate.css\");\n$asset->addCss(MARKUP_PATH . \"css/owl.carousel.min.css\");\n$asset->addCss(MARKUP_PATH . \"fonts/fontawesome/css/font-awesome.min.css\");\n$asset->addCss(MARKUP_PATH . \"fonts/flaticon/font/flaticon.css\");\n$asset->addCss(MARKUP_PATH . \"css/style.css\");\n\n$asset->addJs(MARKUP_PATH . \"js/jquery-3.2.1.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery-migrate-3.0.0.js\");\n$asset->addJs(MARKUP_PATH . \"js/popper.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/bootstrap.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/owl.carousel.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery.waypoints.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/jquery.stellar.min.js\");\n$asset->addJs(MARKUP_PATH . \"js/main.js\");\n?>\n\n<!doctype html>\n<html lang=\"<?= LANGUAGE_ID ?>\">\n<head>\n    <title><?php $APPLICATION->ShowTitle(); ?></title>\n    <meta charset=\"utf-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n    <?php $APPLICATION->ShowHead(); ?>\n</head>\n<?php $APPLICATION->ShowPanel(); ?>\n\n<body>\n\n<header role=\"banner\">\n    <div class=\"top-bar\">\n        <div class=\"container\">\n            <div class=\"row\">\n                <?php $APPLICATION->IncludeComponent(\n                    \"project:social\",\n                    \"header\",\n                    [\n                        \"CACHE_TIME\" => \"3600\",\n                        \"CACHE_TYPE\" => \"A\",\n                    ]\n                ); ?>\n                <div class=\"col-3 search-top\">\n                    <!-- <a href=\"#\"><span class=\"fa fa-search\"></span></a> -->\n                    <form action=\"#\" class=\"search-top-form\">\n                        <span class=\"icon fa fa-search\"></span>\n                        <input type=\"text\" id=\"s\" placeholder=\"Type keyword to search...\">\n                    </form>\n                </div>\n            </div>\n        </div>\n    </div>\n\n    <div class=\"container logo-wrap\">\n        <div class=\"row pt-5\">\n            <div class=\"col-12 text-center\">\n                <a class=\"absolute-toggle d-block d-md-none\" data-toggle=\"collapse\" href=\"#navbarMenu\" role=\"button\"\n                   aria-expanded=\"false\" aria-controls=\"navbarMenu\"><span class=\"burger-lines\"></span></a>\n                <h1 class=\"site-logo\"><a href=\"index.html\">Balita</a></h1>\n            </div>\n        </div>\n    </div>\n    <?php\n    $APPLICATION->IncludeComponent(\n        \"bitrix:menu\",\n        \"header_top\",\n        [\n            \"ALLOW_MULTI_SELECT\" => \"N\",\n            \"CHILD_MENU_TYPE\" => \"left\",\n            \"DELAY\" => \"N\",\n            \"MAX_LEVEL\" => \"2\",\n            \"MENU_CACHE_GET_VARS\" => [\n            ],\n            \"MENU_CACHE_TIME\" => \"3600\",\n            \"MENU_CACHE_TYPE\" => \"A\",\n            \"MENU_CACHE_USE_GROUPS\" => \"Y\",\n            \"ROOT_MENU_TYPE\" => \"top\",\n            \"USE_EXT\" => \"Y\",\n            \"COMPONENT_TEMPLATE\" => \"header_top\",\n        ],\n        false\n    ); ?>\n</header>\n\n<?php\n$APPLICATION->IncludeComponent(\n	\"project:main.slider\", \n	\"mainpage\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"mainpage\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"COUNT\" => \"8\",\n		\"SORT_FIELD1\" => \"SORT\",\n		\"SORT_DIRECTION1\" => \"ASC\",\n		\"SORT_FIELD2\" => \"ACTIVE_FROM\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"3600\"\n	),\n	false\n); ?>\n\n<section class=\"site-section py-sm\">\n    <div class=\"container\">\n        <div class=\"row\">\n            <div class=\"col-md-6\">\n                <h2 class=\"mb-4\">Lifestyle Category</h2>\n            </div>\n        </div>\n        <div class=\"row blog-entries\">\n						\";}', 1, 1680634987),
('1dea50ed69a33cba7a7f832ed11dd6906', 'fileman', 'edit_menu', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:40:\"/var/www/html/minimal-blog/.top.menu.php\";s:7:\"content\";s:227:\"<?\n$aMenuLinks = Array(\n	Array(\n		\"home\", \n		\"/\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"about\", \n		\"/about\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"contact\", \n		\"/contact\", \n		Array(), \n		Array(), \n		\"\" \n	)\n);\n?>\";}', 1, 1680454195),
('1df80d1509ab91cd3aaf61da8ed93bf5d', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:4:{s:7:\"absPath\";s:50:\"/var/www/html/minimal-blog/categories/novyy-razdel\";s:4:\"path\";s:24:\"/categories/novyy-razdel\";s:4:\"site\";s:2:\"s1\";s:4:\"menu\";a:3:{s:8:\"menuFile\";s:26:\"/categories/.left.menu.php\";s:8:\"menuName\";s:23:\"Новый раздел\";s:8:\"menuPath\";s:25:\"/categories/novyy-razdel/\";}}', 1, 1680453319),
('1e0d8628b6e6221b9d68e086a89bf19ba', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:47:\"/var/www/html/minimal-blog/categories/index.php\";s:7:\"content\";s:836:\"<?php\nrequire($_SERVER[\"DOCUMENT_ROOT\"] . \"/bitrix/header.php\");\n\n/**\n * @global $APPLICATION\n */\n$APPLICATION->SetTitle(\"My Blog\");\n?>\n<?php $APPLICATION->IncludeComponent(\n	\"project:blog\", \n	\"blog\", \n	array(\n		\"COMPONENT_TEMPLATE\" => \"blog\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_DIRECTION1\" => \"DESC\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"COUNT\" => \"8\",\n		\"SHOW_NAV\" => \"Y\",\n		\"SEF_MODE\" => \"Y\",\n		\"SEF_FOLDER\" => \"/categories/\",\n		\"AJAX\" => \"Y\",\n		\"AJAX_KEY\" => \"AJAX\",\n		\"CACHE_TYPE\" => \"A\",\n		\"CACHE_TIME\" => \"3600\",\n		\"SEF_URL_TEMPLATES\" => array(\n			\"index\" => \"index.php\",\n			\"section\" => \"#SECTION_CODE#/\",\n			\"detail\" => \"#SECTION_CODE#/#ELEMENT_CODE#/\",\n		)\n	),\n	false\n); ?>\n<?php require($_SERVER[\"DOCUMENT_ROOT\"] . \"/bitrix/footer.php\"); ?>\";}', 1, 1680720333),
('1e4c0bc945e505efcd2d0e142594d5b50', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:42:\"/var/www/html/minimal-blog/about/index.php\";s:7:\"content\";s:1966:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Hi There! I\'m Meagan Smith\");\n?><img width=\"800\" alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" height=\"534\" title=\"img_6.jpg\"> <br>\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\">\n<tbody>\n<tr>\n	<td>\n <img width=\"400\" alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" height=\"267\" title=\"img_6.jpg\">&\n	</td>\n	<td>\n		 <img width=\"400\" alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" height=\"267\" title=\"img_6.jpg\">\n	</td>\n</tr>\n</tbody>\n</table>\n Lorem ipsum dolor sit amet, consectetur adipisicin&nbsp;g elit. Ipsum minima eveniet&nbsp;recusandae suscipit eum laboriosam fugit amet deleniti iste et.\n<p>\n</p>\n<p>\n	 Ad dolores, necessitatibus non saepe tenetur impedit commodi quibusdam natus repellat, exercitationem accusantium perferendis officiis. Laboriosam impedit quia minus pariatur! Dignissimos iste consectetur, nemo magnam nulla suscipit eius quibusdam, quo aperiam quia quae est explicabo nostrum ab aliquid vitae obcaecati tenetur beatae animi fugiat officia id ipsam sint?\n</p>\n<p>\n	 Obcaecati ea nisi fugit assumenda error totam molestiae saepe fugiat officiis quam? Culpa porro quod doloribus dolore sint. Distinctio facilis ullam voluptas nemo voluptatum saepe repudiandae adipisci officiis, explicabo eaque itaque sed necessitatibus, fuga, ea eius et aliquam dignissimos repellendus impedit pariatur voluptates. Dicta perferendis assumenda, nihil placeat, illum quibusdam. Vel, incidunt?\n</p>\n Dolorum blanditiis illum quo quaerat, possimus praesentium perferendis! Quod autem optio nobis, placeat officiis dolorem praesentium odit. Vel, cum, a. Adipisci eligendi eaque laudantium dicta tenetur quod, pariatur sunt sed natus officia fuga accusamus reprehenderit ratione, provident possimus ut voluptatum.\n<p>\n</p><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680725696),
('1f12c86f1723d52b601c7259af594c649', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:904:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/header.php\');\n/** @global $APPLICATION */\n?>\n<?php $res = $APPLICATION->IncludeComponent(\n	\"project:blog.element.list\", \n	\"mainpage\", \n	array(\n		\"CACHE_TIME\" => \"3600\",\n		\"CACHE_TYPE\" => \"A\",\n		\"COMPONENT_TEMPLATE\" => \"mainpage\",\n		\"COUNT\" => \"1\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"SECTION_CODE\" => \"lifestyle\",\n		\"SHOW_NAV\" => \"Y\",\n		\"SORT_DIRECTION1\" => \"ASC\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"PAGER_TEMPLATE\" => \"project.main\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"N\",\n		\"PAGER_TITLE\" => \"Навигация\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\"\n	),\n	false\n); ?>\n<?php\n$APPLICATION->SetTitle($res[\'TITLE\']);\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/footer.php\');\n?>\";}', 1, 1680719204),
('1f2e51c8e63cb3b06dccb2e1e76eb6811', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:3:{s:7:\"absPath\";s:34:\"/var/www/html/minimal-blog/contact\";s:4:\"path\";s:8:\"/contact\";s:4:\"site\";s:2:\"s1\";}', 1, 1680749057),
('1f6346fba239cf008f983a1546e5e08d6', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:47:\"/var/www/html/minimal-blog/categories/index.php\";s:7:\"content\";s:663:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"categories\");\n?>\n\n<?php\n$APPLICATION->IncludeComponent(\n    \"bitrix:menu\",\n    \"header_top\",\n    array(\n        \"ALLOW_MULTI_SELECT\" => \"N\",\n        \"CHILD_MENU_TYPE\" => \"\",\n        \"DELAY\" => \"N\",\n        \"MAX_LEVEL\" => \"2\",\n        \"MENU_CACHE_GET_VARS\" => array(\n        ),\n        \"MENU_CACHE_TIME\" => \"3600\",\n        \"MENU_CACHE_TYPE\" => \"A\",\n        \"MENU_CACHE_USE_GROUPS\" => \"Y\",\n        \"ROOT_MENU_TYPE\" => \"left\",\n        \"USE_EXT\" => \"Y\",\n        \"COMPONENT_TEMPLATE\" => \"header_top\"\n    ),\n    false\n); ?>\n\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680454216),
('1fa507670adb31a4c75d19e8ace3ea687', 'fileman', 'new_file', 'CFileman::UndoNewFile', 'a:4:{s:7:\"absPath\";s:39:\"/var/www/html/minimal-blog/new-page.php\";s:4:\"path\";s:13:\"/new-page.php\";s:4:\"site\";s:2:\"s1\";s:6:\"public\";s:1:\"Y\";}', 1, 1680402526),
('1fabcd52eea95d52115c2056d2f3e7f19', 'fileman', 'new_section', 'CFileman::UndoNewSection', 'a:3:{s:7:\"absPath\";s:32:\"/var/www/html/minimal-blog/about\";s:4:\"path\";s:6:\"/about\";s:4:\"site\";s:2:\"s1\";}', 1, 1680719367),
('1fc895704166db472dc42287e77bbd16a', 'fileman', 'edit_component_props', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:36:\"/var/www/html/minimal-blog/index.php\";s:7:\"content\";s:1095:\"<?php\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/header.php\');\n$APPLICATION->SetTitle(\"\");\n/** @global $APPLICATION */\n?>\n<?php $res = $APPLICATION->IncludeComponent(\n	\"project:blog.element.list\", \n	\"mainpage\", \n	array(\n		\"CACHE_TIME\" => \"3600\",\n		\"CACHE_TYPE\" => \"A\",\n		\"COMPONENT_TEMPLATE\" => \"mainpage\",\n		\"COUNT\" => \"6\",\n		\"IBLOCK_CODE\" => \"Posts\",\n		\"IBLOCK_TYPE\" => \"blog\",\n		\"SECTION_CODE\" => \"lifestyle\",\n		\"SHOW_NAV\" => \"Y\",\n		\"SORT_DIRECTION1\" => \"ASC\",\n		\"SORT_DIRECTION2\" => \"ASC\",\n		\"SORT_FIELD1\" => \"ACTIVE_FROM\",\n		\"SORT_FIELD2\" => \"SORT\",\n		\"PAGER_TEMPLATE\" => \"project.main\",\n		\"DISPLAY_TOP_PAGER\" => \"N\",\n		\"DISPLAY_BOTTOM_PAGER\" => \"N\",\n		\"PAGER_TITLE\" => \"Навигация\",\n		\"PAGER_SHOW_ALWAYS\" => \"N\",\n		\"PAGER_DESC_NUMBERING\" => \"N\",\n		\"PAGER_DESC_NUMBERING_CACHE_TIME\" => \"36000\"\n	),\n	false\n); ?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.include\",\n	\"\",\n	Array(\n		\"AREA_FILE_SHOW\" => \"page\",\n		\"AREA_FILE_SUFFIX\" => \"inc\",\n		\"EDIT_TEMPLATE\" => \"\"\n	)\n);?>\n<?php\n$APPLICATION->SetTitle($res[\'TITLE\']);\nrequire($_SERVER[\'DOCUMENT_ROOT\'] . \'/bitrix/footer.php\');\n?>\";}', 1, 1680756761),
('1fce0543dd6d6d54c75c0757b6a4acc26', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:44:\"/var/www/html/minimal-blog/contact/index.php\";s:7:\"content\";s:542:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"Contact\");\n?><?$APPLICATION->IncludeComponent(\n	\"bitrix:main.feedback\", \n	\".default\", \n	array(\n		\"USE_CAPTCHA\" => \"N\",\n		\"OK_TEXT\" => \"Спасибо, ваше сообщение принято.\",\n		\"EMAIL_TO\" => \"my@email.com\",\n		\"REQUIRED_FIELDS\" => array(\n			0 => \"NAME\",\n			1 => \"EMAIL\",\n		),\n		\"EVENT_MESSAGE_ID\" => array(\n			0 => \"7\",\n		),\n		\"COMPONENT_TEMPLATE\" => \".default\"\n	),\n	false\n);?><?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680756646),
('1ff0c266ec2f953e56d04b056a5c53c35', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:42:\"/var/www/html/minimal-blog/about/index.php\";s:7:\"content\";s:172:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"about\");\n?>\n\nText here....\n\n<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680719498),
('1ff5bef818c756d620ca43792d1768b5d', 'fileman', 'edit_file', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:42:\"/var/www/html/minimal-blog/about/index.php\";s:7:\"content\";s:1517:\"<?\nrequire($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/header.php\");\n$APPLICATION->SetTitle(\"about\");\n?><img width=\"800\" alt=\"img_6.jpg\" src=\"/upload/iblock/47a/l7mdsxjlbj93n0yhzg2snf3y0w9t3qtn.jpg\" height=\"534\" title=\"img_6.jpg\">\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsum minima eveniet recusandae suscipit eum laboriosam fugit amet deleniti iste et. Ad dolores, necessitatibus non saepe tenetur impedit commodi quibusdam natus repellat, exercitationem accusantium perferendis officiis. Laboriosam impedit quia minus pariatur!\n\nDignissimos iste consectetur, nemo magnam nulla suscipit eius quibusdam, quo aperiam quia quae est explicabo nostrum ab aliquid vitae obcaecati tenetur beatae animi fugiat officia id ipsam sint? Obcaecati ea nisi fugit assumenda error totam molestiae saepe fugiat officiis quam?\n\nCulpa porro quod doloribus dolore sint. Distinctio facilis ullam voluptas nemo voluptatum saepe repudiandae adipisci officiis, explicabo eaque itaque sed necessitatibus, fuga, ea eius et aliquam dignissimos repellendus impedit pariatur voluptates. Dicta perferendis assumenda, nihil placeat, illum quibusdam. Vel, incidunt?\n\nDolorum blanditiis illum quo quaerat, possimus praesentium perferendis! Quod autem optio nobis, placeat officiis dolorem praesentium odit. Vel, cum, a. Adipisci eligendi eaque laudantium dicta tenetur quod, pariatur sunt sed natus officia fuga accusamus reprehenderit ratione, provident possimus ut voluptatum.<?require($_SERVER[\"DOCUMENT_ROOT\"].\"/bitrix/footer.php\");?>\";}', 1, 1680725408),
('1ffc3e8e40a365b0bca49399a81da55a0', 'fileman', 'edit_menu', 'CFileman::UndoEditFile', 'a:2:{s:7:\"absPath\";s:40:\"/var/www/html/minimal-blog/.top.menu.php\";s:7:\"content\";s:304:\"<?\n$aMenuLinks = Array(\n	Array(\n		\"home\", \n		\"/\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"about\", \n		\"/about\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"contact\", \n		\"/contact\", \n		Array(), \n		Array(), \n		\"\" \n	),\n	Array(\n		\"categories\", \n		\"/categories\", \n		Array(), \n		Array(), \n		\"\" \n	)\n);\n?>\";}', 1, 1680454347),
('2d98f28ed2cc75235a1e621e4841577a2', 'main', 'autosave', 'CAutoSave::_Restore', 'a:22:{s:10:\"EVENT_NAME\";s:13:\"FEEDBACK_FORM\";s:10:\"EVENT_TYPE\";s:5:\"email\";s:2:\"ru\";s:1:\"Y\";s:42:\"FIELDSX000091XruX000093XX000091XIDX000093X\";s:1:\"7\";s:48:\"FIELDS_OLDX000091XruX000093XX000091XSORTX000093X\";s:1:\"7\";s:44:\"FIELDSX000091XruX000093XX000091XSORTX000093X\";s:1:\"7\";s:48:\"FIELDS_OLDX000091XruX000093XX000091XNAMEX000093X\";s:85:\"Отправка сообщения через форму обратной связи\";s:44:\"FIELDSX000091XruX000093XX000091XNAMEX000093X\";s:85:\"Отправка сообщения через форму обратной связи\";s:55:\"FIELDS_OLDX000091XruX000093XX000091XDESCRIPTIONX000093X\";s:244:\"#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\";s:51:\"FIELDSX000091XruX000093XX000091XDESCRIPTIONX000093X\";s:294:\"#AUTHOR# - Автор сообщения\n#AUTHOR_EMAIL# - Email автора сообщения\n#TEXT# - Текст сообщения\n#EMAIL_FROM# - Email отправителя письма\n#EMAIL_TO# - Email получателя письма\n#PHONE# - Email получателя письма\";s:2:\"en\";s:1:\"Y\";s:42:\"FIELDSX000091XenX000093XX000091XIDX000093X\";s:2:\"20\";s:48:\"FIELDS_OLDX000091XenX000093XX000091XSORTX000093X\";s:1:\"7\";s:44:\"FIELDSX000091XenX000093XX000091XSORTX000093X\";s:1:\"7\";s:48:\"FIELDS_OLDX000091XenX000093XX000091XNAMEX000093X\";s:39:\"Sending a message using a feedback form\";s:44:\"FIELDSX000091XenX000093XX000091XNAMEX000093X\";s:39:\"Sending a message using a feedback form\";s:55:\"FIELDS_OLDX000091XenX000093XX000091XDESCRIPTIONX000093X\";s:167:\"#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address\";s:51:\"FIELDSX000091XenX000093XX000091XDESCRIPTIONX000093X\";s:167:\"#AUTHOR# - Message author\n#AUTHOR_EMAIL# - Author\'s e-mail address\n#TEXT# - Message text\n#EMAIL_FROM# - Sender\'s e-mail address\n#EMAIL_TO# - Recipient\'s e-mail address\";s:4:\"save\";s:0:\"\";s:5:\"apply\";s:0:\"\";s:6:\"cancel\";s:0:\"\";s:21:\"tabControl_active_tab\";s:5:\"edit1\";}', 1, 1680753836);
-- -----------------------------------
-- Dumping table b_urlpreview_metadata
-- -----------------------------------
DROP TABLE IF EXISTS `b_urlpreview_metadata`;
CREATE TABLE `b_urlpreview_metadata` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URL` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `TYPE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'S',
  `DATE_INSERT` datetime NOT NULL,
  `DATE_EXPIRE` datetime DEFAULT NULL,
  `TITLE` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text COLLATE utf8_unicode_ci,
  `IMAGE_ID` int(11) DEFAULT NULL,
  `IMAGE` varchar(2000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMBED` mediumtext COLLATE utf8_unicode_ci,
  `EXTRA` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IX_URLPREVIEW_METADATA_URL` (`URL`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_urlpreview_route
-- -----------------------------------
DROP TABLE IF EXISTS `b_urlpreview_route`;
CREATE TABLE `b_urlpreview_route` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROUTE` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `MODULE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CLASS` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `PARAMETERS` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UX_URLPREVIEW_ROUTE_ROUTE` (`ROUTE`(255))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_urlpreview_route` VALUES
(1, '/knowledge/#knowledgeCode#/', 'landing', '\\Bitrix\\Landing\\Landing\\UrlPreview', 'a:3:{s:13:\"knowledgeCode\";s:14:\"$knowledgeCode\";s:5:\"scope\";s:9:\"knowledge\";s:12:\"allowSlashes\";s:1:\"N\";}'),
(2, '/knowledge/group/#knowledgeCode#/', 'landing', '\\Bitrix\\Landing\\Landing\\UrlPreview', 'a:3:{s:13:\"knowledgeCode\";s:14:\"$knowledgeCode\";s:5:\"scope\";s:5:\"group\";s:12:\"allowSlashes\";s:1:\"N\";}');
-- -----------------------------------
-- Dumping table b_user
-- -----------------------------------
DROP TABLE IF EXISTS `b_user`;
CREATE TABLE `b_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `LOGIN` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CHECKWORD` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTIVE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_LOGIN` datetime DEFAULT NULL,
  `DATE_REGISTER` datetime NOT NULL,
  `LID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PROFESSION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ICQ` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_GENDER` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDATE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PHOTO` int(11) DEFAULT NULL,
  `PERSONAL_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_MOBILE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STREET` text COLLATE utf8_unicode_ci,
  `PERSONAL_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_NOTES` text COLLATE utf8_unicode_ci,
  `WORK_COMPANY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_DEPARTMENT` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_WWW` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PHONE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_FAX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PAGER` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STREET` text COLLATE utf8_unicode_ci,
  `WORK_MAILBOX` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_CITY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_STATE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_ZIP` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_COUNTRY` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_PROFILE` text COLLATE utf8_unicode_ci,
  `WORK_LOGO` int(11) DEFAULT NULL,
  `WORK_NOTES` text COLLATE utf8_unicode_ci,
  `ADMIN_NOTES` text COLLATE utf8_unicode_ci,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PERSONAL_BIRTHDAY` date DEFAULT NULL,
  `EXTERNAL_AUTH_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CHECKWORD_TIME` datetime DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CONFIRM_CODE` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LOGIN_ATTEMPTS` int(11) DEFAULT NULL,
  `LAST_ACTIVITY_DATE` datetime DEFAULT NULL,
  `AUTO_TIME_ZONE` char(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIME_ZONE_OFFSET` int(11) DEFAULT NULL,
  `TITLE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BX_USER_ID` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `BLOCKED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `PASSWORD_EXPIRED` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ix_login` (`LOGIN`,`EXTERNAL_AUTH_ID`),
  KEY `ix_b_user_email` (`EMAIL`),
  KEY `ix_b_user_activity_date` (`LAST_ACTIVITY_DATE`),
  KEY `IX_B_USER_XML_ID` (`XML_ID`),
  KEY `ix_user_last_login` (`LAST_LOGIN`),
  KEY `ix_user_date_register` (`DATE_REGISTER`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user` VALUES
(1, '2023-03-31 22:21:02', 'admin', '$6$LMOvvcM3wFOPuVmw$lN7b9yXp3dla0gZJnw7uFW9xdUdjwoNrwIoE33wuBdF/TbXoMImhtyC2/WNL/dH7P2vd5J9qp8zrQehvcq1.t0', '$6$3idZm0KNqR7b3l2B$g/ZJGsHoLE8kMW90OLLy72Buly1ImLrPnbfNu7cYsviUVupH9owOF1nuDfGO/O/.1lRF/KOwGlOcbWASHxbgU/', 'Y', 'Алексей', 'Киселевич', 'a.kiselevich@digital-sector.ru', '2023-04-06 20:37:42', '2023-03-31 22:21:02', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-03-31 22:21:02', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '7d58483cad80d14e71edf2c8b9c3aa9d', NULL, 'N', 'N');
-- -----------------------------------
-- Dumping table b_user_access
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_access`;
CREATE TABLE `b_user_access` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACCESS_CODE` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_ua_user_provider` (`USER_ID`,`PROVIDER_ID`),
  KEY `ix_ua_user_access` (`USER_ID`,`ACCESS_CODE`),
  KEY `ix_ua_access` (`ACCESS_CODE`),
  KEY `ix_ua_provider` (`PROVIDER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_access` VALUES
(1, 0, 'group', 'G2'),
(2, 1, 'group', 'G1'),
(3, 1, 'group', 'G3'),
(4, 1, 'group', 'G4'),
(5, 1, 'group', 'G2'),
(9, 1, 'user', 'U1');
-- -----------------------------------
-- Dumping table b_user_access_check
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_access_check`;
CREATE TABLE `b_user_access_check` (
  `USER_ID` int(11) DEFAULT NULL,
  `PROVIDER_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  UNIQUE KEY `ux_uac_user_provider` (`USER_ID`,`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_auth_action
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_auth_action`;
CREATE TABLE `b_user_auth_action` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `PRIORITY` int(11) NOT NULL DEFAULT '100',
  `ACTION` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ACTION_DATE` datetime NOT NULL,
  `APPLICATION_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_auth_action_user` (`USER_ID`,`PRIORITY`),
  KEY `ix_auth_action_date` (`ACTION_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_auth_code
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_auth_code`;
CREATE TABLE `b_user_auth_code` (
  `USER_ID` int(11) NOT NULL,
  `CODE_TYPE` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'email',
  `OTP_SECRET` text COLLATE utf8_unicode_ci,
  `ATTEMPTS` int(11) DEFAULT '0',
  `DATE_SENT` datetime DEFAULT NULL,
  `DATE_RESENT` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`,`CODE_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_counter
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_counter`;
CREATE TABLE `b_user_counter` (
  `USER_ID` int(11) NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '**',
  `CODE` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `CNT` int(11) NOT NULL DEFAULT '0',
  `LAST_DATE` datetime DEFAULT NULL,
  `TIMESTAMP_X` datetime NOT NULL DEFAULT '3000-01-01 00:00:00',
  `TAG` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PARAMS` text COLLATE utf8_unicode_ci,
  `SENT` char(1) COLLATE utf8_unicode_ci DEFAULT '0',
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_counter_user_site_code` (`USER_ID`,`SITE_ID`,`CODE`),
  KEY `ix_buc_tag` (`TAG`),
  KEY `ix_buc_code` (`CODE`),
  KEY `ix_buc_ts` (`TIMESTAMP_X`),
  KEY `ix_buc_sent_userid` (`SENT`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_device
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_device`;
CREATE TABLE `b_user_device` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) unsigned NOT NULL,
  `DEVICE_UID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `DEVICE_TYPE` int(10) unsigned NOT NULL DEFAULT '0',
  `BROWSER` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PLATFORM` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `COOKABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  KEY `ix_user_device_user` (`USER_ID`,`DEVICE_UID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_device` VALUES
(1, 1, '1fgpoyfotd68k0wpgdw6el1dmehfzvi8', 0, '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 'Y'),
(2, 1, 'kezq7e4z6jl2c1cymotykrx3ooqcilqc', 0, '', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/111.0.0.0 Safari/537.36', 'Y');
-- -----------------------------------
-- Dumping table b_user_device_login
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_device_login`;
CREATE TABLE `b_user_device_login` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `DEVICE_ID` bigint(20) unsigned NOT NULL,
  `LOGIN_DATE` datetime DEFAULT NULL,
  `IP` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CITY_GEOID` bigint(20) DEFAULT NULL,
  `REGION_GEOID` bigint(20) DEFAULT NULL,
  `COUNTRY_ISO_CODE` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `APP_PASSWORD_ID` bigint(20) unsigned DEFAULT NULL,
  `STORED_AUTH_ID` bigint(20) unsigned DEFAULT NULL,
  `HIT_AUTH_ID` bigint(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_user_device_login_device` (`DEVICE_ID`),
  KEY `ix_user_device_login_date` (`LOGIN_DATE`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_device_login` VALUES
(1, 1, '2023-04-02 05:28:29', '172.18.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 1, '2023-04-02 06:03:44', '172.18.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, '2023-04-02 18:07:10', '172.18.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(4, 1, '2023-04-03 00:55:28', '172.18.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(5, 1, '2023-04-03 03:05:16', '172.18.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(6, 1, '2023-04-03 04:25:14', '172.18.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(7, 1, '2023-04-03 06:52:57', '172.18.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(8, 1, '2023-04-03 07:39:03', '172.18.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(9, 1, '2023-04-03 21:33:29', '172.18.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(10, 1, '2023-04-03 22:12:30', '172.18.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(11, 1, '2023-04-04 21:01:47', '172.18.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(12, 1, '2023-04-05 21:24:58', '172.18.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(13, 1, '2023-04-05 23:08:51', '172.18.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(14, 2, '2023-04-06 08:25:16', '172.19.0.1', NULL, NULL, NULL, NULL, NULL, NULL),
(15, 2, '2023-04-06 20:37:42', '172.19.0.1', NULL, NULL, NULL, NULL, NULL, NULL);
-- -----------------------------------
-- Dumping table b_user_digest
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_digest`;
CREATE TABLE `b_user_digest` (
  `USER_ID` int(11) NOT NULL,
  `DIGEST_HA1` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_field
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_field`;
CREATE TABLE `b_user_field` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ENTITY_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FIELD_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_TYPE_ID` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `MULTIPLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `MANDATORY` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_FILTER` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SHOW_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `EDIT_IN_LIST` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `IS_SEARCHABLE` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SETTINGS` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_type_entity` (`ENTITY_ID`,`FIELD_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_field` VALUES
(1, 'HLBLOCK_1', 'UF_NAME', 'string', '', 100, 'N', 'N', 'N', 'Y', 'Y', 'N', 'a:6:{s:4:\"SIZE\";i:20;s:4:\"ROWS\";i:1;s:6:\"REGEXP\";s:0:\"\";s:10:\"MIN_LENGTH\";i:0;s:10:\"MAX_LENGTH\";i:0;s:13:\"DEFAULT_VALUE\";s:0:\"\";}'),
(2, 'HLBLOCK_1', 'UF_LINK', 'url', '', 100, 'N', 'N', 'N', 'Y', 'Y', 'N', 'a:5:{s:5:\"POPUP\";s:1:\"Y\";s:4:\"SIZE\";i:20;s:10:\"MIN_LENGTH\";i:0;s:10:\"MAX_LENGTH\";i:0;s:13:\"DEFAULT_VALUE\";s:0:\"\";}'),
(4, 'HLBLOCK_1', 'UF_SORT', 'double', '', 100, 'N', 'N', 'N', 'Y', 'Y', 'N', 'a:5:{s:9:\"PRECISION\";i:4;s:4:\"SIZE\";i:20;s:9:\"MIN_VALUE\";d:0;s:9:\"MAX_VALUE\";d:0;s:13:\"DEFAULT_VALUE\";N;}'),
(5, 'HLBLOCK_1', 'UF_ACTIVE', 'boolean', '', 100, 'N', 'N', 'N', 'Y', 'Y', 'N', 'a:4:{s:13:\"DEFAULT_VALUE\";i:1;s:7:\"DISPLAY\";s:8:\"CHECKBOX\";s:5:\"LABEL\";a:2:{i:0;s:0:\"\";i:1;s:0:\"\";}s:14:\"LABEL_CHECKBOX\";s:0:\"\";}'),
(6, 'HLBLOCK_1', 'UF_CODE', 'string', '', 100, 'N', 'N', 'N', 'Y', 'Y', 'N', 'a:6:{s:4:\"SIZE\";i:20;s:4:\"ROWS\";i:1;s:6:\"REGEXP\";s:0:\"\";s:10:\"MIN_LENGTH\";i:0;s:10:\"MAX_LENGTH\";i:0;s:13:\"DEFAULT_VALUE\";s:0:\"\";}');
-- -----------------------------------
-- Dumping table b_user_field_confirm
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_field_confirm`;
CREATE TABLE `b_user_field_confirm` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `DATE_CHANGE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `FIELD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `FIELD_VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `CONFIRM_CODE` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `ATTEMPTS` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ix_b_user_field_confirm1` (`USER_ID`,`CONFIRM_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_field_enum
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_field_enum`;
CREATE TABLE `b_user_field_enum` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_FIELD_ID` int(11) DEFAULT NULL,
  `VALUE` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DEF` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `SORT` int(11) NOT NULL DEFAULT '500',
  `XML_ID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_field_enum` (`USER_FIELD_ID`,`XML_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_field_lang
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_field_lang`;
CREATE TABLE `b_user_field_lang` (
  `USER_FIELD_ID` int(11) NOT NULL,
  `LANGUAGE_ID` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `EDIT_FORM_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_COLUMN_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LIST_FILTER_LABEL` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ERROR_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HELP_MESSAGE` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_FIELD_ID`,`LANGUAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_field_lang` VALUES
(1, 'en', 'Name', '', '', '', ''),
(1, 'ru', 'Название', '', '', '', ''),
(2, 'en', 'Link', '', '', '', ''),
(2, 'ru', 'Ссылка', '', '', '', ''),
(4, 'en', 'SORT', '', '', '', ''),
(4, 'ru', 'Сортировка', '', '', '', ''),
(5, 'en', 'Active', '', '', '', ''),
(5, 'ru', 'Активность', '', '', '', ''),
(6, 'en', 'CODE', '', '', '', ''),
(6, 'ru', 'CODE', '', '', '', '');
-- -----------------------------------
-- Dumping table b_user_field_permission
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_field_permission`;
CREATE TABLE `b_user_field_permission` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ENTITY_TYPE_ID` tinyint(3) unsigned NOT NULL,
  `USER_FIELD_ID` int(10) unsigned NOT NULL,
  `ACCESS_CODE` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `PERMISSION_ID` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROLE_ID` (`ENTITY_TYPE_ID`),
  KEY `GROUP_ID` (`USER_FIELD_ID`),
  KEY `PERMISSION_ID` (`PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_group
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_group`;
CREATE TABLE `b_user_group` (
  `USER_ID` int(11) NOT NULL,
  `GROUP_ID` int(11) NOT NULL,
  `DATE_ACTIVE_FROM` datetime DEFAULT NULL,
  `DATE_ACTIVE_TO` datetime DEFAULT NULL,
  UNIQUE KEY `ix_user_group` (`USER_ID`,`GROUP_ID`),
  KEY `ix_user_group_group` (`GROUP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_group` VALUES
(1, 1, NULL, NULL),
(1, 3, NULL, NULL),
(1, 4, NULL, NULL);
-- -----------------------------------
-- Dumping table b_user_hit_auth
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_hit_auth`;
CREATE TABLE `b_user_hit_auth` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `URL` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `SITE_ID` char(2) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `VALID_UNTIL` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_USER_HIT_AUTH_1` (`HASH`),
  KEY `IX_USER_HIT_AUTH_2` (`USER_ID`),
  KEY `IX_USER_HIT_AUTH_3` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_index
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_index`;
CREATE TABLE `b_user_index` (
  `USER_ID` int(11) NOT NULL,
  `SEARCH_USER_CONTENT` text COLLATE utf8_unicode_ci,
  `SEARCH_DEPARTMENT_CONTENT` text COLLATE utf8_unicode_ci,
  `SEARCH_ADMIN_CONTENT` text COLLATE utf8_unicode_ci,
  `NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `LAST_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SECOND_NAME` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `WORK_POSITION` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UF_DEPARTMENT_NAME` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  FULLTEXT KEY `IXF_B_USER_INDEX_1` (`SEARCH_USER_CONTENT`),
  FULLTEXT KEY `IXF_B_USER_INDEX_2` (`SEARCH_DEPARTMENT_CONTENT`),
  FULLTEXT KEY `IXF_B_USER_INDEX_3` (`SEARCH_ADMIN_CONTENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_index` VALUES
(1, '001 Алексей Киселевич ', '', '001 Алексей Киселевич xvfryrivpu qvtvgny frpgbe n.xvfryrivpu@qvtvgny-frpgbe.eh nqzva', 'Алексей', 'Киселевич', '', '', '');
-- -----------------------------------
-- Dumping table b_user_option
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_option`;
CREATE TABLE `b_user_option` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `CATEGORY` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `NAME` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `VALUE` mediumtext COLLATE utf8_unicode_ci,
  `COMMON` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ux_user_category_name` (`USER_ID`,`CATEGORY`,`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=424 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_option` VALUES
(1, 0, 'intranet', '~gadgets_admin_index', 'a:1:{i:0;a:1:{s:7:\"GADGETS\";a:8:{s:20:\"ADMIN_INFO@333333333\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:19:\"HTML_AREA@444444444\";a:5:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";s:8:\"USERDATA\";a:1:{s:7:\"content\";s:797:\"<table class=\"bx-gadgets-info-site-table\" cellspacing=\"0\"><tr>	<td class=\"bx-gadget-gray\">Создатель сайта:</td>	<td>Группа компаний &laquo;1С-Битрикс&raquo;.</td>	<td class=\"bx-gadgets-info-site-logo\" rowspan=\"5\"><img src=\"/bitrix/components/bitrix/desktop/templates/admin/images/site_logo.png\"></td></tr><tr>	<td class=\"bx-gadget-gray\">Адрес сайта:</td>	<td><a href=\"http://www.1c-bitrix.ru\">www.1c-bitrix.ru</a></td></tr><tr>	<td class=\"bx-gadget-gray\">Сайт сдан:</td>	<td>12 декабря 2010 г.</td></tr><tr>	<td class=\"bx-gadget-gray\">Ответственное лицо:</td>	<td>Иван Иванов</td></tr><tr>	<td class=\"bx-gadget-gray\">E-mail:</td>	<td><a href=\"mailto:info@1c-bitrix.ru\">info@1c-bitrix.ru</a></td></tr></table>\";}s:8:\"SETTINGS\";a:1:{s:9:\"TITLE_STD\";s:34:\"Информация о сайте\";}}s:25:\"ADMIN_CHECKLIST@777888999\";a:3:{s:6:\"COLUMN\";i:0;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:19:\"RSSREADER@777777777\";a:4:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";s:8:\"SETTINGS\";a:3:{s:9:\"TITLE_STD\";s:33:\"Новости 1С-Битрикс\";s:3:\"CNT\";i:10;s:7:\"RSS_URL\";s:45:\"https://www.1c-bitrix.ru/about/life/news/rss/\";}}s:24:\"ADMIN_SECURITY@555555555\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:0;s:4:\"HIDE\";s:1:\"N\";}s:25:\"ADMIN_SITESPEED@666666777\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:1;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_PERFMON@666666666\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:2;s:4:\"HIDE\";s:1:\"N\";}s:23:\"ADMIN_MARKETPALCE@22549\";a:3:{s:6:\"COLUMN\";i:1;s:3:\"ROW\";i:3;s:4:\"HIDE\";s:1:\"N\";}}}}', 'Y'),
(2, 1, 'hot_keys', 'user_defined', 'b:1;', 'N'),
(3, 1, 'favorite', 'favorite_menu', 'a:1:{s:5:\"stick\";s:1:\"N\";}', 'N'),
(4, 1, 'admin_panel', 'settings', 'a:2:{s:4:\"edit\";s:3:\"off\";s:9:\"collapsed\";s:3:\"off\";}', 'N'),
(6, 1, 'admin_menu', 'pos', 'a:1:{s:8:\"sections\";s:201:\"menu_fileman,menu_util,interface,iblock_admin,menu_highloadblock,menu_iblock_%2Fblog%2F1,menu_module_settings,menu_b24connector,menu_site,menu_templates,menu_iblock,menu_iblock_/blog,menu_system,backup\";}', 'N'),
(13, 1, 'fileman', 'last_pathes', 's:273:\"a:9:{i:0;s:11:\"/categories\";i:1;s:7:\"/bitrix\";i:2;s:38:\"/local/templates/.default/markup/build\";i:3;s:32:\"/local/templates/.default/markup\";i:4;s:25:\"/local/templates/.default\";i:5;s:16:\"/local/templates\";i:6;s:6:\"/local\";i:7;s:22:\"/local/templates/local\";i:8;s:5:\"/auth\";}\";', 'N'),
(21, 1, 'fileman', 'code_editor', 'a:1:{s:5:\"theme\";s:5:\"light\";}', 'N'),
(27, 1, 'main.interface.grid', 'tbl_iblock_admin_126ac9f6149081eb0e97c2e939eaad52', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(32, 1, 'main.ui.filter', 'tbl_iblock_section_593403d1fdf7ca981ac35aedd724f7c6', 'a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:1:{s:10:\"tmp_filter\";a:2:{s:6:\"fields\";a:1:{s:10:\"SECTION_ID\";s:1:\"0\";}s:11:\"filter_rows\";s:10:\"SECTION_ID\";}}}', 'N'),
(38, 1, 'main.interface.grid', 'tbl_iblock_section_593403d1fdf7ca981ac35aedd724f7c6', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(43, 1, 'main.ui.filter', 'tbl_iblock_element_593403d1fdf7ca981ac35aedd724f7c6', 'a:6:{s:14:\"use_pin_preset\";b:1;s:15:\"deleted_presets\";a:0:{}s:15:\"default_presets\";a:0:{}s:7:\"default\";s:14:\"default_filter\";s:6:\"filter\";s:14:\"default_filter\";s:7:\"filters\";a:2:{s:14:\"default_filter\";a:0:{}s:10:\"tmp_filter\";a:2:{s:6:\"fields\";a:1:{s:10:\"SECTION_ID\";s:1:\"1\";}s:11:\"filter_rows\";s:10:\"SECTION_ID\";}}}', 'N'),
(48, 1, 'main.interface.grid', 'tbl_iblock_element_593403d1fdf7ca981ac35aedd724f7c6', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:6:{s:7:\"columns\";s:47:\"NAME,ACTIVE,DATE_ACTIVE_FROM,SORT,ID,PROPERTY_1\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}s:12:\"custom_names\";N;s:12:\"last_sort_by\";s:16:\"date_active_from\";s:15:\"last_sort_order\";s:3:\"asc\";}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(111, 1, 'html_editor', 'type_selector_DETAIL_TEXT1', 'a:1:{s:4:\"type\";s:4:\"html\";}', 'N'),
(136, 1, 'html_editor', 'type_selector_PREVIEW_TEXT1', 'a:1:{s:4:\"type\";s:6:\"editor\";}', 'N'),
(223, 1, 'filter', 'tbl_social_network_filter_id', 'a:1:{s:4:\"rows\";s:1:\"0\";}', 'N'),
(228, 1, 'main.interface.grid', 'tbl_iblock_admin_750dd17d83198dd551018232269fa242', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(257, 1, 'main.interface.grid', 'tbl_iblock_126ac9f6149081eb0e97c2e939eaad52', 'a:3:{s:5:\"views\";a:1:{s:7:\"default\";a:3:{s:7:\"columns\";s:0:\"\";s:13:\"columns_sizes\";a:2:{s:6:\"expand\";i:1;s:7:\"columns\";a:0:{}}s:15:\"sticked_columns\";a:0:{}}}s:7:\"filters\";a:0:{}s:12:\"current_view\";s:7:\"default\";}', 'N'),
(295, 1, 'html_editor', 'user_settings_', 'a:4:{s:13:\"taskbar_shown\";s:1:\"1\";s:4:\"view\";s:4:\"code\";s:14:\"split_vertical\";s:1:\"0\";s:11:\"split_ratio\";s:17:\"4.544222798555397\";}', 'N'),
(306, 1, 'fileman', 'medialib_user_set', 's:9:\"600,450,1\";', 'N'),
(389, 1, 'filter', 'tbl_iblock_el_search3f62270c0d266a472acb94ecbc002991_filter', 'a:1:{s:4:\"rows\";s:9:\"IBLOCK_ID\";}', 'N'),
(416, 1, 'filter', 'tbl_iblock_el_search3038fc23b644a309c3698ff02511d81b_filter', 'a:1:{s:4:\"rows\";s:2:\"id\";}', 'N');
-- -----------------------------------
-- Dumping table b_user_password
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_password`;
CREATE TABLE `b_user_password` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `USER_ID` bigint(20) NOT NULL,
  `PASSWORD` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DATE_CHANGE` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_user_password_user_date` (`USER_ID`,`DATE_CHANGE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_password` VALUES
(1, 1, '$6$LMOvvcM3wFOPuVmw$lN7b9yXp3dla0gZJnw7uFW9xdUdjwoNrwIoE33wuBdF/TbXoMImhtyC2/WNL/dH7P2vd5J9qp8zrQehvcq1.t0', '2023-03-31 22:21:02');
-- -----------------------------------
-- Dumping table b_user_phone_auth
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_phone_auth`;
CREATE TABLE `b_user_phone_auth` (
  `USER_ID` int(11) NOT NULL,
  `PHONE_NUMBER` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `OTP_SECRET` text COLLATE utf8_unicode_ci,
  `ATTEMPTS` int(11) DEFAULT '0',
  `CONFIRMED` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `DATE_SENT` datetime DEFAULT NULL,
  PRIMARY KEY (`USER_ID`),
  UNIQUE KEY `ix_user_phone_auth_number` (`PHONE_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_profile_history
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_profile_history`;
CREATE TABLE `b_user_profile_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `EVENT_TYPE` int(11) DEFAULT NULL,
  `DATE_INSERT` datetime DEFAULT NULL,
  `REMOTE_ADDR` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `USER_AGENT` text COLLATE utf8_unicode_ci,
  `REQUEST_URI` text COLLATE utf8_unicode_ci,
  `UPDATED_BY_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ix_profile_history_user` (`USER_ID`),
  KEY `ix_profile_history_date` (`DATE_INSERT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_profile_record
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_profile_record`;
CREATE TABLE `b_user_profile_record` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HISTORY_ID` int(11) NOT NULL,
  `FIELD` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATA` mediumtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `ix_profile_record_history_field` (`HISTORY_ID`,`FIELD`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_session
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_session`;
CREATE TABLE `b_user_session` (
  `SESSION_ID` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `TIMESTAMP_X` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `SESSION_DATA` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`SESSION_ID`),
  KEY `ix_user_session_time` (`TIMESTAMP_X`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- -----------------------------------
-- Dumping table b_user_stored_auth
-- -----------------------------------
DROP TABLE IF EXISTS `b_user_stored_auth`;
CREATE TABLE `b_user_stored_auth` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `DATE_REG` datetime NOT NULL,
  `LAST_AUTH` datetime NOT NULL,
  `STORED_HASH` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `TEMP_HASH` char(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `IP_ADDR` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ux_user_hash` (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `b_user_stored_auth` VALUES
(1, 1, '2023-03-31 22:21:02', '2023-03-31 22:21:02', '7e146514911cffc4e0334215fb1831c7', 'N', 2886926337),
(2, 1, '2023-04-02 05:28:29', '2023-04-02 05:28:29', 'lVR0UVChEfLvKJ63OmmYv0kF9IjHwGMz', 'Y', 2886860801),
(3, 1, '2023-04-02 06:03:44', '2023-04-02 06:03:44', 'qByrrOAjCkZj2BpEm6UhXl4GUgX9zyUV', 'Y', 2886860801),
(4, 1, '2023-04-02 18:07:10', '2023-04-02 18:07:10', 'paXm8qa8g0GroXE8fNmjzOKbuju7Jqp5', 'Y', 2886860801),
(5, 1, '2023-04-03 00:55:28', '2023-04-03 00:55:28', 'mOgKYQHcsG2DfDqbsuSkqeDV0PcumI18', 'Y', 2886860801),
(6, 1, '2023-04-03 03:05:16', '2023-04-03 03:05:16', 'b4yeUtP58QmqGI2WxGC2QTv228xperHC', 'Y', 2886860801),
(7, 1, '2023-04-03 04:25:14', '2023-04-03 04:25:14', 'cnH3diS23dzhRfM0uXunIpAVCTfHLkAT', 'Y', 2886860801),
(8, 1, '2023-04-03 06:52:57', '2023-04-03 06:52:57', 'fg9y7mLzVC0fBpUrsxHl0xL14nBe1bxk', 'Y', 2886860801),
(9, 1, '2023-04-03 07:39:03', '2023-04-03 07:39:03', 'UpYVueXYbrFfjUHT9MNtV0u8jX7r06zE', 'Y', 2886860801),
(10, 1, '2023-04-03 21:33:29', '2023-04-03 21:33:29', 'GNlvA8APgygFQMVoPfM4HUkaoF3lZ29u', 'Y', 2886860801),
(11, 1, '2023-04-03 22:12:30', '2023-04-03 22:12:30', 'Die1OFYYttVWDjr0ahm9KtAhEjKNkMl9', 'Y', 2886860801),
(12, 1, '2023-04-04 21:01:47', '2023-04-04 21:01:47', 'VcCB2InSZBQ2BMCO7tM96Jd3jZh1lNCt', 'Y', 2886860801),
(13, 1, '2023-04-05 21:24:58', '2023-04-05 21:24:58', 'uAIXOzw3ezPQsbDb7Cwq7IWk2MiKa4dn', 'Y', 2886860801),
(14, 1, '2023-04-05 23:08:51', '2023-04-05 23:08:51', 'o1p61hfzfrGi1krYleWgMW2xrLmftcBC', 'Y', 2886860801),
(15, 1, '2023-04-06 08:25:16', '2023-04-06 08:25:16', 'zzBgbeTrwXly0AtOmpfnkktZOjhksnTc', 'Y', 2886926337),
(16, 1, '2023-04-06 20:37:42', '2023-04-06 20:37:42', '3KYTOAfInXNn6cBCIB3IBsPQc3hxgW8Z', 'Y', 2886926337);
-- -----------------------------------
-- Dumping table social_network
-- -----------------------------------
DROP TABLE IF EXISTS `social_network`;
CREATE TABLE `social_network` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `UF_NAME` text COLLATE utf8_unicode_ci,
  `UF_LINK` text COLLATE utf8_unicode_ci,
  `UF_SORT` double DEFAULT NULL,
  `UF_ACTIVE` int(18) DEFAULT NULL,
  `UF_CODE` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `social_network` VALUES
(1, 'twitter', 'https://twitter.com/', 500, 1, 'twitter'),
(2, 'facebook', 'https://facebook.com', 500, 1, 'facebook'),
(3, 'instagram', 'https://instagram.com', 500, 1, 'instagram'),
(4, 'youtube', 'https://www.youtube.com', 500, 1, 'youtube'),
(5, 'vimeo', 'https://vimeo.com/', 500, 1, 'vimeo'),
(6, 'snapchat', 'https://snapchat.com', 500, 1, 'snapchat');
-- Finished: 2023-04-06 20:56:31