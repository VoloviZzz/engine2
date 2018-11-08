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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `components`
--

LOCK TABLES `components` WRITE;
/*!40000 ALTER TABLE `components` DISABLE KEYS */;
INSERT INTO `components` VALUES (1,'Управление маршрутами','routes-list',2,0,0,NULL,NULL,NULL,'2018-01-10 08:58:25'),(2,'Статический контент',NULL,NULL,1,0,NULL,NULL,'{\"body\": \"\"}','2018-01-10 09:22:25'),(3,'Главный слайдер','main-slider',2,0,1,NULL,NULL,'{\"slides\":[], \"lastId\": 0}','2018-01-10 12:17:53'),(4,'Страница авторизации','login-page',NULL,0,1,NULL,NULL,NULL,'2018-01-15 07:19:51'),(5,'Отображение новости','news-id',2,0,0,NULL,NULL,NULL,'2018-01-24 06:34:23'),(6,'Список новостей','news-list',2,0,0,NULL,NULL,NULL,'2018-01-24 08:34:58'),(7,'Управление клиентами','clients-manage',2,0,0,NULL,NULL,NULL,'2018-01-25 07:28:54'),(8,'Пустой блок',NULL,NULL,1,0,NULL,NULL,'{\"body\": \"\"}','2018-01-26 07:34:57'),(9,'Объявления краткий список','announcements-short-list',3,0,0,NULL,NULL,NULL,'2018-01-26 08:00:33'),(10,'Слайдер для магазина','shop-slider',2,0,1,NULL,NULL,'{\"slides\":[], \"lastId\": 0}','2018-01-29 06:52:55'),(11,'Отображение товаров по категории','goods-list',2,0,0,'\r\n',NULL,NULL,'2018-01-29 09:29:22'),(12,'Навигация для магазина','shop-menu',1,0,0,NULL,NULL,NULL,'2018-01-29 10:15:26'),(13,'Общая навигация','general-menu',1,0,0,NULL,NULL,NULL,'2018-01-29 10:37:05'),(14,'отображение товара','goods-view',2,0,0,NULL,NULL,NULL,'2018-01-31 06:32:44'),(15,'Корзина пользователя','shop-cart',2,0,0,NULL,NULL,NULL,'2018-02-01 08:19:52'),(16,'Оформление заказа','go-order',2,0,0,NULL,NULL,NULL,'2018-02-01 11:20:25'),(17,'Управление компонентами','components-manage',2,0,0,NULL,NULL,NULL,'2018-02-05 17:43:42'),(18,'Личный кабинет','my-cabinet',2,0,0,NULL,NULL,NULL,'2018-02-07 06:47:14'),(19,'Успешный заказ','order-complete',2,0,0,NULL,NULL,NULL,'2018-02-07 08:39:42'),(20,'Управление переменными сайта','global-variables',2,0,0,NULL,NULL,NULL,'2018-02-07 11:33:46'),(21,'Список моих заказов','my-orders',2,0,0,NULL,NULL,NULL,'2018-02-08 07:35:41'),(22,'Отзывы','reviews-list',2,0,0,NULL,NULL,NULL,'2018-02-08 10:29:38'),(23,'Вопрос-ответ','questions-list',2,0,0,NULL,NULL,NULL,'2018-02-12 06:49:18'),(24,'Список заказов','orders-list',2,0,0,NULL,NULL,NULL,'2018-02-13 08:01:50'),(25,'Отображение заказа','orders-view',2,0,0,NULL,NULL,NULL,'2018-02-13 09:31:15'),(26,'Список документов','documents-list',2,0,0,NULL,NULL,NULL,'2018-02-14 10:09:47'),(27,'Отображение документа','document-view',2,0,0,NULL,NULL,NULL,'2018-02-14 10:53:57'),(28,'Список магазинов','shops-list',2,0,0,NULL,NULL,NULL,'2018-02-18 11:48:26'),(29,'Отображение магазина','shops-view',2,0,0,NULL,NULL,NULL,'2018-02-18 12:26:29'),(30,'Список вакансий','vacancies-list',2,0,0,NULL,NULL,NULL,'2018-02-19 00:08:07'),(31,'Отображение вакансии','vacancies-view',2,0,0,NULL,NULL,NULL,'2018-02-19 00:20:51'),(32,'Заголовок страницы','page-title',NULL,0,0,NULL,NULL,'{\"body\": \"\"}','2018-03-10 14:27:06'),(33,'Отображение посещаемости','attendance-view',2,0,0,NULL,NULL,NULL,'2018-03-10 15:09:21'),(34,'Список достижений','achievements-list',2,0,0,NULL,NULL,NULL,'2018-04-25 08:18:10'),(35,'Список обратных звонков','callbacks-list',2,0,0,NULL,NULL,NULL,'2018-04-25 08:18:10'),(36,'Форма обратного звонка','callback-form',2,0,0,NULL,NULL,NULL,'2018-04-25 08:18:10'),(37,'Наши партнёры','partners-list',2,0,0,NULL,NULL,NULL,'2018-04-25 08:18:11'),(38,'\"Исходный код\"','source-code',NULL,0,0,NULL,NULL,NULL,'2018-04-25 08:18:11'),(39,'Наши работы','works-list',2,0,0,NULL,NULL,NULL,'2018-04-25 08:18:11'),(40,'Поиск захоронений','search-deads',NULL,0,0,NULL,NULL,NULL,'2018-05-14 14:57:27'),(41,'Список постов','posts-list',2,0,0,NULL,NULL,NULL,'2018-05-17 05:13:49'),(42,'Отображение поста','post-view',2,0,0,NULL,NULL,NULL,'2018-05-17 05:13:50'),(49,'Страница участка','place-view',NULL,0,0,NULL,NULL,NULL,'2018-05-22 10:05:33'),(50,'Страница захоронения','dead-view',NULL,0,0,NULL,NULL,NULL,'2018-05-22 10:05:33'),(51,'Книга памяти','memory-book',NULL,0,0,NULL,NULL,NULL,'2018-05-22 10:05:33'),(52,'Список ошибок','report-error-list',2,0,0,NULL,NULL,NULL,'2018-05-22 12:04:32'),(53,'Список посещаемых захоронений','my-visited-graves',2,0,0,NULL,NULL,NULL,'2018-05-22 12:04:41'),(54,'Список ошибок','report-error-list',2,0,0,NULL,NULL,NULL,'2018-05-31 03:54:01'),(55,'Список посещаемых захоронений','my-visited-graves',2,0,0,NULL,NULL,NULL,'2018-05-31 03:54:01'),(56,'Контакты','contacts',2,0,0,NULL,NULL,NULL,'2018-06-06 06:52:35'),(57,'Форма обратной связи','feedback-form',2,0,0,NULL,NULL,NULL,'2018-06-07 09:57:56'),(58,'Список сообщений обратной связи','feedback-list',2,0,0,NULL,NULL,NULL,'2018-06-07 09:58:07'),(59,'Список агентов','agents-list',2,0,0,NULL,NULL,NULL,'2018-06-16 13:22:13'),(60,'Админка книги памяти','memory-book-admin',2,0,0,NULL,NULL,NULL,'2018-07-11 06:23:13'),(61,'Отображение Агента','agents-view',2,0,0,NULL,NULL,NULL,'2018-07-11 06:24:15'),(62,'Управление магазином','crm-admin',2,0,0,NULL,NULL,NULL,'2018-08-08 11:35:49'),(63,'Форма вызова агента','agent-call-form',2,0,0,NULL,NULL,NULL,'2018-08-21 16:58:36'),(64,'Слайдер','slider',NULL,0,0,NULL,NULL,NULL,'2018-09-12 12:30:46'),(65,'Карта','map',2,0,0,NULL,NULL,NULL,'2018-09-12 12:31:49'),(66,'Установка мета-тегов','meta-manage',2,0,0,NULL,NULL,NULL,'2018-09-12 12:31:55'),(67,'Список категорий магазина','store-cats-list',2,0,0,NULL,NULL,NULL,'2018-09-19 08:55:09'),(68,'Поиск товаров по магазину','store-goods-search',2,0,0,NULL,NULL,NULL,'2018-09-19 10:44:39'),(69,'Случайные позиции','store-rand-pos',NULL,0,0,NULL,NULL,NULL,'2018-09-19 12:55:19'),(70,'История таймлайн','history',NULL,0,0,NULL,NULL,NULL,'2018-09-27 13:11:05'),(71,'Управление СМС модулем','admin-sms',2,0,0,NULL,NULL,NULL,'2018-10-17 08:56:16');
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
  `code` varchar(6) NOT NULL,
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
INSERT INTO `confirmed_phones` VALUES (1,9,'+7(918)-712-34-32','624001',0,'2018-06-10 09:53:03'),(2,10,'+7(919)-124-06-11','763859',1,'2018-06-10 09:54:19'),(3,11,'+7(919)-124-06-11','737400',1,'2018-08-24 04:30:56');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connected_crm`
--

LOCK TABLES `connected_crm` WRITE;
/*!40000 ALTER TABLE `connected_crm` DISABLE KEYS */;
INSERT INTO `connected_crm` VALUES (4,'Розница',NULL,'retail',80,'b217ad1ba62609fe1a1e724649218117',2,0,'2018-10-03 10:17:17');
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
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fragments`
--

LOCK TABLES `fragments` WRITE;
/*!40000 ALTER TABLE `fragments` DISABLE KEYS */;
INSERT INTO `fragments` VALUES (2,4,61,2,NULL,1,1,'2018-03-19 11:06:56'),(4,13,40,1,NULL,1,1,'2018-03-26 13:39:12'),(5,13,70,1,NULL,1,1,'2018-03-26 13:41:54'),(6,13,49,1,NULL,1,1,'2018-03-26 13:45:20'),(7,13,50,1,NULL,1,1,'2018-03-26 13:45:37'),(8,13,51,1,NULL,1,1,'2018-03-26 13:45:49'),(9,13,67,1,NULL,1,1,'2018-03-26 13:46:01'),(10,1,49,2,NULL,1,1,'2018-03-26 13:46:49'),(11,7,50,2,NULL,1,1,'2018-03-26 13:47:01'),(12,33,51,2,NULL,1,1,'2018-03-26 13:48:01'),(14,17,67,2,NULL,1,1,'2018-03-26 13:48:58'),(15,20,70,2,NULL,1,1,'2018-03-26 14:00:56'),(19,5,86,2,NULL,1,1,'2018-04-02 11:12:42'),(22,41,87,2,'{\"target\":\"3\",\"url\":\"/post\",\"showPagination\":\"1\"}',1,1,'2018-05-17 05:19:58'),(23,42,88,2,'{\"listUrl\":\"/posts\"}',1,1,'2018-05-17 05:23:57'),(24,13,87,1,NULL,1,1,'2018-05-17 05:25:35'),(25,13,89,1,NULL,1,1,'2018-05-22 09:54:53'),(26,2,89,2,NULL,1,1,'2018-05-22 09:57:07'),(27,13,90,1,NULL,1,1,'2018-05-22 10:01:02'),(29,40,90,2,NULL,1,1,'2018-05-22 10:01:24'),(30,13,91,1,NULL,1,1,'2018-05-22 10:11:34'),(31,51,91,2,NULL,1,1,'2018-05-22 10:11:48'),(32,49,92,2,NULL,1,1,'2018-05-22 10:14:09'),(33,13,92,1,NULL,1,1,'2018-05-22 10:14:22'),(34,13,93,1,NULL,1,1,'2018-05-22 10:14:57'),(35,50,93,2,NULL,1,1,'2018-05-22 10:15:06'),(36,18,94,2,NULL,1,1,'2018-05-22 10:19:09'),(37,13,94,1,NULL,1,1,'2018-05-22 10:19:28'),(38,56,89,2,NULL,1,1,'2018-06-06 06:53:22'),(41,13,95,1,NULL,1,1,'2018-06-07 10:02:08'),(42,58,95,2,NULL,1,1,'2018-06-07 10:02:18'),(43,13,84,1,NULL,1,1,'2018-06-07 10:04:35'),(44,13,96,1,NULL,1,1,'2018-06-08 11:21:25'),(45,28,96,2,NULL,1,1,'2018-06-08 11:21:32'),(46,13,99,1,NULL,1,1,'2018-06-08 11:24:30'),(47,29,99,2,NULL,1,1,'2018-06-08 11:24:41'),(48,2,100,2,NULL,1,1,'2018-06-15 13:47:42'),(49,13,101,1,NULL,1,1,'2018-06-19 13:17:57'),(50,59,101,2,'{\"url\":\"/agent\"}',1,1,'2018-06-19 13:18:35'),(53,57,103,2,'{\"onlyRegistred\":\"0\",\"showClientFrom\":\"0\",\"category\":\"Форма на странице обратной связи\",\"title\":\" \"}',1,1,'2018-08-08 11:41:00'),(54,13,103,1,NULL,1,1,'2018-08-08 11:41:09'),(55,13,104,1,NULL,1,1,'2018-08-21 14:09:55'),(56,13,105,1,NULL,1,1,'2018-08-21 15:45:51'),(57,13,106,1,NULL,1,1,'2018-08-21 16:11:49'),(59,13,107,1,NULL,0,1,'2018-08-21 16:14:13'),(60,13,108,1,NULL,1,1,'2018-08-21 16:20:51'),(61,23,108,2,'{\"target\":\"1\"}',1,1,'2018-08-21 16:22:10'),(62,13,109,1,NULL,1,1,'2018-08-21 16:26:45'),(64,38,109,2,NULL,1,1,'2018-08-21 16:36:14'),(65,2,109,2,NULL,1,1,'2018-08-21 16:36:49'),(66,63,109,2,'{\"target\":\"2\"}',1,1,'2018-08-21 16:44:21'),(67,41,109,2,'{\"target\":\"2\",\"url\":\"/agent_old\"}',1,1,'2018-08-21 17:11:45'),(68,13,110,1,NULL,1,1,'2018-08-22 04:52:33'),(69,42,110,2,'{\"listUrl\":\"/agents_old\"}',1,1,'2018-08-22 04:53:23'),(78,13,112,1,NULL,1,1,'2018-08-24 02:39:51'),(79,2,112,2,NULL,0,1,'2018-08-24 02:40:10'),(81,9,96,3,NULL,1,1,'2018-08-24 11:42:19'),(82,32,112,1,NULL,1,1,'2018-08-24 11:45:36'),(91,13,113,1,NULL,1,1,'2018-08-27 05:14:00'),(97,10,114,2,NULL,0,1,'2018-08-27 05:45:58'),(98,41,85,2,'{\"target\":\"3\",\"url\":\"/new\"}',1,1,'2018-08-27 06:08:15'),(99,42,115,2,NULL,1,1,'2018-08-27 06:18:54'),(100,2,85,2,NULL,1,1,'2018-08-27 06:23:31'),(101,57,85,2,'{\"category\":\"Предложения новостей\",\"onlyRegistred\":\"0\",\"showClientFrom\":\"1\"}',1,1,'2018-08-27 06:24:50'),(104,22,84,2,'{\"onlyRegister\":\"0\",\"targetType\":\"1\"}',1,1,'2018-08-28 10:24:21'),(109,8,104,2,NULL,0,1,'2018-09-06 11:12:00'),(113,64,32,2,'{\"slidesToShow\":\"1\",\"slidesToScroll\":\"1\"}',1,1,'2018-09-18 09:56:35'),(114,64,32,2,'{\"slidesToScroll\":\"1\"}',1,1,'2018-09-18 09:57:23'),(115,38,32,2,NULL,1,10,'2018-09-18 10:16:25'),(116,2,32,2,NULL,1,1,'2018-09-18 10:20:02'),(117,38,32,2,NULL,1,1,'2018-09-18 10:47:36'),(118,34,106,2,NULL,1,1,'2018-09-18 11:31:42'),(119,13,116,1,NULL,1,1,'2018-09-19 04:33:15'),(120,13,100,1,NULL,1,1,'2018-09-19 04:34:35'),(122,13,117,1,NULL,1,1,'2018-09-19 05:18:23'),(124,8,49,2,NULL,0,1,'2018-09-19 05:20:51'),(125,13,118,1,NULL,1,1,'2018-09-19 05:22:06'),(126,31,118,2,NULL,1,1,'2018-09-19 05:23:09'),(127,2,103,2,NULL,1,10,'2018-09-19 07:55:03'),(128,2,117,2,NULL,1,10,'2018-09-19 08:20:01'),(129,2,117,2,NULL,1,9,'2018-09-19 08:28:53'),(130,67,102,2,NULL,1,1,'2018-09-19 08:50:38'),(131,68,102,2,NULL,1,10,'2018-09-19 10:48:28'),(133,69,102,2,NULL,1,1,'2018-09-19 13:12:48'),(134,12,119,1,NULL,1,1,'2018-09-20 06:17:00'),(135,11,119,2,NULL,1,1,'2018-09-20 06:17:18'),(136,13,120,1,NULL,1,1,'2018-09-20 09:45:07'),(137,2,120,2,NULL,1,1,'2018-09-20 09:46:59'),(138,13,123,1,NULL,1,1,'2018-09-20 09:48:42'),(139,13,124,1,NULL,1,1,'2018-09-20 09:48:58'),(140,9,116,3,NULL,1,1,'2018-09-20 17:44:16'),(141,9,100,3,NULL,1,1,'2018-09-20 17:44:58'),(142,9,99,3,NULL,1,1,'2018-09-20 17:47:13'),(143,9,87,3,NULL,1,1,'2018-09-20 17:47:32'),(144,9,84,3,NULL,1,1,'2018-09-20 17:49:52'),(145,9,106,3,NULL,1,1,'2018-09-20 17:50:21'),(146,9,108,3,NULL,1,1,'2018-09-20 17:50:31'),(147,9,117,3,NULL,1,1,'2018-09-20 17:50:52'),(148,9,119,3,NULL,1,1,'2018-09-20 17:51:11'),(149,9,105,3,NULL,1,1,'2018-09-20 17:51:43'),(150,2,105,2,NULL,1,1,'2018-09-20 17:51:59'),(151,9,124,3,NULL,1,1,'2018-09-20 17:53:34'),(152,9,120,3,NULL,1,1,'2018-09-20 17:56:26'),(153,12,125,1,NULL,1,1,'2018-09-21 09:42:25'),(154,14,125,2,NULL,1,1,'2018-09-21 09:42:36'),(155,9,125,3,NULL,1,1,'2018-09-21 09:42:47'),(156,70,116,2,NULL,1,10,'2018-09-27 13:06:37'),(157,62,126,2,NULL,1,1,'2018-09-28 04:44:28'),(159,15,127,2,NULL,1,1,'2018-10-08 13:37:05'),(160,13,127,1,NULL,1,1,'2018-10-08 13:38:56'),(161,9,127,3,NULL,1,1,'2018-10-08 13:41:29'),(162,13,128,1,NULL,1,1,'2018-10-08 13:56:55'),(163,16,128,2,NULL,1,1,'2018-10-08 13:57:03'),(164,9,128,3,NULL,1,1,'2018-10-08 13:57:22'),(165,13,129,1,NULL,1,1,'2018-10-08 15:22:44'),(166,19,129,2,NULL,1,1,'2018-10-08 15:22:56'),(167,9,129,3,NULL,1,1,'2018-10-08 15:23:09'),(168,13,88,1,NULL,1,1,'2018-10-09 09:02:02'),(170,30,117,2,NULL,1,1,'2018-10-09 10:57:20'),(172,2,40,2,NULL,1,1,'2018-10-09 16:11:32'),(173,66,125,2,NULL,1,11,'2018-10-17 09:52:39'),(174,66,88,2,NULL,1,11,'2018-10-22 05:53:16'),(175,2,124,2,NULL,1,1,'2018-10-22 09:45:02');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fragments_blocks`
--

LOCK TABLES `fragments_blocks` WRITE;
/*!40000 ALTER TABLE `fragments_blocks` DISABLE KEYS */;
INSERT INTO `fragments_blocks` VALUES (1,'Навигация','2018-01-26 07:24:36'),(2,'Контент','2018-01-26 07:24:43'),(3,'Информативный','2018-01-26 07:24:48');
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fragments_data`
--

LOCK TABLES `fragments_data` WRITE;
/*!40000 ALTER TABLE `fragments_data` DISABLE KEYS */;
INSERT INTO `fragments_data` VALUES (3,NULL,26,'{\"content\":{\"body\":\"<h1 style=\\\"text-align:center;\\\">Выберите пункт меню слева</h1>\\n\"}}','2018-05-22 09:57:16'),(4,NULL,48,'{\"content\":{\"body\":\"<p>&nbsp;</p>\\n\\n<p>Политика компании - это основные этические ориентиры в её повседневной деятельности. Какие ценности в компании приняты, какова её позиция по отношению к обществу, каких нравственных&nbsp;целей она хочет достичь, какими путями будет выполняться миссия - на всё эти вопросы отвечает раздел &laquo;Политика&raquo;.</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>Нужна ли политика компании на сайте? На этот вопрос нет однозначного ответа. Конечно же это решение в первую очередь принимается руководством. Публикуя свою политику компания становится более открытой по отношению к обществу и своим клиентам. В современном информационном мире, когда все друг друга знают и видят, эта позиция достаточно распространена.</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>Ну и ещё когда всякие копирайтеры будут писать статьи о компании на разных сторонних ресурсах, то они смогут брать текст из этого раздела, а не выдумывать всякие сложные и непонятные тексты.</p>\\n\"}}','2018-06-15 13:47:51'),(5,NULL,64,'{\"content\":{\"value\":\"<style>\\n    .cards__img-wrapp {\\n        max-height:400px;\\n        height:400px;\\n    }\\n    \\n    @media (min-width: 992px) and (max-width: 1366px) {\\n        .cards__img-wrapp {\\n            max-height:450px;\\n            height:450px;\\n        }\\n    }\\n    \\n    @media (min-width: 425px) and (max-width: 991px) {\\n        .cards__img-wrapp {\\n            max-height:500px;\\n            height:500px;\\n        }\\n    }\\n</style>\"}}','2018-08-21 16:36:23'),(6,NULL,65,'{\"content\":{\"value\":\"<h1 class=\\\"text-center\\\">test of fragment move</h1>\",\"body\":\"<p><span style=\\\"font-size:16px;\\\"><span style=\\\"font-family:Verdana,Geneva,sans-serif;\\\">Похоронный агент &ndash; это человек, который занимается организацией похорон под ключ. Здесь Вы можете ознакомиться со списком ритуальных агентов, работающих в МП КПРУ. </span></span></p>\\n\\n<p><span style=\\\"font-size:16px;\\\"><span style=\\\"font-family:Verdana,Geneva,sans-serif;\\\">Чтобы совершить <strong>вызов похоронного агента</strong>, в</span></span><span style=\\\"font-size:16px;\\\"><span style=\\\"font-family:Verdana,Geneva,sans-serif;\\\">ведите Ваш номер в строку ниже, чтобы заказать обратный звонок от агента&nbsp;или выберите понравившегося Вам ритуального агента из списка.</span></span></p>\\n\"}}','2018-08-21 16:37:17'),(9,NULL,79,'{\"content\":{\"body\":\"<p><img alt=\\\"\\\" src=\\\"/uploads/upload_85c04bdc55050de6116c2ca47ba3f99c.jpg\\\" style=\\\"width: 400px; height: 309px;\\\" /></p>\\n\"}}','2018-08-24 02:40:49'),(10,NULL,81,'{\"content\":{\"content\":\"С 18.09.2018 до 25.09.2018\"}}','2018-08-24 11:42:33'),(11,NULL,82,'{\"content\":{\"content\":\"123\"}}','2018-08-24 11:45:55'),(16,NULL,97,'{\"content\":{\"slides\":[{\"id\":1,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":2,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":3,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":4,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"}],\"lastId\":4}}','2018-08-27 05:46:04'),(17,NULL,100,'{\"content\":{\"body\":\"<p style=\\\"text-align: center;\\\"><span style=\\\"font-size:36px;\\\">Есть новости?</span></p>\\n\\n<p style=\\\"text-align: center;\\\">Предложите свою новость для публикации, используя форму ниже</p>\\n\"}}','2018-08-27 06:24:14'),(19,NULL,115,'{\"content\":{\"body\":\"<h1 style=\\\"text-align: center;\\\">&nbsp;</h1>\\n\\n<h1 style=\\\"text-align: center;\\\">Добро пожаловать</h1>\\n\",\"content\":\"Добро пожаловать на главную страницу\",\"value\":\"<div class=\\\"text-center\\\" style=\\\"padding-top:30px;\\\">\\n    <h1>Добро пожаловать</h1>\\n    <h2>Приветствуем Вас на универсальной платформе для создания сайтов</h2>    \\n</div>\\n\"}}','2018-09-18 10:17:13'),(20,NULL,115,'{\"content\":{\"body\":\"<h1 style=\\\"text-align: center;\\\">&nbsp;</h1>\\n\\n<h1 style=\\\"text-align: center;\\\">Добро пожаловать</h1>\\n\",\"content\":\"Добро пожаловать на главную страницу\",\"value\":\"<div class=\\\"text-center\\\" style=\\\"padding-top:30px;\\\">\\n    <h1>Добро пожаловать</h1>\\n    <h2>Приветствуем Вас на универсальной платформе для создания сайтов</h2>    \\n</div>\\n\"}}','2018-09-18 10:17:13'),(21,NULL,116,'{\"content\":{\"body\":\"<h1>&nbsp;</h1>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<h2 style=\\\"text-align: center;\\\">Блок статического контента</h2>\\n\\n<p>&nbsp;</p>\\n\\n<p>С помощью блока статического контента можно писать простой текст, заголовки, таблицы, колонки и многое другое.<span style=\\\"display: none;\\\">&nbsp;</span></p>\\n\\n<p>&nbsp;</p>\\n\\n<table border=\\\"0\\\" cellpadding=\\\"1\\\" cellspacing=\\\"1\\\" style=\\\"width:90%;margin:0 auto;\\\">\\n\\t<thead>\\n\\t\\t<tr>\\n\\t\\t\\t<th width=\\\"50%\\\">Левая колонка</th>\\n\\t\\t\\t<th>Правая колонка</th>\\n\\t\\t</tr>\\n\\t\\t<tr>\\n\\t\\t\\t<td>Блок статического контента позволяет вставлять в определенные места страниц произвольный контент, который может редактироваться на ходу в легком встроенном текстовом редакторе, имеющем доступ к HTML-коду редактируемого содержимого</td>\\n\\t\\t\\t<td>Имея в распоряжении блок статического контента уже можно создавать простые сайты, содержащие статическую текстовую информацию и картинки.</td>\\n\\t\\t</tr>\\n\\t</thead>\\n\\t<tbody>\\n\\t</tbody>\\n</table>\\n\\n<p>&nbsp;</p>\\n\\n<p>Расширенные возможности блока позволяют встраивать в него видео и фреймы, содержащие контент с других сайтов.</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>&nbsp;</p>\\n\"}}','2018-09-18 10:33:05'),(22,NULL,117,'{\"content\":{\"value\":\"<div style=\\\"width:100%; background: #777; padding: 30px 0; color: #fff;\\\">\\n    <div style=\\\"width:90%; margin:20px auto;\\\">\\n        <h2>Блок исходного кода</h2>\\n        <p>Блок исходного кода позволяет использовать на странице чистый HTML-код, и редактировать его с помощью удобного встроенного редактора исходного кода</p>\\n        <br />\\n        <img src=\\\"/img/components/source-code/source-code.jpg\\\" style=\\\"display:block; margin: 0 auto;\\\" />\\n    </div>\\n</div>\"}}','2018-09-18 10:47:47'),(24,NULL,127,'{\"content\":{\"body\":\"<p>&nbsp;</p>\\n\\n<p>На этой странице пользователи Вашего сайта смогут оставлять сообщения для Вас, по интересующим их вопросам. Эти сообщения можно просмотреть в разделе администрирования обратной связи, также возможно настроить их дублирование на почту.</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>Данный компонент позволяет создавать множество форм обратной связи в пределах одного проекта, для чего и служит поле категории обратной связи. Дополнительно можно включать и отключать те или иные&nbsp;поля, которые должен заполнять пользователь, и запрещать писать сообщения незарегистрированным пользователям.</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>В перспективе планируется перенести администрирование в сам компонент, запретить редактирование своих данных зарегистрированным пользователям, и&nbsp;добавить возможность разрешать редактирование этих данных на отдельных фрагментах.</p>\\n\\n<h3 style=\\\"text-align: center;\\\">Форма обратной связи</h3>\\n\"}}','2018-09-19 07:55:28'),(25,NULL,128,'{\"content\":{\"body\":\"<p>Здесь Вы сможете публиковать вакансии Вашей компании и собирать отклики от соискателей. В данный момент компонент работает только в текстовом режиме, но в перспективе планируется его доработка, а именно добавление возможности&nbsp;смены приоритета вакансий в списке, поиск по вакансиям и отключаемая возможность деления по группам и отделам.</p>\\n\\n<p>Что касается страницы вакансии, то там планируется&nbsp;разбиение описание на отдельные поля (требования, условия и т.д.) с возможностью отключения отдельных полей, добавление фото к вакансии, заморозка вакансии (в данный момент набора на данную вакансию нет, но мы готовы рассмотреть Вас, как только он начнётся), расширение функционала для ответа на вакансию (электронное резюме, с возможностью прикреплять файлы).</p>\\n\"}}','2018-09-19 08:20:46'),(26,NULL,129,'{\"content\":{\"body\":\"<h3 style=\\\"text-align: center;\\\">&nbsp;</h3>\\n\\n<h3 style=\\\"text-align: center;\\\">&nbsp;</h3>\\n\\n<h3 style=\\\"text-align: center;\\\">Список вакансий</h3>\\n\"}}','2018-09-19 08:30:55'),(27,NULL,129,'{\"content\":{\"body\":\"<h3 style=\\\"text-align: center;\\\">&nbsp;</h3>\\n\\n<h3 style=\\\"text-align: center;\\\">&nbsp;</h3>\\n\\n<h3 style=\\\"text-align: center;\\\">Список вакансий</h3>\\n\"}}','2018-09-19 08:30:55'),(28,NULL,130,'{\"content\":{\"slides\":[{\"id\":1,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":2,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":3,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":4,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":5,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":6,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":7,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":8,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":9,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":10,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"}],\"lastId\":10}}','2018-09-19 09:00:13'),(29,NULL,137,'{\"content\":{\"body\":\"<p>На этой странице будут размещены примеры шаблонов, используемых в движке. Каждый маршрут этого раздела содержит только шаблон страницы, на котором ещё не было каких-либо действий, добавлений и т.п., за исключением двух- и трехколоночных шаблонов, в которых уже добавлен компонент общей навигации, чтобы с них можно было переходить не только через кнопку возврата.</p>\\n\\n<p>Также в трехколоночный макет и на эту самую страницу&nbsp;добавлен список объявлений, т.к правая колонка делается именно под него.</p>\\n\"}}','2018-09-20 09:47:20'),(30,NULL,150,'{\"content\":{\"body\":\"<p>&nbsp;</p>\\n\\n<p>В этом разделе будут рамещены страницы для компонентов, из которых далее будет составляться модуль для кладбищенских сайтов, таких как, например, поиск захоронений, книга памяти, вызов ритуального агента и многие другие.</p>\\n\"}}','2018-09-20 17:52:11'),(32,NULL,172,'{\"content\":{\"body\":\"<p>Панель администрирования предназначена для изменения основных настроек проекта. Здесь можно добавлять новые разделы и изменять существующие, менять название проекта и другие параметры.</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>Для начала администрирования проекта выберите интересущий Вас пункт в меню слева.</p>\\n\"}}','2018-10-09 16:11:48'),(33,NULL,175,'{\"content\":{\"body\":\"<address><span style=\\\"font-size:24px;\\\">Идейные соображения высшего порядка, а также постоянное информационно-пропагандистское обеспечение нашей деятельности создает необходимость включения в производственный план целого ряда внеочередных мероприятий с учетом комплекса своевременного выполнения сверхзадачи. Безусловно, курс на социально-ориентированный национальный проект представляет собой интересный эксперимент проверки инновационных методов управления процессами. В целом, конечно, постоянное информационно-пропагандистское обеспечение нашей деятельности играет важную роль в формировании как самодостаточных, так и внешне зависимых концептуальных решений.</span></address>\\n\"}}','2018-10-22 09:52:44');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fragments_settings`
--

LOCK TABLES `fragments_settings` WRITE;
/*!40000 ALTER TABLE `fragments_settings` DISABLE KEYS */;
INSERT INTO `fragments_settings` VALUES (1,22,NULL,'target','3','2018-09-20 14:42:23'),(2,104,NULL,'targetType','1','2018-09-20 15:09:28'),(3,61,NULL,'target','1','2018-09-20 15:09:39'),(4,135,NULL,'positionsRootUrl','/store-pos','2018-10-03 10:44:42'),(5,113,NULL,'minHeight','','2018-10-09 08:46:28'),(6,113,NULL,'maxImageHeight','350','2018-10-09 08:48:21'),(7,113,NULL,'minImageHeight','','2018-10-09 08:48:45'),(8,22,NULL,'url','/post','2018-10-09 09:01:50'),(9,23,NULL,'listUrl','/posts','2018-10-09 09:03:53'),(10,22,NULL,'showPublishedTime','1','2018-10-09 09:04:20'),(11,22,NULL,'showDescription','1','2018-10-09 09:04:31'),(12,22,NULL,'countPosts','','2018-10-09 09:07:51'),(13,22,NULL,'showPagination','1','2018-10-09 09:07:55'),(14,22,NULL,'showImage','1','2018-10-09 09:08:05'),(15,22,NULL,'orderByDesc','0','2018-10-09 09:08:18'),(16,47,NULL,'listUrl','/shops-list','2018-10-09 09:49:02'),(17,104,NULL,'onlyRegister','0','2018-10-09 10:45:14'),(18,170,NULL,'objectUrl','/vacancy','2018-10-09 10:57:50'),(19,126,NULL,'rootUrl','/vacancies','2018-10-09 10:59:09'),(20,118,NULL,'countOnPage','10','2018-10-09 11:15:57'),(21,53,NULL,'category','Форма на странице обратной связи','2018-10-09 11:21:47'),(22,53,NULL,'title','','2018-10-09 11:21:54');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_site_config`
--

LOCK TABLES `global_site_config` WRITE;
/*!40000 ALTER TABLE `global_site_config` DISABLE KEYS */;
INSERT INTO `global_site_config` VALUES (1,'Путь к файлу логотипа','siteLogo','/uploads/logo.svg',1,'2018-03-19 06:05:40',NULL),(2,'Текст в футере','footerText','© Лаборатория ЛетаIndex',1,'2018-04-16 04:49:46',NULL),(3,'Текст в тайтле после заголовка','appendTitle','ЛетаIndex Engine',1,'2018-04-25 06:51:57',NULL),(4,'Favicon','favicon','/favicon-li.ico',1,'2018-05-17 02:24:51',NULL),(5,'Доменное имя','domainName','engine.letaindex.ru',1,'2018-08-24 08:27:08','2018-08-24 08:27:08'),(7,'Включить корзину','showCart','1',1,'2018-10-03 12:05:29',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_pos`
--

LOCK TABLES `goods_pos` WRITE;
/*!40000 ALTER TABLE `goods_pos` DISABLE KEYS */;
INSERT INTO `goods_pos` VALUES (1,'Apple iMac 21.5',300000.00,0,0,3,0,1,6,NULL,NULL,NULL,'2018-09-20 18:00:24','Поддержка полного штатного разрешения на встроенном дисплее c высоким качеством цветопередачи: миллионы цветов на модели 21,5 дюйма и миллиард цветов на модели 21,5 дюйма с дисплеем 4K. Дополнительно можно подключить:\nодин внешний монитор с разрешением 5120х2880 пикселей (5K) и частотой 60 Гц, качество цветопередачи — миллиард цветов; или\n\nдва внешних монитора с разрешением 3840х2160 пикселей (4K UHD) и частотой 60 Гц, качество цветопередачи — миллиард цветов; или\n\nдва внешних монитора с разрешением 4096х2304 пикселя (4K) и частотой 60 Гц, качество цветопередачи — миллионы цветов',0,0,7),(4,'Галстук цветной',130.00,0,0,93,0,1,NULL,4,3240,NULL,'2018-10-03 10:49:16','Классическая модель, фабричный мужской галстук в ассортименте. ',1,0,NULL),(6,'Apple iMac 27',320000.00,0,0,5,0,1,13,NULL,NULL,NULL,'2018-10-03 12:30:55','Настольный компьютер, который погружает вас в контент. Буквально. Эта идея лежит в основе современного iMac — и сегодня она актуальна как никогда. Совершенно новые процессоры, инновационные графические технологии, передовые накопители и разъёмы с впечатляющей пропускной способностью — всё это новый iMac.',1,0,NULL),(8,'2091 - Платье габардин с воланом',750.00,0,0,1,0,1,NULL,4,2091,NULL,'2018-10-08 13:04:01','Ритуальное платье из габардина. Крой прямой, сзади застегиваются на липучках. Воротник стойка. Декор: косая бейка. ',0,0,NULL),(9,'2149 - Костюм мужской ',4000.00,0,0,1,0,1,NULL,4,2149,NULL,'2018-10-08 13:15:11','Ритуальный мужской костюм двойка: пиджак и брюки. Классическая прямая модель. Однобортный пиджак на пуговицах. На верхней части полочки – имитация кармана «с листочком». На нижней части полочки – декоративные клапаны (имитация карманов).  Брюки прямого покроя без карманов. Спереди застегиваются на молнию. Задняя часть брюк на резинке. Цвет: бежевый.',0,0,NULL),(12,'Сорочка',130.00,0,0,19,0,2,NULL,4,3882,NULL,'2018-10-09 16:43:03','Женская ритуальная сорочка с цветочным принтом. Изготовлена из х/б ткани.',0,0,NULL),(13,'Носки мужские черные',30.00,0,0,51,0,2,NULL,4,4224,NULL,'2018-10-09 16:54:27','В наличие классические однотонные носки всех размеров.',0,0,NULL),(14,'Мобила',9999.90,0,0,0,0,2,20,NULL,NULL,NULL,'2018-10-09 16:55:44',NULL,0,0,NULL),(17,'Панталоны женские',120.00,0,0,73,0,2,23,4,4479,NULL,'2018-10-09 18:04:45','Панталоны женские из х/б ткани с цветочным принтом. ',0,0,NULL),(18,'Майка на проверку',100.00,0,0,2,0,1,24,4,3718,NULL,'2018-10-10 18:23:25','Майка мужская ритуальная. Силуэт — прямой. Горловина и проймы обработаны трикотажным кантом. Низ обработан швом.',0,0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Содержит названия параметров товаров';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_props`
--

LOCK TABLES `goods_props` WRITE;
/*!40000 ALTER TABLE `goods_props` DISABLE KEYS */;
INSERT INTO `goods_props` VALUES (1,'Память','2018-09-21 10:16:53'),(2,'Процессор','2018-09-21 10:17:16'),(4,'Диагональ экрана','2018-10-17 10:10:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Содержит связь параметров товара с товаром';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_props_bind_values`
--

LOCK TABLES `goods_props_bind_values` WRITE;
/*!40000 ALTER TABLE `goods_props_bind_values` DISABLE KEYS */;
INSERT INTO `goods_props_bind_values` VALUES (4,1,2,2,'2018-10-17 10:10:28'),(5,1,1,1,'2018-10-17 10:10:37'),(6,1,4,5,'2018-10-17 10:11:20');
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='Содержит значения параметров товаров';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goods_props_values`
--

LOCK TABLES `goods_props_values` WRITE;
/*!40000 ALTER TABLE `goods_props_values` DISABLE KEYS */;
INSERT INTO `goods_props_values` VALUES (1,'4Гб',1,'2018-09-21 10:16:53'),(2,'Inter Core I7',2,'2018-09-21 10:17:16'),(4,'AMD FX-6600',2,'2018-10-17 10:08:32'),(5,'21,5',4,'2018-10-17 10:11:14');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `header_nav`
--

LOCK TABLES `header_nav` WRITE;
/*!40000 ALTER TABLE `header_nav` DISABLE KEYS */;
INSERT INTO `header_nav` VALUES (1,'Главная','/',0,'2018-03-26 13:37:37'),(2,'О компании','/company',0,'2018-03-27 04:43:16'),(4,'Магазин','/store',0,'2018-05-17 05:19:10'),(5,'Ритуалка','/rituals',0,'2018-05-22 09:53:23'),(13,'Шаблоны','/templates',0,'2018-08-27 05:12:20'),(15,'История','/history',2,'2018-09-19 07:06:42'),(16,'Политика','/polytics',2,'2018-09-19 07:06:59'),(17,'Магазины','/shops-list',2,'2018-09-19 07:07:15'),(18,'Посты','/posts',2,'2018-09-19 07:07:28'),(19,'Отзывы','/reviews',2,'2018-09-19 07:08:03'),(20,'Награды','/honors',2,'2018-09-19 07:09:09'),(21,'Частые вопросы','/faq',2,'2018-09-19 07:09:19'),(22,'Вакансии','/vacancies',2,'2018-09-19 07:09:28'),(23,'Обратная связь','/feedback',2,'2018-09-19 07:11:31'),(24,'Пустая страница','/tpl-empty',13,'2018-09-20 09:32:48'),(25,'Одноколоночный макет','/tpl-one',13,'2018-09-20 09:33:11'),(26,'Двухколоночный макет','/tpl-two',13,'2018-09-20 09:33:33'),(27,'Трехколоночный макет','/tpl-three',13,'2018-09-20 09:34:35'),(29,'Подключение CRM','/crm-connect',4,'2018-09-27 19:01:22');
/*!40000 ALTER TABLE `header_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `img` varchar(100) NOT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `history`
--

LOCK TABLES `history` WRITE;
/*!40000 ALTER TABLE `history` DISABLE KEYS */;
INSERT INTO `history` VALUES (1,'15 ноября 1998 года','/uploads/upload_419d418faf6b84a4f5be47cf52586238.jpg','Открытие второго магазина. С этого момента началось расширение компании.','2018-10-15 19:00:00'),(2,'Внедрён qr-код','/uploads/upload_f305b2c3168b3bac21b1e29106e6cde8.png','Наконец то мы научились ими пользоваться','1997-01-22 19:00:00'),(3,'Каждый из нас понимает очевидную вещь: экономическая повестка сегодняшнего дня предоставляет широкие','/uploads/upload_419d418faf6b84a4f5be47cf52586238.jpg','Каждый из нас понимает очевидную вещь: экономическая повестка сегодняшнего дня предоставляет широкие возможности для как самодостаточных, так и внешне зависимых концептуальных решений. Есть над чем за','2018-10-16 19:00:00');
/*!40000 ALTER TABLE `history` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_groups`
--

LOCK TABLES `menu_groups` WRITE;
/*!40000 ALTER TABLE `menu_groups` DISABLE KEYS */;
INSERT INTO `menu_groups` VALUES (1,'Меню администратора','2018-03-26 13:39:38'),(2,'Меню ритуалка','2018-05-22 09:55:21'),(3,'Меню о компании','2018-06-08 11:20:39'),(5,'Меню магазина','2018-08-30 11:22:22'),(6,'Меню шаблонов','2018-09-20 09:45:25'),(7,'Меню пользователя','2018-10-08 13:40:18');
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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,'Маршруты','/admin-routes',0,NULL,1,0,'2018-03-26 13:39:57',1),(2,'Клиенты','/admin-clients',0,NULL,1,0,'2018-03-26 13:40:14',1),(3,'Посещаемость','/admin-attendance',0,NULL,1,0,'2018-03-26 13:40:57',1),(4,'Компоненты','/admin-components',0,NULL,1,0,'2018-03-26 13:41:23',1),(5,'Глобальные переменные','/admin-globals',0,NULL,1,0,'2018-03-26 13:41:45',1),(6,'Поиск захоронений','/burial_search',0,NULL,2,0,'2018-05-22 09:55:33',1),(7,'Книга памяти','/memory_book',0,NULL,2,0,'2018-05-22 09:57:00',1),(8,'Админ обр. связи','/admin-feedback',0,NULL,1,0,'2018-06-07 10:01:36',1),(9,'История','/history',0,NULL,3,0,'2018-06-08 11:20:55',10),(11,'Политика','/polytics',0,NULL,3,0,'2018-08-08 11:39:42',11),(12,'Магазины','/shops-list',0,NULL,3,0,'2018-08-21 16:09:55',1),(13,'Посты','/posts',0,NULL,3,0,'2018-08-21 16:11:27',1),(14,'Отзывы','/reviews',0,NULL,3,0,'2018-08-21 16:16:16',1),(15,'Вызов агента (posts)','/agents_old',0,NULL,2,0,'2018-08-21 16:24:47',1),(18,'Награды','/honors',0,NULL,3,0,'2018-08-24 11:45:04',1),(20,'Частые вопросы','/faq',0,NULL,3,0,'2018-08-27 06:08:03',1),(21,'Вакансии','/vacancies',0,NULL,3,0,'2018-08-27 06:28:01',1),(22,'Подключенные CRM','/crm',0,NULL,5,0,'2018-08-30 11:22:39',1),(24,'Обратная связь','/feedback',0,NULL,3,0,'2018-09-19 04:34:54',1),(25,'Пустая страница','/tpl-empty',0,NULL,6,0,'2018-09-20 09:46:09',1),(26,'Одноколоночный макет','/tpl-one',0,NULL,6,0,'2018-09-20 09:46:22',1),(27,'Двухколоночный макет','/tpl-two',0,NULL,6,0,'2018-09-20 09:46:35',1),(28,'Трехколоночный макет','/tpl-three',0,NULL,6,0,'2018-09-20 09:46:48',1),(29,'Корзина','/cart',0,NULL,7,0,'2018-10-08 13:40:44',1),(30,'Личный кабинет','/my',0,NULL,7,0,'2018-10-08 13:40:56',1);
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
-- Table structure for table `offers`
--

DROP TABLE IF EXISTS `offers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `img` varchar(100) NOT NULL,
  `desc` varchar(200) DEFAULT NULL,
  `link` varchar(100) DEFAULT NULL,
  `active` int(11) DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offers`
--

LOCK TABLES `offers` WRITE;
/*!40000 ALTER TABLE `offers` DISABLE KEYS */;
/*!40000 ALTER TABLE `offers` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'a3826fda7d6b765895792d5564dd3092',8,NULL,'root','root','root',1,0,0.00,'mismagilov@letaindex.ru','+7(987)-654-32-10',4000.00,1,1,'2018-10-08 15:12:18');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_goods`
--

LOCK TABLES `orders_goods` WRITE;
/*!40000 ALTER TABLE `orders_goods` DISABLE KEYS */;
INSERT INTO `orders_goods` VALUES (1,9,1,1,4000.00,'2018-10-08 15:12:18');
/*!40000 ALTER TABLE `orders_goods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `panorams`
--

DROP TABLE IF EXISTS `panorams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panorams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `coord` varchar(200) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `panorams`
--

LOCK TABLES `panorams` WRITE;
/*!40000 ALTER TABLE `panorams` DISABLE KEYS */;
/*!40000 ALTER TABLE `panorams` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (1,'shop',1,'/uploads/9510',NULL,NULL,'upload_1377feb2896ba9cfc90ae684564b6ee4.jpg','2018-09-20 16:09:11'),(2,'shop',2,'/uploads/bd2e',NULL,NULL,'upload_8a171b84001108c1acafe5be46d73199.jpg','2018-09-20 16:16:00'),(3,'shop',3,'/uploads/5628',NULL,NULL,'upload_99d9b046ee826b4406212ef022869142.jpg','2018-09-20 16:20:49'),(4,'shop',3,'/uploads/e3a9',NULL,NULL,'upload_c37a90ce77906c44f2ef17ac9ebb6f51.jpg','2018-09-20 16:23:17'),(5,'shop',3,'/uploads/356a',NULL,NULL,'upload_70e1ad6bb4e54a07a5ab8db42420fef5.jpg','2018-09-20 16:24:41'),(6,'goodsPosition',1,'/photos/c894',NULL,NULL,'upload_61d46e5f38d1b15e11b57d7a4d3ef236.png','2018-09-21 10:24:16'),(10,'goodsPosition',4,'/uploads/unloading/position_4',4,15016,'15016.JPG','2018-10-03 10:49:17'),(11,'goodsPosition',4,'/uploads/unloading/position_4',4,15017,'15017.JPG','2018-10-03 11:22:43'),(13,'goodsPosition',6,'/photos/5924',NULL,NULL,'upload_50ae5515760a5e5c45553c67f14600de.png','2018-10-03 12:33:15'),(15,'goodsPosition',8,'/uploads/unloading/position_8',4,15004,'15004.jpg','2018-10-08 13:04:02'),(16,'goodsPosition',8,'/uploads/unloading/position_8',4,15005,'15005.JPG','2018-10-08 13:04:02'),(18,'goodsPosition',12,'/uploads/unloading/position_12',4,15012,'15012.jpg','2018-10-09 16:43:03'),(19,'goodsPosition',13,'/uploads/unloading/position_13',4,15000,'15000.JPG','2018-10-09 16:54:35'),(20,'goodsPosition',14,'/photos/f83b',NULL,NULL,'upload_6d6e8fd42de3579a52a05ff70977f2ea.jpg','2018-10-09 16:56:12'),(23,'goodsPosition',17,'/uploads/unloading/position_17',4,14923,'14923.JPG','2018-10-09 18:04:45'),(24,'goodsPosition',18,'/uploads/unloading/position_18',4,14995,'14995.jpg','2018-10-10 18:23:26');
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
INSERT INTO `posts` VALUES (1,NULL,'Раз два три',NULL,NULL,'<p><img alt=\"\" src=\"/uploads/upload_0527a469b47a33619fcb01c0a905f19a.jpg\" style=\"width: 600px; height: 450px; float: left; margin: 20px;\" /></p>\n\n<p>&nbsp;</p>\n\n<p>Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;</p>\n\n<p>Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;</p>\n\n<p>Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;</p>\n\n<p>Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;Текст, текст,&nbsp;текст и ещё раз текст!&nbsp;</p>\n',NULL,NULL,'1',NULL,'/uploads/upload_690207de890c394dcb7654b7e739df0b.jpg',0,1,'1526534761269',8,'2018-05-17 05:20:54',NULL),(2,NULL,'Галиахметов Сергей Сагитович',NULL,NULL,'<p><img alt=\"Ð¤Ð¾ÑÐ¾Ð³ÑÐ°ÑÐ¸Ñ Ð°Ð³ÐµÐ½ÑÐ°\" src=\"/uploads/upload_a38bcc0a5837950ca12e14997c196dfc.jpg\" style=\"height: 450px; width: 300px; border-width: 0px; border-style: solid; margin-right: 10px; margin-left: 10px; float: left;\" /></p>\n\n<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:200px;\">\n	<thead>\n		<tr>\n			<th scope=\"col\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">Номера телефонов</span></span></th>\n		</tr>\n	</thead>\n	<tbody>\n		<tr>\n			<td style=\"text-align: center;\"><a href=\"tel:+79512517784\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">8-951-251-7784</span></span></a></td>\n		</tr>\n		<tr>\n			<td style=\"text-align: center;\"><a href=\"tel:+79128052750\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">8-912-805-2750</span></span></a></td>\n		</tr>\n		<tr>\n			<td style=\"text-align: center;\"><a href=\"tel:+73519452750\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">45-27-50</span></span></a></td>\n		</tr>\n	</tbody>\n</table>\n\n<p>&nbsp;</p>\n',NULL,NULL,'2','','/uploads/upload_7379fe69fa40052dd311cdbca6e17f42.jpg',0,1,'1526546752861',8,'2018-05-17 03:02:01',NULL),(3,NULL,'Хлесткина Лилия Васильевна',NULL,NULL,'<p><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\"><img alt=\"\" src=\"/uploads/upload_7024aafc2db2cfe602d98d16e1ee9344.jpg\" style=\"width: 300px; height: 450px; border-width: 0px; border-style: solid; margin: 0px 10px; float: left;\" /></span></span></p>\n\n<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:200px;\">\n	<thead>\n		<tr>\n			<th scope=\"col\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">Номера телефонов</span></span></th>\n		</tr>\n	</thead>\n	<tbody>\n		<tr>\n			<td style=\"text-align: center;\"><a href=\"tel:+79080644981\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">8-908-064-4981</span></span></a></td>\n		</tr>\n	</tbody>\n</table>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n',NULL,NULL,'2','','/uploads/upload_df82ac603200f3f3bd32dd3834bfbba0.jpg',0,1,'1526547176465',8,'2018-05-17 03:02:07',NULL),(4,NULL,'Рогачёва Наталья Юрьевна',NULL,NULL,'<p><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\"><img alt=\"\" src=\"/uploads/upload_3dd277288ec32fcff4db35d2745845c1.jpg\" style=\"border-width: 0px; border-style: solid; margin-right: 10px; margin-left: 10px; float: left; width: 300px; height: 450px;\" /></span></span></p>\n\n<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:200px;\">\n	<thead>\n		<tr>\n			<th scope=\"col\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">Номера телефонов</span></span></th>\n		</tr>\n	</thead>\n	<tbody>\n		<tr>\n			<td style=\"text-align: center;\"><a href=\"tel:+79514499999\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">8-951-44-99-999</span></span></a></td>\n		</tr>\n	</tbody>\n</table>\n\n<p>&nbsp;</p>\n',NULL,NULL,'2','','/uploads/upload_ea61627620bea22121fedba62e4b4887.jpg',0,1,'1526547505255',8,'2018-05-17 03:02:12',NULL),(5,NULL,'Колесникова Екатерина Игоревна',NULL,NULL,'<p><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\"><img alt=\"\" src=\"/uploads/upload_b2e6651dd0045dffaa686d4dee6fc592.jpg\" style=\"border-width: 0px; border-style: solid; margin-left: 10px; margin-right: 10px; float: left; width: 300px; height: 450px;\" /></span></span></p>\n\n<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:200px;\">\n	<thead>\n		<tr>\n			<th scope=\"col\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">Номера телефонов</span></span></th>\n		</tr>\n	</thead>\n	<tbody>\n		<tr>\n			<td style=\"text-align: center;\"><a href=\"tel:+79507358385\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">8(950)735-83-85</span></span></a></td>\n		</tr>\n	</tbody>\n</table>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n',NULL,NULL,'2','','/uploads/upload_7b5e8ccfed869e1d7c2d6e3de13fbae1.jpg',0,1,'1526547599317',8,'2018-05-17 03:02:16',NULL),(6,NULL,'Переверзев Леонид Дмитриевич',NULL,NULL,'<p><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\"><img alt=\"\" src=\"/uploads/upload_247bdff3bf77b9837eeb4e3284f04af5.jpg\" style=\"border-width: 0px; border-style: solid; margin: 0px 10px; float: left; width: 300px; height: 450px;\" /></span></span></p>\n\n<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:200px;\">\n	<thead>\n		<tr>\n			<th scope=\"col\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">Номера телефонов</span></span></th>\n		</tr>\n	</thead>\n	<tbody>\n		<tr>\n			<td style=\"text-align: center;\"><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\"><a href=\"tel:+79630955552\">8(963)095-55-52</a></span></span></td>\n		</tr>\n	</tbody>\n</table>\n\n<p>&nbsp;</p>\n',NULL,NULL,'2','','/uploads/upload_d4fed477a9fbe22e94d7bf27a6312a5e.jpg',0,1,'1528451122659',8,'2018-05-17 03:02:21',NULL),(7,NULL,'Королев Лев Альбертович',NULL,NULL,'<p><img alt=\"\" src=\"/uploads/upload_7f0047e12a1fb19efd690dcf8db381ee.jpg\" style=\"border-width: 0px; border-style: solid; margin: 0px 10px; float: left; width: 300px; height: 450px;\" /></p>\n\n<table align=\"center\" border=\"1\" cellpadding=\"1\" cellspacing=\"1\" style=\"width:200px;\">\n	<tbody>\n		<tr>\n			<td style=\"text-align: center;\"><strong><span style=\"font-family:Verdana,Geneva,sans-serif;\"><span style=\"font-size:16px;\">Номера телефонов</span></span></strong></td>\n		</tr>\n		<tr>\n			<td style=\"text-align: center;\"><a href=\"tel:+79681190818\">8(968)119-08-18</a></td>\n		</tr>\n	</tbody>\n</table>\n\n<p style=\"text-align: center;\">&nbsp;</p>\n',NULL,NULL,'2','','/uploads/upload_2996c0b8d33cb1c2a866954898858836.jpg',0,1,'1529047604918',8,'2018-06-15 02:14:44',NULL),(8,NULL,'Новая публикация',NULL,NULL,NULL,NULL,NULL,'Публикации','','/uploads/upload_88ca455f7209dd58adc44fe3494c2882.jpg',0,0,NULL,8,'2018-08-23 16:54:10',NULL),(9,NULL,'Новая новость',NULL,NULL,'<p>Современные технологии достигли такого уровня, что начало повседневной работы по формированию позиции позволяет оценить значение кластеризации усилий. Повседневная практика показывает, что постоянный количественный рост и сфера нашей активности, а также свежий взгляд на привычные вещи - безусловно открывает новые горизонты для системы обучения кадров, соответствующей насущным потребностям. Таким образом, социально-экономическое развитие обеспечивает широкому кругу (специалистов) участие в формировании новых принципов формирования материально-технической и кадровой базы. Для современного мира убежденность некоторых оппонентов не оставляет шанса для как самодостаточных, так и внешне зависимых концептуальных решений. Высокий уровень вовлечения представителей целевой аудитории является четким доказательством простого факта: экономическая повестка сегодняшнего дня предопределяет высокую востребованность соответствующих условий активизации.</p>\n\n<p>Современные технологии достигли такого уровня, что начало повседневной работы по формированию позиции позволяет оценить значение кластеризации усилий. Повседневная практика показывает, что постоянный количественный рост и сфера нашей активности, а также свежий взгляд на привычные вещи - безусловно открывает новые горизонты для системы обучения кадров, соответствующей насущным потребностям. Таким образом, социально-экономическое развитие обеспечивает широкому кругу (специалистов) участие в формировании новых принципов формирования материально-технической и кадровой базы. Для современного мира убежденность некоторых оппонентов не оставляет шанса для как самодостаточных, так и внешне зависимых концептуальных решений. Высокий уровень вовлечения представителей целевой аудитории является четким доказательством простого факта: экономическая повестка сегодняшнего дня предопределяет высокую востребованность соответствующих условий активизации.</p>\n',NULL,NULL,'3','12,13,14','/img/components/news/1.jpg',0,1,'1535350271760',8,'2018-08-27 06:11:01',NULL),(10,NULL,'Новая публикация2','hfp ljds;lfkjs df;lasjkdfl',NULL,NULL,NULL,NULL,'3','','/img/components/news/2.jpg',0,1,'1535350985373',8,'2018-08-27 06:22:59',NULL),(11,NULL,'Новая публикация1',NULL,NULL,NULL,NULL,NULL,'3','','/img/components/news/3.jpg',0,1,'1535350986407',8,'2018-08-27 06:23:01',NULL),(12,NULL,'Новая публикация',NULL,NULL,NULL,NULL,NULL,'3','','/img/components/news/4.jpg',0,1,'1537335234487',8,'2018-09-18 11:31:24',NULL),(13,NULL,'Новая публикация',NULL,NULL,NULL,NULL,NULL,'3','','/img/components/news/5.jpg',0,1,'1537335233218',8,'2018-09-18 11:31:27',NULL),(14,NULL,'Новая публикация',NULL,NULL,'<p>Повседневная практика показывает, что начало повседневной работы по формированию позиции в значительной степени обуславливает создание новых предложений. С другой стороны социально-экономическое развитие требует от нас системного анализа существующих финансовых и административных условий? Практический опыт показывает, что консультация с профессионалами из IT играет важную роль в формировании новых предложений?</p>\n\n<p>Равным образом выбранный нами инновационный путь играет важную роль в формировании системы обучения кадров, соответствующей насущным потребностям. Повседневная практика показывает, что рамки и место обучения кадров требует от нас системного анализа всесторонне сбалансированных нововведений. Равным образом консультация с профессионалами из IT требует определения и уточнения модели развития. Дорогие друзья, повышение уровня гражданского сознания создаёт предпосылки качественно новых шагов для позиций, занимаемых участниками в отношении поставленных задач!</p>\n\n<p>Значимость этих проблем настолько очевидна, что сложившаяся структура организации требует от нас системного анализа позиций, занимаемых участниками в отношении поставленных задач. Задача организации, в особенности же постоянный количественный рост и сфера нашей активности создаёт предпосылки качественно новых шагов для позиций, занимаемых участниками в отношении поставленных задач. Разнообразный и богатый опыт постоянное информационно-техническое обеспечение нашей деятельности способствует повышению актуальности дальнейших направлений развитая системы массового участия. Повседневная практика показывает, что новая модель организационной деятельности в значительной степени обуславливает создание новых предложений.</p>\n',NULL,NULL,'3','','/img/components/news/6.jpg',0,1,'1537335231871',8,'2018-09-18 11:31:29',NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='faq';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,1,'category',1,NULL,'Новая категория','Так и так',1,NULL,'2018-08-23 06:08:07'),(2,1,'question',1,NULL,'Как жить дальше','Так и жить',1,NULL,'2018-08-23 16:52:29'),(6,1,'question',3,NULL,'Сколько стоит сайт, если заказывать его у Вас?','Для подсчета стоимости обратитесь к нашим менеджерам в разделе <a href=\"/feedback\">Обратная связь</a>',1,NULL,'2018-09-20 10:04:04'),(5,1,'question',2,NULL,'Как быстро можно сделать сайт на таком движке?','Сайт уже готов. Отключите лишнее и пользуйтесь',1,NULL,'2018-09-19 05:31:55'),(7,1,'question',6,NULL,'вопрос?',NULL,0,NULL,'2018-09-20 17:01:12'),(8,1,'question',2,NULL,'3. Можно ли сделать лэндинг на этой штуке?','Конечно можно! Количество страниц полностью под Вашим контролем!',1,NULL,'2018-10-09 15:40:20'),(9,1,'question',2,NULL,'Возможно ли сделать на таком движке полноценный интернет-магазин?','Конечно это возможно! Магазин будет не только полноценным, но и намного более функциональным, чем те, что делаются на сторонних платформах',1,NULL,'2018-10-09 15:45:58'),(10,1,'question',1,NULL,'Всё ли работает в этот раз?','Похоже, что в этот раз косяков намного меньше',1,NULL,'2018-10-17 11:12:52');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions_categories`
--

LOCK TABLES `questions_categories` WRITE;
/*!40000 ALTER TABLE `questions_categories` DISABLE KEYS */;
INSERT INTO `questions_categories` VALUES (1,1,'Общие вопросы'),(2,1,'Вопросы о возможностях платформы'),(3,1,'Финансовые вопросы');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
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
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (32,'Главная страница','/',1,NULL,NULL,NULL,1,0,1,0,1,1,1,'','','2018-01-17 10:11:31','2018-09-18 10:13:14'),(40,'Администрирование','/admin',2,1,NULL,NULL,1,0,3,0,1,1,1,'','','2018-01-20 20:43:27','2018-03-26 13:39:43'),(49,'Маршруты','/admin-routes',3,1,NULL,0,1,0,3,0,1,1,1,'','','2018-01-25 07:14:47','2018-10-08 13:27:36'),(50,'Управление клиентами','/admin-clients',3,1,NULL,0,1,0,3,0,1,1,1,'','','2018-01-25 07:15:29','2018-10-08 13:27:54'),(51,'Посещаемость','/admin-attendance',3,1,NULL,0,1,0,3,0,1,1,1,'','','2018-01-25 08:34:36','2018-10-08 13:28:07'),(61,'Авторизация','/login',1,NULL,NULL,NULL,1,0,1,0,1,0,0,'','','2018-01-25 11:49:17','2018-01-25 12:00:21'),(67,'Управление компонентами','/admin-components',3,1,NULL,0,1,0,3,0,1,1,1,'','','2018-02-05 17:38:19','2018-10-08 13:28:24'),(70,'Глобальные переменные','/admin-globals',3,1,NULL,0,1,0,3,0,1,1,1,'','','2018-02-07 11:31:36','2018-10-08 13:28:41'),(84,'Отзывы','/reviews',2,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-04-02 10:01:46','2018-06-08 11:20:39'),(85,'Новости','/news',4,NULL,NULL,NULL,1,0,1,0,0,1,1,'','','2018-04-02 11:06:37','2018-06-06 07:33:34'),(86,'Страница новости','/news-id/:params',2,NULL,NULL,NULL,1,0,1,1,0,1,1,'','','2018-04-02 11:10:44','2018-04-02 11:12:33'),(87,'Посты','/posts',2,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-05-17 05:19:50','2018-09-18 11:29:47'),(88,'Публикация','/post/:params',2,3,13,NULL,1,0,1,1,0,1,1,'','','2018-05-17 05:23:49','2018-10-09 09:34:27'),(89,'Кладбища','/cemeteries',3,2,NULL,NULL,1,0,1,0,0,1,1,'','','2018-05-22 09:53:13','2018-05-22 09:55:21'),(90,'Поиск захоронений','/burial_search',3,2,NULL,NULL,1,0,1,0,0,1,1,'','','2018-05-22 09:54:31','2018-05-22 10:01:18'),(91,'Книга памяти','/memory_book',3,2,NULL,NULL,1,0,1,0,0,1,1,'','','2018-05-22 10:11:18','2018-05-22 10:11:45'),(92,'Страница участка','/place/:params',3,2,NULL,NULL,1,0,1,1,0,1,1,'','','2018-05-22 10:13:37','2018-05-22 10:14:28'),(93,'Страница захоронения','/person/:params',3,2,NULL,NULL,1,0,1,1,0,1,1,'','','2018-05-22 10:13:54','2018-05-22 10:15:03'),(94,'Личный кабинет','/my',3,7,NULL,NULL,1,0,1,0,0,1,1,'','','2018-05-22 10:19:02','2018-10-08 13:41:12'),(95,'Обратная связь','/admin-feedback',2,1,NULL,NULL,1,0,1,0,0,1,1,'','','2018-06-07 10:02:03','2018-06-07 10:02:17'),(96,'Магазины компании','/shops-list',2,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-06-08 11:21:18','2018-06-08 11:21:30'),(99,'Магазин','/shop-page/:params',2,3,12,NULL,1,0,1,1,0,1,1,'','','2018-06-08 11:24:18','2018-09-19 12:11:25'),(100,'Политика компании','/polytics',2,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-06-15 13:47:37','2018-09-19 04:36:04'),(101,'Список агентов','/agents',3,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-06-19 13:17:50','2018-06-19 13:18:12'),(102,'Магазин','/store',1,5,NULL,NULL,1,0,1,0,0,1,1,'','','2018-06-19 14:31:58','2018-09-19 10:30:33'),(103,'Обратная связь','/feedback',3,3,24,NULL,1,0,1,0,0,1,1,'','','2018-08-08 11:40:52','2018-10-09 15:59:07'),(104,'О компании','/company',2,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-08-21 14:09:44','2018-08-21 14:10:02'),(105,'Ритуалка','/rituals',2,2,NULL,NULL,1,0,1,0,0,1,1,'','','2018-08-21 15:45:45','2018-08-21 15:46:03'),(106,'Награды','/honors',2,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-08-21 16:11:45','2018-08-21 16:11:59'),(107,'Информация','/info',2,NULL,NULL,NULL,1,0,1,0,0,1,1,'','','2018-08-21 16:14:06','2018-08-21 16:14:35'),(108,'Частые вопросы','/faq',2,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-08-21 16:20:42','2018-08-21 16:21:58'),(109,'Вызов агента (posts)','/agents_old',2,2,NULL,NULL,1,0,1,0,0,1,1,'','','2018-08-21 16:26:34','2018-08-21 16:27:04'),(110,'Страница агента','/agent_old/:params',2,2,NULL,NULL,1,0,1,1,0,1,1,'','','2018-08-22 04:50:25','2018-08-22 04:52:42'),(112,'О компании','/about',2,3,NULL,NULL,1,0,1,0,0,1,1,'','','2018-08-24 02:37:33','2018-08-24 02:39:57'),(113,'Новая страница','/new_page',2,1,NULL,NULL,1,0,1,0,0,1,1,'','','2018-08-27 05:12:12','2018-08-27 05:14:05'),(114,'Слайдер магазина','/shop-slider',1,NULL,NULL,NULL,1,0,1,0,0,1,1,'','','2018-08-27 05:45:39',NULL),(115,'Страница новости','/new/:params',3,NULL,NULL,NULL,1,0,1,1,0,1,1,'','','2018-08-27 06:14:22',NULL),(116,'История компании','/history',2,3,9,NULL,1,0,1,0,0,1,1,'','','2018-09-19 04:33:00','2018-09-27 18:18:54'),(117,'Вакансии','/vacancies',2,3,21,NULL,1,0,1,0,0,1,1,'','','2018-09-19 05:17:57','2018-10-09 11:01:32'),(118,'Вакансия','/vacancy/:params',2,3,21,NULL,1,0,1,1,0,1,1,'','','2018-09-19 05:21:32','2018-10-09 11:01:44'),(119,'Категория магазина','/store-cat/:params',2,NULL,NULL,NULL,1,0,1,1,0,1,1,'','','2018-09-20 06:16:44',NULL),(120,'Шаблоны','/templates',2,6,NULL,NULL,1,0,1,0,0,1,1,'','','2018-09-20 09:42:50','2018-09-20 09:45:25'),(121,'Пустой шаблон страницы','/tpl-empty',1,NULL,NULL,0,1,0,1,0,0,1,1,'','','2018-09-20 09:43:19','2018-09-20 09:44:57'),(122,'Одноколоночный макет страницы','/tpl-one',4,NULL,NULL,NULL,1,0,1,0,0,1,1,'','','2018-09-20 09:43:54',NULL),(123,'Двухколоночный макет страницы','/tpl-two',3,6,NULL,NULL,1,0,1,0,0,1,1,'','','2018-09-20 09:44:13','2018-09-20 09:48:48'),(124,'Трехколоночный макет страницы','/tpl-three',2,6,NULL,0,1,0,1,0,0,1,1,'','','2018-09-20 09:44:31','2018-09-24 10:34:00'),(125,'Позиция магазина','/store-pos/:params',2,NULL,NULL,0,1,0,1,1,0,1,1,'','','2018-09-21 09:41:15','2018-10-08 13:43:15'),(126,'Подключение CRM','/crm-connect',2,1,NULL,NULL,1,0,3,0,1,1,1,'','','2018-09-28 04:43:58','2018-09-28 04:43:58'),(127,'Корзина','/cart',2,7,NULL,NULL,1,0,1,0,0,1,1,'','','2018-10-08 13:36:51','2018-10-08 13:40:18'),(128,'Оформление заказа','/order',2,7,NULL,NULL,1,0,1,0,0,1,1,'','','2018-10-08 13:56:46','2018-10-08 13:57:00'),(129,'Успешный заказ','/order-complete/:params',2,7,NULL,NULL,1,0,1,1,0,1,1,'','','2018-10-08 15:22:32','2018-10-08 15:22:54'),(130,'Тестовый маршрут','/тестовый_маршрут',1,NULL,NULL,NULL,1,0,1,0,0,1,1,'','','2018-10-09 16:33:13',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes_aliases`
--

LOCK TABLES `routes_aliases` WRITE;
/*!40000 ALTER TABLE `routes_aliases` DISABLE KEYS */;
INSERT INTO `routes_aliases` VALUES (1,110,'/ritualnuy-agent-korolev-lev-albertovich',0,'','7','2018-08-22 15:54:09'),(2,125,'/imac215',0,NULL,'1','2018-10-17 09:58:51'),(3,125,'/nastolnyj',0,NULL,'1','2018-10-17 10:00:20'),(4,125,'/nastolnyj_kompyuter_apple',0,NULL,'1','2018-10-17 10:00:45'),(5,125,'/nastolnyj_kompyuter_apple_imac_21_5',0,NULL,'1','2018-10-17 10:01:27'),(6,125,'/nastolnyj-kompyuter-apple-imac-215',0,NULL,'1','2018-10-17 10:19:26'),(7,125,'/nastolnyj-kompyuter-apple-imac-21.5',0,NULL,'1','2018-10-17 10:22:23'),(8,125,'/nastolnyj-kompyuter-apple-imac2-21.5',0,NULL,'1','2018-10-17 10:29:59');
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
  `used_table` varchar(100) NOT NULL COMMENT 'используемая таблица для этого target',
  `object_target_id` varchar(100) DEFAULT NULL COMMENT 'target объектов (например в таблице публикаций "новости", "статьи" и т.д.)',
  `url_to_object` varchar(255) DEFAULT NULL COMMENT 'URL на страницу объекта, если не установлен алиас',
  `code` varchar(100) NOT NULL COMMENT 'название переменной для кода',
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
INSERT INTO `shops_list` VALUES (1,NULL,'В новых','1','<p>Магазин имеет удобное расположение среди новостроек. В нем всегда в наличии весть ассортимент нашей продукции</p>','Новая 7','+7 (3519) 99-88-77','{\"1\":[\"08:00\",\"17:00\"],\"2\":[\"09:00\",\"17:00\"],\"3\":[\"09:00\",\"17:00\"],\"4\":[\"09:00\",\"17:00\"],\"5\":[\"09:00\",\"17:00\"],\"6\":[\"09:00\",\"17:00\"],\"7\":[\"09:00\",\"17:00\"]}','53.369401202898764, 59.00617914398412','2018-06-08 11:21:45'),(2,NULL,'В Ленинском','2','<p>Удачное расположение этого магазина сделает его посещение действительно простым и удобным, а широкий ассортимент продукции в наличии позволит не ждать доставки заказа.</p>','Ленина 10','+7 (3519) 33-44-55','{\"1\":[\"08:00\",\"17:00\"],\"2\":[\"09:00\",\"17:00\"],\"3\":[\"09:00\",\"17:00\"],\"4\":[\"09:00\",\"17:00\"],\"5\":[\"09:00\",\"17:00\"],\"6\":[\"09:00\",\"17:00\"],\"7\":[\"09:00\",\"17:00\"]}','53.436814, 58.971331','2018-06-08 11:21:49'),(3,NULL,'На левом','4','<p>Мы специально открыли магазин на левом берегу нашего города, чтобы Вам не приходилось ездить слишком далеко за покупками в магазины нашей компании.</p>','Левая 77','+7 (3519) 88-77-66','{\"1\":[\"08:00\",\"17:00\"],\"2\":[\"09:00\",\"17:00\"],\"3\":[\"09:00\",\"17:00\"],\"4\":[\"09:00\",\"17:00\"],\"5\":[\"09:00\",\"17:00\"],\"6\":[\"09:00\",\"17:00\"],\"7\":[\"09:00\",\"17:00\"]}','53.383805, 59.102614','2018-06-08 11:21:51');
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
INSERT INTO `slides` VALUES (5,'/img/components/slider/slide1.jpg','Первый слайд','Тот самый первый слайд','Это первый слайд, тот самый, который пользователь видит самым первым заходя на сайт. Поэтому он должен привлекать внимание и выглядеть приятно, чтобы расположить к себе клиента!',1,113,1,'2018-09-18 10:14:11'),(6,'/img/components/slider/slide2.jpg','Второй слайд','А это уже второй','Второй слайд может показываться автоматически сменяя первый или по нажатию пользователя. Во втором случае вероятность увидеть его резко снижается.',1,113,1,'2018-09-18 10:14:30'),(7,'/img/components/slider/slide3.jpg','Третий слайд','И наконец третий','Третий слайд вообще никто может не увидеть, если в проекте не будет автоматической прокрутки',1,113,1,'2018-09-18 10:15:08');
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
INSERT INTO `templates` VALUES (1,'Пустая страница','empty','2018-01-12 05:06:14'),(2,'Трёхколоночный макет','three-column','2018-01-12 05:06:48'),(3,'Двухколоночный макет','two-column','2018-04-25 08:18:10'),(4,'Одноколоночный макет','one-column','2018-06-06 07:29:02');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacancies`
--

LOCK TABLES `vacancies` WRITE;
/*!40000 ALTER TABLE `vacancies` DISABLE KEYS */;
INSERT INTO `vacancies` VALUES (1,'Администратор сайта','<p>&nbsp;</p>\n\n<p>Требуется ответственный и целеустремленный администратор для наполнения данного сайта.</p>\n\n<p>&nbsp;</p>\n\n<p>Требования: грамотность, умение писать тексты, уверенный пользователь ПК, начальное знание языков HTML, CSS, JS</p>\n\n<p>&nbsp;</p>\n\n<p>Условия: пятидневная рабочая неделя, официальная заработная плата</p>',1,'2018-09-19 05:18:54'),(2,'Front-end разработчик','<p>Современные технологии достигли такого уровня, что начало повседневной работы по формированию позиции позволяет оценить значение кластеризации усилий. Повседневная практика показывает, что постоянный количественный рост и сфера нашей активности, а также свежий взгляд на привычные вещи - безусловно открывает новые горизонты для системы обучения кадров, соответствующей насущным потребностям. Таким образом, социально-экономическое развитие обеспечивает широкому кругу (специалистов) участие в формировании новых принципов формирования материально-технической и кадровой базы. Для современного мира убежденность некоторых оппонентов не оставляет шанса для как самодостаточных, так и внешне зависимых концептуальных решений. Высокий уровень вовлечения представителей целевой аудитории является четким доказательством простого факта: экономическая повестка сегодняшнего дня предопределяет высокую востребованность соответствующих условий активизации.</p>',1,'2018-10-09 10:57:10');
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
) ENGINE=InnoDB AUTO_INCREMENT=2018 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
INSERT INTO `views` VALUES (1,54,54,'/','2018-09-20 12:12:00',NULL,NULL,NULL),(2,54,54,'/company','2018-09-20 12:12:02',NULL,NULL,NULL),(3,54,54,'/store','2018-09-20 12:12:03',NULL,NULL,NULL),(4,54,54,'/rituals','2018-09-20 12:12:04',NULL,NULL,NULL),(5,54,54,'/','2018-09-20 12:12:06',NULL,NULL,NULL),(6,54,54,'/','2018-09-20 12:12:11',NULL,NULL,NULL),(7,54,54,'/','2018-09-20 12:12:12',NULL,NULL,NULL),(8,54,54,'/posts','2018-09-20 14:42:13',NULL,NULL,NULL),(9,54,54,'/posts','2018-09-20 14:42:20',NULL,NULL,NULL),(10,54,54,'/posts','2018-09-20 14:42:23',NULL,NULL,NULL),(11,54,54,'/posts','2018-09-20 14:42:26',NULL,NULL,NULL),(12,54,54,'/posts','2018-09-20 14:42:28',NULL,NULL,NULL),(13,54,54,'/posts','2018-09-20 14:42:31',NULL,NULL,NULL),(14,54,54,'/posts','2018-09-20 14:42:32',NULL,NULL,NULL),(15,54,54,'/posts','2018-09-20 14:43:22',NULL,NULL,NULL),(16,54,54,'/posts','2018-09-20 14:43:23',NULL,NULL,NULL),(17,54,54,'/posts','2018-09-20 14:43:25',NULL,NULL,NULL),(18,54,54,'/posts','2018-09-20 14:43:28',NULL,NULL,NULL),(19,54,54,'/posts','2018-09-20 14:43:29',NULL,NULL,NULL),(20,54,54,'/reviews','2018-09-20 15:08:16',NULL,NULL,NULL),(21,54,54,'/reviews','2018-09-20 15:08:30',NULL,NULL,NULL),(22,54,54,'/reviews','2018-09-20 15:08:34',NULL,NULL,NULL),(23,54,54,'/honors','2018-09-20 15:09:23',NULL,NULL,NULL),(24,54,54,'/honors','2018-09-20 15:09:24',NULL,NULL,NULL),(25,54,54,'/reviews','2018-09-20 15:09:24',NULL,NULL,NULL),(26,54,54,'/reviews','2018-09-20 15:09:26',NULL,NULL,NULL),(27,54,54,'/reviews','2018-09-20 15:09:28',NULL,NULL,NULL),(28,54,54,'/reviews','2018-09-20 15:09:30',NULL,NULL,NULL),(29,54,54,'/honors','2018-09-20 15:09:31',NULL,NULL,NULL),(30,54,54,'/faq','2018-09-20 15:09:34',NULL,NULL,NULL),(31,54,54,'/faq','2018-09-20 15:09:36',NULL,NULL,NULL),(32,54,54,'/faq','2018-09-20 15:09:39',NULL,NULL,NULL),(33,54,54,'/faq','2018-09-20 15:09:40',NULL,NULL,NULL),(34,54,54,'/vacancies','2018-09-20 15:10:28',NULL,NULL,NULL),(35,54,54,'/vacancies','2018-09-20 15:10:32',NULL,NULL,NULL),(36,54,54,'/vacancies','2018-09-20 15:10:33',NULL,NULL,NULL),(37,54,54,'/feedback','2018-09-20 15:10:34',NULL,NULL,NULL),(38,54,54,'/feedback','2018-09-20 15:10:36',NULL,NULL,NULL),(39,54,54,'/feedback','2018-09-20 15:10:37',NULL,NULL,NULL),(40,54,54,'/posts','2018-09-20 15:10:39',NULL,NULL,NULL),(41,54,54,'/shops-list','2018-09-20 15:10:40',NULL,NULL,NULL),(42,54,54,'/polytics','2018-09-20 15:10:43',NULL,NULL,NULL),(43,54,54,'/history','2018-09-20 15:10:45',NULL,NULL,NULL),(44,54,54,'/shops-list','2018-09-20 15:10:48',NULL,NULL,NULL),(45,54,54,'/shops-list','2018-09-20 15:12:47',NULL,NULL,NULL),(46,54,54,'/shops-list','2018-09-20 15:12:50',NULL,NULL,NULL),(47,54,54,'/shops-list','2018-09-20 15:22:59',NULL,NULL,NULL),(48,54,54,'/shops-list','2018-09-20 15:30:53',NULL,NULL,NULL),(49,54,54,'/favicon.ico','2018-09-20 15:31:24',NULL,NULL,NULL),(50,54,54,'/shops-list','2018-09-20 15:32:49',NULL,NULL,NULL),(51,54,54,'/shops-list','2018-09-20 15:32:55',NULL,NULL,NULL),(52,54,54,'/shops-list','2018-09-20 15:33:57',NULL,NULL,NULL),(53,54,54,'/shops-list','2018-09-20 15:34:29',NULL,NULL,NULL),(54,54,54,'/shops-list','2018-09-20 15:34:45',NULL,NULL,NULL),(55,54,54,'/shops-list','2018-09-20 15:36:18',NULL,NULL,NULL),(56,54,54,'/shops-list','2018-09-20 15:36:32',NULL,NULL,NULL),(57,54,54,'/shops-list','2018-09-20 15:37:53',NULL,NULL,NULL),(58,54,54,'/shops-list','2018-09-20 15:42:16',NULL,NULL,NULL),(59,54,54,'/shops-list','2018-09-20 15:45:58',NULL,NULL,NULL),(60,54,54,'/shops-list','2018-09-20 15:46:15',NULL,NULL,NULL),(61,54,54,'/shops-list','2018-09-20 15:46:24',NULL,NULL,NULL),(62,54,54,'/shops-list','2018-09-20 15:46:52',NULL,NULL,NULL),(63,54,54,'/polytics','2018-09-20 15:47:06',NULL,NULL,NULL),(64,54,54,'/history','2018-09-20 15:47:07',NULL,NULL,NULL),(65,54,54,'/shops-list','2018-09-20 15:47:09',NULL,NULL,NULL),(66,54,54,'/posts','2018-09-20 15:47:10',NULL,NULL,NULL),(67,54,54,'/reviews','2018-09-20 15:47:11',NULL,NULL,NULL),(68,54,54,'/shops-list','2018-09-20 15:47:12',NULL,NULL,NULL),(69,54,54,'/shops-list','2018-09-20 15:47:58',NULL,NULL,NULL),(70,54,54,'/shops-list','2018-09-20 15:48:23',NULL,NULL,NULL),(71,54,54,'/shops-list','2018-09-20 15:50:16',NULL,NULL,NULL),(72,54,54,'/shops-list','2018-09-20 15:50:50',NULL,NULL,NULL),(73,54,54,'/shops-list','2018-09-20 15:51:41',NULL,NULL,NULL),(74,54,54,'/shops-list','2018-09-20 15:54:17',NULL,NULL,NULL),(75,54,54,'/shops-list','2018-09-20 15:54:34',NULL,NULL,NULL),(76,54,54,'/shops-list','2018-09-20 15:54:44',NULL,NULL,NULL),(77,54,54,'/shops-list','2018-09-20 15:55:01',NULL,NULL,NULL),(78,54,54,'/shops-list','2018-09-20 15:55:21',NULL,NULL,NULL),(79,54,54,'/shops-list','2018-09-20 15:55:27',NULL,NULL,NULL),(80,54,54,'/shop-page/1','2018-09-20 15:56:57',NULL,NULL,NULL),(81,54,54,'/shops-list','2018-09-20 16:01:48',NULL,NULL,NULL),(82,54,54,'/shops-list','2018-09-20 16:01:52',NULL,NULL,NULL),(83,54,54,'/shop-page/1','2018-09-20 16:01:57',NULL,NULL,NULL),(84,54,54,'/shop-page/1','2018-09-20 16:07:52',NULL,NULL,NULL),(85,54,54,'/shop-page/1','2018-09-20 16:09:04',NULL,NULL,NULL),(86,54,54,'/shop-page/1','2018-09-20 16:09:05',NULL,NULL,NULL),(87,54,54,'/shop-page/1','2018-09-20 16:09:12',NULL,NULL,NULL),(88,54,54,'/shop-page/1','2018-09-20 16:09:31',NULL,NULL,NULL),(89,54,54,'/shop-page/1','2018-09-20 16:10:40',NULL,NULL,NULL),(90,54,54,'/shop-page/1','2018-09-20 16:11:52',NULL,NULL,NULL),(91,54,54,'/shop-page/1','2018-09-20 16:11:53',NULL,NULL,NULL),(92,54,54,'/shop-page/1','2018-09-20 16:12:01',NULL,NULL,NULL),(93,54,54,'/shop-page/1','2018-09-20 16:12:02',NULL,NULL,NULL),(94,54,54,'/shop-page/1','2018-09-20 16:12:42',NULL,NULL,NULL),(95,54,54,'/posts','2018-09-20 16:13:24',NULL,NULL,NULL),(96,54,54,'/reviews','2018-09-20 16:13:25',NULL,NULL,NULL),(97,54,54,'/shops-list','2018-09-20 16:13:27',NULL,NULL,NULL),(98,54,54,'/shop-page/2','2018-09-20 16:15:50',NULL,NULL,NULL),(99,54,54,'/shop-page/2','2018-09-20 16:15:54',NULL,NULL,NULL),(100,54,54,'/shop-page/2','2018-09-20 16:16:01',NULL,NULL,NULL),(101,54,54,'/shop-page/2','2018-09-20 16:17:23',NULL,NULL,NULL),(102,54,54,'/shops-list','2018-09-20 16:17:29',NULL,NULL,NULL),(103,54,54,'/shop-page/1','2018-09-20 16:17:33',NULL,NULL,NULL),(104,54,54,'/shop-page/1','2018-09-20 16:17:35',NULL,NULL,NULL),(105,54,54,'/shop-page/1','2018-09-20 16:17:56',NULL,NULL,NULL),(106,54,54,'/shops-list','2018-09-20 16:17:58',NULL,NULL,NULL),(107,54,54,'/shop-page/3','2018-09-20 16:18:01',NULL,NULL,NULL),(108,54,54,'/shop-page/3','2018-09-20 16:18:04',NULL,NULL,NULL),(109,54,54,'/shop-page/3','2018-09-20 16:19:24',NULL,NULL,NULL),(110,54,54,'/shop-page/3','2018-09-20 16:19:29',NULL,NULL,NULL),(111,54,54,'/shop-page/3','2018-09-20 16:20:42',NULL,NULL,NULL),(112,54,54,'/shop-page/3','2018-09-20 16:20:44',NULL,NULL,NULL),(113,54,54,'/shop-page/3','2018-09-20 16:20:49',NULL,NULL,NULL),(114,54,54,'/shop-page/3','2018-09-20 16:20:52',NULL,NULL,NULL),(115,54,54,'/shop-page/3','2018-09-20 16:23:13',NULL,NULL,NULL),(116,54,54,'/shop-page/3','2018-09-20 16:23:17',NULL,NULL,NULL),(117,54,54,'/shop-page/3','2018-09-20 16:23:19',NULL,NULL,NULL),(118,54,54,'/shop-page/3','2018-09-20 16:24:35',NULL,NULL,NULL),(119,54,54,'/shop-page/3','2018-09-20 16:24:41',NULL,NULL,NULL),(120,54,54,'/shop-page/3','2018-09-20 16:24:46',NULL,NULL,NULL),(121,54,54,'/shop-page/3','2018-09-20 16:24:50',NULL,NULL,NULL),(122,54,54,'/shops-list','2018-09-20 16:24:53',NULL,NULL,NULL),(123,54,54,'/shops-list','2018-09-20 16:25:21',NULL,NULL,NULL),(124,54,54,'/shops-list','2018-09-20 16:25:32',NULL,NULL,NULL),(125,54,54,'/shop-page/3','2018-09-20 16:25:47',NULL,NULL,NULL),(126,54,54,'/shops-list','2018-09-20 16:25:51',NULL,NULL,NULL),(127,54,54,'/history','2018-09-20 16:26:06',NULL,NULL,NULL),(128,54,54,'/polytics','2018-09-20 16:26:07',NULL,NULL,NULL),(129,54,54,'/shops-list','2018-09-20 16:26:08',NULL,NULL,NULL),(130,54,54,'/posts','2018-09-20 16:26:09',NULL,NULL,NULL),(131,54,54,'/reviews','2018-09-20 16:26:11',NULL,NULL,NULL),(132,54,54,'/honors','2018-09-20 16:26:12',NULL,NULL,NULL),(133,54,54,'/faq','2018-09-20 16:26:14',NULL,NULL,NULL),(134,54,54,'/vacancies','2018-09-20 16:26:15',NULL,NULL,NULL),(135,54,54,'/feedback','2018-09-20 16:26:17',NULL,NULL,NULL),(136,54,54,'/vacancies','2018-09-20 16:26:20',NULL,NULL,NULL),(137,54,54,'/faq','2018-09-20 16:26:21',NULL,NULL,NULL),(138,54,54,'/honors','2018-09-20 16:26:22',NULL,NULL,NULL),(139,54,54,'/reviews','2018-09-20 16:26:24',NULL,NULL,NULL),(140,54,54,'/posts','2018-09-20 16:26:26',NULL,NULL,NULL),(141,54,54,'/reviews','2018-09-20 16:26:34',NULL,NULL,NULL),(142,54,54,'/honors','2018-09-20 16:26:35',NULL,NULL,NULL),(143,54,54,'/reviews','2018-09-20 16:26:36',NULL,NULL,NULL),(144,54,54,'/reviews','2018-09-20 16:26:49',NULL,NULL,NULL),(145,54,54,'/reviews','2018-09-20 16:26:51',NULL,NULL,NULL),(146,54,54,'/reviews','2018-09-20 16:27:07',NULL,NULL,NULL),(147,54,54,'/reviews','2018-09-20 16:27:10',NULL,NULL,NULL),(148,54,54,'/honors','2018-09-20 16:27:15',NULL,NULL,NULL),(149,54,54,'/faq','2018-09-20 16:27:15',NULL,NULL,NULL),(150,54,54,'/vacancies','2018-09-20 16:27:16',NULL,NULL,NULL),(151,54,54,'/feedback','2018-09-20 16:27:17',NULL,NULL,NULL),(152,54,54,'/history','2018-09-20 16:27:19',NULL,NULL,NULL),(153,54,54,'/polytics','2018-09-20 16:27:20',NULL,NULL,NULL),(154,54,54,'/shops-list','2018-09-20 16:27:21',NULL,NULL,NULL),(155,54,54,'/posts','2018-09-20 16:27:21',NULL,NULL,NULL),(156,54,54,'/reviews','2018-09-20 16:27:22',NULL,NULL,NULL),(157,54,54,'/honors','2018-09-20 16:27:23',NULL,NULL,NULL),(158,54,54,'/faq','2018-09-20 16:27:24',NULL,NULL,NULL),(159,54,54,'/vacancies','2018-09-20 16:27:25',NULL,NULL,NULL),(160,54,54,'/company','2018-09-20 16:27:26',NULL,NULL,NULL),(161,54,54,'/store','2018-09-20 16:27:27',NULL,NULL,NULL),(162,54,54,'/shops-list','2018-09-20 16:27:45',NULL,NULL,NULL),(163,54,54,'/shops-list','2018-09-20 16:31:48',NULL,NULL,NULL),(164,54,54,'/','2018-09-20 16:31:51',NULL,NULL,NULL),(165,54,54,'/company','2018-09-20 16:31:54',NULL,NULL,NULL),(166,54,54,'/store','2018-09-20 16:31:55',NULL,NULL,NULL),(167,54,54,'/store-cat/2','2018-09-20 16:32:03',NULL,NULL,NULL),(168,54,54,'/store-cat/1','2018-09-20 16:32:11',NULL,NULL,NULL),(169,54,54,'/store-cat/1','2018-09-20 16:32:18',NULL,NULL,NULL),(170,54,54,'/store-cat/1','2018-09-20 16:32:26',NULL,NULL,NULL),(171,54,54,'/store-cat/2','2018-09-20 16:32:28',NULL,NULL,NULL),(172,54,54,'/store-cat/2','2018-09-20 16:32:29',NULL,NULL,NULL),(173,54,54,'/store-cat/2','2018-09-20 16:32:37',NULL,NULL,NULL),(174,54,54,'/store-cat/2','2018-09-20 16:32:39',NULL,NULL,NULL),(175,54,54,'/store-cat/1','2018-09-20 16:32:46',NULL,NULL,NULL),(176,54,54,'/store-cat/1','2018-09-20 16:32:59',NULL,NULL,NULL),(177,54,54,'/store-cat/1','2018-09-20 16:35:29',NULL,NULL,NULL),(178,54,54,'/reviews','2018-09-20 16:35:31',NULL,NULL,NULL),(179,54,54,'/shops-list','2018-09-20 16:35:33',NULL,NULL,NULL),(180,54,54,'/shops-list','2018-09-20 16:42:51',NULL,NULL,NULL),(181,54,54,'/shops-list','2018-09-20 16:47:42',NULL,NULL,NULL),(182,54,54,'/shops-list','2018-09-20 16:54:29',NULL,NULL,NULL),(183,54,54,'/shops-list','2018-09-20 16:54:40',NULL,NULL,NULL),(184,54,54,'/shops-list','2018-09-20 16:54:57',NULL,NULL,NULL),(185,54,54,'/shops-list','2018-09-20 16:55:11',NULL,NULL,NULL),(186,54,54,'/shops-list','2018-09-20 16:55:21',NULL,NULL,NULL),(187,54,54,'/shops-list','2018-09-20 16:56:03',NULL,NULL,NULL),(188,54,54,'/shops-list','2018-09-20 16:57:53',NULL,NULL,NULL),(189,54,54,'/shops-list','2018-09-20 16:58:14',NULL,NULL,NULL),(190,54,54,'/shops-list','2018-09-20 16:58:22',NULL,NULL,NULL),(191,54,54,'/reviews','2018-09-20 16:59:31',NULL,NULL,NULL),(192,54,54,'/reviews','2018-09-20 16:59:47',NULL,NULL,NULL),(193,54,54,'/reviews','2018-09-20 17:00:03',NULL,NULL,NULL),(194,54,54,'/reviews','2018-09-20 17:00:10',NULL,NULL,NULL),(195,54,54,'/reviews','2018-09-20 17:00:14',NULL,NULL,NULL),(196,54,54,'/faq','2018-09-20 17:00:26',NULL,NULL,NULL),(197,54,54,'/faq','2018-09-20 17:01:12',NULL,NULL,NULL),(198,54,54,'/shops-list','2018-09-20 17:03:22',NULL,NULL,NULL),(199,54,54,'/shops-list','2018-09-20 17:03:38',NULL,NULL,NULL),(200,54,54,'/shops-list','2018-09-20 17:11:41',NULL,NULL,NULL),(201,54,54,'/shops-list','2018-09-20 17:11:49',NULL,NULL,NULL),(202,54,54,'/shop-page/3','2018-09-20 17:14:00',NULL,NULL,NULL),(203,54,54,'/shop-page/2','2018-09-20 17:14:04',NULL,NULL,NULL),(204,54,54,'/shop-page/1','2018-09-20 17:14:07',NULL,NULL,NULL),(205,54,54,'/reviews','2018-09-20 17:14:10',NULL,NULL,NULL),(206,54,54,'/posts','2018-09-20 17:14:11',NULL,NULL,NULL),(207,54,54,'/history','2018-09-20 17:14:13',NULL,NULL,NULL),(208,54,54,'/polytics','2018-09-20 17:14:14',NULL,NULL,NULL),(209,54,54,'/honors','2018-09-20 17:14:16',NULL,NULL,NULL),(210,54,54,'/faq','2018-09-20 17:14:17',NULL,NULL,NULL),(211,54,54,'/vacancies','2018-09-20 17:14:18',NULL,NULL,NULL),(212,54,54,'/feedback','2018-09-20 17:14:19',NULL,NULL,NULL),(213,54,54,'/company','2018-09-20 17:14:22',NULL,NULL,NULL),(214,54,54,'/store-cat/1','2018-09-20 17:14:24',NULL,NULL,NULL),(215,54,54,'/shops-list','2018-09-20 17:16:36',NULL,NULL,NULL),(216,54,54,'/shops-list','2018-09-20 17:17:01',NULL,NULL,NULL),(217,54,54,'/shops-list','2018-09-20 17:17:09',NULL,NULL,NULL),(218,54,54,'/shops-list','2018-09-20 17:17:20',NULL,NULL,NULL),(219,54,54,'/shops-list','2018-09-20 17:18:38',NULL,NULL,NULL),(220,54,54,'/shops-list','2018-09-20 17:19:27',NULL,NULL,NULL),(221,54,54,'/shops-list','2018-09-20 17:20:08',NULL,NULL,NULL),(222,54,54,'/shop-page/3','2018-09-20 17:39:39',NULL,NULL,NULL),(223,54,54,'/shops-list','2018-09-20 17:39:47',NULL,NULL,NULL),(224,54,54,'/shops-list','2018-09-20 17:39:57',NULL,NULL,NULL),(225,54,54,'/shops-list','2018-09-20 17:40:16',NULL,NULL,NULL),(226,54,54,'/shops-list','2018-09-20 17:41:56',NULL,NULL,NULL),(227,54,54,'/history','2018-09-20 17:44:13',NULL,NULL,NULL),(228,54,54,'/history','2018-09-20 17:44:15',NULL,NULL,NULL),(229,54,54,'/history','2018-09-20 17:44:16',NULL,NULL,NULL),(230,54,54,'/history','2018-09-20 17:44:20',NULL,NULL,NULL),(231,54,54,'/history','2018-09-20 17:44:23',NULL,NULL,NULL),(232,54,54,'/history','2018-09-20 17:44:55',NULL,NULL,NULL),(233,54,54,'/polytics','2018-09-20 17:44:56',NULL,NULL,NULL),(234,54,54,'/polytics','2018-09-20 17:44:57',NULL,NULL,NULL),(235,54,54,'/polytics','2018-09-20 17:44:58',NULL,NULL,NULL),(236,54,54,'/polytics','2018-09-20 17:45:00',NULL,NULL,NULL),(237,54,54,'/polytics','2018-09-20 17:45:04',NULL,NULL,NULL),(238,54,54,'/polytics','2018-09-20 17:47:06',NULL,NULL,NULL),(239,54,54,'/shops-list','2018-09-20 17:47:09',NULL,NULL,NULL),(240,54,54,'/shop-page/1','2018-09-20 17:47:10',NULL,NULL,NULL),(241,54,54,'/shop-page/1','2018-09-20 17:47:12',NULL,NULL,NULL),(242,54,54,'/shop-page/1','2018-09-20 17:47:13',NULL,NULL,NULL),(243,54,54,'/shop-page/1','2018-09-20 17:47:17',NULL,NULL,NULL),(244,54,54,'/shop-page/1','2018-09-20 17:47:20',NULL,NULL,NULL),(245,54,54,'/shop-page/1','2018-09-20 17:47:21',NULL,NULL,NULL),(246,54,54,'/shops-list','2018-09-20 17:47:24',NULL,NULL,NULL),(247,54,54,'/polytics','2018-09-20 17:47:25',NULL,NULL,NULL),(248,54,54,'/history','2018-09-20 17:47:27',NULL,NULL,NULL),(249,54,54,'/shops-list','2018-09-20 17:47:28',NULL,NULL,NULL),(250,54,54,'/posts','2018-09-20 17:47:29',NULL,NULL,NULL),(251,54,54,'/posts','2018-09-20 17:47:30',NULL,NULL,NULL),(252,54,54,'/posts','2018-09-20 17:47:32',NULL,NULL,NULL),(253,54,54,'/posts','2018-09-20 17:47:34',NULL,NULL,NULL),(254,54,54,'/posts','2018-09-20 17:47:37',NULL,NULL,NULL),(255,54,54,'/posts','2018-09-20 17:47:37',NULL,NULL,NULL),(256,54,54,'/reviews','2018-09-20 17:49:48',NULL,NULL,NULL),(257,54,54,'/reviews','2018-09-20 17:49:50',NULL,NULL,NULL),(258,54,54,'/reviews','2018-09-20 17:49:52',NULL,NULL,NULL),(259,54,54,'/reviews','2018-09-20 17:49:55',NULL,NULL,NULL),(260,54,54,'/reviews','2018-09-20 17:50:03',NULL,NULL,NULL),(261,54,54,'/reviews','2018-09-20 17:50:05',NULL,NULL,NULL),(262,54,54,'/reviews','2018-09-20 17:50:07',NULL,NULL,NULL),(263,54,54,'/reviews','2018-09-20 17:50:07',NULL,NULL,NULL),(264,54,54,'/honors','2018-09-20 17:50:09',NULL,NULL,NULL),(265,54,54,'/reviews','2018-09-20 17:50:10',NULL,NULL,NULL),(266,54,54,'/honors','2018-09-20 17:50:18',NULL,NULL,NULL),(267,54,54,'/honors','2018-09-20 17:50:19',NULL,NULL,NULL),(268,54,54,'/honors','2018-09-20 17:50:21',NULL,NULL,NULL),(269,54,54,'/honors','2018-09-20 17:50:24',NULL,NULL,NULL),(270,54,54,'/honors','2018-09-20 17:50:26',NULL,NULL,NULL),(271,54,54,'/honors','2018-09-20 17:50:27',NULL,NULL,NULL),(272,54,54,'/faq','2018-09-20 17:50:29',NULL,NULL,NULL),(273,54,54,'/faq','2018-09-20 17:50:30',NULL,NULL,NULL),(274,54,54,'/faq','2018-09-20 17:50:31',NULL,NULL,NULL),(275,54,54,'/faq','2018-09-20 17:50:36',NULL,NULL,NULL),(276,54,54,'/faq','2018-09-20 17:50:38',NULL,NULL,NULL),(277,54,54,'/faq','2018-09-20 17:50:39',NULL,NULL,NULL),(278,54,54,'/reviews','2018-09-20 17:50:41',NULL,NULL,NULL),(279,54,54,'/posts','2018-09-20 17:50:43',NULL,NULL,NULL),(280,54,54,'/reviews','2018-09-20 17:50:45',NULL,NULL,NULL),(281,54,54,'/honors','2018-09-20 17:50:46',NULL,NULL,NULL),(282,54,54,'/faq','2018-09-20 17:50:48',NULL,NULL,NULL),(283,54,54,'/vacancies','2018-09-20 17:50:50',NULL,NULL,NULL),(284,54,54,'/vacancies','2018-09-20 17:50:51',NULL,NULL,NULL),(285,54,54,'/vacancies','2018-09-20 17:50:52',NULL,NULL,NULL),(286,54,54,'/vacancies','2018-09-20 17:50:55',NULL,NULL,NULL),(287,54,54,'/vacancies','2018-09-20 17:50:58',NULL,NULL,NULL),(288,54,54,'/vacancies','2018-09-20 17:50:59',NULL,NULL,NULL),(289,54,54,'/feedback','2018-09-20 17:51:01',NULL,NULL,NULL),(290,54,54,'/feedback','2018-09-20 17:51:02',NULL,NULL,NULL),(291,54,54,'/feedback','2018-09-20 17:51:03',NULL,NULL,NULL),(292,54,54,'/vacancies','2018-09-20 17:51:04',NULL,NULL,NULL),(293,54,54,'/faq','2018-09-20 17:51:05',NULL,NULL,NULL),(294,54,54,'/company','2018-09-20 17:51:06',NULL,NULL,NULL),(295,54,54,'/store','2018-09-20 17:51:07',NULL,NULL,NULL),(296,54,54,'/store-cat/1','2018-09-20 17:51:09',NULL,NULL,NULL),(297,54,54,'/store-cat/1','2018-09-20 17:51:10',NULL,NULL,NULL),(298,54,54,'/store-cat/1','2018-09-20 17:51:11',NULL,NULL,NULL),(299,54,54,'/store-cat/1','2018-09-20 17:51:15',NULL,NULL,NULL),(300,54,54,'/store-cat/1','2018-09-20 17:51:18',NULL,NULL,NULL),(301,54,54,'/store-cat/1','2018-09-20 17:51:21',NULL,NULL,NULL),(302,54,54,'/store-cat/1','2018-09-20 17:51:21',NULL,NULL,NULL),(303,54,54,'/store-cat/2','2018-09-20 17:51:24',NULL,NULL,NULL),(304,54,54,'/store-cat/3','2018-09-20 17:51:25',NULL,NULL,NULL),(305,54,54,'/store-cat/4','2018-09-20 17:51:26',NULL,NULL,NULL),(306,54,54,'/rituals','2018-09-20 17:51:40',NULL,NULL,NULL),(307,54,54,'/rituals','2018-09-20 17:51:42',NULL,NULL,NULL),(308,54,54,'/rituals','2018-09-20 17:51:43',NULL,NULL,NULL),(309,54,54,'/rituals','2018-09-20 17:51:46',NULL,NULL,NULL),(310,54,54,'/rituals','2018-09-20 17:51:48',NULL,NULL,NULL),(311,54,54,'/rituals','2018-09-20 17:51:52',NULL,NULL,NULL),(312,54,54,'/rituals','2018-09-20 17:51:58',NULL,NULL,NULL),(313,54,54,'/rituals','2018-09-20 17:51:59',NULL,NULL,NULL),(314,54,54,'/rituals','2018-09-20 17:52:09',NULL,NULL,NULL),(315,54,54,'/rituals','2018-09-20 17:53:14',NULL,NULL,NULL),(316,54,54,'/rituals','2018-09-20 17:53:15',NULL,NULL,NULL),(317,54,54,'/burial_search','2018-09-20 17:53:17',NULL,NULL,NULL),(318,54,54,'/memory_book','2018-09-20 17:53:18',NULL,NULL,NULL),(319,54,54,'/agents_old','2018-09-20 17:53:22',NULL,NULL,NULL),(320,54,54,'/burial_search','2018-09-20 17:53:24',NULL,NULL,NULL),(321,54,54,'/templates','2018-09-20 17:53:26',NULL,NULL,NULL),(322,54,54,'/tpl-empty','2018-09-20 17:53:27',NULL,NULL,NULL),(323,54,54,'/tpl-one','2018-09-20 17:53:28',NULL,NULL,NULL),(324,54,54,'/tpl-two','2018-09-20 17:53:29',NULL,NULL,NULL),(325,54,54,'/tpl-three','2018-09-20 17:53:31',NULL,NULL,NULL),(326,54,54,'/tpl-three','2018-09-20 17:53:33',NULL,NULL,NULL),(327,54,54,'/tpl-three','2018-09-20 17:53:34',NULL,NULL,NULL),(328,54,54,'/tpl-three','2018-09-20 17:53:36',NULL,NULL,NULL),(329,54,54,'/tpl-three','2018-09-20 17:53:40',NULL,NULL,NULL),(330,54,54,'/tpl-three','2018-09-20 17:53:41',NULL,NULL,NULL),(331,54,54,'/tpl-two','2018-09-20 17:53:43',NULL,NULL,NULL),(332,54,54,'/tpl-one','2018-09-20 17:53:44',NULL,NULL,NULL),(333,54,54,'/templates','2018-09-20 17:53:47',NULL,NULL,NULL),(334,54,54,'/templates','2018-09-20 17:53:53',NULL,NULL,NULL),(335,54,54,'/templates','2018-09-20 17:55:07',NULL,NULL,NULL),(336,54,54,'/templates','2018-09-20 17:56:12',NULL,NULL,NULL),(337,54,54,'/templates','2018-09-20 17:56:24',NULL,NULL,NULL),(338,54,54,'/templates','2018-09-20 17:56:25',NULL,NULL,NULL),(339,54,54,'/templates','2018-09-20 17:56:26',NULL,NULL,NULL),(340,54,54,'/templates','2018-09-20 17:56:27',NULL,NULL,NULL),(341,54,54,'/templates','2018-09-20 17:56:28',NULL,NULL,NULL),(342,54,54,'/templates','2018-09-20 17:56:29',NULL,NULL,NULL),(343,54,54,'/templates','2018-09-20 17:56:31',NULL,NULL,NULL),(344,54,54,'/templates','2018-09-20 17:56:32',NULL,NULL,NULL),(345,54,54,'/tpl-two','2018-09-20 17:56:34',NULL,NULL,NULL),(346,54,54,'/tpl-three','2018-09-20 17:56:35',NULL,NULL,NULL),(347,54,54,'/','2018-09-20 17:56:37',NULL,NULL,NULL),(348,54,54,'/company','2018-09-20 17:56:37',NULL,NULL,NULL),(349,54,54,'/store','2018-09-20 17:56:38',NULL,NULL,NULL),(350,54,54,'/store','2018-09-20 18:00:14',NULL,NULL,NULL),(351,54,54,'/store-cat/1','2018-09-20 18:00:15',NULL,NULL,NULL),(352,54,54,'/store-cat/1','2018-09-20 18:00:19',NULL,NULL,NULL),(353,54,54,'/store-cat/1','2018-09-20 18:00:24',NULL,NULL,NULL),(354,54,54,'/store-cat/1','2018-09-20 18:00:32',NULL,NULL,NULL),(355,54,54,'/store-cat/1','2018-09-20 18:00:33',NULL,NULL,NULL),(356,54,54,'/product/1','2018-09-20 18:00:35',NULL,NULL,NULL),(357,54,54,'/store-cat/1','2018-09-20 18:01:47',NULL,NULL,NULL),(358,54,54,'/store-cat/2','2018-09-20 18:01:49',NULL,NULL,NULL),(359,54,54,'/store-cat/3','2018-09-20 18:01:50',NULL,NULL,NULL),(360,54,54,'/store-cat/4','2018-09-20 18:01:51',NULL,NULL,NULL),(361,54,54,'/store-cat/1','2018-09-20 18:01:52',NULL,NULL,NULL),(362,54,54,'/store-cat/2','2018-09-20 18:01:52',NULL,NULL,NULL),(363,54,54,'/store-cat/5','2018-09-20 18:01:53',NULL,NULL,NULL),(364,54,54,'/store','2018-09-20 18:03:21',NULL,NULL,NULL),(365,54,54,'/shops-list','2018-09-20 18:03:26',NULL,NULL,NULL),(366,54,54,'/company','2018-09-20 18:03:29',NULL,NULL,NULL),(367,54,54,'/store','2018-09-20 18:03:31',NULL,NULL,NULL),(368,54,54,'/store-cat/2','2018-09-21 09:36:18',NULL,NULL,NULL),(369,54,54,'/store-cat/1','2018-09-21 09:40:06',NULL,NULL,NULL),(370,54,54,'/product/1','2018-09-21 09:40:25',NULL,NULL,NULL),(371,54,54,'/admin','2018-09-21 09:40:40',NULL,NULL,NULL),(372,54,54,'/admin-routes','2018-09-21 09:40:43',NULL,NULL,NULL),(373,54,54,'/admin-routes','2018-09-21 09:41:15',NULL,NULL,NULL),(374,54,54,'/store-cat/1','2018-09-21 09:42:19',NULL,NULL,NULL),(375,54,54,'/store-pos/1','2018-09-21 09:42:21',NULL,NULL,NULL),(376,54,54,'/store-pos/1','2018-09-21 09:42:24',NULL,NULL,NULL),(377,54,54,'/store-pos/1','2018-09-21 09:42:25',NULL,NULL,NULL),(378,54,54,'/store-pos/1','2018-09-21 09:42:27',NULL,NULL,NULL),(379,54,54,'/store-pos/1','2018-09-21 09:42:31',NULL,NULL,NULL),(380,54,54,'/store-pos/1','2018-09-21 09:42:35',NULL,NULL,NULL),(381,54,54,'/store-pos/1','2018-09-21 09:42:36',NULL,NULL,NULL),(382,54,54,'/store-pos/1','2018-09-21 09:42:45',NULL,NULL,NULL),(383,54,54,'/store-pos/1','2018-09-21 09:42:47',NULL,NULL,NULL),(384,54,54,'/store-pos/1','2018-09-21 09:42:50',NULL,NULL,NULL),(385,54,54,'/store-pos/1','2018-09-21 09:42:52',NULL,NULL,NULL),(386,54,54,'/store-pos/1','2018-09-21 09:42:54',NULL,NULL,NULL),(387,54,54,'/store-pos/1','2018-09-21 09:43:02',NULL,NULL,NULL),(388,54,54,'/','2018-09-21 09:43:08',NULL,NULL,NULL),(389,54,54,'/company','2018-09-21 09:43:12',NULL,NULL,NULL),(390,54,54,'/history','2018-09-21 09:43:13',NULL,NULL,NULL),(391,54,54,'/polytics','2018-09-21 09:43:14',NULL,NULL,NULL),(392,54,54,'/shops-list','2018-09-21 09:43:15',NULL,NULL,NULL),(393,54,54,'/posts','2018-09-21 09:43:16',NULL,NULL,NULL),(394,54,54,'/shops-list','2018-09-21 09:43:17',NULL,NULL,NULL),(395,54,54,'/shop-page/2','2018-09-21 09:43:22',NULL,NULL,NULL),(396,54,54,'/posts','2018-09-21 09:43:35',NULL,NULL,NULL),(397,54,54,'/shops-list','2018-09-21 09:49:26',NULL,NULL,NULL),(398,54,54,'/company','2018-09-21 10:06:31',NULL,NULL,NULL),(399,54,54,'/store','2018-09-21 10:11:53',NULL,NULL,NULL),(400,54,54,'/store-cat/2','2018-09-21 10:11:56',NULL,NULL,NULL),(401,54,54,'/store-cat/1','2018-09-21 10:11:58',NULL,NULL,NULL),(402,54,54,'/store-pos/1','2018-09-21 10:12:00',NULL,NULL,NULL),(403,54,54,'/store-pos/1','2018-09-21 10:12:05',NULL,NULL,NULL),(404,54,54,'/store-pos/1','2018-09-21 10:16:53',NULL,NULL,NULL),(405,54,54,'/store-pos/1','2018-09-21 10:16:57',NULL,NULL,NULL),(406,54,54,'/store-pos/1','2018-09-21 10:17:16',NULL,NULL,NULL),(407,54,54,'/store-pos/1','2018-09-21 10:17:20',NULL,NULL,NULL),(408,54,54,'/store-pos/1','2018-09-21 10:17:48',NULL,NULL,NULL),(409,54,54,'/shop-categories/1','2018-09-21 10:17:55',NULL,NULL,NULL),(410,54,54,'/store-pos/1','2018-09-21 10:24:08',NULL,NULL,NULL),(411,54,54,'/store-pos/1','2018-09-21 10:24:17',NULL,NULL,NULL),(412,54,54,'/store-pos/1','2018-09-21 10:24:25',NULL,NULL,NULL),(413,54,54,'/store-pos/1','2018-09-21 10:24:33',NULL,NULL,NULL),(414,54,54,'/store-pos/1','2018-09-21 10:25:13',NULL,NULL,NULL),(415,54,54,'/','2018-09-21 10:25:21',NULL,NULL,NULL),(416,54,54,'/shops-list','2018-09-21 10:25:31',NULL,NULL,NULL),(417,54,54,'/posts','2018-09-21 10:25:34',NULL,NULL,NULL),(418,54,54,'/store','2018-09-21 10:28:54',NULL,NULL,NULL),(419,54,54,'/','2018-09-21 10:34:47',NULL,NULL,NULL),(420,2,2,'/','2018-09-24 10:15:56',NULL,NULL,NULL),(421,2,2,'/company','2018-09-24 10:16:02',NULL,NULL,NULL),(422,2,2,'/company','2018-09-24 10:16:55',NULL,NULL,NULL),(423,2,2,'/company','2018-09-24 10:17:39',NULL,NULL,NULL),(424,2,2,'/company','2018-09-24 10:18:33',NULL,NULL,NULL),(425,2,2,'/reviews','2018-09-24 10:19:14',NULL,NULL,NULL),(426,2,2,'/reviews','2018-09-24 10:19:57',NULL,NULL,NULL),(427,2,2,'/reviews','2018-09-24 10:21:19',NULL,NULL,NULL),(428,2,2,'/reviews','2018-09-24 10:21:37',NULL,NULL,NULL),(429,2,2,'/reviews','2018-09-24 10:22:12',NULL,NULL,NULL),(430,2,2,'/reviews','2018-09-24 10:22:18',NULL,NULL,NULL),(431,2,2,'/reviews','2018-09-24 10:22:34',NULL,NULL,NULL),(432,2,2,'/reviews','2018-09-24 10:22:54',NULL,NULL,NULL),(433,2,2,'/reviews','2018-09-24 10:23:10',NULL,NULL,NULL),(434,2,2,'/reviews','2018-09-24 10:23:17',NULL,NULL,NULL),(435,2,2,'/reviews','2018-09-24 10:23:18',NULL,NULL,NULL),(436,2,2,'/reviews','2018-09-24 10:23:18',NULL,NULL,NULL),(437,2,2,'/reviews','2018-09-24 10:23:18',NULL,NULL,NULL),(438,2,2,'/reviews','2018-09-24 10:23:19',NULL,NULL,NULL),(439,2,2,'/reviews','2018-09-24 10:23:41',NULL,NULL,NULL),(440,2,2,'/reviews','2018-09-24 10:24:14',NULL,NULL,NULL),(441,2,2,'/reviews','2018-09-24 10:24:20',NULL,NULL,NULL),(442,2,2,'/reviews','2018-09-24 10:24:25',NULL,NULL,NULL),(443,2,2,'/reviews','2018-09-24 10:24:33',NULL,NULL,NULL),(444,2,2,'/reviews','2018-09-24 10:24:36',NULL,NULL,NULL),(445,2,2,'/reviews','2018-09-24 10:24:36',NULL,NULL,NULL),(446,2,2,'/reviews','2018-09-24 10:24:37',NULL,NULL,NULL),(447,2,2,'/honors','2018-09-24 10:24:40',NULL,NULL,NULL),(448,2,2,'/history','2018-09-24 10:24:41',NULL,NULL,NULL),(449,2,2,'/polytics','2018-09-24 10:24:42',NULL,NULL,NULL),(450,2,2,'/','2018-09-24 10:24:43',NULL,NULL,NULL),(451,2,2,'/company','2018-09-24 10:24:52',NULL,NULL,NULL),(452,2,2,'/store','2018-09-24 10:24:53',NULL,NULL,NULL),(453,2,2,'/rituals','2018-09-24 10:24:54',NULL,NULL,NULL),(454,2,2,'/templates','2018-09-24 10:24:55',NULL,NULL,NULL),(455,2,2,'/tpl-one','2018-09-24 10:24:57',NULL,NULL,NULL),(456,2,2,'/tpl-three','2018-09-24 10:25:00',NULL,NULL,NULL),(457,2,2,'/store','2018-09-24 10:25:01',NULL,NULL,NULL),(458,2,2,'/shops-list','2018-09-24 10:25:03',NULL,NULL,NULL),(459,2,2,'/shops-list','2018-09-24 10:25:09',NULL,NULL,NULL),(460,2,2,'/history','2018-09-24 10:25:12',NULL,NULL,NULL),(461,2,2,'/','2018-09-24 10:25:13',NULL,NULL,NULL),(462,2,2,'/tpl-empty','2018-09-24 10:25:20',NULL,NULL,NULL),(463,2,2,'/tpl-one','2018-09-24 10:25:23',NULL,NULL,NULL),(464,2,2,'/store','2018-09-24 10:25:24',NULL,NULL,NULL),(465,2,2,'/polytics','2018-09-24 10:25:31',NULL,NULL,NULL),(466,2,2,'/posts','2018-09-24 10:25:34',NULL,NULL,NULL),(467,2,2,'/company','2018-09-24 10:25:42',NULL,NULL,NULL),(468,2,2,'/templates','2018-09-24 10:25:43',NULL,NULL,NULL),(469,2,2,'/tpl-one','2018-09-24 10:25:44',NULL,NULL,NULL),(470,2,2,'/tpl-empty','2018-09-24 10:25:48',NULL,NULL,NULL),(471,2,2,'/','2018-09-24 10:25:49',NULL,NULL,NULL),(472,2,2,'/faq','2018-09-24 10:26:23',NULL,NULL,NULL),(473,2,2,'/history','2018-09-24 10:26:26',NULL,NULL,NULL),(474,2,2,'/polytics','2018-09-24 10:26:27',NULL,NULL,NULL),(475,2,2,'/shops-list','2018-09-24 10:26:28',NULL,NULL,NULL),(476,2,2,'/faq','2018-09-24 10:26:29',NULL,NULL,NULL),(477,2,2,'/feedback','2018-09-24 10:26:32',NULL,NULL,NULL),(478,2,2,'/history','2018-09-24 10:26:34',NULL,NULL,NULL),(479,2,2,'/shops-list','2018-09-24 10:26:36',NULL,NULL,NULL),(480,2,2,'/faq','2018-09-24 10:26:38',NULL,NULL,NULL),(481,2,2,'/history','2018-09-24 10:26:40',NULL,NULL,NULL),(482,2,2,'/faq','2018-09-24 10:26:42',NULL,NULL,NULL),(483,2,2,'/vacancies','2018-09-24 10:26:44',NULL,NULL,NULL),(484,2,2,'/feedback','2018-09-24 10:26:46',NULL,NULL,NULL),(485,2,2,'/vacancies','2018-09-24 10:26:48',NULL,NULL,NULL),(486,2,2,'/faq','2018-09-24 10:26:49',NULL,NULL,NULL),(487,2,2,'/templates','2018-09-24 10:26:53',NULL,NULL,NULL),(488,2,2,'/posts','2018-09-24 10:26:55',NULL,NULL,NULL),(489,2,2,'/posts','2018-09-24 10:27:00',NULL,NULL,NULL),(490,2,2,'/posts','2018-09-24 10:27:01',NULL,NULL,NULL),(491,2,2,'/posts','2018-09-24 10:27:02',NULL,NULL,NULL),(492,2,2,'/feedback','2018-09-24 10:27:07',NULL,NULL,NULL),(493,2,2,'/feedback','2018-09-24 10:27:23',NULL,NULL,NULL),(494,2,2,'/feedback','2018-09-24 10:27:24',NULL,NULL,NULL),(495,2,2,'/feedback','2018-09-24 10:27:34',NULL,NULL,NULL),(496,2,2,'/history','2018-09-24 10:27:38',NULL,NULL,NULL),(497,2,2,'/history','2018-09-24 10:27:45',NULL,NULL,NULL),(498,2,2,'/history','2018-09-24 10:27:46',NULL,NULL,NULL),(499,2,2,'/history','2018-09-24 10:27:48',NULL,NULL,NULL),(500,2,2,'/shops-list','2018-09-24 10:28:12',NULL,NULL,NULL),(501,2,2,'/posts','2018-09-24 10:28:12',NULL,NULL,NULL),(502,2,2,'/reviews','2018-09-24 10:28:13',NULL,NULL,NULL),(503,2,2,'/honors','2018-09-24 10:28:14',NULL,NULL,NULL),(504,2,2,'/honors','2018-09-24 10:28:26',NULL,NULL,NULL),(505,2,2,'/honors','2018-09-24 10:28:47',NULL,NULL,NULL),(506,2,2,'/reviews','2018-09-24 10:28:55',NULL,NULL,NULL),(507,2,2,'/shops-list','2018-09-24 10:28:56',NULL,NULL,NULL),(508,2,2,'/polytics','2018-09-24 10:28:57',NULL,NULL,NULL),(509,2,2,'/store','2018-09-24 10:28:58',NULL,NULL,NULL),(510,2,2,'/rituals','2018-09-24 10:28:59',NULL,NULL,NULL),(511,2,2,'/templates','2018-09-24 10:29:00',NULL,NULL,NULL),(512,2,2,'/','2018-09-24 10:29:01',NULL,NULL,NULL),(513,2,2,'/company','2018-09-24 10:29:13',NULL,NULL,NULL),(514,2,2,'/store','2018-09-24 10:29:14',NULL,NULL,NULL),(515,2,2,'/rituals','2018-09-24 10:29:15',NULL,NULL,NULL),(516,2,2,'/templates','2018-09-24 10:29:16',NULL,NULL,NULL),(517,2,2,'/','2018-09-24 10:29:18',NULL,NULL,NULL),(518,2,2,'/store','2018-09-24 10:29:18',NULL,NULL,NULL),(519,2,2,'/admin','2018-09-24 10:32:58',NULL,NULL,NULL),(520,2,2,'/admin-components','2018-09-24 10:33:01',NULL,NULL,NULL),(521,2,2,'/admin-attendance','2018-09-24 10:33:13',NULL,NULL,NULL),(522,2,2,'/admin-clients','2018-09-24 10:33:14',NULL,NULL,NULL),(523,2,2,'/admin-routes','2018-09-24 10:33:16',NULL,NULL,NULL),(524,2,2,'/admin-routes','2018-09-24 10:33:51',NULL,NULL,NULL),(525,2,2,'/admin-routes','2018-09-24 10:34:00',NULL,NULL,NULL),(526,2,2,'/admin-routes','2018-09-24 10:35:15',NULL,NULL,NULL),(527,2,2,'/admin-clients','2018-09-24 10:35:21',NULL,NULL,NULL),(528,2,2,'/admin-attendance','2018-09-24 10:35:22',NULL,NULL,NULL),(529,2,2,'/admin-routes','2018-09-24 10:35:23',NULL,NULL,NULL),(530,2,2,'/admin-globals','2018-09-24 10:35:25',NULL,NULL,NULL),(531,2,2,'/admin-feedback','2018-09-24 10:35:26',NULL,NULL,NULL),(532,2,2,'/admin-routes','2018-09-24 10:35:29',NULL,NULL,NULL),(533,2,2,'/store','2018-09-24 10:35:30',NULL,NULL,NULL),(534,2,2,'/company','2018-09-24 10:35:35',NULL,NULL,NULL),(535,2,2,'/feedback','2018-09-24 10:35:37',NULL,NULL,NULL),(536,2,2,'/','2018-09-24 10:35:39',NULL,NULL,NULL),(537,2,2,'/','2018-09-24 10:35:41',NULL,NULL,NULL),(538,2,2,'/','2018-09-24 10:35:43',NULL,NULL,NULL),(539,1,1,'/','2018-09-27 13:04:19',NULL,NULL,NULL),(540,1,1,'/login','2018-09-27 13:04:26',NULL,NULL,NULL),(541,1,1,'/','2018-09-27 13:04:32',NULL,NULL,NULL),(542,1,1,'/company','2018-09-27 13:04:35',NULL,NULL,NULL),(543,1,1,'/history','2018-09-27 13:05:07',NULL,NULL,NULL),(544,1,1,'/history','2018-09-27 13:06:29',NULL,NULL,NULL),(545,1,1,'/history','2018-09-27 13:06:35',NULL,NULL,NULL),(546,1,1,'/history','2018-09-27 13:06:37',NULL,NULL,NULL),(547,1,1,'/history','2018-09-27 13:06:43',NULL,NULL,NULL),(548,1,1,'/history','2018-09-27 13:06:51',NULL,NULL,NULL),(549,1,1,'/history','2018-09-27 13:11:40',NULL,NULL,NULL),(550,1,1,'/history','2018-09-27 13:11:44',NULL,NULL,NULL),(551,1,1,'/uploads/upload_3567a312aec44256a029443bfcb4e69f.gif','2018-09-27 13:11:46',NULL,NULL,NULL),(552,1,1,'/uploads/upload_3567a312aec44256a029443bfcb4e69f.gif','2018-09-27 13:11:49',NULL,NULL,NULL),(553,1,1,'/uploads/upload_3567a312aec44256a029443bfcb4e69f.gif','2018-09-27 18:00:02',NULL,NULL,NULL),(554,1,1,'/uploads/upload_3567a312aec44256a029443bfcb4e69f.gif','2018-09-27 18:00:03',NULL,NULL,NULL),(555,1,1,'/uploads/upload_3567a312aec44256a029443bfcb4e69f.gif','2018-09-27 18:00:09',NULL,NULL,NULL),(556,1,1,'/uploads/upload_3567a312aec44256a029443bfcb4e69f.gif','2018-09-27 18:00:14',NULL,NULL,NULL),(557,1,1,'/history','2018-09-27 18:02:12',NULL,NULL,NULL),(558,1,1,'/uploads/upload_3567a312aec44256a029443bfcb4e69f.gif','2018-09-27 18:02:13',NULL,NULL,NULL),(559,1,1,'/history','2018-09-27 18:02:13',NULL,NULL,NULL),(560,1,1,'/uploads/upload_3567a312aec44256a029443bfcb4e69f.gif','2018-09-27 18:02:13',NULL,NULL,NULL),(561,1,1,'/uploads/upload_3567a312aec44256a029443bfcb4e69f.gif','2018-09-27 18:02:16',NULL,NULL,NULL),(562,1,1,'/history','2018-09-27 18:02:28',NULL,NULL,NULL),(563,1,1,'/uploads/upload_3567a312aec44256a029443bfcb4e69f.gif','2018-09-27 18:02:28',NULL,NULL,NULL),(564,1,1,'/uploads/upload_3567a312aec44256a029443bfcb4e69f.gif','2018-09-27 18:02:32',NULL,NULL,NULL),(565,1,1,'/history','2018-09-27 18:03:37',NULL,NULL,NULL),(566,1,1,'/uploads/upload_3567a312aec44256a029443bfcb4e69f.gif','2018-09-27 18:03:40',NULL,NULL,NULL),(567,1,1,'/uploads/upload_3567a312aec44256a029443bfcb4e69f.gif','2018-09-27 18:03:43',NULL,NULL,NULL),(568,1,1,'/uploads/upload_3567a312aec44256a029443bfcb4e69f.gif','2018-09-27 18:06:29',NULL,NULL,NULL),(569,1,1,'/uploads/upload_3567a312aec44256a029443bfcb4e69f.gif','2018-09-27 18:06:32',NULL,NULL,NULL),(570,1,1,'/uploads/upload_3567a312aec44256a029443bfcb4e69f.gif','2018-09-27 18:11:41',NULL,NULL,NULL),(571,1,1,'/uploads/upload_3567a312aec44256a029443bfcb4e69f.gif','2018-09-27 18:11:42',NULL,NULL,NULL),(572,1,1,'/history','2018-09-27 18:18:54',NULL,NULL,NULL),(573,1,1,'/reviews','2018-09-27 18:20:24',NULL,NULL,NULL),(574,1,1,'/company','2018-09-27 18:20:44',NULL,NULL,NULL),(575,1,1,'/honors','2018-09-27 18:20:47',NULL,NULL,NULL),(576,1,1,'/honors','2018-09-27 18:20:51',NULL,NULL,NULL),(577,1,1,'/reviews','2018-09-27 18:20:54',NULL,NULL,NULL),(578,1,1,'/posts','2018-09-27 18:20:56',NULL,NULL,NULL),(579,1,1,'/shops-list','2018-09-27 18:20:56',NULL,NULL,NULL),(580,1,1,'/faq','2018-09-27 18:21:02',NULL,NULL,NULL),(581,1,1,'/faq','2018-09-27 18:21:04',NULL,NULL,NULL),(582,1,1,'/vacancies','2018-09-27 18:21:05',NULL,NULL,NULL),(583,1,1,'/feedback','2018-09-27 18:21:06',NULL,NULL,NULL),(584,1,1,'/vacancies','2018-09-27 18:21:07',NULL,NULL,NULL),(585,1,1,'/store-cat/1','2018-09-27 18:21:11',NULL,NULL,NULL),(586,1,1,'/store-cat/2','2018-09-27 18:21:13',NULL,NULL,NULL),(587,1,1,'/store-cat/3','2018-09-27 18:21:14',NULL,NULL,NULL),(588,1,1,'/company','2018-09-27 18:28:26',NULL,NULL,NULL),(589,1,1,'/history','2018-09-27 18:28:29',NULL,NULL,NULL),(590,1,1,'/shops-list','2018-09-27 18:28:41',NULL,NULL,NULL),(591,1,1,'/polytics','2018-09-27 18:28:43',NULL,NULL,NULL),(592,1,1,'/posts','2018-09-27 18:28:45',NULL,NULL,NULL),(593,1,1,'/reviews','2018-09-27 18:28:48',NULL,NULL,NULL),(594,1,1,'/honors','2018-09-27 18:28:49',NULL,NULL,NULL),(595,1,1,'/faq','2018-09-27 18:28:51',NULL,NULL,NULL),(596,1,1,'/vacancies','2018-09-27 18:28:53',NULL,NULL,NULL),(597,1,1,'/faq','2018-09-27 18:28:56',NULL,NULL,NULL),(598,1,1,'/vacancies','2018-09-27 18:29:26',NULL,NULL,NULL),(599,1,1,'/feedback','2018-09-27 18:29:41',NULL,NULL,NULL),(600,1,1,'/vacancies','2018-09-27 18:29:49',NULL,NULL,NULL),(601,1,1,'/faq','2018-09-27 18:29:52',NULL,NULL,NULL),(602,1,1,'/reviews','2018-09-27 18:29:53',NULL,NULL,NULL),(603,1,1,'/reviews','2018-09-27 18:29:55',NULL,NULL,NULL),(604,1,1,'/posts','2018-09-27 18:29:56',NULL,NULL,NULL),(605,1,1,'/shops-list','2018-09-27 18:29:57',NULL,NULL,NULL),(606,1,1,'/history','2018-09-27 18:29:58',NULL,NULL,NULL),(607,1,1,'/polytics','2018-09-27 18:30:00',NULL,NULL,NULL),(608,1,1,'/polytics','2018-09-27 18:30:42',NULL,NULL,NULL),(609,1,1,'/polytics','2018-09-27 18:35:46',NULL,NULL,NULL),(610,1,1,'/polytics','2018-09-27 18:35:49',NULL,NULL,NULL),(611,1,1,'/store','2018-09-27 18:36:19',NULL,NULL,NULL),(612,1,1,'/store','2018-09-27 18:36:42',NULL,NULL,NULL),(613,1,1,'/store','2018-09-27 18:41:35',NULL,NULL,NULL),(614,1,1,'/company','2018-09-27 18:42:18',NULL,NULL,NULL),(615,1,1,'/store-cat/7','2018-09-27 18:42:27',NULL,NULL,NULL),(616,1,1,'/company','2018-09-27 18:42:29',NULL,NULL,NULL),(617,1,1,'/company','2018-09-27 18:45:48',NULL,NULL,NULL),(618,1,1,'/company','2018-09-27 18:45:49',NULL,NULL,NULL),(619,1,1,'/company','2018-09-27 18:45:53',NULL,NULL,NULL),(620,1,1,'/company','2018-09-27 18:46:50',NULL,NULL,NULL),(621,1,1,'/store','2018-09-27 18:46:56',NULL,NULL,NULL),(622,1,1,'/store','2018-09-27 18:46:58',NULL,NULL,NULL),(623,1,1,'/store','2018-09-27 18:54:13',NULL,NULL,NULL),(624,1,1,'/store','2018-09-27 18:54:35',NULL,NULL,NULL),(625,1,1,'/store','2018-09-27 19:00:38',NULL,NULL,NULL),(626,1,1,'/store','2018-09-27 19:00:49',NULL,NULL,NULL),(627,1,1,'/store','2018-09-27 19:01:03',NULL,NULL,NULL),(628,1,1,'/store','2018-09-27 19:01:06',NULL,NULL,NULL),(629,1,1,'/store','2018-09-27 19:01:22',NULL,NULL,NULL),(630,1,1,'/store','2018-09-27 19:02:03',NULL,NULL,NULL),(631,1,1,'/store','2018-09-27 19:02:49',NULL,NULL,NULL),(632,1,1,'/store','2018-09-27 19:03:17',NULL,NULL,NULL),(633,1,1,'/store','2018-09-27 19:04:27',NULL,NULL,NULL),(634,1,1,'/crm-connect','2018-09-27 19:04:37',NULL,NULL,NULL),(635,1,1,'/admin','2018-09-27 19:04:40',NULL,NULL,NULL),(636,1,1,'/admin-routes','2018-09-27 19:04:45',NULL,NULL,NULL),(637,1,1,'/admin-routes','2018-09-27 19:04:48',NULL,NULL,NULL),(638,1,1,'/admin-routes','2018-09-27 19:05:06',NULL,NULL,NULL),(639,1,1,'/admin-routes','2018-09-28 04:16:40',NULL,NULL,NULL),(640,1,1,'/admin-routes','2018-09-28 04:16:49',NULL,NULL,NULL),(641,1,1,'/admin-routes','2018-09-28 04:17:24',NULL,NULL,NULL),(642,1,1,'/','2018-09-28 04:29:32',NULL,NULL,NULL),(643,1,1,'/store','2018-09-28 04:29:37',NULL,NULL,NULL),(644,1,1,'/store','2018-09-28 04:30:02',NULL,NULL,NULL),(645,1,1,'/crm-connect','2018-09-28 04:30:05',NULL,NULL,NULL),(646,1,1,'/store','2018-09-28 04:30:19',NULL,NULL,NULL),(647,1,1,'/store','2018-09-28 04:30:29',NULL,NULL,NULL),(648,1,1,'/store','2018-09-28 04:30:33',NULL,NULL,NULL),(649,1,1,'/store','2018-09-28 04:30:33',NULL,NULL,NULL),(650,1,1,'/store','2018-09-28 04:30:33',NULL,NULL,NULL),(651,1,1,'/store','2018-09-28 04:30:33',NULL,NULL,NULL),(652,1,1,'/store','2018-09-28 04:30:33',NULL,NULL,NULL),(653,1,1,'/store','2018-09-28 04:30:44',NULL,NULL,NULL),(654,1,1,'/store','2018-09-28 04:31:00',NULL,NULL,NULL),(655,1,1,'/crm-connect','2018-09-28 04:31:05',NULL,NULL,NULL),(656,1,1,'/store','2018-09-28 04:31:45',NULL,NULL,NULL),(657,1,1,'/store','2018-09-28 04:33:07',NULL,NULL,NULL),(658,1,1,'/store','2018-09-28 04:33:36',NULL,NULL,NULL),(659,1,1,'/store','2018-09-28 04:34:29',NULL,NULL,NULL),(660,1,1,'/store','2018-09-28 04:34:35',NULL,NULL,NULL),(661,1,1,'/store','2018-09-28 04:36:00',NULL,NULL,NULL),(662,1,1,'/store','2018-09-28 04:36:37',NULL,NULL,NULL),(663,1,1,'/store','2018-09-28 04:36:45',NULL,NULL,NULL),(664,1,1,'/store','2018-09-28 04:37:26',NULL,NULL,NULL),(665,1,1,'/history','2018-09-28 04:39:00',NULL,NULL,NULL),(666,1,1,'/history','2018-09-28 04:39:19',NULL,NULL,NULL),(667,1,1,'/history','2018-09-28 04:39:21',NULL,NULL,NULL),(668,1,1,'/history','2018-09-28 04:39:23',NULL,NULL,NULL),(669,1,1,'/history','2018-09-28 04:39:24',NULL,NULL,NULL),(670,1,1,'/history','2018-09-28 04:39:26',NULL,NULL,NULL),(671,1,1,'/polytics','2018-09-28 04:39:28',NULL,NULL,NULL),(672,1,1,'/history','2018-09-28 04:39:29',NULL,NULL,NULL),(673,1,1,'/shops-list','2018-09-28 04:39:30',NULL,NULL,NULL),(674,1,1,'/posts','2018-09-28 04:39:32',NULL,NULL,NULL),(675,1,1,'/reviews','2018-09-28 04:39:33',NULL,NULL,NULL),(676,1,1,'/honors','2018-09-28 04:39:34',NULL,NULL,NULL),(677,1,1,'/faq','2018-09-28 04:39:35',NULL,NULL,NULL),(678,1,1,'/honors','2018-09-28 04:39:37',NULL,NULL,NULL),(679,1,1,'/faq','2018-09-28 04:39:38',NULL,NULL,NULL),(680,1,1,'/vacancies','2018-09-28 04:39:40',NULL,NULL,NULL),(681,1,1,'/feedback','2018-09-28 04:39:41',NULL,NULL,NULL),(682,1,1,'/faq','2018-09-28 04:39:42',NULL,NULL,NULL),(683,1,1,'/admin','2018-09-28 04:39:49',NULL,NULL,NULL),(684,1,1,'/admin-routes','2018-09-28 04:39:51',NULL,NULL,NULL),(685,1,1,'/admin-clients','2018-09-28 04:41:41',NULL,NULL,NULL),(686,1,1,'/admin-attendance','2018-09-28 04:41:42',NULL,NULL,NULL),(687,1,1,'/admin-components','2018-09-28 04:41:44',NULL,NULL,NULL),(688,1,1,'/admin-globals','2018-09-28 04:41:46',NULL,NULL,NULL),(689,1,1,'/admin-feedback','2018-09-28 04:41:47',NULL,NULL,NULL),(690,1,1,'/admin-components','2018-09-28 04:41:48',NULL,NULL,NULL),(691,1,1,'/admin-components','2018-09-28 04:41:55',NULL,NULL,NULL),(692,1,1,'/admin-components','2018-09-28 04:41:58',NULL,NULL,NULL),(693,1,1,'/store','2018-09-28 04:42:27',NULL,NULL,NULL),(694,1,1,'/crm-connect','2018-09-28 04:42:29',NULL,NULL,NULL),(695,1,1,'/admin','2018-09-28 04:43:16',NULL,NULL,NULL),(696,1,1,'/admin-routes','2018-09-28 04:43:19',NULL,NULL,NULL),(697,1,1,'/crm-connect','2018-09-28 04:44:15',NULL,NULL,NULL),(698,1,1,'/crm-connect','2018-09-28 04:44:26',NULL,NULL,NULL),(699,1,1,'/crm-connect','2018-09-28 04:44:28',NULL,NULL,NULL),(700,1,1,'/crm-connect','2018-09-28 04:44:53',NULL,NULL,NULL),(701,1,1,'/crm-connect','2018-09-28 09:53:06',NULL,NULL,NULL),(702,1,1,'/crm-connect','2018-09-28 09:54:08',NULL,NULL,NULL),(703,1,1,'/crm-connect','2018-09-28 09:56:33',NULL,NULL,NULL),(704,1,1,'/crm-connect','2018-09-28 09:56:37',NULL,NULL,NULL),(705,1,1,'/crm-connect','2018-09-28 10:23:15',NULL,NULL,NULL),(706,1,1,'/crm-connect','2018-09-28 10:23:50',NULL,NULL,NULL),(707,1,1,'/crm-connect','2018-09-28 10:33:50',NULL,NULL,NULL),(708,1,1,'/crm-connect','2018-09-28 10:34:10',NULL,NULL,NULL),(709,1,1,'/crm-connect','2018-09-28 10:34:14',NULL,NULL,NULL),(710,2,2,'/','2018-10-03 10:15:34',NULL,NULL,NULL),(711,2,2,'/login','2018-10-03 10:15:40',NULL,NULL,NULL),(712,2,2,'/','2018-10-03 10:15:45',NULL,NULL,NULL),(713,2,2,'/admin','2018-10-03 10:15:50',NULL,NULL,NULL),(714,2,2,'/','2018-10-03 10:16:01',NULL,NULL,NULL),(715,2,2,'/admin','2018-10-03 10:16:04',NULL,NULL,NULL),(716,2,2,'/store','2018-10-03 10:16:06',NULL,NULL,NULL),(717,2,2,'/crm-connect','2018-10-03 10:16:09',NULL,NULL,NULL),(718,2,2,'/crm-connect','2018-10-03 10:17:10',NULL,NULL,NULL),(719,2,2,'/crm-connect','2018-10-03 10:17:17',NULL,NULL,NULL),(720,2,2,'/store-cat/1','2018-10-03 10:43:22',NULL,NULL,NULL),(721,2,2,'/store-cat/1','2018-10-03 10:43:26',NULL,NULL,NULL),(722,2,2,'/store-cat/undefined/2','2018-10-03 10:43:30',NULL,NULL,NULL),(723,2,2,'/store-cat/1','2018-10-03 10:43:58',NULL,NULL,NULL),(724,2,2,'/store-cat/2','2018-10-03 10:44:17',NULL,NULL,NULL),(725,2,2,'/store-cat/1','2018-10-03 10:44:20',NULL,NULL,NULL),(726,2,2,'/store-cat/1','2018-10-03 10:44:42',NULL,NULL,NULL),(727,2,2,'/store-cat/1','2018-10-03 10:44:52',NULL,NULL,NULL),(728,2,2,'/store-pos/2','2018-10-03 10:44:55',NULL,NULL,NULL),(729,2,2,'/store-pos/2','2018-10-03 10:45:39',NULL,NULL,NULL),(730,2,2,'/store-pos/2','2018-10-03 10:46:06',NULL,NULL,NULL),(731,2,2,'/store-pos/2','2018-10-03 10:46:15',NULL,NULL,NULL),(732,2,2,'/shop-categories/1','2018-10-03 10:46:22',NULL,NULL,NULL),(733,2,2,'/store-pos/2','2018-10-03 10:46:52',NULL,NULL,NULL),(734,2,2,'/store-pos/2','2018-10-03 10:47:01',NULL,NULL,NULL),(735,2,2,'/store-cat/1','2018-10-03 10:47:18',NULL,NULL,NULL),(736,2,2,'/store-cat/2','2018-10-03 10:47:20',NULL,NULL,NULL),(737,2,2,'/store-cat/1','2018-10-03 10:47:21',NULL,NULL,NULL),(738,2,2,'/store-cat/1','2018-10-03 10:47:37',NULL,NULL,NULL),(739,2,2,'/store-pos/3','2018-10-03 10:47:39',NULL,NULL,NULL),(740,2,2,'/store-cat/1','2018-10-03 10:48:17',NULL,NULL,NULL),(741,2,2,'/store-cat/2','2018-10-03 10:48:19',NULL,NULL,NULL),(742,2,2,'/store-cat/1','2018-10-03 10:48:20',NULL,NULL,NULL),(743,2,2,'/store-pos/3','2018-10-03 10:48:22',NULL,NULL,NULL),(744,2,2,'/store-pos/3','2018-10-03 10:48:33',NULL,NULL,NULL),(745,2,2,'/store-cat/1','2018-10-03 10:49:57',NULL,NULL,NULL),(746,2,2,'/store-cat/1','2018-10-03 10:50:00',NULL,NULL,NULL),(747,2,2,'/store-pos/4','2018-10-03 10:50:01',NULL,NULL,NULL),(748,2,2,'/store-pos/4','2018-10-03 10:50:11',NULL,NULL,NULL),(749,2,2,'/store-cat/1','2018-10-03 10:50:13',NULL,NULL,NULL),(750,2,2,'/store-cat/1','2018-10-03 10:50:16',NULL,NULL,NULL),(751,2,2,'/store-cat/1','2018-10-03 10:50:26',NULL,NULL,NULL),(752,2,2,'/store-cat/1','2018-10-03 10:50:27',NULL,NULL,NULL),(753,2,2,'/store-cat/2','2018-10-03 10:50:30',NULL,NULL,NULL),(754,2,2,'/store-cat/1','2018-10-03 10:50:32',NULL,NULL,NULL),(755,2,2,'/store-cat/1','2018-10-03 10:50:37',NULL,NULL,NULL),(756,2,2,'/store-cat/1','2018-10-03 10:50:38',NULL,NULL,NULL),(757,2,2,'/store-cat/1','2018-10-03 10:50:47',NULL,NULL,NULL),(758,2,2,'/store-pos/4','2018-10-03 10:50:49',NULL,NULL,NULL),(759,2,2,'/store-pos/3','2018-10-03 10:51:35',NULL,NULL,NULL),(760,2,2,'/store-pos/3','2018-10-03 10:51:38',NULL,NULL,NULL),(761,2,2,'/store-cat/2','2018-10-03 10:51:59',NULL,NULL,NULL),(762,2,2,'/store-cat/1','2018-10-03 10:52:00',NULL,NULL,NULL),(763,2,2,'/store-pos/3','2018-10-03 10:52:01',NULL,NULL,NULL),(764,2,2,'/store-pos/3','2018-10-03 10:52:10',NULL,NULL,NULL),(765,2,2,'/store-cat/1','2018-10-03 10:52:18',NULL,NULL,NULL),(766,2,2,'/store-pos/4','2018-10-03 10:52:20',NULL,NULL,NULL),(767,2,2,'/store-pos/3','2018-10-03 10:52:29',NULL,NULL,NULL),(768,2,2,'/store-cat/2','2018-10-03 10:54:45',NULL,NULL,NULL),(769,2,2,'/store-cat/1','2018-10-03 10:54:46',NULL,NULL,NULL),(770,2,2,'/admin','2018-10-03 10:54:49',NULL,NULL,NULL),(771,2,2,'/admin-globals','2018-10-03 10:54:51',NULL,NULL,NULL),(772,2,2,'/my','2018-10-03 10:55:15',NULL,NULL,NULL),(773,2,2,'/my','2018-10-03 10:55:31',NULL,NULL,NULL),(774,2,2,'/cart','2018-10-03 10:56:01',NULL,NULL,NULL),(775,2,2,'/admin-routes','2018-10-03 10:56:06',NULL,NULL,NULL),(776,2,2,'/admin-routes','2018-10-03 10:56:17',NULL,NULL,NULL),(777,2,2,'/crm-connect','2018-10-03 11:08:42',NULL,NULL,NULL),(778,2,2,'/crm-connect','2018-10-03 11:09:13',NULL,NULL,NULL),(779,2,2,'/crm-connect','2018-10-03 11:09:33',NULL,NULL,NULL),(780,2,2,'/store','2018-10-03 11:09:41',NULL,NULL,NULL),(781,2,2,'/store-cat/2','2018-10-03 11:09:43',NULL,NULL,NULL),(782,2,2,'/store-cat/1','2018-10-03 11:09:46',NULL,NULL,NULL),(783,2,2,'/store-pos/4','2018-10-03 11:09:49',NULL,NULL,NULL),(784,2,2,'/store-cat/1','2018-10-03 11:22:52',NULL,NULL,NULL),(785,2,2,'/store-pos/4','2018-10-03 11:22:55',NULL,NULL,NULL),(786,2,2,'/store-cat/1','2018-10-03 11:23:58',NULL,NULL,NULL),(787,2,2,'/store-pos/5','2018-10-03 11:24:06',NULL,NULL,NULL),(788,2,2,'/store-cat/1','2018-10-03 11:24:34',NULL,NULL,NULL),(789,2,2,'/store-cat/1','2018-10-03 11:28:09',NULL,NULL,NULL),(790,2,2,'/store-pos/5','2018-10-03 11:29:01',NULL,NULL,NULL),(791,2,2,'/admin','2018-10-03 12:04:43',NULL,NULL,NULL),(792,2,2,'/admin-globals','2018-10-03 12:04:45',NULL,NULL,NULL),(793,2,2,'/admin-globals','2018-10-03 12:05:01',NULL,NULL,NULL),(794,2,2,'/admin-globals','2018-10-03 12:05:11',NULL,NULL,NULL),(795,2,2,'/admin-globals','2018-10-03 12:05:13',NULL,NULL,NULL),(796,2,2,'/admin-globals','2018-10-03 12:05:22',NULL,NULL,NULL),(797,2,2,'/admin-globals','2018-10-03 12:05:24',NULL,NULL,NULL),(798,2,2,'/admin-globals','2018-10-03 12:05:29',NULL,NULL,NULL),(799,2,2,'/admin-globals','2018-10-03 12:05:32',NULL,NULL,NULL),(800,2,2,'/admin-globals','2018-10-03 12:05:51',NULL,NULL,NULL),(801,2,2,'/admin-globals','2018-10-03 12:05:58',NULL,NULL,NULL),(802,2,2,'/admin-globals','2018-10-03 12:06:02',NULL,NULL,NULL),(803,2,2,'/admin-globals','2018-10-03 12:06:05',NULL,NULL,NULL),(804,2,2,'/cart','2018-10-03 12:06:10',NULL,NULL,NULL),(805,2,2,'/admin-globals','2018-10-03 12:06:14',NULL,NULL,NULL),(806,2,2,'/admin-globals','2018-10-03 12:06:21',NULL,NULL,NULL),(807,2,2,'/admin-globals','2018-10-03 12:06:29',NULL,NULL,NULL),(808,2,2,'/store-cat/1','2018-10-03 12:06:32',NULL,NULL,NULL),(809,2,2,'/store-pos/3','2018-10-03 12:06:33',NULL,NULL,NULL),(810,2,2,'/store-cat/1','2018-10-03 12:30:44',NULL,NULL,NULL),(811,2,2,'/store-cat/1','2018-10-03 12:30:47',NULL,NULL,NULL),(812,2,2,'/store-cat/1','2018-10-03 12:30:55',NULL,NULL,NULL),(813,2,2,'/store-pos/6','2018-10-03 12:31:00',NULL,NULL,NULL),(814,2,2,'/store-pos/6','2018-10-03 12:32:18',NULL,NULL,NULL),(815,2,2,'/store-pos/6','2018-10-03 12:32:29',NULL,NULL,NULL),(816,2,2,'/store-pos/6','2018-10-03 12:33:16',NULL,NULL,NULL),(817,2,2,'/store-pos/6','2018-10-03 12:33:23',NULL,NULL,NULL),(818,2,2,'/store-pos/6','2018-10-03 12:33:25',NULL,NULL,NULL),(819,2,2,'/store-pos/6','2018-10-03 12:33:30',NULL,NULL,NULL),(820,2,2,'/store-pos/6','2018-10-03 12:34:45',NULL,NULL,NULL),(821,2,2,'/shop-categories/1','2018-10-03 12:34:47',NULL,NULL,NULL),(822,2,2,'/store-cat/1','2018-10-03 12:34:58',NULL,NULL,NULL),(823,2,2,'/store-cat/2','2018-10-03 12:35:00',NULL,NULL,NULL),(824,2,2,'/store-cat/1','2018-10-03 12:35:02',NULL,NULL,NULL),(825,2,2,'/store-pos/3','2018-10-03 12:35:07',NULL,NULL,NULL),(826,2,2,'/store-pos/1','2018-10-03 12:35:11',NULL,NULL,NULL),(827,2,2,'/store-pos/1','2018-10-03 12:35:20',NULL,NULL,NULL),(828,2,2,'/store-pos/1','2018-10-03 12:35:31',NULL,NULL,NULL),(829,2,2,'/store-cat/1','2018-10-03 12:35:34',NULL,NULL,NULL),(830,2,2,'/store-cat/1','2018-10-03 12:35:42',NULL,NULL,NULL),(831,2,2,'/store-cat/1','2018-10-03 12:35:47',NULL,NULL,NULL),(832,2,2,'/store-pos/6','2018-10-03 12:36:38',NULL,NULL,NULL),(833,2,2,'/store-pos/6','2018-10-03 12:36:45',NULL,NULL,NULL),(834,2,2,'/store-pos/6','2018-10-03 12:37:12',NULL,NULL,NULL),(835,2,2,'/store-pos/6','2018-10-03 12:37:17',NULL,NULL,NULL),(836,2,2,'/store-pos/6','2018-10-03 12:37:20',NULL,NULL,NULL),(837,2,2,'/store-pos/6','2018-10-03 12:38:18',NULL,NULL,NULL),(838,2,2,'/store-pos/6','2018-10-03 12:38:21',NULL,NULL,NULL),(839,2,2,'/store-pos/6','2018-10-03 12:38:24',NULL,NULL,NULL),(840,2,2,'/store-pos/6','2018-10-03 12:38:26',NULL,NULL,NULL),(841,2,2,'/store-cat/5','2018-10-03 12:38:29',NULL,NULL,NULL),(842,2,2,'/store-cat/6','2018-10-03 12:38:31',NULL,NULL,NULL),(843,2,2,'/store-cat/1','2018-10-03 12:38:32',NULL,NULL,NULL),(844,2,2,'/store-pos/3','2018-10-03 12:38:33',NULL,NULL,NULL),(845,2,2,'/store-cat/1','2018-10-03 12:38:36',NULL,NULL,NULL),(846,2,2,'/store-pos/3','2018-10-03 12:38:39',NULL,NULL,NULL),(847,2,2,'/store-pos/3','2018-10-03 12:38:42',NULL,NULL,NULL),(848,2,2,'/store-pos/3','2018-10-03 12:38:44',NULL,NULL,NULL),(849,2,2,'/store-pos/3','2018-10-03 12:40:26',NULL,NULL,NULL),(850,2,2,'/store-pos/3','2018-10-03 12:40:34',NULL,NULL,NULL),(851,2,2,'/','2018-10-03 12:45:28',NULL,NULL,NULL),(852,2,2,'/company','2018-10-03 12:45:31',NULL,NULL,NULL),(853,2,2,'/company','2018-10-03 12:45:33',NULL,NULL,NULL),(854,2,2,'/company','2018-10-03 12:45:37',NULL,NULL,NULL),(855,2,2,'/store','2018-10-03 12:45:40',NULL,NULL,NULL),(856,2,2,'/store-cat/1','2018-10-03 12:45:42',NULL,NULL,NULL),(857,2,2,'/store-cat/2','2018-10-03 12:45:43',NULL,NULL,NULL),(858,2,2,'/store-cat/3','2018-10-03 12:45:45',NULL,NULL,NULL),(859,2,2,'/store-cat/4','2018-10-03 12:45:45',NULL,NULL,NULL),(860,2,2,'/store-cat/1','2018-10-03 12:45:47',NULL,NULL,NULL),(861,2,2,'/store','2018-10-03 12:45:50',NULL,NULL,NULL),(862,2,2,'/','2018-10-03 12:46:00',NULL,NULL,NULL),(863,2,2,'/rituals','2018-10-03 12:46:09',NULL,NULL,NULL),(864,2,2,'/','2018-10-03 12:46:12',NULL,NULL,NULL),(865,2,2,'/company','2018-10-03 12:46:13',NULL,NULL,NULL),(866,2,2,'/','2018-10-03 12:46:15',NULL,NULL,NULL),(867,2,2,'/store','2018-10-03 12:46:28',NULL,NULL,NULL),(868,2,2,'/store-cat/1','2018-10-03 12:46:29',NULL,NULL,NULL),(869,2,2,'/store-pos/1','2018-10-03 12:46:36',NULL,NULL,NULL),(870,2,2,'/store-cat/1','2018-10-03 12:47:12',NULL,NULL,NULL),(871,2,2,'/store-pos/6','2018-10-03 12:47:13',NULL,NULL,NULL),(872,2,2,'/store-pos/6','2018-10-03 12:47:16',NULL,NULL,NULL),(873,2,2,'/store-pos/6','2018-10-03 12:48:12',NULL,NULL,NULL),(874,2,2,'/store-pos/6','2018-10-03 12:48:21',NULL,NULL,NULL),(875,2,2,'/store','2018-10-03 12:52:30',NULL,NULL,NULL),(876,2,2,'/store','2018-10-03 12:52:32',NULL,NULL,NULL),(877,2,2,'/store-cat/1','2018-10-03 12:52:35',NULL,NULL,NULL),(878,2,2,'/store-cat/2','2018-10-03 12:52:37',NULL,NULL,NULL),(879,2,2,'/store-cat/3','2018-10-03 12:52:39',NULL,NULL,NULL),(880,2,2,'/store-cat/1','2018-10-03 12:52:40',NULL,NULL,NULL),(881,2,2,'/store-pos/1','2018-10-03 12:52:42',NULL,NULL,NULL),(882,2,2,'/store-cat/1','2018-10-03 12:52:44',NULL,NULL,NULL),(883,2,2,'/store-pos/3','2018-10-03 12:52:45',NULL,NULL,NULL),(884,2,2,'/store-cat/4','2018-10-03 12:52:59',NULL,NULL,NULL),(885,2,2,'/store-cat/5','2018-10-03 12:53:01',NULL,NULL,NULL),(886,2,2,'/store-cat/4','2018-10-03 12:53:01',NULL,NULL,NULL),(887,2,2,'/store-cat/3','2018-10-03 12:53:02',NULL,NULL,NULL),(888,2,2,'/store-cat/1','2018-10-03 12:53:03',NULL,NULL,NULL),(889,2,2,'/store-pos/4','2018-10-03 12:53:04',NULL,NULL,NULL),(890,2,2,'/store-pos/4','2018-10-03 12:53:20',NULL,NULL,NULL),(891,2,2,'/store-pos/4','2018-10-03 12:53:26',NULL,NULL,NULL),(892,2,2,'/store-cat/4','2018-10-03 12:55:39',NULL,NULL,NULL),(893,2,2,'/store-cat/1','2018-10-03 12:55:41',NULL,NULL,NULL),(894,2,2,'/store-pos/1','2018-10-03 12:55:43',NULL,NULL,NULL),(895,2,2,'/shop-categories/1','2018-10-03 12:55:46',NULL,NULL,NULL),(896,2,2,'/store-pos/1','2018-10-03 12:57:30',NULL,NULL,NULL),(897,2,2,'/store-cat/1','2018-10-03 12:57:32',NULL,NULL,NULL),(898,2,2,'/store-cat/2','2018-10-03 12:57:34',NULL,NULL,NULL),(899,2,2,'/store-cat/1','2018-10-03 12:57:36',NULL,NULL,NULL),(900,2,2,'/store-pos/1','2018-10-03 12:57:41',NULL,NULL,NULL),(901,2,2,'/store-pos/1','2018-10-03 12:58:51',NULL,NULL,NULL),(902,2,2,'/store-pos/1','2018-10-03 12:59:17',NULL,NULL,NULL),(903,2,2,'/store-pos/1','2018-10-03 12:59:24',NULL,NULL,NULL),(904,2,2,'/store-pos/1','2018-10-03 12:59:43',NULL,NULL,NULL),(905,2,2,'/store-pos/1','2018-10-03 12:59:53',NULL,NULL,NULL),(906,2,2,'/store-pos/1','2018-10-03 13:00:47',NULL,NULL,NULL),(907,2,2,'/store-pos/1','2018-10-03 13:01:03',NULL,NULL,NULL),(908,2,2,'/store-pos/1','2018-10-03 13:01:33',NULL,NULL,NULL),(909,2,2,'/store','2018-10-03 13:03:39',NULL,NULL,NULL),(910,2,2,'/store-pos/1','2018-10-03 13:07:34',NULL,NULL,NULL),(911,2,2,'/store-cat/1','2018-10-03 13:08:20',NULL,NULL,NULL),(912,2,2,'/store-pos/3','2018-10-03 13:08:21',NULL,NULL,NULL),(913,2,2,'/store-pos/3','2018-10-03 13:08:53',NULL,NULL,NULL),(914,3,3,'/','2018-10-04 16:50:43',NULL,NULL,NULL),(915,3,3,'/store','2018-10-05 06:34:46',NULL,NULL,NULL),(916,3,3,'/store-cat/1','2018-10-05 06:34:49',NULL,NULL,NULL),(917,3,3,'/store-pos/3','2018-10-05 06:34:52',NULL,NULL,NULL),(918,3,3,'/store','2018-10-05 07:04:02',NULL,NULL,NULL),(919,3,3,'/company','2018-10-05 07:04:03',NULL,NULL,NULL),(920,3,3,'/','2018-10-05 07:04:05',NULL,NULL,NULL),(921,3,3,'/company','2018-10-05 07:04:06',NULL,NULL,NULL),(922,4,4,'/history','2018-10-08 06:32:51',NULL,NULL,NULL),(923,4,4,'/shops-list','2018-10-08 06:32:58',NULL,NULL,NULL),(924,4,4,'/posts','2018-10-08 06:33:01',NULL,NULL,NULL),(925,4,4,'/reviews','2018-10-08 06:33:03',NULL,NULL,NULL),(926,4,4,'/honors','2018-10-08 06:33:06',NULL,NULL,NULL),(927,4,4,'/faq','2018-10-08 06:33:08',NULL,NULL,NULL),(928,4,4,'/vacancies','2018-10-08 06:33:10',NULL,NULL,NULL),(929,4,4,'/feedback','2018-10-08 06:33:13',NULL,NULL,NULL),(930,4,4,'/store-cat/1','2018-10-08 06:33:19',NULL,NULL,NULL),(931,4,4,'/store-pos/1','2018-10-08 06:33:22',NULL,NULL,NULL),(932,4,4,'/store-pos/1','2018-10-08 09:00:30',NULL,NULL,NULL),(933,4,4,'/store-pos/1','2018-10-08 09:00:36',NULL,NULL,NULL),(934,4,4,'/store-pos/1','2018-10-08 09:00:46',NULL,NULL,NULL),(935,4,4,'/store-pos/1','2018-10-08 09:00:48',NULL,NULL,NULL),(936,4,4,'/store-pos/1','2018-10-08 09:02:40',NULL,NULL,NULL),(937,4,4,'/store-pos/1','2018-10-08 09:05:16',NULL,NULL,NULL),(938,4,4,'/store-pos/1','2018-10-08 09:05:17',NULL,NULL,NULL),(939,4,4,'/store-pos/1','2018-10-08 09:05:18',NULL,NULL,NULL),(940,4,4,'/store-pos/1','2018-10-08 09:05:32',NULL,NULL,NULL),(941,4,4,'/store-pos/1','2018-10-08 09:07:38',NULL,NULL,NULL),(942,4,4,'/store-pos/1','2018-10-08 09:07:38',NULL,NULL,NULL),(943,4,4,'/store-pos/1','2018-10-08 09:07:38',NULL,NULL,NULL),(944,4,4,'/store-pos/1','2018-10-08 09:07:39',NULL,NULL,NULL),(945,4,4,'/store-pos/1','2018-10-08 09:07:39',NULL,NULL,NULL),(946,4,4,'/company','2018-10-08 10:25:30',NULL,NULL,NULL),(947,4,4,'/shops-list','2018-10-08 10:25:33',NULL,NULL,NULL),(948,4,4,'/shops-list','2018-10-08 12:53:56',NULL,NULL,NULL),(949,4,4,'/company','2018-10-08 12:54:18',NULL,NULL,NULL),(950,4,4,'/store','2018-10-08 12:54:21',NULL,NULL,NULL),(951,4,4,'/store-cat/2','2018-10-08 12:54:23',NULL,NULL,NULL),(952,4,4,'/store-cat/1','2018-10-08 12:54:25',NULL,NULL,NULL),(953,4,4,'/store-pos/1','2018-10-08 12:54:28',NULL,NULL,NULL),(954,4,4,'/store-pos/1','2018-10-08 12:54:41',NULL,NULL,NULL),(955,4,4,'/store-pos/1','2018-10-08 12:54:41',NULL,NULL,NULL),(956,4,4,'/store-pos/1','2018-10-08 12:54:41',NULL,NULL,NULL),(957,4,4,'/store-pos/1','2018-10-08 12:54:42',NULL,NULL,NULL),(958,4,4,'/store-cat/1','2018-10-08 12:54:48',NULL,NULL,NULL),(959,4,4,'/store-pos/3','2018-10-08 12:54:50',NULL,NULL,NULL),(960,4,4,'/store-pos/3','2018-10-08 12:55:38',NULL,NULL,NULL),(961,4,4,'/store-cat/1','2018-10-08 12:55:42',NULL,NULL,NULL),(962,4,4,'/store-pos/1','2018-10-08 12:55:44',NULL,NULL,NULL),(963,4,4,'/store-pos/1','2018-10-08 12:56:41',NULL,NULL,NULL),(964,4,4,'/store-cat/1','2018-10-08 13:00:24',NULL,NULL,NULL),(965,4,4,'/store-cat/1','2018-10-08 13:00:24',NULL,NULL,NULL),(966,4,4,'/store-cat/1','2018-10-08 13:01:26',NULL,NULL,NULL),(967,4,4,'/store-cat/1','2018-10-08 13:02:09',NULL,NULL,NULL),(968,4,4,'/store-pos/7','2018-10-08 13:02:12',NULL,NULL,NULL),(969,4,4,'/store-pos/7','2018-10-08 13:02:18',NULL,NULL,NULL),(970,4,4,'/store-cat/1','2018-10-08 13:02:24',NULL,NULL,NULL),(971,4,4,'/store-pos/7','2018-10-08 13:02:27',NULL,NULL,NULL),(972,4,4,'/store-cat/1','2018-10-08 13:03:38',NULL,NULL,NULL),(973,4,4,'/store-pos/7','2018-10-08 13:03:40',NULL,NULL,NULL),(974,4,4,'/store-cat/1','2018-10-08 13:03:44',NULL,NULL,NULL),(975,4,4,'/store-cat/1','2018-10-08 13:03:51',NULL,NULL,NULL),(976,4,4,'/store-cat/1','2018-10-08 13:04:07',NULL,NULL,NULL),(977,4,4,'/store-pos/8','2018-10-08 13:04:08',NULL,NULL,NULL),(978,4,4,'/store-cat/1','2018-10-08 13:04:27',NULL,NULL,NULL),(979,4,4,'/store-pos/8','2018-10-08 13:04:29',NULL,NULL,NULL),(980,4,4,'/store-cat/1','2018-10-08 13:04:52',NULL,NULL,NULL),(981,4,4,'/store-pos/8','2018-10-08 13:05:09',NULL,NULL,NULL),(982,4,4,'/store-cat/1','2018-10-08 13:17:38',NULL,NULL,NULL),(983,4,4,'/store-pos/9','2018-10-08 13:17:41',NULL,NULL,NULL),(984,4,4,'/store-cat/2','2018-10-08 13:17:49',NULL,NULL,NULL),(985,4,4,'/store-cat/3','2018-10-08 13:17:51',NULL,NULL,NULL),(986,4,4,'/store-cat/2','2018-10-08 13:17:52',NULL,NULL,NULL),(987,4,4,'/store-cat/1','2018-10-08 13:17:53',NULL,NULL,NULL),(988,4,4,'/store-pos/9','2018-10-08 13:17:59',NULL,NULL,NULL),(989,4,4,'/cart','2018-10-08 13:18:11',NULL,NULL,NULL),(990,4,4,'/login','2018-10-08 13:18:18',NULL,NULL,NULL),(991,4,4,'/store-pos/9','2018-10-08 13:18:24',NULL,NULL,NULL),(992,4,4,'/admin','2018-10-08 13:18:27',NULL,NULL,NULL),(993,4,4,'/admin-globals','2018-10-08 13:18:29',NULL,NULL,NULL),(994,4,4,'/admin-globals','2018-10-08 13:18:36',NULL,NULL,NULL),(995,4,4,'/admin-globals','2018-10-08 13:18:47',NULL,NULL,NULL),(996,4,4,'/admin-globals','2018-10-08 13:18:49',NULL,NULL,NULL),(997,4,4,'/admin-globals','2018-10-08 13:20:13',NULL,NULL,NULL),(998,4,4,'/admin-globals','2018-10-08 13:20:15',NULL,NULL,NULL),(999,4,4,'/admin-routes','2018-10-08 13:20:20',NULL,NULL,NULL),(1000,4,4,'/admin-clients','2018-10-08 13:20:21',NULL,NULL,NULL),(1001,4,4,'/admin-clients','2018-10-08 13:20:28',NULL,NULL,NULL),(1002,4,4,'/cart','2018-10-08 13:20:30',NULL,NULL,NULL),(1003,4,4,'/admin-routes','2018-10-08 13:20:35',NULL,NULL,NULL),(1004,4,4,'/company','2018-10-08 13:26:28',NULL,NULL,NULL),(1005,4,4,'/admin','2018-10-08 13:26:39',NULL,NULL,NULL),(1006,4,4,'/admin-routes','2018-10-08 13:26:41',NULL,NULL,NULL),(1007,4,4,'/admin-clients','2018-10-08 13:27:20',NULL,NULL,NULL),(1008,4,4,'/admin-routes','2018-10-08 13:27:21',NULL,NULL,NULL),(1009,4,4,'/admin-routes','2018-10-08 13:27:36',NULL,NULL,NULL),(1010,4,4,'/admin-clients','2018-10-08 13:27:44',NULL,NULL,NULL),(1011,4,4,'/admin-routes','2018-10-08 13:27:46',NULL,NULL,NULL),(1012,4,4,'/admin-routes','2018-10-08 13:27:54',NULL,NULL,NULL),(1013,4,4,'/admin-clients','2018-10-08 13:27:56',NULL,NULL,NULL),(1014,4,4,'/admin-routes','2018-10-08 13:27:57',NULL,NULL,NULL),(1015,4,4,'/admin-attendance','2018-10-08 13:27:58',NULL,NULL,NULL),(1016,4,4,'/admin-routes','2018-10-08 13:28:00',NULL,NULL,NULL),(1017,4,4,'/admin-routes','2018-10-08 13:28:07',NULL,NULL,NULL),(1018,4,4,'/admin-attendance','2018-10-08 13:28:13',NULL,NULL,NULL),(1019,4,4,'/admin-components','2018-10-08 13:28:14',NULL,NULL,NULL),(1020,4,4,'/admin-routes','2018-10-08 13:28:16',NULL,NULL,NULL),(1021,4,4,'/admin-routes','2018-10-08 13:28:24',NULL,NULL,NULL),(1022,4,4,'/admin-globals','2018-10-08 13:28:27',NULL,NULL,NULL),(1023,4,4,'/admin-components','2018-10-08 13:28:27',NULL,NULL,NULL),(1024,4,4,'/admin-attendance','2018-10-08 13:28:29',NULL,NULL,NULL),(1025,4,4,'/admin-clients','2018-10-08 13:28:29',NULL,NULL,NULL),(1026,4,4,'/admin-routes','2018-10-08 13:28:30',NULL,NULL,NULL),(1027,4,4,'/admin-routes','2018-10-08 13:28:41',NULL,NULL,NULL),(1028,4,4,'/admin-feedback','2018-10-08 13:28:43',NULL,NULL,NULL),(1029,4,4,'/admin-globals','2018-10-08 13:28:45',NULL,NULL,NULL),(1030,4,4,'/admin-components','2018-10-08 13:28:45',NULL,NULL,NULL),(1031,4,4,'/admin-attendance','2018-10-08 13:28:47',NULL,NULL,NULL),(1032,4,4,'/admin-components','2018-10-08 13:28:47',NULL,NULL,NULL),(1033,4,4,'/admin-components/1','2018-10-08 13:28:52',NULL,NULL,NULL),(1034,4,4,'/admin-routes','2018-10-08 13:34:26',NULL,NULL,NULL),(1035,4,4,'/new_route','2018-10-08 13:34:35',NULL,NULL,NULL),(1036,4,4,'/new_route','2018-10-08 13:34:41',NULL,NULL,NULL),(1037,4,4,'/new_route','2018-10-08 13:34:50',NULL,NULL,NULL),(1038,4,4,'/admin-routes','2018-10-08 13:34:57',NULL,NULL,NULL),(1039,4,4,'/admin-routes','2018-10-08 13:36:51',NULL,NULL,NULL),(1040,4,4,'/cart','2018-10-08 13:36:58',NULL,NULL,NULL),(1041,4,4,'/cart','2018-10-08 13:37:03',NULL,NULL,NULL),(1042,4,4,'/cart','2018-10-08 13:37:05',NULL,NULL,NULL),(1043,4,4,'/cart','2018-10-08 13:37:28',NULL,NULL,NULL),(1044,4,4,'/cart','2018-10-08 13:37:31',NULL,NULL,NULL),(1045,4,4,'/cart','2018-10-08 13:38:56',NULL,NULL,NULL),(1046,4,4,'/cart','2018-10-08 13:38:59',NULL,NULL,NULL),(1047,4,4,'/cart','2018-10-08 13:39:11',NULL,NULL,NULL),(1048,4,4,'/cart','2018-10-08 13:39:20',NULL,NULL,NULL),(1049,4,4,'/cart','2018-10-08 13:39:22',NULL,NULL,NULL),(1050,4,4,'/cart','2018-10-08 13:39:25',NULL,NULL,NULL),(1051,4,4,'/cart','2018-10-08 13:39:35',NULL,NULL,NULL),(1052,4,4,'/cart','2018-10-08 13:40:18',NULL,NULL,NULL),(1053,4,4,'/cart','2018-10-08 13:40:44',NULL,NULL,NULL),(1054,4,4,'/cart','2018-10-08 13:40:56',NULL,NULL,NULL),(1055,4,4,'/cart','2018-10-08 13:40:59',NULL,NULL,NULL),(1056,4,4,'/my','2018-10-08 13:41:01',NULL,NULL,NULL),(1057,4,4,'/my','2018-10-08 13:41:04',NULL,NULL,NULL),(1058,4,4,'/my','2018-10-08 13:41:09',NULL,NULL,NULL),(1059,4,4,'/my','2018-10-08 13:41:12',NULL,NULL,NULL),(1060,4,4,'/my','2018-10-08 13:41:13',NULL,NULL,NULL),(1061,4,4,'/cart','2018-10-08 13:41:15',NULL,NULL,NULL),(1062,4,4,'/my','2018-10-08 13:41:16',NULL,NULL,NULL),(1063,4,4,'/cart','2018-10-08 13:41:19',NULL,NULL,NULL),(1064,4,4,'/my','2018-10-08 13:41:20',NULL,NULL,NULL),(1065,4,4,'/cart','2018-10-08 13:41:21',NULL,NULL,NULL),(1066,4,4,'/cart','2018-10-08 13:41:28',NULL,NULL,NULL),(1067,4,4,'/cart','2018-10-08 13:41:29',NULL,NULL,NULL),(1068,4,4,'/cart','2018-10-08 13:41:32',NULL,NULL,NULL),(1069,4,4,'/cart','2018-10-08 13:41:37',NULL,NULL,NULL),(1070,4,4,'/cart','2018-10-08 13:41:38',NULL,NULL,NULL),(1071,4,4,'/','2018-10-08 13:41:40',NULL,NULL,NULL),(1072,4,4,'/company','2018-10-08 13:41:41',NULL,NULL,NULL),(1073,4,4,'/store-cat/1','2018-10-08 13:41:42',NULL,NULL,NULL),(1074,4,4,'/store-pos/4','2018-10-08 13:41:43',NULL,NULL,NULL),(1075,4,4,'/store-pos/6','2018-10-08 13:41:48',NULL,NULL,NULL),(1076,4,4,'/admin','2018-10-08 13:41:55',NULL,NULL,NULL),(1077,4,4,'/admin-routes','2018-10-08 13:41:57',NULL,NULL,NULL),(1078,4,4,'/store-cat/1','2018-10-08 13:42:19',NULL,NULL,NULL),(1079,4,4,'/store-pos/1','2018-10-08 13:42:20',NULL,NULL,NULL),(1080,4,4,'/admin','2018-10-08 13:42:44',NULL,NULL,NULL),(1081,4,4,'/admin-routes','2018-10-08 13:42:45',NULL,NULL,NULL),(1082,4,4,'/admin-routes','2018-10-08 13:42:57',NULL,NULL,NULL),(1083,4,4,'/store-cat/1','2018-10-08 13:43:04',NULL,NULL,NULL),(1084,4,4,'/store-pos/4','2018-10-08 13:43:05',NULL,NULL,NULL),(1085,4,4,'/admin-routes','2018-10-08 13:43:15',NULL,NULL,NULL),(1086,4,4,'/store-pos/4','2018-10-08 13:43:18',NULL,NULL,NULL),(1087,4,4,'/store','2018-10-08 13:44:14',NULL,NULL,NULL),(1088,4,4,'/favicon.ico','2018-10-08 13:44:32',NULL,NULL,NULL),(1089,4,4,'/store','2018-10-08 13:46:07',NULL,NULL,NULL),(1090,4,4,'/store-cat/1','2018-10-08 13:49:47',NULL,NULL,NULL),(1091,4,4,'/store-pos/1','2018-10-08 13:49:49',NULL,NULL,NULL),(1092,4,4,'/store-pos/1','2018-10-08 13:49:53',NULL,NULL,NULL),(1093,4,4,'/store','2018-10-08 13:50:09',NULL,NULL,NULL),(1094,4,4,'/store-cat/1','2018-10-08 13:51:38',NULL,NULL,NULL),(1095,4,4,'/store-pos/1','2018-10-08 13:51:40',NULL,NULL,NULL),(1096,4,4,'/store-pos/1','2018-10-08 13:52:51',NULL,NULL,NULL),(1097,4,4,'/store-pos/1','2018-10-08 13:53:04',NULL,NULL,NULL),(1098,4,4,'/store-pos/8','2018-10-08 13:53:16',NULL,NULL,NULL),(1099,4,4,'/store-pos/1','2018-10-08 13:53:19',NULL,NULL,NULL),(1100,4,4,'/store-pos/6','2018-10-08 13:53:21',NULL,NULL,NULL),(1101,4,4,'/store-pos/8','2018-10-08 13:53:45',NULL,NULL,NULL),(1102,4,4,'/store-cat/2','2018-10-08 13:55:15',NULL,NULL,NULL),(1103,4,4,'/store-cat/3','2018-10-08 13:55:16',NULL,NULL,NULL),(1104,4,4,'/store-cat/3','2018-10-08 13:55:17',NULL,NULL,NULL),(1105,4,4,'/store-cat/4','2018-10-08 13:55:17',NULL,NULL,NULL),(1106,4,4,'/store-cat/5','2018-10-08 13:55:19',NULL,NULL,NULL),(1107,4,4,'/store-cat/6','2018-10-08 13:55:20',NULL,NULL,NULL),(1108,4,4,'/store-cat/7','2018-10-08 13:55:20',NULL,NULL,NULL),(1109,4,4,'/store-cat/1','2018-10-08 13:55:21',NULL,NULL,NULL),(1110,4,4,'/store-cat/2','2018-10-08 13:56:05',NULL,NULL,NULL),(1111,4,4,'/store-cat/1','2018-10-08 13:56:06',NULL,NULL,NULL),(1112,4,4,'/cart','2018-10-08 13:56:08',NULL,NULL,NULL),(1113,4,4,'/order','2018-10-08 13:56:14',NULL,NULL,NULL),(1114,4,4,'/admin-routes','2018-10-08 13:56:47',NULL,NULL,NULL),(1115,4,4,'/order','2018-10-08 13:56:50',NULL,NULL,NULL),(1116,4,4,'/order','2018-10-08 13:56:54',NULL,NULL,NULL),(1117,4,4,'/order','2018-10-08 13:56:55',NULL,NULL,NULL),(1118,4,4,'/order','2018-10-08 13:56:58',NULL,NULL,NULL),(1119,4,4,'/order','2018-10-08 13:57:00',NULL,NULL,NULL),(1120,4,4,'/order','2018-10-08 13:57:02',NULL,NULL,NULL),(1121,4,4,'/order','2018-10-08 13:57:03',NULL,NULL,NULL),(1122,4,4,'/order','2018-10-08 13:57:17',NULL,NULL,NULL),(1123,4,4,'/order','2018-10-08 13:57:20',NULL,NULL,NULL),(1124,4,4,'/order','2018-10-08 13:57:22',NULL,NULL,NULL),(1125,4,4,'/order','2018-10-08 13:57:24',NULL,NULL,NULL),(1126,4,4,'/order','2018-10-08 13:57:26',NULL,NULL,NULL),(1127,4,4,'/store-cat/1','2018-10-08 13:58:36',NULL,NULL,NULL),(1128,4,4,'/store-pos/8','2018-10-08 13:58:58',NULL,NULL,NULL),(1129,4,4,'/store-pos/4','2018-10-08 14:00:15',NULL,NULL,NULL),(1130,4,4,'/store-pos/8','2018-10-08 14:00:16',NULL,NULL,NULL),(1131,4,4,'/store-pos/9','2018-10-08 14:00:19',NULL,NULL,NULL),(1132,4,4,'/store-pos/9','2018-10-08 14:16:42',NULL,NULL,NULL),(1133,4,4,'/store-pos/9','2018-10-08 14:34:07',NULL,NULL,NULL),(1134,4,4,'/store','2018-10-08 14:34:11',NULL,NULL,NULL),(1135,4,4,'/store','2018-10-08 14:34:36',NULL,NULL,NULL),(1136,4,4,'/store','2018-10-08 14:34:44',NULL,NULL,NULL),(1137,4,4,'/store','2018-10-08 14:34:46',NULL,NULL,NULL),(1138,4,4,'/my','2018-10-08 15:11:03',NULL,NULL,NULL),(1139,4,4,'/cart','2018-10-08 15:11:59',NULL,NULL,NULL),(1140,4,4,'/order','2018-10-08 15:12:01',NULL,NULL,NULL),(1141,4,4,'/order-complete/a3826fda7d6b765895792d5564dd3092','2018-10-08 15:12:22',NULL,NULL,NULL),(1142,4,4,'/admin-routes','2018-10-08 15:22:32',NULL,NULL,NULL),(1143,4,4,'/order-complete/a3826fda7d6b765895792d5564dd3092','2018-10-08 15:22:37',NULL,NULL,NULL),(1144,4,4,'/order-complete/a3826fda7d6b765895792d5564dd3092','2018-10-08 15:22:40',NULL,NULL,NULL),(1145,4,4,'/order-complete/a3826fda7d6b765895792d5564dd3092','2018-10-08 15:22:44',NULL,NULL,NULL),(1146,4,4,'/order-complete/a3826fda7d6b765895792d5564dd3092','2018-10-08 15:22:48',NULL,NULL,NULL),(1147,4,4,'/order-complete/a3826fda7d6b765895792d5564dd3092','2018-10-08 15:22:51',NULL,NULL,NULL),(1148,4,4,'/order-complete/a3826fda7d6b765895792d5564dd3092','2018-10-08 15:22:54',NULL,NULL,NULL),(1149,4,4,'/order-complete/a3826fda7d6b765895792d5564dd3092','2018-10-08 15:22:56',NULL,NULL,NULL),(1150,4,4,'/order-complete/a3826fda7d6b765895792d5564dd3092','2018-10-08 15:23:00',NULL,NULL,NULL),(1151,4,4,'/order-complete/a3826fda7d6b765895792d5564dd3092','2018-10-08 15:23:04',NULL,NULL,NULL),(1152,4,4,'/order-complete/a3826fda7d6b765895792d5564dd3092','2018-10-08 15:23:09',NULL,NULL,NULL),(1153,4,4,'/order-complete/a3826fda7d6b765895792d5564dd3092','2018-10-08 15:23:12',NULL,NULL,NULL),(1154,4,4,'/order-complete/a3826fda7d6b765895792d5564dd3092','2018-10-08 15:23:14',NULL,NULL,NULL),(1155,4,4,'/order-complete/a3826fda7d6b765895792d5564dd3092','2018-10-08 15:24:22',NULL,NULL,NULL),(1156,4,4,'/admin-routes','2018-10-08 15:24:24',NULL,NULL,NULL),(1157,4,4,'/order-complete/a3826fda7d6b765895792d5564dd3092','2018-10-08 15:24:28',NULL,NULL,NULL),(1158,4,4,'/','2018-10-08 15:26:36',NULL,NULL,NULL),(1159,4,4,'/','2018-10-08 15:26:40',NULL,NULL,NULL),(1160,4,4,'/store-cat/1','2018-10-08 15:26:47',NULL,NULL,NULL),(1161,4,4,'/store-pos/6','2018-10-08 15:26:50',NULL,NULL,NULL),(1162,4,4,'/store-pos/9','2018-10-08 15:26:53',NULL,NULL,NULL),(1163,4,4,'/store-pos/1','2018-10-08 15:26:55',NULL,NULL,NULL),(1164,4,4,'/store-pos/6','2018-10-08 15:26:58',NULL,NULL,NULL),(1165,4,4,'/store-pos/6','2018-10-08 15:27:01',NULL,NULL,NULL),(1166,4,4,'/store-pos/6','2018-10-08 15:27:33',NULL,NULL,NULL),(1167,4,4,'/','2018-10-09 08:46:08',NULL,NULL,NULL),(1168,4,4,'/','2018-10-09 08:46:13',NULL,NULL,NULL),(1169,4,4,'/','2018-10-09 08:46:28',NULL,NULL,NULL),(1170,4,4,'/','2018-10-09 08:46:32',NULL,NULL,NULL),(1171,4,4,'/','2018-10-09 08:46:35',NULL,NULL,NULL),(1172,4,4,'/','2018-10-09 08:46:43',NULL,NULL,NULL),(1173,4,4,'/','2018-10-09 08:46:44',NULL,NULL,NULL),(1174,4,4,'/','2018-10-09 08:46:48',NULL,NULL,NULL),(1175,4,4,'/','2018-10-09 08:46:53',NULL,NULL,NULL),(1176,4,4,'/','2018-10-09 08:46:55',NULL,NULL,NULL),(1177,4,4,'/','2018-10-09 08:46:59',NULL,NULL,NULL),(1178,4,4,'/','2018-10-09 08:47:00',NULL,NULL,NULL),(1179,4,4,'/','2018-10-09 08:48:15',NULL,NULL,NULL),(1180,4,4,'/','2018-10-09 08:48:21',NULL,NULL,NULL),(1181,4,4,'/','2018-10-09 08:48:27',NULL,NULL,NULL),(1182,4,4,'/','2018-10-09 08:48:30',NULL,NULL,NULL),(1183,4,4,'/','2018-10-09 08:48:45',NULL,NULL,NULL),(1184,4,4,'/','2018-10-09 08:48:48',NULL,NULL,NULL),(1185,4,4,'/','2018-10-09 08:48:53',NULL,NULL,NULL),(1186,4,4,'/','2018-10-09 08:49:49',NULL,NULL,NULL),(1187,4,4,'/','2018-10-09 08:50:15',NULL,NULL,NULL),(1188,4,4,'/','2018-10-09 08:50:20',NULL,NULL,NULL),(1189,4,4,'/','2018-10-09 08:53:00',NULL,NULL,NULL),(1190,4,4,'/','2018-10-09 08:53:03',NULL,NULL,NULL),(1191,4,4,'/','2018-10-09 08:53:07',NULL,NULL,NULL),(1192,4,4,'/','2018-10-09 08:53:27',NULL,NULL,NULL),(1193,4,4,'/','2018-10-09 08:53:38',NULL,NULL,NULL),(1194,4,4,'/','2018-10-09 08:53:52',NULL,NULL,NULL),(1195,4,4,'/','2018-10-09 08:54:06',NULL,NULL,NULL),(1196,4,4,'/','2018-10-09 08:54:22',NULL,NULL,NULL),(1197,4,4,'/','2018-10-09 08:54:46',NULL,NULL,NULL),(1198,4,4,'/','2018-10-09 08:56:51',NULL,NULL,NULL),(1199,4,4,'/','2018-10-09 08:56:54',NULL,NULL,NULL),(1200,4,4,'/','2018-10-09 08:56:55',NULL,NULL,NULL),(1201,4,4,'/favicon.ico','2018-10-09 08:56:58',NULL,NULL,NULL),(1202,4,4,'/','2018-10-09 08:59:11',NULL,NULL,NULL),(1203,4,4,'/','2018-10-09 08:59:23',NULL,NULL,NULL),(1204,4,4,'/','2018-10-09 09:01:26',NULL,NULL,NULL),(1205,4,4,'/company','2018-10-09 09:01:28',NULL,NULL,NULL),(1206,4,4,'/posts','2018-10-09 09:01:29',NULL,NULL,NULL),(1207,4,4,'/posts','2018-10-09 09:01:31',NULL,NULL,NULL),(1208,4,4,'/posts','2018-10-09 09:01:50',NULL,NULL,NULL),(1209,4,4,'/post/14','2018-10-09 09:01:54',NULL,NULL,NULL),(1210,4,4,'/post/14','2018-10-09 09:01:58',NULL,NULL,NULL),(1211,4,4,'/post/14','2018-10-09 09:02:01',NULL,NULL,NULL),(1212,4,4,'/post/14','2018-10-09 09:02:02',NULL,NULL,NULL),(1213,4,4,'/post/14','2018-10-09 09:02:04',NULL,NULL,NULL),(1214,4,4,'/post/14','2018-10-09 09:02:07',NULL,NULL,NULL),(1215,4,4,'/post/14','2018-10-09 09:02:11',NULL,NULL,NULL),(1216,4,4,'/post/14','2018-10-09 09:02:13',NULL,NULL,NULL),(1217,4,4,'/post/14','2018-10-09 09:03:40',NULL,NULL,NULL),(1218,4,4,'/post/14','2018-10-09 09:03:43',NULL,NULL,NULL),(1219,4,4,'/post/14','2018-10-09 09:03:45',NULL,NULL,NULL),(1220,4,4,'/post/14','2018-10-09 09:03:50',NULL,NULL,NULL),(1221,4,4,'/post/14','2018-10-09 09:04:00',NULL,NULL,NULL),(1222,4,4,'/posts','2018-10-09 09:04:01',NULL,NULL,NULL),(1223,4,4,'/post/14','2018-10-09 09:04:03',NULL,NULL,NULL),(1224,4,4,'/posts','2018-10-09 09:04:05',NULL,NULL,NULL),(1225,4,4,'/post/13','2018-10-09 09:04:05',NULL,NULL,NULL),(1226,4,4,'/posts','2018-10-09 09:04:07',NULL,NULL,NULL),(1227,4,4,'/post/14','2018-10-09 09:04:08',NULL,NULL,NULL),(1228,4,4,'/posts','2018-10-09 09:04:08',NULL,NULL,NULL),(1229,4,4,'/posts','2018-10-09 09:04:11',NULL,NULL,NULL),(1230,4,4,'/posts','2018-10-09 09:04:20',NULL,NULL,NULL),(1231,4,4,'/posts','2018-10-09 09:04:24',NULL,NULL,NULL),(1232,4,4,'/posts','2018-10-09 09:04:28',NULL,NULL,NULL),(1233,4,4,'/posts','2018-10-09 09:04:31',NULL,NULL,NULL),(1234,4,4,'/posts','2018-10-09 09:04:32',NULL,NULL,NULL),(1235,4,4,'/posts','2018-10-09 09:04:34',NULL,NULL,NULL),(1236,4,4,'/posts','2018-10-09 09:04:36',NULL,NULL,NULL),(1237,4,4,'/post/14','2018-10-09 09:04:39',NULL,NULL,NULL),(1238,4,4,'/post/14','2018-10-09 09:04:42',NULL,NULL,NULL),(1239,4,4,'/post/14','2018-10-09 09:05:59',NULL,NULL,NULL),(1240,4,4,'/posts','2018-10-09 09:06:03',NULL,NULL,NULL),(1241,4,4,'/posts','2018-10-09 09:06:07',NULL,NULL,NULL),(1242,4,4,'/posts','2018-10-09 09:06:08',NULL,NULL,NULL),(1243,4,4,'/posts','2018-10-09 09:06:09',NULL,NULL,NULL),(1244,4,4,'/posts','2018-10-09 09:06:11',NULL,NULL,NULL),(1245,4,4,'/posts','2018-10-09 09:07:51',NULL,NULL,NULL),(1246,4,4,'/posts','2018-10-09 09:07:55',NULL,NULL,NULL),(1247,4,4,'/posts','2018-10-09 09:07:59',NULL,NULL,NULL),(1248,4,4,'/posts','2018-10-09 09:08:05',NULL,NULL,NULL),(1249,4,4,'/posts','2018-10-09 09:08:09',NULL,NULL,NULL),(1250,4,4,'/posts','2018-10-09 09:08:14',NULL,NULL,NULL),(1251,4,4,'/posts','2018-10-09 09:08:19',NULL,NULL,NULL),(1252,4,4,'/posts','2018-10-09 09:08:23',NULL,NULL,NULL),(1253,4,4,'/posts','2018-10-09 09:09:48',NULL,NULL,NULL),(1254,4,4,'/posts','2018-10-09 09:09:49',NULL,NULL,NULL),(1255,4,4,'/posts','2018-10-09 09:09:51',NULL,NULL,NULL),(1256,4,4,'/posts','2018-10-09 09:09:53',NULL,NULL,NULL),(1257,4,4,'/posts','2018-10-09 09:09:54',NULL,NULL,NULL),(1258,4,4,'/posts','2018-10-09 09:09:58',NULL,NULL,NULL),(1259,4,4,'/posts','2018-10-09 09:10:02',NULL,NULL,NULL),(1260,5,5,'/posts','2018-10-09 09:10:33',NULL,NULL,NULL),(1261,5,5,'/login','2018-10-09 09:10:37',NULL,NULL,NULL),(1262,5,5,'/posts','2018-10-09 09:10:41',NULL,NULL,NULL),(1263,6,6,'/posts','2018-10-09 09:11:02',NULL,NULL,NULL),(1264,6,6,'/posts','2018-10-09 09:11:07',NULL,NULL,NULL),(1265,6,6,'/login','2018-10-09 09:13:41',NULL,NULL,NULL),(1266,6,6,'/posts','2018-10-09 09:13:45',NULL,NULL,NULL),(1267,6,6,'/posts','2018-10-09 09:13:47',NULL,NULL,NULL),(1268,6,6,'/posts','2018-10-09 09:13:55',NULL,NULL,NULL),(1269,6,6,'/posts','2018-10-09 09:13:57',NULL,NULL,NULL),(1270,6,6,'/posts','2018-10-09 09:14:01',NULL,NULL,NULL),(1271,6,6,'/posts','2018-10-09 09:14:05',NULL,NULL,NULL),(1272,6,6,'/post/14','2018-10-09 09:15:01',NULL,NULL,NULL),(1273,6,6,'/post/14','2018-10-09 09:15:03',NULL,NULL,NULL),(1274,6,6,'/post/14','2018-10-09 09:16:06',NULL,NULL,NULL),(1275,6,6,'/posts','2018-10-09 09:16:10',NULL,NULL,NULL),(1276,6,6,'/post/14','2018-10-09 09:16:12',NULL,NULL,NULL),(1277,6,6,'/post/14','2018-10-09 09:16:15',NULL,NULL,NULL),(1278,6,6,'/posts','2018-10-09 09:17:36',NULL,NULL,NULL),(1279,6,6,'/posts','2018-10-09 09:18:15',NULL,NULL,NULL),(1280,6,6,'/posts','2018-10-09 09:19:08',NULL,NULL,NULL),(1281,6,6,'/posts','2018-10-09 09:20:01',NULL,NULL,NULL),(1282,6,6,'/posts','2018-10-09 09:20:08',NULL,NULL,NULL),(1283,6,6,'/posts','2018-10-09 09:20:13',NULL,NULL,NULL),(1284,6,6,'/posts','2018-10-09 09:20:14',NULL,NULL,NULL),(1285,6,6,'/post/9','2018-10-09 09:20:46',NULL,NULL,NULL),(1286,6,6,'/posts','2018-10-09 09:20:49',NULL,NULL,NULL),(1287,6,6,'/posts','2018-10-09 09:20:51',NULL,NULL,NULL),(1288,6,6,'/post/9','2018-10-09 09:20:52',NULL,NULL,NULL),(1289,6,6,'/post/9','2018-10-09 09:20:54',NULL,NULL,NULL),(1290,6,6,'/post/9','2018-10-09 09:22:31',NULL,NULL,NULL),(1291,6,6,'/post/9','2018-10-09 09:23:59',NULL,NULL,NULL),(1292,6,6,'/post/9','2018-10-09 09:24:01',NULL,NULL,NULL),(1293,6,6,'/post/9','2018-10-09 09:24:03',NULL,NULL,NULL),(1294,6,6,'/post/9','2018-10-09 09:24:42',NULL,NULL,NULL),(1295,6,6,'/post/9','2018-10-09 09:24:49',NULL,NULL,NULL),(1296,6,6,'/post/9','2018-10-09 09:25:12',NULL,NULL,NULL),(1297,6,6,'/post/9','2018-10-09 09:25:32',NULL,NULL,NULL),(1298,6,6,'/post/9','2018-10-09 09:25:38',NULL,NULL,NULL),(1299,6,6,'/post/9','2018-10-09 09:27:37',NULL,NULL,NULL),(1300,6,6,'/post/9','2018-10-09 09:32:36',NULL,NULL,NULL),(1301,6,6,'/post/9','2018-10-09 09:33:00',NULL,NULL,NULL),(1302,6,6,'/post/9','2018-10-09 09:33:07',NULL,NULL,NULL),(1303,6,6,'/post/9','2018-10-09 09:33:34',NULL,NULL,NULL),(1304,6,6,'/posts','2018-10-09 09:34:18',NULL,NULL,NULL),(1305,6,6,'/post/9','2018-10-09 09:34:20',NULL,NULL,NULL),(1306,6,6,'/post/9','2018-10-09 09:34:22',NULL,NULL,NULL),(1307,6,6,'/post/9','2018-10-09 09:34:27',NULL,NULL,NULL),(1308,6,6,'/post/9','2018-10-09 09:34:28',NULL,NULL,NULL),(1309,6,6,'/shops-list','2018-10-09 09:34:30',NULL,NULL,NULL),(1310,6,6,'/reviews','2018-10-09 09:34:32',NULL,NULL,NULL),(1311,6,6,'/posts','2018-10-09 09:34:33',NULL,NULL,NULL),(1312,6,6,'/post/10','2018-10-09 09:34:34',NULL,NULL,NULL),(1313,6,6,'/posts','2018-10-09 09:34:36',NULL,NULL,NULL),(1314,6,6,'/post/9','2018-10-09 09:34:37',NULL,NULL,NULL),(1315,6,6,'/posts','2018-10-09 09:34:38',NULL,NULL,NULL),(1316,6,6,'/post/11','2018-10-09 09:34:39',NULL,NULL,NULL),(1317,6,6,'/posts','2018-10-09 09:34:41',NULL,NULL,NULL),(1318,6,6,'/post/13','2018-10-09 09:34:42',NULL,NULL,NULL),(1319,6,6,'/posts','2018-10-09 09:34:43',NULL,NULL,NULL),(1320,6,6,'/posts','2018-10-09 09:38:53',NULL,NULL,NULL),(1321,6,6,'/post/9','2018-10-09 09:39:04',NULL,NULL,NULL),(1322,6,6,'/post/9','2018-10-09 09:39:05',NULL,NULL,NULL),(1323,6,6,'/post/9','2018-10-09 09:39:07',NULL,NULL,NULL),(1324,6,6,'/store','2018-10-09 09:43:43',NULL,NULL,NULL),(1325,6,6,'/store-cat/2','2018-10-09 09:43:47',NULL,NULL,NULL),(1326,6,6,'/store-cat/1','2018-10-09 09:43:50',NULL,NULL,NULL),(1327,6,6,'/store-pos/1','2018-10-09 09:43:54',NULL,NULL,NULL),(1328,6,6,'/store-pos/1','2018-10-09 09:43:57',NULL,NULL,NULL),(1329,6,6,'/store-pos/1','2018-10-09 09:44:03',NULL,NULL,NULL),(1330,6,6,'/cart','2018-10-09 09:44:10',NULL,NULL,NULL),(1331,6,6,'/cart','2018-10-09 09:44:11',NULL,NULL,NULL),(1332,6,6,'/store','2018-10-09 09:44:14',NULL,NULL,NULL),(1333,6,6,'/store-cat/1','2018-10-09 09:44:15',NULL,NULL,NULL),(1334,6,6,'/store-pos/1','2018-10-09 09:44:18',NULL,NULL,NULL),(1335,6,6,'/store-pos/1','2018-10-09 09:44:42',NULL,NULL,NULL),(1336,6,6,'/store-pos/1','2018-10-09 09:44:48',NULL,NULL,NULL),(1337,6,6,'/store-pos/1','2018-10-09 09:44:50',NULL,NULL,NULL),(1338,6,6,'/store-pos/1','2018-10-09 09:44:51',NULL,NULL,NULL),(1339,6,6,'/store-pos/1','2018-10-09 09:45:02',NULL,NULL,NULL),(1340,6,6,'/store-pos/1','2018-10-09 09:45:04',NULL,NULL,NULL),(1341,6,6,'/admin','2018-10-09 09:45:50',NULL,NULL,NULL),(1342,6,6,'/admin-globals','2018-10-09 09:45:51',NULL,NULL,NULL),(1343,6,6,'/store-cat/1','2018-10-09 09:46:19',NULL,NULL,NULL),(1344,6,6,'/store-pos/1','2018-10-09 09:46:21',NULL,NULL,NULL),(1345,6,6,'/shops-list','2018-10-09 09:48:22',NULL,NULL,NULL),(1346,6,6,'/shops-list','2018-10-09 09:48:31',NULL,NULL,NULL),(1347,6,6,'/shop-page/2','2018-10-09 09:48:35',NULL,NULL,NULL),(1348,6,6,'/shop-page/2','2018-10-09 09:48:40',NULL,NULL,NULL),(1349,6,6,'/shop-page/2','2018-10-09 09:48:43',NULL,NULL,NULL),(1350,6,6,'/shop-page/2','2018-10-09 09:48:44',NULL,NULL,NULL),(1351,6,6,'/shop-page/2','2018-10-09 09:48:49',NULL,NULL,NULL),(1352,6,6,'/shop-page/2','2018-10-09 09:49:00',NULL,NULL,NULL),(1353,6,6,'/shop-page/2','2018-10-09 09:49:10',NULL,NULL,NULL),(1354,6,6,'/shops-list','2018-10-09 09:49:11',NULL,NULL,NULL),(1355,6,6,'/shop-page/2','2018-10-09 09:49:12',NULL,NULL,NULL),(1356,6,6,'/shops-list','2018-10-09 09:49:13',NULL,NULL,NULL),(1357,6,6,'/shops-list','2018-10-09 09:50:20',NULL,NULL,NULL),(1358,6,6,'/shop-page/1','2018-10-09 09:50:52',NULL,NULL,NULL),(1359,6,6,'/shop-page/1','2018-10-09 09:50:55',NULL,NULL,NULL),(1360,6,6,'/shop-page/1','2018-10-09 09:51:17',NULL,NULL,NULL),(1361,6,6,'/shop-page/1','2018-10-09 09:51:18',NULL,NULL,NULL),(1362,6,6,'/shop-page/1','2018-10-09 09:51:24',NULL,NULL,NULL),(1363,6,6,'/shops-list','2018-10-09 09:51:36',NULL,NULL,NULL),(1364,6,6,'/shop-page/1','2018-10-09 09:51:38',NULL,NULL,NULL),(1365,6,6,'/shop-page/1','2018-10-09 09:51:39',NULL,NULL,NULL),(1366,6,6,'/shop-page/1','2018-10-09 09:51:51',NULL,NULL,NULL),(1367,6,6,'/shop-page/1','2018-10-09 09:52:54',NULL,NULL,NULL),(1368,6,6,'/shop-page/1','2018-10-09 09:52:56',NULL,NULL,NULL),(1369,6,6,'/polytics','2018-10-09 09:53:37',NULL,NULL,NULL),(1370,6,6,'/shops-list','2018-10-09 09:53:38',NULL,NULL,NULL),(1371,6,6,'/reviews','2018-10-09 10:44:23',NULL,NULL,NULL),(1372,6,6,'/reviews','2018-10-09 10:44:26',NULL,NULL,NULL),(1373,6,6,'/reviews','2018-10-09 10:44:29',NULL,NULL,NULL),(1374,6,6,'/reviews','2018-10-09 10:44:31',NULL,NULL,NULL),(1375,6,6,'/reviews','2018-10-09 10:44:32',NULL,NULL,NULL),(1376,6,6,'/reviews','2018-10-09 10:44:35',NULL,NULL,NULL),(1377,6,6,'/reviews','2018-10-09 10:44:41',NULL,NULL,NULL),(1378,7,7,'/reviews','2018-10-09 10:44:46',NULL,NULL,NULL),(1379,7,7,'/login','2018-10-09 10:44:49',NULL,NULL,NULL),(1380,7,7,'/reviews','2018-10-09 10:44:53',NULL,NULL,NULL),(1381,7,7,'/reviews','2018-10-09 10:45:06',NULL,NULL,NULL),(1382,7,7,'/reviews','2018-10-09 10:45:12',NULL,NULL,NULL),(1383,7,7,'/reviews','2018-10-09 10:45:15',NULL,NULL,NULL),(1384,7,7,'/reviews','2018-10-09 10:45:16',NULL,NULL,NULL),(1385,8,8,'/reviews','2018-10-09 10:45:20',NULL,NULL,NULL),(1386,8,8,'/reviews','2018-10-09 10:45:25',NULL,NULL,NULL),(1387,8,8,'/login','2018-10-09 10:45:34',NULL,NULL,NULL),(1388,8,8,'/reviews','2018-10-09 10:45:37',NULL,NULL,NULL),(1389,8,8,'/reviews','2018-10-09 10:45:47',NULL,NULL,NULL),(1390,8,8,'/reviews','2018-10-09 10:45:51',NULL,NULL,NULL),(1391,8,8,'/reviews','2018-10-09 10:47:17',NULL,NULL,NULL),(1392,8,8,'/reviews','2018-10-09 10:47:19',NULL,NULL,NULL),(1393,8,8,'/reviews','2018-10-09 10:47:23',NULL,NULL,NULL),(1394,8,8,'/reviews','2018-10-09 10:49:56',NULL,NULL,NULL),(1395,8,8,'/reviews','2018-10-09 10:49:58',NULL,NULL,NULL),(1396,8,8,'/reviews','2018-10-09 10:50:00',NULL,NULL,NULL),(1397,8,8,'/reviews','2018-10-09 10:50:03',NULL,NULL,NULL),(1398,8,8,'/reviews','2018-10-09 10:51:23',NULL,NULL,NULL),(1399,8,8,'/reviews','2018-10-09 10:51:30',NULL,NULL,NULL),(1400,8,8,'/reviews','2018-10-09 10:51:41',NULL,NULL,NULL),(1401,8,8,'/reviews','2018-10-09 10:51:45',NULL,NULL,NULL),(1402,8,8,'/reviews','2018-10-09 10:51:47',NULL,NULL,NULL),(1403,8,8,'/reviews','2018-10-09 10:51:53',NULL,NULL,NULL),(1404,8,8,'/reviews','2018-10-09 10:51:54',NULL,NULL,NULL),(1405,8,8,'/reviews','2018-10-09 10:51:55',NULL,NULL,NULL),(1406,8,8,'/reviews','2018-10-09 10:51:58',NULL,NULL,NULL),(1407,8,8,'/reviews','2018-10-09 10:51:59',NULL,NULL,NULL),(1408,8,8,'/reviews','2018-10-09 10:52:00',NULL,NULL,NULL),(1409,8,8,'/reviews','2018-10-09 10:52:00',NULL,NULL,NULL),(1410,8,8,'/reviews','2018-10-09 10:56:26',NULL,NULL,NULL),(1411,8,8,'/reviews','2018-10-09 10:56:27',NULL,NULL,NULL),(1412,8,8,'/reviews','2018-10-09 10:56:28',NULL,NULL,NULL),(1413,8,8,'/reviews','2018-10-09 10:56:29',NULL,NULL,NULL),(1414,8,8,'/reviews','2018-10-09 10:56:30',NULL,NULL,NULL),(1415,8,8,'/reviews','2018-10-09 10:56:32',NULL,NULL,NULL),(1416,8,8,'/vacancies','2018-10-09 10:56:53',NULL,NULL,NULL),(1417,8,8,'/vacancies','2018-10-09 10:56:55',NULL,NULL,NULL),(1418,8,8,'/vacancies','2018-10-09 10:57:10',NULL,NULL,NULL),(1419,8,8,'/vacancies','2018-10-09 10:57:18',NULL,NULL,NULL),(1420,8,8,'/vacancies','2018-10-09 10:57:21',NULL,NULL,NULL),(1421,8,8,'/vacancies','2018-10-09 10:57:33',NULL,NULL,NULL),(1422,8,8,'/vacancies','2018-10-09 10:57:41',NULL,NULL,NULL),(1423,8,8,'/vacancies','2018-10-09 10:57:50',NULL,NULL,NULL),(1424,8,8,'/vacancy/1','2018-10-09 10:58:00',NULL,NULL,NULL),(1425,8,8,'/vacancy/2','2018-10-09 10:58:40',NULL,NULL,NULL),(1426,8,8,'/vacancy/2','2018-10-09 10:58:41',NULL,NULL,NULL),(1427,8,8,'/vacancies','2018-10-09 10:58:50',NULL,NULL,NULL),(1428,8,8,'/vacancies','2018-10-09 10:58:56',NULL,NULL,NULL),(1429,8,8,'/vacancy/2','2018-10-09 10:59:05',NULL,NULL,NULL),(1430,8,8,'/vacancy/2','2018-10-09 10:59:07',NULL,NULL,NULL),(1431,8,8,'/vacancy/2','2018-10-09 10:59:09',NULL,NULL,NULL),(1432,8,8,'/vacancy/2','2018-10-09 10:59:27',NULL,NULL,NULL),(1433,8,8,'/vacancy/2','2018-10-09 10:59:29',NULL,NULL,NULL),(1434,8,8,'/vacancy/2','2018-10-09 10:59:33',NULL,NULL,NULL),(1435,8,8,'/vacancy/2','2018-10-09 10:59:34',NULL,NULL,NULL),(1436,8,8,'/vacancy/2','2018-10-09 10:59:35',NULL,NULL,NULL),(1437,8,8,'/vacancy/2','2018-10-09 10:59:37',NULL,NULL,NULL),(1438,8,8,'/vacancy/2','2018-10-09 10:59:38',NULL,NULL,NULL),(1439,8,8,'/vacancy/2','2018-10-09 10:59:39',NULL,NULL,NULL),(1440,8,8,'/vacancy/2','2018-10-09 11:00:08',NULL,NULL,NULL),(1441,8,8,'/vacancy/2','2018-10-09 11:00:11',NULL,NULL,NULL),(1442,8,8,'/vacancy/2','2018-10-09 11:00:12',NULL,NULL,NULL),(1443,8,8,'/vacancy/2','2018-10-09 11:00:14',NULL,NULL,NULL),(1444,8,8,'/vacancy/2','2018-10-09 11:00:14',NULL,NULL,NULL),(1445,8,8,'/vacancy/2','2018-10-09 11:00:16',NULL,NULL,NULL),(1446,8,8,'/vacancy/2','2018-10-09 11:00:21',NULL,NULL,NULL),(1447,8,8,'/vacancy/2','2018-10-09 11:00:32',NULL,NULL,NULL),(1448,8,8,'/vacancy/2','2018-10-09 11:00:34',NULL,NULL,NULL),(1449,8,8,'/vacancy/2','2018-10-09 11:01:15',NULL,NULL,NULL),(1450,8,8,'/vacancy/2','2018-10-09 11:01:18',NULL,NULL,NULL),(1451,8,8,'/vacancy/2','2018-10-09 11:01:19',NULL,NULL,NULL),(1452,8,8,'/vacancy/2','2018-10-09 11:01:20',NULL,NULL,NULL),(1453,8,8,'/vacancies','2018-10-09 11:01:23',NULL,NULL,NULL),(1454,8,8,'/vacancies','2018-10-09 11:01:25',NULL,NULL,NULL),(1455,8,8,'/vacancies','2018-10-09 11:01:26',NULL,NULL,NULL),(1456,8,8,'/vacancies','2018-10-09 11:01:32',NULL,NULL,NULL),(1457,8,8,'/vacancies','2018-10-09 11:01:33',NULL,NULL,NULL),(1458,8,8,'/vacancy/1','2018-10-09 11:01:36',NULL,NULL,NULL),(1459,8,8,'/vacancy/1','2018-10-09 11:01:38',NULL,NULL,NULL),(1460,8,8,'/vacancy/1','2018-10-09 11:01:44',NULL,NULL,NULL),(1461,8,8,'/vacancy/1','2018-10-09 11:01:45',NULL,NULL,NULL),(1462,8,8,'/vacancies','2018-10-09 11:01:47',NULL,NULL,NULL),(1463,8,8,'/vacancies','2018-10-09 11:01:50',NULL,NULL,NULL),(1464,8,8,'/vacancy/2','2018-10-09 11:01:54',NULL,NULL,NULL),(1465,8,8,'/vacancies','2018-10-09 11:02:45',NULL,NULL,NULL),(1466,8,8,'/vacancies','2018-10-09 11:02:50',NULL,NULL,NULL),(1467,8,8,'/vacancy/1','2018-10-09 11:02:58',NULL,NULL,NULL),(1468,8,8,'/honors','2018-10-09 11:15:47',NULL,NULL,NULL),(1469,8,8,'/honors','2018-10-09 11:15:53',NULL,NULL,NULL),(1470,8,8,'/honors','2018-10-09 11:15:57',NULL,NULL,NULL),(1471,8,8,'/honors','2018-10-09 11:16:01',NULL,NULL,NULL),(1472,8,8,'/honors','2018-10-09 11:16:04',NULL,NULL,NULL),(1473,8,8,'/honors','2018-10-09 11:16:07',NULL,NULL,NULL),(1474,8,8,'/honors','2018-10-09 11:16:09',NULL,NULL,NULL),(1475,8,8,'/honors','2018-10-09 11:16:11',NULL,NULL,NULL),(1476,8,8,'/honors','2018-10-09 11:16:15',NULL,NULL,NULL),(1477,8,8,'/honors','2018-10-09 11:16:18',NULL,NULL,NULL),(1478,8,8,'/honors','2018-10-09 11:16:20',NULL,NULL,NULL),(1479,8,8,'/honors','2018-10-09 11:16:24',NULL,NULL,NULL),(1480,8,8,'/honors','2018-10-09 11:16:38',NULL,NULL,NULL),(1481,8,8,'/honors','2018-10-09 11:16:41',NULL,NULL,NULL),(1482,8,8,'/honors','2018-10-09 11:16:45',NULL,NULL,NULL),(1483,8,8,'/honors','2018-10-09 11:16:46',NULL,NULL,NULL),(1484,8,8,'/honors','2018-10-09 11:16:49',NULL,NULL,NULL),(1485,8,8,'/honors','2018-10-09 11:16:50',NULL,NULL,NULL),(1486,8,8,'/honors','2018-10-09 11:16:54',NULL,NULL,NULL),(1487,8,8,'/honors','2018-10-09 11:16:55',NULL,NULL,NULL),(1488,8,8,'/honors','2018-10-09 11:16:57',NULL,NULL,NULL),(1489,8,8,'/honors','2018-10-09 11:17:00',NULL,NULL,NULL),(1490,8,8,'/honors','2018-10-09 11:17:01',NULL,NULL,NULL),(1491,8,8,'/honors','2018-10-09 11:17:03',NULL,NULL,NULL),(1492,8,8,'/honors','2018-10-09 11:17:04',NULL,NULL,NULL),(1493,8,8,'/honors','2018-10-09 11:17:06',NULL,NULL,NULL),(1494,8,8,'/honors','2018-10-09 11:17:08',NULL,NULL,NULL),(1495,8,8,'/honors','2018-10-09 11:17:09',NULL,NULL,NULL),(1496,8,8,'/honors','2018-10-09 11:17:14',NULL,NULL,NULL),(1497,8,8,'/honors','2018-10-09 11:17:18',NULL,NULL,NULL),(1498,8,8,'/honors','2018-10-09 11:17:21',NULL,NULL,NULL),(1499,8,8,'/honors','2018-10-09 11:17:23',NULL,NULL,NULL),(1500,8,8,'/honors','2018-10-09 11:17:25',NULL,NULL,NULL),(1501,8,8,'/honors','2018-10-09 11:17:27',NULL,NULL,NULL),(1502,8,8,'/honors','2018-10-09 11:17:29',NULL,NULL,NULL),(1503,8,8,'/honors','2018-10-09 11:18:34',NULL,NULL,NULL),(1504,8,8,'/honors','2018-10-09 11:18:36',NULL,NULL,NULL),(1505,8,8,'/honors','2018-10-09 11:18:44',NULL,NULL,NULL),(1506,8,8,'/honors','2018-10-09 11:18:45',NULL,NULL,NULL),(1507,8,8,'/honors','2018-10-09 11:18:48',NULL,NULL,NULL),(1508,8,8,'/favicon.ico','2018-10-09 11:20:02',NULL,NULL,NULL),(1509,8,8,'/feedback','2018-10-09 11:21:27',NULL,NULL,NULL),(1510,8,8,'/feedback','2018-10-09 11:21:30',NULL,NULL,NULL),(1511,8,8,'/feedback','2018-10-09 11:21:47',NULL,NULL,NULL),(1512,8,8,'/feedback','2018-10-09 11:21:58',NULL,NULL,NULL),(1513,8,8,'/feedback','2018-10-09 11:21:59',NULL,NULL,NULL),(1514,8,8,'/feedback','2018-10-09 11:22:04',NULL,NULL,NULL),(1515,8,8,'/feedback','2018-10-09 11:22:07',NULL,NULL,NULL),(1516,8,8,'/feedback','2018-10-09 11:22:12',NULL,NULL,NULL),(1517,8,8,'/feedback','2018-10-09 11:22:14',NULL,NULL,NULL),(1518,8,8,'/faq','2018-10-09 15:39:45',NULL,NULL,NULL),(1519,8,8,'/faq','2018-10-09 15:40:21',NULL,NULL,NULL),(1520,8,8,'/faq','2018-10-09 15:40:31',NULL,NULL,NULL),(1521,8,8,'/faq','2018-10-09 15:40:34',NULL,NULL,NULL),(1522,8,8,'/faq','2018-10-09 15:41:08',NULL,NULL,NULL),(1523,8,8,'/faq','2018-10-09 15:41:13',NULL,NULL,NULL),(1524,8,8,'/faq','2018-10-09 15:41:16',NULL,NULL,NULL),(1525,8,8,'/faq','2018-10-09 15:41:19',NULL,NULL,NULL),(1526,8,8,'/faq','2018-10-09 15:43:38',NULL,NULL,NULL),(1527,8,8,'/faq','2018-10-09 15:43:43',NULL,NULL,NULL),(1528,8,8,'/faq','2018-10-09 15:43:54',NULL,NULL,NULL),(1529,8,8,'/faq','2018-10-09 15:44:01',NULL,NULL,NULL),(1530,8,8,'/faq','2018-10-09 15:44:07',NULL,NULL,NULL),(1531,8,8,'/faq','2018-10-09 15:44:13',NULL,NULL,NULL),(1532,8,8,'/faq','2018-10-09 15:46:00',NULL,NULL,NULL),(1533,8,8,'/faq','2018-10-09 15:46:03',NULL,NULL,NULL),(1534,8,8,'/faq','2018-10-09 15:47:21',NULL,NULL,NULL),(1535,8,8,'/faq','2018-10-09 15:47:29',NULL,NULL,NULL),(1536,8,8,'/faq','2018-10-09 15:47:36',NULL,NULL,NULL),(1537,8,8,'/faq','2018-10-09 15:47:43',NULL,NULL,NULL),(1538,8,8,'/faq','2018-10-09 15:47:56',NULL,NULL,NULL),(1539,8,8,'/faq','2018-10-09 15:49:38',NULL,NULL,NULL),(1540,8,8,'/faq','2018-10-09 15:50:01',NULL,NULL,NULL),(1541,8,8,'/faq','2018-10-09 15:56:44',NULL,NULL,NULL),(1542,8,8,'/feedback','2018-10-09 15:56:50',NULL,NULL,NULL),(1543,8,8,'/feedback','2018-10-09 15:56:55',NULL,NULL,NULL),(1544,8,8,'/feedback','2018-10-09 15:58:39',NULL,NULL,NULL),(1545,8,8,'/feedback','2018-10-09 15:58:45',NULL,NULL,NULL),(1546,8,8,'/history','2018-10-09 15:58:54',NULL,NULL,NULL),(1547,8,8,'/feedback','2018-10-09 15:58:56',NULL,NULL,NULL),(1548,8,8,'/feedback','2018-10-09 15:58:59',NULL,NULL,NULL),(1549,8,8,'/feedback','2018-10-09 15:59:01',NULL,NULL,NULL),(1550,8,8,'/feedback','2018-10-09 15:59:02',NULL,NULL,NULL),(1551,8,8,'/feedback','2018-10-09 15:59:07',NULL,NULL,NULL),(1552,8,8,'/feedback','2018-10-09 15:59:08',NULL,NULL,NULL),(1553,8,8,'/feedback','2018-10-09 15:59:10',NULL,NULL,NULL),(1554,8,8,'/vacancies','2018-10-09 15:59:12',NULL,NULL,NULL),(1555,8,8,'/faq','2018-10-09 15:59:13',NULL,NULL,NULL),(1556,8,8,'/honors','2018-10-09 15:59:14',NULL,NULL,NULL),(1557,8,8,'/reviews','2018-10-09 15:59:15',NULL,NULL,NULL),(1558,8,8,'/posts','2018-10-09 15:59:16',NULL,NULL,NULL),(1559,8,8,'/shops-list','2018-10-09 15:59:17',NULL,NULL,NULL),(1560,8,8,'/history','2018-10-09 15:59:18',NULL,NULL,NULL),(1561,8,8,'/history','2018-10-09 15:59:23',NULL,NULL,NULL),(1562,8,8,'/history','2018-10-09 15:59:26',NULL,NULL,NULL),(1563,8,8,'/history','2018-10-09 16:00:07',NULL,NULL,NULL),(1564,8,8,'/history','2018-10-09 16:00:24',NULL,NULL,NULL),(1565,8,8,'/history','2018-10-09 16:01:23',NULL,NULL,NULL),(1566,8,8,'/history','2018-10-09 16:01:25',NULL,NULL,NULL),(1567,8,8,'/history','2018-10-09 16:02:16',NULL,NULL,NULL),(1568,8,8,'/history','2018-10-09 16:02:20',NULL,NULL,NULL),(1569,8,8,'/history','2018-10-09 16:03:59',NULL,NULL,NULL),(1570,8,8,'/history','2018-10-09 16:07:43',NULL,NULL,NULL),(1571,8,8,'/history','2018-10-09 16:07:50',NULL,NULL,NULL),(1572,8,8,'/history','2018-10-09 16:09:08',NULL,NULL,NULL),(1573,8,8,'/history','2018-10-09 16:09:15',NULL,NULL,NULL),(1574,8,8,'/history','2018-10-09 16:09:48',NULL,NULL,NULL),(1575,8,8,'/history','2018-10-09 16:09:52',NULL,NULL,NULL),(1576,8,8,'/history','2018-10-09 16:09:59',NULL,NULL,NULL),(1577,8,8,'/history','2018-10-09 16:10:04',NULL,NULL,NULL),(1578,8,8,'/history','2018-10-09 16:10:15',NULL,NULL,NULL),(1579,8,8,'/admin','2018-10-09 16:10:27',NULL,NULL,NULL),(1580,8,8,'/admin','2018-10-09 16:11:30',NULL,NULL,NULL),(1581,8,8,'/admin','2018-10-09 16:11:32',NULL,NULL,NULL),(1582,8,8,'/admin','2018-10-09 16:11:41',NULL,NULL,NULL),(1583,8,8,'/admin','2018-10-09 16:11:46',NULL,NULL,NULL),(1584,8,8,'/admin','2018-10-09 16:15:21',NULL,NULL,NULL),(1585,8,8,'/admin-routes','2018-10-09 16:16:01',NULL,NULL,NULL),(1586,8,8,'/admin-feedback','2018-10-09 16:16:03',NULL,NULL,NULL),(1587,8,8,'/admin-clients','2018-10-09 16:16:04',NULL,NULL,NULL),(1588,8,8,'/admin-attendance','2018-10-09 16:16:05',NULL,NULL,NULL),(1589,8,8,'/admin-feedback','2018-10-09 16:16:06',NULL,NULL,NULL),(1590,8,8,'/admin-routes','2018-10-09 16:19:27',NULL,NULL,NULL),(1591,8,8,'/history','2018-10-09 16:19:44',NULL,NULL,NULL),(1592,8,8,'/history','2018-10-09 16:19:49',NULL,NULL,NULL),(1593,8,8,'/history','2018-10-09 16:19:57',NULL,NULL,NULL),(1594,8,8,'/admin-routes','2018-10-09 16:25:40',NULL,NULL,NULL),(1595,8,8,'/admin-routes','2018-10-09 16:26:32',NULL,NULL,NULL),(1596,8,8,'/admin-routes','2018-10-09 16:28:53',NULL,NULL,NULL),(1597,8,8,'/admin-routes','2018-10-09 16:30:48',NULL,NULL,NULL),(1598,8,8,'/admin-routes','2018-10-09 16:31:19',NULL,NULL,NULL),(1599,8,8,'/admin-components','2018-10-09 16:32:15',NULL,NULL,NULL),(1600,8,8,'/admin-routes','2018-10-09 16:32:47',NULL,NULL,NULL),(1601,8,8,'/admin-routes','2018-10-09 16:33:14',NULL,NULL,NULL),(1602,8,8,'/%D1%82%D0%B5%D1%81%D1%82%D0%BE%D0%B2%D1%8B%D0%B9_%D0%BC%D0%B0%D1%80%D1%88%D1%80%D1%83%D1%82','2018-10-09 16:33:28',NULL,NULL,NULL),(1603,8,8,'/store-cat/2','2018-10-09 16:41:32',NULL,NULL,NULL),(1604,8,8,'/store-pos/10','2018-10-09 16:41:36',NULL,NULL,NULL),(1605,8,8,'/store-pos/10','2018-10-09 16:41:49',NULL,NULL,NULL),(1606,8,8,'/store-cat/2','2018-10-09 16:41:51',NULL,NULL,NULL),(1607,8,8,'/store-cat/2','2018-10-09 16:41:52',NULL,NULL,NULL),(1608,8,8,'/store-cat/2','2018-10-09 16:41:53',NULL,NULL,NULL),(1609,8,8,'/store-cat/2','2018-10-09 16:41:53',NULL,NULL,NULL),(1610,8,8,'/store-cat/2','2018-10-09 16:41:53',NULL,NULL,NULL),(1611,8,8,'/store-cat/2','2018-10-09 16:41:53',NULL,NULL,NULL),(1612,8,8,'/store-pos/10','2018-10-09 16:42:15',NULL,NULL,NULL),(1613,8,8,'/store-cat/2','2018-10-09 16:42:20',NULL,NULL,NULL),(1614,8,8,'/store-cat/2','2018-10-09 16:42:26',NULL,NULL,NULL),(1615,8,8,'/store-cat/2','2018-10-09 16:42:49',NULL,NULL,NULL),(1616,8,8,'/store-cat/2','2018-10-09 16:42:51',NULL,NULL,NULL),(1617,8,8,'/store-cat/2','2018-10-09 16:43:05',NULL,NULL,NULL),(1618,8,8,'/store-pos/12','2018-10-09 16:43:07',NULL,NULL,NULL),(1619,8,8,'/store-cat/2','2018-10-09 16:54:38',NULL,NULL,NULL),(1620,8,8,'/store-pos/13','2018-10-09 16:54:40',NULL,NULL,NULL),(1621,8,8,'/store-cat/2','2018-10-09 16:54:46',NULL,NULL,NULL),(1622,8,8,'/store-pos/12','2018-10-09 16:54:48',NULL,NULL,NULL),(1623,8,8,'/store-cat/2','2018-10-09 16:54:55',NULL,NULL,NULL),(1624,8,8,'/store-cat/2','2018-10-09 16:55:42',NULL,NULL,NULL),(1625,8,8,'/store-cat/2','2018-10-09 16:55:44',NULL,NULL,NULL),(1626,8,8,'/store-pos/14','2018-10-09 16:55:48',NULL,NULL,NULL),(1627,8,8,'/store-pos/14','2018-10-09 16:55:52',NULL,NULL,NULL),(1628,8,8,'/store-pos/14','2018-10-09 16:56:12',NULL,NULL,NULL),(1629,8,8,'/store-pos/14','2018-10-09 16:56:37',NULL,NULL,NULL),(1630,8,8,'/store-cat/2','2018-10-09 16:56:39',NULL,NULL,NULL),(1631,8,8,'/store-pos/13','2018-10-09 16:58:47',NULL,NULL,NULL),(1632,8,8,'/store-pos/12','2018-10-09 16:59:12',NULL,NULL,NULL),(1633,8,8,'/store-cat/2','2018-10-09 17:00:29',NULL,NULL,NULL),(1634,8,8,'/store-cat/1','2018-10-09 17:00:31',NULL,NULL,NULL),(1635,8,8,'/store-cat/2','2018-10-09 17:00:35',NULL,NULL,NULL),(1636,8,8,'/store-cat/1','2018-10-09 17:00:36',NULL,NULL,NULL),(1637,8,8,'/store-cat/2','2018-10-09 17:09:39',NULL,NULL,NULL),(1638,8,8,'/store-pos/12','2018-10-09 17:09:42',NULL,NULL,NULL),(1639,8,8,'/store-cat/2','2018-10-09 17:10:26',NULL,NULL,NULL),(1640,8,8,'/store-pos/15','2018-10-09 17:10:28',NULL,NULL,NULL),(1641,8,8,'/store-pos/13','2018-10-09 17:10:38',NULL,NULL,NULL),(1642,8,8,'/store-pos/12','2018-10-09 17:10:40',NULL,NULL,NULL),(1643,8,8,'/company','2018-10-09 17:35:38',NULL,NULL,NULL),(1644,8,8,'/shops-list','2018-10-09 17:35:42',NULL,NULL,NULL),(1645,8,8,'/store-cat/2','2018-10-09 18:01:24',NULL,NULL,NULL),(1646,8,8,'/store-cat/2','2018-10-09 18:01:38',NULL,NULL,NULL),(1647,8,8,'/store-cat/2','2018-10-09 18:02:14',NULL,NULL,NULL),(1648,8,8,'/store-pos/16','2018-10-09 18:02:17',NULL,NULL,NULL),(1649,8,8,'/store-pos/16','2018-10-09 18:02:53',NULL,NULL,NULL),(1650,8,8,'/store-pos/16','2018-10-09 18:03:12',NULL,NULL,NULL),(1651,8,8,'/store-cat/2','2018-10-09 18:04:33',NULL,NULL,NULL),(1652,8,8,'/store-cat/2','2018-10-09 18:04:48',NULL,NULL,NULL),(1653,8,8,'/store-pos/17','2018-10-09 18:04:50',NULL,NULL,NULL),(1654,8,8,'/store-pos/13','2018-10-09 18:04:52',NULL,NULL,NULL),(1655,8,8,'/store-pos/17','2018-10-09 18:05:29',NULL,NULL,NULL),(1656,8,8,'/store-pos/13','2018-10-09 18:05:31',NULL,NULL,NULL),(1657,8,8,'/store-cat/1','2018-10-09 18:05:34',NULL,NULL,NULL),(1658,8,8,'/store-cat/2','2018-10-09 18:05:35',NULL,NULL,NULL),(1659,8,8,'/store-cat/3','2018-10-09 18:05:37',NULL,NULL,NULL),(1660,8,8,'/store-cat/1','2018-10-09 18:05:38',NULL,NULL,NULL),(1661,8,8,'/store-cat/1','2018-10-09 18:07:00',NULL,NULL,NULL),(1662,9,9,'/','2018-10-10 15:42:21',NULL,NULL,NULL),(1663,9,9,'/company','2018-10-10 15:42:29',NULL,NULL,NULL),(1664,9,9,'/polytics','2018-10-10 15:42:30',NULL,NULL,NULL),(1665,9,9,'/history','2018-10-10 15:42:31',NULL,NULL,NULL),(1666,9,9,'/login','2018-10-10 15:42:46',NULL,NULL,NULL),(1667,9,9,'/history','2018-10-10 15:42:52',NULL,NULL,NULL),(1668,9,9,'/history','2018-10-10 15:42:55',NULL,NULL,NULL),(1669,9,9,'/history','2018-10-10 15:43:13',NULL,NULL,NULL),(1670,9,9,'/history','2018-10-10 15:43:16',NULL,NULL,NULL),(1671,9,9,'/history','2018-10-10 15:43:43',NULL,NULL,NULL),(1672,9,9,'/history','2018-10-10 15:46:01',NULL,NULL,NULL),(1673,9,9,'/history','2018-10-10 15:46:03',NULL,NULL,NULL),(1674,9,9,'/posts','2018-10-10 15:47:36',NULL,NULL,NULL),(1675,9,9,'/posts','2018-10-10 15:47:39',NULL,NULL,NULL),(1676,9,9,'/posts','2018-10-10 15:47:42',NULL,NULL,NULL),(1677,9,9,'/posts','2018-10-10 15:47:46',NULL,NULL,NULL),(1678,2613924,2615974,'/','2018-10-10 17:30:04',NULL,NULL,NULL),(1679,2613924,2615974,'/feedback','2018-10-10 17:30:08',NULL,NULL,NULL),(1680,2613924,2615974,'/','2018-10-10 18:22:50',NULL,NULL,NULL),(1681,2613924,2615974,'/store-cat/1','2018-10-10 18:22:54',NULL,NULL,NULL),(1682,2613924,2615974,'/store-cat/1','2018-10-10 18:23:28',NULL,NULL,NULL),(1683,2613924,2615974,'/store-pos/18','2018-10-10 18:23:32',NULL,NULL,NULL),(1684,2613924,2615974,'/admin','2018-10-10 18:25:05',NULL,NULL,NULL),(1685,2613924,2615974,'/crm-connect','2018-10-10 18:26:35',NULL,NULL,NULL),(1686,2613924,2615974,'/crm-connect','2018-10-10 18:28:05',NULL,NULL,NULL),(1687,10,10,'/','2018-10-12 09:38:16',NULL,NULL,NULL),(1688,10,10,'/posts','2018-10-12 09:38:20',NULL,NULL,NULL),(1689,10,10,'/post/9','2018-10-12 09:38:22',NULL,NULL,NULL),(1690,10,10,'/posts','2018-10-12 09:38:29',NULL,NULL,NULL),(1691,10,10,'/post/10','2018-10-12 09:38:30',NULL,NULL,NULL),(1692,10,10,'/posts','2018-10-12 09:38:32',NULL,NULL,NULL),(1693,10,10,'/post/11','2018-10-12 09:38:33',NULL,NULL,NULL),(1694,10,10,'/posts','2018-10-12 09:38:35',NULL,NULL,NULL),(1695,10,10,'/post/12','2018-10-12 09:38:36',NULL,NULL,NULL),(1696,10,10,'/posts','2018-10-12 09:38:38',NULL,NULL,NULL),(1697,10,10,'/post/14','2018-10-12 09:38:40',NULL,NULL,NULL),(1698,11,11,'/','2018-10-17 09:15:08',NULL,NULL,NULL),(1699,11,11,'/history','2018-10-17 09:15:12',NULL,NULL,NULL),(1700,11,11,'/login','2018-10-17 09:15:18',NULL,NULL,NULL),(1701,11,11,'/history','2018-10-17 09:15:22',NULL,NULL,NULL),(1702,11,11,'/history','2018-10-17 09:15:25',NULL,NULL,NULL),(1703,11,11,'/history','2018-10-17 09:15:40',NULL,NULL,NULL),(1704,11,11,'/history','2018-10-17 09:15:45',NULL,NULL,NULL),(1705,11,11,'/history','2018-10-17 09:16:34',NULL,NULL,NULL),(1706,11,11,'/history','2018-10-17 09:17:51',NULL,NULL,NULL),(1707,11,11,'/history','2018-10-17 09:17:54',NULL,NULL,NULL),(1708,11,11,'/history','2018-10-17 09:17:55',NULL,NULL,NULL),(1709,11,11,'/history','2018-10-17 09:29:44',NULL,NULL,NULL),(1710,11,11,'/history','2018-10-17 09:30:01',NULL,NULL,NULL),(1711,11,11,'/history','2018-10-17 09:30:13',NULL,NULL,NULL),(1712,11,11,'/history','2018-10-17 09:32:24',NULL,NULL,NULL),(1713,11,11,'/history','2018-10-17 09:38:21',NULL,NULL,NULL),(1714,11,11,'/history','2018-10-17 09:38:23',NULL,NULL,NULL),(1715,11,11,'/store-cat/1','2018-10-17 09:38:57',NULL,NULL,NULL),(1716,11,11,'/store-pos/1','2018-10-17 09:38:59',NULL,NULL,NULL),(1717,11,11,'/store-cat/1','2018-10-17 09:39:04',NULL,NULL,NULL),(1718,11,11,'/store-cat/1','2018-10-17 09:39:08',NULL,NULL,NULL),(1719,11,11,'/posts','2018-10-17 09:46:06',NULL,NULL,NULL),(1720,11,11,'/posts','2018-10-17 09:46:10',NULL,NULL,NULL),(1721,11,11,'/posts','2018-10-17 09:46:13',NULL,NULL,NULL),(1722,11,11,'/posts','2018-10-17 09:46:14',NULL,NULL,NULL),(1723,11,11,'/posts','2018-10-17 09:46:15',NULL,NULL,NULL),(1724,11,11,'/posts','2018-10-17 09:46:17',NULL,NULL,NULL),(1725,11,11,'/posts','2018-10-17 09:46:25',NULL,NULL,NULL),(1726,11,11,'/posts','2018-10-17 09:46:26',NULL,NULL,NULL),(1727,11,11,'/posts','2018-10-17 09:46:27',NULL,NULL,NULL),(1728,11,11,'/posts','2018-10-17 09:46:30',NULL,NULL,NULL),(1729,11,11,'/posts','2018-10-17 09:46:33',NULL,NULL,NULL),(1730,11,11,'/posts','2018-10-17 09:46:34',NULL,NULL,NULL),(1731,11,11,'/posts','2018-10-17 09:46:36',NULL,NULL,NULL),(1732,11,11,'/admin','2018-10-17 09:48:25',NULL,NULL,NULL),(1733,11,11,'/admin-globals','2018-10-17 09:48:27',NULL,NULL,NULL),(1734,11,11,'/admin-globals','2018-10-17 09:49:55',NULL,NULL,NULL),(1735,11,11,'/admin-globals','2018-10-17 09:50:35',NULL,NULL,NULL),(1736,11,11,'/admin-globals','2018-10-17 09:50:36',NULL,NULL,NULL),(1737,11,11,'/admin-globals','2018-10-17 09:50:48',NULL,NULL,NULL),(1738,11,11,'/admin-globals','2018-10-17 09:50:52',NULL,NULL,NULL),(1739,11,11,'/admin-globals','2018-10-17 09:50:52',NULL,NULL,NULL),(1740,11,11,'/store-cat/1','2018-10-17 09:50:56',NULL,NULL,NULL),(1741,11,11,'/store-pos/1','2018-10-17 09:51:00',NULL,NULL,NULL),(1742,11,11,'/store-pos/1','2018-10-17 09:52:32',NULL,NULL,NULL),(1743,11,11,'/store-pos/1','2018-10-17 09:52:39',NULL,NULL,NULL),(1744,11,11,'/store-pos/1','2018-10-17 09:52:45',NULL,NULL,NULL),(1745,11,11,'/store-pos/1','2018-10-17 09:52:59',NULL,NULL,NULL),(1746,11,11,'/store-pos/1','2018-10-17 09:53:04',NULL,NULL,NULL),(1747,11,11,'/store-pos/1','2018-10-17 09:53:05',NULL,NULL,NULL),(1748,11,11,'/store-pos/1','2018-10-17 09:53:08',NULL,NULL,NULL),(1749,11,11,'/store-pos/1','2018-10-17 09:53:09',NULL,NULL,NULL),(1750,11,11,'/store-pos/1','2018-10-17 09:53:10',NULL,NULL,NULL),(1751,11,11,'/store-pos/1','2018-10-17 09:58:43',NULL,NULL,NULL),(1752,11,11,'/store-pos/1','2018-10-17 09:58:51',NULL,NULL,NULL),(1753,11,11,'/store-pos/1','2018-10-17 10:00:05',NULL,NULL,NULL),(1754,11,11,'/store-pos/1','2018-10-17 10:00:20',NULL,NULL,NULL),(1755,11,11,'/store-pos/1','2018-10-17 10:00:45',NULL,NULL,NULL),(1756,11,11,'/store-pos/1','2018-10-17 10:01:27',NULL,NULL,NULL),(1757,11,11,'/store-pos/1','2018-10-17 10:03:48',NULL,NULL,NULL),(1758,11,11,'/store-pos/1','2018-10-17 10:04:44',NULL,NULL,NULL),(1759,11,11,'/store-pos/1','2018-10-17 10:04:48',NULL,NULL,NULL),(1760,11,11,'/store-pos/1','2018-10-17 10:04:51',NULL,NULL,NULL),(1761,11,11,'/honors','2018-10-17 10:04:55',NULL,NULL,NULL),(1762,11,11,'/honors','2018-10-17 10:05:03',NULL,NULL,NULL),(1763,11,11,'/store-cat/1','2018-10-17 10:06:32',NULL,NULL,NULL),(1764,11,11,'/store-pos/1','2018-10-17 10:06:34',NULL,NULL,NULL),(1765,11,11,'/admin','2018-10-17 10:06:58',NULL,NULL,NULL),(1766,11,11,'/admin-globals','2018-10-17 10:07:00',NULL,NULL,NULL),(1767,11,11,'/admin-globals','2018-10-17 10:07:02',NULL,NULL,NULL),(1768,11,11,'/admin-globals','2018-10-17 10:07:04',NULL,NULL,NULL),(1769,11,11,'/admin-globals','2018-10-17 10:07:06',NULL,NULL,NULL),(1770,11,11,'/store-pos/1','2018-10-17 10:07:08',NULL,NULL,NULL),(1771,11,11,'/store-pos/1','2018-10-17 10:08:08',NULL,NULL,NULL),(1772,11,11,'/store-pos/1','2018-10-17 10:10:22',NULL,NULL,NULL),(1773,11,11,'/store-pos/1','2018-10-17 10:10:28',NULL,NULL,NULL),(1774,11,11,'/store-pos/1','2018-10-17 10:10:37',NULL,NULL,NULL),(1775,11,11,'/store-pos/1','2018-10-17 10:10:50',NULL,NULL,NULL),(1776,11,11,'/store-pos/1','2018-10-17 10:11:20',NULL,NULL,NULL),(1777,11,11,'/store-pos/1','2018-10-17 10:11:24',NULL,NULL,NULL),(1778,11,11,'/store-pos/1','2018-10-17 10:13:12',NULL,NULL,NULL),(1779,11,11,'/store-pos/1','2018-10-17 10:13:15',NULL,NULL,NULL),(1780,11,11,'/store-pos/1','2018-10-17 10:15:05',NULL,NULL,NULL),(1781,11,11,'/company','2018-10-17 10:16:16',NULL,NULL,NULL),(1782,11,11,'/polytics','2018-10-17 10:16:22',NULL,NULL,NULL),(1783,11,11,'/polytics','2018-10-17 10:16:24',NULL,NULL,NULL),(1784,11,11,'/polytics','2018-10-17 10:16:26',NULL,NULL,NULL),(1785,11,11,'/posts','2018-10-17 10:16:28',NULL,NULL,NULL),(1786,11,11,'/posts','2018-10-17 10:16:29',NULL,NULL,NULL),(1787,11,11,'/posts','2018-10-17 10:16:30',NULL,NULL,NULL),(1788,11,11,'/store-cat/1','2018-10-17 10:18:50',NULL,NULL,NULL),(1789,11,11,'/store-pos/1','2018-10-17 10:18:53',NULL,NULL,NULL),(1790,11,11,'/store-pos/1','2018-10-17 10:18:57',NULL,NULL,NULL),(1791,11,11,'/store-pos/1','2018-10-17 10:19:26',NULL,NULL,NULL),(1792,11,11,'/store-pos/1','2018-10-17 10:19:39',NULL,NULL,NULL),(1793,11,11,'/store-pos/1','2018-10-17 10:19:39',NULL,NULL,NULL),(1794,11,11,'/store-pos/1','2018-10-17 10:19:40',NULL,NULL,NULL),(1795,11,11,'/store-pos/1','2018-10-17 10:19:40',NULL,NULL,NULL),(1796,11,11,'/store-pos/1','2018-10-17 10:19:40',NULL,NULL,NULL),(1797,11,11,'/store-pos/1','2018-10-17 10:22:14',NULL,NULL,NULL),(1798,11,11,'/store-pos/1','2018-10-17 10:22:14',NULL,NULL,NULL),(1799,11,11,'/store-pos/1','2018-10-17 10:22:14',NULL,NULL,NULL),(1800,11,11,'/store-pos/1','2018-10-17 10:22:14',NULL,NULL,NULL),(1801,11,11,'/store-pos/1','2018-10-17 10:22:23',NULL,NULL,NULL),(1802,11,11,'/store-pos/1','2018-10-17 10:22:30',NULL,NULL,NULL),(1803,11,11,'/store-cat/1','2018-10-17 10:22:35',NULL,NULL,NULL),(1804,11,11,'/nastolnyj-kompyuter-apple-imac-21.5','2018-10-17 10:22:39',NULL,NULL,NULL),(1805,11,11,'/store-cat/1','2018-10-17 10:22:42',NULL,NULL,NULL),(1806,11,11,'/nastolnyj-kompyuter-apple-imac-21.5','2018-10-17 10:23:04',NULL,NULL,NULL),(1807,11,11,'/nastolnyj-kompyuter-apple-imac-21.5','2018-10-17 10:23:05',NULL,NULL,NULL),(1808,11,11,'/nastolnyj-kompyuter-apple-imac-21.5','2018-10-17 10:29:59',NULL,NULL,NULL),(1809,11,11,'/honors','2018-10-17 11:05:54',NULL,NULL,NULL),(1810,11,11,'/honors','2018-10-17 11:05:57',NULL,NULL,NULL),(1811,11,11,'/honors','2018-10-17 11:06:01',NULL,NULL,NULL),(1812,11,11,'/honors','2018-10-17 11:06:03',NULL,NULL,NULL),(1813,11,11,'/honors','2018-10-17 11:06:05',NULL,NULL,NULL),(1814,11,11,'/honors','2018-10-17 11:06:07',NULL,NULL,NULL),(1815,11,11,'/honors','2018-10-17 11:06:09',NULL,NULL,NULL),(1816,11,11,'/honors','2018-10-17 11:06:11',NULL,NULL,NULL),(1817,11,11,'/honors','2018-10-17 11:06:12',NULL,NULL,NULL),(1818,11,11,'/honors','2018-10-17 11:06:18',NULL,NULL,NULL),(1819,11,11,'/honors','2018-10-17 11:06:20',NULL,NULL,NULL),(1820,11,11,'/honors','2018-10-17 11:06:22',NULL,NULL,NULL),(1821,11,11,'/honors','2018-10-17 11:06:24',NULL,NULL,NULL),(1822,11,11,'/polytics','2018-10-17 11:06:27',NULL,NULL,NULL),(1823,11,11,'/history','2018-10-17 11:06:28',NULL,NULL,NULL),(1824,11,11,'/polytics','2018-10-17 11:06:32',NULL,NULL,NULL),(1825,11,11,'/honors','2018-10-17 11:06:35',NULL,NULL,NULL),(1826,11,11,'/honors','2018-10-17 11:06:39',NULL,NULL,NULL),(1827,11,11,'/honors','2018-10-17 11:06:43',NULL,NULL,NULL),(1828,11,11,'/honors','2018-10-17 11:06:45',NULL,NULL,NULL),(1829,11,11,'/honors','2018-10-17 11:06:49',NULL,NULL,NULL),(1830,11,11,'/honors','2018-10-17 11:06:50',NULL,NULL,NULL),(1831,11,11,'/honors','2018-10-17 11:06:53',NULL,NULL,NULL),(1832,11,11,'/honors','2018-10-17 11:06:54',NULL,NULL,NULL),(1833,11,11,'/honors','2018-10-17 11:06:57',NULL,NULL,NULL),(1834,11,11,'/honors','2018-10-17 11:06:59',NULL,NULL,NULL),(1835,11,11,'/honors','2018-10-17 11:07:00',NULL,NULL,NULL),(1836,11,11,'/honors','2018-10-17 11:07:11',NULL,NULL,NULL),(1837,11,11,'/history','2018-10-17 11:07:45',NULL,NULL,NULL),(1838,11,11,'/history','2018-10-17 11:07:49',NULL,NULL,NULL),(1839,11,11,'/uploads/upload_3567a312aec44256a029443bfcb4e69f.gif','2018-10-17 11:07:51',NULL,NULL,NULL),(1840,11,11,'/uploads/upload_3567a312aec44256a029443bfcb4e69f.gif','2018-10-17 11:07:54',NULL,NULL,NULL),(1841,11,11,'/history','2018-10-17 11:09:26',NULL,NULL,NULL),(1842,11,11,'/history','2018-10-17 11:09:31',NULL,NULL,NULL),(1843,11,11,'/history','2018-10-17 11:09:37',NULL,NULL,NULL),(1844,11,11,'/history','2018-10-17 11:09:39',NULL,NULL,NULL),(1845,11,11,'/history','2018-10-17 11:09:51',NULL,NULL,NULL),(1846,11,11,'/history','2018-10-17 11:10:06',NULL,NULL,NULL),(1847,11,11,'/shops-list','2018-10-17 11:10:21',NULL,NULL,NULL),(1848,11,11,'/shop-page/2','2018-10-17 11:10:27',NULL,NULL,NULL),(1849,11,11,'/shop-page/2','2018-10-17 11:10:32',NULL,NULL,NULL),(1850,11,11,'/shops-list','2018-10-17 11:11:23',NULL,NULL,NULL),(1851,11,11,'/posts','2018-10-17 11:12:08',NULL,NULL,NULL),(1852,11,11,'/reviews','2018-10-17 11:12:13',NULL,NULL,NULL),(1853,11,11,'/honors','2018-10-17 11:12:17',NULL,NULL,NULL),(1854,11,11,'/honors','2018-10-17 11:12:21',NULL,NULL,NULL),(1855,11,11,'/honors','2018-10-17 11:12:23',NULL,NULL,NULL),(1856,11,11,'/honors','2018-10-17 11:12:25',NULL,NULL,NULL),(1857,11,11,'/faq','2018-10-17 11:12:27',NULL,NULL,NULL),(1858,11,11,'/faq','2018-10-17 11:12:54',NULL,NULL,NULL),(1859,11,11,'/faq','2018-10-17 11:12:57',NULL,NULL,NULL),(1860,11,11,'/faq','2018-10-17 11:13:20',NULL,NULL,NULL),(1861,11,11,'/faq','2018-10-17 11:13:30',NULL,NULL,NULL),(1862,11,11,'/faq','2018-10-17 11:13:32',NULL,NULL,NULL),(1863,11,11,'/faq','2018-10-17 11:13:37',NULL,NULL,NULL),(1864,11,11,'/faq','2018-10-17 11:13:40',NULL,NULL,NULL),(1865,11,11,'/faq','2018-10-17 11:13:44',NULL,NULL,NULL),(1866,11,11,'/faq','2018-10-17 11:13:45',NULL,NULL,NULL),(1867,11,11,'/vacancies','2018-10-17 11:13:49',NULL,NULL,NULL),(1868,11,11,'/feedback','2018-10-17 11:14:02',NULL,NULL,NULL),(1869,11,11,'/tpl-empty','2018-10-17 11:14:08',NULL,NULL,NULL),(1870,11,11,'/rituals','2018-10-17 11:14:10',NULL,NULL,NULL),(1871,11,11,'/memory_book','2018-10-17 11:14:11',NULL,NULL,NULL),(1872,11,11,'/burial_search','2018-10-17 11:14:12',NULL,NULL,NULL),(1873,11,11,'/store','2018-10-17 11:14:19',NULL,NULL,NULL),(1874,11,11,'/store-cat/1','2018-10-17 11:14:20',NULL,NULL,NULL),(1875,11,11,'/reviews','2018-10-17 11:14:23',NULL,NULL,NULL),(1876,11,11,'/rituals','2018-10-17 11:15:13',NULL,NULL,NULL),(1877,11,11,'/burial_search','2018-10-17 11:15:16',NULL,NULL,NULL),(1878,11,11,'/burial_search','2018-10-17 11:15:19',NULL,NULL,NULL),(1879,11,11,'/burial_search','2018-10-17 11:15:21',NULL,NULL,NULL),(1880,11,11,'/agents_old','2018-10-17 11:16:03',NULL,NULL,NULL),(1881,11,11,'/memory_book','2018-10-17 11:16:04',NULL,NULL,NULL),(1882,11,11,'/burial_search','2018-10-17 11:16:07',NULL,NULL,NULL),(1883,11,11,'/memory_book','2018-10-17 11:16:10',NULL,NULL,NULL),(1884,11,11,'/memory_book','2018-10-17 11:16:12',NULL,NULL,NULL),(1885,11,11,'/memory_book','2018-10-17 11:16:15',NULL,NULL,NULL),(1886,12,12,'/','2018-10-22 05:51:25',NULL,NULL,NULL),(1887,12,12,'/history','2018-10-22 05:51:30',NULL,NULL,NULL),(1888,12,12,'/polytics','2018-10-22 05:51:32',NULL,NULL,NULL),(1889,12,12,'/shops-list','2018-10-22 05:51:33',NULL,NULL,NULL),(1890,12,12,'/posts','2018-10-22 05:51:35',NULL,NULL,NULL),(1891,12,12,'/reviews','2018-10-22 05:51:37',NULL,NULL,NULL),(1892,12,12,'/honors','2018-10-22 05:51:49',NULL,NULL,NULL),(1893,12,12,'/store-cat/1','2018-10-22 05:52:01',NULL,NULL,NULL),(1894,12,12,'/store-pos/18','2018-10-22 05:52:04',NULL,NULL,NULL),(1895,12,12,'/store-cat/2','2018-10-22 05:52:08',NULL,NULL,NULL),(1896,12,12,'/store-cat/3','2018-10-22 05:52:09',NULL,NULL,NULL),(1897,12,12,'/store-cat/4','2018-10-22 05:52:12',NULL,NULL,NULL),(1898,12,12,'/store-cat/5','2018-10-22 05:52:15',NULL,NULL,NULL),(1899,12,12,'/rituals','2018-10-22 05:52:19',NULL,NULL,NULL),(1900,12,12,'/templates','2018-10-22 05:52:20',NULL,NULL,NULL),(1901,12,12,'/tpl-one','2018-10-22 05:52:22',NULL,NULL,NULL),(1902,12,12,'/tpl-two','2018-10-22 05:52:24',NULL,NULL,NULL),(1903,12,12,'/tpl-three','2018-10-22 05:52:26',NULL,NULL,NULL),(1904,12,12,'/posts','2018-10-22 05:52:29',NULL,NULL,NULL),(1905,12,12,'/post/9','2018-10-22 05:52:30',NULL,NULL,NULL),(1906,12,12,'/posts','2018-10-22 05:52:33',NULL,NULL,NULL),(1907,12,12,'/login','2018-10-22 05:52:34',NULL,NULL,NULL),(1908,12,12,'/posts','2018-10-22 05:52:40',NULL,NULL,NULL),(1909,12,12,'/post/9','2018-10-22 05:52:42',NULL,NULL,NULL),(1910,12,12,'/post/12','2018-10-22 05:52:44',NULL,NULL,NULL),(1911,12,12,'/posts','2018-10-22 05:52:47',NULL,NULL,NULL),(1912,12,12,'/post/12','2018-10-22 05:52:48',NULL,NULL,NULL),(1913,12,12,'/posts','2018-10-22 05:52:51',NULL,NULL,NULL),(1914,12,12,'/post/11','2018-10-22 05:52:52',NULL,NULL,NULL),(1915,12,12,'/posts','2018-10-22 05:52:54',NULL,NULL,NULL),(1916,12,12,'/post/13','2018-10-22 05:52:55',NULL,NULL,NULL),(1917,12,12,'/posts','2018-10-22 05:52:58',NULL,NULL,NULL),(1918,12,12,'/post/9','2018-10-22 05:52:59',NULL,NULL,NULL),(1919,12,12,'/post/14','2018-10-22 05:53:02',NULL,NULL,NULL),(1920,12,12,'/posts','2018-10-22 05:53:07',NULL,NULL,NULL),(1921,12,12,'/post/10','2018-10-22 05:53:10',NULL,NULL,NULL),(1922,12,12,'/posts','2018-10-22 05:53:11',NULL,NULL,NULL),(1923,12,12,'/post/9','2018-10-22 05:53:12',NULL,NULL,NULL),(1924,12,12,'/post/9','2018-10-22 05:53:13',NULL,NULL,NULL),(1925,12,12,'/post/9','2018-10-22 05:53:16',NULL,NULL,NULL),(1926,12,12,'/post/9','2018-10-22 05:54:05',NULL,NULL,NULL),(1927,12,12,'/post/9','2018-10-22 05:54:10',NULL,NULL,NULL),(1928,12,12,'/post/9','2018-10-22 05:56:52',NULL,NULL,NULL),(1929,12,12,'/post/9','2018-10-22 05:57:02',NULL,NULL,NULL),(1930,12,12,'/post/9','2018-10-22 05:57:09',NULL,NULL,NULL),(1931,12,12,'/store','2018-10-22 05:57:11',NULL,NULL,NULL),(1932,12,12,'/history','2018-10-22 05:57:13',NULL,NULL,NULL),(1933,12,12,'/polytics','2018-10-22 05:57:19',NULL,NULL,NULL),(1934,12,12,'/shops-list','2018-10-22 05:57:22',NULL,NULL,NULL),(1935,12,12,'/shop-page/1','2018-10-22 05:57:35',NULL,NULL,NULL),(1936,12,12,'/posts','2018-10-22 05:57:38',NULL,NULL,NULL),(1937,12,12,'/post/9','2018-10-22 05:57:41',NULL,NULL,NULL),(1938,12,12,'/post/9','2018-10-22 05:57:43',NULL,NULL,NULL),(1939,12,12,'/posts','2018-10-22 05:58:43',NULL,NULL,NULL),(1940,12,12,'/polytics','2018-10-22 05:58:48',NULL,NULL,NULL),(1941,12,12,'/history','2018-10-22 05:58:49',NULL,NULL,NULL),(1942,12,12,'/shops-list','2018-10-22 05:59:11',NULL,NULL,NULL),(1943,12,12,'/posts','2018-10-22 05:59:13',NULL,NULL,NULL),(1944,12,12,'/reviews','2018-10-22 05:59:14',NULL,NULL,NULL),(1945,12,12,'/honors','2018-10-22 05:59:17',NULL,NULL,NULL),(1946,12,12,'/faq','2018-10-22 05:59:19',NULL,NULL,NULL),(1947,12,12,'/vacancies','2018-10-22 05:59:24',NULL,NULL,NULL),(1948,12,12,'/vacancy/1','2018-10-22 05:59:31',NULL,NULL,NULL),(1949,12,12,'/vacancies','2018-10-22 05:59:36',NULL,NULL,NULL),(1950,12,12,'/feedback','2018-10-22 05:59:38',NULL,NULL,NULL),(1951,12,12,'/feedback','2018-10-22 06:00:01',NULL,NULL,NULL),(1952,12,12,'/feedback','2018-10-22 06:00:04',NULL,NULL,NULL),(1953,12,12,'/feedback','2018-10-22 06:00:08',NULL,NULL,NULL),(1954,12,12,'/vacancies','2018-10-22 06:01:10',NULL,NULL,NULL),(1955,12,12,'/vacancy/1','2018-10-22 06:01:13',NULL,NULL,NULL),(1956,12,12,'/feedback','2018-10-22 06:02:02',NULL,NULL,NULL),(1957,12,12,'/store','2018-10-22 06:02:30',NULL,NULL,NULL),(1958,12,12,'/store-cat/1','2018-10-22 06:27:58',NULL,NULL,NULL),(1959,12,12,'/nastolnyj-kompyuter-apple-imac-21.5','2018-10-22 06:28:00',NULL,NULL,NULL),(1960,12,12,'/store-cat/4','2018-10-22 06:28:02',NULL,NULL,NULL),(1961,12,12,'/feedback','2018-10-22 06:35:41',NULL,NULL,NULL),(1962,12,12,'/faq','2018-10-22 06:35:56',NULL,NULL,NULL),(1963,12,12,'/vacancies','2018-10-22 06:35:57',NULL,NULL,NULL),(1964,12,12,'/polytics','2018-10-22 06:35:59',NULL,NULL,NULL),(1965,12,12,'/history','2018-10-22 06:36:00',NULL,NULL,NULL),(1966,12,12,'/shops-list','2018-10-22 06:36:01',NULL,NULL,NULL),(1967,12,12,'/posts','2018-10-22 06:36:03',NULL,NULL,NULL),(1968,12,12,'/reviews','2018-10-22 06:36:04',NULL,NULL,NULL),(1969,12,12,'/honors','2018-10-22 06:36:05',NULL,NULL,NULL),(1970,12,12,'/faq','2018-10-22 06:36:06',NULL,NULL,NULL),(1971,12,12,'/faq','2018-10-22 06:36:07',NULL,NULL,NULL),(1972,12,12,'/vacancies','2018-10-22 06:36:07',NULL,NULL,NULL),(1973,12,12,'/feedback','2018-10-22 06:36:09',NULL,NULL,NULL),(1974,12,12,'/history','2018-10-22 06:36:13',NULL,NULL,NULL),(1975,12,12,'/posts','2018-10-22 06:36:15',NULL,NULL,NULL),(1976,12,12,'/faq','2018-10-22 06:36:17',NULL,NULL,NULL),(1977,12,12,'/vacancies','2018-10-22 06:38:45',NULL,NULL,NULL),(1978,12,12,'/feedback','2018-10-22 06:38:45',NULL,NULL,NULL),(1979,12,12,'/polytics','2018-10-22 06:38:47',NULL,NULL,NULL),(1980,12,12,'/history','2018-10-22 06:38:47',NULL,NULL,NULL),(1981,12,12,'/shops-list','2018-10-22 06:38:49',NULL,NULL,NULL),(1982,12,12,'/posts','2018-10-22 06:38:50',NULL,NULL,NULL),(1983,12,12,'/reviews','2018-10-22 06:38:51',NULL,NULL,NULL),(1984,12,12,'/honors','2018-10-22 06:38:51',NULL,NULL,NULL),(1985,12,12,'/feedback','2018-10-22 06:40:11',NULL,NULL,NULL),(1986,12,12,'/vacancies','2018-10-22 06:40:14',NULL,NULL,NULL),(1987,12,12,'/polytics','2018-10-22 06:40:14',NULL,NULL,NULL),(1988,12,12,'/history','2018-10-22 06:40:15',NULL,NULL,NULL),(1989,12,12,'/shops-list','2018-10-22 06:41:15',NULL,NULL,NULL),(1990,12,12,'/posts','2018-10-22 06:41:16',NULL,NULL,NULL),(1991,12,12,'/shops-list','2018-10-22 06:41:18',NULL,NULL,NULL),(1992,12,12,'/shop-page/1','2018-10-22 06:41:19',NULL,NULL,NULL),(1993,12,12,'/shops-list','2018-10-22 06:41:22',NULL,NULL,NULL),(1994,12,12,'/posts','2018-10-22 06:41:24',NULL,NULL,NULL),(1995,12,12,'/reviews','2018-10-22 06:41:25',NULL,NULL,NULL),(1996,12,12,'/honors','2018-10-22 06:41:27',NULL,NULL,NULL),(1997,12,12,'/honors','2018-10-22 06:42:22',NULL,NULL,NULL),(1998,12,12,'/honors','2018-10-22 06:42:37',NULL,NULL,NULL),(1999,12,12,'/honors','2018-10-22 06:43:21',NULL,NULL,NULL),(2000,12,12,'/honors','2018-10-22 06:43:40',NULL,NULL,NULL),(2001,12,12,'/honors','2018-10-22 06:43:50',NULL,NULL,NULL),(2002,12,12,'/honors','2018-10-22 06:44:03',NULL,NULL,NULL),(2003,12,12,'/honors','2018-10-22 06:44:23',NULL,NULL,NULL),(2004,12,12,'/','2018-10-22 09:36:37',NULL,NULL,NULL),(2005,12,12,'/store','2018-10-22 09:36:42',NULL,NULL,NULL),(2006,12,12,'/rituals','2018-10-22 09:36:44',NULL,NULL,NULL),(2007,12,12,'/company','2018-10-22 09:36:45',NULL,NULL,NULL),(2008,12,12,'/shops-list','2018-10-22 09:36:52',NULL,NULL,NULL),(2009,12,12,'/reviews','2018-10-22 09:36:57',NULL,NULL,NULL),(2010,12,12,'/admin','2018-10-22 09:41:37',NULL,NULL,NULL),(2011,12,12,'/admin-routes','2018-10-22 09:41:40',NULL,NULL,NULL),(2012,12,12,'/tpl-three','2018-10-22 09:41:48',NULL,NULL,NULL),(2013,12,12,'/tpl-three','2018-10-22 09:41:50',NULL,NULL,NULL),(2014,12,12,'/tpl-three','2018-10-22 09:45:02',NULL,NULL,NULL),(2015,12,12,'/tpl-three','2018-10-22 09:51:42',NULL,NULL,NULL),(2016,12,12,'/tpl-three','2018-10-22 09:55:46',NULL,NULL,NULL),(2017,12,12,'/tpl-three','2018-10-22 09:55:48',NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='Пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
INSERT INTO `visitors` VALUES (1,NULL,'2018-09-27 13:04:19'),(2,NULL,'2018-10-03 10:15:33'),(3,NULL,'2018-10-04 16:50:42'),(4,NULL,'2018-10-08 06:32:50'),(5,NULL,'2018-10-09 09:10:33'),(6,NULL,'2018-10-09 09:11:02'),(7,NULL,'2018-10-09 10:44:46'),(8,NULL,'2018-10-09 10:45:20'),(9,NULL,'2018-10-10 15:42:21'),(10,NULL,'2018-10-12 09:38:14'),(11,NULL,'2018-10-17 09:15:07'),(12,NULL,'2018-10-22 05:51:25');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (1,1,171,'1','2018-09-27 13:04:19',NULL,NULL),(2,2,204,'1','2018-10-03 10:15:34',NULL,NULL),(3,3,8,'1','2018-10-04 16:50:42',NULL,NULL),(4,4,338,'1','2018-10-08 06:32:51',NULL,NULL),(5,5,3,'1','2018-10-09 09:10:33',NULL,NULL),(6,6,115,'1','2018-10-09 09:11:02',NULL,NULL),(7,7,7,'1','2018-10-09 10:44:46',NULL,NULL),(8,8,277,'1','2018-10-09 10:45:20',NULL,NULL),(9,9,16,'1','2018-10-10 15:42:21',NULL,NULL),(10,10,11,'1','2018-10-12 09:38:16',NULL,NULL),(11,11,188,'1','2018-10-17 09:15:08',NULL,NULL),(12,12,132,'1','2018-10-22 05:51:25',NULL,NULL);
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

-- Dump completed on 2018-10-23 11:19:43
