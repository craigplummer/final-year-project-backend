# Sequel Pro dump
# Version 2492
# http://code.google.com/p/sequel-pro
#
# Host: black.cds.net.uk (MySQL 5.0.77)
# Database: ticketseller_co_uk
# Generation Time: 2010-11-08 22:50:38 +0000
# ************************************************************

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table crm_accounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `crm_accounts`;

CREATE TABLE `crm_accounts` (
  `uuid` varchar(50) NOT NULL,
  `company` varchar(200) NOT NULL,
  `email` varchar(150) NOT NULL,
  `address1` varchar(100) default NULL,
  `address2` varchar(100) default NULL,
  `town` varchar(100) default NULL,
  `county` varchar(100) default NULL,
  `country` varchar(100) default NULL,
  `tac` datetime default NULL,
  PRIMARY KEY  (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table crm_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `crm_users`;

CREATE TABLE `crm_users` (
  `uuid` varchar(50) NOT NULL,
  `account_uuid` varchar(50) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(100) default NULL,
  PRIMARY KEY  (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `crm_users` WRITE;
/*!40000 ALTER TABLE `crm_users` DISABLE KEYS */;
INSERT INTO `crm_users` (`uuid`,`account_uuid`,`firstname`,`surname`,`email`,`phone`)
VALUES
	('','','','','',NULL);

/*!40000 ALTER TABLE `crm_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ts_audit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ts_audit`;

CREATE TABLE `ts_audit` (
  `id` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ts_customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ts_customers`;

CREATE TABLE `ts_customers` (
  `uuid` varchar(50) default NULL,
  `deviceid` varchar(50) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ts_events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ts_events`;

CREATE TABLE `ts_events` (
  `id` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ts_idcards
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ts_idcards`;

CREATE TABLE `ts_idcards` (
  `id` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ts_oldreservations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ts_oldreservations`;

CREATE TABLE `ts_oldreservations` (
  `id` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ts_sales
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ts_sales`;

CREATE TABLE `ts_sales` (
  `id` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ts_status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ts_status`;

CREATE TABLE `ts_status` (
  `id` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ts_syslayouts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ts_syslayouts`;

CREATE TABLE `ts_syslayouts` (
  `id` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ts_syslocations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ts_syslocations`;

CREATE TABLE `ts_syslocations` (
  `id` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ts_sysprinters
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ts_sysprinters`;

CREATE TABLE `ts_sysprinters` (
  `id` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ts_sysreports
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ts_sysreports`;

CREATE TABLE `ts_sysreports` (
  `id` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ts_systemsettings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ts_systemsettings`;

CREATE TABLE `ts_systemsettings` (
  `id` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ts_tsa_nominalroll
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ts_tsa_nominalroll`;

CREATE TABLE `ts_tsa_nominalroll` (
  `id` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ts_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ts_users`;

CREATE TABLE `ts_users` (
  `id` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ts_venues
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ts_venues`;

CREATE TABLE `ts_venues` (
  `uuid` varchar(60) NOT NULL default '',
  `name` varchar(250) default NULL,
  `description` varchar(250) default NULL,
  `location` varchar(250) default NULL,
  `gps` varchar(250) default NULL,
  PRIMARY KEY  (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

LOCK TABLES `ts_venues` WRITE;
/*!40000 ALTER TABLE `ts_venues` DISABLE KEYS */;
INSERT INTO `ts_venues` (`uuid`,`name`,`description`,`location`,`gps`)
VALUES
	('AB1BB5ED-9F52-79C8-2E56715593795357','Forum Hertfordshire','','Hatfield, Hertfordshire',''),
	('B0F92B28-9C69-BF39-100F5111E5460463','Gilwell Park Scout Activity Centre','','Chingford, London',''),
	('B0FD4765-DE6F-79DC-41F8682806035074','The White House, Gilwell Park','','Chingford, London','');

/*!40000 ALTER TABLE `ts_venues` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ts_vouchers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ts_vouchers`;

CREATE TABLE `ts_vouchers` (
  `uuid` varchar(50) default NULL,
  `code` varchar(15) default NULL,
  `description` varchar(250) default NULL,
  `type` varchar(20) default NULL,
  `available` int(11) default NULL,
  `redeemed` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;



# Dump of table ts_worldpay
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ts_worldpay`;

CREATE TABLE `ts_worldpay` (
  `id` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;






/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
