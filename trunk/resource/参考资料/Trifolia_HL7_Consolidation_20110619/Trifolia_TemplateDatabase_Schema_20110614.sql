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
-- Current Database: `templatedb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `templatedb` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `templatedb`;

--
-- Table structure for table `associationtemplateimplementationguide`
--

DROP TABLE IF EXISTS `associationtemplateimplementationguide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `associationtemplateimplementationguide` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `templateId` bigint(20) DEFAULT NULL,
  `implementationGuideId` bigint(20) DEFAULT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UniquComposite` (`templateId`,`implementationGuideId`),
  KEY `implementationGuideId` (`implementationGuideId`),
  KEY `templateId` (`templateId`),
  KEY `TemplateId_FK` (`templateId`),
  KEY `ImplementationGuideId_FK` (`implementationGuideId`),
  CONSTRAINT `ImplementationGuideId_FK` FOREIGN KEY (`implementationGuideId`) REFERENCES `implementationguide` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TemplateId_FK` FOREIGN KEY (`templateId`) REFERENCES `template` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15272 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `conformance_type`
--

DROP TABLE IF EXISTS `conformance_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `conformance_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `conftype` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_UNIQUE` (`conftype`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dictionarycodesystem`
--

DROP TABLE IF EXISTS `dictionarycodesystem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dictionarycodesystem` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OID` varchar(255) NOT NULL,
  `codeSystemName` varchar(255) NOT NULL,
  `description` longtext,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `OID_UNIQUE` (`OID`),
  UNIQUE KEY `codeSystemName_UNIQUE` (`codeSystemName`),
  KEY `codeSystemName` (`codeSystemName`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `dictionarycontext`
--

DROP TABLE IF EXISTS `dictionarycontext`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dictionarycontext` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `context` varchar(255) NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `context` (`context`)
) ENGINE=InnoDB AUTO_INCREMENT=260 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `implementationguide`
--

DROP TABLE IF EXISTS `implementationguide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `implementationguide` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tdb_users`
--

DROP TABLE IF EXISTS `tdb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tdb_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL,
  `user_password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`user_name`),
  UNIQUE KEY `user_name_UNIQUE` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template`
--

DROP TABLE IF EXISTS `template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OID` varchar(255) NOT NULL,
  `isOpen` tinyint(1) DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `templatetype` int(11) NOT NULL,
  `description` longtext,
  `keywords` varchar(255) DEFAULT NULL,
  `primaryContext` bigint(20) DEFAULT NULL,
  `impliedTemplate` bigint(20) DEFAULT NULL,
  `notes` longtext,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uname` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `OID` (`OID`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `keywords` (`keywords`),
  KEY `PrimaryContext_FK` (`primaryContext`),
  KEY `t_primaryContext_FK` (`primaryContext`),
  KEY `ImpliedTemplateOID_FK` (`impliedTemplate`),
  KEY `t_impliedTemplateOID_FK` (`impliedTemplate`),
  KEY `t_type_FK` (`templatetype`),
  KEY `t_uname_FK` (`uname`),
  CONSTRAINT `t_uname_FK` FOREIGN KEY (`uname`) REFERENCES `tdb_users` (`user_name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `t_impliedTemplateOID_FK` FOREIGN KEY (`impliedTemplate`) REFERENCES `template` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_primaryContext_FK` FOREIGN KEY (`primaryContext`) REFERENCES `dictionarycontext` (`ID`),
  CONSTRAINT `t_type_FK` FOREIGN KEY (`templatetype`) REFERENCES `template_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=754 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_constraint`
--

DROP TABLE IF EXISTS `template_constraint`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_constraint` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `parentConstraintID` bigint(20) DEFAULT NULL,
  `templateID` bigint(20) NOT NULL,
  `order` float DEFAULT NULL,
  `isBranch` tinyint(1) DEFAULT '0',
  `businessConformance` int(11) DEFAULT NULL,
  `cardinality` varchar(255) DEFAULT NULL,
  `context` bigint(20) DEFAULT NULL,
  `containedTemplate` bigint(20) DEFAULT NULL,
  `isPrimitive` tinyint(1) DEFAULT '0',
  `constraintNarrative` longtext,
  `valueConformance` int(11) DEFAULT NULL,
  `staticDynamic` int(11) DEFAULT NULL,
  `valueSetOID` bigint(20) DEFAULT NULL,
  `version` datetime DEFAULT NULL,
  `codeOrValue` varchar(255) DEFAULT NULL,
  `codeSystemOID` bigint(20) DEFAULT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `datatype` varchar(255) DEFAULT NULL,
  `schematronTest` longtext,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `uname` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `codeOrValue` (`codeOrValue`),
  KEY `codeSystemOID` (`codeSystemOID`),
  KEY `parentConstraintID` (`parentConstraintID`),
  KEY `templateID` (`templateID`),
  KEY `valueSetOID` (`valueSetOID`),
  KEY `parentConstraintID_FK` (`parentConstraintID`),
  KEY `tc_templateID_FK` (`templateID`),
  KEY `tc_valueSetOID_FK` (`valueSetOID`),
  KEY `tc_codeSystemOID_FK` (`codeSystemOID`),
  KEY `tc_containedTemplate_FK` (`containedTemplate`),
  KEY `tc_businessConformance_FK` (`businessConformance`),
  KEY `tc_valueConformance_FK` (`valueConformance`),
  KEY `tc_staticDynamic` (`staticDynamic`),
  KEY `tc_context_FK` (`context`),
  KEY `tc_uname_FK` (`uname`),
  CONSTRAINT `tc_uname_FK` FOREIGN KEY (`uname`) REFERENCES `tdb_users` (`user_name`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `tc_businessConformance_FK` FOREIGN KEY (`businessConformance`) REFERENCES `conformance_type` (`id`),
  CONSTRAINT `tc_codeSystemOID_FK` FOREIGN KEY (`codeSystemOID`) REFERENCES `dictionarycodesystem` (`ID`),
  CONSTRAINT `tc_containedTemplate_FK` FOREIGN KEY (`containedTemplate`) REFERENCES `template` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tc_context_FK` FOREIGN KEY (`context`) REFERENCES `dictionarycontext` (`ID`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `tc_parentConstraintID_FK` FOREIGN KEY (`parentConstraintID`) REFERENCES `template_constraint` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tc_staticDynamic` FOREIGN KEY (`staticDynamic`) REFERENCES `vocbinding_type` (`id`),
  CONSTRAINT `tc_templateID_FK` FOREIGN KEY (`templateID`) REFERENCES `template` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tc_valueConformance_FK` FOREIGN KEY (`valueConformance`) REFERENCES `conformance_type` (`id`),
  CONSTRAINT `tc_valueSetOID_FK` FOREIGN KEY (`valueSetOID`) REFERENCES `valueset` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8535 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `template_type`
--

DROP TABLE IF EXISTS `template_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `template_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `templatetype` varchar(255) CHARACTER SET latin1 NOT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_UNIQUE` (`templatetype`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `valueset`
--

DROP TABLE IF EXISTS `valueset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valueset` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `OID` varchar(255) NOT NULL,
  `valueSetName` varchar(255) NOT NULL,
  `valueSetCode` varchar(255) DEFAULT NULL,
  `description` longtext,
  `intensional` tinyint(1) DEFAULT '0',
  `intensionalDefinition` longtext,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `OID_UNIQUE` (`OID`),
  KEY `valueSetCode` (`valueSetCode`)
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `valuesetmember`
--

DROP TABLE IF EXISTS `valuesetmember`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `valuesetmember` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `valueSetOId` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `codeSystemOID` varchar(255) NOT NULL,
  `displayName` varchar(255) DEFAULT NULL,
  `valueSetStatus` varchar(255) DEFAULT 'active',
  `dateOfValueSetStatus` varchar(255) DEFAULT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`),
  KEY `code` (`code`),
  KEY `codeSystemOID` (`codeSystemOID`),
  KEY `CodeSystemOID_FK` (`codeSystemOID`),
  KEY `valueSetId` (`valueSetOId`),
  KEY `ValueSetId_FK` (`valueSetOId`),
  KEY `ValueSetOID_FK` (`valueSetOId`),
  CONSTRAINT `CodeSystemOID_FK` FOREIGN KEY (`codeSystemOID`) REFERENCES `dictionarycodesystem` (`OID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ValueSetOID_FK` FOREIGN KEY (`valueSetOId`) REFERENCES `valueset` (`OID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vocbinding_type`
--

DROP TABLE IF EXISTS `vocbinding_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vocbinding_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bindingtype` varchar(45) DEFAULT NULL,
  `lastUpdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_UNIQUE` (`bindingtype`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-04-14  7:37:49
