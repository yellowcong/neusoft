/*
SQLyog v10.2 
MySQL - 5.1.68-community : Database - yellowcong
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yellowcong` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `yellowcong`;

/*Table structure for table `blog_passage` */

DROP TABLE IF EXISTS `blog_passage`;

CREATE TABLE `blog_passage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `create_date` datetime DEFAULT NULL,
  `img` varchar(128) DEFAULT NULL,
  `is_recommend` int(11) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `see_count` int(11) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(128) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB33763B17A5E3C67` (`user_id`),
  CONSTRAINT `FKB33763B17A5E3C67` FOREIGN KEY (`user_id`) REFERENCES `ycg_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `blog_passage` */

insert  into `blog_passage`(`id`,`content`,`create_date`,`img`,`is_recommend`,`keywords`,`see_count`,`summary`,`title`,`user_id`) values (1,NULL,NULL,NULL,0,NULL,0,NULL,'你是都比吗',NULL);

/*Table structure for table `neusoft_selanswer` */

DROP TABLE IF EXISTS `neusoft_selanswer`;

CREATE TABLE `neusoft_selanswer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK26D17C01870F5363` (`question_id`),
  CONSTRAINT `FK26D17C01870F5363` FOREIGN KEY (`question_id`) REFERENCES `neusoft_selquestion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

/*Data for the table `neusoft_selanswer` */

insert  into `neusoft_selanswer`(`id`,`content`,`question_id`) values (10,'选中正确答案多选1',12),(11,'单选选中正确答案6',11),(12,'选中正确答案多选2',12),(13,'单选错误答案3',11),(14,'错误答案多选777',12),(15,'单选错误答案4',11),(16,'错误答案多选76',12),(17,'单选错误答案5',11),(18,'选中正确答案多选',13),(19,'单选选中正确答案',14),(20,'单选错误答案',14),(21,'选中正确答案多选',13),(22,'错误答案多选',13),(23,'错误答案多选',13),(24,'单选错误答案',14),(25,'单选错误答案',14);

/*Table structure for table `neusoft_selquestion` */

DROP TABLE IF EXISTS `neusoft_selquestion`;

CREATE TABLE `neusoft_selquestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `content` (`content`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `neusoft_selquestion` */

insert  into `neusoft_selquestion`(`id`,`answer`,`content`) values (11,NULL,'问题嘻嘻嘻单选'),(12,NULL,'问题嘻嘻嘻多选'),(13,'选中正确答案多选,选中正确答案多选','问题嘻嘻嘻多选'),(14,'单选选中正确答案','问题嘻嘻嘻单选');

/*Table structure for table `ycg_attitude` */

DROP TABLE IF EXISTS `ycg_attitude`;

CREATE TABLE `ycg_attitude` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dislike` int(11) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  `passage_id` int(11) DEFAULT NULL,
  `reply_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKA6EF240CC77A808D` (`reply_id`),
  KEY `FKA6EF240C7A5E3C67` (`user_id`),
  KEY `FKA6EF240CAA2EFD4D` (`passage_id`),
  CONSTRAINT `FKA6EF240C7A5E3C67` FOREIGN KEY (`user_id`) REFERENCES `ycg_user` (`id`),
  CONSTRAINT `FKA6EF240CAA2EFD4D` FOREIGN KEY (`passage_id`) REFERENCES `blog_passage` (`id`),
  CONSTRAINT `FKA6EF240CC77A808D` FOREIGN KEY (`reply_id`) REFERENCES `ycg_reply` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `ycg_attitude` */

insert  into `ycg_attitude`(`id`,`dislike`,`likes`,`passage_id`,`reply_id`,`user_id`) values (1,1,0,NULL,NULL,NULL);

/*Table structure for table `ycg_channel` */

DROP TABLE IF EXISTS `ycg_channel`;

CREATE TABLE `ycg_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `blank` varchar(128) DEFAULT NULL,
  `can_reply` varchar(1) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `is_active` varchar(1) DEFAULT NULL,
  `is_login_seee` int(11) DEFAULT NULL,
  `name` varchar(16) DEFAULT NULL,
  `orders` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK38A309617A5E3C67` (`user_id`),
  KEY `FK38A309616B56252D` (`channel_id`),
  CONSTRAINT `FK38A309616B56252D` FOREIGN KEY (`channel_id`) REFERENCES `ycg_channel` (`id`),
  CONSTRAINT `FK38A309617A5E3C67` FOREIGN KEY (`user_id`) REFERENCES `ycg_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ycg_channel` */

/*Table structure for table `ycg_reply` */

DROP TABLE IF EXISTS `ycg_reply`;

CREATE TABLE `ycg_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `passage_id` int(11) DEFAULT NULL,
  `reply_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK31A11EC8C77A808D` (`reply_id`),
  KEY `FK31A11EC87A5E3C67` (`user_id`),
  KEY `FK31A11EC8AA2EFD4D` (`passage_id`),
  CONSTRAINT `FK31A11EC87A5E3C67` FOREIGN KEY (`user_id`) REFERENCES `ycg_user` (`id`),
  CONSTRAINT `FK31A11EC8AA2EFD4D` FOREIGN KEY (`passage_id`) REFERENCES `blog_passage` (`id`),
  CONSTRAINT `FK31A11EC8C77A808D` FOREIGN KEY (`reply_id`) REFERENCES `ycg_reply` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ycg_reply` */

/*Table structure for table `ycg_user` */

DROP TABLE IF EXISTS `ycg_user`;

CREATE TABLE `ycg_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date` datetime DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `is_active` int(11) DEFAULT NULL,
  `nickname` varchar(16) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `username` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  KEY `username` (`username`),
  KEY `nickname` (`nickname`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

/*Data for the table `ycg_user` */

insert  into `ycg_user`(`id`,`create_date`,`email`,`img_url`,`is_active`,`nickname`,`password`,`phone`,`username`) values (1,'2015-12-29 17:47:40','717350382@qq.com',NULL,0,'15335761939','3410ebb1ecde3a0208eecd869615ca14','15335761932','yellowcong'),(2,'2015-12-29 17:48:16','717350389@qq.com',NULL,0,'你是都比吗','3410ebb1ecde3a0208eecd869615ca14','15335761933','yellowcong'),(3,'2015-12-29 17:53:46','71735038910@qq.com',NULL,0,'你是都比吗10','3410ebb1ecde3a0208eecd869615ca14','15335762910','yellowcong10'),(4,'2015-12-29 17:53:46','71735038911@qq.com',NULL,0,'你是都比吗11','3410ebb1ecde3a0208eecd869615ca14','15335762911','yellowcong11'),(5,'2015-12-29 17:53:46','71735038912@qq.com',NULL,1,'你是都比吗12','3410ebb1ecde3a0208eecd869615ca14','15335762912','yellowcong12'),(6,'2015-12-29 17:53:46','71735038913@qq.com',NULL,1,'你是都比吗13','3410ebb1ecde3a0208eecd869615ca14','15335762913','yellowcong13'),(7,'2015-12-29 17:53:46','71735038914@qq.com',NULL,0,'你是都比吗14','3410ebb1ecde3a0208eecd869615ca14','15335762914','yellowcong14'),(8,'2015-12-29 17:53:46','71735038915@qq.com',NULL,0,'你是都比吗15','3410ebb1ecde3a0208eecd869615ca14','15335762915','yellowcong15'),(9,'2015-12-29 17:53:46','71735038916@qq.com',NULL,0,'你是都比吗16','3410ebb1ecde3a0208eecd869615ca14','15335762916','yellowcong16'),(10,'2015-12-29 17:53:46','71735038917@qq.com',NULL,0,'你是都比吗17','3410ebb1ecde3a0208eecd869615ca14','15335762917','yellowcong17'),(11,'2015-12-29 17:53:46','71735038918@qq.com',NULL,0,'你是都比吗18','3410ebb1ecde3a0208eecd869615ca14','15335762918','yellowcong18'),(12,'2015-12-29 17:53:46','71735038919@qq.com',NULL,0,'你是都比吗19','3410ebb1ecde3a0208eecd869615ca14','15335762919','yellowcong19'),(13,'2015-12-29 17:53:46','71735038920@qq.com',NULL,0,'你是都比吗20','3410ebb1ecde3a0208eecd869615ca14','15335762920','yellowcong20'),(14,'2015-12-29 17:53:46','71735038921@qq.com',NULL,0,'你是都比吗21','3410ebb1ecde3a0208eecd869615ca14','15335762921','yellowcong21'),(15,'2015-12-29 17:53:46','71735038922@qq.com',NULL,0,'你是都比吗22','3410ebb1ecde3a0208eecd869615ca14','15335762922','yellowcong22'),(16,'2015-12-29 17:53:46','71735038923@qq.com',NULL,0,'你是都比吗23','3410ebb1ecde3a0208eecd869615ca14','15335762923','yellowcong23'),(17,'2015-12-29 17:53:46','71735038924@qq.com',NULL,0,'你是都比吗24','3410ebb1ecde3a0208eecd869615ca14','15335762924','yellowcong24'),(18,'2015-12-29 17:53:46','71735038925@qq.com',NULL,0,'你是都比吗25','3410ebb1ecde3a0208eecd869615ca14','15335762925','yellowcong25'),(19,'2015-12-29 17:53:46','71735038926@qq.com',NULL,0,'你是都比吗26','3410ebb1ecde3a0208eecd869615ca14','15335762926','yellowcong26'),(20,'2015-12-29 17:53:46','71735038927@qq.com',NULL,0,'你是都比吗27','3410ebb1ecde3a0208eecd869615ca14','15335762927','yellowcong27'),(21,'2015-12-29 17:53:46','71735038928@qq.com',NULL,0,'你是都比吗28','3410ebb1ecde3a0208eecd869615ca14','15335762928','yellowcong28'),(22,'2015-12-29 17:53:46','71735038929@qq.com',NULL,0,'你是都比吗29','3410ebb1ecde3a0208eecd869615ca14','15335762929','yellowcong29'),(23,'2015-12-29 17:53:46','71735038930@qq.com',NULL,0,'你是都比吗30','3410ebb1ecde3a0208eecd869615ca14','15335762930','yellowcong30'),(24,'2015-12-29 17:53:46','71735038931@qq.com',NULL,0,'你是都比吗31','3410ebb1ecde3a0208eecd869615ca14','15335762931','yellowcong31'),(25,'2015-12-29 17:53:46','71735038932@qq.com',NULL,0,'你是都比吗32','3410ebb1ecde3a0208eecd869615ca14','15335762932','yellowcong32'),(26,'2015-12-29 17:53:46','71735038933@qq.com',NULL,0,'你是都比吗33','3410ebb1ecde3a0208eecd869615ca14','15335762933','yellowcong33'),(27,'2015-12-29 17:53:46','71735038934@qq.com',NULL,0,'你是都比吗34','3410ebb1ecde3a0208eecd869615ca14','15335762934','yellowcong34'),(28,'2015-12-29 17:53:46','71735038935@qq.com',NULL,0,'你是都比吗35','3410ebb1ecde3a0208eecd869615ca14','15335762935','yellowcong35'),(29,'2015-12-29 17:53:46','71735038936@qq.com',NULL,0,'你是都比吗36','3410ebb1ecde3a0208eecd869615ca14','15335762936','yellowcong36'),(30,'2015-12-29 17:53:46','71735038937@qq.com',NULL,0,'你是都比吗37','3410ebb1ecde3a0208eecd869615ca14','15335762937','yellowcong37'),(31,'2015-12-29 17:53:46','71735038938@qq.com',NULL,0,'你是都比吗38','3410ebb1ecde3a0208eecd869615ca14','15335762938','yellowcong38'),(32,'2015-12-29 17:53:46','71735038939@qq.com',NULL,0,'你是都比吗39','3410ebb1ecde3a0208eecd869615ca14','15335762939','yellowcong39'),(33,'2015-12-29 17:53:46','71735038940@qq.com',NULL,0,'你是都比吗40','3410ebb1ecde3a0208eecd869615ca14','15335762940','yellowcong40'),(34,'2015-12-29 17:53:46','71735038941@qq.com',NULL,0,'你是都比吗41','3410ebb1ecde3a0208eecd869615ca14','15335762941','yellowcong41'),(35,'2015-12-29 17:53:47','71735038942@qq.com',NULL,0,'你是都比吗42','3410ebb1ecde3a0208eecd869615ca14','15335762942','yellowcong42'),(36,'2015-12-29 17:53:47','71735038943@qq.com',NULL,0,'你是都比吗43','3410ebb1ecde3a0208eecd869615ca14','15335762943','yellowcong43'),(37,'2015-12-29 17:53:47','71735038944@qq.com',NULL,0,'你是都比吗44','3410ebb1ecde3a0208eecd869615ca14','15335762944','yellowcong44'),(38,'2015-12-29 17:53:47','71735038945@qq.com',NULL,0,'你是都比吗45','3410ebb1ecde3a0208eecd869615ca14','15335762945','yellowcong45'),(39,'2015-12-29 17:53:47','71735038946@qq.com',NULL,0,'你是都比吗46','3410ebb1ecde3a0208eecd869615ca14','15335762946','yellowcong46'),(40,'2015-12-29 17:53:47','71735038947@qq.com',NULL,0,'你是都比吗47','3410ebb1ecde3a0208eecd869615ca14','15335762947','yellowcong47'),(41,'2015-12-29 17:53:47','71735038948@qq.com',NULL,0,'你是都比吗48','3410ebb1ecde3a0208eecd869615ca14','15335762948','yellowcong48'),(42,'2015-12-29 17:53:47','71735038949@qq.com',NULL,0,'你是都比吗49','3410ebb1ecde3a0208eecd869615ca14','15335762949','yellowcong49'),(43,'2015-12-29 17:53:47','71735038950@qq.com',NULL,0,'你是都比吗50','3410ebb1ecde3a0208eecd869615ca14','15335762950','yellowcong50'),(44,'2015-12-29 17:53:47','71735038951@qq.com',NULL,0,'你是都比吗51','3410ebb1ecde3a0208eecd869615ca14','15335762951','yellowcong51'),(45,'2015-12-29 17:53:47','71735038952@qq.com',NULL,0,'你是都比吗52','3410ebb1ecde3a0208eecd869615ca14','15335762952','yellowcong52'),(46,'2015-12-29 17:53:47','71735038953@qq.com',NULL,0,'你是都比吗53','3410ebb1ecde3a0208eecd869615ca14','15335762953','yellowcong53'),(47,'2015-12-29 17:53:47','71735038954@qq.com',NULL,0,'你是都比吗54','3410ebb1ecde3a0208eecd869615ca14','15335762954','yellowcong54'),(48,'2015-12-29 17:53:47','71735038955@qq.com',NULL,0,'你是都比吗55','3410ebb1ecde3a0208eecd869615ca14','15335762955','yellowcong55'),(49,'2015-12-29 17:53:47','71735038956@qq.com',NULL,0,'你是都比吗56','3410ebb1ecde3a0208eecd869615ca14','15335762956','yellowcong56'),(50,'2015-12-29 17:53:47','71735038957@qq.com',NULL,0,'你是都比吗57','3410ebb1ecde3a0208eecd869615ca14','15335762957','yellowcong57'),(51,'2015-12-29 17:53:47','71735038958@qq.com',NULL,0,'你是都比吗58','3410ebb1ecde3a0208eecd869615ca14','15335762958','yellowcong58'),(52,'2015-12-29 17:53:47','71735038959@qq.com',NULL,0,'你是都比吗59','3410ebb1ecde3a0208eecd869615ca14','15335762959','yellowcong59'),(53,'2015-12-29 17:53:47','71735038960@qq.com',NULL,0,'你是都比吗60','3410ebb1ecde3a0208eecd869615ca14','15335762960','yellowcong60'),(54,'2015-12-29 17:53:47','71735038961@qq.com',NULL,0,'你是都比吗61','3410ebb1ecde3a0208eecd869615ca14','15335762961','yellowcong61'),(55,'2015-12-29 17:53:47','71735038962@qq.com',NULL,0,'你是都比吗62','3410ebb1ecde3a0208eecd869615ca14','15335762962','yellowcong62'),(56,'2015-12-29 17:53:47','71735038963@qq.com',NULL,0,'你是都比吗63','3410ebb1ecde3a0208eecd869615ca14','15335762963','yellowcong63'),(57,'2015-12-29 17:53:47','71735038964@qq.com',NULL,0,'你是都比吗64','3410ebb1ecde3a0208eecd869615ca14','15335762964','yellowcong64'),(58,'2015-12-29 17:53:47','71735038965@qq.com',NULL,0,'你是都比吗65','3410ebb1ecde3a0208eecd869615ca14','15335762965','yellowcong65'),(59,'2015-12-29 17:53:47','71735038966@qq.com',NULL,0,'你是都比吗66','3410ebb1ecde3a0208eecd869615ca14','15335762966','yellowcong66'),(60,'2015-12-29 17:53:47','71735038967@qq.com',NULL,0,'你是都比吗67','3410ebb1ecde3a0208eecd869615ca14','15335762967','yellowcong67'),(61,'2015-12-29 17:53:47','71735038968@qq.com',NULL,0,'你是都比吗68','3410ebb1ecde3a0208eecd869615ca14','15335762968','yellowcong68'),(62,'2015-12-29 17:53:47','71735038969@qq.com',NULL,0,'你是都比吗69','3410ebb1ecde3a0208eecd869615ca14','15335762969','yellowcong69'),(63,'2015-12-29 17:53:47','71735038970@qq.com',NULL,0,'你是都比吗70','3410ebb1ecde3a0208eecd869615ca14','15335762970','yellowcong70'),(64,'2015-12-29 17:53:47','71735038971@qq.com',NULL,0,'你是都比吗71','3410ebb1ecde3a0208eecd869615ca14','15335762971','yellowcong71'),(65,'2015-12-29 17:53:47','71735038972@qq.com',NULL,0,'你是都比吗72','3410ebb1ecde3a0208eecd869615ca14','15335762972','yellowcong72'),(66,'2015-12-29 17:53:47','71735038973@qq.com',NULL,0,'你是都比吗73','3410ebb1ecde3a0208eecd869615ca14','15335762973','yellowcong73'),(67,'2015-12-29 17:53:47','71735038974@qq.com',NULL,0,'你是都比吗74','3410ebb1ecde3a0208eecd869615ca14','15335762974','yellowcong74'),(68,'2015-12-29 17:53:47','71735038975@qq.com',NULL,0,'你是都比吗75','3410ebb1ecde3a0208eecd869615ca14','15335762975','yellowcong75'),(69,'2015-12-29 17:53:47','71735038976@qq.com',NULL,0,'你是都比吗76','3410ebb1ecde3a0208eecd869615ca14','15335762976','yellowcong76'),(70,'2015-12-29 17:53:47','71735038977@qq.com',NULL,0,'你是都比吗77','3410ebb1ecde3a0208eecd869615ca14','15335762977','yellowcong77'),(71,'2015-12-29 17:53:47','71735038978@qq.com',NULL,0,'你是都比吗78','3410ebb1ecde3a0208eecd869615ca14','15335762978','yellowcong78'),(72,'2015-12-29 17:53:47','71735038979@qq.com',NULL,0,'你是都比吗79','3410ebb1ecde3a0208eecd869615ca14','15335762979','yellowcong79'),(73,'2015-12-29 17:53:47','71735038980@qq.com',NULL,0,'你是都比吗80','3410ebb1ecde3a0208eecd869615ca14','15335762980','yellowcong80'),(74,'2015-12-29 17:53:47','71735038981@qq.com',NULL,0,'你是都比吗81','3410ebb1ecde3a0208eecd869615ca14','15335762981','yellowcong81'),(75,'2015-12-29 17:53:47','71735038982@qq.com',NULL,0,'你是都比吗82','3410ebb1ecde3a0208eecd869615ca14','15335762982','yellowcong82'),(76,'2015-12-29 17:53:47','71735038983@qq.com',NULL,0,'你是都比吗83','3410ebb1ecde3a0208eecd869615ca14','15335762983','yellowcong83'),(77,'2015-12-29 17:53:47','71735038984@qq.com',NULL,0,'你是都比吗84','3410ebb1ecde3a0208eecd869615ca14','15335762984','yellowcong84'),(78,'2015-12-29 17:53:47','71735038985@qq.com',NULL,0,'你是都比吗85','3410ebb1ecde3a0208eecd869615ca14','15335762985','yellowcong85'),(79,'2015-12-29 17:53:47','71735038986@qq.com',NULL,0,'你是都比吗86','3410ebb1ecde3a0208eecd869615ca14','15335762986','yellowcong86'),(80,'2015-12-29 17:53:47','71735038987@qq.com',NULL,0,'你是都比吗87','3410ebb1ecde3a0208eecd869615ca14','15335762987','yellowcong87'),(81,'2015-12-29 17:53:47','71735038988@qq.com',NULL,0,'你是都比吗88','3410ebb1ecde3a0208eecd869615ca14','15335762988','yellowcong88'),(82,'2015-12-29 17:53:47','71735038989@qq.com',NULL,0,'你是都比吗89','3410ebb1ecde3a0208eecd869615ca14','15335762989','yellowcong89'),(83,'2015-12-29 17:53:47','71735038990@qq.com',NULL,0,'你是都比吗90','3410ebb1ecde3a0208eecd869615ca14','15335762990','yellowcong90'),(84,'2015-12-29 17:53:47','71735038991@qq.com',NULL,0,'你是都比吗91','3410ebb1ecde3a0208eecd869615ca14','15335762991','yellowcong91'),(85,'2015-12-29 17:53:47','71735038992@qq.com',NULL,0,'你是都比吗92','3410ebb1ecde3a0208eecd869615ca14','15335762992','yellowcong92'),(86,'2015-12-29 17:53:47','71735038993@qq.com',NULL,0,'你是都比吗93','3410ebb1ecde3a0208eecd869615ca14','15335762993','yellowcong93'),(87,'2015-12-29 17:53:47','71735038994@qq.com',NULL,0,'你是都比吗94','3410ebb1ecde3a0208eecd869615ca14','15335762994','yellowcong94'),(88,'2015-12-29 17:53:47','71735038995@qq.com',NULL,0,'你是都比吗95','3410ebb1ecde3a0208eecd869615ca14','15335762995','yellowcong95'),(89,'2015-12-29 17:53:47','71735038996@qq.com',NULL,0,'你是都比吗96','3410ebb1ecde3a0208eecd869615ca14','15335762996','yellowcong96'),(90,'2015-12-29 17:53:47','71735038997@qq.com',NULL,0,'你是都比吗97','3410ebb1ecde3a0208eecd869615ca14','15335762997','yellowcong97'),(91,'2015-12-29 17:53:47','71735038998@qq.com',NULL,0,'你是都比吗98','3410ebb1ecde3a0208eecd869615ca14','15335762998','yellowcong98'),(92,'2015-12-29 17:53:47','71735038999@qq.com',NULL,0,'你是都比吗99','3410ebb1ecde3a0208eecd869615ca14','15335762999','yellowcong99');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
