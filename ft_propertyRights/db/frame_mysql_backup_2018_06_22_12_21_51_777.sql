-- MySQL dump 10.13  Distrib 5.6.37, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: frame_mysql
-- ------------------------------------------------------
-- Server version	5.6.37-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `datadict`
--

DROP TABLE IF EXISTS `datadict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=826 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datadict`
--

LOCK TABLES `datadict` WRITE;
/*!40000 ALTER TABLE `datadict` DISABLE KEYS */;
INSERT INTO `datadict` VALUES (83,NULL,'系统配置','系统配置',999,1,NULL),(822,'','系统名称','管理系统',10,1,83),(823,'','系统版本','1.0',20,1,83),(824,'','技术支持','北京佳木东方科技有限公司',30,1,83),(825,'','数据库下载路径','D:\\MySQLDatabaseBackup\\frame_mysql',40,1,83);
/*!40000 ALTER TABLE `datadict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departmentinfo`
--

DROP TABLE IF EXISTS `departmentinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departmentinfo`
--

LOCK TABLES `departmentinfo` WRITE;
/*!40000 ALTER TABLE `departmentinfo` DISABLE KEYS */;
INSERT INTO `departmentinfo` VALUES (1,1,'110',NULL,'项目',NULL,NULL,1,NULL),(39,1,'110001',NULL,'部门1',NULL,NULL,99,1),(40,1,'110002',NULL,'部门2',NULL,NULL,99,1);
/*!40000 ALTER TABLE `departmentinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deskcatalog`
--

DROP TABLE IF EXISTS `deskcatalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deskcatalog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `able` int(11) NOT NULL DEFAULT '1',
  `createDate` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deskcatalog`
--

LOCK TABLES `deskcatalog` WRITE;
/*!40000 ALTER TABLE `deskcatalog` DISABLE KEYS */;
/*!40000 ALTER TABLE `deskcatalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deskfile`
--

DROP TABLE IF EXISTS `deskfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deskfile`
--

LOCK TABLES `deskfile` WRITE;
/*!40000 ALTER TABLE `deskfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `deskfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familytest`
--

DROP TABLE IF EXISTS `familytest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `familytest` (
  `楼层` varchar(255) DEFAULT NULL,
  `姓名` varchar(255) DEFAULT NULL,
  `建筑面积` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familytest`
--

LOCK TABLES `familytest` WRITE;
/*!40000 ALTER TABLE `familytest` DISABLE KEYS */;
/*!40000 ALTER TABLE `familytest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginfo`
--

DROP TABLE IF EXISTS `loginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginfo`
--

LOCK TABLES `loginfo` WRITE;
/*!40000 ALTER TABLE `loginfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `loginfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuinfo`
--

DROP TABLE IF EXISTS `menuinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuinfo`
--

LOCK TABLES `menuinfo` WRITE;
/*!40000 ALTER TABLE `menuinfo` DISABLE KEYS */;
INSERT INTO `menuinfo` VALUES (1,1,NULL,NULL,1,'','管理系统',1,'',NULL),(3,1,NULL,NULL,1,'','系统基础配置',200,'',1),(4,1,NULL,NULL,1,'','系统权限管理',300,'',1),(5,1,NULL,NULL,1,'','用户权限管理',400,'',1),(9,1,NULL,NULL,1,'/dataDict/list.do','数据字典管理',10,'',3),(12,1,NULL,NULL,1,'/permission/menu/index.do','菜单管理',30,'',4),(13,1,NULL,NULL,1,'/permission/role/list.do','角色管理',40,'',4),(14,1,NULL,NULL,1,'/permission/role/roleManage.do','角色权限',50,'',4),(16,1,NULL,NULL,1,'/permission/department/list.do','部门管理',10,'',5),(17,1,NULL,NULL,1,'/permission/user/list.do','用户管理',20,'',5),(234,1,NULL,NULL,0,'','数据备份查询',170,NULL,1),(235,1,NULL,NULL,0,'/dataBackDown/list','数据库备份',10,NULL,234),(236,1,NULL,NULL,0,'/SQLExecute/list','数据库查询',20,NULL,234),(243,1,NULL,NULL,0,'','基础数据维护',150,NULL,1),(245,1,NULL,NULL,0,'/cq/desk/deskCatalogList','桌面文件管理',50,NULL,243);
/*!40000 ALTER TABLE `menuinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operationlog`
--

DROP TABLE IF EXISTS `operationlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operationlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `addDate` datetime DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `realName` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operationlog`
--

LOCK TABLES `operationlog` WRITE;
/*!40000 ALTER TABLE `operationlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `operationlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roleinfo`
--

DROP TABLE IF EXISTS `roleinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roleinfo`
--

LOCK TABLES `roleinfo` WRITE;
/*!40000 ALTER TABLE `roleinfo` DISABLE KEYS */;
INSERT INTO `roleinfo` VALUES (1,1,1,'系统管理员',1,'系统管理员',NULL);
/*!40000 ALTER TABLE `roleinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rolemenu`
--

DROP TABLE IF EXISTS `rolemenu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=1954 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rolemenu`
--

LOCK TABLES `rolemenu` WRITE;
/*!40000 ALTER TABLE `rolemenu` DISABLE KEYS */;
INSERT INTO `rolemenu` VALUES (1939,1,1),(1940,243,1),(1941,245,1),(1942,234,1),(1943,235,1),(1944,236,1),(1945,3,1),(1946,9,1),(1947,4,1),(1948,12,1),(1949,13,1),(1950,14,1),(1951,5,1),(1952,16,1),(1953,17,1);
/*!40000 ALTER TABLE `rolemenu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sqlexecuteinfo`
--

DROP TABLE IF EXISTS `sqlexecuteinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sqlexecuteinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sqlExecute` text,
  `sqlTitle` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sqlexecuteinfo`
--

LOCK TABLES `sqlexecuteinfo` WRITE;
/*!40000 ALTER TABLE `sqlexecuteinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `sqlexecuteinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userdepartment`
--

DROP TABLE IF EXISTS `userdepartment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userdepartment`
--

LOCK TABLES `userdepartment` WRITE;
/*!40000 ALTER TABLE `userdepartment` DISABLE KEYS */;
INSERT INTO `userdepartment` VALUES (1,1,1);
/*!40000 ALTER TABLE `userdepartment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userinfo`
--

LOCK TABLES `userinfo` WRITE;
/*!40000 ALTER TABLE `userinfo` DISABLE KEYS */;
INSERT INTO `userinfo` VALUES (1,1,NULL,NULL,NULL,NULL,'',NULL,NULL,NULL,'2018-06-22 12:20:19',NULL,'jmdf2018','','管理员',NULL,NULL,'',0,'admin',1);
/*!40000 ALTER TABLE `userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userrole`
--

LOCK TABLES `userrole` WRITE;
/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` VALUES (1,1);
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-22 12:21:52
