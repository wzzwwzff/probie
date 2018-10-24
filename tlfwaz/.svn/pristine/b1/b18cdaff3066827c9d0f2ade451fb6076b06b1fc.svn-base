/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.7.18-log : Database - tlfwaz
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`tlfwaz` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `tlfwaz`;

/*Table structure for table `area` */

DROP TABLE IF EXISTS `area`;

CREATE TABLE `area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `areaName` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3b52090vod0epuua1ew62uv44` (`projectId`),
  CONSTRAINT `FK_3b52090vod0epuua1ew62uv44` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `area` */

LOCK TABLES `area` WRITE;

UNLOCK TABLES;

/*Table structure for table `azproject` */

DROP TABLE IF EXISTS `azproject`;

CREATE TABLE `azproject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `east` varchar(255) DEFAULT NULL,
  `memo` varchar(255) DEFAULT NULL,
  `north` varchar(255) DEFAULT NULL,
  `projectName` varchar(255) DEFAULT NULL,
  `south` varchar(255) DEFAULT NULL,
  `west` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `azproject` */

LOCK TABLES `azproject` WRITE;

UNLOCK TABLES;

/*Table structure for table `datadict` */

DROP TABLE IF EXISTS `datadict`;

CREATE TABLE `datadict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attributeColor` varchar(255) DEFAULT NULL,
  `attributeName` varchar(255) DEFAULT NULL,
  `attributeValue` varchar(255) DEFAULT NULL,
  `orderId` int(11) DEFAULT NULL,
  `validFlag` int(11) DEFAULT NULL,
  `parentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6E75EEA075335733` (`parentId`),
  CONSTRAINT `FK_j91v0lnct7a5odsc84ce3r338` FOREIGN KEY (`parentId`) REFERENCES `datadict` (`id`),
  CONSTRAINT `datadict_ibfk_1` FOREIGN KEY (`parentId`) REFERENCES `datadict` (`id`),
  CONSTRAINT `datadict_ibfk_2` FOREIGN KEY (`parentId`) REFERENCES `datadict` (`id`),
  CONSTRAINT `datadict_ibfk_3` FOREIGN KEY (`parentId`) REFERENCES `datadict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=834 DEFAULT CHARSET=utf8;

/*Data for the table `datadict` */

LOCK TABLES `datadict` WRITE;

insert  into `datadict`(`id`,`attributeColor`,`attributeName`,`attributeValue`,`orderId`,`validFlag`,`parentId`) values 
(83,NULL,'系统配置','系统配置',999,1,NULL),
(830,'','系统名称','天龙房地产定向安置房销售管理系统',10,1,83),
(831,'','系统版本','1.0',20,1,83),
(832,'','技术支持','北京佳木东方科技有限公司',30,1,83),
(833,'','数据库下载路径','D:\\MySQLDatabaseBackup\\tlfwaz',40,1,83);

UNLOCK TABLES;

/*Table structure for table `departmentinfo` */

DROP TABLE IF EXISTS `departmentinfo`;

CREATE TABLE `departmentinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activeFlag` int(11) DEFAULT NULL,
  `departmentCode` varchar(255) DEFAULT NULL,
  `departmentLevel` int(11) DEFAULT NULL,
  `departmentName` varchar(255) DEFAULT NULL,
  `levelCode` varchar(255) DEFAULT NULL,
  `memo` longtext,
  `orderIndex` int(11) DEFAULT NULL,
  `parentDepartmentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF05B2320E3C28C73` (`parentDepartmentId`),
  CONSTRAINT `FK_jpkul7grt1rtan3hlruu93l2x` FOREIGN KEY (`parentDepartmentId`) REFERENCES `departmentinfo` (`id`),
  CONSTRAINT `departmentinfo_ibfk_1` FOREIGN KEY (`parentDepartmentId`) REFERENCES `departmentinfo` (`id`),
  CONSTRAINT `departmentinfo_ibfk_2` FOREIGN KEY (`parentDepartmentId`) REFERENCES `departmentinfo` (`id`),
  CONSTRAINT `departmentinfo_ibfk_3` FOREIGN KEY (`parentDepartmentId`) REFERENCES `departmentinfo` (`id`),
  CONSTRAINT `departmentinfo_ibfk_4` FOREIGN KEY (`parentDepartmentId`) REFERENCES `departmentinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

/*Data for the table `departmentinfo` */

LOCK TABLES `departmentinfo` WRITE;

insert  into `departmentinfo`(`id`,`activeFlag`,`departmentCode`,`departmentLevel`,`departmentName`,`levelCode`,`memo`,`orderIndex`,`parentDepartmentId`) values 
(1,1,'110',NULL,'天龙房地产',NULL,NULL,1,NULL),
(39,1,'110001',NULL,'部门1',NULL,NULL,99,1),
(40,1,'110002',NULL,'部门2',NULL,NULL,99,1);

UNLOCK TABLES;

/*Table structure for table `deskcatalog` */

DROP TABLE IF EXISTS `deskcatalog`;

CREATE TABLE `deskcatalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `able` int(11) NOT NULL DEFAULT '1',
  `createDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `deskcatalog` */

LOCK TABLES `deskcatalog` WRITE;

UNLOCK TABLES;

/*Table structure for table `deskfile` */

DROP TABLE IF EXISTS `deskfile`;

CREATE TABLE `deskfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `able` int(11) NOT NULL DEFAULT '1',
  `fileName` varchar(255) DEFAULT NULL,
  `filePath` varchar(255) DEFAULT NULL,
  `fileSize` bigint(20) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `suffixes` varchar(255) DEFAULT NULL,
  `uploadDate` datetime DEFAULT NULL,
  `uploadPerson` varchar(255) DEFAULT NULL,
  `deskCatalogId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fsgd34ky0pbvjhcf55vxc36eq` (`deskCatalogId`),
  CONSTRAINT `FK_fsgd34ky0pbvjhcf55vxc36eq` FOREIGN KEY (`deskCatalogId`) REFERENCES `deskcatalog` (`id`),
  CONSTRAINT `deskfile_ibfk_1` FOREIGN KEY (`deskCatalogId`) REFERENCES `deskcatalog` (`id`),
  CONSTRAINT `deskfile_ibfk_2` FOREIGN KEY (`deskCatalogId`) REFERENCES `deskcatalog` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `deskfile` */

LOCK TABLES `deskfile` WRITE;

UNLOCK TABLES;

/*Table structure for table `family` */

DROP TABLE IF EXISTS `family`;

CREATE TABLE `family` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `azArea` decimal(19,2) DEFAULT NULL,
  `familyCode` varchar(255) DEFAULT NULL,
  `fwzl` varchar(255) DEFAULT NULL,
  `gfArea` decimal(19,2) DEFAULT NULL,
  `houseNum` int(11) DEFAULT NULL,
  `idCard` varchar(255) DEFAULT NULL,
  `inArea` decimal(19,2) DEFAULT NULL,
  `inHouseMoney` decimal(19,2) DEFAULT NULL,
  `jsDate` datetime DEFAULT NULL,
  `jsPerson` varchar(255) DEFAULT NULL,
  `jsStatus` int(11) NOT NULL DEFAULT '1',
  `memo` varchar(255) DEFAULT NULL,
  `moveBackDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `outArea` decimal(19,2) DEFAULT NULL,
  `outHouseMoney` decimal(19,2) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT NULL,
  `signDate` datetime DEFAULT NULL,
  `totalHouseMoney` decimal(19,2) DEFAULT NULL,
  `totalMoney` decimal(19,2) DEFAULT NULL,
  `xfBatch` int(11) DEFAULT NULL,
  `xfDate` datetime DEFAULT NULL,
  `xfNum` int(11) DEFAULT NULL,
  `xfStatus` int(11) NOT NULL DEFAULT '1',
  `xyPrintDate` datetime DEFAULT NULL,
  `areaId` int(11) DEFAULT NULL,
  `projectId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_8urv5opi7bojtrqi7dvod8ut9` (`areaId`),
  KEY `FK_fs9749x98sloktdvk114ie6e9` (`projectId`),
  CONSTRAINT `FK_8urv5opi7bojtrqi7dvod8ut9` FOREIGN KEY (`areaId`) REFERENCES `area` (`id`),
  CONSTRAINT `FK_fs9749x98sloktdvk114ie6e9` FOREIGN KEY (`projectId`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `family` */

LOCK TABLES `family` WRITE;

UNLOCK TABLES;

/*Table structure for table `familyperson` */

DROP TABLE IF EXISTS `familyperson`;

CREATE TABLE `familyperson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `isRegistered` int(11) DEFAULT NULL,
  `pAddress` varchar(255) DEFAULT NULL,
  `pIdCard` varchar(255) DEFAULT NULL,
  `pMemo` text,
  `pName` varchar(255) DEFAULT NULL,
  `pPhone` varchar(255) DEFAULT NULL,
  `pRelation` varchar(255) DEFAULT NULL,
  `pSex` int(11) DEFAULT NULL,
  `familyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_ta2a224c5r3lwg41nkckrjahr` (`familyId`),
  CONSTRAINT `FK_ta2a224c5r3lwg41nkckrjahr` FOREIGN KEY (`familyId`) REFERENCES `family` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `familyperson` */

LOCK TABLES `familyperson` WRITE;

UNLOCK TABLES;

/*Table structure for table `historyinfo` */

DROP TABLE IF EXISTS `historyinfo`;

CREATE TABLE `historyinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `computerId` varchar(255) DEFAULT NULL,
  `data` longtext,
  `dataPhase` int(11) DEFAULT NULL,
  `familyId` int(11) DEFAULT NULL,
  `familyPersonData` longtext,
  `houseData` longtext,
  `operateDate` datetime DEFAULT NULL,
  `operatePerson` varchar(255) DEFAULT NULL,
  `orderFlag` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `historyinfo` */

LOCK TABLES `historyinfo` WRITE;

UNLOCK TABLES;

/*Table structure for table `house` */

DROP TABLE IF EXISTS `house`;

CREATE TABLE `house` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `buildArea` decimal(19,2) DEFAULT NULL,
  `buildNum` varchar(255) DEFAULT NULL,
  `chooseDate` datetime DEFAULT NULL,
  `hIdCard` varchar(255) DEFAULT NULL,
  `hPerson` varchar(255) DEFAULT NULL,
  `houseNum` varchar(255) DEFAULT NULL,
  `houseStatus` int(11) NOT NULL DEFAULT '1',
  `houseType` int(11) DEFAULT NULL,
  `memo` text,
  `opDate` datetime DEFAULT NULL,
  `opName` varchar(255) DEFAULT NULL,
  `price` decimal(19,2) DEFAULT NULL,
  `rzDate` datetime DEFAULT NULL,
  `rzName` varchar(255) DEFAULT NULL,
  `rzStatus` int(11) NOT NULL DEFAULT '1',
  `unitNum` varchar(255) DEFAULT NULL,
  `areaId` int(11) DEFAULT NULL,
  `azProjectId` int(11) DEFAULT NULL,
  `familyId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_a9mqnl9sdf9oar7a7y2q4204f` (`areaId`),
  KEY `FK_6kw4u14usnmeho4djp7k3vslw` (`azProjectId`),
  KEY `FK_9iwvg002qlcngf054gfoy8gfl` (`familyId`),
  CONSTRAINT `FK_6kw4u14usnmeho4djp7k3vslw` FOREIGN KEY (`azProjectId`) REFERENCES `azproject` (`id`),
  CONSTRAINT `FK_9iwvg002qlcngf054gfoy8gfl` FOREIGN KEY (`familyId`) REFERENCES `family` (`id`),
  CONSTRAINT `FK_a9mqnl9sdf9oar7a7y2q4204f` FOREIGN KEY (`areaId`) REFERENCES `area` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `house` */

LOCK TABLES `house` WRITE;

UNLOCK TABLES;

/*Table structure for table `loginfo` */

DROP TABLE IF EXISTS `loginfo`;

CREATE TABLE `loginfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `clickTime` datetime DEFAULT NULL,
  `clickUri` varchar(255) DEFAULT NULL,
  `clickUrl` varchar(255) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  `userRealName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `loginfo` */

LOCK TABLES `loginfo` WRITE;

UNLOCK TABLES;

/*Table structure for table `menuinfo` */

DROP TABLE IF EXISTS `menuinfo`;

CREATE TABLE `menuinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activeFlag` int(11) DEFAULT NULL,
  `desEncoding` varchar(255) DEFAULT NULL,
  `isQuery` int(11) DEFAULT NULL,
  `menuLevel` int(11) DEFAULT NULL,
  `menuUrl` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `orderIndex` int(11) DEFAULT NULL,
  `resourceUrl` varchar(255) DEFAULT NULL,
  `parentMenuId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKDBFE26AD1328D84D` (`parentMenuId`),
  CONSTRAINT `FK_jd0ml70rfybl5wxfd9cyvxhvj` FOREIGN KEY (`parentMenuId`) REFERENCES `menuinfo` (`id`),
  CONSTRAINT `menuinfo_ibfk_1` FOREIGN KEY (`parentMenuId`) REFERENCES `menuinfo` (`id`),
  CONSTRAINT `menuinfo_ibfk_2` FOREIGN KEY (`parentMenuId`) REFERENCES `menuinfo` (`id`),
  CONSTRAINT `menuinfo_ibfk_3` FOREIGN KEY (`parentMenuId`) REFERENCES `menuinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=262 DEFAULT CHARSET=utf8;

/*Data for the table `menuinfo` */

LOCK TABLES `menuinfo` WRITE;

insert  into `menuinfo`(`id`,`activeFlag`,`desEncoding`,`isQuery`,`menuLevel`,`menuUrl`,`name`,`orderIndex`,`resourceUrl`,`parentMenuId`) values 
(1,1,NULL,NULL,1,'','管理系统',1,'',NULL),
(3,1,NULL,NULL,1,'','系统基础配置',200,'',1),
(4,1,NULL,NULL,1,'','系统权限管理',300,'',1),
(5,1,NULL,NULL,1,'','用户权限管理',400,'',1),
(9,1,NULL,NULL,1,'/dataDict/list.do','数据字典管理',10,'',3),
(12,1,NULL,NULL,1,'/permission/menu/index.do','菜单管理',30,'',4),
(13,1,NULL,NULL,1,'/permission/role/list.do','角色管理',40,'',4),
(14,1,NULL,NULL,1,'/permission/role/roleManage.do','角色权限',50,'',4),
(16,1,NULL,NULL,1,'/permission/department/list.do','部门管理',10,'',5),
(17,1,NULL,NULL,1,'/permission/user/list.do','用户管理',20,'',5),
(234,1,NULL,NULL,0,'','数据备份查询',170,NULL,1),
(235,1,NULL,NULL,0,'/dataBackDown/list','数据库备份',10,NULL,234),
(236,1,NULL,NULL,0,'/SQLExecute/list','数据库查询',20,NULL,234),
(243,1,NULL,NULL,0,'','基础数据维护',150,NULL,1),
(245,1,NULL,NULL,0,'/cq/desk/deskCatalogList','桌面文件管理',50,NULL,243),
(246,1,NULL,NULL,0,'','基础数据管理',5,NULL,1),
(247,1,NULL,NULL,0,'','基础数据导入',10,NULL,246),
(248,1,NULL,NULL,0,'','安置房源管理',10,NULL,1),
(249,1,NULL,NULL,0,'','安置房源管理',5,NULL,248),
(250,1,NULL,NULL,0,'','电子选房管理',15,NULL,1),
(251,1,NULL,NULL,0,'','电子选房管理',5,NULL,250),
(252,1,NULL,NULL,0,'','变更购房人管理',20,NULL,1),
(253,1,NULL,NULL,0,'','变更购房人管理',5,NULL,252),
(254,1,NULL,NULL,0,'','结算业务办理',25,NULL,1),
(255,1,NULL,NULL,0,'','结算业务办理',5,NULL,254),
(256,1,NULL,NULL,0,'','入住业务办理',30,NULL,1),
(257,1,NULL,NULL,0,'','入住业务办理',5,NULL,256),
(258,1,NULL,NULL,0,'','数据统计查询',35,NULL,1),
(259,1,NULL,NULL,0,'','综合数据查询',5,NULL,258),
(260,1,NULL,NULL,0,'','项目信息管理',5,NULL,246),
(261,1,NULL,NULL,0,'','楼栋分配管理',8,NULL,246);

UNLOCK TABLES;

/*Table structure for table `operationlog` */

DROP TABLE IF EXISTS `operationlog`;

CREATE TABLE `operationlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `operationlog` */

LOCK TABLES `operationlog` WRITE;

UNLOCK TABLES;

/*Table structure for table `project` */

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memo` varchar(255) DEFAULT NULL,
  `projectName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `project` */

LOCK TABLES `project` WRITE;

UNLOCK TABLES;

/*Table structure for table `roleinfo` */

DROP TABLE IF EXISTS `roleinfo`;

CREATE TABLE `roleinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activeFlag` int(11) DEFAULT NULL,
  `orderIndex` int(11) DEFAULT NULL,
  `roleDescription` varchar(255) DEFAULT NULL,
  `roleLevel` int(11) DEFAULT NULL,
  `roleName` varchar(255) DEFAULT NULL,
  `simpleFaceUrl` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `roleinfo` */

LOCK TABLES `roleinfo` WRITE;

insert  into `roleinfo`(`id`,`activeFlag`,`orderIndex`,`roleDescription`,`roleLevel`,`roleName`,`simpleFaceUrl`) values 
(1,1,1,'系统管理员',1,'系统管理员',NULL);

UNLOCK TABLES;

/*Table structure for table `rolemenu` */

DROP TABLE IF EXISTS `rolemenu`;

CREATE TABLE `rolemenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKF018DEF568007723` (`menuId`),
  KEY `FKF018DEF57116E391` (`roleId`),
  CONSTRAINT `FK_cfg24gqmabbkvi9biyqpst593` FOREIGN KEY (`menuId`) REFERENCES `menuinfo` (`id`),
  CONSTRAINT `FK_mmb1was7d41vn2m02ilwp3c84` FOREIGN KEY (`roleId`) REFERENCES `roleinfo` (`id`),
  CONSTRAINT `rolemenu_ibfk_1` FOREIGN KEY (`menuId`) REFERENCES `menuinfo` (`id`),
  CONSTRAINT `rolemenu_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `roleinfo` (`id`),
  CONSTRAINT `rolemenu_ibfk_3` FOREIGN KEY (`menuId`) REFERENCES `menuinfo` (`id`),
  CONSTRAINT `rolemenu_ibfk_4` FOREIGN KEY (`roleId`) REFERENCES `roleinfo` (`id`),
  CONSTRAINT `rolemenu_ibfk_5` FOREIGN KEY (`menuId`) REFERENCES `menuinfo` (`id`),
  CONSTRAINT `rolemenu_ibfk_6` FOREIGN KEY (`roleId`) REFERENCES `roleinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1973 DEFAULT CHARSET=utf8;

/*Data for the table `rolemenu` */

LOCK TABLES `rolemenu` WRITE;

insert  into `rolemenu`(`id`,`menuId`,`roleId`) values 
(1939,1,1),
(1940,243,1),
(1941,245,1),
(1942,234,1),
(1943,235,1),
(1944,236,1),
(1945,3,1),
(1946,9,1),
(1947,4,1),
(1948,12,1),
(1949,13,1),
(1950,14,1),
(1951,5,1),
(1952,16,1),
(1953,17,1),
(1955,246,1),
(1957,248,1),
(1958,249,1),
(1959,250,1),
(1960,251,1),
(1961,252,1),
(1962,253,1),
(1963,254,1),
(1964,255,1),
(1965,256,1),
(1966,257,1),
(1967,258,1),
(1968,259,1),
(1969,260,1),
(1970,247,1),
(1972,261,1);

UNLOCK TABLES;

/*Table structure for table `sqlexecuteinfo` */

DROP TABLE IF EXISTS `sqlexecuteinfo`;

CREATE TABLE `sqlexecuteinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sqlExecute` text,
  `sqlTitle` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sqlexecuteinfo` */

LOCK TABLES `sqlexecuteinfo` WRITE;

UNLOCK TABLES;

/*Table structure for table `userdepartment` */

DROP TABLE IF EXISTS `userdepartment`;

CREATE TABLE `userdepartment` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `departmentId` int(10) DEFAULT NULL,
  `userId` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PK__userDepartment__60FC61CA` (`id`),
  KEY `FK5F87097D4C6132C9` (`departmentId`),
  KEY `FK5F87097D766C38FB` (`userId`),
  CONSTRAINT `userdepartment_ibfk_1` FOREIGN KEY (`departmentId`) REFERENCES `departmentinfo` (`id`),
  CONSTRAINT `userdepartment_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `userinfo` (`id`),
  CONSTRAINT `userdepartment_ibfk_3` FOREIGN KEY (`departmentId`) REFERENCES `departmentinfo` (`id`),
  CONSTRAINT `userdepartment_ibfk_4` FOREIGN KEY (`userId`) REFERENCES `userinfo` (`id`),
  CONSTRAINT `userdepartment_ibfk_5` FOREIGN KEY (`departmentId`) REFERENCES `departmentinfo` (`id`),
  CONSTRAINT `userdepartment_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `userinfo` (`id`),
  CONSTRAINT `userdepartment_ibfk_7` FOREIGN KEY (`departmentId`) REFERENCES `departmentinfo` (`id`),
  CONSTRAINT `userdepartment_ibfk_8` FOREIGN KEY (`userId`) REFERENCES `userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `userdepartment` */

LOCK TABLES `userdepartment` WRITE;

insert  into `userdepartment`(`id`,`departmentId`,`userId`) values 
(1,1,1);

UNLOCK TABLES;

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activeFlag` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deviceToken` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `guid` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `idcard` varchar(255) DEFAULT NULL,
  `lastUpdateTime` datetime DEFAULT NULL,
  `loginTime` datetime DEFAULT NULL,
  `onlineStatus` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `pin` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `ukey` varchar(255) DEFAULT NULL,
  `userLevel` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `departmentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_387uopq47ictcaulg4bo8f6bq` (`departmentId`),
  CONSTRAINT `FK_387uopq47ictcaulg4bo8f6bq` FOREIGN KEY (`departmentId`) REFERENCES `departmentinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `userinfo` */

LOCK TABLES `userinfo` WRITE;

insert  into `userinfo`(`id`,`activeFlag`,`createDate`,`description`,`deviceToken`,`email`,`guid`,`icon`,`idcard`,`lastUpdateTime`,`loginTime`,`onlineStatus`,`password`,`pin`,`realName`,`sort`,`tel`,`ukey`,`userLevel`,`username`,`departmentId`) values 
(1,1,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'2018-09-05 09:02:21',NULL,'jmdf2018','','管理员',NULL,NULL,'',0,'admin',1);

UNLOCK TABLES;

/*Table structure for table `userrole` */

DROP TABLE IF EXISTS `userrole`;

CREATE TABLE `userrole` (
  `userId` int(11) NOT NULL,
  `roleId` int(11) NOT NULL,
  KEY `FKF01D02E1766ACDA6` (`roleId`),
  KEY `FKF01D02E1766C38FB` (`userId`),
  CONSTRAINT `FK_87y6uep75gjkmir2b8kx05ha4` FOREIGN KEY (`userId`) REFERENCES `userinfo` (`id`),
  CONSTRAINT `FK_e4fwjmiekbeu51ejvtati2ab9` FOREIGN KEY (`roleId`) REFERENCES `roleinfo` (`id`),
  CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`roleId`) REFERENCES `roleinfo` (`id`),
  CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`roleId`) REFERENCES `roleinfo` (`id`),
  CONSTRAINT `userrole_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `userinfo` (`id`),
  CONSTRAINT `userrole_ibfk_4` FOREIGN KEY (`roleId`) REFERENCES `roleinfo` (`id`),
  CONSTRAINT `userrole_ibfk_5` FOREIGN KEY (`roleId`) REFERENCES `roleinfo` (`id`),
  CONSTRAINT `userrole_ibfk_6` FOREIGN KEY (`userId`) REFERENCES `userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `userrole` */

LOCK TABLES `userrole` WRITE;

insert  into `userrole`(`userId`,`roleId`) values 
(1,1);

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
