-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 08, 2012 at 04:30 AM
-- Server version: 5.1.44
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bushfireconnect_live`
--

-- --------------------------------------------------------

--
-- Table structure for table `alert`
--

CREATE TABLE IF NOT EXISTS `alert` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `alert_type` tinyint(4) NOT NULL COMMENT '1 - MOBILE, 2 - EMAIL',
  `alert_recipient` varchar(200) DEFAULT NULL,
  `alert_code` varchar(30) DEFAULT NULL,
  `alert_confirmed` tinyint(4) NOT NULL DEFAULT '0',
  `alert_lat` varchar(150) DEFAULT NULL,
  `alert_lon` varchar(150) DEFAULT NULL,
  `alert_radius` tinyint(4) NOT NULL DEFAULT '20',
  `alert_ip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_alert_code` (`alert_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `alert`
--


-- --------------------------------------------------------

--
-- Table structure for table `alert_category`
--

CREATE TABLE IF NOT EXISTS `alert_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `alert_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alert_id` (`alert_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `alert_category`
--


-- --------------------------------------------------------

--
-- Table structure for table `alert_sent`
--

CREATE TABLE IF NOT EXISTS `alert_sent` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) NOT NULL,
  `alert_id` bigint(20) NOT NULL,
  `alert_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `alert_sent`
--


-- --------------------------------------------------------

--
-- Table structure for table `api_banned`
--

CREATE TABLE IF NOT EXISTS `api_banned` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `banned_ipaddress` varchar(50) NOT NULL,
  `banned_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='For logging banned API IP addresses' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `api_banned`
--


-- --------------------------------------------------------

--
-- Table structure for table `api_log`
--

CREATE TABLE IF NOT EXISTS `api_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `api_task` varchar(10) NOT NULL,
  `api_parameters` varchar(100) NOT NULL,
  `api_records` tinyint(11) NOT NULL,
  `api_ipaddress` varchar(50) NOT NULL,
  `api_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='For logging API activities' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `api_log`
--


-- --------------------------------------------------------

--
-- Table structure for table `api_settings`
--

CREATE TABLE IF NOT EXISTS `api_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `default_record_limit` int(11) NOT NULL DEFAULT '20',
  `max_record_limit` int(11) DEFAULT NULL,
  `max_requests_per_ip_address` int(11) DEFAULT NULL,
  `max_requests_quota_basis` int(11) DEFAULT NULL,
  `modification_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='For storing API logging settings' AUTO_INCREMENT=1 ;

--
-- Dumping data for table `api_settings`
--


-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `locale` varchar(10) NOT NULL DEFAULT 'en_US',
  `category_type` tinyint(4) DEFAULT NULL,
  `category_title` varchar(255) DEFAULT NULL,
  `category_description` text,
  `category_color` varchar(20) DEFAULT NULL,
  `category_image` varchar(100) DEFAULT NULL,
  `category_image_thumb` varchar(100) DEFAULT NULL,
  `category_image_shadow` varchar(100) DEFAULT NULL,
  `category_visible` tinyint(4) NOT NULL DEFAULT '1',
  `category_trusted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `category_visible` (`category_visible`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `parent_id`, `locale`, `category_type`, `category_title`, `category_description`, `category_color`, `category_image`, `category_image_thumb`, `category_image_shadow`, `category_visible`, `category_trusted`) VALUES
(2, 7, 'en_US', 5, 'DSE', 'Department of Sustainability and Environment', '006fff', 'category_2_1306829019.png', 'category_2_1306829019_16x16.png', NULL, 1, 0),
(1, 8, 'en_US', 5, 'Road Closures', 'Road Closures', '9900CC', 'category_1_1306829312.png', 'category_1_1306829312_16x16.png', NULL, 1, 0),
(3, 8, 'en_US', 5, 'Evacuation Alerts', 'Evacuation Alerts', 'cc725c', 'category_3_1306829364.png', 'category_3_1306829364_16x16.png', NULL, 1, 0),
(4, 0, 'en_US', 5, 'PREPARATION', 'PREPARATION', 'e8b341', 'category_4_1306829503.png', 'category_4_1306829503_16x16.png', NULL, 1, 0),
(5, 7, 'en_US', 5, 'SES', 'State Emergency Services Victoria', '3387cc', 'category_5_1306829038.png', 'category_5_1306829038_16x16.png', NULL, 1, 0),
(25, 7, 'en_US', NULL, 'WA FESA', 'WA FESA', 'e61e1e', 'category_25_1306829127.png', 'category_25_1306829127_16x16.png', NULL, 1, 0),
(7, 0, 'en_US', 5, 'AGENCY REPORTS', 'AGENCY REPORTS', '001fcc', 'category_7_1300499036.png', 'category_7_1300499036_16x16.png', NULL, 1, 0),
(8, 0, 'en_US', 5, 'EMERGENCIES', 'EMERGENCY REPORTSS', 'ff1e00', 'category_8_1330863022.png', 'category_8_1330863022_16x16.png', NULL, 1, 0),
(9, 8, 'en_US', 5, 'Fire or Smoke', 'Fire or Smoke Sightings', 'fae2d7', 'category_9_1306829380.png', 'category_9_1306829380_16x16.png', NULL, 1, 0),
(10, 4, 'en_US', NULL, 'Fire Break Areas', 'Fire Break Areas', 'ebbd5b', 'category_10_1306829586.png', 'category_10_1306829586_16x16.png', NULL, 1, 0),
(11, 4, 'en_US', NULL, 'Prescribed Burn Activity', 'Prescribed Burn Activity', 'fcc029', 'category_11_1306829604.png', 'category_11_1306829604_16x16.png', NULL, 1, 0),
(12, 4, 'en_US', NULL, 'Danger Areas', 'Danger Areas', 'eb8a6a', 'category_12_1306829615.png', 'category_12_1306829615_16x16.png', NULL, 1, 0),
(13, 4, 'en_US', NULL, 'Places of Last Resort', 'Places of Last Resort', 'ebc940', 'category_13_1306829635.png', 'category_13_1306829635_16x16.png', NULL, 1, 0),
(14, 0, 'en_US', NULL, 'COMMUNITY UPDATES', 'Community Update', '05d0eb', 'category_14_1306829259.png', 'category_14_1306829259_16x16.png', NULL, 1, 0),
(15, 7, 'en_US', NULL, 'CFA', 'Country Fire Authority', 'ffffff', 'category_15_1306829047.png', 'category_15_1306829047_16x16.png', NULL, 1, 0),
(17, 4, 'en_US', NULL, 'Other', 'Other Preperation related reports', '319ae0', 'category_17_1306829659.png', 'category_17_1306829659_16x16.png', NULL, 1, 0),
(23, 22, 'en_US', NULL, 'Help needed', 'Help needed', '9e5925', 'category_23_1306829216.png', 'category_23_1306829216_16x16.png', NULL, 1, 0),
(18, 8, 'en_US', NULL, 'Property Damage', 'Property Damage', '8f7118', 'category_18_1306829396.png', 'category_18_1306829396_16x16.png', NULL, 1, 0),
(19, 8, 'en_US', NULL, 'People Stranded or in Danger', 'People Stranded or in Danger', '13bd26', 'category_19_1306829416.png', 'category_19_1306829416_16x16.png', NULL, 1, 0),
(20, 8, 'en_US', NULL, 'Other Emergencies', 'Other Emergencies', 'ed0707', 'category_20_1330900534.png', 'category_20_1330900534_16x16.png', NULL, 1, 0),
(21, 7, 'en_US', NULL, 'Vic Police', 'Victoria Police', '5338eb', 'category_21_1306829063.png', 'category_21_1306829063_16x16.png', NULL, 1, 0),
(22, 0, 'en_US', NULL, 'ASSISTANCE', 'Seek or offer help', 'cae024', 'category_22_1306829202.png', 'category_22_1306829202_16x16.png', NULL, 1, 0),
(24, 22, 'en_US', NULL, 'Help offered', 'Help offered', '2cbade', 'category_24_1306829237.png', 'category_24_1306829237_16x16.png', NULL, 1, 0),
(26, 7, 'en_US', NULL, 'RFS', 'NSW Rural Fire Service', 'FA1414', 'category_26_1306829189.png', 'category_26_1306829189_16x16.png', NULL, 1, 0),
(29, 7, 'en_US', NULL, 'QLD Fire and Rescue', 'QLD FIre and Rescue Service', 'e31414', NULL, NULL, NULL, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `category_lang`
--

CREATE TABLE IF NOT EXISTS `category_lang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `locale` varchar(10) DEFAULT NULL,
  `category_title` varchar(255) DEFAULT NULL,
  `category_description` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=53 ;

--
-- Dumping data for table `category_lang`
--

INSERT INTO `category_lang` (`id`, `category_id`, `locale`, `category_title`, `category_description`) VALUES
(1, 15, 'fr_FR', '', NULL),
(2, 15, 'en_US', '', NULL),
(6, 12, 'en_US', '', NULL),
(5, 12, 'fr_FR', '', NULL),
(7, 17, 'fr_FR', '', NULL),
(8, 17, 'en_US', '', NULL),
(9, 9, 'fr_FR', '', NULL),
(10, 9, 'en_US', '', NULL),
(11, 8, 'fr_FR', '', NULL),
(12, 8, 'en_US', '', NULL),
(13, 18, 'fr_FR', '', NULL),
(14, 18, 'en_US', '', NULL),
(15, 19, 'fr_FR', '', NULL),
(16, 19, 'en_US', '', NULL),
(17, 20, 'fr_FR', '', NULL),
(18, 20, 'en_US', '', NULL),
(19, 14, 'fr_FR', '', NULL),
(20, 14, 'en_US', '', NULL),
(21, 21, 'fr_FR', '', NULL),
(22, 21, 'en_US', '', NULL),
(23, 22, 'fr_FR', '', NULL),
(24, 22, 'en_US', '', NULL),
(25, 23, 'fr_FR', '', NULL),
(26, 23, 'en_US', '', NULL),
(27, 24, 'fr_FR', '', NULL),
(28, 24, 'en_US', '', NULL),
(29, 5, 'fr_FR', '', NULL),
(30, 5, 'en_US', '', NULL),
(31, 25, 'fr_FR', '', NULL),
(32, 25, 'en_US', '', NULL),
(33, 26, 'fr_FR', '', NULL),
(34, 26, 'en_US', '', NULL),
(35, 2, 'fr_FR', '', NULL),
(36, 2, 'en_US', '', NULL),
(37, 7, 'fr_FR', '', NULL),
(38, 7, 'en_US', '', NULL),
(39, 1, 'fr_FR', '', NULL),
(40, 1, 'en_US', '', NULL),
(41, 3, 'fr_FR', '', NULL),
(42, 3, 'en_US', '', NULL),
(43, 4, 'fr_FR', '', NULL),
(44, 4, 'en_US', '', NULL),
(45, 10, 'fr_FR', '', NULL),
(46, 10, 'en_US', '', NULL),
(47, 11, 'fr_FR', '', NULL),
(48, 11, 'en_US', '', NULL),
(49, 13, 'fr_FR', '', NULL),
(50, 13, 'en_US', '', NULL),
(51, 29, 'fr_FR', '', NULL),
(52, 29, 'en_US', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE IF NOT EXISTS `city` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `country_id` int(11) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `city_lat` varchar(150) DEFAULT NULL,
  `city_lon` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=301 ;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `country_id`, `city`, `city_lat`, `city_lon`) VALUES
(201, 14, 'Canberra', '-35.28346', '149.12807'),
(202, 14, 'Perth', '-31.93333', '115.83333'),
(203, 14, 'Adelaide', '-34.93333', '138.6'),
(204, 14, 'Sydney', '-33.86785', '151.20732'),
(205, 14, 'Melbourne', '-37.814', '144.96332'),
(206, 14, 'Brisbane', '-27.46794', '153.02809'),
(207, 14, 'Darwin', '-12.46113', '130.84185'),
(208, 14, 'Newcastle', '-32.92715', '151.77647'),
(209, 14, 'Gold Coast', '-28', '153.43333'),
(210, 14, 'Wollongong', '-34.43333', '150.88333'),
(211, 14, 'Cairns', '-16.91667', '145.76667'),
(212, 14, 'Hobart', '-42.87936', '147.32941'),
(213, 14, 'Townsville', '-19.25', '146.8'),
(214, 14, 'Geelong', '-38.14711', '144.36069'),
(215, 14, 'Alice Springs', '-23.7', '133.88333'),
(216, 14, 'Geelong West', '-38.13333', '144.35'),
(217, 14, 'Albury', '-36.08333', '146.91667'),
(218, 14, 'Logan City', '-27.63917', '153.10944'),
(219, 14, 'City of Parramatta', '-33.81667', '151'),
(220, 14, 'Murray Bridge', '-35.11667', '139.26667'),
(221, 14, 'Mount Isa', '-20.73333', '139.5'),
(222, 14, 'Mandurah', '-32.55', '115.7'),
(223, 14, 'Katherine', '-14.46667', '132.26667'),
(224, 14, 'Fremantle', '-32.05', '115.76667'),
(225, 14, 'Toowoomba', '-27.55', '151.96667'),
(226, 14, 'Rockhampton', '-23.38333', '150.5'),
(227, 14, 'Mount Gambier', '-37.83333', '140.76667'),
(228, 14, 'Mackay', '-21.15', '149.2'),
(229, 14, 'Launceston', '-41.45', '147.16667'),
(230, 14, 'Hamilton', '-37.75', '142.03333'),
(231, 14, 'Coffs Harbour', '-30.3', '153.13333'),
(232, 14, 'Broken Hill', '-31.95', '141.43333'),
(233, 14, 'Bendigo', '-36.76667', '144.28333'),
(234, 14, 'Ballarat', '-37.56667', '143.85'),
(235, 14, 'North Shore', '-31.40237', '152.90185'),
(236, 14, 'Wayville', '-34.95', '138.58333'),
(237, 14, 'Unley', '-34.95', '138.6'),
(238, 14, 'Port Lincoln', '-34.73333', '135.86667'),
(239, 14, 'Plympton', '-34.95', '138.55'),
(240, 14, 'Nhulunbuy', '-12.23333', '136.76667'),
(241, 14, 'Mount Barker', '-35.06667', '138.86667'),
(242, 14, 'Kalgoorlie-Boulder', '-30.75', '121.46667'),
(243, 14, 'Geraldton', '-28.76667', '114.6'),
(244, 14, 'Bunbury', '-33.33333', '115.63333'),
(245, 14, 'Broome', '-17.96667', '122.23333'),
(246, 14, 'Beaumont', '-34.93333', '138.65'),
(247, 14, 'Albany', '-35.01694', '117.89167'),
(248, 14, 'Yeppoon', '-23.13333', '150.73333'),
(249, 14, 'Wagga', '-35.11667', '147.36667'),
(250, 14, 'Taree', '-31.9', '152.46667'),
(251, 14, 'Tamworth', '-31.1', '150.93333'),
(252, 14, 'Surfers Paradise', '-28.00274', '153.42999'),
(253, 14, 'Singleton', '-32.56667', '151.18333'),
(254, 14, 'Shepparton', '-36.38333', '145.4'),
(255, 14, 'Sale', '-38.1', '147.06667'),
(256, 14, 'Queanbeyan', '-35.35', '149.23333'),
(257, 14, 'Port Macquarie', '-31.43333', '152.91667'),
(258, 14, 'Orange', '-33.28333', '149.1'),
(259, 14, 'Nowra', '-34.88333', '150.6'),
(260, 14, 'Nambour', '-26.63333', '152.95'),
(261, 14, 'Muswellbrook', '-32.26667', '150.9'),
(262, 14, 'Mount Druitt', '-33.76667', '150.81667'),
(263, 14, 'Mornington', '-38.21667', '145.03333'),
(264, 14, 'Mooloolaba', '-26.68333', '153.11667'),
(265, 14, 'Mildura', '-34.2', '142.15'),
(266, 14, 'Melton', '-37.68333', '144.58333'),
(267, 14, 'Lithgow', '-33.48333', '150.15'),
(268, 14, 'Katoomba', '-33.7', '150.3'),
(269, 14, 'Jervis Bay Territory', '-35.13333', '150.7'),
(270, 14, 'Innisfail', '-17.53333', '146.03333'),
(271, 14, 'Goulburn', '-34.75', '149.71667'),
(272, 14, 'Gladstone', '-23.85', '151.25'),
(273, 14, 'Dubbo', '-32.25', '148.61667'),
(274, 14, 'Devonport', '-41.16667', '146.35'),
(275, 14, 'Cleveland', '-27.53333', '153.26667'),
(276, 14, 'Cessnock', '-32.83333', '151.35'),
(277, 14, 'Caloundra', '-26.8', '153.13333'),
(278, 14, 'Bundaberg', '-24.85', '152.35'),
(279, 14, 'Batemans Bay', '-35.71667', '150.18333'),
(280, 14, 'Ballina', '-28.86667', '153.56667'),
(281, 14, 'Bairnsdale', '-37.83333', '147.61667'),
(282, 14, 'Armidale', '-30.51667', '151.65'),
(283, 14, 'Karratha', '-20.73765', '116.84629'),
(284, 14, 'York', '-31.9', '116.76667'),
(285, 14, 'Williamstown', '-34.66667', '138.86667'),
(286, 14, 'Whyalla', '-33.03333', '137.58333'),
(287, 14, 'Victor Harbour', '-35.56667', '138.61667'),
(288, 14, 'Two Wells', '-34.6', '138.5'),
(289, 14, 'Thebarton', '-34.91667', '138.56667'),
(290, 14, 'Tennant Creek', '-19.65', '134.2'),
(291, 14, 'South Perth', '-31.98333', '115.86667'),
(292, 14, 'Roebourne', '-20.78333', '117.13333'),
(293, 14, 'Port Hedland', '-20.31667', '118.56667'),
(294, 14, 'Mount Helena', '-31.88333', '116.2'),
(295, 14, 'Moora', '-30.65', '116.01667'),
(296, 14, 'Middle Swan', '-31.85', '116.01667'),
(297, 14, 'Meadows', '-35.18333', '138.75'),
(298, 14, 'Maylands', '-31.93333', '115.88333'),
(299, 14, 'Mallala', '-34.45', '138.5'),
(300, 14, 'Maitland', '-34.38333', '137.66667');

-- --------------------------------------------------------

--
-- Table structure for table `clickatell`
--

CREATE TABLE IF NOT EXISTS `clickatell` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `clickatell_key` varchar(100) DEFAULT NULL,
  `clickatell_api` varchar(100) DEFAULT NULL,
  `clickatell_username` varchar(100) DEFAULT NULL,
  `clickatell_password` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `clickatell`
--


-- --------------------------------------------------------

--
-- Table structure for table `cluster`
--

CREATE TABLE IF NOT EXISTS `cluster` (
  `id` int(11) NOT NULL,
  `location_id` bigint(20) NOT NULL DEFAULT '0',
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `latitude_min` double NOT NULL,
  `longitude_min` double NOT NULL,
  `latitude_max` double NOT NULL,
  `longitude_max` double NOT NULL,
  `child_count` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `left_side` int(11) NOT NULL,
  `right_side` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `incident_id` bigint(20) NOT NULL DEFAULT '0',
  `incident_title` varchar(255) DEFAULT NULL,
  `incident_date` int(10) NOT NULL DEFAULT '0',
  `category_id` int(11) unsigned NOT NULL DEFAULT '0',
  `category_color` varchar(20) NOT NULL DEFAULT '990000',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cluster`
--


-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) NOT NULL,
  `user_id` int(11) DEFAULT '0',
  `comment_author` varchar(100) DEFAULT NULL,
  `comment_email` varchar(120) DEFAULT NULL,
  `comment_description` text,
  `comment_ip` varchar(100) DEFAULT NULL,
  `comment_rating` varchar(15) NOT NULL DEFAULT '0',
  `comment_spam` tinyint(4) NOT NULL DEFAULT '0',
  `comment_active` tinyint(4) NOT NULL DEFAULT '0',
  `comment_date` datetime DEFAULT NULL,
  `comment_date_gmt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `comment`
--


-- --------------------------------------------------------

--
-- Table structure for table `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iso` varchar(10) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `capital` varchar(100) DEFAULT NULL,
  `cities` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=248 ;

--
-- Dumping data for table `country`
--

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_name` varchar(100) DEFAULT NULL,
  `service_description` varchar(255) DEFAULT NULL,
  `service_url` varchar(255) DEFAULT NULL,
  `service_api` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `service_name`, `service_description`, `service_url`, `service_api`) VALUES
(1, 'SMS', 'Text messages from phones', NULL, NULL),
(2, 'Email', 'Text messages from phones', NULL, NULL),
(3, 'Twitter', 'Tweets tweets tweets', 'http://twitter.com', NULL),
(4, 'Laconica', 'Tweets tweets tweets', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(127) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sessions`
--


-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) DEFAULT NULL,
  `site_tagline` varchar(255) DEFAULT NULL,
  `site_email` varchar(120) DEFAULT NULL,
  `site_key` varchar(100) DEFAULT NULL,
  `site_language` varchar(10) NOT NULL DEFAULT 'en_US',
  `site_style` varchar(50) NOT NULL DEFAULT 'default',
  `site_timezone` varchar(80) DEFAULT NULL,
  `site_contact_page` tinyint(4) NOT NULL DEFAULT '1',
  `site_help_page` tinyint(4) NOT NULL DEFAULT '1',
  `site_message` text NOT NULL,
  `site_copyright_statement` text,
  `allow_reports` tinyint(4) NOT NULL DEFAULT '1',
  `allow_comments` tinyint(4) NOT NULL DEFAULT '1',
  `allow_feed` tinyint(4) NOT NULL DEFAULT '1',
  `allow_stat_sharing` tinyint(4) NOT NULL DEFAULT '1',
  `allow_clustering` tinyint(4) NOT NULL DEFAULT '0',
  `cache_pages` tinyint(4) NOT NULL DEFAULT '0',
  `cache_pages_lifetime` int(4) NOT NULL DEFAULT '1800',
  `private_deployment` tinyint(4) NOT NULL DEFAULT '0',
  `default_map` varchar(100) NOT NULL DEFAULT 'google_normal',
  `default_map_all` varchar(20) NOT NULL DEFAULT 'CC0000',
  `api_google` varchar(200) DEFAULT NULL,
  `api_yahoo` varchar(200) DEFAULT NULL,
  `api_live` varchar(200) DEFAULT NULL,
  `api_akismet` varchar(200) DEFAULT NULL,
  `default_country` int(11) DEFAULT NULL,
  `multi_country` tinyint(4) NOT NULL DEFAULT '0',
  `default_city` varchar(150) DEFAULT NULL,
  `default_lat` varchar(100) DEFAULT NULL,
  `default_lon` varchar(100) DEFAULT NULL,
  `default_zoom` tinyint(4) NOT NULL DEFAULT '10',
  `items_per_page` smallint(6) NOT NULL DEFAULT '20',
  `items_per_page_admin` smallint(6) NOT NULL DEFAULT '20',
  `sms_provider` varchar(100) DEFAULT NULL,
  `sms_no1` varchar(100) DEFAULT NULL,
  `sms_no2` varchar(100) DEFAULT NULL,
  `sms_no3` varchar(100) DEFAULT NULL,
  `google_analytics` text,
  `twitter_hashtags` text,
  `laconica_username` varchar(50) DEFAULT NULL,
  `laconica_password` varchar(50) DEFAULT NULL,
  `laconica_site` varchar(30) DEFAULT NULL COMMENT 'a laconica site',
  `date_modify` datetime DEFAULT NULL,
  `stat_id` bigint(20) DEFAULT NULL COMMENT 'comes from centralized stats',
  `stat_key` varchar(30) NOT NULL,
  `email_username` varchar(100) NOT NULL,
  `email_password` varchar(100) NOT NULL,
  `email_port` int(11) NOT NULL,
  `email_host` varchar(100) NOT NULL,
  `email_servertype` varchar(100) NOT NULL,
  `email_ssl` int(5) NOT NULL,
  `ftp_server` varchar(100) DEFAULT NULL,
  `ftp_user_name` varchar(100) DEFAULT NULL,
  `alerts_email` varchar(120) NOT NULL,
  `db_version` varchar(20) DEFAULT NULL,
  `ushahidi_version` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `site_name`, `site_tagline`, `site_email`, `site_key`, `site_language`, `site_style`, `site_timezone`, `site_contact_page`, `site_help_page`, `site_message`, `site_copyright_statement`, `allow_reports`, `allow_comments`, `allow_feed`, `allow_stat_sharing`, `allow_clustering`, `cache_pages`, `cache_pages_lifetime`, `private_deployment`, `default_map`, `default_map_all`, `api_google`, `api_yahoo`, `api_live`, `api_akismet`, `default_country`, `multi_country`, `default_city`, `default_lat`, `default_lon`, `default_zoom`, `items_per_page`, `items_per_page_admin`, `sms_provider`, `sms_no1`, `sms_no2`, `sms_no3`, `google_analytics`, `twitter_hashtags`, `laconica_username`, `laconica_password`, `laconica_site`, `date_modify`, `stat_id`, `stat_key`, `email_username`, `email_password`, `email_port`, `email_host`, `email_servertype`, `email_ssl`, `ftp_server`, `ftp_user_name`, `alerts_email`, `db_version`, `ushahidi_version`) VALUES
(1, 'Bushfire Connect', 'Helping the community share bushfire information', 'info@bushfireconnect.org', NULL, 'en_US', 'default', 'Australia/Melbourne', 1, 1, 'The 2011-12 Fire Season has come to an end. Bushfire Connect is in Standby Mode and will not be moderated until next season.', '', 1, 1, 1, 1, 1, 0, 300, 0, 'google_normal', 'CC0000', 'ABQIAAAA-OxfK2ol-g6PEKgkKlI5OhTGxUf9qgI35ZkMhSEi8ORvXQ5RchR8sUuavbyRaAvJaTX8acO-TehsIw', '5CYeWbfV34E21JOW1a4.54Mf6e9jLNkD0HVzaKoQmJZi2qzmSZd5mD8X49x7', NULL, '1056d8e1ab53', 14, 0, 'nairobi', '-26.357988789504', '135.09140967413', 3, 20, 20, 'clickatell', '61429883485', '', '', 'UA-16855759-1', '#bushfireconnect, @bushfireconnect', NULL, NULL, NULL, '2012-04-12 20:30:56', 12151, '9b02fdeebd4d3e805cb52cdf21300a', 'info@bushfireconnect.org', 'BFC2010', 143, 'mail.bushfireconnect.org', 'imap', 0, NULL, NULL, 'info@bushfireconnect.org', '87', '2.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `sharing`
--

CREATE TABLE IF NOT EXISTS `sharing` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sharing_name` varchar(150) NOT NULL,
  `sharing_url` varchar(255) NOT NULL,
  `sharing_color` varchar(20) DEFAULT 'CC0000',
  `sharing_active` tinyint(4) NOT NULL DEFAULT '1',
  `sharing_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sharing`
--


-- --------------------------------------------------------

--
-- Table structure for table `sharing_incident`
--

CREATE TABLE IF NOT EXISTS `sharing_incident` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sharing_id` int(10) unsigned NOT NULL,
  `incident_id` int(11) NOT NULL,
  `incident_title` varchar(255) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `incident_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `sharing_incident`
--


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(127) NOT NULL,
  `username` varchar(31) NOT NULL DEFAULT '',
  `password` char(50) NOT NULL,
  `logins` int(10) unsigned NOT NULL DEFAULT '0',
  `last_login` int(10) unsigned DEFAULT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Flag incase admin opts in for email notifications',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_username` (`username`),
  UNIQUE KEY `uniq_email` (`email`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=36 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `username`, `password`, `logins`, `last_login`, `notify`, `updated`) VALUES
(1, 'Administrator', 'admin@admin', 'admin', '51734a65c6412945f6f11216a6a02ef25b27d824ce36eabc7c', 2710, 1330900598, 0, '2012-10-08 15:29:40');

-- --------------------------------------------------------

--
-- Table structure for table `user_tokens`
--

CREATE TABLE IF NOT EXISTS `user_tokens` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `user_agent` varchar(40) NOT NULL,
  `token` varchar(32) NOT NULL,
  `created` int(10) unsigned NOT NULL,
  `expires` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_token` (`token`),
  KEY `fk_user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `user_tokens`
--


-- --------------------------------------------------------

--
-- Table structure for table `verified`
--

CREATE TABLE IF NOT EXISTS `verified` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `incident_id` bigint(20) DEFAULT NULL,
  `idp_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `verified_comment` longtext,
  `verified_date` datetime DEFAULT NULL,
  `verified_status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `verified`
--

