CREATE DATABASE  IF NOT EXISTS `broadcaster` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `broadcaster`;
-- MySQL dump 10.13  Distrib 5.6.11, for Win32 (x86)
--
-- Host: localhost    Database: broadcaster
-- ------------------------------------------------------
-- Server version	5.6.13

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
-- Table structure for table `error`
--

DROP TABLE IF EXISTS `error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `error` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manufacture` varchar(256) DEFAULT NULL,
  `model` varchar(256) DEFAULT NULL,
  `product` varchar(256) DEFAULT NULL,
  `stacktrace` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=301 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(128) DEFAULT NULL,
  `text` text NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL,
  `parentId` int(10) unsigned DEFAULT NULL,
  `title` varchar(512) NOT NULL,
  `content` text,
  `visibility` tinyint(4) DEFAULT '0',
  `location` varchar(128) DEFAULT NULL,
  `latitude` decimal(10,6) DEFAULT NULL,
  `longitude` decimal(10,6) DEFAULT NULL,
  `vote` int(11) NOT NULL DEFAULT '1',
  `influence` int(11) NOT NULL DEFAULT '0',
  `comment` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `postUserId_idx` (`userId`),
  KEY `postParentId_idx` (`parentId`),
  CONSTRAINT `postParentId` FOREIGN KEY (`parentId`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `postUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2020 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `post_active`
--

DROP TABLE IF EXISTS `post_active`;
/*!50001 DROP VIEW IF EXISTS `post_active`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `post_active` (
  `id` tinyint NOT NULL,
  `userId` tinyint NOT NULL,
  `username` tinyint NOT NULL,
  `parentId` tinyint NOT NULL,
  `title` tinyint NOT NULL,
  `content` tinyint NOT NULL,
  `visibility` tinyint NOT NULL,
  `location` tinyint NOT NULL,
  `latitude` tinyint NOT NULL,
  `longitude` tinyint NOT NULL,
  `vote` tinyint NOT NULL,
  `influence` tinyint NOT NULL,
  `comment` tinyint NOT NULL,
  `created` tinyint NOT NULL,
  `modified` tinyint NOT NULL,
  `tags` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `postId` int(10) unsigned NOT NULL,
  `tagId` int(10) unsigned NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `post_tag_unique_combo` (`postId`,`tagId`),
  KEY `post_tag_post_id_idx` (`postId`),
  KEY `post_tag_tag_id_idx` (`tagId`),
  CONSTRAINT `post_tag_post_id` FOREIGN KEY (`postId`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `post_tag_tag_id` FOREIGN KEY (`tagId`) REFERENCES `tag` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fbId` varchar(128) DEFAULT NULL,
  `gPlusId` varchar(128) DEFAULT NULL,
  `username` varchar(128) NOT NULL,
  `email` varchar(128) DEFAULT NULL,
  `pass` varchar(256) NOT NULL,
  `salt` varchar(32) NOT NULL,
  `token` varchar(512) DEFAULT NULL,
  `lastLogin` datetime NOT NULL,
  `usernameChange` smallint(6) DEFAULT '0',
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=464 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vote` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userId` int(10) unsigned NOT NULL,
  `postId` int(10) unsigned NOT NULL,
  `voteDir` smallint(6) NOT NULL DEFAULT '0',
  `created` varchar(45) NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `voteUserId_idx` (`userId`),
  KEY `votePostId_idx` (`postId`),
  CONSTRAINT `votePostId` FOREIGN KEY (`postId`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `voteUserId` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'broadcaster'
--
/*!50003 DROP PROCEDURE IF EXISTS `getPostsInBound` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPostsInBound`(IN swlat DECIMAL(10,6), IN swlng DECIMAL(10,6), IN nelat DECIMAL(10,6), IN nelng DECIMAL(10,6), IN lim SMALLINT, IN afterId INT(10), IN tags VARCHAR(1024))
BEGIN
    
    CREATE TEMPORARY TABLE IF NOT EXISTS `PostsInBound` (
        `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
        `userId` int(10) unsigned NOT NULL,
        `username` varchar(128) NOT NULL,
        `parentId` int(10) unsigned DEFAULT NULL,
        `title` varchar(512) NOT NULL,
        `content` text,
        `visibility` tinyint(4) DEFAULT '0',
        `location` varchar(128) DEFAULT NULL,
        `latitude` decimal(10,6) DEFAULT NULL,
        `longitude` decimal(10,6) DEFAULT NULL,
        `vote` int(11) NOT NULL DEFAULT '1',
        `influence` int(11) NOT NULL DEFAULT '0',
        `comment` int(11) NOT NULL DEFAULT '0',
        `created` datetime NOT NULL,
        `modified` datetime NOT NULL,
        `tags` varchar(256) NOT NULL,
        PRIMARY KEY (`id`));

    DELETE FROM PostsInBound;
    
    IF swlng > nelng THEN
        CALL getPostsInBoundSimple (swlat, swlng, nelat, 180, lim, afterId, tags);
        CALL getPostsInBoundSimple (swlat, -180, nelat, nelng, lim, afterId, tags);
    ELSE
        CALL getPostsInBoundSimple (swlat, swlng, nelat, nelng, lim, afterId, tags);
    END IF;
    
    SELECT * FROM PostsInBound
    ORDER BY influence DESC, id DESC
    LIMIT lim;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getPostsInBoundSimple` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getPostsInBoundSimple`(IN swlat DECIMAL(10,6), IN swlng DECIMAL(10,6), IN nelat DECIMAL(10,6), IN nelng DECIMAL(10,6), IN lim SMALLINT, IN afterId INT(10), IN tags VARCHAR(1024))
BEGIN
    DECLARE afterInf SMALLINT DEFAULT 100;
    DECLARE maxInfluence SMALLINT DEFAULT 100;

    CREATE TEMPORARY TABLE IF NOT EXISTS `PostsInBound` (
        `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
        `userId` int(10) unsigned NOT NULL,
        `username` varchar(128) NOT NULL,
        `parentId` int(10) unsigned DEFAULT NULL,
        `title` varchar(512) NOT NULL,
        `content` text,
        `visibility` tinyint(4) DEFAULT '0',
        `location` varchar(128) DEFAULT NULL,
        `latitude` decimal(10,6) DEFAULT NULL,
        `longitude` decimal(10,6) DEFAULT NULL,
        `vote` int(11) NOT NULL DEFAULT '1',
        `influence` int(11) NOT NULL DEFAULT '0',
        `comment` int(11) NOT NULL DEFAULT '0',
        `created` datetime NOT NULL,
        `modified` datetime NOT NULL,
        `tags` varchar(256) NOT NULL,
        PRIMARY KEY (`id`));

    SELECT COALESCE(influence, maxInfluence) INTO afterInf
    FROM post_active
    WHERE id = afterId;

    IF tags = '[[RESERVED_TAG_EVERYTHING]]' THEN
        INSERT INTO PostsInBound (
            SELECT p.*
            FROM post_active p
            WHERE p.parentId IS NULL AND
                p.latitude >= swlat AND p.latitude < nelat AND
                p.longitude >= swlng AND p.longitude < nelng AND
                (p.influence < afterInf OR (p.influence = afterInf AND p.id < afterId))
            LIMIT lim);
    ELSE
        INSERT INTO PostsInBound (
            SELECT p.*
            FROM post_active p
            WHERE p.parentId IS NULL AND
                p.latitude >= swlat AND p.latitude < nelat AND
                p.longitude >= swlng AND p.longitude < nelng AND
                (p.influence < afterInf OR (p.influence = afterInf AND p.id < afterId)) AND
                EXISTS ( SELECT 1 FROM post_tag pt WHERE p.id = pt.postId AND EXISTS (
                    SELECT 1 FROM tag t WHERE t.id = pt.tagId AND FIND_IN_SET(t.name, tags) > 0 ))
            LIMIT lim
        );
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `post_active`
--

/*!50001 DROP TABLE IF EXISTS `post_active`*/;
/*!50001 DROP VIEW IF EXISTS `post_active`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `post_active` AS select `post`.`id` AS `id`,`post`.`userId` AS `userId`,`user`.`username` AS `username`,`post`.`parentId` AS `parentId`,`post`.`title` AS `title`,`post`.`content` AS `content`,`post`.`visibility` AS `visibility`,`post`.`location` AS `location`,`post`.`latitude` AS `latitude`,`post`.`longitude` AS `longitude`,`post`.`vote` AS `vote`,`post`.`influence` AS `influence`,`post`.`comment` AS `comment`,`post`.`created` AS `created`,`post`.`modified` AS `modified`,group_concat(`tag`.`name` separator ',') AS `tags` from (((`post` join `user` on((`post`.`userId` = `user`.`id`))) left join `post_tag` on((`post`.`id` = `post_tag`.`postId`))) left join `tag` on((`post_tag`.`tagId` = `tag`.`id`))) where (`post`.`visibility` >= 0) group by `post`.`id` order by `post`.`influence` desc,`post`.`id` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-10-30 21:15:45
