-- MySQL dump 10.13  Distrib 5.5.23, for Win64 (x86)
--
-- Host: localhost    Database: engine
-- ------------------------------------------------------
-- Server version	5.5.23

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
-- Table structure for table `achievements`
--

DROP TABLE IF EXISTS `achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievements` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `img` text,
  `title` varchar(255) NOT NULL DEFAULT 'Новое достижение',
  `text` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievements`
--

LOCK TABLES `achievements` WRITE;
/*!40000 ALTER TABLE `achievements` DISABLE KEYS */;
INSERT INTO `achievements` VALUES (1,'/img/components/achievements-list/1.jpg','Грамота','от администрации за заслуги перед городом','2018-08-25 09:22:20'),(2,'/img/components/achievements-list/2.jpg','Диплом','от общественной организации за помощь в проекте','2018-08-28 10:31:12'),(3,'/img/components/achievements-list/3.jpg','Похвальный лист','Иванову А.А. за успехи в производстве и общественной жизни','2018-09-20 10:14:07'),(4,'/img/components/achievements-list/4.jpg','Благодарственное письмо','От постоянных клиентов','2018-09-20 10:14:49'),(5,'/img/components/achievements-list/5.jpg','Благодарность','За помощь в развитии науки и искусства','2018-09-20 10:15:27');
/*!40000 ALTER TABLE `achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agents`
--

DROP TABLE IF EXISTS `agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `agents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `phones` varchar(255) DEFAULT NULL,
  `contact_phone` varchar(30) DEFAULT NULL COMMENT 'Номер телефона для отправки смс',
  `text` text,
  `main_photo` varchar(455) DEFAULT NULL,
  `public` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agents`
--

LOCK TABLES `agents` WRITE;
/*!40000 ALTER TABLE `agents` DISABLE KEYS */;
INSERT INTO `agents` VALUES (1,'Галиахметов Сергей Сагитович','8(919)123-12-34','89191240611',NULL,NULL,1);
/*!40000 ALTER TABLE `agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `callbacks`
--

DROP TABLE IF EXISTS `callbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `callbacks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `manager_id` int(10) unsigned DEFAULT NULL COMMENT 'кто ответил на звонок',
  `recipient_id` int(10) unsigned DEFAULT NULL COMMENT 'для кого предназначается звонок',
  `client_number` varchar(20) NOT NULL COMMENT 'номер телефона клиента',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'статус обратного звонка: 1 - новый, 2 - обработан',
  `completed` timestamp NULL DEFAULT NULL COMMENT 'время завершения обратного звонка',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'когда был создан',
  PRIMARY KEY (`id`),
  KEY `manager_id` (`manager_id`),
  KEY `recipient_id` (`recipient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `callbacks`
--

LOCK TABLES `callbacks` WRITE;
/*!40000 ALTER TABLE `callbacks` DISABLE KEYS */;
INSERT INTO `callbacks` VALUES (1,NULL,1,'+79876543210',1,NULL,'2018-08-22 04:41:55');
/*!40000 ALTER TABLE `callbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'является ли пользователь администратором',
  `root` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'ROOT пользователь',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Регистрация завершена или нет',
  `surname` varchar(32) DEFAULT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `patronymic` varchar(32) DEFAULT NULL,
  `name` varchar(62) DEFAULT NULL,
  `phone` text CHARACTER SET cp1251 NOT NULL,
  `password` text NOT NULL,
  `mail` varchar(255) CHARACTER SET cp1251 DEFAULT NULL,
  `avatar` text,
  `address` text CHARACTER SET cp1251,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (8,1,1,1,'root','root','root','root r.','+7(987)-654-32-10','202cb962ac59075b964b07152d234b70','mismagilov@letaindex.ru',NULL,NULL,'2018-01-25 06:54:10'),(9,0,0,0,'Идылвао','ыдвало','дывлао','Идылвао ы.','+7(918)-712-34-32','e10adc3949ba59abbe56e057f20f883e','n3sh@ya.ru',NULL,'ывадл','2018-06-10 09:53:03'),(10,0,0,1,'Исмагилов','Марат','Габдулханович','Исмагилов М.','+7(919)-124-06-10','95d47be0d380a7cd3bb5bbe78e8bed49','n3sh@rambler.ru',NULL,NULL,'2018-06-10 09:54:19'),(11,0,0,1,'Иванов','Иван','Иванович','Иванов И.','','badeaaab5e93a10d212fad804b608604','letaindex74@gmail.com',NULL,NULL,'2018-08-24 04:30:56');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `components`
--

DROP TABLE IF EXISTS `components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `ctrl` varchar(64) DEFAULT NULL,
  `block_id` int(11) DEFAULT NULL,
  `static` tinyint(1) NOT NULL,
  `once` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Единственный на странице',
  `styles` text,
  `scripts` text,
  `default_config` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `block_id` (`block_id`),
  CONSTRAINT `components_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `fragments_blocks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components`
--

LOCK TABLES `components` WRITE;
/*!40000 ALTER TABLE `components` DISABLE KEYS */;
INSERT INTO `components` VALUES (1,'Управление маршрутами','routes-list',2,0,0,NULL,NULL,NULL,'2018-01-10 08:58:25'),(2,'Статический контент',NULL,NULL,1,0,NULL,NULL,'{\"body\": \"\"}','2018-01-10 09:22:25'),(3,'Главный слайдер','main-slider',4,0,1,NULL,NULL,'{\"slides\":[], \"lastId\": 0}','2018-01-10 12:17:53'),(4,'Страница авторизации','login-page',NULL,0,1,NULL,NULL,NULL,'2018-01-15 07:19:51'),(5,'Отображение новости','news-id',2,0,0,NULL,NULL,NULL,'2018-01-24 06:34:23'),(6,'Список новостей','news-list',2,0,0,NULL,NULL,NULL,'2018-01-24 08:34:58'),(7,'Управление клиентами','clients-manage',2,0,0,NULL,NULL,NULL,'2018-01-25 07:28:54'),(8,'Пустой блок',NULL,NULL,1,0,NULL,NULL,'{\"body\": \"\"}','2018-01-26 07:34:57'),(9,'Объявления краткий список','announcements-short-list',3,0,0,NULL,NULL,NULL,'2018-01-26 08:00:33'),(10,'Слайдер для магазина','shop-slider',4,0,1,NULL,NULL,'{\"slides\":[], \"lastId\": 0}','2018-01-29 06:52:55'),(11,'Отображение товаров по категории','goods-list',2,0,0,'\r\n',NULL,NULL,'2018-01-29 09:29:22'),(12,'Навигация для магазина','shop-menu',1,0,0,NULL,NULL,NULL,'2018-01-29 10:15:26'),(13,'Общая навигация','general-menu',1,0,0,NULL,NULL,NULL,'2018-01-29 10:37:05'),(14,'отображение товара','goods-view',2,0,0,NULL,NULL,NULL,'2018-01-31 06:32:44'),(15,'Корзина пользователя','shop-cart',2,0,0,NULL,NULL,NULL,'2018-02-01 08:19:52'),(16,'Оформление заказа','go-order',2,0,0,NULL,NULL,NULL,'2018-02-01 11:20:25'),(17,'Управление компонентами','components-manage',2,0,0,NULL,NULL,NULL,'2018-02-05 17:43:42'),(18,'Личный кабинет','my-cabinet',2,0,0,NULL,NULL,NULL,'2018-02-07 06:47:14'),(19,'Успешный заказ','order-complete',2,0,0,NULL,NULL,NULL,'2018-02-07 08:39:42'),(20,'Управление переменными сайта','global-variables',2,0,0,NULL,NULL,NULL,'2018-02-07 11:33:46'),(21,'Список моих заказов','my-orders',2,0,0,NULL,NULL,NULL,'2018-02-08 07:35:41'),(22,'Отзывы','reviews-list',2,0,0,NULL,NULL,NULL,'2018-02-08 10:29:38'),(23,'Вопрос-ответ','questions-list',2,0,0,NULL,NULL,NULL,'2018-02-12 06:49:18'),(24,'Список заказов','orders-list',2,0,0,NULL,NULL,NULL,'2018-02-13 08:01:50'),(25,'Отображение заказа','orders-view',2,0,0,NULL,NULL,NULL,'2018-02-13 09:31:15'),(26,'Список документов','documents-list',2,0,0,NULL,NULL,NULL,'2018-02-14 10:09:47'),(27,'Отображение документа','document-view',2,0,0,NULL,NULL,NULL,'2018-02-14 10:53:57'),(28,'Список магазинов','shops-list',2,0,0,NULL,NULL,NULL,'2018-02-18 11:48:26'),(29,'Отображение магазина','shops-view',2,0,0,NULL,NULL,NULL,'2018-02-18 12:26:29'),(30,'Список вакансий','vacancies-list',2,0,0,NULL,NULL,NULL,'2018-02-19 00:08:07'),(31,'Отображение вакансии','vacancies-view',2,0,0,NULL,NULL,NULL,'2018-02-19 00:20:51'),(32,'Заголовок страницы','page-title',NULL,0,0,NULL,NULL,'{\"body\": \"\"}','2018-03-10 14:27:06'),(33,'Отображение посещаемости','attendance-view',2,0,0,NULL,NULL,NULL,'2018-03-10 15:09:21'),(34,'Список достижений','achievements-list',2,0,0,NULL,NULL,NULL,'2018-04-25 08:18:10'),(35,'Список обратных звонков','callbacks-list',2,0,0,NULL,NULL,NULL,'2018-04-25 08:18:10'),(36,'Форма обратного звонка','callback-form',2,0,0,NULL,NULL,NULL,'2018-04-25 08:18:10'),(37,'Наши партнёры','partners-list',2,0,0,NULL,NULL,NULL,'2018-04-25 08:18:11'),(38,'\"Исходный код\"','source-code',NULL,0,0,NULL,NULL,NULL,'2018-04-25 08:18:11'),(39,'Наши работы','works-list',2,0,0,NULL,NULL,NULL,'2018-04-25 08:18:11'),(40,'Поиск захоронений','search-deads',NULL,0,0,NULL,NULL,NULL,'2018-05-14 14:57:27'),(41,'Список постов','posts-list',2,0,0,NULL,NULL,NULL,'2018-05-17 05:13:49'),(42,'Отображение поста','post-view',2,0,0,NULL,NULL,NULL,'2018-05-17 05:13:50'),(49,'Страница участка','place-view',NULL,0,0,NULL,NULL,NULL,'2018-05-22 10:05:33'),(50,'Страница захоронения','dead-view',NULL,0,0,NULL,NULL,NULL,'2018-05-22 10:05:33'),(51,'Книга памяти','memory-book',NULL,0,0,NULL,NULL,NULL,'2018-05-22 10:05:33'),(52,'Список ошибок','report-error-list',2,0,0,NULL,NULL,NULL,'2018-05-22 12:04:32'),(53,'Список посещаемых захоронений','my-visited-graves',2,0,0,NULL,NULL,NULL,'2018-05-22 12:04:41'),(54,'Список ошибок','report-error-list',2,0,0,NULL,NULL,NULL,'2018-05-31 03:54:01'),(55,'Список посещаемых захоронений','my-visited-graves',2,0,0,NULL,NULL,NULL,'2018-05-31 03:54:01'),(56,'Контакты','contacts',2,0,0,NULL,NULL,NULL,'2018-06-06 06:52:35'),(57,'Форма обратной связи','feedback-form',2,0,0,NULL,NULL,NULL,'2018-06-07 09:57:56'),(58,'Список сообщений обратной связи','feedback-list',2,0,0,NULL,NULL,NULL,'2018-06-07 09:58:07'),(59,'Список агентов','agents-list',2,0,0,NULL,NULL,NULL,'2018-06-16 13:22:13'),(60,'Админка книги памяти','memory-book-admin',2,0,0,NULL,NULL,NULL,'2018-07-11 06:23:13'),(61,'Отображение Агента','agents-view',2,0,0,NULL,NULL,NULL,'2018-07-11 06:24:15'),(62,'Управление магазином','crm-admin',2,0,0,NULL,NULL,NULL,'2018-08-08 11:35:49'),(63,'Форма вызова агента','agent-call-form',2,0,0,NULL,NULL,NULL,'2018-08-21 16:58:36'),(64,'Слайдер','slider',NULL,0,0,NULL,NULL,NULL,'2018-09-12 12:30:46'),(65,'Карта','map',2,0,0,NULL,NULL,NULL,'2018-09-12 12:31:49'),(66,'Установка мета-тегов','meta-manage',2,0,0,NULL,NULL,NULL,'2018-09-12 12:31:55'),(67,'Список категорий магазина','store-cats-list',4,0,0,NULL,NULL,NULL,'2018-09-19 08:55:09'),(68,'Поиск товаров по магазину','store-goods-search',4,0,0,NULL,NULL,NULL,'2018-09-19 10:44:39'),(69,'Случайные позиции','store-rand-pos',NULL,0,0,NULL,NULL,NULL,'2018-09-19 12:55:19');
/*!40000 ALTER TABLE `components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confirmed_emails`
--

DROP TABLE IF EXISTS `confirmed_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `confirmed_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(75) NOT NULL,
  `client_id` int(11) NOT NULL,
  `checked` int(11) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirmed_emails`
--

LOCK TABLES `confirmed_emails` WRITE;
/*!40000 ALTER TABLE `confirmed_emails` DISABLE KEYS */;
/*!40000 ALTER TABLE `confirmed_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confirmed_phones`
--

DROP TABLE IF EXISTS `confirmed_phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `confirmed_phones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned DEFAULT NULL,
  `phone` varchar(25) NOT NULL,
  `code` int(6) NOT NULL,
  `confirmed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confirmed_phones`
--

LOCK TABLES `confirmed_phones` WRITE;
/*!40000 ALTER TABLE `confirmed_phones` DISABLE KEYS */;
INSERT INTO `confirmed_phones` VALUES (1,9,'+7(918)-712-34-32',624001,0,'2018-06-10 09:53:03'),(2,10,'+7(919)-124-06-11',763859,1,'2018-06-10 09:54:19'),(3,11,'+7(919)-124-06-11',737400,1,'2018-08-24 04:30:56');
/*!40000 ALTER TABLE `confirmed_phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connected_crm`
--

DROP TABLE IF EXISTS `connected_crm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connected_crm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT 'Новая CRM',
  `address` varchar(155) DEFAULT NULL,
  `host` varchar(55) NOT NULL,
  `port` int(11) NOT NULL,
  `token` varchar(75) DEFAULT NULL,
  `crm_id` int(11) DEFAULT NULL COMMENT 'айди соединения в программе',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '0 - ожидает проверки; 1 - отклонено; 3 - подключено',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connected_crm`
--

LOCK TABLES `connected_crm` WRITE;
/*!40000 ALTER TABLE `connected_crm` DISABLE KEYS */;
/*!40000 ALTER TABLE `connected_crm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(70) NOT NULL DEFAULT 'Новый документ',
  `text` text,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'Новый документ',NULL,0,'2018-08-23 06:25:55');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedback` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `client_name` varchar(55) NOT NULL,
  `client_from` varchar(55) NOT NULL,
  `client_phone` varchar(30) NOT NULL,
  `client_email` varchar(55) NOT NULL,
  `message` text,
  `url` varchar(255) DEFAULT NULL COMMENT 'url с которого пришло сообщение',
  `category` varchar(255) NOT NULL COMMENT 'Категория сообщений',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
INSERT INTO `feedback` VALUES (1,NULL,'Иван','Магнитогорск','890909909090','n3sh@rambler.ru','Раз два три четыре пять',NULL,'','2018-06-07 09:59:35'),(2,8,'root root root','','+7(987)-654-32-10','mgnkpru@gmail.com','','http://185.20.179.30:3033/feedback','','2018-08-24 12:02:10');
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flowerassign`
--

DROP TABLE IF EXISTS `flowerassign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flowerassign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pers` int(11) unsigned NOT NULL,
  `mods` int(10) unsigned NOT NULL,
  `client` int(11) unsigned NOT NULL,
  `count` int(4) unsigned DEFAULT '1',
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `invoice` int(11) unsigned DEFAULT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `emp` int(11) DEFAULT NULL COMMENT 'Сотрудник, завершивший возложение',
  `done_date` date DEFAULT NULL COMMENT 'Дата выполнения',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `grave` (`pers`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Размещенные некрологи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flowerassign`
--

LOCK TABLES `flowerassign` WRITE;
/*!40000 ALTER TABLE `flowerassign` DISABLE KEYS */;
/*!40000 ALTER TABLE `flowerassign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fragments`
--

DROP TABLE IF EXISTS `fragments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fragments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component_id` int(11) NOT NULL DEFAULT '2',
  `route_id` int(11) NOT NULL,
  `block_id` int(11) DEFAULT NULL,
  `settings` text COMMENT 'Настройки фрагмента',
  `published` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Флаг публикации фрагмента',
  `priority` int(11) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fragments_ibfk_1` (`component_id`),
  KEY `fragments_ibfk_2` (`route_id`),
  CONSTRAINT `fragments_ibfk_1` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fragments_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fragments`
--

LOCK TABLES `fragments` WRITE;
/*!40000 ALTER TABLE `fragments` DISABLE KEYS */;
INSERT INTO `fragments` VALUES (2,4,61,4,NULL,1,1,'2018-03-19 11:06:56'),(4,13,40,1,NULL,1,1,'2018-03-26 13:39:12'),(5,13,70,1,NULL,1,1,'2018-03-26 13:41:54'),(6,13,49,1,NULL,1,1,'2018-03-26 13:45:20'),(7,13,50,1,NULL,1,1,'2018-03-26 13:45:37'),(8,13,51,1,NULL,1,1,'2018-03-26 13:45:49'),(9,13,67,1,NULL,1,1,'2018-03-26 13:46:01'),(10,1,49,2,NULL,1,1,'2018-03-26 13:46:49'),(11,7,50,2,NULL,1,1,'2018-03-26 13:47:01'),(12,33,51,2,NULL,1,1,'2018-03-26 13:48:01'),(14,17,67,2,NULL,1,1,'2018-03-26 13:48:58'),(15,20,70,2,NULL,1,1,'2018-03-26 14:00:56'),(19,5,86,2,NULL,1,1,'2018-04-02 11:12:42'),(22,41,87,2,'{\"target\":\"3\",\"url\":\"/post\",\"showPagination\":\"1\"}',1,1,'2018-05-17 05:19:58'),(23,42,88,2,'{\"listUrl\":\"/posts\"}',1,1,'2018-05-17 05:23:57'),(24,13,87,1,NULL,1,1,'2018-05-17 05:25:35'),(25,13,89,1,NULL,1,1,'2018-05-22 09:54:53'),(26,2,89,2,NULL,1,1,'2018-05-22 09:57:07'),(27,13,90,1,NULL,1,1,'2018-05-22 10:01:02'),(29,40,90,2,NULL,1,1,'2018-05-22 10:01:24'),(30,13,91,1,NULL,1,1,'2018-05-22 10:11:34'),(31,51,91,2,NULL,1,1,'2018-05-22 10:11:48'),(32,49,92,2,NULL,1,1,'2018-05-22 10:14:09'),(33,13,92,1,NULL,1,1,'2018-05-22 10:14:22'),(34,13,93,1,NULL,1,1,'2018-05-22 10:14:57'),(35,50,93,2,NULL,1,1,'2018-05-22 10:15:06'),(36,18,94,2,NULL,1,1,'2018-05-22 10:19:09'),(37,8,94,1,NULL,1,1,'2018-05-22 10:19:28'),(38,56,89,2,NULL,1,1,'2018-06-06 06:53:22'),(41,13,95,1,NULL,1,1,'2018-06-07 10:02:08'),(42,58,95,2,NULL,1,1,'2018-06-07 10:02:18'),(43,13,84,1,NULL,1,1,'2018-06-07 10:04:35'),(44,13,96,1,NULL,1,1,'2018-06-08 11:21:25'),(45,28,96,2,NULL,1,1,'2018-06-08 11:21:32'),(46,13,99,1,NULL,1,1,'2018-06-08 11:24:30'),(47,29,99,2,NULL,1,1,'2018-06-08 11:24:41'),(48,2,100,2,NULL,1,1,'2018-06-15 13:47:42'),(49,13,101,1,NULL,1,1,'2018-06-19 13:17:57'),(50,59,101,2,'{\"url\":\"/agent\"}',1,1,'2018-06-19 13:18:35'),(53,57,103,2,'{\"onlyRegistred\":\"0\",\"showClientFrom\":\"0\",\"category\":\"Форма на странице обратной связи\",\"title\":\" \"}',1,1,'2018-08-08 11:41:00'),(54,13,103,1,NULL,1,1,'2018-08-08 11:41:09'),(55,13,104,1,NULL,1,1,'2018-08-21 14:09:55'),(56,13,105,1,NULL,1,1,'2018-08-21 15:45:51'),(57,13,106,1,NULL,1,1,'2018-08-21 16:11:49'),(59,13,107,1,NULL,0,1,'2018-08-21 16:14:13'),(60,13,108,1,NULL,1,1,'2018-08-21 16:20:51'),(61,23,108,2,'{\"target\":\"1\"}',1,1,'2018-08-21 16:22:10'),(62,13,109,1,NULL,1,1,'2018-08-21 16:26:45'),(64,38,109,2,NULL,1,1,'2018-08-21 16:36:14'),(65,2,109,2,NULL,1,1,'2018-08-21 16:36:49'),(66,63,109,2,'{\"target\":\"2\"}',1,1,'2018-08-21 16:44:21'),(67,41,109,2,'{\"target\":\"2\",\"url\":\"/agent_old\"}',1,1,'2018-08-21 17:11:45'),(68,13,110,1,NULL,1,1,'2018-08-22 04:52:33'),(69,42,110,2,'{\"listUrl\":\"/agents_old\"}',1,1,'2018-08-22 04:53:23'),(72,13,111,1,NULL,1,1,'2018-08-23 05:56:02'),(75,22,111,2,NULL,1,1,'2018-08-23 06:09:24'),(78,13,112,1,NULL,1,1,'2018-08-24 02:39:51'),(79,2,112,2,NULL,0,1,'2018-08-24 02:40:10'),(81,9,96,3,NULL,1,1,'2018-08-24 11:42:19'),(82,32,112,1,NULL,1,1,'2018-08-24 11:45:36'),(87,34,105,2,'{\"urlPage\":\"\"}',0,1,'2018-08-25 09:16:19'),(91,13,113,1,NULL,1,1,'2018-08-27 05:14:00'),(97,10,114,4,NULL,0,1,'2018-08-27 05:45:58'),(98,41,85,2,'{\"target\":\"3\",\"url\":\"/new\"}',1,1,'2018-08-27 06:08:15'),(99,42,115,2,NULL,1,1,'2018-08-27 06:18:54'),(100,2,85,2,NULL,1,1,'2018-08-27 06:23:31'),(101,57,85,2,'{\"category\":\"Предложения новостей\",\"onlyRegistred\":\"0\",\"showClientFrom\":\"1\"}',1,1,'2018-08-27 06:24:50'),(104,22,84,2,'{\"onlyRegister\":\"0\",\"targetType\":\"1\"}',1,1,'2018-08-28 10:24:21'),(109,8,104,2,NULL,0,1,'2018-09-06 11:12:00'),(111,64,105,2,NULL,0,1,'2018-09-14 06:53:36'),(113,64,32,4,'{\"slidesToShow\":\"1\",\"slidesToScroll\":\"1\"}',1,1,'2018-09-18 09:56:35'),(114,64,32,2,'{\"slidesToScroll\":\"1\"}',1,1,'2018-09-18 09:57:23'),(115,38,32,4,NULL,1,10,'2018-09-18 10:16:25'),(116,2,32,4,NULL,1,1,'2018-09-18 10:20:02'),(117,38,32,4,NULL,1,1,'2018-09-18 10:47:36'),(118,34,106,2,NULL,1,1,'2018-09-18 11:31:42'),(119,13,116,1,NULL,1,1,'2018-09-19 04:33:15'),(120,13,100,1,NULL,1,1,'2018-09-19 04:34:35'),(121,2,116,2,NULL,1,1,'2018-09-19 04:36:23'),(122,13,117,1,NULL,1,1,'2018-09-19 05:18:23'),(123,30,117,2,NULL,1,1,'2018-09-19 05:18:34'),(124,8,49,2,NULL,0,1,'2018-09-19 05:20:51'),(125,13,118,1,NULL,1,1,'2018-09-19 05:22:06'),(126,31,118,2,NULL,1,1,'2018-09-19 05:23:09'),(127,2,103,2,NULL,1,10,'2018-09-19 07:55:03'),(128,2,117,2,NULL,1,10,'2018-09-19 08:20:01'),(129,2,117,2,NULL,1,9,'2018-09-19 08:28:53'),(130,67,102,4,NULL,1,1,'2018-09-19 08:50:38'),(131,68,102,4,NULL,1,10,'2018-09-19 10:48:28'),(133,69,102,4,NULL,1,1,'2018-09-19 13:12:48'),(134,12,119,1,NULL,1,1,'2018-09-20 06:17:00'),(135,11,119,2,NULL,1,1,'2018-09-20 06:17:18'),(136,13,120,1,NULL,1,1,'2018-09-20 09:45:07'),(137,2,120,2,NULL,1,1,'2018-09-20 09:46:59'),(138,13,123,1,NULL,1,1,'2018-09-20 09:48:42'),(139,13,124,1,NULL,1,1,'2018-09-20 09:48:58');
/*!40000 ALTER TABLE `fragments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fragments_blocks`
--

DROP TABLE IF EXISTS `fragments_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fragments_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fragments_blocks`
--

LOCK TABLES `fragments_blocks` WRITE;
/*!40000 ALTER TABLE `fragments_blocks` DISABLE KEYS */;
INSERT INTO `fragments_blocks` VALUES (1,'Навигация','2018-01-26 07:24:36'),(2,'Контент','2018-01-26 07:24:43'),(3,'Информативный','2018-01-26 07:24:48'),(4,'Вся часть страницы','2018-01-29 09:06:38');
/*!40000 ALTER TABLE `fragments_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fragments_data`
--

DROP TABLE IF EXISTS `fragments_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fragments_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component_id` int(11) DEFAULT NULL COMMENT 'Для повторного использования данных внутри компонента',
  `fragment_id` int(11) NOT NULL COMMENT 'Для привязки данных к определенному фрагменту',
  `data` text NOT NULL COMMENT 'Сами данные',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `component_id` (`component_id`),
  KEY `fragments_data_ibfk_2` (`fragment_id`),
  CONSTRAINT `fragments_data_ibfk_1` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`),
  CONSTRAINT `fragments_data_ibfk_2` FOREIGN KEY (`fragment_id`) REFERENCES `fragments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fragments_data`
--

LOCK TABLES `fragments_data` WRITE;
/*!40000 ALTER TABLE `fragments_data` DISABLE KEYS */;
INSERT INTO `fragments_data` VALUES (3,NULL,26,'{\"content\":{\"body\":\"<h1 style=\\\"text-align:center;\\\">Выберите пункт меню слева</h1>\\n\"}}','2018-05-22 09:57:16'),(4,NULL,48,'{\"content\":{\"body\":\"<p>&nbsp;</p>\\n\\n<p>Политика компании - это основные этические ориентиры в её повседневной деятельности. Какие ценности в компании приняты, какова её позиция по отношению к обществу, каких нравственных&nbsp;целей она хочет достичь, какими путями будет выполняться миссия - на всё эти вопросы отвечает раздел &laquo;Политика&raquo;.</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>Нужна ли политика компании на сайте? На этот вопрос нет однозначного ответа. Конечно же это решение в первую очередь принимается руководством. Публикуя свою политику компания становится более открытой по отношению к обществу и своим клиентам. В современном информационном мире, когда все друг друга знают и видят, эта позиция достаточно распространена.</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>Ну и ещё когда всякие копирайтеры будут писать статьи о компании на разных сторонних ресурсах, то они смогут брать текст из этого раздела, а не выдумывать всякие сложные и непонятные тексты.</p>\\n\"}}','2018-06-15 13:47:51'),(5,NULL,64,'{\"content\":{\"value\":\"<style>\\n    .cards__img-wrapp {\\n        max-height:400px;\\n        height:400px;\\n    }\\n    \\n    @media (min-width: 992px) and (max-width: 1366px) {\\n        .cards__img-wrapp {\\n            max-height:450px;\\n            height:450px;\\n        }\\n    }\\n    \\n    @media (min-width: 425px) and (max-width: 991px) {\\n        .cards__img-wrapp {\\n            max-height:500px;\\n            height:500px;\\n        }\\n    }\\n</style>\"}}','2018-08-21 16:36:23'),(6,NULL,65,'{\"content\":{\"value\":\"<h1 class=\\\"text-center\\\">test of fragment move</h1>\",\"body\":\"<p><span style=\\\"font-size:16px;\\\"><span style=\\\"font-family:Verdana,Geneva,sans-serif;\\\">Похоронный агент &ndash; это человек, который занимается организацией похорон под ключ. Здесь Вы можете ознакомиться со списком ритуальных агентов, работающих в МП КПРУ. </span></span></p>\\n\\n<p><span style=\\\"font-size:16px;\\\"><span style=\\\"font-family:Verdana,Geneva,sans-serif;\\\">Чтобы совершить <strong>вызов похоронного агента</strong>, в</span></span><span style=\\\"font-size:16px;\\\"><span style=\\\"font-family:Verdana,Geneva,sans-serif;\\\">ведите Ваш номер в строку ниже, чтобы заказать обратный звонок от агента&nbsp;или выберите понравившегося Вам ритуального агента из списка.</span></span></p>\\n\"}}','2018-08-21 16:37:17'),(9,NULL,79,'{\"content\":{\"body\":\"<p><img alt=\\\"\\\" src=\\\"/uploads/upload_85c04bdc55050de6116c2ca47ba3f99c.jpg\\\" style=\\\"width: 400px; height: 309px;\\\" /></p>\\n\"}}','2018-08-24 02:40:49'),(10,NULL,81,'{\"content\":{\"content\":\"С 18.09.2018 до 25.09.2018\"}}','2018-08-24 11:42:33'),(11,NULL,82,'{\"content\":{\"content\":\"123\"}}','2018-08-24 11:45:55'),(16,NULL,97,'{\"content\":{\"slides\":[{\"id\":1,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":2,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":3,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":4,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"}],\"lastId\":4}}','2018-08-27 05:46:04'),(17,NULL,100,'{\"content\":{\"body\":\"<p style=\\\"text-align: center;\\\"><span style=\\\"font-size:36px;\\\">Есть новости?</span></p>\\n\\n<p style=\\\"text-align: center;\\\">Предложите свою новость для публикации, используя форму ниже</p>\\n\"}}','2018-08-27 06:24:14'),(19,NULL,115,'{\"content\":{\"body\":\"<h1 style=\\\"text-align: center;\\\">&nbsp;</h1>\\n\\n<h1 style=\\\"text-align: center;\\\">Добро пожаловать</h1>\\n\",\"content\":\"Добро пожаловать на главную страницу\",\"value\":\"<div class=\\\"text-center\\\" style=\\\"padding-top:30px;\\\">\\n    <h1>Добро пожаловать</h1>\\n    <h2>Приветствуем Вас на универсальной платформе для создания сайтов</h2>    \\n</div>\\n\"}}','2018-09-18 10:17:13'),(20,NULL,115,'{\"content\":{\"body\":\"<h1 style=\\\"text-align: center;\\\">&nbsp;</h1>\\n\\n<h1 style=\\\"text-align: center;\\\">Добро пожаловать</h1>\\n\",\"content\":\"Добро пожаловать на главную страницу\",\"value\":\"<div class=\\\"text-center\\\" style=\\\"padding-top:30px;\\\">\\n    <h1>Добро пожаловать</h1>\\n    <h2>Приветствуем Вас на универсальной платформе для создания сайтов</h2>    \\n</div>\\n\"}}','2018-09-18 10:17:13'),(21,NULL,116,'{\"content\":{\"body\":\"<h1>&nbsp;</h1>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<h2 style=\\\"text-align: center;\\\">Блок статического контента</h2>\\n\\n<p>&nbsp;</p>\\n\\n<p>С помощью блока статического контента можно писать простой текст, заголовки, таблицы, колонки и многое другое.<span style=\\\"display: none;\\\">&nbsp;</span></p>\\n\\n<p>&nbsp;</p>\\n\\n<table border=\\\"0\\\" cellpadding=\\\"1\\\" cellspacing=\\\"1\\\" style=\\\"width:90%;margin:0 auto;\\\">\\n\\t<thead>\\n\\t\\t<tr>\\n\\t\\t\\t<th width=\\\"50%\\\">Левая колонка</th>\\n\\t\\t\\t<th>Правая колонка</th>\\n\\t\\t</tr>\\n\\t\\t<tr>\\n\\t\\t\\t<td>Блок статического контента позволяет вставлять в определенные места страниц произвольный контент, который может редактироваться на ходу в легком встроенном текстовом редакторе, имеющем доступ к HTML-коду редактируемого содержимого</td>\\n\\t\\t\\t<td>Имея в распоряжении блок статического контента уже можно создавать простые сайты, содержащие статическую текстовую информацию и картинки.</td>\\n\\t\\t</tr>\\n\\t</thead>\\n\\t<tbody>\\n\\t</tbody>\\n</table>\\n\\n<p>&nbsp;</p>\\n\\n<p>Расширенные возможности блока позволяют встраивать в него видео и фреймы, содержащие контент с других сайтов.</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\"}}','2018-09-18 10:33:05'),(22,NULL,117,'{\"content\":{\"value\":\"<div style=\\\"width:100%; background: #777; padding: 30px 0; color: #fff;\\\">\\n    <div style=\\\"width:90%; margin:20px auto;\\\">\\n        <h2>Блок исходного кода</h2>\\n        <p>Блок исходного кода позволяет использовать на странице чистый HTML-код, и редактировать его с помощью удобного встроенного редактора исходного кода</p>\\n        <br />\\n        <img src=\\\"/img/components/source-code/source-code.jpg\\\" style=\\\"display:block; margin: 0 auto;\\\" />\\n    </div>\\n</div>\"}}','2018-09-18 10:47:47'),(23,NULL,121,'{\"content\":{\"body\":\"<p style=\\\"text-align: center;\\\">Компонент Timeline</p>\\n\\n<p><img alt=\\\"\\\" src=\\\"/img/components/timeline/timeline.jpg\\\" style=\\\"display: block; margin: 10px auto; width: 50%;\\\" /></p>\\n\"}}','2018-09-19 04:36:46'),(24,NULL,127,'{\"content\":{\"body\":\"<p>&nbsp;</p>\\n\\n<p>На этой странице пользователи Вашего сайта смогут оставлять сообщения для Вас, по интересующим их вопросам. Эти сообщения можно просмотреть в разделе администрирования обратной связи, также возможно настроить их дублирование на почту.</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>Данный компонент позволяет создавать множество форм обратной связи в пределах одного проекта, для чего и служит поле категории обратной связи. Дополнительно можно включать и отключать те или иные&nbsp;поля, которые должен заполнять пользователь, и запрещать писать сообщения незарегистрированным пользователям.</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>В перспективе планируется перенести администрирование в сам компонент, запретить редактирование своих данных зарегистрированным пользователям, и&nbsp;добавить возможность разрешать редактирование этих данных на отдельных фрагментах.</p>\\n\\n<h3 style=\\\"text-align: center;\\\">Форма обратной связи</h3>\\n\"}}','2018-09-19 07:55:28'),(25,NULL,128,'{\"content\":{\"body\":\"<p>Здесь Вы сможете публиковать вакансии Вашей компании и собирать отклики от соискателей. В данный момент компонент работает только в текстовом режиме, но в перспективе планируется его доработка, а именно добавление возможности&nbsp;смены приоритета вакансий в списке, поиск по вакансиям и отключаемая возможность деления по группам и отделам.</p>\\n\\n<p>Что касается страницы вакансии, то там планируется&nbsp;разбиение описание на отдельные поля (требования, условия и т.д.) с возможностью отключения отдельных полей, добавление фото к вакансии, заморозка вакансии (в данный момент набора на данную вакансию нет, но мы готовы рассмотреть Вас, как только он начнётся), расширение функционала для ответа на вакансию (электронное резюме, с возможностью прикреплять файлы).</p>\\n\"}}','2018-09-19 08:20:46'),(26,NULL,129,'{\"content\":{\"body\":\"<h3 style=\\\"text-align: center;\\\">&nbsp;</h3>\\n\\n<h3 style=\\\"text-align: center;\\\">&nbsp;</h3>\\n\\n<h3 style=\\\"text-align: center;\\\">Список вакансий</h3>\\n\"}}','2018-09-19 08:30:55'),(27,NULL,129,'{\"content\":{\"body\":\"<h3 style=\\\"text-align: center;\\\">&nbsp;</h3>\\n\\n<h3 style=\\\"text-align: center;\\\">&nbsp;</h3>\\n\\n<h3 style=\\\"text-align: center;\\\">Список вакансий</h3>\\n\"}}','2018-09-19 08:30:55'),(28,NULL,130,'{\"content\":{\"slides\":[{\"id\":1,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":2,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":3,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":4,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":5,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":6,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":7,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":8,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":9,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":10,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"}],\"lastId\":10}}','2018-09-19 09:00:13'),(29,NULL,137,'{\"content\":{\"body\":\"<p>На этой странице будут размещены примеры шаблонов, используемых в движке. Каждый маршрут этого раздела содержит только шаблон страницы, на котором ещё не было каких-либо действий, добавлений и т.п., за исключением двух- и трехколоночных шаблонов, в которых уже добавлен компонент общей навигации, чтобы с них можно было переходить не только через кнопку возврата.</p>\\n\"}}','2018-09-20 09:47:20');
/*!40000 ALTER TABLE `fragments_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fragments_settings`
--

DROP TABLE IF EXISTS `fragments_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fragments_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fragment_id` int(11) NOT NULL,
  `title` text,
  `target` varchar(255) DEFAULT NULL,
  `value` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fragments_settings_ibfk_1` (`fragment_id`),
  CONSTRAINT `fragments_settings_ibfk_1` FOREIGN KEY (`fragment_id`) REFERENCES `fragments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fragments_settings`
--

LOCK TABLES `fragments_settings` WRITE;
/*!40000 ALTER TABLE `fragments_settings` DISABLE KEYS */;
INSERT INTO `fragments_settings` VALUES (1,22,NULL,'target','3','2018-09-20 14:42:23'),(2,104,NULL,'targetType','1','2018-09-20 15:09:28'),(3,61,NULL,'target','1','2018-09-20 15:09:39');
/*!40000 ALTER TABLE `fragments_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_site_config`
--

DROP TABLE IF EXISTS `global_site_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `global_site_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT NULL,
  `target` varchar(60) NOT NULL,
  `value` text NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1 - текст, 2 - число, 3 - логическое, 4 - json, 5 - ссылка на изображение',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_site_config`
--

LOCK TABLES `global_site_config` WRITE;
/*!40000 ALTER TABLE `global_site_config` DISABLE KEYS */;
INSERT INTO `global_site_config` VALUES (1,'Путь к файлу логотипа','siteLogo','/uploads/logo.svg',1,'2018-03-19 06:05:40',NULL),(2,'Текст в футере','footerText','© Лаборатория ЛетаIndex',1,'2018-04-16 04:49:46',NULL),(3,'Текст в тайтле после заголовка','appendTitle','ЛетаIndex Engine',1,'2018-04-25 06:51:57',NULL),(4,'Favicon','favicon','/favicon-li.ico',1,'2018-05-17 02:24:51',NULL),(5,'Доменное имя','domainName','engine.letaindex.ru',1,'2018-08-24 08:27:08','2018-08-24 08:27:08');
/*!40000 ALTER TABLE `global_site_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_cats`
--

DROP TABLE IF EXISTS `goods_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `title_bottom` varchar(255) DEFAULT NULL COMMENT 'Короткое название категории',
  `description` text,
  `img` text COMMENT 'Фото для слайдера',
  `parent_id` int(11) DEFAULT NULL,
  `alias_id` int(11) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1' COMMENT 'Порядок вывода категорий',
  `level` int(11) NOT NULL,
  `public` tinyint(1) DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `goods_cats_ibfk_1` (`parent_id`),
  CONSTRAINT `goods_cats_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `goods_cats` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_cats`
--

LOCK TABLES `goods_cats` WRITE;
/*!40000 ALTER TABLE `goods_cats` DISABLE KEYS */;
INSERT INTO `goods_cats` VALUES (1,'Компьютеры Apple',NULL,'Продукция марки Apple с установленной операционной системой MacOS','/img/components/store-cats-list/1.jpg',NULL,NULL,1,0,1,'2018-09-19 09:03:50'),(2,'Компьютеры c ОС Windows',NULL,'Компьютеры собственной сборки с операционной системой Microsoft Windows','/img/components/store-cats-list/2.jpg',NULL,NULL,2,0,1,'2018-09-19 09:03:50'),(3,'Компьютеры с ОС Linux',NULL,'Компьютеры собственной сборки с установленной операционной системой Linux','/img/components/store-cats-list/3.jpg',NULL,NULL,1,0,1,'2018-09-19 09:03:50'),(4,'Смартфоны на Android',NULL,'Смартфоны разных производителей с установленной на них операционной системой Android','/img/components/store-cats-list/4.jpg',NULL,NULL,1,0,1,'2018-09-19 09:03:50'),(5,'Смартфоны на iOS',NULL,'Смартфоны компании Apple с операционной системой iOS','/img/components/store-cats-list/5.jpg',NULL,NULL,1,0,1,'2018-09-19 11:51:55'),(6,'Ремонт компьютеров',NULL,'Услуги компании по диагностике и ремонту компьютеров, телефонов и планшетов','/img/components/store-cats-list/6.jpg',NULL,NULL,1,0,1,'2018-09-19 11:51:55'),(7,'Создание сайтов',NULL,'Проектирование, дизайн и разработка сайта компании на нашей платформе под ключ','/img/components/store-cats-list/7.jpg',NULL,NULL,1,0,1,'2018-09-19 11:51:55');
/*!40000 ALTER TABLE `goods_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_pos`
--

DROP TABLE IF EXISTS `goods_pos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_pos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `price` decimal(11,2) NOT NULL DEFAULT '999999999.99',
  `float_price` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Плавающая цена?',
  `service` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Является ли позиция сервисом',
  `count` int(11) NOT NULL DEFAULT '0',
  `reserv` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Зарезервировано в заказах',
  `cat_id` int(11) NOT NULL,
  `main_photo` int(11) DEFAULT NULL,
  `connect_id` int(11) DEFAULT NULL COMMENT 'Номер подключения (crm) откуда пришли товары',
  `pos_id` int(11) DEFAULT NULL COMMENT 'pos_id в программе',
  `mod_id` int(11) DEFAULT NULL COMMENT 'mod_id в программе',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text,
  `contract_price` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Договорная цена?',
  `recycled` int(11) NOT NULL DEFAULT '0' COMMENT 'Утилизированный или нет',
  `alias_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cat_id` (`cat_id`),
  KEY `goods_pos_ibfk_2` (`main_photo`),
  CONSTRAINT `goods_pos_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `goods_cats` (`id`),
  CONSTRAINT `goods_pos_ibfk_2` FOREIGN KEY (`main_photo`) REFERENCES `photos` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_pos`
--

LOCK TABLES `goods_pos` WRITE;
/*!40000 ALTER TABLE `goods_pos` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_pos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_props`
--

DROP TABLE IF EXISTS `goods_props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_props` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT 'Новый параметр',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Содержит названия параметров товаров';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_props`
--

LOCK TABLES `goods_props` WRITE;
/*!40000 ALTER TABLE `goods_props` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_props_bind_values`
--

DROP TABLE IF EXISTS `goods_props_bind_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_props_bind_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `prop_id` int(11) NOT NULL,
  `prop_value_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `good_id` (`good_id`),
  KEY `prop_id` (`prop_id`),
  KEY `prop_value_id` (`prop_value_id`),
  CONSTRAINT `goods_props_bind_values_ibfk_1` FOREIGN KEY (`good_id`) REFERENCES `goods_pos` (`id`) ON DELETE CASCADE,
  CONSTRAINT `goods_props_bind_values_ibfk_2` FOREIGN KEY (`prop_id`) REFERENCES `goods_props` (`id`) ON DELETE CASCADE,
  CONSTRAINT `goods_props_bind_values_ibfk_3` FOREIGN KEY (`prop_value_id`) REFERENCES `goods_props_values` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Содержит связь параметров товара с товаром';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_props_bind_values`
--

LOCK TABLES `goods_props_bind_values` WRITE;
/*!40000 ALTER TABLE `goods_props_bind_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_props_bind_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goods_props_values`
--

DROP TABLE IF EXISTS `goods_props_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `goods_props_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT 'Новое значение',
  `prop_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `prop_id` (`prop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Содержит значения параметров товаров';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_props_values`
--

LOCK TABLES `goods_props_values` WRITE;
/*!40000 ALTER TABLE `goods_props_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `goods_props_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `header_nav`
--

DROP TABLE IF EXISTS `header_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `header_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(70) NOT NULL DEFAULT 'Новый пункт меню',
  `href` varchar(70) NOT NULL DEFAULT '#',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `header_nav`
--

LOCK TABLES `header_nav` WRITE;
/*!40000 ALTER TABLE `header_nav` DISABLE KEYS */;
INSERT INTO `header_nav` VALUES (1,'Главная','/',0,'2018-03-26 13:37:37'),(2,'О компании','/company',0,'2018-03-27 04:43:16'),(4,'Магазин','/store',0,'2018-05-17 05:19:10'),(5,'Ритуалка','/rituals',0,'2018-05-22 09:53:23'),(13,'Шаблоны','/templates',0,'2018-08-27 05:12:20'),(14,'','',4,'2018-09-12 12:33:53'),(15,'История','/history',2,'2018-09-19 07:06:42'),(16,'Политика','/polytics',2,'2018-09-19 07:06:59'),(17,'Магазины','/shops-list',2,'2018-09-19 07:07:15'),(18,'Посты','/posts',2,'2018-09-19 07:07:28'),(19,'Отзывы','/reviews',2,'2018-09-19 07:08:03'),(20,'Награды','#',2,'2018-09-19 07:09:09'),(21,'Частые вопросы','/faq',2,'2018-09-19 07:09:19'),(22,'Вакансии','/vacancies',2,'2018-09-19 07:09:28'),(23,'Обратная связь','/feedback',2,'2018-09-19 07:11:31'),(24,'Пустая страница','/tpl-empty',13,'2018-09-20 09:32:48'),(25,'Одноколоночный макет','/tpl-one',13,'2018-09-20 09:33:11'),(26,'Двухколоночный макет','/tpl-two',13,'2018-09-20 09:33:33'),(27,'Трехколоночный макет','/tpl-three',13,'2018-09-20 09:34:35');
/*!40000 ALTER TABLE `header_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `targtype` varchar(10) NOT NULL,
  `targid` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `createtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `paymenttime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Выставленные счета';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_groups`
--

DROP TABLE IF EXISTS `menu_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT 'Новая группа',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_groups`
--

LOCK TABLES `menu_groups` WRITE;
/*!40000 ALTER TABLE `menu_groups` DISABLE KEYS */;
INSERT INTO `menu_groups` VALUES (1,'Меню администратора','2018-03-26 13:39:38'),(2,'Меню ритуалка','2018-05-22 09:55:21'),(3,'Меню о компании','2018-06-08 11:20:39'),(5,'Меню магазина','2018-08-30 11:22:22'),(6,'Меню шаблонов','2018-09-20 09:45:25');
/*!40000 ALTER TABLE `menu_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `href` text,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `route_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `only_admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Показывать пункт меню только для администаторов',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `priority` int(11) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `menu_items_ibfk_1` (`group_id`),
  CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `menu_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,'Маршруты','/admin-routes',0,NULL,1,0,'2018-03-26 13:39:57',1),(2,'Клиенты','/admin-clients',0,NULL,1,0,'2018-03-26 13:40:14',1),(3,'Посещаемость','/admin-attendance',0,NULL,1,0,'2018-03-26 13:40:57',1),(4,'Компоненты','/admin-components',0,NULL,1,0,'2018-03-26 13:41:23',1),(5,'Глобальные переменные','/admin-globals',0,NULL,1,0,'2018-03-26 13:41:45',1),(6,'Поиск захоронений','/burial_search',0,NULL,2,0,'2018-05-22 09:55:33',1),(7,'Книга памяти','/memory_book',0,NULL,2,0,'2018-05-22 09:57:00',1),(8,'Админ обр. связи','/admin-feedback',0,NULL,1,0,'2018-06-07 10:01:36',1),(9,'История','/history',0,NULL,3,0,'2018-06-08 11:20:55',1),(11,'Политика','/polytics',0,NULL,3,0,'2018-08-08 11:39:42',1),(12,'Магазины','/shops-list',0,NULL,3,0,'2018-08-21 16:09:55',1),(13,'Посты','/posts',0,NULL,3,0,'2018-08-21 16:11:27',1),(14,'Отзывы','/reviews',0,NULL,3,0,'2018-08-21 16:16:16',1),(15,'Вызов агента (posts)','/agents_old',0,NULL,2,0,'2018-08-21 16:24:47',1),(18,'Награды','/honors',0,NULL,3,0,'2018-08-24 11:45:04',1),(20,'Частые вопросы','/faq',0,NULL,3,0,'2018-08-27 06:08:03',1),(21,'Вакансии','/vacancies',0,NULL,3,0,'2018-08-27 06:28:01',1),(22,'Подключенные CRM','/crm',0,NULL,5,0,'2018-08-30 11:22:39',1),(24,'Обратная связь','/feedback',0,NULL,3,0,'2018-09-19 04:34:54',1),(25,'Пустая страница','/tpl-empty',0,NULL,6,0,'2018-09-20 09:46:09',1),(26,'Одноколоночный макет','/tpl-one',0,NULL,6,0,'2018-09-20 09:46:22',1),(27,'Двухколоночный макет','/tpl-two',0,NULL,6,0,'2018-09-20 09:46:35',1),(28,'Трехколоночный макет','/tpl-three',0,NULL,6,0,'2018-09-20 09:46:48',1);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_data`
--

DROP TABLE IF EXISTS `meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `meta_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) DEFAULT NULL,
  `alias_id` int(11) DEFAULT NULL,
  `target_type` varchar(55) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `title` text,
  `description` text,
  `keywords` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_data`
--

LOCK TABLES `meta_data` WRITE;
/*!40000 ALTER TABLE `meta_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(40) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `manager_id` int(10) unsigned DEFAULT NULL COMMENT 'Менеджер, обработавший заказ',
  `surname` varchar(60) NOT NULL,
  `firstname` varchar(60) NOT NULL,
  `patronymic` varchar(60) DEFAULT NULL,
  `status` int(10) unsigned NOT NULL DEFAULT '1' COMMENT 'Статус заказа: 1 - новый, 2 - в работе, 3 - завершен',
  `paid_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Состояние оплаты',
  `payed_sum` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT 'Выплаченная сумма',
  `email` varchar(70) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `price` decimal(11,2) NOT NULL COMMENT 'Общая стоимость',
  `deliveryMethod` int(11) NOT NULL,
  `paymentMethod` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `orders_ibfk_1` (`client_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_goods`
--

DROP TABLE IF EXISTS `orders_goods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `count` int(11) NOT NULL COMMENT 'Количество в заказе',
  `price` decimal(11,2) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `good_id` (`good_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `orders_goods_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_goods`
--

LOCK TABLES `orders_goods` WRITE;
/*!40000 ALTER TABLE `orders_goods` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partners`
--

DROP TABLE IF EXISTS `partners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partners` (
  `id` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT 'Новый партнёр',
  `text` text,
  `partners` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partners`
--

LOCK TABLES `partners` WRITE;
/*!40000 ALTER TABLE `partners` DISABLE KEYS */;
/*!40000 ALTER TABLE `partners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `price` decimal(11,2) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target` varchar(25) DEFAULT NULL,
  `target_id` int(10) unsigned DEFAULT NULL,
  `path` text NOT NULL,
  `connect_id` int(11) DEFAULT NULL COMMENT 'Номер коннекта сайта с программой. нужно для различия фото, отправленных с разных программ',
  `crm_photo_id` int(11) DEFAULT NULL COMMENT 'id фото в программе',
  `name` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,'shop',1,'/uploads/9510',NULL,NULL,'upload_1377feb2896ba9cfc90ae684564b6ee4.jpg','2018-09-20 16:09:11'),(2,'shop',2,'/uploads/bd2e',NULL,NULL,'upload_8a171b84001108c1acafe5be46d73199.jpg','2018-09-20 16:16:00'),(3,'shop',3,'/uploads/5628',NULL,NULL,'upload_99d9b046ee826b4406212ef022869142.jpg','2018-09-20 16:20:49'),(4,'shop',3,'/uploads/e3a9',NULL,NULL,'upload_c37a90ce77906c44f2ef17ac9ebb6f51.jpg','2018-09-20 16:23:17'),(5,'shop',3,'/uploads/356a',NULL,NULL,'upload_70e1ad6bb4e54a07a5ab8db42420fef5.jpg','2018-09-20 16:24:41');
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_targets`
--

DROP TABLE IF EXISTS `post_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_targets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_targets`
--

LOCK TABLES `post_targets` WRITE;
/*!40000 ALTER TABLE `post_targets` DISABLE KEYS */;
INSERT INTO `post_targets` VALUES (1,'Публикации'),(2,'Вызов агента'),(3,'Новости');
/*!40000 ALTER TABLE `post_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat` varchar(32) DEFAULT NULL,
  `title` varchar(255) NOT NULL DEFAULT 'Новая публикация',
  `subtitle` varchar(255) DEFAULT NULL,
  `alias_id` int(11) DEFAULT NULL,
  `text` text,
  `video` text,
  `source_link` text COMMENT 'ссылка на источник',
  `target` varchar(255) NOT NULL COMMENT 'Цель поста: новости, документы, статьи и т.п.',
  `similar_posts_id` varchar(55) DEFAULT NULL COMMENT 'Номера похожих постов',
  `main_photo` varchar(255) NOT NULL DEFAULT '/img/image-not-found.jpg',
  `counter_views` int(11) NOT NULL DEFAULT '0',
  `public` int(11) NOT NULL DEFAULT '0' COMMENT 'Отображается публикация на сайте или нет',
  `published` varchar(100) DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,NULL,'Раз два три',NULL,NULL,'<p><img alt=\"\" src=\"/uploads/upload_0527a469b47a33619fcb01c0a905f19a.jpg\" style=\"width: 600px; height: 450px; float: left; margin: 20px;\" /></p>\n\n<p>&nbsp;</p>\n\n<p>Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;</p>\n\n<p>Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;</p>\n\n<p>Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;</p>\n\n<p>Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;</p>\n',NULL,NULL,'1',NULL,'/uploads/upload_690207de890c394dcb7654b7e739df0b.jpg',0,1,'1526534761269',8,'2018-05-17 05:20:54',NULL),(2,NULL,'Галиахметов Сергей Сагитович',NULL,NULL,'<p><img alt=\"Ð¤Ð¾ÑÐ¾Ð³ÑÐ°ÑÐ¸Ñ Ð°Ð³ÐµÐ½ÑÐ°\" src=\"/uploads/upload_a38bcc0a5837950ca12e14997c196dfc.jpg\" style=\"height: 450px; width: 300px; border-width: 0px; border-style: solid; margin-right: 10px; margin-left: 10px; float: left;\" /></p>\n\n<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:200px;\">\n	<thead>\n		<tr>\n			<th scope=\"col\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">Номера телефонов</span></span></th>\n		</tr>\n	</thead>\n	<tbody>\n		<tr>\n			<td style=\"text-align: center;\"><a href=\"tel:+79512517784\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">8-951-251-7784</span></span></a></td>\n		</tr>\n		<tr>\n			<td style=\"text-align: center;\"><a href=\"tel:+79128052750\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">8-912-805-2750</span></span></a></td>\n		</tr>\n		<tr>\n			<td style=\"text-align: center;\"><a href=\"tel:+73519452750\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">45-27-50</span></span></a></td>\n		</tr>\n	</tbody>\n</table>\n\n<p>&nbsp;</p>\n',NULL,NULL,'2','','/uploads/upload_7379fe69fa40052dd311cdbca6e17f42.jpg',0,1,'1526546752861',8,'2018-05-17 03:02:01',NULL),(3,NULL,'Хлесткина Лилия Васильевна',NULL,NULL,'<p><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\"><img alt=\"\" src=\"/uploads/upload_7024aafc2db2cfe602d98d16e1ee9344.jpg\" style=\"width: 300px; height: 450px; border-width: 0px; border-style: solid; margin: 0px 10px; float: left;\" /></span></span></p>\n\n<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:200px;\">\n	<thead>\n		<tr>\n			<th scope=\"col\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">Номера телефонов</span></span></th>\n		</tr>\n	</thead>\n	<tbody>\n		<tr>\n			<td style=\"text-align: center;\"><a href=\"tel:+79080644981\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">8-908-064-4981</span></span></a></td>\n		</tr>\n	</tbody>\n</table>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n',NULL,NULL,'2','','/uploads/upload_df82ac603200f3f3bd32dd3834bfbba0.jpg',0,1,'1526547176465',8,'2018-05-17 03:02:07',NULL),(4,NULL,'Рогачёва Наталья Юрьевна',NULL,NULL,'<p><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\"><img alt=\"\" src=\"/uploads/upload_3dd277288ec32fcff4db35d2745845c1.jpg\" style=\"border-width: 0px; border-style: solid; margin-right: 10px; margin-left: 10px; float: left; width: 300px; height: 450px;\" /></span></span></p>\n\n<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:200px;\">\n	<thead>\n		<tr>\n			<th scope=\"col\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">Номера телефонов</span></span></th>\n		</tr>\n	</thead>\n	<tbody>\n		<tr>\n			<td style=\"text-align: center;\"><a href=\"tel:+79514499999\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">8-951-44-99-999</span></span></a></td>\n		</tr>\n	</tbody>\n</table>\n\n<p>&nbsp;</p>\n',NULL,NULL,'2','','/uploads/upload_ea61627620bea22121fedba62e4b4887.jpg',0,1,'1526547505255',8,'2018-05-17 03:02:12',NULL),(5,NULL,'Колесникова Екатерина Игоревна',NULL,NULL,'<p><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\"><img alt=\"\" src=\"/uploads/upload_b2e6651dd0045dffaa686d4dee6fc592.jpg\" style=\"border-width: 0px; border-style: solid; margin-left: 10px; margin-right: 10px; float: left; width: 300px; height: 450px;\" /></span></span></p>\n\n<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:200px;\">\n	<thead>\n		<tr>\n			<th scope=\"col\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">Номера телефонов</span></span></th>\n		</tr>\n	</thead>\n	<tbody>\n		<tr>\n			<td style=\"text-align: center;\"><a href=\"tel:+79507358385\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">8(950)735-83-85</span></span></a></td>\n		</tr>\n	</tbody>\n</table>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n',NULL,NULL,'2','','/uploads/upload_7b5e8ccfed869e1d7c2d6e3de13fbae1.jpg',0,1,'1526547599317',8,'2018-05-17 03:02:16',NULL),(6,NULL,'Переверзев Леонид Дмитриевич',NULL,NULL,'<p><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\"><img alt=\"\" src=\"/uploads/upload_247bdff3bf77b9837eeb4e3284f04af5.jpg\" style=\"border-width: 0px; border-style: solid; margin: 0px 10px; float: left; width: 300px; height: 450px;\" /></span></span></p>\n\n<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:200px;\">\n	<thead>\n		<tr>\n			<th scope=\"col\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">Номера телефонов</span></span></th>\n		</tr>\n	</thead>\n	<tbody>\n		<tr>\n			<td style=\"text-align: center;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\"><a href=\"tel:+79630955552\">8(963)095-55-52</a></span></span></td>\n		</tr>\n	</tbody>\n</table>\n\n<p>&nbsp;</p>\n',NULL,NULL,'2','','/uploads/upload_d4fed477a9fbe22e94d7bf27a6312a5e.jpg',0,1,'1528451122659',8,'2018-05-17 03:02:21',NULL),(7,NULL,'Королев Лев Альбертович',NULL,NULL,'<p><img alt=\"\" src=\"/uploads/upload_7f0047e12a1fb19efd690dcf8db381ee.jpg\" style=\"border-width: 0px; border-style: solid; margin: 0px 10px; float: left; width: 300px; height: 450px;\" /></p>\n\n<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:200px;\">\n	<tbody>\n		<tr>\n			<td style=\"text-align: center;\"><strong><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">Номера телефонов</span></span></strong></td>\n		</tr>\n		<tr>\n			<td style=\"text-align: center;\"><a href=\"tel:+79681190818\">8(968)119-08-18</a></td>\n		</tr>\n	</tbody>\n</table>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n',NULL,NULL,'2','','/uploads/upload_2996c0b8d33cb1c2a866954898858836.jpg',0,1,'1529047604918',8,'2018-06-15 02:14:44',NULL),(8,NULL,'Новая публикация',NULL,NULL,NULL,NULL,NULL,'Публикации','','/uploads/upload_88ca455f7209dd58adc44fe3494c2882.jpg',0,0,NULL,8,'2018-08-23 16:54:10',NULL),(9,NULL,'Новая новость',NULL,NULL,NULL,NULL,NULL,'3','','/uploads/upload_f4a5ef3bbb31f6956f322d98a6e6d870.jpg',0,1,'1535350271760',8,'2018-08-27 06:11:01',NULL),(10,NULL,'Новая публикация2','hfp ljds;lfkjs df;lasjkdfl',NULL,NULL,NULL,NULL,'3','','/uploads/upload_cb2f5dd48d4c1db09fed2a0a8fa2831d.jpg',0,1,'1535350985373',8,'2018-08-27 06:22:59',NULL),(11,NULL,'Новая публикация1',NULL,NULL,NULL,NULL,NULL,'3',NULL,'/uploads/upload_784b207000578c30c88eefe002197d10.jpg',0,1,'1535350986407',8,'2018-08-27 06:23:01',NULL),(12,NULL,'Новая публикация',NULL,NULL,NULL,NULL,NULL,'3',NULL,'/uploads/upload_37c91629da623dc56b4451553f7c2ae0.jpg',0,1,'1537335234487',8,'2018-09-18 11:31:24',NULL),(13,NULL,'Новая публикация',NULL,NULL,NULL,NULL,NULL,'3',NULL,'/uploads/upload_c1692aea990cc2e2d37c7334c484c0fb.jpg',0,1,'1537335233218',8,'2018-09-18 11:31:27',NULL),(14,NULL,'Новая публикация',NULL,NULL,NULL,NULL,NULL,'3',NULL,'/uploads/upload_497ea660fcc83ff3040044732a7e7e78.jpg',0,1,'1537335231871',8,'2018-09-18 11:31:29',NULL);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ид',
  `target` int(11) DEFAULT '0' COMMENT 'Цель вопросов: для всей компании и дополнительно к ней страницу вопрос-ответ для конкретного сотрудника',
  `type` varchar(8) NOT NULL COMMENT 'тип записи',
  `category_id` int(11) NOT NULL DEFAULT '6' COMMENT 'id родительской категории',
  `author` smallint(5) unsigned DEFAULT NULL,
  `question` text NOT NULL COMMENT 'вопрос',
  `answer` text COMMENT 'ответ',
  `public` int(2) NOT NULL DEFAULT '0' COMMENT 'Публиковать',
  `creator` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='faq';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'category',1,NULL,'Новая категория','Так и так',1,NULL,'2018-08-23 06:08:07'),(2,1,'question',1,NULL,'Как жить дальше','Так и жить',1,NULL,'2018-08-23 16:52:29'),(6,1,'question',6,NULL,'Сколько стоит сайт, если заказывать его у Вас?','Для подсчета стоимости обратитесь к нашим менеджерам в разделе <a href=\"/feedback\">Обратная связь</a>',1,NULL,'2018-09-20 10:04:04'),(5,1,'question',6,NULL,'Как быстро можно сделать сайт на таком движке?','Сайт уже готов. Отключите лишнее и пользуйтесь',1,NULL,'2018-09-19 05:31:55');
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_categories`
--

DROP TABLE IF EXISTS `questions_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target_id` int(11) DEFAULT '0',
  `title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_categories`
--

LOCK TABLES `questions_categories` WRITE;
/*!40000 ALTER TABLE `questions_categories` DISABLE KEYS */;
INSERT INTO `questions_categories` VALUES (1,1,'Общие вопросы');
/*!40000 ALTER TABLE `questions_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions_targets`
--

DROP TABLE IF EXISTS `questions_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions_targets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(75) DEFAULT 'Новая категория',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_targets`
--

LOCK TABLES `questions_targets` WRITE;
/*!40000 ALTER TABLE `questions_targets` DISABLE KEYS */;
INSERT INTO `questions_targets` VALUES (1,'Основной раздел вопросов и ответов'),(2,'Вопросы и ответы на странице директора');
/*!40000 ALTER TABLE `questions_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `target_type` varchar(50) DEFAULT NULL,
  `target_id` int(10) unsigned DEFAULT NULL,
  `text` text NOT NULL,
  `published` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Опубликован или нет',
  `contact` int(10) unsigned DEFAULT NULL COMMENT 'Контакт',
  `by_client_retail_id` int(10) unsigned DEFAULT NULL COMMENT 'id клиента в рознице',
  `by_client_name` varchar(255) DEFAULT NULL COMMENT 'Имя клиента',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1878 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,8,'1',NULL,'Спасибо ВСЕМ за проделанную работу!!! Заказав через интернет замену памятников у своих бабушки и дедушки Насакиных,изначально я побаивалась что обманут, т.к. заказчик находится за пределами области, но все работы сделаны хорошо и качественно. Обслуживала менеджер Ирина Барабина знаток своего дела, чуткая, отзывчивая,профессионал своего дела , предоставляла фотоочет о проделанной работе, консультировала с выбором материалов, МОЛОДЕЦ!\n\nТакже заказывала возложение цветов родственникам, исполняется быстро,без задержек с фотоотчетами на сайте - супер!!! Было бы так на всех кладбищах но увы. :-(\n\nВсем здоровья и всех благ!',1,NULL,NULL,NULL,'2018-05-15 11:11:11'),(2,8,'1',NULL,'В скорбные для нас дни выражаем благодарность работникам ритуальной компании МП «КПРУ» за проведение похорон нашего горячо любимого папы Подлеснова Виктора Николаевича. Все было организовано грамотно, четко, спасибо вам.\n\nЖелаем Вам и всему коллективу здоровья, интересных замыслов и их благополучных воплощений, ярких, значительных событий, личного счастья и дальнейшего процветания предприятия.',0,NULL,NULL,NULL,'2018-05-15 11:15:13'),(3,204,'1',NULL,'Большое спасибо компании КПРУ за этот замечательный сайт, благодаря вам мы смогли найти мы нашли могилу нашего брата. и думали что вообще её не найдём. Спасибо Вам ребята!!!',1,NULL,NULL,'NULL','2014-01-16 21:01:24'),(4,584,'1',NULL,'Здравствуйте, представляете, сегодня узнала, что существует такой замечательный сайт.Выражаю благодарность всей администрации МП КПРУ и сотрудникам которым пришлось проделать такую величайшую работу.Это же так замечательно,что теперь есть такой сайт. Спасибо Вам огромное!!!!',1,NULL,NULL,'NULL','2014-04-24 03:20:27'),(5,751,'1',NULL,'Огромное спасибо за выполненную работу!проделали колоссальный труд!',1,NULL,NULL,'NULL','2014-04-29 11:05:50'),(6,800,'1',NULL,'Невероятная работа проделана, чтобы сделать \"Поиск захоронений\". Огромное спасибо всем, кто принимал участие в его создании. Колоссальный труд, его объем просто неимоверный.',1,NULL,NULL,'NULL','2014-05-03 05:29:36'),(7,867,'1',NULL,'Спасибо Огромное составителям данного сайта!В трудную минуту он нас очень выручил!Колоссальный труд проделанный Вашими работниками помогает многим людям найти своих друзей, родственников покинувших этот мир!Спасибо оператору Лавровой Анне,которая помогла нам в нелёгкой для нас ситуации.Огромное спасибо составителям сайта!',1,NULL,NULL,'NULL','2014-05-03 10:50:38'),(8,997,'1',NULL,'Огромное человеческое спасибо организаторам такого нужного сайта, не могли даже мечтать об этом. И еще раз хочется поблагодарить Галиахметова Сергея за чуткость и внимание, спасибо Вам Сергей и низкий поклон.',1,NULL,NULL,'NULL','2014-05-09 06:44:37');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews_target`
--

DROP TABLE IF EXISTS `reviews_target`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews_target` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT 'Новая категория отзывов',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews_target`
--

LOCK TABLES `reviews_target` WRITE;
/*!40000 ALTER TABLE `reviews_target` DISABLE KEYS */;
INSERT INTO `reviews_target` VALUES (1,'Страница отзывов','2018-09-19 05:13:18');
/*!40000 ALTER TABLE `reviews_target` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT 'Новый маршрут',
  `url` varchar(255) NOT NULL,
  `template_id` int(11) DEFAULT '1',
  `menu_id` int(11) DEFAULT NULL,
  `active_menu_item` int(11) DEFAULT NULL COMMENT 'Подсветка активного пункта меню',
  `target_id` int(11) DEFAULT NULL COMMENT 'Какую цель преследует маршрут',
  `show_title` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Показывать или скрывать тайтл на странице',
  `use_component_title` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Использовать заголовок из компонента или нет',
  `access` int(11) DEFAULT '1',
  `dynamic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Обязательный маршрут или нет. Обязательные нельзя удалять',
  `edit_access` tinyint(4) NOT NULL DEFAULT '1',
  `delete_access` tinyint(4) NOT NULL DEFAULT '1',
  `seo_keywords` text,
  `seo_description` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`),
  KEY `access` (`access`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`),
  CONSTRAINT `routes_ibfk_2` FOREIGN KEY (`access`) REFERENCES `routes_access` (`id`),
  CONSTRAINT `routes_ibfk_3` FOREIGN KEY (`menu_id`) REFERENCES `menu_groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (32,'Главная страница','/',1,NULL,NULL,NULL,1,0,1,0,1,1,1,'','','2018-01-17 10:11:31','2018-09-18 10:13:14'),(40,'Администрирование','/admin',2,1,NULL,NULL,1,0,3,0,1,1,1,'','','2018-01-20 20:43:27','2018-03-26 13:39:43'),(49,'Маршруты','/admin-routes',2,1,NULL,NULL,1,0,3,0,1,1,1,'','','2018-01-25 07:14:47','2018-09-19 07:42:18'),(50,'Управление клиентами','/admin-clients',2,1,NULL,NULL,1,0,3,0,1,1,1,'','','2018-01-25 07:15:29','2018-03-26 13:45:43'),(51,'Посещаемость','/admin-attendance',2,1,NULL,NULL,1,0,3,0,1,1,1,'','','2018-01-25 08:34:36','2018-03-26 13:45:55'),(61,'Авторизация','/login',1,NULL,NULL,NULL,1,0,1,0,1,0,0,'','','2018-01-25 11:49:17','2018-01-25 12:00:21'),(67,'Управление компонентами','/admin-components',2,1,NULL,NULL,1,0,3,0,1,1,1,'','','2018-02-05 17:38:19','2018-03-26 13:46:08'),(70,'Глобальные переменные','/admin-globals',2,1,NULL,NULL,1,0,3,0,1,1,1,'','','2018-02-07 11:31:36','2018-03-26 13:42:05'),(84,'Отзывы','/reviews',2,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-04-02 10:01:46','2018-06-08 11:20:39'),(85,'Новости','/news',4,NULL,NULL,NULL,1,0,1,0,0,1,1,'','','2018-04-02 11:06:37','2018-06-06 07:33:34'),(86,'Страница новости','/news-id/:params',2,NULL,NULL,NULL,1,0,1,1,0,1,1,'','','2018-04-02 11:10:44','2018-04-02 11:12:33'),(87,'Посты','/posts',2,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-05-17 05:19:50','2018-09-18 11:29:47'),(88,'Публикация','/post/:params',2,NULL,NULL,NULL,1,0,1,1,0,1,1,'','','2018-05-17 05:23:49',NULL),(89,'Кладбища','/cemeteries',3,2,NULL,NULL,1,0,1,0,0,1,1,'','','2018-05-22 09:53:13','2018-05-22 09:55:21'),(90,'Поиск захоронений','/burial_search',3,2,NULL,NULL,1,0,1,0,0,1,1,'','','2018-05-22 09:54:31','2018-05-22 10:01:18'),(91,'Книга памяти','/memory_book',3,2,NULL,NULL,1,0,1,0,0,1,1,'','','2018-05-22 10:11:18','2018-05-22 10:11:45'),(92,'Страница участка','/place/:params',3,2,NULL,NULL,1,0,1,1,0,1,1,'','','2018-05-22 10:13:37','2018-05-22 10:14:28'),(93,'Страница захоронения','/person/:params',3,2,NULL,NULL,1,0,1,1,0,1,1,'','','2018-05-22 10:13:54','2018-05-22 10:15:03'),(94,'Личный кабинет','/my',3,NULL,NULL,NULL,1,0,1,0,0,1,1,'','','2018-05-22 10:19:02',NULL),(95,'Обратная связь','/admin-feedback',2,1,NULL,NULL,1,0,1,0,0,1,1,'','','2018-06-07 10:02:03','2018-06-07 10:02:17'),(96,'Магазины компании','/shops-list',2,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-06-08 11:21:18','2018-06-08 11:21:30'),(99,'Магазин','/shop-page/:params',2,3,12,NULL,1,0,1,1,0,1,1,'','','2018-06-08 11:24:18','2018-09-19 12:11:25'),(100,'Политика компании','/polytics',2,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-06-15 13:47:37','2018-09-19 04:36:04'),(101,'Список агентов','/agents',3,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-06-19 13:17:50','2018-06-19 13:18:12'),(102,'Магазин','/store',1,5,NULL,NULL,1,0,1,0,0,1,1,'','','2018-06-19 14:31:58','2018-09-19 10:30:33'),(103,'Обратная связь','/feedback',3,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-08-08 11:40:52','2018-08-08 11:41:15'),(104,'О компании','/company',2,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-08-21 14:09:44','2018-08-21 14:10:02'),(105,'Ритуалка','/rituals',2,2,NULL,NULL,1,0,1,0,0,1,1,'','','2018-08-21 15:45:45','2018-08-21 15:46:03'),(106,'Награды','/honors',2,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-08-21 16:11:45','2018-08-21 16:11:59'),(107,'Информация','/info',2,NULL,NULL,NULL,1,0,1,0,0,1,1,'','','2018-08-21 16:14:06','2018-08-21 16:14:35'),(108,'Частые вопросы','/faq',2,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-08-21 16:20:42','2018-08-21 16:21:58'),(109,'Вызов агента (posts)','/agents_old',2,2,NULL,NULL,1,0,1,0,0,1,1,'','','2018-08-21 16:26:34','2018-08-21 16:27:04'),(110,'Страница агента','/agent_old/:params',2,2,NULL,NULL,1,0,1,1,0,1,1,'','','2018-08-22 04:50:25','2018-08-22 04:52:42'),(111,'Новый маршрут','/new_route',2,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-08-23 05:49:02','2018-08-23 05:56:35'),(112,'О компании','/about',2,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-08-24 02:37:33','2018-08-24 02:39:57'),(113,'Новая страница','/new_page',2,1,NULL,NULL,1,0,1,0,0,1,1,'','','2018-08-27 05:12:12','2018-08-27 05:14:05'),(114,'Слайдер магазина','/shop-slider',1,NULL,NULL,NULL,1,0,1,0,0,1,1,'','','2018-08-27 05:45:39',NULL),(115,'Страница новости','/new/:params',3,NULL,NULL,NULL,1,0,1,1,0,1,1,'','','2018-08-27 06:14:22',NULL),(116,'История компании','/history',2,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-09-19 04:33:00','2018-09-19 04:33:21'),(117,'Вакансии','/vacancies',2,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-09-19 05:17:57','2018-09-19 05:20:08'),(118,'Вакансия','/vacancy/:params',2,3,NULL,NULL,1,0,1,1,0,1,1,'','','2018-09-19 05:21:32','2018-09-19 05:22:13'),(119,'Категория магазина','/store-cat/:params',2,NULL,NULL,NULL,1,0,1,1,0,1,1,'','','2018-09-20 06:16:44',NULL),(120,'Шаблоны','/templates',2,6,NULL,NULL,1,0,1,0,0,1,1,'','','2018-09-20 09:42:50','2018-09-20 09:45:25'),(121,'Пустой шаблон страницы','/tpl-empty',1,NULL,NULL,0,1,0,1,0,0,1,1,'','','2018-09-20 09:43:19','2018-09-20 09:44:57'),(122,'Одноколоночный макет страницы','/tpl-one',4,NULL,NULL,NULL,1,0,1,0,0,1,1,'','','2018-09-20 09:43:54',NULL),(123,'Двухколоночный макет страницы','/tpl-two',3,6,NULL,NULL,1,0,1,0,0,1,1,'','','2018-09-20 09:44:13','2018-09-20 09:48:48'),(124,'Трехколоночный макет страницы','/tpl-three',2,6,NULL,NULL,1,0,1,0,0,1,1,'','','2018-09-20 09:44:31','2018-09-20 09:49:10');
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes_access`
--

DROP TABLE IF EXISTS `routes_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes_access`
--

LOCK TABLES `routes_access` WRITE;
/*!40000 ALTER TABLE `routes_access` DISABLE KEYS */;
INSERT INTO `routes_access` VALUES (1,'Публичный маршрут'),(2,'Только авторизованным пользователям'),(3,'Только для администратора');
/*!40000 ALTER TABLE `routes_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes_aliases`
--

DROP TABLE IF EXISTS `routes_aliases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes_aliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `main` tinyint(1) NOT NULL DEFAULT '0',
  `title` varchar(64) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `route_id` (`route_id`),
  CONSTRAINT `routes_aliases_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes_aliases`
--

LOCK TABLES `routes_aliases` WRITE;
/*!40000 ALTER TABLE `routes_aliases` DISABLE KEYS */;
INSERT INTO `routes_aliases` VALUES (1,110,'/ritualnuy-agent-korolev-lev-albertovich',0,'','7','2018-08-22 15:54:09');
/*!40000 ALTER TABLE `routes_aliases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes_targets`
--

DROP TABLE IF EXISTS `routes_targets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `routes_targets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes_targets`
--

LOCK TABLES `routes_targets` WRITE;
/*!40000 ALTER TABLE `routes_targets` DISABLE KEYS */;
/*!40000 ALTER TABLE `routes_targets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shops_list`
--

DROP TABLE IF EXISTS `shops_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shops_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alias_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT 'Новый магазин',
  `main_photo` text,
  `text` text,
  `address` varchar(250) DEFAULT NULL,
  `phones` varchar(255) DEFAULT NULL,
  `schedule` varchar(255) DEFAULT '{"1":["08:00","17:00"],"2":["09:00","17:00"],"3":["09:00","17:00"],"4":["09:00","17:00"],"5":["09:00","17:00"],"6":["09:00","17:00"],"7":["09:00","17:00"]}' COMMENT 'График работы',
  `coords` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shops_list`
--

LOCK TABLES `shops_list` WRITE;
/*!40000 ALTER TABLE `shops_list` DISABLE KEYS */;
INSERT INTO `shops_list` VALUES (1,NULL,'В новых','1','<p>Магазин имеет удобное расположение среди новостроек. В нем всегда в наличии весть ассортимент нашей продукции</p>','Новая 7','+7 (3519) 99-88-77','{\"1\":[\"08:00\",\"17:00\"],\"2\":[\"09:00\",\"17:00\"],\"3\":[\"09:00\",\"17:00\"],\"4\":[\"09:00\",\"17:00\"],\"5\":[\"09:00\",\"17:00\"],\"6\":[\"09:00\",\"17:00\"],\"7\":[\"09:00\",\"17:00\"]}','53.360948, 58.957496','2018-06-08 11:21:45'),(2,NULL,'В Ленинском','2','<p>Удачное расположение этого магазина сделает его посещение действительно простым и удобным, а широкий ассортимент продукции в наличии позволит не ждать доставки заказа.</p>','Ленина 10','+7 (3519) 33-44-55','{\"1\":[\"08:00\",\"17:00\"],\"2\":[\"09:00\",\"17:00\"],\"3\":[\"09:00\",\"17:00\"],\"4\":[\"09:00\",\"17:00\"],\"5\":[\"09:00\",\"17:00\"],\"6\":[\"09:00\",\"17:00\"],\"7\":[\"09:00\",\"17:00\"]}','53.436814, 58.971331','2018-06-08 11:21:49'),(3,NULL,'На левом','4','<p>Мы специально открыли магазин на левом берегу нашего города, чтобы Вам не приходилось ездить слишком далеко за покупками в магазины нашей компании.</p>','Левая 77','+7 (3519) 88-77-66','{\"1\":[\"08:00\",\"17:00\"],\"2\":[\"09:00\",\"17:00\"],\"3\":[\"09:00\",\"17:00\"],\"4\":[\"09:00\",\"17:00\"],\"5\":[\"09:00\",\"17:00\"],\"6\":[\"09:00\",\"17:00\"],\"7\":[\"09:00\",\"17:00\"]}','53.383805, 59.102614','2018-06-08 11:21:51');
/*!40000 ALTER TABLE `shops_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` text,
  `title` text,
  `subtitle` text,
  `text` text,
  `priority` int(11) NOT NULL DEFAULT '1',
  `fragment_id` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

LOCK TABLES `slides` WRITE;
/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
INSERT INTO `slides` VALUES (5,'/img/components/slider/slide1.jpg',NULL,NULL,NULL,1,113,1,'2018-09-18 10:14:11'),(6,'/img/components/slider/slide2.jpg',NULL,NULL,NULL,1,113,1,'2018-09-18 10:14:30'),(7,'/img/components/slider/slide3.jpg',NULL,NULL,NULL,1,113,1,'2018-09-18 10:15:08');
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_links`
--

DROP TABLE IF EXISTS `social_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL DEFAULT 'Новая ссылка',
  `icon` varchar(20) DEFAULT 'fa-question',
  `href` varchar(100) NOT NULL DEFAULT '#',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Ссылки на социальные сети';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_links`
--

LOCK TABLES `social_links` WRITE;
/*!40000 ALTER TABLE `social_links` DISABLE KEYS */;
INSERT INTO `social_links` VALUES (1,'Вконтакте','fa-vk','/vk.com/123','2018-05-29 12:52:37'),(2,'Одноклассники','fa-odnoklassniki','/ok.ru/123','2018-05-29 12:53:20'),(3,'https://vk.com/club_ec','https://vk.com/club_','#','2018-08-24 11:38:14'),(4,'https://vk.com/club_ec','fa-question','https://vk.com/club_ec','2018-08-24 11:39:25');
/*!40000 ALTER TABLE `social_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `templates`
--

DROP TABLE IF EXISTS `templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT 'Новый шаблон',
  `name` varchar(64) DEFAULT NULL COMMENT 'Название файла шаблона',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `templates`
--

LOCK TABLES `templates` WRITE;
/*!40000 ALTER TABLE `templates` DISABLE KEYS */;
INSERT INTO `templates` VALUES (1,'Пустая страница','empty','2018-01-12 05:06:14'),(2,'Трёхколоночный макет страницы','three-column','2018-01-12 05:06:48'),(3,'Двухколоночный макет страницы','two-column','2018-04-25 08:18:10'),(4,'Одноколоночный макет страницы','one-column','2018-06-06 07:29:02');
/*!40000 ALTER TABLE `templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacancies`
--

DROP TABLE IF EXISTS `vacancies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacancies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(70) NOT NULL DEFAULT 'Новая вакансия',
  `text` text,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacancies`
--

LOCK TABLES `vacancies` WRITE;
/*!40000 ALTER TABLE `vacancies` DISABLE KEYS */;
INSERT INTO `vacancies` VALUES (1,'Администратор сайта','<p>&nbsp;</p>\n\n<p>Требуется ответственный и целеустремленный администратор для наполнения данного сайта.</p>\n\n<p>&nbsp;</p>\n\n<p>Требования: грамотность, умение писать тексты, уверенный пользователь ПК, начальное знание языков HTML, CSS, JS</p>\n\n<p>&nbsp;</p>\n\n<p>Условия: пятидневная рабочая неделя, официальная заработная плата</p>',1,'2018-09-19 05:18:54');
/*!40000 ALTER TABLE `vacancies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `views` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `visit_id` int(10) unsigned NOT NULL COMMENT 'Идентификатор визита',
  `visitor_id` int(10) unsigned DEFAULT NULL,
  `path` varchar(155) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `activated` timestamp NULL DEFAULT NULL,
  `closed` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
INSERT INTO `views` VALUES (1,54,54,'/','2018-09-20 12:12:00',NULL,NULL,NULL),(2,54,54,'/company','2018-09-20 12:12:02',NULL,NULL,NULL),(3,54,54,'/store','2018-09-20 12:12:03',NULL,NULL,NULL),(4,54,54,'/rituals','2018-09-20 12:12:04',NULL,NULL,NULL),(5,54,54,'/','2018-09-20 12:12:06',NULL,NULL,NULL),(6,54,54,'/','2018-09-20 12:12:11',NULL,NULL,NULL),(7,54,54,'/','2018-09-20 12:12:12',NULL,NULL,NULL),(8,54,54,'/posts','2018-09-20 14:42:13',NULL,NULL,NULL),(9,54,54,'/posts','2018-09-20 14:42:20',NULL,NULL,NULL),(10,54,54,'/posts','2018-09-20 14:42:23',NULL,NULL,NULL),(11,54,54,'/posts','2018-09-20 14:42:26',NULL,NULL,NULL),(12,54,54,'/posts','2018-09-20 14:42:28',NULL,NULL,NULL),(13,54,54,'/posts','2018-09-20 14:42:31',NULL,NULL,NULL),(14,54,54,'/posts','2018-09-20 14:42:32',NULL,NULL,NULL),(15,54,54,'/posts','2018-09-20 14:43:22',NULL,NULL,NULL),(16,54,54,'/posts','2018-09-20 14:43:23',NULL,NULL,NULL),(17,54,54,'/posts','2018-09-20 14:43:25',NULL,NULL,NULL),(18,54,54,'/posts','2018-09-20 14:43:28',NULL,NULL,NULL),(19,54,54,'/posts','2018-09-20 14:43:29',NULL,NULL,NULL),(20,54,54,'/reviews','2018-09-20 15:08:16',NULL,NULL,NULL),(21,54,54,'/reviews','2018-09-20 15:08:30',NULL,NULL,NULL),(22,54,54,'/reviews','2018-09-20 15:08:34',NULL,NULL,NULL),(23,54,54,'/honors','2018-09-20 15:09:23',NULL,NULL,NULL),(24,54,54,'/honors','2018-09-20 15:09:24',NULL,NULL,NULL),(25,54,54,'/reviews','2018-09-20 15:09:24',NULL,NULL,NULL),(26,54,54,'/reviews','2018-09-20 15:09:26',NULL,NULL,NULL),(27,54,54,'/reviews','2018-09-20 15:09:28',NULL,NULL,NULL),(28,54,54,'/reviews','2018-09-20 15:09:30',NULL,NULL,NULL),(29,54,54,'/honors','2018-09-20 15:09:31',NULL,NULL,NULL),(30,54,54,'/faq','2018-09-20 15:09:34',NULL,NULL,NULL),(31,54,54,'/faq','2018-09-20 15:09:36',NULL,NULL,NULL),(32,54,54,'/faq','2018-09-20 15:09:39',NULL,NULL,NULL),(33,54,54,'/faq','2018-09-20 15:09:40',NULL,NULL,NULL),(34,54,54,'/vacancies','2018-09-20 15:10:28',NULL,NULL,NULL),(35,54,54,'/vacancies','2018-09-20 15:10:32',NULL,NULL,NULL),(36,54,54,'/vacancies','2018-09-20 15:10:33',NULL,NULL,NULL),(37,54,54,'/feedback','2018-09-20 15:10:34',NULL,NULL,NULL),(38,54,54,'/feedback','2018-09-20 15:10:36',NULL,NULL,NULL),(39,54,54,'/feedback','2018-09-20 15:10:37',NULL,NULL,NULL),(40,54,54,'/posts','2018-09-20 15:10:39',NULL,NULL,NULL),(41,54,54,'/shops-list','2018-09-20 15:10:40',NULL,NULL,NULL),(42,54,54,'/polytics','2018-09-20 15:10:43',NULL,NULL,NULL),(43,54,54,'/history','2018-09-20 15:10:45',NULL,NULL,NULL),(44,54,54,'/shops-list','2018-09-20 15:10:48',NULL,NULL,NULL),(45,54,54,'/shops-list','2018-09-20 15:12:47',NULL,NULL,NULL),(46,54,54,'/shops-list','2018-09-20 15:12:50',NULL,NULL,NULL),(47,54,54,'/shops-list','2018-09-20 15:22:59',NULL,NULL,NULL),(48,54,54,'/shops-list','2018-09-20 15:30:53',NULL,NULL,NULL),(49,54,54,'/favicon.ico','2018-09-20 15:31:24',NULL,NULL,NULL),(50,54,54,'/shops-list','2018-09-20 15:32:49',NULL,NULL,NULL),(51,54,54,'/shops-list','2018-09-20 15:32:55',NULL,NULL,NULL),(52,54,54,'/shops-list','2018-09-20 15:33:57',NULL,NULL,NULL),(53,54,54,'/shops-list','2018-09-20 15:34:29',NULL,NULL,NULL),(54,54,54,'/shops-list','2018-09-20 15:34:45',NULL,NULL,NULL),(55,54,54,'/shops-list','2018-09-20 15:36:18',NULL,NULL,NULL),(56,54,54,'/shops-list','2018-09-20 15:36:32',NULL,NULL,NULL),(57,54,54,'/shops-list','2018-09-20 15:37:53',NULL,NULL,NULL),(58,54,54,'/shops-list','2018-09-20 15:42:16',NULL,NULL,NULL),(59,54,54,'/shops-list','2018-09-20 15:45:58',NULL,NULL,NULL),(60,54,54,'/shops-list','2018-09-20 15:46:15',NULL,NULL,NULL),(61,54,54,'/shops-list','2018-09-20 15:46:24',NULL,NULL,NULL),(62,54,54,'/shops-list','2018-09-20 15:46:52',NULL,NULL,NULL),(63,54,54,'/polytics','2018-09-20 15:47:06',NULL,NULL,NULL),(64,54,54,'/history','2018-09-20 15:47:07',NULL,NULL,NULL),(65,54,54,'/shops-list','2018-09-20 15:47:09',NULL,NULL,NULL),(66,54,54,'/posts','2018-09-20 15:47:10',NULL,NULL,NULL),(67,54,54,'/reviews','2018-09-20 15:47:11',NULL,NULL,NULL),(68,54,54,'/shops-list','2018-09-20 15:47:12',NULL,NULL,NULL),(69,54,54,'/shops-list','2018-09-20 15:47:58',NULL,NULL,NULL),(70,54,54,'/shops-list','2018-09-20 15:48:23',NULL,NULL,NULL),(71,54,54,'/shops-list','2018-09-20 15:50:16',NULL,NULL,NULL),(72,54,54,'/shops-list','2018-09-20 15:50:50',NULL,NULL,NULL),(73,54,54,'/shops-list','2018-09-20 15:51:41',NULL,NULL,NULL),(74,54,54,'/shops-list','2018-09-20 15:54:17',NULL,NULL,NULL),(75,54,54,'/shops-list','2018-09-20 15:54:34',NULL,NULL,NULL),(76,54,54,'/shops-list','2018-09-20 15:54:44',NULL,NULL,NULL),(77,54,54,'/shops-list','2018-09-20 15:55:01',NULL,NULL,NULL),(78,54,54,'/shops-list','2018-09-20 15:55:21',NULL,NULL,NULL),(79,54,54,'/shops-list','2018-09-20 15:55:27',NULL,NULL,NULL),(80,54,54,'/shop-page/1','2018-09-20 15:56:57',NULL,NULL,NULL),(81,54,54,'/shops-list','2018-09-20 16:01:48',NULL,NULL,NULL),(82,54,54,'/shops-list','2018-09-20 16:01:52',NULL,NULL,NULL),(83,54,54,'/shop-page/1','2018-09-20 16:01:57',NULL,NULL,NULL),(84,54,54,'/shop-page/1','2018-09-20 16:07:52',NULL,NULL,NULL),(85,54,54,'/shop-page/1','2018-09-20 16:09:04',NULL,NULL,NULL),(86,54,54,'/shop-page/1','2018-09-20 16:09:05',NULL,NULL,NULL),(87,54,54,'/shop-page/1','2018-09-20 16:09:12',NULL,NULL,NULL),(88,54,54,'/shop-page/1','2018-09-20 16:09:31',NULL,NULL,NULL),(89,54,54,'/shop-page/1','2018-09-20 16:10:40',NULL,NULL,NULL),(90,54,54,'/shop-page/1','2018-09-20 16:11:52',NULL,NULL,NULL),(91,54,54,'/shop-page/1','2018-09-20 16:11:53',NULL,NULL,NULL),(92,54,54,'/shop-page/1','2018-09-20 16:12:01',NULL,NULL,NULL),(93,54,54,'/shop-page/1','2018-09-20 16:12:02',NULL,NULL,NULL),(94,54,54,'/shop-page/1','2018-09-20 16:12:42',NULL,NULL,NULL),(95,54,54,'/posts','2018-09-20 16:13:24',NULL,NULL,NULL),(96,54,54,'/reviews','2018-09-20 16:13:25',NULL,NULL,NULL),(97,54,54,'/shops-list','2018-09-20 16:13:27',NULL,NULL,NULL),(98,54,54,'/shop-page/2','2018-09-20 16:15:50',NULL,NULL,NULL),(99,54,54,'/shop-page/2','2018-09-20 16:15:54',NULL,NULL,NULL),(100,54,54,'/shop-page/2','2018-09-20 16:16:01',NULL,NULL,NULL),(101,54,54,'/shop-page/2','2018-09-20 16:17:23',NULL,NULL,NULL),(102,54,54,'/shops-list','2018-09-20 16:17:29',NULL,NULL,NULL),(103,54,54,'/shop-page/1','2018-09-20 16:17:33',NULL,NULL,NULL),(104,54,54,'/shop-page/1','2018-09-20 16:17:35',NULL,NULL,NULL),(105,54,54,'/shop-page/1','2018-09-20 16:17:56',NULL,NULL,NULL),(106,54,54,'/shops-list','2018-09-20 16:17:58',NULL,NULL,NULL),(107,54,54,'/shop-page/3','2018-09-20 16:18:01',NULL,NULL,NULL),(108,54,54,'/shop-page/3','2018-09-20 16:18:04',NULL,NULL,NULL),(109,54,54,'/shop-page/3','2018-09-20 16:19:24',NULL,NULL,NULL),(110,54,54,'/shop-page/3','2018-09-20 16:19:29',NULL,NULL,NULL),(111,54,54,'/shop-page/3','2018-09-20 16:20:42',NULL,NULL,NULL),(112,54,54,'/shop-page/3','2018-09-20 16:20:44',NULL,NULL,NULL),(113,54,54,'/shop-page/3','2018-09-20 16:20:49',NULL,NULL,NULL),(114,54,54,'/shop-page/3','2018-09-20 16:20:52',NULL,NULL,NULL),(115,54,54,'/shop-page/3','2018-09-20 16:23:13',NULL,NULL,NULL),(116,54,54,'/shop-page/3','2018-09-20 16:23:17',NULL,NULL,NULL),(117,54,54,'/shop-page/3','2018-09-20 16:23:19',NULL,NULL,NULL),(118,54,54,'/shop-page/3','2018-09-20 16:24:35',NULL,NULL,NULL),(119,54,54,'/shop-page/3','2018-09-20 16:24:41',NULL,NULL,NULL),(120,54,54,'/shop-page/3','2018-09-20 16:24:46',NULL,NULL,NULL),(121,54,54,'/shop-page/3','2018-09-20 16:24:50',NULL,NULL,NULL),(122,54,54,'/shops-list','2018-09-20 16:24:53',NULL,NULL,NULL),(123,54,54,'/shops-list','2018-09-20 16:25:21',NULL,NULL,NULL),(124,54,54,'/shops-list','2018-09-20 16:25:32',NULL,NULL,NULL),(125,54,54,'/shop-page/3','2018-09-20 16:25:47',NULL,NULL,NULL),(126,54,54,'/shops-list','2018-09-20 16:25:51',NULL,NULL,NULL),(127,54,54,'/history','2018-09-20 16:26:06',NULL,NULL,NULL),(128,54,54,'/polytics','2018-09-20 16:26:07',NULL,NULL,NULL),(129,54,54,'/shops-list','2018-09-20 16:26:08',NULL,NULL,NULL),(130,54,54,'/posts','2018-09-20 16:26:09',NULL,NULL,NULL),(131,54,54,'/reviews','2018-09-20 16:26:11',NULL,NULL,NULL),(132,54,54,'/honors','2018-09-20 16:26:12',NULL,NULL,NULL),(133,54,54,'/faq','2018-09-20 16:26:14',NULL,NULL,NULL),(134,54,54,'/vacancies','2018-09-20 16:26:15',NULL,NULL,NULL),(135,54,54,'/feedback','2018-09-20 16:26:17',NULL,NULL,NULL),(136,54,54,'/vacancies','2018-09-20 16:26:20',NULL,NULL,NULL),(137,54,54,'/faq','2018-09-20 16:26:21',NULL,NULL,NULL),(138,54,54,'/honors','2018-09-20 16:26:22',NULL,NULL,NULL),(139,54,54,'/reviews','2018-09-20 16:26:24',NULL,NULL,NULL),(140,54,54,'/posts','2018-09-20 16:26:26',NULL,NULL,NULL),(141,54,54,'/reviews','2018-09-20 16:26:34',NULL,NULL,NULL),(142,54,54,'/honors','2018-09-20 16:26:35',NULL,NULL,NULL),(143,54,54,'/reviews','2018-09-20 16:26:36',NULL,NULL,NULL),(144,54,54,'/reviews','2018-09-20 16:26:49',NULL,NULL,NULL),(145,54,54,'/reviews','2018-09-20 16:26:51',NULL,NULL,NULL),(146,54,54,'/reviews','2018-09-20 16:27:07',NULL,NULL,NULL),(147,54,54,'/reviews','2018-09-20 16:27:10',NULL,NULL,NULL),(148,54,54,'/honors','2018-09-20 16:27:15',NULL,NULL,NULL),(149,54,54,'/faq','2018-09-20 16:27:15',NULL,NULL,NULL),(150,54,54,'/vacancies','2018-09-20 16:27:16',NULL,NULL,NULL),(151,54,54,'/feedback','2018-09-20 16:27:17',NULL,NULL,NULL),(152,54,54,'/history','2018-09-20 16:27:19',NULL,NULL,NULL),(153,54,54,'/polytics','2018-09-20 16:27:20',NULL,NULL,NULL),(154,54,54,'/shops-list','2018-09-20 16:27:21',NULL,NULL,NULL),(155,54,54,'/posts','2018-09-20 16:27:21',NULL,NULL,NULL),(156,54,54,'/reviews','2018-09-20 16:27:22',NULL,NULL,NULL),(157,54,54,'/honors','2018-09-20 16:27:23',NULL,NULL,NULL),(158,54,54,'/faq','2018-09-20 16:27:24',NULL,NULL,NULL),(159,54,54,'/vacancies','2018-09-20 16:27:25',NULL,NULL,NULL),(160,54,54,'/company','2018-09-20 16:27:26',NULL,NULL,NULL),(161,54,54,'/store','2018-09-20 16:27:27',NULL,NULL,NULL),(162,54,54,'/shops-list','2018-09-20 16:27:45',NULL,NULL,NULL);
/*!40000 ALTER TABLE `views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visited_graves`
--

DROP TABLE IF EXISTS `visited_graves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visited_graves` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `grave_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Посещаемые захоронения';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visited_graves`
--

LOCK TABLES `visited_graves` WRITE;
/*!40000 ALTER TABLE `visited_graves` DISABLE KEYS */;
INSERT INTO `visited_graves` VALUES (1,8,100000,'2018-05-22 10:18:29');
/*!40000 ALTER TABLE `visited_graves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
/*!40000 ALTER TABLE `visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` int(10) unsigned NOT NULL COMMENT 'Идентификатор визита',
  `count_views` int(11) NOT NULL DEFAULT '0',
  `visitor_ip` varchar(55) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `closed` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `works`
--

DROP TABLE IF EXISTS `works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `works` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT 'Работа 1',
  `text` text,
  `publicate` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `works`
--

LOCK TABLES `works` WRITE;
/*!40000 ALTER TABLE `works` DISABLE KEYS */;
/*!40000 ALTER TABLE `works` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-20 21:28:47
