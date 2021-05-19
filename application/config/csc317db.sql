-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: csc317db
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `fk_authorid` int NOT NULL,
  `fk_postid` int NOT NULL,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `key_tousertable_idx` (`fk_authorid`),
  KEY `key_toposttable_idx` (`fk_postid`),
  CONSTRAINT `key_toposttable` FOREIGN KEY (`fk_postid`) REFERENCES `posts` (`id`),
  CONSTRAINT `key_tousertable` FOREIGN KEY (`fk_authorid`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (20,'Donkeys #1!!',21,125,'2021-05-18 20:44:54'),(21,'Who is that cute cow mid-right?',21,125,'2021-05-18 20:45:09'),(22,'RIP Cyderxlord.',21,125,'2021-05-18 20:45:21'),(23,'H E A L E R S',21,125,'2021-05-18 20:45:36'),(24,'I\'m so proud of you all!',21,125,'2021-05-18 20:45:58'),(25,'CLEAR COMMS INSAYN',21,125,'2021-05-18 20:46:07'),(26,'A time before the ultimate priest griefer.',21,125,'2021-05-18 20:46:30'),(27,'Donkeys #1!!!!!!!!!',21,125,'2021-05-18 20:46:39'),(28,'DONKEYS RECRUITING TBC',21,125,'2021-05-18 20:46:53');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `description` varchar(4096) NOT NULL,
  `photopath` varchar(4096) NOT NULL,
  `thumbnail` varchar(4096) NOT NULL,
  `active` int NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  `fk_userid` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `posts to users_idx` (`fk_userid`),
  CONSTRAINT `posts to users` FOREIGN KEY (`fk_userid`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (56,'Backside of Thundy','Thundurus','public\\images\\uploads\\f087a8b288b4a8d0cf59a6.png','public/images/uploads/thumbnail-f087a8b288b4a8d0cf59a6.png',0,'2021-05-18 18:48:37',21),(57,'Bigmike and his horsie','Bigdirtymike','public\\images\\uploads\\df4465673afed13bf6a543.jpeg','public/images/uploads/thumbnail-df4465673afed13bf6a543.jpeg',0,'2021-05-18 18:49:11',21),(58,'Ama and his Scarab','Amadaeus','public\\images\\uploads\\13bab28b0070af4ac2c308.png','public/images/uploads/thumbnail-13bab28b0070af4ac2c308.png',0,'2021-05-18 18:51:35',21),(59,'Big 2.5 AQ40','Bigsax','public\\images\\uploads\\b768e0bac188c917c6a511.jpeg','public/images/uploads/thumbnail-b768e0bac188c917c6a511.jpeg',0,'2021-05-18 18:51:57',21),(60,'A Cow and Gates','Bigsax','public\\images\\uploads\\650d120c335940919bea28.png','public/images/uploads/thumbnail-650d120c335940919bea28.png',0,'2021-05-18 18:58:27',21),(61,'Cute Boy','Abra','public\\images\\uploads\\59da32eeb8c76a224512e7.png','public/images/uploads/thumbnail-59da32eeb8c76a224512e7.png',0,'2021-05-18 19:02:19',21),(62,'Big Ugly Mike','Bigdirtymike','public\\images\\uploads\\8472524660718ac346252b.png','public/images/uploads/thumbnail-8472524660718ac346252b.png',0,'2021-05-18 19:03:01',21),(63,'CaseyUwU','Caseyfish','public\\images\\uploads\\6e29dce797887a0b191288.jpeg','public/images/uploads/thumbnail-6e29dce797887a0b191288.jpeg',0,'2021-05-18 19:03:35',21),(64,'Kick Choohc','Choohc','public\\images\\uploads\\dc6c48fd48beea8322c8d1.png','public/images/uploads/thumbnail-dc6c48fd48beea8322c8d1.png',0,'2021-05-18 19:05:05',21),(65,'Clarence and More Clarence','Ggclarence','public\\images\\uploads\\96d6afcb6de984e06749b7.jpeg','public/images/uploads/thumbnail-96d6afcb6de984e06749b7.jpeg',0,'2021-05-18 19:06:13',21),(66,'Shinra Broke his Heart :(','Thundurus','public\\images\\uploads\\bcee5dd6001484be3aa73d.png','public/images/uploads/thumbnail-bcee5dd6001484be3aa73d.png',0,'2021-05-18 19:08:15',21),(67,'HunterUwU - 1','Hlaalu','public\\images\\uploads\\349f26b5cdf6e55fd32362.png','public/images/uploads/thumbnail-349f26b5cdf6e55fd32362.png',0,'2021-05-18 19:08:56',21),(68,'HunterUwU - 2','Hlaalu','public\\images\\uploads\\de12fa8bc1fef2587fe22c.png','public/images/uploads/thumbnail-de12fa8bc1fef2587fe22c.png',0,'2021-05-18 19:09:18',21),(69,'I Miss Lee','Immortalee and Raemielle','public\\images\\uploads\\60cca3a4d7cdf36dbe2ebc.jpeg','public/images/uploads/thumbnail-60cca3a4d7cdf36dbe2ebc.jpeg',0,'2021-05-18 19:11:11',21),(70,'Dead Cows','Bigsax and Fastlad','public\\images\\uploads\\6512ac59cc017c80f9bceb.png','public/images/uploads/thumbnail-6512ac59cc017c80f9bceb.png',0,'2021-05-18 19:11:48',21),(71,'Thundydance','Thundurus','public\\images\\uploads\\18389160582f533324ff7b.png','public/images/uploads/thumbnail-18389160582f533324ff7b.png',0,'2021-05-18 19:14:40',21),(72,'Straight to Naxx Jail','Thundurus','public\\images\\uploads\\49bc2e7e36edaa0eb25bfc.png','public/images/uploads/thumbnail-49bc2e7e36edaa0eb25bfc.png',0,'2021-05-18 19:15:24',21),(73,'Spooky Ghost','Oneshot','public\\images\\uploads\\11f7a39f2cf9c00e047343.png','public/images/uploads/thumbnail-11f7a39f2cf9c00e047343.png',0,'2021-05-18 19:17:21',21),(74,'AQ40 LAUNCH BABYY','Whitemane','public\\images\\uploads\\0cc6600908a28e9b03298d.jpeg','public/images/uploads/thumbnail-0cc6600908a28e9b03298d.jpeg',0,'2021-05-18 19:18:16',21),(75,'THAT\'S OUR GM!!!','Vibez','public\\images\\uploads\\ae7f96271f44613ad04b6d.jpeg','public/images/uploads/thumbnail-ae7f96271f44613ad04b6d.jpeg',0,'2021-05-18 19:19:02',21),(76,'GOD BLESS BVFP SF','Dead Horde','public\\images\\uploads\\744597f410857443fdf976.png','public/images/uploads/thumbnail-744597f410857443fdf976.png',0,'2021-05-18 19:21:47',21),(77,'Bigdirtymikes Cousin','Bigdirtymike','public\\images\\uploads\\a2afb67a34d97701013d35.jpeg','public/images/uploads/thumbnail-a2afb67a34d97701013d35.jpeg',0,'2021-05-18 19:22:22',21),(78,'Parry Dodge Parry','Zolaro','public\\images\\uploads\\99b9262e3a8818517dfe3f.jpeg','public/images/uploads/thumbnail-99b9262e3a8818517dfe3f.jpeg',0,'2021-05-18 19:22:48',21),(79,'More Parry Dodge Parry','Zolaro','public\\images\\uploads\\2c08e7140b37d5322cc1ab.jpeg','public/images/uploads/thumbnail-2c08e7140b37d5322cc1ab.jpeg',0,'2021-05-18 19:23:07',21),(80,'Spooky Ghost AGAYN','Oneshot','public\\images\\uploads\\9407a06a85a208664be209.jpeg','public/images/uploads/thumbnail-9407a06a85a208664be209.jpeg',0,'2021-05-18 19:24:32',21),(81,'The Boys','Tupak, Fastlad, and Amadaeus','public\\images\\uploads\\4ad633128ef8c092f11bfe.png','public/images/uploads/thumbnail-4ad633128ef8c092f11bfe.png',0,'2021-05-18 20:02:54',21),(82,'Newly Weds','Fastlad and Astralis','public\\images\\uploads\\600cc45e66b9caba64b05a.png','public/images/uploads/thumbnail-600cc45e66b9caba64b05a.png',0,'2021-05-18 20:04:15',21),(83,'Naked Vegan','Sencha','public\\images\\uploads\\31c38eabf7bb4cecf7d1e5.png','public/images/uploads/thumbnail-31c38eabf7bb4cecf7d1e5.png',0,'2021-05-18 20:04:33',21),(84,'OG Warlocks','Scrancho and Talib','public\\images\\uploads\\b567c9bc05892e40a708d8.png','public/images/uploads/thumbnail-b567c9bc05892e40a708d8.png',0,'2021-05-18 20:04:54',21),(85,'No IM Insayn','Insayn','public\\images\\uploads\\a779b3194031d2cb4d2f96.png','public/images/uploads/thumbnail-a779b3194031d2cb4d2f96.png',0,'2021-05-18 20:13:07',21),(86,'TBC LAUNCH!!','Dwuid','public\\images\\uploads\\42ee569e3295d52d705e1e.png','public/images/uploads/thumbnail-42ee569e3295d52d705e1e.png',0,'2021-05-18 20:13:38',21),(87,'Naked Thundy','Thundurus','public\\images\\uploads\\809fa190846af537cf27a4.png','public/images/uploads/thumbnail-809fa190846af537cf27a4.png',0,'2021-05-18 20:14:21',21),(88,'TBC Dodge','Dodge','public\\images\\uploads\\bc1fdaf09cfc0e7c13e803.jpeg','public/images/uploads/thumbnail-bc1fdaf09cfc0e7c13e803.jpeg',0,'2021-05-18 20:14:52',21),(89,'W i d e stancer','Ace','public\\images\\uploads\\e798a800269b117e8d8d2a.png','public/images/uploads/thumbnail-e798a800269b117e8d8d2a.png',0,'2021-05-18 20:15:15',21),(90,'Priest Griefer','Miandra','public\\images\\uploads\\af87210f03c0877b5730e7.png','public/images/uploads/thumbnail-af87210f03c0877b5730e7.png',0,'2021-05-18 20:16:20',21),(91,'Lil Baddy Scrancho :3','Scrancho','public\\images\\uploads\\25792b9b6a61ab02d966d6.png','public/images/uploads/thumbnail-25792b9b6a61ab02d966d6.png',0,'2021-05-18 20:16:56',21),(92,'Toortle Squad','Bigsax, Flowzie, and Shelfed','public\\images\\uploads\\f1009e5cf27faf94467fc9.png','public/images/uploads/thumbnail-f1009e5cf27faf94467fc9.png',0,'2021-05-18 20:17:44',21),(93,'BFA BL Healing Core','Lifebinder, Serene, Bigsax, Vaali, Shelfed, and Flowzie (+Chign Zoomkins)','public\\images\\uploads\\27226e3d668babe73dd54a.png','public/images/uploads/thumbnail-27226e3d668babe73dd54a.png',0,'2021-05-18 20:18:44',21),(94,'Chign Flag','Astralis and Pookiee','public\\images\\uploads\\cda56293be5be49d851972.jpeg','public/images/uploads/thumbnail-cda56293be5be49d851972.jpeg',0,'2021-05-18 20:24:45',21),(95,'Surrounded by Suckers','Ace','public\\images\\uploads\\395043c3c3a4e5f79a8dd6.png','public/images/uploads/thumbnail-395043c3c3a4e5f79a8dd6.png',0,'2021-05-18 20:25:18',21),(96,'Me Poke','Dodge','public\\images\\uploads\\049bbf9787600955d2b077.jpeg','public/images/uploads/thumbnail-049bbf9787600955d2b077.jpeg',0,'2021-05-18 20:25:41',21),(97,'Red Horsie','Bigsax','public\\images\\uploads\\8a6017758adf98d2a89157.png','public/images/uploads/thumbnail-8a6017758adf98d2a89157.png',0,'2021-05-18 20:26:00',21),(98,'Thundy Adventures','Thundurus','public\\images\\uploads\\7180fe0531b82754d0b363.png','public/images/uploads/thumbnail-7180fe0531b82754d0b363.png',0,'2021-05-18 20:26:58',21),(99,'Me also Poke','Srgscyther','public\\images\\uploads\\4ab948601a168a8ce23eed.png','public/images/uploads/thumbnail-4ab948601a168a8ce23eed.png',0,'2021-05-18 20:27:22',21),(100,'Speed....walk?','Nubcraft and Abra','public\\images\\uploads\\eac263664b42933682f5d6.png','public/images/uploads/thumbnail-eac263664b42933682f5d6.png',0,'2021-05-18 20:27:54',21),(101,'Who am I?','Whoisthis','public\\images\\uploads\\c3a0bf4951f317dd381f44.jpeg','public/images/uploads/thumbnail-c3a0bf4951f317dd381f44.jpeg',0,'2021-05-18 20:28:23',21),(102,'Donkeys Line up for Stable','<Donkeys> Hee-Haw!','public\\images\\uploads\\c1ef979d0f9336bd132715.png','public/images/uploads/thumbnail-c1ef979d0f9336bd132715.png',0,'2021-05-18 20:29:02',21),(103,'ZugZug','Tupak','public\\images\\uploads\\d721097ab8597051eb3ac6.png','public/images/uploads/thumbnail-d721097ab8597051eb3ac6.png',0,'2021-05-18 20:29:47',21),(104,'Ardenweald Owns','Bigsaxx','public\\images\\uploads\\56c52b6ad7363bf593c29a.png','public/images/uploads/thumbnail-56c52b6ad7363bf593c29a.png',0,'2021-05-18 20:30:09',21),(105,'Throne Thundy','Thundurus','public\\images\\uploads\\6d1fff06653ad2016462e7.jpeg','public/images/uploads/thumbnail-6d1fff06653ad2016462e7.jpeg',0,'2021-05-18 20:30:31',21),(106,'OG Baby Vibez','Vibez','public\\images\\uploads\\513bb96d8cd0dafac41ac6.jpeg','public/images/uploads/thumbnail-513bb96d8cd0dafac41ac6.jpeg',0,'2021-05-18 20:30:52',21),(107,'Fully BiS Cow','Thundurus','public\\images\\uploads\\b8d7d494086a295781283a.png','public/images/uploads/thumbnail-b8d7d494086a295781283a.png',0,'2021-05-18 20:31:26',21),(108,'Thundy Adventures AGAYN','Thundurus','public\\images\\uploads\\7243fce294641a8288b718.png','public/images/uploads/thumbnail-7243fce294641a8288b718.png',0,'2021-05-18 20:31:48',21),(109,'King Cow','Thundurus','public\\images\\uploads\\bcf6666bd19b913390905b.png','public/images/uploads/thumbnail-bcf6666bd19b913390905b.png',0,'2021-05-18 20:32:10',21),(110,'Cow Stars','Thundurus','public\\images\\uploads\\fb2dad8cb036fedfa7245a.png','public/images/uploads/thumbnail-fb2dad8cb036fedfa7245a.png',0,'2021-05-18 20:32:31',21),(111,'Yung Locks','Insayn and friends','public\\images\\uploads\\55c95683884a2e1d375bae.png','public/images/uploads/thumbnail-55c95683884a2e1d375bae.png',0,'2021-05-18 20:33:04',21),(112,'Another Cow and some Gates','Thundurus','public\\images\\uploads\\8e7c15289a8e58c7c2d121.png','public/images/uploads/thumbnail-8e7c15289a8e58c7c2d121.png',0,'2021-05-18 20:33:37',21),(113,'Cow Shield Go Moo','Thundurus','public\\images\\uploads\\62cc206778a05ef4720aa4.png','public/images/uploads/thumbnail-62cc206778a05ef4720aa4.png',0,'2021-05-18 20:34:16',21),(114,'Mount Farming!!','Bigsax','public\\images\\uploads\\52ad9a5b40e4f6a4d7b58e.png','public/images/uploads/thumbnail-52ad9a5b40e4f6a4d7b58e.png',0,'2021-05-18 20:34:52',21),(115,'Lilcleanmike','Bigdirtymike','public\\images\\uploads\\cfac5a7c6b9e0cdc44bbfc.jpeg','public/images/uploads/thumbnail-cfac5a7c6b9e0cdc44bbfc.jpeg',0,'2021-05-18 20:35:14',21),(116,'Action Woyer','Dogtamer','public\\images\\uploads\\7a60a9b5e757be71439df5.jpeg','public/images/uploads/thumbnail-7a60a9b5e757be71439df5.jpeg',0,'2021-05-18 20:35:43',21),(117,'Demon WarKitty','Eternalsins','public\\images\\uploads\\712bbc38e66b45bccd931d.jpeg','public/images/uploads/thumbnail-712bbc38e66b45bccd931d.jpeg',0,'2021-05-18 20:36:14',21),(118,'Ardenweald is Cracked','Bigsaxx','public\\images\\uploads\\b924ba14fac60af91b2c42.png','public/images/uploads/thumbnail-b924ba14fac60af91b2c42.png',0,'2021-05-18 20:40:52',21),(119,'Spacecow-One','Thundurus','public\\images\\uploads\\30f8e33f36b4dbe441d4cf.png','public/images/uploads/thumbnail-30f8e33f36b4dbe441d4cf.png',0,'2021-05-18 20:41:44',21),(120,'Moon Boot Goofin\'','Thundurus','public\\images\\uploads\\d389cf17dd8d4d192a34f2.png','public/images/uploads/thumbnail-d389cf17dd8d4d192a34f2.png',0,'2021-05-18 20:42:15',21),(121,'Moo PoV','Bigsax and Soos','public\\images\\uploads\\de3ab9e99af50d14621738.jpeg','public/images/uploads/thumbnail-de3ab9e99af50d14621738.jpeg',0,'2021-05-18 20:42:45',21),(122,'Sick Landscape','Ace','public\\images\\uploads\\854e289100dc706a6ca52f.png','public/images/uploads/thumbnail-854e289100dc706a6ca52f.png',0,'2021-05-18 20:43:11',21),(123,'Boatsax','Bigsax','public\\images\\uploads\\82640979e3545d2434de8e.png','public/images/uploads/thumbnail-82640979e3545d2434de8e.png',0,'2021-05-18 20:43:35',21),(124,'I\'m a Woyer','Dogtamer','public\\images\\uploads\\cfd4624eb0e5e15b178727.jpeg','public/images/uploads/thumbnail-cfd4624eb0e5e15b178727.jpeg',0,'2021-05-18 20:43:56',21),(125,'DONKEYS #1','<Donkeys> Hee-Haw!','public\\images\\uploads\\1f2f82a6592ebaafc32cd1.png','public/images/uploads/thumbnail-1f2f82a6592ebaafc32cd1.png',0,'2021-05-18 20:44:10',21);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `email` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `usertype` int NOT NULL DEFAULT '0',
  `active` int NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (20,'test06','tes06@gmail.com','$2b$15$Fg3MdMHLw2h8cmK5NmIhI.7OP9TJR686MOTG4VRGKrJYpoSbOmGsW',0,0,'2021-05-14 02:17:18'),(21,'test05','test05@gmail.com','$2b$15$HgLf15jdJFdymCkQ06NOUe4GDiDwf1izr6Tzbe1bnB3tOlVZQBgx.',0,0,'2021-05-14 02:27:26'),(22,'refactorTest01','refact@gmail.com','$2b$15$0ioh6GhWQVYL7FZV72eBg.5N9QLjXf9SeaaZreCn.xR/En4YfXXCS',0,0,'2021-05-14 20:49:07'),(23,'sami','waidujaj@gmail.com','$2b$15$04T9i1i6qLNgeI8m2oOCmuLLhsmCjOkJ3WzbTz0JVaMb7KoNwseeO',0,0,'2021-05-14 20:55:40'),(24,'samitest','samitest@gmail.com','$2b$15$ewLoOqKrHXiinbBxTm5o2ukO6qFopXZS7jBhyqZRcVmvoub5h61dq',0,0,'2021-05-14 21:16:05'),(25,'test20','test20@gmail.com','$2b$15$Ej1DAwZl9lBpAay9zCnU9eQQus0gmMwUQkqtz6cPWG/ATr4djIW6C',0,0,'2021-05-15 00:35:22'),(26,'david05','david5@gmail.com','$2b$15$ENyoDULZhe3NT/KF/TC5ieJl2dIn7WVZ9Yjy0ciAoUWCER0PHCjEa',0,0,'2021-05-17 20:35:13'),(27,'davie','david2@gmail.com','$2b$15$xuxW/Ld60AoKnQkmQQjV9uLxnDC6g7cl2u5xQFFv4JAFelUAgIxi2',0,0,'2021-05-18 17:04:35');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-18 21:02:12
