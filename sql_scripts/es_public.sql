-- phpMyAdmin SQL Dump
-- version 4.0.10.20
-- https://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Мар 29 2018 г., 15:07
-- Версия сервера: 5.5.54
-- Версия PHP: 5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `es_public`
--

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
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
  `address` text CHARACTER SET cp1251,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`id`, `admin`, `root`, `confirmed`, `surname`, `firstname`, `patronymic`, `name`, `phone`, `password`, `mail`, `address`, `created`) VALUES
(8, 1, 1, 1, 'root', 'root', 'root', 'root', '+7(987)-654-32-10', '202cb962ac59075b964b07152d234b70', '', NULL, '2018-01-25 06:54:10');

-- --------------------------------------------------------

--
-- Структура таблицы `components`
--

CREATE TABLE IF NOT EXISTS `components` (
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
  KEY `block_id` (`block_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- Дамп данных таблицы `components`
--

INSERT INTO `components` (`id`, `title`, `ctrl`, `block_id`, `static`, `once`, `styles`, `scripts`, `default_config`, `created`) VALUES
(1, 'Управление маршрутами', 'routes-list', 2, 0, 0, NULL, NULL, NULL, '2018-01-10 08:58:25'),
(2, 'Статический контент', NULL, NULL, 1, 0, NULL, NULL, '{"body": ""}', '2018-01-10 09:22:25'),
(3, 'Главный слайдер', 'main-slider', 4, 0, 1, NULL, NULL, '{"slides":[], "lastId": 0}', '2018-01-10 12:17:53'),
(4, 'Страница авторизации', 'login-page', NULL, 0, 1, NULL, NULL, NULL, '2018-01-15 07:19:51'),
(5, 'Отображение новости', 'news-id', 2, 0, 0, NULL, NULL, NULL, '2018-01-24 06:34:23'),
(6, 'Список новостей', 'news-list', 2, 0, 0, NULL, NULL, NULL, '2018-01-24 08:34:58'),
(7, 'Управление клиентами', 'clients-manage', 2, 0, 0, NULL, NULL, NULL, '2018-01-25 07:28:54'),
(8, 'Пустой блок', NULL, NULL, 1, 0, NULL, NULL, '{"body": ""}', '2018-01-26 07:34:57'),
(9, 'Объявления краткий список', 'announcements-short-list', 3, 0, 0, NULL, NULL, NULL, '2018-01-26 08:00:33'),
(10, 'Слайдер для магазина', 'shop-slider', 4, 0, 1, NULL, NULL, '{"slides":[], "lastId": 0}', '2018-01-29 06:52:55'),
(11, 'Отображение товаров по категории', 'goods-list', 2, 0, 0, '\r\n', NULL, NULL, '2018-01-29 09:29:22'),
(12, 'Навигация для магазина', 'shop-menu', 1, 0, 0, NULL, NULL, NULL, '2018-01-29 10:15:26'),
(13, 'Общая навигация', 'general-menu', 1, 0, 0, NULL, NULL, NULL, '2018-01-29 10:37:05'),
(14, 'отображение товара', 'goods-view', 2, 0, 0, NULL, NULL, NULL, '2018-01-31 06:32:44'),
(15, 'Корзина пользователя', 'shop-cart', 2, 0, 0, NULL, NULL, NULL, '2018-02-01 08:19:52'),
(16, 'Оформление заказа', 'go-order', 2, 0, 0, NULL, NULL, NULL, '2018-02-01 11:20:25'),
(17, 'Управление компонентами', 'components-manage', 2, 0, 0, NULL, NULL, NULL, '2018-02-05 17:43:42'),
(18, 'Личный кабинет', 'my-cabinet', 2, 0, 0, NULL, NULL, NULL, '2018-02-07 06:47:14'),
(19, 'Успешный заказ', 'order-complete', 2, 0, 0, NULL, NULL, NULL, '2018-02-07 08:39:42'),
(20, 'Управление переменными сайта', 'global-variables', 2, 0, 0, NULL, NULL, NULL, '2018-02-07 11:33:46'),
(21, 'Список моих заказов', 'my-orders', 2, 0, 0, NULL, NULL, NULL, '2018-02-08 07:35:41'),
(22, 'Отзывы', 'reviews-list', 2, 0, 0, NULL, NULL, NULL, '2018-02-08 10:29:38'),
(23, 'Вопрос-ответ', 'questions-list', 2, 0, 0, NULL, NULL, NULL, '2018-02-12 06:49:18'),
(24, 'Список заказов', 'orders-list', 2, 0, 0, NULL, NULL, NULL, '2018-02-13 08:01:50'),
(25, 'Отображение заказа', 'orders-view', 2, 0, 0, NULL, NULL, NULL, '2018-02-13 09:31:15'),
(26, 'Список документов', 'documents-list', 2, 0, 0, NULL, NULL, NULL, '2018-02-14 10:09:47'),
(27, 'Отображение документа', 'document-view', 2, 0, 0, NULL, NULL, NULL, '2018-02-14 10:53:57'),
(28, 'Список магазинов', 'shops-list', 2, 0, 0, NULL, NULL, NULL, '2018-02-18 11:48:26'),
(29, 'Отображение магазина', 'shops-view', 2, 0, 0, NULL, NULL, NULL, '2018-02-18 12:26:29'),
(30, 'Список вакансий', 'vacancies-list', 2, 0, 0, NULL, NULL, NULL, '2018-02-19 00:08:07'),
(31, 'Отображение вакансии', 'vacancies-view', 2, 0, 0, NULL, NULL, NULL, '2018-02-19 00:20:51'),
(32, 'Заголовок страницы', 'page-title', NULL, 0, 0, NULL, NULL, '{"body": ""}', '2018-03-10 14:27:06'),
(33, 'Отображение посещаемости', 'attendance-view', 2, 0, 0, NULL, NULL, NULL, '2018-03-10 15:09:21');

-- --------------------------------------------------------

--
-- Структура таблицы `confirmed_emails`
--

CREATE TABLE IF NOT EXISTS `confirmed_emails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(75) NOT NULL,
  `client_id` int(11) NOT NULL,
  `checked` int(11) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `confirmed_phones`
--

CREATE TABLE IF NOT EXISTS `confirmed_phones` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned DEFAULT NULL,
  `phone` varchar(25) NOT NULL,
  `code` int(6) NOT NULL,
  `confirmed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(70) NOT NULL DEFAULT 'Новый документ',
  `text` text,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `fragments`
--

CREATE TABLE IF NOT EXISTS `fragments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component_id` int(11) NOT NULL DEFAULT '2',
  `route_id` int(11) NOT NULL,
  `block_id` int(11) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fragments_ibfk_1` (`component_id`),
  KEY `fragments_ibfk_2` (`route_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=69 ;

--
-- Дамп данных таблицы `fragments`
--

INSERT INTO `fragments` (`id`, `component_id`, `route_id`, `block_id`, `priority`, `created`) VALUES
(2, 4, 61, 4, 1, '2018-03-19 11:06:56'),
(4, 13, 40, 1, 1, '2018-03-27 05:21:24'),
(15, 1, 49, 2, 1, '2018-03-27 06:24:56'),
(16, 13, 49, 1, 1, '2018-03-27 06:25:03'),
(17, 3, 32, 4, 1, '2018-03-27 06:26:18'),
(18, 3, 83, 4, 1, '2018-03-27 06:27:31'),
(19, 10, 84, 4, 1, '2018-03-27 06:35:44'),
(20, 3, 87, 4, 1, '2018-03-27 06:39:37'),
(21, 13, 67, 1, 1, '2018-03-27 08:28:16'),
(22, 13, 50, 1, 1, '2018-03-27 08:28:41'),
(24, 13, 51, 1, 1, '2018-03-27 08:28:58'),
(25, 13, 70, 1, 1, '2018-03-27 08:29:19'),
(26, 17, 67, 2, 1, '2018-03-27 08:29:34'),
(27, 7, 50, 2, 1, '2018-03-27 08:29:45'),
(28, 33, 51, 2, 1, '2018-03-27 08:29:57'),
(29, 20, 70, 2, 1, '2018-03-27 08:30:35'),
(30, 2, 40, 2, 1, '2018-03-27 08:31:37'),
(31, 6, 88, 2, 1, '2018-03-27 09:18:21'),
(40, 2, 92, 2, 1, '2018-03-27 11:43:26'),
(46, 22, 93, 2, 1, '2018-03-28 08:12:30'),
(48, 13, 89, 1, 1, '2018-03-28 09:24:19'),
(49, 13, 96, 1, 1, '2018-03-28 09:25:10'),
(50, 13, 90, 1, 1, '2018-03-28 09:27:04'),
(51, 30, 94, 2, 1, '2018-03-28 09:29:12'),
(52, 26, 100, 2, 1, '2018-03-28 09:31:40'),
(53, 13, 88, 1, 1, '2018-03-28 09:36:31'),
(54, 23, 96, 2, 1, '2018-03-28 09:37:30'),
(55, 13, 86, 1, 1, '2018-03-28 09:38:41'),
(56, 13, 91, 1, 1, '2018-03-28 09:39:11'),
(57, 13, 92, 1, 1, '2018-03-28 09:39:20'),
(58, 13, 95, 1, 1, '2018-03-28 09:39:56'),
(59, 28, 90, 2, 1, '2018-03-28 18:40:09'),
(60, 29, 101, 2, 1, '2018-03-28 18:43:13'),
(61, 13, 101, 1, 1, '2018-03-28 18:44:55'),
(62, 13, 97, 1, 1, '2018-03-29 05:45:52'),
(63, 13, 98, 1, 1, '2018-03-29 05:46:13'),
(64, 13, 99, 1, 1, '2018-03-29 05:46:28'),
(65, 13, 100, 1, 1, '2018-03-29 05:46:44'),
(67, 13, 94, 1, 1, '2018-03-29 08:14:27'),
(68, 13, 93, 1, 1, '2018-03-29 08:17:40');

-- --------------------------------------------------------

--
-- Структура таблицы `fragments_blocks`
--

CREATE TABLE IF NOT EXISTS `fragments_blocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `fragments_blocks`
--

INSERT INTO `fragments_blocks` (`id`, `title`, `created`) VALUES
(1, 'Навигация', '2018-01-26 07:24:36'),
(2, 'Контент', '2018-01-26 07:24:43'),
(3, 'Информативный', '2018-01-26 07:24:48'),
(4, 'Вся часть страницы', '2018-01-29 09:06:38');

-- --------------------------------------------------------

--
-- Структура таблицы `fragments_data`
--

CREATE TABLE IF NOT EXISTS `fragments_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `component_id` int(11) DEFAULT NULL COMMENT 'Для повторного использования данных внутри компонента',
  `fragment_id` int(11) NOT NULL COMMENT 'Для привязки данных к определенному фрагменту',
  `data` text NOT NULL COMMENT 'Сами данные',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `component_id` (`component_id`),
  KEY `fragments_data_ibfk_2` (`fragment_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Дамп данных таблицы `fragments_data`
--

INSERT INTO `fragments_data` (`id`, `component_id`, `fragment_id`, `data`, `created`) VALUES
(5, NULL, 17, '{"content":{"slides":[{"id":1,"img":"/uploads/upload_2a9049ef7118b36eed25eba141a642d5.jpg","img_bottom":"/uploads/upload_9200c3543dd9a454d146574c0fc791eb.jpg","title":"Главная страница","title_bottom":"Главная","description":"Добро пожаловать на официальный сайт ООО \\"ЕвроСервис\\"","href":"/"}],"lastId":1}}', '2018-03-27 06:26:39'),
(6, NULL, 18, '{"content":{"slides":[{"id":4,"img":"","img_bottom":"","title":"Новости","title_bottom":"Новости","description":"Будьте в курсе происходящего в сфере похоронно-ритуальных услуг. В этом разделе публикуются самые актуальные мировые и региональные новости, связанные с кладбищами и похоронно-ритуальными событиями.","href":"/news"},{"id":1,"img":"","img_bottom":"","title":"История компании","title_bottom":"История","description":"Компания \\"ЕвроСервис\\" успешно ведет свою деятельность в сфере похоронно-ритуальных услуг уже более 15 лет. Ознакомиться с историей компании можно в данном разделе.","href":"/company-history"},{"id":5,"img":"","img_bottom":"","title":"Политика компании","title_bottom":"Политика","description":"Политика компании - это нерушимые, всем понятные принципы, цели и идеи, которые чтят и которым следуют абсолютно все её сотрудники. Невозможно представить современную компанию без поставленных перед собой целей и приоритетов развития. В этом разделе можно ознакомиться с политикой компании \\"ЕвроСервис\\" в области развития и обслуживания клиентов в сфере похоронно-ритуальных услуг.","href":"/policy"},{"id":2,"img":"","img_bottom":"","title":"Список магазинов Евросервис","title_bottom":"Магазины","description":"Магазины компании \\"ЕвроСервис\\" всегда готовы предоставить вам полный ассортимент ритуальной продукции. В этом разделе можно найти подробную информацию о местоположении и контактных телефонах всех магазинов г. Магнитогорска.","href":"/company-shops"},{"id":6,"img":"","img_bottom":"","title":"Достижения компании","title_bottom":"Достижения","description":"За время своей работы компания \\"ЕвроСервис\\" не раз удостаивалась наград и благодарственных писем. В данном разделе можно ознакомиться с достижениями компании и ее коллектива.","href":"/achievements"},{"id":7,"img":"","img_bottom":"","title":"Контакты компании","title_bottom":"Контакты","description":"В данном разделе можно найти контактные телефоны, ссылки в социальных сетях, а также адреса и реквизиты центрального офиса компании \\"ЕвроСервис\\" г. Магнитогорска.","href":"/contacts"},{"id":3,"img":"","img_bottom":"/uploads/upload_a4f6ea30b6af889d8c1299583404445a.jpg","title":"Отзывы клиентов","title_bottom":"Отзывы","description":"Компания \\"Евросервис\\" постоянно стремится к повышению планки качества обслуживания и высоко ценит мнение каждого клиента. В данном разделе можно найти отзывы клиентов, уже воспользовавшихся услугами нашей компании и оставить собственный отзыв.","href":"/company-reviews"},{"id":8,"img":"","img_bottom":"/uploads/upload_7684907dd149a7ab81b14827ef5b46e0.png","title":"Вакансии","title_bottom":"Вакансии","description":"Компания \\"ЕвроСервис\\" постоянно растет и развивается, ввиду чего объявляет набор дополнительного персонала. Здесь вы можете увидеть самые актуальные вакансии компании на сегодняшний день.","href":"/vacansies"},{"id":10,"img":"","img_bottom":"","title":"Директор компании","title_bottom":"Директор","description":"Официальная страница директора компании \\"ЕвроСервис\\". На этой странице можно задать свой вопрос персонально директору компании.","href":"/director"}],"lastId":10}}', '2018-03-27 06:27:35'),
(7, NULL, 20, '{"content":{"slides":[{"id":1,"img":"","img_bottom":"","title":"Вопрос-ответ","title_bottom":"Вопрос-ответ","description":"В данном разделе можно найти ответы на вопросы, часто задаваемые нашими клиентами, а так же вопросы, которые могут возникнуть при обращении в похоронные службы.","href":"/info-questions"},{"id":2,"img":"","img_bottom":"/uploads/upload_5a36d39854429536853a7253ad8fcbbb.jpg","title":"Публикации","title_bottom":"Публикации","description":"Раздел содержит статьи и публикации о кладбищах, их объектах и событиях, а так же статьи о похоронном деле и о благоустройстве захоронений и кладбищ.","href":"/publications"},{"id":3,"img":"","img_bottom":"/uploads/upload_743167d9967161eaa95d22c819d802be.jpg","title":"Оплата и доставка","title_bottom":"Оплата и доставка","description":"В данном разделе описаны способы оплаты и доставки товаров и услуг.","href":"/payment-and-delivery"},{"id":4,"img":"","img_bottom":"","title":"Акции и предложения","title_bottom":"Акции и предложения","description":"В данном разделе содержится информация об актуальных предложениях и акциях компании.","href":"/promotions-and-offers"},{"id":5,"img":"","img_bottom":"/uploads/upload_7920e9666209b76b04baeeaa0cf8ce6f.jpg","title":"Правовые документы","title_bottom":"Правовые документы","description":"В данном разделе публикуются правовые документы компании, с которыми могут ознакомиться потребители товаров и услуг","href":"/legal-documents"}],"lastId":6}}', '2018-03-27 06:39:42'),
(8, NULL, 30, '{"content":{"body":"<p>Выберите пункт в меню слева для продолжения</p>\\n\\n<p>&nbsp;</p>\\n"}}', '2018-03-27 08:32:17'),
(9, NULL, 30, '{"content":{"body":"<p>Выберите пункт в меню слева для продолжения</p>\\n\\n<p>&nbsp;</p>\\n"}}', '2018-03-27 08:32:17'),
(11, NULL, 40, '{"content":{"body":"<p>Контакты салонов ритуальных услуг Евросервис:</p>\\n\\n<p>&nbsp;</p>\\n\\n<p>Адрес центрального офиса:&nbsp;455019,&nbsp;г. Магнитогорск, улица Трубная, 19</p>\\n\\n<p>Расписание: понедельник-суббота, 9:00-18:00 (перерыв 13:00-14:00)</p>\\n\\n<p><strong>Номера телефонов</strong>:</p>\\n\\n<ul>\\n\\t<li>+7 (3519) 49-49-48</li>\\n\\t<li>+7 (3519) 43-98-90</li>\\n\\t<li>+7 (3519) 48-27-32</li>\\n</ul>\\n\\n<p>&nbsp;</p>\\n\\n<p><a href=\\"/company-shops\\">Список магазинов и их номера телефонов</a></p>\\n\\n<p>&nbsp;</p>\\n\\n<p><strong>Евросервис в социальных сетях:</strong></p>\\n\\n<p>&nbsp;</p>\\n\\n<p><a href=\\"https://vk.com/evroservism\\" target=\\"_blank\\"><img alt=\\"Группа вк\\" src=\\"/uploads/upload_bbd4a925119421d3963cf2885565227a.png\\" style=\\"height:36px; width:36px\\" /></a>&nbsp; &nbsp;<a href=\\"https://ok.ru/profile/576179696516\\" target=\\"_blank\\"><img alt=\\"ЕвроСервис в Одноклассниках\\" src=\\"/uploads/upload_09382bbdae8cc0f09ab56bbd47759ee0.png\\" style=\\"height:36px; width:36px\\" /></a>&nbsp;&nbsp;&nbsp;<a href=\\"https://ru-ru.facebook.com/evroservism/\\" target=\\"_blank\\"><img alt=\\"ЕвроСервис в Facebook\\" src=\\"/uploads/upload_a779adeadbe1b29de8bd439de18f8550.png\\" style=\\"height:36px; width:36px\\" /></a>&nbsp; &nbsp;<a href=\\"https://twitter.com/evroservis_m\\" target=\\"_blank\\"><img alt=\\"Tiwtter ЕвроСервиса\\" src=\\"/uploads/upload_06b5322279d6c7a50679944ffe40671c.png\\" style=\\"height:37px; width:37px\\" /></a>&nbsp; &nbsp;<a href=\\"https://www.instagram.com/evroservism/\\" target=\\"_blank\\"><img alt=\\"Instagram ЕвроСервиса\\" src=\\"/uploads/upload_707571782a2a7e3e822054298e470443.png\\" style=\\"height:36px; width:36px\\" /></a></p>\\n"}}', '2018-03-27 11:44:15');

-- --------------------------------------------------------

--
-- Структура таблицы `global_site_config`
--

CREATE TABLE IF NOT EXISTS `global_site_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT NULL,
  `target` varchar(60) NOT NULL,
  `value` text NOT NULL,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '1 - текст, 2 - число, 3 - логическое, 4 - json, 5 - ссылка на изображение',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `global_site_config`
--

INSERT INTO `global_site_config` (`id`, `title`, `target`, `value`, `type`, `created`, `updated`) VALUES
(1, '', 'siteLogo', '/uploads/logo-full-inverse.svg', 1, '2018-03-19 11:05:40', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `goods_cats`
--

CREATE TABLE IF NOT EXISTS `goods_cats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `description` text,
  `img` text COMMENT 'Фото для слайдера',
  `parent_id` int(11) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `goods_cats_ibfk_1` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `goods_pos`
--

CREATE TABLE IF NOT EXISTS `goods_pos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL,
  `price` decimal(11,2) NOT NULL DEFAULT '999999999.99',
  `count` int(11) NOT NULL DEFAULT '0',
  `reserv` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Зарезервировано в заказах',
  `cat_id` int(11) NOT NULL,
  `main_photo` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text,
  PRIMARY KEY (`id`),
  KEY `cat_id` (`cat_id`),
  KEY `goods_pos_ibfk_2` (`main_photo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `goods_props`
--

CREATE TABLE IF NOT EXISTS `goods_props` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT 'Новый параметр',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Содержит названия параметров товаров' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `goods_props_bind_values`
--

CREATE TABLE IF NOT EXISTS `goods_props_bind_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `prop_id` int(11) NOT NULL,
  `prop_value_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `good_id` (`good_id`),
  KEY `prop_id` (`prop_id`),
  KEY `prop_value_id` (`prop_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Содержит связь параметров товара с товаром' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `goods_props_values`
--

CREATE TABLE IF NOT EXISTS `goods_props_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT 'Новое значение',
  `prop_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `prop_id` (`prop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Содержит значения параметров товаров' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `header_nav`
--

CREATE TABLE IF NOT EXISTS `header_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(70) NOT NULL DEFAULT 'Новый пункт меню',
  `href` varchar(70) NOT NULL DEFAULT '#',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `header_nav`
--

INSERT INTO `header_nav` (`id`, `title`, `href`, `created`) VALUES
(2, 'Главная', '/', '2018-03-27 05:24:59'),
(3, 'О компании', '/company', '2018-03-27 05:29:51'),
(4, 'Магазин', '/shop', '2018-03-27 06:23:39'),
(5, 'Информация', '/info', '2018-03-27 06:38:57');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_groups`
--

CREATE TABLE IF NOT EXISTS `menu_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT 'Новая группа',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `menu_groups`
--

INSERT INTO `menu_groups` (`id`, `title`, `created`) VALUES
(1, 'Меню администратора', '2018-03-27 05:21:46'),
(2, 'Меню о компании', '2018-03-28 09:23:20'),
(3, 'Меню информация', '2018-03-28 09:25:22');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `href` text,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `route_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`),
  KEY `menu_items_ibfk_1` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `title`, `href`, `parent_id`, `route_id`, `group_id`, `created`) VALUES
(2, 'Маршруты', '/admin-routes', 0, NULL, 1, '2018-03-27 05:42:33'),
(3, 'Компоненты', '/admin-components', 0, NULL, 1, '2018-03-27 08:15:17'),
(4, 'Клиенты', '/admin-clients', 0, NULL, 1, '2018-03-27 08:25:59'),
(5, 'Посещаемость', '/admin-attendance', 0, NULL, 1, '2018-03-27 08:26:18'),
(6, 'Переменные', '/admin-globals', 0, NULL, 1, '2018-03-27 08:28:06'),
(7, 'Новости', '/news', 0, NULL, 2, '2018-03-28 09:23:55'),
(8, 'История', '/company-history', 0, NULL, 2, '2018-03-28 09:24:05'),
(9, 'Вопрос-ответ', '/info-questions', 0, NULL, 3, '2018-03-28 09:25:31'),
(15, 'Публикации', '/publications', 0, NULL, 3, '2018-03-29 05:43:37'),
(16, 'Оплата и доставка', '/payment-and-delivery', 0, NULL, 3, '2018-03-29 05:43:49'),
(17, 'Акции и предложения', '/promotions-and-offers', 0, NULL, 3, '2018-03-29 05:44:52'),
(18, 'Правовые документы', '/legal-documents', 0, NULL, 3, '2018-03-29 05:45:11'),
(21, 'Политика', '/policy', 0, NULL, 2, '2018-03-29 08:16:18'),
(22, 'Магазины', '/company-shops', 0, NULL, 2, '2018-03-29 08:16:27'),
(23, 'Достижения', '/achievements', 0, NULL, 2, '2018-03-29 08:16:36'),
(24, 'Контакты', '/contacts', 0, NULL, 2, '2018-03-29 08:16:52'),
(25, 'Отзывы', '/company-reviews', 0, NULL, 2, '2018-03-29 08:17:08'),
(26, 'Вакансии', '/vacansies', 0, NULL, 2, '2018-03-29 08:17:18'),
(27, 'Директор', '/director', 0, NULL, 2, '2018-03-29 08:17:28');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL DEFAULT 'Новая новость',
  `text` text,
  `counter_views` int(11) NOT NULL DEFAULT '0',
  `published` timestamp NULL DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
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
  KEY `orders_ibfk_1` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `orders_goods`
--

CREATE TABLE IF NOT EXISTS `orders_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `count` int(11) NOT NULL COMMENT 'Количество в заказе',
  `price` decimal(11,2) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `good_id` (`good_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE IF NOT EXISTS `payments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `price` decimal(11,2) unsigned NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `photos`
--

CREATE TABLE IF NOT EXISTS `photos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `target` varchar(25) DEFAULT NULL,
  `target_id` int(10) unsigned DEFAULT NULL,
  `path` text NOT NULL,
  `name` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ид',
  `type` varchar(8) NOT NULL COMMENT 'тип записи',
  `category_id` int(11) NOT NULL DEFAULT '6' COMMENT 'id родительской категории',
  `author` smallint(5) unsigned DEFAULT NULL,
  `question` text NOT NULL COMMENT 'вопрос',
  `answer` text COMMENT 'ответ',
  `public` int(2) NOT NULL DEFAULT '0' COMMENT 'Публиковать',
  `creator` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='faq' AUTO_INCREMENT=16 ;

--
-- Дамп данных таблицы `questions`
--

INSERT INTO `questions` (`id`, `type`, `category_id`, `author`, `question`, `answer`, `public`, `creator`, `created`) VALUES
(1, 'question', 6, NULL, 'Есть ли скидки для пенсионеров в Вашей компании', NULL, 0, NULL, '2018-03-28 09:38:02'),
(2, 'question', 6, NULL, 'Есть ли скидки для пенсионеров в Вашей компании', NULL, 0, NULL, '2018-03-28 09:38:17'),
(3, 'question', 6, NULL, '', NULL, 0, NULL, '2018-03-29 05:33:15'),
(4, 'question', 6, NULL, '', NULL, 0, NULL, '2018-03-29 05:33:16'),
(5, 'question', 6, NULL, '', NULL, 0, NULL, '2018-03-29 05:33:16'),
(6, 'question', 6, NULL, '', NULL, 0, NULL, '2018-03-29 05:33:16'),
(7, 'question', 6, NULL, '', NULL, 0, NULL, '2018-03-29 05:33:18'),
(8, 'question', 6, NULL, 'Есть два стула...', NULL, 0, NULL, '2018-03-29 05:33:27'),
(9, 'question', 6, NULL, '', NULL, 0, NULL, '2018-03-29 05:33:34'),
(10, 'question', 6, NULL, '123', NULL, 0, NULL, '2018-03-29 05:33:36'),
(11, 'question', 6, NULL, '', NULL, 0, NULL, '2018-03-29 07:50:34'),
(12, 'question', 6, NULL, '', NULL, 0, NULL, '2018-03-29 07:50:35'),
(13, 'question', 6, NULL, '123', NULL, 0, NULL, '2018-03-29 07:50:37'),
(14, 'question', 6, NULL, '', NULL, 0, NULL, '2018-03-29 09:15:07'),
(15, 'question', 6, NULL, 'Who let the dogs out', NULL, 0, NULL, '2018-03-29 09:15:28');

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `target_type` varchar(50) DEFAULT NULL,
  `target_id` int(10) unsigned DEFAULT NULL,
  `text` text NOT NULL,
  `published` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Опубликован или нет',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `client_id`, `target_type`, `target_id`, `text`, `published`, `created`) VALUES
(1, 8, NULL, NULL, '111111', 0, '2018-03-27 06:07:17'),
(2, 8, NULL, NULL, '1231111111', 0, '2018-03-27 06:08:30'),
(3, 8, NULL, NULL, 'проверка работы отзыва', 0, '2018-03-28 09:28:35');

-- --------------------------------------------------------

--
-- Структура таблицы `routes`
--

CREATE TABLE IF NOT EXISTS `routes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT 'Новый маршрут',
  `url` varchar(255) NOT NULL,
  `template_id` int(11) DEFAULT '1',
  `menu_id` int(11) DEFAULT NULL,
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
  KEY `menu_id` (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=102 ;

--
-- Дамп данных таблицы `routes`
--

INSERT INTO `routes` (`id`, `title`, `url`, `template_id`, `menu_id`, `show_title`, `use_component_title`, `access`, `dynamic`, `required`, `edit_access`, `delete_access`, `seo_keywords`, `seo_description`, `created`, `updated`) VALUES
(32, 'Главная страница', '/', 1, NULL, 1, 0, 1, 0, 1, 1, 1, '', '', '2018-01-17 10:11:31', '2018-03-27 06:26:10'),
(40, 'Администрирование', '/admin', 2, 1, 1, 0, 3, 0, 1, 1, 1, '', '', '2018-01-20 20:43:27', '2018-03-27 05:42:31'),
(49, 'Управление маршрутами', '/admin-routes', 2, 1, 1, 0, 3, 0, 1, 1, 1, '', '', '2018-01-25 07:14:47', '2018-03-27 06:25:09'),
(50, 'Управление клиентами', '/admin-clients', 2, 1, 1, 0, 3, 0, 1, 1, 1, '', '', '2018-01-25 07:15:29', '2018-03-27 08:28:50'),
(51, 'Посещаемость', '/admin-attendance', 2, 1, 1, 0, 3, 0, 1, 1, 1, '', '', '2018-01-25 08:34:36', '2018-03-27 08:29:05'),
(61, 'Авторизация', '/login', 1, NULL, 1, 0, 1, 0, 1, 0, 0, '', '', '2018-01-25 11:49:17', '2018-01-25 12:00:21'),
(67, 'Управление компонентами', '/admin-components', 2, 1, 1, 0, 3, 0, 1, 1, 1, '', '', '2018-02-05 17:38:19', '2018-03-27 08:28:26'),
(70, 'Глобальные переменные', '/admin-globals', 2, 1, 1, 0, 3, 0, 1, 1, 1, '', '', '2018-02-07 11:31:36', '2018-03-27 08:29:24'),
(83, 'О компании', '/company', 1, NULL, 1, 0, 1, 0, 0, 1, 1, '', '', '2018-03-27 05:25:33', NULL),
(84, 'Магазин', '/shop', 1, NULL, 1, 0, 1, 0, 0, 1, 1, '', '', '2018-03-27 06:25:55', NULL),
(86, 'История компании', '/company-history', 2, 2, 1, 0, 1, 0, 0, 1, 1, '', '', '2018-03-27 06:30:29', '2018-03-28 09:38:47'),
(87, 'Информация', '/info', 1, NULL, 1, 0, 1, 0, 0, 1, 1, '', '', '2018-03-27 06:39:29', NULL),
(88, 'Новости', '/news', 2, 2, 1, 0, 1, 0, 0, 1, 1, '', '', '2018-03-27 09:17:58', '2018-03-28 09:36:40'),
(89, 'Политика', '/policy', 2, 2, 1, 0, 1, 0, 0, 1, 1, '', '', '2018-03-27 09:22:47', '2018-03-28 09:24:25'),
(90, 'Магазины', '/company-shops', 2, 2, 1, 0, 1, 0, 0, 1, 1, '', '', '2018-03-27 09:23:19', '2018-03-28 09:39:06'),
(91, 'Достижения', '/achievements', 2, 2, 1, 0, 1, 0, 0, 1, 1, '', '', '2018-03-27 09:23:54', '2018-03-28 09:39:16'),
(92, 'Контакты', '/contacts', 2, 2, 1, 0, 1, 0, 0, 1, 1, '', '', '2018-03-27 09:24:19', '2018-03-28 09:39:25'),
(93, 'Отзывы', '/company-reviews', 2, 2, 1, 0, 1, 0, 0, 1, 1, '', '', '2018-03-27 09:24:38', '2018-03-29 08:17:47'),
(94, 'Вакансии', '/vacansies', 2, 2, 1, 0, 1, 0, 0, 1, 1, '', '', '2018-03-27 09:25:14', '2018-03-29 08:14:48'),
(95, 'Директор', '/director', 2, 2, 1, 0, 1, 0, 0, 1, 1, '', '', '2018-03-27 09:25:30', '2018-03-28 09:40:00'),
(96, 'Вопрос-ответ', '/info-questions', 2, 3, 1, 0, 1, 0, 0, 1, 1, '', '', '2018-03-27 09:26:25', '2018-03-28 09:25:22'),
(97, 'Публикации', '/publications', 2, 3, 1, 0, 1, 0, 0, 1, 1, '', '', '2018-03-27 09:27:09', '2018-03-29 05:46:02'),
(98, 'Оплата и доставка', '/payment-and-delivery', 2, 3, 1, 0, 1, 0, 0, 1, 1, '', '', '2018-03-27 09:27:40', '2018-03-29 05:46:21'),
(99, 'Акции и предложения', '/promotions-and-offers', 2, 3, 1, 0, 1, 0, 0, 1, 1, '', '', '2018-03-27 09:28:34', '2018-03-29 05:46:38'),
(100, 'Правовые документы', '/legal-documents', 2, 3, 1, 0, 1, 0, 0, 1, 1, '', '', '2018-03-27 09:28:54', '2018-03-29 05:46:50'),
(101, 'Страница магазина', '/shop-page', 2, 2, 1, 0, 1, 1, 0, 1, 1, '', '', '2018-03-28 18:42:57', '2018-03-29 05:25:01');

-- --------------------------------------------------------

--
-- Структура таблицы `routes_access`
--

CREATE TABLE IF NOT EXISTS `routes_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `routes_access`
--

INSERT INTO `routes_access` (`id`, `title`) VALUES
(1, 'Публичный маршрут'),
(2, 'Только авторизованным пользователям'),
(3, 'Только для администратора');

-- --------------------------------------------------------

--
-- Структура таблицы `routes_aliases`
--

CREATE TABLE IF NOT EXISTS `routes_aliases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `target` varchar(64) NOT NULL,
  `target_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `route_id` (`route_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `shops_list`
--

CREATE TABLE IF NOT EXISTS `shops_list` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT 'Новый магазин',
  `main_photo` text,
  `text` text,
  `address` varchar(250) DEFAULT NULL,
  `phones` varchar(255) DEFAULT NULL,
  `schedule` varchar(255) DEFAULT '{"1":["08:00","17:00"],"2":["09:00","17:00"],"3":["09:00","17:00"],"4":["09:00","17:00"],"5":["09:00","17:00"],"6":["09:00","17:00"],"7":["09:00","17:00"]}' COMMENT 'График работы',
  `coords` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `shops_list`
--

INSERT INTO `shops_list` (`id`, `title`, `main_photo`, `text`, `address`, `phones`, `schedule`, `coords`, `created`) VALUES
(1, 'Салон похоронно-ритуальных услуг "ЕвроСервис"', NULL, NULL, 'улица Чкалова, 127', '+7 (3519) 43-49-25', '{"1":["08:00","17:00"],"2":["09:00","17:00"],"3":["09:00","17:00"],"4":["09:00","17:00"],"5":["09:00","17:00"],"6":["09:00","17:00"],"7":["09:00","17:00"]}', '53.386572, 59.108014', '2018-03-28 18:40:20'),
(2, 'Салон похоронно-ритуальных услуг "ЕвроСервис"', NULL, NULL, 'улица Гагарина, 62А', '+7 (3519) 43-49-30', '{"1":["08:00","17:00"],"2":["09:00","17:00"],"3":["09:00","17:00"],"4":["09:00","17:00"],"5":["09:00","17:00"],"6":["09:00","17:00"],"7":["09:00","17:00"]}', '53.414629, 58.940110', '2018-03-29 06:38:37'),
(3, 'Салон похоронно-ритуальных услуг "ЕвроСервис"', NULL, NULL, 'Челябинский тракт, 30/1', '+7 (3519) 43-49-28', '{"1":["08:00","17:00"],"2":["09:00","17:00"],"3":["09:00","17:00"],"4":["09:00","17:00"],"5":["09:00","17:00"],"6":["09:00","17:00"],"7":["09:00","17:00"]}', '53.360727, 59.124929', '2018-03-29 06:38:47'),
(4, 'Салон похоронно-ритуальных услуг "ЕвроСервис"', NULL, NULL, 'Моховая улица, 1', '+7-912-805-49-44', '{"1":["08:00","17:00"],"2":["09:00","17:00"],"3":["09:00","17:00"],"4":["09:00","17:00"],"5":["09:00","17:00"],"6":["09:00","17:00"],"7":["09:00","17:00"]}', '53.465282, 59.048607', '2018-03-29 06:38:51');

-- --------------------------------------------------------

--
-- Структура таблицы `social_links`
--

CREATE TABLE IF NOT EXISTS `social_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) NOT NULL DEFAULT 'Новая ссылка',
  `icon` varchar(20) DEFAULT 'fa-question',
  `href` varchar(100) NOT NULL DEFAULT '#',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Ссылки на социальные сети' AUTO_INCREMENT=26 ;

--
-- Дамп данных таблицы `social_links`
--

INSERT INTO `social_links` (`id`, `title`, `icon`, `href`, `created`) VALUES
(3, 'https://twitter.com/evroservis_m', 'fa-tg', '#', '2018-03-27 09:40:07'),
(5, 'https://ok.ru/profile/576179696516', 'fa-odnoklassniki-squ', '#', '2018-03-27 09:45:35'),
(6, 'https://ok.ru/profile/576179696516', 'fa-odnoklassniki-squ', 'Одноклассники', '2018-03-27 09:46:15'),
(10, 'Евросервис ОК', 'fa-odnoklassniki-squ', 'https://ok.ru/profile/576179696516', '2018-03-27 09:51:01'),
(11, 'Евросервис ОК', 'fa-odnoklassniki-squ', 'https://ok.ru/profile/576179696516', '2018-03-27 09:51:50'),
(15, 'Vk', 'fa-vk', 'https://vk.com/evroservism', '2018-03-27 09:54:32'),
(21, 'Facebook', 'fa-facebook', 'https://ru-ru.facebook.com/evroservism/', '2018-03-27 09:56:09'),
(22, 'Одноклассники', 'fa-odnoklassniki', 'https://ok.ru/profile/576179696516', '2018-03-27 09:56:42'),
(23, 'Twitter', 'fa-twitter', 'https://twitter.com/evroservis_m', '2018-03-27 09:57:09'),
(24, 'Instagram', 'fa-instagram', 'https://www.instagram.com/evroservism/', '2018-03-27 09:57:34');

-- --------------------------------------------------------

--
-- Структура таблицы `templates`
--

CREATE TABLE IF NOT EXISTS `templates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT 'Новый шаблон',
  `name` varchar(64) DEFAULT NULL COMMENT 'Название файла шаблона',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `templates`
--

INSERT INTO `templates` (`id`, `title`, `name`, `created`) VALUES
(1, 'Пустая страница', 'empty', '2018-01-12 05:06:14'),
(2, 'Трёхколоночный макет страницы', 'three-column', '2018-01-12 05:06:48');

-- --------------------------------------------------------

--
-- Структура таблицы `vacancies`
--

CREATE TABLE IF NOT EXISTS `vacancies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(70) NOT NULL DEFAULT 'Новая вакансия',
  `text` text,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `views`
--

CREATE TABLE IF NOT EXISTS `views` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `visit_id` int(10) unsigned NOT NULL COMMENT 'Идентификатор визита',
  `visitor_id` int(10) unsigned DEFAULT NULL,
  `path` varchar(155) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `activated` timestamp NULL DEFAULT NULL,
  `closed` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1884 ;

--
-- Дамп данных таблицы `views`
--

INSERT INTO `views` (`id`, `visit_id`, `visitor_id`, `path`, `created`, `updated`, `activated`, `closed`) VALUES
(1, 1, 1, '/', '2018-03-27 05:11:45', NULL, NULL, NULL),
(2, 2, 2, '/', '2018-03-27 05:17:12', NULL, NULL, NULL),
(3, 2, 2, '/', '2018-03-27 05:19:19', NULL, NULL, NULL),
(4, 2, 2, '/login', '2018-03-27 05:19:21', NULL, NULL, NULL),
(5, 2, 2, '/', '2018-03-27 05:19:29', NULL, NULL, NULL),
(6, 2, 2, '/admin', '2018-03-27 05:19:37', NULL, NULL, NULL),
(7, 2, 2, '/admin', '2018-03-27 05:19:39', NULL, NULL, NULL),
(8, 2, 2, '/admin', '2018-03-27 05:21:24', NULL, NULL, NULL),
(9, 2, 2, '/admin', '2018-03-27 05:21:30', NULL, NULL, NULL),
(10, 2, 2, '/admin', '2018-03-27 05:21:46', NULL, NULL, NULL),
(11, 2, 2, '/admin', '2018-03-27 05:22:15', NULL, NULL, NULL),
(12, 2, 2, '/admin', '2018-03-27 05:22:18', NULL, NULL, NULL),
(13, 3, 3, '/', '2018-03-27 05:22:50', NULL, NULL, NULL),
(14, 2, 2, '/admin', '2018-03-27 05:24:51', NULL, NULL, NULL),
(15, 2, 2, '/admin', '2018-03-27 05:24:59', NULL, NULL, NULL),
(16, 2, 2, '/admin', '2018-03-27 05:25:33', NULL, NULL, NULL),
(17, 2, 2, '/admin', '2018-03-27 05:25:40', NULL, NULL, NULL),
(18, 2, 2, '/company', '2018-03-27 05:25:44', NULL, NULL, NULL),
(19, 2, 2, '/company', '2018-03-27 05:25:48', NULL, NULL, NULL),
(20, 2, 2, '/company', '2018-03-27 05:25:51', NULL, NULL, NULL),
(21, 2, 2, '/admin', '2018-03-27 05:26:03', NULL, NULL, NULL),
(22, 2, 2, '/admin', '2018-03-27 05:26:11', NULL, NULL, NULL),
(23, 2, 2, '/', '2018-03-27 05:26:14', NULL, NULL, NULL),
(24, 2, 2, '/', '2018-03-27 05:26:15', NULL, NULL, NULL),
(25, 2, 2, '/', '2018-03-27 05:26:19', NULL, NULL, NULL),
(26, 2, 2, '/', '2018-03-27 05:26:21', NULL, NULL, NULL),
(27, 2, 2, '/admin', '2018-03-27 05:26:24', NULL, NULL, NULL),
(28, 2, 2, '/admin', '2018-03-27 05:26:31', NULL, NULL, NULL),
(29, 2, 2, '/admin', '2018-03-27 05:26:36', NULL, NULL, NULL),
(30, 2, 2, '/', '2018-03-27 05:26:37', NULL, NULL, NULL),
(31, 2, 2, '/company', '2018-03-27 05:26:41', NULL, NULL, NULL),
(32, 2, 2, '/company', '2018-03-27 05:26:42', NULL, NULL, NULL),
(33, 2, 2, '/company', '2018-03-27 05:26:44', NULL, NULL, NULL),
(34, 2, 2, '/company', '2018-03-27 05:26:48', NULL, NULL, NULL),
(35, 2, 2, '/company', '2018-03-27 05:27:31', NULL, NULL, NULL),
(36, 2, 2, '/company', '2018-03-27 05:27:41', NULL, NULL, NULL),
(37, 2, 2, '/company', '2018-03-27 05:27:42', NULL, NULL, NULL),
(38, 2, 2, '/', '2018-03-27 05:27:44', NULL, NULL, NULL),
(39, 2, 2, '/admin', '2018-03-27 05:27:47', NULL, NULL, NULL),
(40, 2, 2, '/', '2018-03-27 05:29:21', NULL, NULL, NULL),
(41, 2, 2, '/', '2018-03-27 05:29:23', NULL, NULL, NULL),
(42, 2, 2, '/', '2018-03-27 05:29:29', NULL, NULL, NULL),
(43, 2, 2, '/', '2018-03-27 05:29:40', NULL, NULL, NULL),
(44, 2, 2, '/', '2018-03-27 05:29:49', NULL, NULL, NULL),
(45, 2, 2, '/', '2018-03-27 05:29:51', NULL, NULL, NULL),
(46, 2, 2, '/', '2018-03-27 05:30:14', NULL, NULL, NULL),
(47, 2, 2, '/', '2018-03-27 05:30:16', NULL, NULL, NULL),
(48, 2, 2, '/admin', '2018-03-27 05:30:19', NULL, NULL, NULL),
(49, 2, 2, '/admin', '2018-03-27 05:30:28', NULL, NULL, NULL),
(50, 2, 2, '/', '2018-03-27 05:30:33', NULL, NULL, NULL),
(51, 2, 2, '/company', '2018-03-27 05:30:35', NULL, NULL, NULL),
(52, 2, 2, '/admin', '2018-03-27 05:30:37', NULL, NULL, NULL),
(53, 2, 2, '/admin-routes', '2018-03-27 05:30:49', NULL, NULL, NULL),
(54, 2, 2, '/', '2018-03-27 05:30:51', NULL, NULL, NULL),
(55, 2, 2, '/', '2018-03-27 05:30:53', NULL, NULL, NULL),
(56, 2, 2, '/admin', '2018-03-27 05:30:54', NULL, NULL, NULL),
(57, 2, 2, '/admin', '2018-03-27 05:31:05', NULL, NULL, NULL),
(58, 2, 2, '/admin', '2018-03-27 05:31:07', NULL, NULL, NULL),
(59, 2, 2, '/admin', '2018-03-27 05:31:10', NULL, NULL, NULL),
(60, 2, 2, '/company', '2018-03-27 05:31:11', NULL, NULL, NULL),
(61, 2, 2, '/company', '2018-03-27 05:31:12', NULL, NULL, NULL),
(62, 2, 2, '/company', '2018-03-27 05:35:00', NULL, NULL, NULL),
(63, 2, 2, '/company', '2018-03-27 05:35:03', NULL, NULL, NULL),
(64, 2, 2, '/company', '2018-03-27 05:35:06', NULL, NULL, NULL),
(65, 2, 2, '/company', '2018-03-27 05:35:08', NULL, NULL, NULL),
(66, 2, 2, '/company', '2018-03-27 05:35:20', NULL, NULL, NULL),
(67, 2, 2, '/company', '2018-03-27 05:35:21', NULL, NULL, NULL),
(68, 2, 2, '/company', '2018-03-27 05:37:23', NULL, NULL, NULL),
(69, 2, 2, '/', '2018-03-27 05:37:25', NULL, NULL, NULL),
(70, 2, 2, '/admin', '2018-03-27 05:37:27', NULL, NULL, NULL),
(71, 2, 2, '/admin', '2018-03-27 05:37:46', NULL, NULL, NULL),
(72, 2, 2, '/', '2018-03-27 05:37:48', NULL, NULL, NULL),
(73, 2, 2, '/admin', '2018-03-27 05:37:52', NULL, NULL, NULL),
(74, 2, 2, '/admin', '2018-03-27 05:38:02', NULL, NULL, NULL),
(75, 2, 2, '/company', '2018-03-27 05:38:07', NULL, NULL, NULL),
(76, 2, 2, '/admin', '2018-03-27 05:38:09', NULL, NULL, NULL),
(77, 2, 2, '/company', '2018-03-27 05:38:10', NULL, NULL, NULL),
(78, 2, 2, '/company', '2018-03-27 05:38:12', NULL, NULL, NULL),
(79, 2, 2, '/admin', '2018-03-27 05:40:11', NULL, NULL, NULL),
(80, 2, 2, '/admin', '2018-03-27 05:40:14', NULL, NULL, NULL),
(81, 2, 2, '/company', '2018-03-27 05:40:15', NULL, NULL, NULL),
(82, 2, 2, '/company', '2018-03-27 05:40:28', NULL, NULL, NULL),
(83, 2, 2, '/admin', '2018-03-27 05:42:21', NULL, NULL, NULL),
(84, 2, 2, '/admin', '2018-03-27 05:42:29', NULL, NULL, NULL),
(85, 2, 2, '/admin', '2018-03-27 05:42:31', NULL, NULL, NULL),
(86, 2, 2, '/admin', '2018-03-27 05:42:33', NULL, NULL, NULL),
(87, 2, 2, '/admin', '2018-03-27 05:42:37', NULL, NULL, NULL),
(88, 2, 2, '/admin', '2018-03-27 05:42:38', NULL, NULL, NULL),
(89, 2, 2, '/admin', '2018-03-27 05:42:42', NULL, NULL, NULL),
(90, 2, 2, '/admin', '2018-03-27 05:42:47', NULL, NULL, NULL),
(91, 2, 2, '/admin', '2018-03-27 05:42:58', NULL, NULL, NULL),
(92, 2, 2, '/admin', '2018-03-27 05:43:03', NULL, NULL, NULL),
(93, 2, 2, '/admin', '2018-03-27 05:43:05', NULL, NULL, NULL),
(94, 2, 2, '/admin', '2018-03-27 05:43:07', NULL, NULL, NULL),
(95, 2, 2, '/admin', '2018-03-27 05:43:09', NULL, NULL, NULL),
(96, 2, 2, '/admin', '2018-03-27 05:43:10', NULL, NULL, NULL),
(97, 2, 2, '/admin', '2018-03-27 05:43:11', NULL, NULL, NULL),
(98, 2, 2, '/admin', '2018-03-27 05:43:12', NULL, NULL, NULL),
(99, 2, 2, '/admin', '2018-03-27 05:43:17', NULL, NULL, NULL),
(100, 2, 2, '/admin', '2018-03-27 05:43:30', NULL, NULL, NULL),
(101, 2, 2, '/admin', '2018-03-27 05:43:32', NULL, NULL, NULL),
(102, 2, 2, '/admin', '2018-03-27 05:43:33', NULL, NULL, NULL),
(103, 2, 2, '/admin', '2018-03-27 05:43:37', NULL, NULL, NULL),
(104, 2, 2, '/admin', '2018-03-27 05:43:47', NULL, NULL, NULL),
(105, 2, 2, '/admin', '2018-03-27 05:43:49', NULL, NULL, NULL),
(106, 2, 2, '/admin', '2018-03-27 05:44:00', NULL, NULL, NULL),
(107, 2, 2, '/admin-routes', '2018-03-27 05:44:12', NULL, NULL, NULL),
(108, 2, 2, '/admin-clients', '2018-03-27 05:44:17', NULL, NULL, NULL),
(109, 2, 2, '/admin-clients', '2018-03-27 05:44:19', NULL, NULL, NULL),
(110, 2, 2, '/admin-clients', '2018-03-27 05:44:20', NULL, NULL, NULL),
(111, 2, 2, '/admin-attendance', '2018-03-27 05:44:22', NULL, NULL, NULL),
(112, 2, 2, '/login', '2018-03-27 05:44:24', NULL, NULL, NULL),
(113, 2, 2, '/company', '2018-03-27 05:44:31', NULL, NULL, NULL),
(114, 2, 2, '/company', '2018-03-27 05:45:03', NULL, NULL, NULL),
(115, 2, 2, '/company', '2018-03-27 05:45:08', NULL, NULL, NULL),
(116, 2, 2, '/company', '2018-03-27 05:45:18', NULL, NULL, NULL),
(117, 2, 2, '/company', '2018-03-27 05:45:23', NULL, NULL, NULL),
(118, 2, 2, '/company', '2018-03-27 05:45:30', NULL, NULL, NULL),
(119, 2, 2, '/company', '2018-03-27 05:45:32', NULL, NULL, NULL),
(120, 2, 2, '/company', '2018-03-27 05:45:51', NULL, NULL, NULL),
(121, 2, 2, '/company', '2018-03-27 05:45:56', NULL, NULL, NULL),
(122, 2, 2, '/company', '2018-03-27 05:45:56', NULL, NULL, NULL),
(123, 2, 2, '/company', '2018-03-27 05:45:57', NULL, NULL, NULL),
(124, 2, 2, '/company', '2018-03-27 05:46:33', NULL, NULL, NULL),
(125, 2, 2, '/company', '2018-03-27 05:46:37', NULL, NULL, NULL),
(126, 2, 2, '/company', '2018-03-27 05:46:53', NULL, NULL, NULL),
(127, 2, 2, '/company', '2018-03-27 05:46:54', NULL, NULL, NULL),
(128, 2, 2, '/company', '2018-03-27 05:48:18', NULL, NULL, NULL),
(129, 2, 2, '/company', '2018-03-27 05:48:23', NULL, NULL, NULL),
(130, 2, 2, '/company', '2018-03-27 05:48:49', NULL, NULL, NULL),
(131, 2, 2, '/company', '2018-03-27 05:48:53', NULL, NULL, NULL),
(132, 2, 2, '/company', '2018-03-27 05:49:43', NULL, NULL, NULL),
(133, 2, 2, '/company', '2018-03-27 05:49:47', NULL, NULL, NULL),
(134, 2, 2, '/company', '2018-03-27 05:50:34', NULL, NULL, NULL),
(135, 2, 2, '/company', '2018-03-27 05:50:40', NULL, NULL, NULL),
(136, 2, 2, '/company', '2018-03-27 05:50:48', NULL, NULL, NULL),
(137, 2, 2, '/company', '2018-03-27 05:50:51', NULL, NULL, NULL),
(138, 2, 2, '/company', '2018-03-27 05:51:17', NULL, NULL, NULL),
(139, 2, 2, '/company', '2018-03-27 05:51:19', NULL, NULL, NULL),
(140, 2, 2, '/company', '2018-03-27 05:51:24', NULL, NULL, NULL),
(141, 2, 2, '/company', '2018-03-27 05:51:25', NULL, NULL, NULL),
(142, 2, 2, '/company', '2018-03-27 05:51:34', NULL, NULL, NULL),
(143, 2, 2, '/company', '2018-03-27 05:51:36', NULL, NULL, NULL),
(144, 2, 2, '/company', '2018-03-27 05:53:41', NULL, NULL, NULL),
(145, 2, 2, '/company', '2018-03-27 05:53:52', NULL, NULL, NULL),
(146, 2, 2, '/company', '2018-03-27 05:53:58', NULL, NULL, NULL),
(147, 2, 2, '/admin', '2018-03-27 05:54:17', NULL, NULL, NULL),
(148, 2, 2, '/admin', '2018-03-27 05:54:19', NULL, NULL, NULL),
(149, 2, 2, '/admin', '2018-03-27 05:54:22', NULL, NULL, NULL),
(150, 2, 2, '/company', '2018-03-27 05:54:24', NULL, NULL, NULL),
(151, 2, 2, '/company', '2018-03-27 05:54:59', NULL, NULL, NULL),
(152, 2, 2, '/company', '2018-03-27 05:55:06', NULL, NULL, NULL),
(153, 2, 2, '/company', '2018-03-27 05:56:00', NULL, NULL, NULL),
(154, 2, 2, '/company', '2018-03-27 05:56:04', NULL, NULL, NULL),
(155, 2, 2, '/company', '2018-03-27 05:56:17', NULL, NULL, NULL),
(156, 2, 2, '/company', '2018-03-27 05:56:20', NULL, NULL, NULL),
(157, 2, 2, '/company', '2018-03-27 05:56:29', NULL, NULL, NULL),
(158, 2, 2, '/company', '2018-03-27 05:56:32', NULL, NULL, NULL),
(159, 2, 2, '/company', '2018-03-27 05:57:08', NULL, NULL, NULL),
(160, 2, 2, '/company', '2018-03-27 05:57:12', NULL, NULL, NULL),
(161, 2, 2, '/company', '2018-03-27 05:57:13', NULL, NULL, NULL),
(162, 2, 2, '/admin', '2018-03-27 05:57:22', NULL, NULL, NULL),
(163, 2, 2, '/company', '2018-03-27 05:59:10', NULL, NULL, NULL),
(164, 2, 2, '/company', '2018-03-27 05:59:16', NULL, NULL, NULL),
(165, 2, 2, '/company', '2018-03-27 05:59:31', NULL, NULL, NULL),
(166, 2, 2, '/company', '2018-03-27 05:59:35', NULL, NULL, NULL),
(167, 2, 2, '/company', '2018-03-27 06:01:10', NULL, NULL, NULL),
(168, 2, 2, '/company', '2018-03-27 06:01:13', NULL, NULL, NULL),
(169, 2, 2, '/company', '2018-03-27 06:03:08', NULL, NULL, NULL),
(170, 2, 2, '/company', '2018-03-27 06:03:14', NULL, NULL, NULL),
(171, 2, 2, '/company', '2018-03-27 06:03:38', NULL, NULL, NULL),
(172, 2, 2, '/company', '2018-03-27 06:03:44', NULL, NULL, NULL),
(173, 2, 2, '/company', '2018-03-27 06:04:26', NULL, NULL, NULL),
(174, 2, 2, '/company', '2018-03-27 06:04:28', NULL, NULL, NULL),
(175, 2, 2, '/company', '2018-03-27 06:04:41', NULL, NULL, NULL),
(176, 2, 2, '/company', '2018-03-27 06:04:42', NULL, NULL, NULL),
(177, 2, 2, '/company', '2018-03-27 06:04:47', NULL, NULL, NULL),
(178, 2, 2, '/company', '2018-03-27 06:05:20', NULL, NULL, NULL),
(179, 2, 2, '/', '2018-03-27 06:05:22', NULL, NULL, NULL),
(180, 2, 2, '/', '2018-03-27 06:05:23', NULL, NULL, NULL),
(181, 2, 2, '/', '2018-03-27 06:05:24', NULL, NULL, NULL),
(182, 2, 2, '/', '2018-03-27 06:05:36', NULL, NULL, NULL),
(183, 2, 2, '/', '2018-03-27 06:05:43', NULL, NULL, NULL),
(184, 2, 2, '/', '2018-03-27 06:05:47', NULL, NULL, NULL),
(185, 2, 2, '/', '2018-03-27 06:05:48', NULL, NULL, NULL),
(186, 2, 2, '/', '2018-03-27 06:05:56', NULL, NULL, NULL),
(187, 2, 2, '/', '2018-03-27 06:06:00', NULL, NULL, NULL),
(188, 2, 2, '/', '2018-03-27 06:06:11', NULL, NULL, NULL),
(189, 2, 2, '/', '2018-03-27 06:06:23', NULL, NULL, NULL),
(190, 2, 2, '/', '2018-03-27 06:06:28', NULL, NULL, NULL),
(191, 2, 2, '/', '2018-03-27 06:06:31', NULL, NULL, NULL),
(192, 2, 2, '/', '2018-03-27 06:06:49', NULL, NULL, NULL),
(193, 2, 2, '/', '2018-03-27 06:07:00', NULL, NULL, NULL),
(194, 2, 2, '/', '2018-03-27 06:07:17', NULL, NULL, NULL),
(195, 2, 2, '/', '2018-03-27 06:07:25', NULL, NULL, NULL),
(196, 2, 2, '/', '2018-03-27 06:07:27', NULL, NULL, NULL),
(197, 2, 2, '/', '2018-03-27 06:07:40', NULL, NULL, NULL),
(198, 2, 2, '/', '2018-03-27 06:07:42', NULL, NULL, NULL),
(199, 2, 2, '/', '2018-03-27 06:08:24', NULL, NULL, NULL),
(200, 2, 2, '/', '2018-03-27 06:08:30', NULL, NULL, NULL),
(201, 2, 2, '/', '2018-03-27 06:08:31', NULL, NULL, NULL),
(202, 2, 2, '/', '2018-03-27 06:08:43', NULL, NULL, NULL),
(203, 2, 2, '/', '2018-03-27 06:08:52', NULL, NULL, NULL),
(204, 2, 2, '/', '2018-03-27 06:08:57', NULL, NULL, NULL),
(205, 2, 2, '/', '2018-03-27 06:08:59', NULL, NULL, NULL),
(206, 2, 2, '/', '2018-03-27 06:09:23', NULL, NULL, NULL),
(207, 2, 2, '/', '2018-03-27 06:09:29', NULL, NULL, NULL),
(208, 2, 2, '/', '2018-03-27 06:09:32', NULL, NULL, NULL),
(209, 2, 2, '/', '2018-03-27 06:09:35', NULL, NULL, NULL),
(210, 2, 2, '/', '2018-03-27 06:09:42', NULL, NULL, NULL),
(211, 2, 2, '/', '2018-03-27 06:09:51', NULL, NULL, NULL),
(212, 2, 2, '/', '2018-03-27 06:10:20', NULL, NULL, NULL),
(213, 2, 2, '/', '2018-03-27 06:10:28', NULL, NULL, NULL),
(214, 1, 1, '/company', '2018-03-27 06:16:50', NULL, NULL, NULL),
(215, 1, 1, '/', '2018-03-27 06:18:31', NULL, NULL, NULL),
(216, 1, 1, '/login', '2018-03-27 06:18:56', NULL, NULL, NULL),
(217, 2, 2, '/', '2018-03-27 06:19:08', NULL, NULL, NULL),
(218, 2, 2, '/', '2018-03-27 06:19:19', NULL, NULL, NULL),
(219, 2, 2, '/', '2018-03-27 06:19:21', NULL, NULL, NULL),
(220, 2, 2, '/admin', '2018-03-27 06:19:48', NULL, NULL, NULL),
(221, 2, 2, '/admin', '2018-03-27 06:20:49', NULL, NULL, NULL),
(222, 2, 2, '/', '2018-03-27 06:20:51', NULL, NULL, NULL),
(223, 2, 2, '/', '2018-03-27 06:20:54', NULL, NULL, NULL),
(224, 2, 2, '/', '2018-03-27 06:21:06', NULL, NULL, NULL),
(225, 2, 2, '/', '2018-03-27 06:21:09', NULL, NULL, NULL),
(226, 2, 2, '/', '2018-03-27 06:21:58', NULL, NULL, NULL),
(227, 2, 2, '/', '2018-03-27 06:22:05', NULL, NULL, NULL),
(228, 2, 2, '/admin', '2018-03-27 06:22:11', NULL, NULL, NULL),
(229, 2, 2, '/admin', '2018-03-27 06:23:39', NULL, NULL, NULL),
(230, 2, 2, '/admin', '2018-03-27 06:23:50', NULL, NULL, NULL),
(231, 2, 2, '/company', '2018-03-27 06:23:52', NULL, NULL, NULL),
(232, 2, 2, '/', '2018-03-27 06:23:56', NULL, NULL, NULL),
(233, 2, 2, '/', '2018-03-27 06:23:59', NULL, NULL, NULL),
(234, 2, 2, '/', '2018-03-27 06:24:02', NULL, NULL, NULL),
(235, 2, 2, '/', '2018-03-27 06:24:05', NULL, NULL, NULL),
(236, 2, 2, '/', '2018-03-27 06:24:07', NULL, NULL, NULL),
(237, 2, 2, '/', '2018-03-27 06:24:08', NULL, NULL, NULL),
(238, 2, 2, '/', '2018-03-27 06:24:10', NULL, NULL, NULL),
(239, 2, 2, '/', '2018-03-27 06:24:13', NULL, NULL, NULL),
(240, 2, 2, '/company', '2018-03-27 06:24:14', NULL, NULL, NULL),
(241, 2, 2, '/company', '2018-03-27 06:24:15', NULL, NULL, NULL),
(242, 2, 2, '/company', '2018-03-27 06:24:16', NULL, NULL, NULL),
(243, 2, 2, '/company', '2018-03-27 06:24:18', NULL, NULL, NULL),
(244, 2, 2, '/admin', '2018-03-27 06:24:20', NULL, NULL, NULL),
(245, 2, 2, '/admin', '2018-03-27 06:24:24', NULL, NULL, NULL),
(246, 2, 2, '/admin', '2018-03-27 06:24:32', NULL, NULL, NULL),
(247, 2, 2, '/admin', '2018-03-27 06:24:50', NULL, NULL, NULL),
(248, 2, 2, '/admin-routes', '2018-03-27 06:24:51', NULL, NULL, NULL),
(249, 2, 2, '/admin-routes', '2018-03-27 06:24:55', NULL, NULL, NULL),
(250, 2, 2, '/admin-routes', '2018-03-27 06:24:56', NULL, NULL, NULL),
(251, 2, 2, '/admin-routes', '2018-03-27 06:25:00', NULL, NULL, NULL),
(252, 2, 2, '/admin-routes', '2018-03-27 06:25:03', NULL, NULL, NULL),
(253, 2, 2, '/admin-routes', '2018-03-27 06:25:07', NULL, NULL, NULL),
(254, 2, 2, '/admin-routes', '2018-03-27 06:25:09', NULL, NULL, NULL),
(255, 2, 2, '/admin-routes', '2018-03-27 06:25:11', NULL, NULL, NULL),
(256, 2, 2, '/admin', '2018-03-27 06:25:18', NULL, NULL, NULL),
(257, 2, 2, '/admin', '2018-03-27 06:25:20', NULL, NULL, NULL),
(258, 2, 2, '/admin', '2018-03-27 06:25:21', NULL, NULL, NULL),
(259, 2, 2, '/admin', '2018-03-27 06:25:23', NULL, NULL, NULL),
(260, 2, 2, '/admin-routes', '2018-03-27 06:25:24', NULL, NULL, NULL),
(261, 2, 2, '/admin-routes', '2018-03-27 06:25:55', NULL, NULL, NULL),
(262, 2, 2, '/admin-routes', '2018-03-27 06:26:03', NULL, NULL, NULL),
(263, 2, 2, '/admin-routes', '2018-03-27 06:26:10', NULL, NULL, NULL),
(264, 2, 2, '/admin-routes', '2018-03-27 06:26:12', NULL, NULL, NULL),
(265, 2, 2, '/', '2018-03-27 06:26:15', NULL, NULL, NULL),
(266, 2, 2, '/', '2018-03-27 06:26:17', NULL, NULL, NULL),
(267, 2, 2, '/', '2018-03-27 06:26:18', NULL, NULL, NULL),
(268, 2, 2, '/', '2018-03-27 06:26:22', NULL, NULL, NULL),
(269, 2, 2, '/', '2018-03-27 06:26:39', NULL, NULL, NULL),
(270, 2, 2, '/', '2018-03-27 06:26:39', NULL, NULL, NULL),
(271, 2, 2, '/', '2018-03-27 06:26:49', NULL, NULL, NULL),
(272, 2, 2, '/', '2018-03-27 06:26:50', NULL, NULL, NULL),
(273, 2, 2, '/', '2018-03-27 06:27:13', NULL, NULL, NULL),
(274, 2, 2, '/', '2018-03-27 06:27:15', NULL, NULL, NULL),
(275, 2, 2, '/company', '2018-03-27 06:27:26', NULL, NULL, NULL),
(276, 2, 2, '/company', '2018-03-27 06:27:30', NULL, NULL, NULL),
(277, 2, 2, '/company', '2018-03-27 06:27:31', NULL, NULL, NULL),
(278, 2, 2, '/company', '2018-03-27 06:27:34', NULL, NULL, NULL),
(279, 2, 2, '/company', '2018-03-27 06:27:35', NULL, NULL, NULL),
(280, 2, 2, '/company', '2018-03-27 06:27:35', NULL, NULL, NULL),
(281, 2, 2, '/company', '2018-03-27 06:28:07', NULL, NULL, NULL),
(282, 2, 2, '/company', '2018-03-27 06:28:07', NULL, NULL, NULL),
(283, 2, 2, '/company', '2018-03-27 06:28:53', NULL, NULL, NULL),
(284, 2, 2, '/company', '2018-03-27 06:28:54', NULL, NULL, NULL),
(285, 2, 2, '/company', '2018-03-27 06:29:06', NULL, NULL, NULL),
(286, 2, 2, '/company', '2018-03-27 06:29:06', NULL, NULL, NULL),
(287, 2, 2, '/admin', '2018-03-27 06:29:14', NULL, NULL, NULL),
(288, 2, 2, '/admin-routes', '2018-03-27 06:29:16', NULL, NULL, NULL),
(289, 2, 2, '/admin-routes', '2018-03-27 06:29:42', NULL, NULL, NULL),
(290, 2, 2, '/company', '2018-03-27 06:29:47', NULL, NULL, NULL),
(291, 2, 2, '/company', '2018-03-27 06:29:47', NULL, NULL, NULL),
(292, 2, 2, '/admin', '2018-03-27 06:29:59', NULL, NULL, NULL),
(293, 2, 2, '/admin-routes', '2018-03-27 06:30:01', NULL, NULL, NULL),
(294, 2, 2, '/admin-routes', '2018-03-27 06:30:03', NULL, NULL, NULL),
(295, 2, 2, '/admin-routes', '2018-03-27 06:30:07', NULL, NULL, NULL),
(296, 2, 2, '/admin-routes', '2018-03-27 06:30:29', NULL, NULL, NULL),
(297, 2, 2, '/company', '2018-03-27 06:30:33', NULL, NULL, NULL),
(298, 2, 2, '/company', '2018-03-27 06:30:33', NULL, NULL, NULL),
(299, 2, 2, '/company', '2018-03-27 06:30:34', NULL, NULL, NULL),
(300, 2, 2, '/company', '2018-03-27 06:30:34', NULL, NULL, NULL),
(301, 2, 2, '/company', '2018-03-27 06:30:46', NULL, NULL, NULL),
(302, 2, 2, '/company', '2018-03-27 06:30:47', NULL, NULL, NULL),
(303, 2, 2, '/company-history', '2018-03-27 06:30:48', NULL, NULL, NULL),
(304, 2, 2, '/shop', '2018-03-27 06:35:41', NULL, NULL, NULL),
(305, 2, 2, '/shop', '2018-03-27 06:35:43', NULL, NULL, NULL),
(306, 2, 2, '/shop', '2018-03-27 06:35:44', NULL, NULL, NULL),
(307, 2, 2, '/shop', '2018-03-27 06:38:20', NULL, NULL, NULL),
(308, 2, 2, '/shop', '2018-03-27 06:38:33', NULL, NULL, NULL),
(309, 2, 2, '/shop', '2018-03-27 06:38:48', NULL, NULL, NULL),
(310, 2, 2, '/shop', '2018-03-27 06:38:49', NULL, NULL, NULL),
(311, 2, 2, '/shop', '2018-03-27 06:38:57', NULL, NULL, NULL),
(312, 2, 2, '/shop', '2018-03-27 06:39:08', NULL, NULL, NULL),
(313, 2, 2, '/admin', '2018-03-27 06:39:11', NULL, NULL, NULL),
(314, 2, 2, '/admin', '2018-03-27 06:39:13', NULL, NULL, NULL),
(315, 2, 2, '/admin-routes', '2018-03-27 06:39:14', NULL, NULL, NULL),
(316, 2, 2, '/admin-routes', '2018-03-27 06:39:29', NULL, NULL, NULL),
(317, 2, 2, '/admin-routes', '2018-03-27 06:39:32', NULL, NULL, NULL),
(318, 2, 2, '/info', '2018-03-27 06:39:35', NULL, NULL, NULL),
(319, 2, 2, '/info', '2018-03-27 06:39:36', NULL, NULL, NULL),
(320, 2, 2, '/info', '2018-03-27 06:39:37', NULL, NULL, NULL),
(321, 2, 2, '/info', '2018-03-27 06:39:40', NULL, NULL, NULL),
(322, 2, 2, '/info', '2018-03-27 06:39:42', NULL, NULL, NULL),
(323, 2, 2, '/info', '2018-03-27 06:39:42', NULL, NULL, NULL),
(324, 2, 2, '/info', '2018-03-27 06:40:33', NULL, NULL, NULL),
(325, 2, 2, '/info', '2018-03-27 06:40:33', NULL, NULL, NULL),
(326, 2, 2, '/info', '2018-03-27 06:40:49', NULL, NULL, NULL),
(327, 2, 2, '/info', '2018-03-27 06:40:50', NULL, NULL, NULL),
(328, 2, 2, '/info', '2018-03-27 06:41:52', NULL, NULL, NULL),
(329, 2, 2, '/info', '2018-03-27 06:41:53', NULL, NULL, NULL),
(330, 2, 2, '/info', '2018-03-27 06:42:36', NULL, NULL, NULL),
(331, 2, 2, '/info', '2018-03-27 06:42:37', NULL, NULL, NULL),
(332, 2, 2, '/info', '2018-03-27 06:42:44', NULL, NULL, NULL),
(333, 2, 2, '/info', '2018-03-27 06:42:44', NULL, NULL, NULL),
(334, 2, 2, '/info', '2018-03-27 06:42:53', NULL, NULL, NULL),
(335, 2, 2, '/info', '2018-03-27 06:42:53', NULL, NULL, NULL),
(336, 2, 2, '/info', '2018-03-27 06:43:14', NULL, NULL, NULL),
(337, 2, 2, '/info', '2018-03-27 06:43:15', NULL, NULL, NULL),
(338, 2, 2, '/info', '2018-03-27 06:43:35', NULL, NULL, NULL),
(339, 2, 2, '/info', '2018-03-27 06:43:35', NULL, NULL, NULL),
(340, 2, 2, '/info', '2018-03-27 06:43:46', NULL, NULL, NULL),
(341, 2, 2, '/info', '2018-03-27 06:43:47', NULL, NULL, NULL),
(342, 2, 2, '/info', '2018-03-27 06:43:51', NULL, NULL, NULL),
(343, 2, 2, '/info', '2018-03-27 06:43:51', NULL, NULL, NULL),
(344, 2, 2, '/info', '2018-03-27 06:44:08', NULL, NULL, NULL),
(345, 2, 2, '/info', '2018-03-27 06:44:08', NULL, NULL, NULL),
(346, 2, 2, '/', '2018-03-27 06:44:10', NULL, NULL, NULL),
(347, 2, 2, '/company', '2018-03-27 06:44:10', NULL, NULL, NULL),
(348, 2, 2, '/company', '2018-03-27 06:44:11', NULL, NULL, NULL),
(349, 2, 2, '/shop', '2018-03-27 06:44:11', NULL, NULL, NULL),
(350, 2, 2, '/info', '2018-03-27 06:44:12', NULL, NULL, NULL),
(351, 2, 2, '/info', '2018-03-27 06:44:12', NULL, NULL, NULL),
(352, 2, 2, '/', '2018-03-27 06:44:13', NULL, NULL, NULL),
(353, 4, 4, '/', '2018-03-27 06:51:44', NULL, NULL, NULL),
(354, 4, 4, '/login', '2018-03-27 06:51:49', NULL, NULL, NULL),
(355, 4, 4, '/', '2018-03-27 06:52:01', NULL, NULL, NULL),
(356, 4, 4, '/company', '2018-03-27 06:52:17', NULL, NULL, NULL),
(357, 4, 4, '/company', '2018-03-27 06:52:17', NULL, NULL, NULL),
(358, 4, 4, '/company', '2018-03-27 06:52:19', NULL, NULL, NULL),
(359, 4, 4, '/company', '2018-03-27 06:52:19', NULL, NULL, NULL),
(360, 4, 4, '/company', '2018-03-27 06:53:04', NULL, NULL, NULL),
(361, 4, 4, '/company', '2018-03-27 06:53:04', NULL, NULL, NULL),
(362, 4, 4, '/company', '2018-03-27 06:53:48', NULL, NULL, NULL),
(363, 4, 4, '/company', '2018-03-27 06:53:48', NULL, NULL, NULL),
(364, 4, 4, '/company', '2018-03-27 06:54:25', NULL, NULL, NULL),
(365, 4, 4, '/company', '2018-03-27 06:54:25', NULL, NULL, NULL),
(366, 4, 4, '/company', '2018-03-27 06:54:28', NULL, NULL, NULL),
(367, 4, 4, '/company', '2018-03-27 06:54:28', NULL, NULL, NULL),
(368, 4, 4, '/company', '2018-03-27 06:54:29', NULL, NULL, NULL),
(369, 4, 4, '/company', '2018-03-27 06:54:30', NULL, NULL, NULL),
(370, 4, 4, '/company', '2018-03-27 06:55:32', NULL, NULL, NULL),
(371, 4, 4, '/company', '2018-03-27 06:55:32', NULL, NULL, NULL),
(372, 4, 4, '/company', '2018-03-27 06:56:40', NULL, NULL, NULL),
(373, 4, 4, '/company', '2018-03-27 06:56:40', NULL, NULL, NULL),
(374, 4, 4, '/company', '2018-03-27 06:56:41', NULL, NULL, NULL),
(375, 4, 4, '/company', '2018-03-27 06:58:00', NULL, NULL, NULL),
(376, 4, 4, '/company', '2018-03-27 06:58:00', NULL, NULL, NULL),
(377, 4, 4, '/company', '2018-03-27 06:58:27', NULL, NULL, NULL),
(378, 4, 4, '/company', '2018-03-27 06:58:27', NULL, NULL, NULL),
(379, 4, 4, '/company', '2018-03-27 06:58:29', NULL, NULL, NULL),
(380, 4, 4, '/company', '2018-03-27 06:58:29', NULL, NULL, NULL),
(381, 4, 4, '/company', '2018-03-27 06:58:34', NULL, NULL, NULL),
(382, 4, 4, '/company', '2018-03-27 06:58:34', NULL, NULL, NULL),
(383, 4, 4, '/company', '2018-03-27 06:58:46', NULL, NULL, NULL),
(384, 4, 4, '/company', '2018-03-27 06:58:46', NULL, NULL, NULL),
(385, 4, 4, '/company', '2018-03-27 06:59:05', NULL, NULL, NULL),
(386, 4, 4, '/company', '2018-03-27 06:59:06', NULL, NULL, NULL),
(387, 4, 4, '/company', '2018-03-27 06:59:24', NULL, NULL, NULL),
(388, 4, 4, '/company', '2018-03-27 06:59:25', NULL, NULL, NULL),
(389, 4, 4, '/info', '2018-03-27 06:59:26', NULL, NULL, NULL),
(390, 4, 4, '/info', '2018-03-27 06:59:26', NULL, NULL, NULL),
(391, 4, 4, '/info', '2018-03-27 06:59:30', NULL, NULL, NULL),
(392, 4, 4, '/info', '2018-03-27 06:59:30', NULL, NULL, NULL),
(393, 4, 4, '/info', '2018-03-27 06:59:32', NULL, NULL, NULL),
(394, 4, 4, '/info', '2018-03-27 06:59:32', NULL, NULL, NULL),
(395, 4, 4, '/info', '2018-03-27 07:00:32', NULL, NULL, NULL),
(396, 4, 4, '/info', '2018-03-27 07:00:32', NULL, NULL, NULL),
(397, 4, 4, '/info', '2018-03-27 07:01:16', NULL, NULL, NULL),
(398, 4, 4, '/info', '2018-03-27 07:01:16', NULL, NULL, NULL),
(399, 4, 4, '/info', '2018-03-27 07:02:13', NULL, NULL, NULL),
(400, 4, 4, '/info', '2018-03-27 07:02:13', NULL, NULL, NULL),
(401, 4, 4, '/info', '2018-03-27 07:04:39', NULL, NULL, NULL),
(402, 4, 4, '/info', '2018-03-27 07:04:39', NULL, NULL, NULL),
(403, 4, 4, '/company', '2018-03-27 07:04:46', NULL, NULL, NULL),
(404, 4, 4, '/company', '2018-03-27 07:04:46', NULL, NULL, NULL),
(405, 4, 4, '/company', '2018-03-27 07:05:02', NULL, NULL, NULL),
(406, 4, 4, '/company', '2018-03-27 07:05:03', NULL, NULL, NULL),
(407, 4, 4, '/company', '2018-03-27 07:06:06', NULL, NULL, NULL),
(408, 4, 4, '/company', '2018-03-27 07:06:06', NULL, NULL, NULL),
(409, 4, 4, '/company', '2018-03-27 07:06:13', NULL, NULL, NULL),
(410, 4, 4, '/company', '2018-03-27 07:06:13', NULL, NULL, NULL),
(411, 2, 2, '/', '2018-03-27 08:05:12', NULL, NULL, NULL),
(412, 2, 2, '/shop', '2018-03-27 08:05:14', NULL, NULL, NULL),
(413, 2, 2, '/company', '2018-03-27 08:05:15', NULL, NULL, NULL),
(414, 2, 2, '/company', '2018-03-27 08:05:16', NULL, NULL, NULL),
(415, 2, 2, '/', '2018-03-27 08:05:20', NULL, NULL, NULL),
(416, 2, 2, '/shop', '2018-03-27 08:05:22', NULL, NULL, NULL),
(417, 2, 2, '/info', '2018-03-27 08:05:23', NULL, NULL, NULL),
(418, 2, 2, '/info', '2018-03-27 08:05:23', NULL, NULL, NULL),
(419, 2, 2, '/company', '2018-03-27 08:05:26', NULL, NULL, NULL),
(420, 2, 2, '/company', '2018-03-27 08:05:26', NULL, NULL, NULL),
(421, 4, 4, '/', '2018-03-27 08:06:20', NULL, NULL, NULL),
(422, 4, 4, '/', '2018-03-27 08:06:23', NULL, NULL, NULL),
(423, 4, 4, '/shop', '2018-03-27 08:06:25', NULL, NULL, NULL),
(424, 2, 2, '/company-history', '2018-03-27 08:06:26', NULL, NULL, NULL),
(425, 4, 4, '/info', '2018-03-27 08:06:27', NULL, NULL, NULL),
(426, 4, 4, '/info', '2018-03-27 08:06:27', NULL, NULL, NULL),
(427, 4, 4, '/company', '2018-03-27 08:06:30', NULL, NULL, NULL),
(428, 4, 4, '/company', '2018-03-27 08:06:30', NULL, NULL, NULL),
(429, 2, 2, '/company', '2018-03-27 08:09:32', NULL, NULL, NULL),
(430, 2, 2, '/company', '2018-03-27 08:09:32', NULL, NULL, NULL),
(431, 2, 2, '/company', '2018-03-27 08:09:34', NULL, NULL, NULL),
(432, 2, 2, '/company', '2018-03-27 08:09:34', NULL, NULL, NULL),
(433, 2, 2, '/company', '2018-03-27 08:09:35', NULL, NULL, NULL),
(434, 2, 2, '/company', '2018-03-27 08:09:35', NULL, NULL, NULL),
(435, 2, 2, '/company', '2018-03-27 08:09:41', NULL, NULL, NULL),
(436, 2, 2, '/company', '2018-03-27 08:09:41', NULL, NULL, NULL),
(437, 2, 2, '/company', '2018-03-27 08:09:49', NULL, NULL, NULL),
(438, 2, 2, '/company', '2018-03-27 08:09:49', NULL, NULL, NULL),
(439, 2, 2, '/company', '2018-03-27 08:09:58', NULL, NULL, NULL),
(440, 2, 2, '/company', '2018-03-27 08:09:58', NULL, NULL, NULL),
(441, 2, 2, '/admin', '2018-03-27 08:12:56', NULL, NULL, NULL),
(442, 2, 2, '/admin-routes', '2018-03-27 08:12:58', NULL, NULL, NULL),
(443, 2, 2, '/admin-routes', '2018-03-27 08:14:52', NULL, NULL, NULL),
(444, 2, 2, '/admin-routes', '2018-03-27 08:15:18', NULL, NULL, NULL),
(445, 4, 4, '/company', '2018-03-27 08:15:55', NULL, NULL, NULL),
(446, 4, 4, '/company', '2018-03-27 08:15:55', NULL, NULL, NULL),
(447, 4, 4, '/company', '2018-03-27 08:16:03', NULL, NULL, NULL),
(448, 4, 4, '/company', '2018-03-27 08:16:03', NULL, NULL, NULL),
(449, 4, 4, '/company', '2018-03-27 08:16:13', NULL, NULL, NULL),
(450, 4, 4, '/company', '2018-03-27 08:16:14', NULL, NULL, NULL),
(451, 4, 4, '/company', '2018-03-27 08:16:45', NULL, NULL, NULL),
(452, 4, 4, '/company', '2018-03-27 08:16:45', NULL, NULL, NULL),
(453, 4, 4, '/company', '2018-03-27 08:16:50', NULL, NULL, NULL),
(454, 4, 4, '/company', '2018-03-27 08:16:51', NULL, NULL, NULL),
(455, 2, 2, '/admin-routes', '2018-03-27 08:25:59', NULL, NULL, NULL),
(456, 2, 2, '/admin-routes', '2018-03-27 08:26:18', NULL, NULL, NULL),
(457, 2, 2, '/admin-routes', '2018-03-27 08:28:06', NULL, NULL, NULL),
(458, 2, 2, '/admin-routes', '2018-03-27 08:28:11', NULL, NULL, NULL),
(459, 2, 2, '/admin-components', '2018-03-27 08:28:14', NULL, NULL, NULL),
(460, 2, 2, '/admin-components', '2018-03-27 08:28:15', NULL, NULL, NULL),
(461, 2, 2, '/admin-components', '2018-03-27 08:28:16', NULL, NULL, NULL),
(462, 2, 2, '/admin-components', '2018-03-27 08:28:23', NULL, NULL, NULL),
(463, 2, 2, '/admin-components', '2018-03-27 08:28:26', NULL, NULL, NULL),
(464, 2, 2, '/admin-components', '2018-03-27 08:28:28', NULL, NULL, NULL),
(465, 2, 2, '/admin-routes', '2018-03-27 08:28:30', NULL, NULL, NULL),
(466, 2, 2, '/admin-components', '2018-03-27 08:28:31', NULL, NULL, NULL),
(467, 2, 2, '/admin-clients', '2018-03-27 08:28:39', NULL, NULL, NULL),
(468, 2, 2, '/admin-clients', '2018-03-27 08:28:40', NULL, NULL, NULL),
(469, 2, 2, '/admin-clients', '2018-03-27 08:28:41', NULL, NULL, NULL),
(470, 2, 2, '/admin-clients', '2018-03-27 08:28:43', NULL, NULL, NULL),
(471, 2, 2, '/admin-clients', '2018-03-27 08:28:45', NULL, NULL, NULL),
(472, 2, 2, '/admin-clients', '2018-03-27 08:28:49', NULL, NULL, NULL),
(473, 2, 2, '/admin-clients', '2018-03-27 08:28:50', NULL, NULL, NULL),
(474, 2, 2, '/admin-clients', '2018-03-27 08:28:51', NULL, NULL, NULL),
(475, 2, 2, '/admin-components', '2018-03-27 08:28:53', NULL, NULL, NULL),
(476, 2, 2, '/admin-routes', '2018-03-27 08:28:53', NULL, NULL, NULL),
(477, 2, 2, '/admin-components', '2018-03-27 08:28:54', NULL, NULL, NULL),
(478, 2, 2, '/admin-clients', '2018-03-27 08:28:54', NULL, NULL, NULL),
(479, 2, 2, '/admin-attendance', '2018-03-27 08:28:55', NULL, NULL, NULL),
(480, 2, 2, '/admin-attendance', '2018-03-27 08:28:57', NULL, NULL, NULL),
(481, 2, 2, '/admin-attendance', '2018-03-27 08:28:58', NULL, NULL, NULL),
(482, 2, 2, '/admin-attendance', '2018-03-27 08:29:03', NULL, NULL, NULL),
(483, 2, 2, '/admin-attendance', '2018-03-27 08:29:05', NULL, NULL, NULL),
(484, 2, 2, '/admin-attendance', '2018-03-27 08:29:15', NULL, NULL, NULL),
(485, 2, 2, '/admin-globals', '2018-03-27 08:29:17', NULL, NULL, NULL),
(486, 2, 2, '/admin-globals', '2018-03-27 08:29:18', NULL, NULL, NULL),
(487, 2, 2, '/admin-globals', '2018-03-27 08:29:19', NULL, NULL, NULL),
(488, 2, 2, '/admin-globals', '2018-03-27 08:29:23', NULL, NULL, NULL),
(489, 2, 2, '/admin-globals', '2018-03-27 08:29:24', NULL, NULL, NULL),
(490, 2, 2, '/admin-globals', '2018-03-27 08:29:26', NULL, NULL, NULL),
(491, 2, 2, '/admin-attendance', '2018-03-27 08:29:27', NULL, NULL, NULL),
(492, 2, 2, '/admin-clients', '2018-03-27 08:29:28', NULL, NULL, NULL),
(493, 2, 2, '/admin-components', '2018-03-27 08:29:29', NULL, NULL, NULL),
(494, 2, 2, '/admin-routes', '2018-03-27 08:29:29', NULL, NULL, NULL),
(495, 2, 2, '/admin-components', '2018-03-27 08:29:31', NULL, NULL, NULL),
(496, 2, 2, '/admin-components', '2018-03-27 08:29:33', NULL, NULL, NULL),
(497, 2, 2, '/admin-components', '2018-03-27 08:29:34', NULL, NULL, NULL),
(498, 2, 2, '/admin-components', '2018-03-27 08:29:37', NULL, NULL, NULL),
(499, 2, 2, '/admin-components', '2018-03-27 08:29:41', NULL, NULL, NULL),
(500, 2, 2, '/admin-clients', '2018-03-27 08:29:42', NULL, NULL, NULL),
(501, 2, 2, '/admin-clients', '2018-03-27 08:29:44', NULL, NULL, NULL),
(502, 2, 2, '/admin-clients', '2018-03-27 08:29:45', NULL, NULL, NULL),
(503, 2, 2, '/admin-clients', '2018-03-27 08:29:51', NULL, NULL, NULL),
(504, 2, 2, '/admin-clients', '2018-03-27 08:29:53', NULL, NULL, NULL),
(505, 2, 2, '/admin-attendance', '2018-03-27 08:29:55', NULL, NULL, NULL),
(506, 2, 2, '/admin-attendance', '2018-03-27 08:29:56', NULL, NULL, NULL),
(507, 2, 2, '/admin-attendance', '2018-03-27 08:29:57', NULL, NULL, NULL),
(508, 2, 2, '/admin-attendance', '2018-03-27 08:30:27', NULL, NULL, NULL),
(509, 2, 2, '/admin-attendance', '2018-03-27 08:30:30', NULL, NULL, NULL),
(510, 2, 2, '/admin-globals', '2018-03-27 08:30:33', NULL, NULL, NULL),
(511, 2, 2, '/admin-globals', '2018-03-27 08:30:34', NULL, NULL, NULL),
(512, 4, 4, '/company', '2018-03-27 08:30:35', NULL, NULL, NULL),
(513, 4, 4, '/company', '2018-03-27 08:30:35', NULL, NULL, NULL),
(514, 2, 2, '/admin-globals', '2018-03-27 08:30:36', NULL, NULL, NULL),
(515, 4, 4, '/company', '2018-03-27 08:30:43', NULL, NULL, NULL),
(516, 4, 4, '/company', '2018-03-27 08:30:43', NULL, NULL, NULL),
(517, 4, 4, '/company', '2018-03-27 08:30:47', NULL, NULL, NULL),
(518, 4, 4, '/company', '2018-03-27 08:30:47', NULL, NULL, NULL),
(519, 2, 2, '/admin-globals', '2018-03-27 08:31:11', NULL, NULL, NULL),
(520, 2, 2, '/admin-globals', '2018-03-27 08:31:12', NULL, NULL, NULL),
(521, 2, 2, '/admin-attendance', '2018-03-27 08:31:15', NULL, NULL, NULL),
(522, 2, 2, '/admin-clients', '2018-03-27 08:31:15', NULL, NULL, NULL),
(523, 2, 2, '/admin-components', '2018-03-27 08:31:16', NULL, NULL, NULL),
(524, 2, 2, '/admin-routes', '2018-03-27 08:31:17', NULL, NULL, NULL),
(525, 2, 2, '/admin', '2018-03-27 08:31:20', NULL, NULL, NULL),
(526, 2, 2, '/admin-components', '2018-03-27 08:31:22', NULL, NULL, NULL),
(527, 2, 2, '/admin-clients', '2018-03-27 08:31:23', NULL, NULL, NULL),
(528, 2, 2, '/admin-attendance', '2018-03-27 08:31:23', NULL, NULL, NULL),
(529, 2, 2, '/admin-globals', '2018-03-27 08:31:24', NULL, NULL, NULL),
(530, 2, 2, '/admin-routes', '2018-03-27 08:31:25', NULL, NULL, NULL),
(531, 2, 2, '/admin', '2018-03-27 08:31:29', NULL, NULL, NULL),
(532, 2, 2, '/admin', '2018-03-27 08:31:35', NULL, NULL, NULL),
(533, 2, 2, '/admin', '2018-03-27 08:31:37', NULL, NULL, NULL),
(534, 2, 2, '/admin', '2018-03-27 08:32:12', NULL, NULL, NULL),
(535, 2, 2, '/admin', '2018-03-27 08:32:55', NULL, NULL, NULL),
(536, 2, 2, '/admin-components', '2018-03-27 08:32:59', NULL, NULL, NULL),
(537, 2, 2, '/admin-clients', '2018-03-27 08:33:00', NULL, NULL, NULL),
(538, 2, 2, '/admin-attendance', '2018-03-27 08:33:01', NULL, NULL, NULL),
(539, 2, 2, '/admin-globals', '2018-03-27 08:33:01', NULL, NULL, NULL),
(540, 2, 2, '/admin-routes', '2018-03-27 08:33:03', NULL, NULL, NULL),
(541, 2, 2, '/admin-components', '2018-03-27 08:33:03', NULL, NULL, NULL),
(542, 2, 2, '/admin-clients', '2018-03-27 08:33:04', NULL, NULL, NULL),
(543, 2, 2, '/admin-attendance', '2018-03-27 08:33:05', NULL, NULL, NULL),
(544, 2, 2, '/admin-clients', '2018-03-27 08:33:06', NULL, NULL, NULL),
(545, 2, 2, '/', '2018-03-27 08:33:14', NULL, NULL, NULL),
(546, 2, 2, '/admin', '2018-03-27 08:33:18', NULL, NULL, NULL),
(547, 2, 2, '/admin-routes', '2018-03-27 08:33:24', NULL, NULL, NULL),
(548, 2, 2, '/admin-routes', '2018-03-27 08:33:37', NULL, NULL, NULL),
(549, 2, 2, '/', '2018-03-27 08:33:39', NULL, NULL, NULL),
(550, 2, 2, '/company', '2018-03-27 08:33:40', NULL, NULL, NULL),
(551, 2, 2, '/company', '2018-03-27 08:33:40', NULL, NULL, NULL),
(552, 2, 2, '/shop', '2018-03-27 08:33:49', NULL, NULL, NULL),
(553, 2, 2, '/info', '2018-03-27 08:33:51', NULL, NULL, NULL),
(554, 2, 2, '/info', '2018-03-27 08:33:51', NULL, NULL, NULL),
(555, 2, 2, '/company', '2018-03-27 08:33:55', NULL, NULL, NULL),
(556, 2, 2, '/company', '2018-03-27 08:33:55', NULL, NULL, NULL),
(557, 2, 2, '/', '2018-03-27 08:33:56', NULL, NULL, NULL),
(558, 4, 4, '/company', '2018-03-27 08:36:51', NULL, NULL, NULL),
(559, 4, 4, '/company', '2018-03-27 08:36:51', NULL, NULL, NULL),
(560, 4, 4, '/company', '2018-03-27 08:39:18', NULL, NULL, NULL),
(561, 4, 4, '/company', '2018-03-27 08:39:18', NULL, NULL, NULL),
(562, 4, 4, '/company', '2018-03-27 08:39:38', NULL, NULL, NULL),
(563, 4, 4, '/company', '2018-03-27 08:39:38', NULL, NULL, NULL),
(564, 4, 4, '/info', '2018-03-27 08:41:55', NULL, NULL, NULL),
(565, 4, 4, '/info', '2018-03-27 08:41:55', NULL, NULL, NULL),
(566, 4, 4, '/info', '2018-03-27 08:41:58', NULL, NULL, NULL),
(567, 4, 4, '/info', '2018-03-27 08:41:59', NULL, NULL, NULL),
(568, 4, 4, '/info', '2018-03-27 08:42:04', NULL, NULL, NULL),
(569, 4, 4, '/info', '2018-03-27 08:42:04', NULL, NULL, NULL),
(570, 4, 4, '/info', '2018-03-27 08:43:26', NULL, NULL, NULL),
(571, 4, 4, '/info', '2018-03-27 08:43:27', NULL, NULL, NULL),
(572, 2, 2, '/', '2018-03-27 08:47:59', NULL, NULL, NULL),
(573, 4, 4, '/info', '2018-03-27 09:09:03', NULL, NULL, NULL),
(574, 4, 4, '/info', '2018-03-27 09:09:03', NULL, NULL, NULL),
(575, 4, 4, '/info', '2018-03-27 09:15:47', NULL, NULL, NULL),
(576, 4, 4, '/info', '2018-03-27 09:15:47', NULL, NULL, NULL),
(577, 4, 4, '/company', '2018-03-27 09:15:48', NULL, NULL, NULL),
(578, 4, 4, '/company', '2018-03-27 09:15:48', NULL, NULL, NULL),
(579, 4, 4, '/company', '2018-03-27 09:16:42', NULL, NULL, NULL),
(580, 4, 4, '/company', '2018-03-27 09:16:42', NULL, NULL, NULL),
(581, 4, 4, '/company', '2018-03-27 09:16:55', NULL, NULL, NULL),
(582, 4, 4, '/company', '2018-03-27 09:16:55', NULL, NULL, NULL),
(583, 4, 4, '/', '2018-03-27 09:17:09', NULL, NULL, NULL),
(584, 4, 4, '/', '2018-03-27 09:17:10', NULL, NULL, NULL),
(585, 4, 4, '/', '2018-03-27 09:17:11', NULL, NULL, NULL),
(586, 4, 4, '/', '2018-03-27 09:17:14', NULL, NULL, NULL),
(587, 4, 4, '/admin', '2018-03-27 09:17:15', NULL, NULL, NULL),
(588, 4, 4, '/admin', '2018-03-27 09:17:18', NULL, NULL, NULL),
(589, 4, 4, '/admin-routes', '2018-03-27 09:17:20', NULL, NULL, NULL),
(590, 4, 4, '/admin-routes', '2018-03-27 09:17:58', NULL, NULL, NULL),
(591, 4, 4, '/news', '2018-03-27 09:18:02', NULL, NULL, NULL),
(592, 4, 4, '/company', '2018-03-27 09:18:05', NULL, NULL, NULL),
(593, 4, 4, '/company', '2018-03-27 09:18:05', NULL, NULL, NULL),
(594, 4, 4, '/company', '2018-03-27 09:18:08', NULL, NULL, NULL),
(595, 4, 4, '/company', '2018-03-27 09:18:08', NULL, NULL, NULL),
(596, 4, 4, '/news', '2018-03-27 09:18:13', NULL, NULL, NULL),
(597, 4, 4, '/news', '2018-03-27 09:18:21', NULL, NULL, NULL),
(598, 4, 4, '/news', '2018-03-27 09:18:28', NULL, NULL, NULL),
(599, 4, 4, '/news', '2018-03-27 09:19:10', NULL, NULL, NULL),
(600, 4, 4, '/company', '2018-03-27 09:19:12', NULL, NULL, NULL),
(601, 4, 4, '/company', '2018-03-27 09:19:12', NULL, NULL, NULL),
(602, 4, 4, '/info', '2018-03-27 09:19:13', NULL, NULL, NULL),
(603, 4, 4, '/info', '2018-03-27 09:19:13', NULL, NULL, NULL),
(604, 4, 4, '/company', '2018-03-27 09:19:17', NULL, NULL, NULL),
(605, 4, 4, '/company', '2018-03-27 09:19:17', NULL, NULL, NULL),
(606, 4, 4, '/company', '2018-03-27 09:19:18', NULL, NULL, NULL),
(607, 4, 4, '/company', '2018-03-27 09:19:19', NULL, NULL, NULL),
(608, 4, 4, '/news', '2018-03-27 09:19:20', NULL, NULL, NULL),
(609, 4, 4, '/news', '2018-03-27 09:19:25', NULL, NULL, NULL),
(610, 4, 4, '/news', '2018-03-27 09:19:26', NULL, NULL, NULL),
(611, 4, 4, '/news', '2018-03-27 09:19:29', NULL, NULL, NULL),
(612, 4, 4, '/news', '2018-03-27 09:19:41', NULL, NULL, NULL),
(613, 4, 4, '/news', '2018-03-27 09:20:47', NULL, NULL, NULL),
(614, 4, 4, '/news', '2018-03-27 09:20:53', NULL, NULL, NULL),
(615, 4, 4, '/news', '2018-03-27 09:21:25', NULL, NULL, NULL),
(616, 4, 4, '/news', '2018-03-27 09:22:03', NULL, NULL, NULL),
(617, 4, 4, '/company', '2018-03-27 09:22:05', NULL, NULL, NULL),
(618, 4, 4, '/company', '2018-03-27 09:22:05', NULL, NULL, NULL),
(619, 4, 4, '/company', '2018-03-27 09:22:07', NULL, NULL, NULL),
(620, 4, 4, '/company', '2018-03-27 09:22:07', NULL, NULL, NULL),
(621, 4, 4, '/company-history', '2018-03-27 09:22:09', NULL, NULL, NULL),
(622, 4, 4, '/admin', '2018-03-27 09:22:20', NULL, NULL, NULL),
(623, 4, 4, '/admin', '2018-03-27 09:22:25', NULL, NULL, NULL),
(624, 4, 4, '/admin', '2018-03-27 09:22:27', NULL, NULL, NULL),
(625, 4, 4, '/admin-routes', '2018-03-27 09:22:28', NULL, NULL, NULL),
(626, 4, 4, '/admin-routes', '2018-03-27 09:22:47', NULL, NULL, NULL),
(627, 4, 4, '/admin-routes', '2018-03-27 09:23:19', NULL, NULL, NULL),
(628, 4, 4, '/admin-routes', '2018-03-27 09:23:54', NULL, NULL, NULL),
(629, 4, 4, '/admin-routes', '2018-03-27 09:24:19', NULL, NULL, NULL),
(630, 4, 4, '/admin-routes', '2018-03-27 09:24:38', NULL, NULL, NULL),
(631, 4, 4, '/admin-routes', '2018-03-27 09:25:14', NULL, NULL, NULL),
(632, 4, 4, '/admin-routes', '2018-03-27 09:25:30', NULL, NULL, NULL),
(633, 4, 4, '/company', '2018-03-27 09:25:56', NULL, NULL, NULL),
(634, 4, 4, '/company', '2018-03-27 09:25:57', NULL, NULL, NULL),
(635, 4, 4, '/company', '2018-03-27 09:25:58', NULL, NULL, NULL),
(636, 4, 4, '/company', '2018-03-27 09:25:58', NULL, NULL, NULL),
(637, 4, 4, '/info', '2018-03-27 09:26:04', NULL, NULL, NULL),
(638, 4, 4, '/info', '2018-03-27 09:26:04', NULL, NULL, NULL),
(639, 4, 4, '/info', '2018-03-27 09:26:10', NULL, NULL, NULL),
(640, 4, 4, '/info', '2018-03-27 09:26:10', NULL, NULL, NULL),
(641, 4, 4, '/admin-routes', '2018-03-27 09:26:25', NULL, NULL, NULL),
(642, 4, 4, '/admin-routes', '2018-03-27 09:26:31', NULL, NULL, NULL),
(643, 4, 4, '/admin-routes', '2018-03-27 09:27:09', NULL, NULL, NULL),
(644, 4, 4, '/admin-routes', '2018-03-27 09:27:40', NULL, NULL, NULL),
(645, 4, 4, '/admin-routes', '2018-03-27 09:28:35', NULL, NULL, NULL),
(646, 4, 4, '/admin-routes', '2018-03-27 09:28:54', NULL, NULL, NULL),
(647, 4, 4, '/company-history', '2018-03-27 09:29:07', NULL, NULL, NULL),
(648, 4, 4, '/company-history', '2018-03-27 09:29:09', NULL, NULL, NULL),
(649, 4, 4, '/admin-routes', '2018-03-27 09:29:18', NULL, NULL, NULL),
(650, 4, 4, '/admin-routes', '2018-03-27 09:29:35', NULL, NULL, NULL),
(651, 4, 4, '/admin-routes', '2018-03-27 09:29:41', NULL, NULL, NULL),
(652, 4, 4, '/admin-routes', '2018-03-27 09:29:47', NULL, NULL, NULL),
(653, 4, 4, '/admin-routes', '2018-03-27 09:29:54', NULL, NULL, NULL),
(654, 4, 4, '/admin-routes', '2018-03-27 09:29:58', NULL, NULL, NULL),
(655, 4, 4, '/admin-routes', '2018-03-27 09:30:05', NULL, NULL, NULL),
(656, 4, 4, '/admin-routes', '2018-03-27 09:30:32', NULL, NULL, NULL),
(657, 4, 4, '/admin-routes', '2018-03-27 09:30:49', NULL, NULL, NULL),
(658, 4, 4, '/admin-routes', '2018-03-27 09:33:50', NULL, NULL, NULL),
(659, 4, 4, '/vacansies', '2018-03-27 09:33:53', NULL, NULL, NULL),
(660, 4, 4, '/admin-globals', '2018-03-27 09:33:56', NULL, NULL, NULL),
(661, 4, 4, '/policy', '2018-03-27 09:34:01', NULL, NULL, NULL),
(662, 4, 4, '/company', '2018-03-27 09:34:03', NULL, NULL, NULL),
(663, 4, 4, '/company', '2018-03-27 09:34:03', NULL, NULL, NULL),
(664, 4, 4, '/promotions-and-offers', '2018-03-27 09:34:08', NULL, NULL, NULL),
(665, 4, 4, '/info', '2018-03-27 09:36:26', NULL, NULL, NULL),
(666, 4, 4, '/info', '2018-03-27 09:36:26', NULL, NULL, NULL),
(667, 4, 4, '/info', '2018-03-27 09:36:36', NULL, NULL, NULL),
(668, 4, 4, '/info', '2018-03-27 09:36:36', NULL, NULL, NULL),
(669, 4, 4, '/info', '2018-03-27 09:36:51', NULL, NULL, NULL),
(670, 4, 4, '/info', '2018-03-27 09:36:51', NULL, NULL, NULL),
(671, 4, 4, '/info', '2018-03-27 09:36:53', NULL, NULL, NULL),
(672, 4, 4, '/info', '2018-03-27 09:36:53', NULL, NULL, NULL),
(673, 4, 4, '/', '2018-03-27 09:36:53', NULL, NULL, NULL),
(674, 4, 4, '/', '2018-03-27 09:36:54', NULL, NULL, NULL),
(675, 4, 4, '/', '2018-03-27 09:36:55', NULL, NULL, NULL),
(676, 4, 4, '/', '2018-03-27 09:40:07', NULL, NULL, NULL),
(677, 4, 4, '/', '2018-03-27 09:40:40', NULL, NULL, NULL),
(678, 4, 4, '/', '2018-03-27 09:45:35', NULL, NULL, NULL),
(679, 4, 4, '/', '2018-03-27 09:46:15', NULL, NULL, NULL),
(680, 4, 4, '/', '2018-03-27 09:46:42', NULL, NULL, NULL),
(681, 4, 4, '/', '2018-03-27 09:47:13', NULL, NULL, NULL),
(682, 4, 4, '/', '2018-03-27 09:47:33', NULL, NULL, NULL),
(683, 4, 4, '/', '2018-03-27 09:47:42', NULL, NULL, NULL),
(684, 4, 4, '/', '2018-03-27 09:47:44', NULL, NULL, NULL),
(685, 4, 4, '/', '2018-03-27 09:47:54', NULL, NULL, NULL),
(686, 4, 4, '/', '2018-03-27 09:47:56', NULL, NULL, NULL),
(687, 4, 4, '/', '2018-03-27 09:47:58', NULL, NULL, NULL),
(688, 4, 4, '/', '2018-03-27 09:48:00', NULL, NULL, NULL),
(689, 4, 4, '/', '2018-03-27 09:48:14', NULL, NULL, NULL),
(690, 4, 4, '/', '2018-03-27 09:48:17', NULL, NULL, NULL),
(691, 4, 4, '/', '2018-03-27 09:48:22', NULL, NULL, NULL),
(692, 4, 4, '/', '2018-03-27 09:48:30', NULL, NULL, NULL),
(693, 4, 4, '/', '2018-03-27 09:48:34', NULL, NULL, NULL),
(694, 4, 4, '/', '2018-03-27 09:48:42', NULL, NULL, NULL),
(695, 4, 4, '/', '2018-03-27 09:49:20', NULL, NULL, NULL),
(696, 4, 4, '/', '2018-03-27 09:49:28', NULL, NULL, NULL),
(697, 4, 4, '/', '2018-03-27 09:49:35', NULL, NULL, NULL),
(698, 4, 4, '/', '2018-03-27 09:50:09', NULL, NULL, NULL),
(699, 4, 4, '/', '2018-03-27 09:50:22', NULL, NULL, NULL),
(700, 4, 4, '/', '2018-03-27 09:50:47', NULL, NULL, NULL),
(701, 4, 4, '/', '2018-03-27 09:50:57', NULL, NULL, NULL),
(702, 4, 4, '/', '2018-03-27 09:51:01', NULL, NULL, NULL),
(703, 4, 4, '/', '2018-03-27 09:51:50', NULL, NULL, NULL),
(704, 4, 4, '/', '2018-03-27 09:51:53', NULL, NULL, NULL),
(705, 4, 4, '/', '2018-03-27 09:51:54', NULL, NULL, NULL),
(706, 4, 4, '/', '2018-03-27 09:52:59', NULL, NULL, NULL),
(707, 4, 4, '/', '2018-03-27 09:53:02', NULL, NULL, NULL),
(708, 4, 4, '/', '2018-03-27 09:53:11', NULL, NULL, NULL),
(709, 4, 4, '/', '2018-03-27 09:53:55', NULL, NULL, NULL),
(710, 4, 4, '/', '2018-03-27 09:54:17', NULL, NULL, NULL),
(711, 4, 4, '/', '2018-03-27 09:54:23', NULL, NULL, NULL),
(712, 4, 4, '/', '2018-03-27 09:54:25', NULL, NULL, NULL),
(713, 4, 4, '/', '2018-03-27 09:54:26', NULL, NULL, NULL),
(714, 4, 4, '/', '2018-03-27 09:54:28', NULL, NULL, NULL),
(715, 4, 4, '/', '2018-03-27 09:54:30', NULL, NULL, NULL),
(716, 4, 4, '/', '2018-03-27 09:54:32', NULL, NULL, NULL),
(717, 4, 4, '/', '2018-03-27 09:54:34', NULL, NULL, NULL),
(718, 4, 4, '/', '2018-03-27 09:54:35', NULL, NULL, NULL),
(719, 4, 4, '/', '2018-03-27 09:54:36', NULL, NULL, NULL),
(720, 4, 4, '/', '2018-03-27 09:54:40', NULL, NULL, NULL),
(721, 4, 4, '/', '2018-03-27 09:55:46', NULL, NULL, NULL),
(722, 4, 4, '/', '2018-03-27 09:55:59', NULL, NULL, NULL),
(723, 4, 4, '/', '2018-03-27 09:56:03', NULL, NULL, NULL),
(724, 4, 4, '/', '2018-03-27 09:56:05', NULL, NULL, NULL),
(725, 4, 4, '/', '2018-03-27 09:56:07', NULL, NULL, NULL),
(726, 4, 4, '/', '2018-03-27 09:56:08', NULL, NULL, NULL),
(727, 4, 4, '/', '2018-03-27 09:56:09', NULL, NULL, NULL),
(728, 4, 4, '/', '2018-03-27 09:56:42', NULL, NULL, NULL),
(729, 4, 4, '/', '2018-03-27 09:57:09', NULL, NULL, NULL),
(730, 4, 4, '/', '2018-03-27 09:57:34', NULL, NULL, NULL),
(731, 4, 4, '/', '2018-03-27 09:58:35', NULL, NULL, NULL),
(732, 4, 4, '/', '2018-03-27 09:58:38', NULL, NULL, NULL),
(733, 4, 4, '/', '2018-03-27 09:58:39', NULL, NULL, NULL),
(734, 4, 4, '/admin', '2018-03-27 09:58:56', NULL, NULL, NULL),
(735, 4, 4, '/admin', '2018-03-27 09:58:58', NULL, NULL, NULL),
(736, 4, 4, '/admin', '2018-03-27 09:58:59', NULL, NULL, NULL),
(737, 4, 4, '/admin', '2018-03-27 09:59:00', NULL, NULL, NULL),
(738, 4, 4, '/company', '2018-03-27 09:59:02', NULL, NULL, NULL),
(739, 4, 4, '/company', '2018-03-27 09:59:02', NULL, NULL, NULL),
(740, 4, 4, '/info', '2018-03-27 09:59:04', NULL, NULL, NULL),
(741, 4, 4, '/info', '2018-03-27 09:59:04', NULL, NULL, NULL),
(742, 4, 4, '/company', '2018-03-27 11:07:33', NULL, NULL, NULL),
(743, 4, 4, '/company', '2018-03-27 11:07:33', NULL, NULL, NULL),
(744, 4, 4, '/company', '2018-03-27 11:20:07', NULL, NULL, NULL),
(745, 4, 4, '/company', '2018-03-27 11:20:07', NULL, NULL, NULL),
(746, 4, 4, '/company-shops', '2018-03-27 11:20:12', NULL, NULL, NULL),
(747, 4, 4, '/company-shops', '2018-03-27 11:20:14', NULL, NULL, NULL),
(748, 4, 4, '/company-shops', '2018-03-27 11:20:36', NULL, NULL, NULL),
(749, 4, 4, '/company-shops', '2018-03-27 11:20:39', NULL, NULL, NULL),
(750, 4, 4, '/company-shops', '2018-03-27 11:20:40', NULL, NULL, NULL),
(751, 4, 4, '/company-shops', '2018-03-27 11:21:08', NULL, NULL, NULL),
(752, 4, 4, '/company-shops', '2018-03-27 11:21:09', NULL, NULL, NULL),
(753, 4, 4, '/company-shops', '2018-03-27 11:21:14', NULL, NULL, NULL),
(754, 4, 4, '/company-shops', '2018-03-27 11:21:21', NULL, NULL, NULL),
(755, 4, 4, '/company-shops', '2018-03-27 11:21:49', NULL, NULL, NULL),
(756, 4, 4, '/company-shops', '2018-03-27 11:21:54', NULL, NULL, NULL),
(757, 4, 4, '/company-shops', '2018-03-27 11:22:00', NULL, NULL, NULL),
(758, 4, 4, '/company-shops', '2018-03-27 11:22:29', NULL, NULL, NULL),
(759, 4, 4, '/company-shops', '2018-03-27 11:22:34', NULL, NULL, NULL),
(760, 4, 4, '/company-shops', '2018-03-27 11:22:37', NULL, NULL, NULL),
(761, 4, 4, '/company', '2018-03-27 11:22:38', NULL, NULL, NULL),
(762, 4, 4, '/company', '2018-03-27 11:22:39', NULL, NULL, NULL),
(763, 4, 4, '/company', '2018-03-27 11:22:42', NULL, NULL, NULL),
(764, 4, 4, '/company', '2018-03-27 11:22:42', NULL, NULL, NULL),
(765, 4, 4, '/company', '2018-03-27 11:26:52', NULL, NULL, NULL),
(766, 4, 4, '/company', '2018-03-27 11:26:52', NULL, NULL, NULL),
(767, 4, 4, '/company', '2018-03-27 11:26:54', NULL, NULL, NULL),
(768, 4, 4, '/company', '2018-03-27 11:26:55', NULL, NULL, NULL),
(769, 4, 4, '/company-shops', '2018-03-27 11:27:05', NULL, NULL, NULL),
(770, 4, 4, '/news', '2018-03-27 11:28:50', NULL, NULL, NULL),
(771, 4, 4, '/news', '2018-03-27 11:33:55', NULL, NULL, NULL),
(772, 4, 4, '/news', '2018-03-27 11:34:00', NULL, NULL, NULL),
(773, 4, 4, '/news', '2018-03-27 11:34:45', NULL, NULL, NULL),
(774, 4, 4, '/news', '2018-03-27 11:34:50', NULL, NULL, NULL),
(775, 4, 4, '/news', '2018-03-27 11:35:27', NULL, NULL, NULL),
(776, 4, 4, '/company', '2018-03-27 11:35:31', NULL, NULL, NULL),
(777, 4, 4, '/company', '2018-03-27 11:35:31', NULL, NULL, NULL),
(778, 4, 4, '/news', '2018-03-27 11:36:04', NULL, NULL, NULL),
(779, 4, 4, '/company', '2018-03-27 11:36:54', NULL, NULL, NULL),
(780, 4, 4, '/company', '2018-03-27 11:36:54', NULL, NULL, NULL),
(781, 4, 4, '/company', '2018-03-27 11:37:00', NULL, NULL, NULL),
(782, 4, 4, '/company', '2018-03-27 11:37:00', NULL, NULL, NULL),
(783, 4, 4, '/company', '2018-03-27 11:37:15', NULL, NULL, NULL),
(784, 4, 4, '/company', '2018-03-27 11:37:16', NULL, NULL, NULL),
(785, 4, 4, '/news', '2018-03-27 11:41:00', NULL, NULL, NULL),
(786, 4, 4, '/news', '2018-03-27 11:41:04', NULL, NULL, NULL),
(787, 4, 4, '/company', '2018-03-27 11:41:05', NULL, NULL, NULL),
(788, 4, 4, '/company', '2018-03-27 11:41:05', NULL, NULL, NULL),
(789, 4, 4, '/company', '2018-03-27 11:41:24', NULL, NULL, NULL),
(790, 4, 4, '/company', '2018-03-27 11:41:25', NULL, NULL, NULL),
(791, 4, 4, '/company', '2018-03-27 11:41:46', NULL, NULL, NULL);
INSERT INTO `views` (`id`, `visit_id`, `visitor_id`, `path`, `created`, `updated`, `activated`, `closed`) VALUES
(792, 4, 4, '/company', '2018-03-27 11:41:47', NULL, NULL, NULL),
(793, 4, 4, '/contacts', '2018-03-27 11:42:05', NULL, NULL, NULL),
(794, 4, 4, '/company', '2018-03-27 11:42:10', NULL, NULL, NULL),
(795, 4, 4, '/company', '2018-03-27 11:42:10', NULL, NULL, NULL),
(796, 4, 4, '/company', '2018-03-27 11:43:18', NULL, NULL, NULL),
(797, 4, 4, '/company', '2018-03-27 11:43:19', NULL, NULL, NULL),
(798, 4, 4, '/contacts', '2018-03-27 11:43:22', NULL, NULL, NULL),
(799, 4, 4, '/contacts', '2018-03-27 11:43:25', NULL, NULL, NULL),
(800, 4, 4, '/contacts', '2018-03-27 11:43:26', NULL, NULL, NULL),
(801, 4, 4, '/contacts', '2018-03-27 11:44:13', NULL, NULL, NULL),
(802, 4, 4, '/contacts', '2018-03-27 11:48:09', NULL, NULL, NULL),
(803, 4, 4, '/contacts', '2018-03-27 11:48:15', NULL, NULL, NULL),
(804, 4, 4, '/contacts', '2018-03-27 11:48:29', NULL, NULL, NULL),
(805, 4, 4, '/contacts', '2018-03-27 11:48:35', NULL, NULL, NULL),
(806, 4, 4, '/contacts', '2018-03-27 11:59:29', NULL, NULL, NULL),
(807, 4, 4, '/contacts', '2018-03-27 11:59:32', NULL, NULL, NULL),
(808, 4, 4, '/contacts', '2018-03-27 12:00:15', NULL, NULL, NULL),
(809, 4, 4, '/contacts', '2018-03-27 12:00:20', NULL, NULL, NULL),
(810, 4, 4, '/contacts', '2018-03-27 12:01:39', NULL, NULL, NULL),
(811, 4, 4, '/contacts', '2018-03-27 12:01:42', NULL, NULL, NULL),
(812, 4, 4, '/contacts', '2018-03-27 12:03:50', NULL, NULL, NULL),
(813, 4, 4, '/contacts', '2018-03-27 12:03:51', NULL, NULL, NULL),
(814, 4, 4, '/contacts', '2018-03-27 12:03:54', NULL, NULL, NULL),
(815, 4, 4, '/contacts', '2018-03-27 12:03:56', NULL, NULL, NULL),
(816, 4, 4, '/contacts', '2018-03-27 12:05:55', NULL, NULL, NULL),
(817, 4, 4, '/contacts', '2018-03-27 12:05:58', NULL, NULL, NULL),
(818, 4, 4, '/contacts', '2018-03-27 12:07:46', NULL, NULL, NULL),
(819, 4, 4, '/contacts', '2018-03-27 12:07:48', NULL, NULL, NULL),
(820, 4, 4, '/contacts', '2018-03-27 12:08:45', NULL, NULL, NULL),
(821, 4, 4, '/contacts', '2018-03-27 12:08:47', NULL, NULL, NULL),
(822, 4, 4, '/contacts', '2018-03-27 12:09:03', NULL, NULL, NULL),
(823, 4, 4, '/contacts', '2018-03-27 12:09:12', NULL, NULL, NULL),
(824, 4, 4, '/contacts', '2018-03-27 12:09:51', NULL, NULL, NULL),
(825, 4, 4, '/contacts', '2018-03-27 12:09:54', NULL, NULL, NULL),
(826, 4, 4, '/contacts', '2018-03-27 12:12:00', NULL, NULL, NULL),
(827, 4, 4, '/contacts', '2018-03-27 12:12:03', NULL, NULL, NULL),
(828, 4, 4, '/contacts', '2018-03-27 12:12:33', NULL, NULL, NULL),
(829, 4, 4, '/contacts', '2018-03-27 12:12:35', NULL, NULL, NULL),
(830, 4, 4, '/contacts', '2018-03-27 12:12:51', NULL, NULL, NULL),
(831, 4, 4, '/company', '2018-03-27 12:13:01', NULL, NULL, NULL),
(832, 4, 4, '/company', '2018-03-27 12:13:02', NULL, NULL, NULL),
(833, 4, 4, '/company', '2018-03-27 12:14:41', NULL, NULL, NULL),
(834, 4, 4, '/company', '2018-03-27 12:14:42', NULL, NULL, NULL),
(835, 4, 4, '/company', '2018-03-27 12:14:51', NULL, NULL, NULL),
(836, 4, 4, '/company', '2018-03-27 12:14:52', NULL, NULL, NULL),
(837, 4, 4, '/news', '2018-03-27 12:14:53', NULL, NULL, NULL),
(838, 4, 4, '/company-shops', '2018-03-27 12:14:58', NULL, NULL, NULL),
(839, 4, 4, '/company-shops', '2018-03-27 12:15:00', NULL, NULL, NULL),
(840, 4, 4, '/company', '2018-03-27 12:15:29', NULL, NULL, NULL),
(841, 4, 4, '/company', '2018-03-27 12:15:29', NULL, NULL, NULL),
(842, 4, 4, '/contacts', '2018-03-27 12:15:33', NULL, NULL, NULL),
(843, 4, 4, '/contacts', '2018-03-27 12:15:36', NULL, NULL, NULL),
(844, 4, 4, '/contacts', '2018-03-27 12:15:39', NULL, NULL, NULL),
(845, 4, 4, '/company-shops', '2018-03-27 12:15:46', NULL, NULL, NULL),
(846, 4, 4, '/shop', '2018-03-27 12:15:48', NULL, NULL, NULL),
(847, 4, 4, '/company', '2018-03-27 12:15:49', NULL, NULL, NULL),
(848, 4, 4, '/company', '2018-03-27 12:15:49', NULL, NULL, NULL),
(849, 4, 4, '/', '2018-03-27 12:15:51', NULL, NULL, NULL),
(850, 4, 4, '/company', '2018-03-27 12:15:52', NULL, NULL, NULL),
(851, 4, 4, '/company', '2018-03-27 12:15:52', NULL, NULL, NULL),
(852, 4, 4, '/company', '2018-03-27 12:15:53', NULL, NULL, NULL),
(853, 4, 4, '/company', '2018-03-27 12:15:53', NULL, NULL, NULL),
(854, 4, 4, '/company', '2018-03-27 12:15:56', NULL, NULL, NULL),
(855, 4, 4, '/company', '2018-03-27 12:15:57', NULL, NULL, NULL),
(856, 4, 4, '/company', '2018-03-27 12:15:57', NULL, NULL, NULL),
(857, 4, 4, '/company', '2018-03-27 12:15:57', NULL, NULL, NULL),
(858, 4, 4, '/admin', '2018-03-27 12:15:58', NULL, NULL, NULL),
(859, 4, 4, '/admin', '2018-03-27 12:16:00', NULL, NULL, NULL),
(860, 4, 4, '/admin-routes', '2018-03-27 12:16:01', NULL, NULL, NULL),
(861, 4, 4, '/company-shops', '2018-03-27 12:16:40', NULL, NULL, NULL),
(862, 4, 4, '/company-shops', '2018-03-27 12:16:42', NULL, NULL, NULL),
(863, 1, 1, '/', '2018-03-27 18:31:04', NULL, NULL, NULL),
(864, 1, 1, '/company', '2018-03-27 18:31:10', NULL, NULL, NULL),
(865, 1, 1, '/company', '2018-03-27 18:31:10', NULL, NULL, NULL),
(866, 1, 1, '/company-reviews', '2018-03-27 18:31:17', NULL, NULL, NULL),
(867, 1, 1, '/company-shops', '2018-03-27 18:31:21', NULL, NULL, NULL),
(868, 1, 1, '/news', '2018-03-27 18:31:24', NULL, NULL, NULL),
(869, 2, 2, '/', '2018-03-28 04:04:35', NULL, NULL, NULL),
(870, 2, 2, '/company', '2018-03-28 04:07:38', NULL, NULL, NULL),
(871, 2, 2, '/company', '2018-03-28 04:07:38', NULL, NULL, NULL),
(872, 2, 2, '/shop', '2018-03-28 04:07:39', NULL, NULL, NULL),
(873, 2, 2, '/info', '2018-03-28 04:07:39', NULL, NULL, NULL),
(874, 2, 2, '/info', '2018-03-28 04:07:40', NULL, NULL, NULL),
(875, 2, 2, '/', '2018-03-28 04:07:41', NULL, NULL, NULL),
(876, 2, 2, '/info', '2018-03-28 04:07:44', NULL, NULL, NULL),
(877, 2, 2, '/info', '2018-03-28 04:07:44', NULL, NULL, NULL),
(878, 2, 2, '/company', '2018-03-28 04:08:03', NULL, NULL, NULL),
(879, 2, 2, '/company', '2018-03-28 04:08:04', NULL, NULL, NULL),
(880, 2, 2, '/', '2018-03-28 04:08:05', NULL, NULL, NULL),
(881, 2, 2, '/info', '2018-03-28 04:08:10', NULL, NULL, NULL),
(882, 2, 2, '/info', '2018-03-28 04:08:10', NULL, NULL, NULL),
(883, 2, 2, '/publications', '2018-03-28 04:08:13', NULL, NULL, NULL),
(884, 2, 2, '/info', '2018-03-28 04:35:58', NULL, NULL, NULL),
(885, 2, 2, '/info', '2018-03-28 04:35:58', NULL, NULL, NULL),
(886, 2, 2, '/info', '2018-03-28 04:36:27', NULL, NULL, NULL),
(887, 2, 2, '/info', '2018-03-28 04:36:27', NULL, NULL, NULL),
(888, 2, 2, '/company', '2018-03-28 04:36:29', NULL, NULL, NULL),
(889, 2, 2, '/company', '2018-03-28 04:36:29', NULL, NULL, NULL),
(890, 2, 2, '/company', '2018-03-28 04:36:35', NULL, NULL, NULL),
(891, 2, 2, '/company', '2018-03-28 04:36:36', NULL, NULL, NULL),
(892, 2, 2, '/company', '2018-03-28 04:36:43', NULL, NULL, NULL),
(893, 2, 2, '/company', '2018-03-28 04:36:43', NULL, NULL, NULL),
(894, 2, 2, '/company-shops', '2018-03-28 04:36:44', NULL, NULL, NULL),
(895, 2, 2, '/contacts', '2018-03-28 04:36:50', NULL, NULL, NULL),
(896, 2, 2, '/contacts', '2018-03-28 04:36:53', NULL, NULL, NULL),
(897, 2, 2, '/contacts', '2018-03-28 04:37:20', NULL, NULL, NULL),
(898, 2, 2, '/contacts', '2018-03-28 04:37:55', NULL, NULL, NULL),
(899, 2, 2, '/contacts', '2018-03-28 04:38:18', NULL, NULL, NULL),
(900, 2, 2, '/contacts', '2018-03-28 04:38:33', NULL, NULL, NULL),
(901, 2, 2, '/contacts', '2018-03-28 04:40:45', NULL, NULL, NULL),
(902, 2, 2, '/contacts', '2018-03-28 04:40:49', NULL, NULL, NULL),
(903, 2, 2, '/contacts', '2018-03-28 04:41:59', NULL, NULL, NULL),
(904, 2, 2, '/contacts', '2018-03-28 04:42:34', NULL, NULL, NULL),
(905, 2, 2, '/contacts', '2018-03-28 04:42:42', NULL, NULL, NULL),
(906, 4, 4, '/', '2018-03-28 04:43:12', NULL, NULL, NULL),
(907, 2, 2, '/contacts', '2018-03-28 04:43:15', NULL, NULL, NULL),
(908, 2, 2, '/contacts', '2018-03-28 04:43:17', NULL, NULL, NULL),
(909, 2, 2, '/company', '2018-03-28 04:43:18', NULL, NULL, NULL),
(910, 2, 2, '/company', '2018-03-28 04:43:18', NULL, NULL, NULL),
(911, 4, 4, '/company', '2018-03-28 04:43:20', NULL, NULL, NULL),
(912, 2, 2, '/company-shops', '2018-03-28 04:43:20', NULL, NULL, NULL),
(913, 4, 4, '/company', '2018-03-28 04:43:20', NULL, NULL, NULL),
(914, 2, 2, '/company-shops', '2018-03-28 04:43:23', NULL, NULL, NULL),
(915, 2, 2, '/company-shops', '2018-03-28 04:43:29', NULL, NULL, NULL),
(916, 2, 2, '/company-shops', '2018-03-28 04:43:30', NULL, NULL, NULL),
(917, 4, 4, '/company', '2018-03-28 04:43:34', NULL, NULL, NULL),
(918, 4, 4, '/company', '2018-03-28 04:43:34', NULL, NULL, NULL),
(919, 2, 2, '/company-shops', '2018-03-28 04:43:43', NULL, NULL, NULL),
(920, 2, 2, '/company-shops', '2018-03-28 04:43:47', NULL, NULL, NULL),
(921, 2, 2, '/company-shops', '2018-03-28 04:45:09', NULL, NULL, NULL),
(922, 2, 2, '/company', '2018-03-28 04:45:11', NULL, NULL, NULL),
(923, 2, 2, '/company', '2018-03-28 04:45:12', NULL, NULL, NULL),
(924, 2, 2, '/news', '2018-03-28 04:45:16', NULL, NULL, NULL),
(925, 2, 2, '/news', '2018-03-28 04:45:18', NULL, NULL, NULL),
(926, 2, 2, '/news', '2018-03-28 04:46:16', NULL, NULL, NULL),
(927, 2, 2, '/company', '2018-03-28 04:46:18', NULL, NULL, NULL),
(928, 2, 2, '/company', '2018-03-28 04:46:18', NULL, NULL, NULL),
(929, 2, 2, '/contacts', '2018-03-28 04:46:26', NULL, NULL, NULL),
(930, 2, 2, '/contacts', '2018-03-28 04:46:40', NULL, NULL, NULL),
(931, 2, 2, '/contacts', '2018-03-28 04:46:42', NULL, NULL, NULL),
(932, 2, 2, '/contacts', '2018-03-28 04:46:48', NULL, NULL, NULL),
(933, 2, 2, '/contacts', '2018-03-28 04:46:54', NULL, NULL, NULL),
(934, 2, 2, '/contacts', '2018-03-28 04:52:24', NULL, NULL, NULL),
(935, 4, 4, '/company', '2018-03-28 04:54:10', NULL, NULL, NULL),
(936, 4, 4, '/company', '2018-03-28 04:54:10', NULL, NULL, NULL),
(937, 4, 4, '/company', '2018-03-28 04:56:32', NULL, NULL, NULL),
(938, 4, 4, '/company', '2018-03-28 04:56:33', NULL, NULL, NULL),
(939, 4, 4, '/company', '2018-03-28 04:57:16', NULL, NULL, NULL),
(940, 4, 4, '/company', '2018-03-28 04:57:17', NULL, NULL, NULL),
(941, 4, 4, '/company', '2018-03-28 04:57:21', NULL, NULL, NULL),
(942, 4, 4, '/company', '2018-03-28 04:57:21', NULL, NULL, NULL),
(943, 4, 4, '/company', '2018-03-28 05:08:25', NULL, NULL, NULL),
(944, 4, 4, '/company', '2018-03-28 05:08:25', NULL, NULL, NULL),
(945, 4, 4, '/company', '2018-03-28 05:08:51', NULL, NULL, NULL),
(946, 4, 4, '/company', '2018-03-28 05:08:51', NULL, NULL, NULL),
(947, 4, 4, '/', '2018-03-28 05:37:49', NULL, NULL, NULL),
(948, 4, 4, '/', '2018-03-28 05:37:56', NULL, NULL, NULL),
(949, 4, 4, '/company', '2018-03-28 05:37:58', NULL, NULL, NULL),
(950, 4, 4, '/company', '2018-03-28 05:37:58', NULL, NULL, NULL),
(951, 4, 4, '/company', '2018-03-28 05:38:06', NULL, NULL, NULL),
(952, 4, 4, '/company', '2018-03-28 05:38:06', NULL, NULL, NULL),
(953, 4, 4, '/company', '2018-03-28 06:07:14', NULL, NULL, NULL),
(954, 4, 4, '/company', '2018-03-28 06:07:14', NULL, NULL, NULL),
(955, 4, 4, '/company', '2018-03-28 06:07:23', NULL, NULL, NULL),
(956, 4, 4, '/company', '2018-03-28 06:07:24', NULL, NULL, NULL),
(957, 2, 2, '/contacts', '2018-03-28 06:29:58', NULL, NULL, NULL),
(958, 4, 4, '/company', '2018-03-28 06:38:11', NULL, NULL, NULL),
(959, 4, 4, '/company', '2018-03-28 06:38:12', NULL, NULL, NULL),
(960, 4, 4, '/company', '2018-03-28 06:38:24', NULL, NULL, NULL),
(961, 4, 4, '/company', '2018-03-28 06:38:24', NULL, NULL, NULL),
(962, 4, 4, '/shop', '2018-03-28 06:38:26', NULL, NULL, NULL),
(963, 4, 4, '/info', '2018-03-28 06:38:27', NULL, NULL, NULL),
(964, 4, 4, '/info', '2018-03-28 06:38:27', NULL, NULL, NULL),
(965, 4, 4, '/info-questions', '2018-03-28 06:38:30', NULL, NULL, NULL),
(966, 4, 4, '/info', '2018-03-28 06:38:34', NULL, NULL, NULL),
(967, 4, 4, '/info', '2018-03-28 06:38:34', NULL, NULL, NULL),
(968, 4, 4, '/info', '2018-03-28 06:51:29', NULL, NULL, NULL),
(969, 4, 4, '/info', '2018-03-28 06:51:30', NULL, NULL, NULL),
(970, 4, 4, '/company', '2018-03-28 06:51:31', NULL, NULL, NULL),
(971, 4, 4, '/company', '2018-03-28 06:51:31', NULL, NULL, NULL),
(972, 4, 4, '/company', '2018-03-28 06:52:03', NULL, NULL, NULL),
(973, 4, 4, '/company', '2018-03-28 06:52:04', NULL, NULL, NULL),
(974, 4, 4, '/contacts', '2018-03-28 06:53:57', NULL, NULL, NULL),
(975, 4, 4, '/contacts', '2018-03-28 06:54:00', NULL, NULL, NULL),
(976, 4, 4, '/contacts', '2018-03-28 06:56:58', NULL, NULL, NULL),
(977, 4, 4, '/contacts', '2018-03-28 06:57:02', NULL, NULL, NULL),
(978, 4, 4, '/contacts', '2018-03-28 06:57:46', NULL, NULL, NULL),
(979, 4, 4, '/contacts', '2018-03-28 06:57:53', NULL, NULL, NULL),
(980, 4, 4, '/contacts', '2018-03-28 06:58:20', NULL, NULL, NULL),
(981, 4, 4, '/contacts', '2018-03-28 06:58:21', NULL, NULL, NULL),
(982, 4, 4, '/contacts', '2018-03-28 07:00:05', NULL, NULL, NULL),
(983, 4, 4, '/company', '2018-03-28 07:00:07', NULL, NULL, NULL),
(984, 4, 4, '/', '2018-03-28 07:00:07', NULL, NULL, NULL),
(985, 4, 4, '/company', '2018-03-28 07:00:08', NULL, NULL, NULL),
(986, 4, 4, '/info', '2018-03-28 07:00:09', NULL, NULL, NULL),
(987, 4, 4, '/info', '2018-03-28 07:00:10', NULL, NULL, NULL),
(988, 4, 4, '/', '2018-03-28 07:00:26', NULL, NULL, NULL),
(989, 4, 4, '/', '2018-03-28 07:00:34', NULL, NULL, NULL),
(990, 4, 4, '/info', '2018-03-28 07:00:41', NULL, NULL, NULL),
(991, 4, 4, '/info', '2018-03-28 07:00:41', NULL, NULL, NULL),
(992, 4, 4, '/info', '2018-03-28 07:00:50', NULL, NULL, NULL),
(993, 4, 4, '/info', '2018-03-28 07:00:50', NULL, NULL, NULL),
(994, 4, 4, '/company', '2018-03-28 07:00:51', NULL, NULL, NULL),
(995, 4, 4, '/company', '2018-03-28 07:00:51', NULL, NULL, NULL),
(996, 4, 4, '/company', '2018-03-28 07:00:52', NULL, NULL, NULL),
(997, 4, 4, '/company', '2018-03-28 07:00:52', NULL, NULL, NULL),
(998, 2, 2, '/contacts', '2018-03-28 07:01:31', NULL, NULL, NULL),
(999, 2, 2, '/company', '2018-03-28 07:01:31', NULL, NULL, NULL),
(1000, 2, 2, '/company', '2018-03-28 07:01:32', NULL, NULL, NULL),
(1001, 2, 2, '/news', '2018-03-28 07:01:38', NULL, NULL, NULL),
(1002, 2, 2, '/company', '2018-03-28 07:01:41', NULL, NULL, NULL),
(1003, 2, 2, '/company', '2018-03-28 07:01:41', NULL, NULL, NULL),
(1004, 4, 4, '/company', '2018-03-28 07:01:43', NULL, NULL, NULL),
(1005, 4, 4, '/company', '2018-03-28 07:01:44', NULL, NULL, NULL),
(1006, 4, 4, '/company-shops', '2018-03-28 07:01:46', NULL, NULL, NULL),
(1007, 4, 4, '/company-shops', '2018-03-28 07:01:49', NULL, NULL, NULL),
(1008, 4, 4, '/company-shops', '2018-03-28 07:01:54', NULL, NULL, NULL),
(1009, 2, 2, '/info', '2018-03-28 07:02:58', NULL, NULL, NULL),
(1010, 2, 2, '/info', '2018-03-28 07:02:58', NULL, NULL, NULL),
(1011, 2, 2, '/legal-documents', '2018-03-28 07:03:08', NULL, NULL, NULL),
(1012, 4, 4, '/company-shops', '2018-03-28 07:07:28', NULL, NULL, NULL),
(1013, 4, 4, '/company-shops', '2018-03-28 07:07:31', NULL, NULL, NULL),
(1014, 4, 4, '/company-shops', '2018-03-28 07:07:36', NULL, NULL, NULL),
(1015, 4, 4, '/company-shops', '2018-03-28 07:07:54', NULL, NULL, NULL),
(1016, 4, 4, '/company-shops', '2018-03-28 07:07:56', NULL, NULL, NULL),
(1017, 2, 2, '/info', '2018-03-28 07:08:40', NULL, NULL, NULL),
(1018, 2, 2, '/info', '2018-03-28 07:08:41', NULL, NULL, NULL),
(1019, 2, 2, '/payment-and-delivery', '2018-03-28 07:08:44', NULL, NULL, NULL),
(1020, 2, 2, '/shop', '2018-03-28 07:08:47', NULL, NULL, NULL),
(1021, 2, 2, '/', '2018-03-28 07:08:47', NULL, NULL, NULL),
(1022, 2, 2, '/company', '2018-03-28 07:08:48', NULL, NULL, NULL),
(1023, 2, 2, '/company', '2018-03-28 07:08:49', NULL, NULL, NULL),
(1024, 4, 4, '/company-shops', '2018-03-28 07:08:53', NULL, NULL, NULL),
(1025, 4, 4, '/company-shops', '2018-03-28 07:08:55', NULL, NULL, NULL),
(1026, 4, 4, '/company-shops', '2018-03-28 07:09:08', NULL, NULL, NULL),
(1027, 4, 4, '/company-shops', '2018-03-28 07:09:09', NULL, NULL, NULL),
(1028, 4, 4, '/company-shops', '2018-03-28 07:09:18', NULL, NULL, NULL),
(1029, 4, 4, '/company-shops', '2018-03-28 07:09:19', NULL, NULL, NULL),
(1030, 4, 4, '/company-shops', '2018-03-28 07:09:26', NULL, NULL, NULL),
(1031, 4, 4, '/company-shops', '2018-03-28 07:10:26', NULL, NULL, NULL),
(1032, 4, 4, '/company-shops', '2018-03-28 07:10:32', NULL, NULL, NULL),
(1033, 2, 2, '/company', '2018-03-28 07:10:53', NULL, NULL, NULL),
(1034, 2, 2, '/company', '2018-03-28 07:10:53', NULL, NULL, NULL),
(1035, 4, 4, '/company-shops', '2018-03-28 07:11:48', NULL, NULL, NULL),
(1036, 4, 4, '/company-shops', '2018-03-28 07:11:54', NULL, NULL, NULL),
(1037, 4, 4, '/company-shops', '2018-03-28 07:12:12', NULL, NULL, NULL),
(1038, 4, 4, '/company-shops', '2018-03-28 07:12:17', NULL, NULL, NULL),
(1039, 4, 4, '/company-shops', '2018-03-28 07:12:32', NULL, NULL, NULL),
(1040, 4, 4, '/contacts', '2018-03-28 07:14:34', NULL, NULL, NULL),
(1041, 4, 4, '/contacts', '2018-03-28 07:14:54', NULL, NULL, NULL),
(1042, 4, 4, '/contacts', '2018-03-28 07:14:56', NULL, NULL, NULL),
(1043, 4, 4, '/contacts', '2018-03-28 07:18:33', NULL, NULL, NULL),
(1044, 4, 4, '/contacts', '2018-03-28 07:18:37', NULL, NULL, NULL),
(1045, 4, 4, '/contacts', '2018-03-28 07:19:07', NULL, NULL, NULL),
(1046, 4, 4, '/contacts', '2018-03-28 07:19:09', NULL, NULL, NULL),
(1047, 4, 4, '/company', '2018-03-28 07:19:36', NULL, NULL, NULL),
(1048, 4, 4, '/company', '2018-03-28 07:19:37', NULL, NULL, NULL),
(1049, 4, 4, '/company', '2018-03-28 07:19:38', NULL, NULL, NULL),
(1050, 4, 4, '/company', '2018-03-28 07:19:39', NULL, NULL, NULL),
(1051, 4, 4, '/company-shops', '2018-03-28 07:19:42', NULL, NULL, NULL),
(1052, 4, 4, '/company-reviews', '2018-03-28 08:12:27', NULL, NULL, NULL),
(1053, 4, 4, '/company-reviews', '2018-03-28 08:12:29', NULL, NULL, NULL),
(1054, 4, 4, '/company-reviews', '2018-03-28 08:12:30', NULL, NULL, NULL),
(1055, 4, 4, '/company-reviews', '2018-03-28 08:12:34', NULL, NULL, NULL),
(1056, 4, 4, '/company-reviews', '2018-03-28 08:12:40', NULL, NULL, NULL),
(1057, 4, 4, '/company-reviews', '2018-03-28 08:12:44', NULL, NULL, NULL),
(1058, 4, 4, '/company-reviews', '2018-03-28 08:12:54', NULL, NULL, NULL),
(1059, 4, 4, '/company-reviews', '2018-03-28 08:13:00', NULL, NULL, NULL),
(1060, 4, 4, '/company-reviews', '2018-03-28 08:13:05', NULL, NULL, NULL),
(1061, 4, 4, '/', '2018-03-28 08:13:33', NULL, NULL, NULL),
(1062, 4, 4, '/company', '2018-03-28 08:13:35', NULL, NULL, NULL),
(1063, 4, 4, '/company', '2018-03-28 08:13:35', NULL, NULL, NULL),
(1064, 4, 4, '/contacts', '2018-03-28 08:13:44', NULL, NULL, NULL),
(1065, 4, 4, '/contacts', '2018-03-28 08:13:54', NULL, NULL, NULL),
(1066, 4, 4, '/contacts', '2018-03-28 08:13:56', NULL, NULL, NULL),
(1067, 4, 4, '/contacts', '2018-03-28 08:13:57', NULL, NULL, NULL),
(1068, 4, 4, '/contacts', '2018-03-28 08:14:12', NULL, NULL, NULL),
(1069, 4, 4, '/contacts', '2018-03-28 08:14:26', NULL, NULL, NULL),
(1070, 4, 4, '/contacts', '2018-03-28 08:15:43', NULL, NULL, NULL),
(1071, 4, 4, '/contacts', '2018-03-28 08:17:32', NULL, NULL, NULL),
(1072, 4, 4, '/', '2018-03-28 08:17:36', NULL, NULL, NULL),
(1073, 4, 4, '/company', '2018-03-28 08:17:38', NULL, NULL, NULL),
(1074, 4, 4, '/company', '2018-03-28 08:17:38', NULL, NULL, NULL),
(1075, 4, 4, '/director', '2018-03-28 08:22:56', NULL, NULL, NULL),
(1076, 4, 4, '/director', '2018-03-28 08:22:57', NULL, NULL, NULL),
(1077, 4, 4, '/director', '2018-03-28 08:22:58', NULL, NULL, NULL),
(1078, 4, 4, '/company-shops', '2018-03-28 08:23:09', NULL, NULL, NULL),
(1079, 4, 4, '/company-shops', '2018-03-28 08:23:11', NULL, NULL, NULL),
(1080, 4, 4, '/company-shops', '2018-03-28 08:35:45', NULL, NULL, NULL),
(1081, 4, 4, '/', '2018-03-28 08:35:47', NULL, NULL, NULL),
(1082, 4, 4, '/company', '2018-03-28 08:35:48', NULL, NULL, NULL),
(1083, 4, 4, '/company', '2018-03-28 08:35:48', NULL, NULL, NULL),
(1084, 4, 4, '/contacts', '2018-03-28 09:09:52', NULL, NULL, NULL),
(1085, 4, 4, '/info', '2018-03-28 09:18:11', NULL, NULL, NULL),
(1086, 4, 4, '/info', '2018-03-28 09:18:11', NULL, NULL, NULL),
(1087, 4, 4, '/info', '2018-03-28 09:18:19', NULL, NULL, NULL),
(1088, 4, 4, '/info', '2018-03-28 09:18:19', NULL, NULL, NULL),
(1089, 4, 4, '/info', '2018-03-28 09:18:27', NULL, NULL, NULL),
(1090, 4, 4, '/info', '2018-03-28 09:18:28', NULL, NULL, NULL),
(1091, 4, 4, '/info', '2018-03-28 09:18:30', NULL, NULL, NULL),
(1092, 4, 4, '/info', '2018-03-28 09:18:30', NULL, NULL, NULL),
(1093, 2, 2, '/company', '2018-03-28 09:19:55', NULL, NULL, NULL),
(1094, 2, 2, '/company', '2018-03-28 09:19:56', NULL, NULL, NULL),
(1095, 2, 2, '/company', '2018-03-28 09:19:59', NULL, NULL, NULL),
(1096, 2, 2, '/company', '2018-03-28 09:19:59', NULL, NULL, NULL),
(1097, 2, 2, '/contacts', '2018-03-28 09:20:02', NULL, NULL, NULL),
(1098, 2, 2, '/company', '2018-03-28 09:22:50', NULL, NULL, NULL),
(1099, 2, 2, '/company', '2018-03-28 09:22:50', NULL, NULL, NULL),
(1100, 2, 2, '/company', '2018-03-28 09:22:57', NULL, NULL, NULL),
(1101, 2, 2, '/company', '2018-03-28 09:22:57', NULL, NULL, NULL),
(1102, 2, 2, '/news', '2018-03-28 09:23:01', NULL, NULL, NULL),
(1103, 2, 2, '/news', '2018-03-28 09:23:04', NULL, NULL, NULL),
(1104, 2, 2, '/news', '2018-03-28 09:23:05', NULL, NULL, NULL),
(1105, 2, 2, '/news', '2018-03-28 09:23:08', NULL, NULL, NULL),
(1106, 2, 2, '/news', '2018-03-28 09:23:20', NULL, NULL, NULL),
(1107, 2, 2, '/news', '2018-03-28 09:23:28', NULL, NULL, NULL),
(1108, 2, 2, '/company', '2018-03-28 09:23:29', NULL, NULL, NULL),
(1109, 2, 2, '/news', '2018-03-28 09:23:30', NULL, NULL, NULL),
(1110, 2, 2, '/company', '2018-03-28 09:23:31', NULL, NULL, NULL),
(1111, 2, 2, '/news', '2018-03-28 09:23:43', NULL, NULL, NULL),
(1112, 2, 2, '/news', '2018-03-28 09:23:45', NULL, NULL, NULL),
(1113, 2, 2, '/news', '2018-03-28 09:23:55', NULL, NULL, NULL),
(1114, 2, 2, '/news', '2018-03-28 09:24:05', NULL, NULL, NULL),
(1115, 2, 2, '/news', '2018-03-28 09:24:08', NULL, NULL, NULL),
(1116, 2, 2, '/company', '2018-03-28 09:24:13', NULL, NULL, NULL),
(1117, 2, 2, '/company', '2018-03-28 09:24:13', NULL, NULL, NULL),
(1118, 2, 2, '/policy', '2018-03-28 09:24:16', NULL, NULL, NULL),
(1119, 2, 2, '/policy', '2018-03-28 09:24:18', NULL, NULL, NULL),
(1120, 2, 2, '/policy', '2018-03-28 09:24:19', NULL, NULL, NULL),
(1121, 2, 2, '/policy', '2018-03-28 09:24:21', NULL, NULL, NULL),
(1122, 2, 2, '/policy', '2018-03-28 09:24:25', NULL, NULL, NULL),
(1123, 2, 2, '/policy', '2018-03-28 09:24:31', NULL, NULL, NULL),
(1124, 2, 2, '/info', '2018-03-28 09:24:31', NULL, NULL, NULL),
(1125, 2, 2, '/info', '2018-03-28 09:24:32', NULL, NULL, NULL),
(1126, 2, 2, '/publications', '2018-03-28 09:24:33', NULL, NULL, NULL),
(1127, 2, 2, '/info', '2018-03-28 09:24:51', NULL, NULL, NULL),
(1128, 2, 2, '/info', '2018-03-28 09:24:51', NULL, NULL, NULL),
(1129, 2, 2, '/shop', '2018-03-28 09:24:52', NULL, NULL, NULL),
(1130, 2, 2, '/company', '2018-03-28 09:24:53', NULL, NULL, NULL),
(1131, 2, 2, '/company', '2018-03-28 09:24:53', NULL, NULL, NULL),
(1132, 2, 2, '/info', '2018-03-28 09:24:54', NULL, NULL, NULL),
(1133, 2, 2, '/info', '2018-03-28 09:24:55', NULL, NULL, NULL),
(1134, 2, 2, '/info-questions', '2018-03-28 09:24:57', NULL, NULL, NULL),
(1135, 2, 2, '/admin', '2018-03-28 09:25:00', NULL, NULL, NULL),
(1136, 2, 2, '/info', '2018-03-28 09:25:03', NULL, NULL, NULL),
(1137, 2, 2, '/info', '2018-03-28 09:25:03', NULL, NULL, NULL),
(1138, 2, 2, '/info', '2018-03-28 09:25:04', NULL, NULL, NULL),
(1139, 2, 2, '/info', '2018-03-28 09:25:04', NULL, NULL, NULL),
(1140, 2, 2, '/info', '2018-03-28 09:25:05', NULL, NULL, NULL),
(1141, 2, 2, '/info', '2018-03-28 09:25:05', NULL, NULL, NULL),
(1142, 2, 2, '/info-questions', '2018-03-28 09:25:07', NULL, NULL, NULL),
(1143, 2, 2, '/info-questions', '2018-03-28 09:25:09', NULL, NULL, NULL),
(1144, 2, 2, '/info-questions', '2018-03-28 09:25:10', NULL, NULL, NULL),
(1145, 2, 2, '/info-questions', '2018-03-28 09:25:12', NULL, NULL, NULL),
(1146, 2, 2, '/info-questions', '2018-03-28 09:25:22', NULL, NULL, NULL),
(1147, 2, 2, '/info-questions', '2018-03-28 09:25:31', NULL, NULL, NULL),
(1148, 2, 2, '/info-questions', '2018-03-28 09:25:32', NULL, NULL, NULL),
(1149, 2, 2, '/company', '2018-03-28 09:25:34', NULL, NULL, NULL),
(1150, 2, 2, '/company', '2018-03-28 09:25:35', NULL, NULL, NULL),
(1151, 2, 2, '/company-history', '2018-03-28 09:25:36', NULL, NULL, NULL),
(1152, 2, 2, '/info', '2018-03-28 09:25:38', NULL, NULL, NULL),
(1153, 2, 2, '/info', '2018-03-28 09:25:38', NULL, NULL, NULL),
(1154, 2, 2, '/company', '2018-03-28 09:25:39', NULL, NULL, NULL),
(1155, 2, 2, '/company', '2018-03-28 09:25:39', NULL, NULL, NULL),
(1156, 2, 2, '/news', '2018-03-28 09:25:40', NULL, NULL, NULL),
(1157, 2, 2, '/info', '2018-03-28 09:25:44', NULL, NULL, NULL),
(1158, 2, 2, '/info', '2018-03-28 09:25:44', NULL, NULL, NULL),
(1159, 2, 2, '/promotions-and-offers', '2018-03-28 09:25:51', NULL, NULL, NULL),
(1160, 2, 2, '/company', '2018-03-28 09:26:01', NULL, NULL, NULL),
(1161, 2, 2, '/company', '2018-03-28 09:26:01', NULL, NULL, NULL),
(1162, 2, 2, '/company-history', '2018-03-28 09:26:13', NULL, NULL, NULL),
(1163, 2, 2, '/company', '2018-03-28 09:26:44', NULL, NULL, NULL),
(1164, 2, 2, '/company', '2018-03-28 09:26:45', NULL, NULL, NULL),
(1165, 2, 2, '/company-shops', '2018-03-28 09:26:52', NULL, NULL, NULL),
(1166, 2, 2, '/company-shops', '2018-03-28 09:27:03', NULL, NULL, NULL),
(1167, 2, 2, '/company-shops', '2018-03-28 09:27:04', NULL, NULL, NULL),
(1168, 2, 2, '/company-shops', '2018-03-28 09:27:34', NULL, NULL, NULL),
(1169, 2, 2, '/company', '2018-03-28 09:28:00', NULL, NULL, NULL),
(1170, 2, 2, '/company', '2018-03-28 09:28:01', NULL, NULL, NULL),
(1171, 2, 2, '/company-reviews', '2018-03-28 09:28:13', NULL, NULL, NULL),
(1172, 2, 2, '/company-reviews', '2018-03-28 09:28:35', NULL, NULL, NULL),
(1173, 2, 2, '/company-reviews', '2018-03-28 09:28:37', NULL, NULL, NULL),
(1174, 2, 2, '/vacansies', '2018-03-28 09:29:08', NULL, NULL, NULL),
(1175, 2, 2, '/vacansies', '2018-03-28 09:29:12', NULL, NULL, NULL),
(1176, 2, 2, '/vacansies', '2018-03-28 09:29:16', NULL, NULL, NULL),
(1177, 2, 2, '/vacansies', '2018-03-28 09:29:21', NULL, NULL, NULL),
(1178, 2, 2, '/vacansies', '2018-03-28 09:29:43', NULL, NULL, NULL),
(1179, 2, 2, '/info', '2018-03-28 09:29:45', NULL, NULL, NULL),
(1180, 2, 2, '/info', '2018-03-28 09:29:45', NULL, NULL, NULL),
(1181, 2, 2, '/company', '2018-03-28 09:29:45', NULL, NULL, NULL),
(1182, 2, 2, '/company', '2018-03-28 09:29:45', NULL, NULL, NULL),
(1183, 2, 2, '/info', '2018-03-28 09:29:58', NULL, NULL, NULL),
(1184, 2, 2, '/info', '2018-03-28 09:29:59', NULL, NULL, NULL),
(1185, 2, 2, '/info-questions', '2018-03-28 09:30:00', NULL, NULL, NULL),
(1186, 2, 2, '/info', '2018-03-28 09:30:01', NULL, NULL, NULL),
(1187, 2, 2, '/info', '2018-03-28 09:30:02', NULL, NULL, NULL),
(1188, 2, 2, '/legal-documents', '2018-03-28 09:30:42', NULL, NULL, NULL),
(1189, 2, 2, '/info', '2018-03-28 09:30:47', NULL, NULL, NULL),
(1190, 2, 2, '/info', '2018-03-28 09:30:47', NULL, NULL, NULL),
(1191, 2, 2, '/info', '2018-03-28 09:31:22', NULL, NULL, NULL),
(1192, 2, 2, '/info', '2018-03-28 09:31:22', NULL, NULL, NULL),
(1193, 2, 2, '/legal-documents', '2018-03-28 09:31:36', NULL, NULL, NULL),
(1194, 2, 2, '/legal-documents', '2018-03-28 09:31:38', NULL, NULL, NULL),
(1195, 2, 2, '/legal-documents', '2018-03-28 09:31:40', NULL, NULL, NULL),
(1196, 2, 2, '/legal-documents', '2018-03-28 09:31:58', NULL, NULL, NULL),
(1197, 2, 2, '/legal-documents', '2018-03-28 09:32:12', NULL, NULL, NULL),
(1198, 2, 2, '/legal-documents', '2018-03-28 09:32:12', NULL, NULL, NULL),
(1199, 2, 2, '/legal-documents', '2018-03-28 09:32:12', NULL, NULL, NULL),
(1200, 2, 2, '/legal-documents', '2018-03-28 09:32:21', NULL, NULL, NULL),
(1201, 2, 2, '/info', '2018-03-28 09:33:35', NULL, NULL, NULL),
(1202, 2, 2, '/info', '2018-03-28 09:33:35', NULL, NULL, NULL),
(1203, 4, 4, '/contacts', '2018-03-28 09:35:13', NULL, NULL, NULL),
(1204, 4, 4, '/contacts', '2018-03-28 09:35:14', NULL, NULL, NULL),
(1205, 4, 4, '/', '2018-03-28 09:35:16', NULL, NULL, NULL),
(1206, 4, 4, '/company', '2018-03-28 09:35:16', NULL, NULL, NULL),
(1207, 4, 4, '/company', '2018-03-28 09:35:17', NULL, NULL, NULL),
(1208, 4, 4, '/news', '2018-03-28 09:35:19', NULL, NULL, NULL),
(1209, 4, 4, '/news', '2018-03-28 09:35:20', NULL, NULL, NULL),
(1210, 4, 4, '/news', '2018-03-28 09:35:24', NULL, NULL, NULL),
(1211, 4, 4, '/news', '2018-03-28 09:35:30', NULL, NULL, NULL),
(1212, 4, 4, '/', '2018-03-28 09:35:33', NULL, NULL, NULL),
(1213, 4, 4, '/', '2018-03-28 09:35:38', NULL, NULL, NULL),
(1214, 4, 4, '/company', '2018-03-28 09:35:39', NULL, NULL, NULL),
(1215, 4, 4, '/company', '2018-03-28 09:35:40', NULL, NULL, NULL),
(1216, 4, 4, '/news', '2018-03-28 09:35:45', NULL, NULL, NULL),
(1217, 4, 4, '/news', '2018-03-28 09:36:09', NULL, NULL, NULL),
(1218, 4, 4, '/news', '2018-03-28 09:36:11', NULL, NULL, NULL),
(1219, 4, 4, '/news', '2018-03-28 09:36:20', NULL, NULL, NULL),
(1220, 4, 4, '/news', '2018-03-28 09:36:22', NULL, NULL, NULL),
(1221, 4, 4, '/news', '2018-03-28 09:36:27', NULL, NULL, NULL),
(1222, 4, 4, '/news', '2018-03-28 09:36:30', NULL, NULL, NULL),
(1223, 4, 4, '/news', '2018-03-28 09:36:31', NULL, NULL, NULL),
(1224, 4, 4, '/news', '2018-03-28 09:36:38', NULL, NULL, NULL),
(1225, 4, 4, '/news', '2018-03-28 09:36:40', NULL, NULL, NULL),
(1226, 4, 4, '/', '2018-03-28 09:36:48', NULL, NULL, NULL),
(1227, 4, 4, '/', '2018-03-28 09:36:51', NULL, NULL, NULL),
(1228, 4, 4, '/company', '2018-03-28 09:36:51', NULL, NULL, NULL),
(1229, 4, 4, '/company', '2018-03-28 09:36:51', NULL, NULL, NULL),
(1230, 4, 4, '/company-history', '2018-03-28 09:36:53', NULL, NULL, NULL),
(1231, 4, 4, '/news', '2018-03-28 09:37:08', NULL, NULL, NULL),
(1232, 4, 4, '/news', '2018-03-28 09:37:10', NULL, NULL, NULL),
(1233, 4, 4, '/company-history', '2018-03-28 09:37:11', NULL, NULL, NULL),
(1234, 4, 4, '/news', '2018-03-28 09:37:17', NULL, NULL, NULL),
(1235, 4, 4, '/company', '2018-03-28 09:37:22', NULL, NULL, NULL),
(1236, 4, 4, '/company', '2018-03-28 09:37:23', NULL, NULL, NULL),
(1237, 2, 2, '/info-questions', '2018-03-28 09:37:23', NULL, NULL, NULL),
(1238, 2, 2, '/info-questions', '2018-03-28 09:37:28', NULL, NULL, NULL),
(1239, 2, 2, '/info-questions', '2018-03-28 09:37:30', NULL, NULL, NULL),
(1240, 4, 4, '/news', '2018-03-28 09:37:39', NULL, NULL, NULL),
(1241, 2, 2, '/info-questions', '2018-03-28 09:37:39', NULL, NULL, NULL),
(1242, 4, 4, '/news', '2018-03-28 09:37:44', NULL, NULL, NULL),
(1243, 2, 2, '/info-questions', '2018-03-28 09:38:02', NULL, NULL, NULL),
(1244, 4, 4, '/news', '2018-03-28 09:38:03', NULL, NULL, NULL),
(1245, 2, 2, '/info-questions', '2018-03-28 09:38:04', NULL, NULL, NULL),
(1246, 2, 2, '/info-questions', '2018-03-28 09:38:17', NULL, NULL, NULL),
(1247, 2, 2, '/info-questions', '2018-03-28 09:38:20', NULL, NULL, NULL),
(1248, 4, 4, '/news', '2018-03-28 09:38:22', NULL, NULL, NULL),
(1249, 4, 4, '/news', '2018-03-28 09:38:34', NULL, NULL, NULL),
(1250, 4, 4, '/company-history', '2018-03-28 09:38:35', NULL, NULL, NULL),
(1251, 4, 4, '/company-history', '2018-03-28 09:38:38', NULL, NULL, NULL),
(1252, 4, 4, '/company-history', '2018-03-28 09:38:39', NULL, NULL, NULL),
(1253, 4, 4, '/company-history', '2018-03-28 09:38:40', NULL, NULL, NULL),
(1254, 4, 4, '/company-history', '2018-03-28 09:38:41', NULL, NULL, NULL),
(1255, 4, 4, '/company-history', '2018-03-28 09:38:44', NULL, NULL, NULL),
(1256, 4, 4, '/company-history', '2018-03-28 09:38:47', NULL, NULL, NULL),
(1257, 4, 4, '/company-history', '2018-03-28 09:38:48', NULL, NULL, NULL),
(1258, 4, 4, '/news', '2018-03-28 09:38:49', NULL, NULL, NULL),
(1259, 4, 4, '/company-history', '2018-03-28 09:38:50', NULL, NULL, NULL),
(1260, 4, 4, '/policy', '2018-03-28 09:38:53', NULL, NULL, NULL),
(1261, 4, 4, '/company-shops', '2018-03-28 09:38:54', NULL, NULL, NULL),
(1262, 4, 4, '/company-shops', '2018-03-28 09:38:58', NULL, NULL, NULL),
(1263, 4, 4, '/company-shops', '2018-03-28 09:38:59', NULL, NULL, NULL),
(1264, 4, 4, '/company-shops', '2018-03-28 09:39:02', NULL, NULL, NULL),
(1265, 4, 4, '/company-shops', '2018-03-28 09:39:06', NULL, NULL, NULL),
(1266, 4, 4, '/company-shops', '2018-03-28 09:39:07', NULL, NULL, NULL),
(1267, 4, 4, '/achievements', '2018-03-28 09:39:09', NULL, NULL, NULL),
(1268, 4, 4, '/achievements', '2018-03-28 09:39:10', NULL, NULL, NULL),
(1269, 4, 4, '/achievements', '2018-03-28 09:39:11', NULL, NULL, NULL),
(1270, 4, 4, '/achievements', '2018-03-28 09:39:14', NULL, NULL, NULL),
(1271, 4, 4, '/achievements', '2018-03-28 09:39:16', NULL, NULL, NULL),
(1272, 4, 4, '/achievements', '2018-03-28 09:39:18', NULL, NULL, NULL),
(1273, 4, 4, '/contacts', '2018-03-28 09:39:19', NULL, NULL, NULL),
(1274, 4, 4, '/contacts', '2018-03-28 09:39:20', NULL, NULL, NULL),
(1275, 4, 4, '/contacts', '2018-03-28 09:39:20', NULL, NULL, NULL),
(1276, 4, 4, '/contacts', '2018-03-28 09:39:23', NULL, NULL, NULL),
(1277, 4, 4, '/contacts', '2018-03-28 09:39:25', NULL, NULL, NULL),
(1278, 4, 4, '/contacts', '2018-03-28 09:39:26', NULL, NULL, NULL),
(1279, 4, 4, '/achievements', '2018-03-28 09:39:30', NULL, NULL, NULL),
(1280, 4, 4, '/company-shops', '2018-03-28 09:39:31', NULL, NULL, NULL),
(1281, 4, 4, '/policy', '2018-03-28 09:39:35', NULL, NULL, NULL),
(1282, 4, 4, '/contacts', '2018-03-28 09:39:36', NULL, NULL, NULL),
(1283, 4, 4, '/contacts', '2018-03-28 09:39:42', NULL, NULL, NULL),
(1284, 4, 4, '/contacts', '2018-03-28 09:39:51', NULL, NULL, NULL),
(1285, 4, 4, '/contacts', '2018-03-28 09:39:52', NULL, NULL, NULL),
(1286, 4, 4, '/director', '2018-03-28 09:39:53', NULL, NULL, NULL),
(1287, 4, 4, '/director', '2018-03-28 09:39:55', NULL, NULL, NULL),
(1288, 4, 4, '/director', '2018-03-28 09:39:56', NULL, NULL, NULL),
(1289, 4, 4, '/director', '2018-03-28 09:39:58', NULL, NULL, NULL),
(1290, 4, 4, '/director', '2018-03-28 09:40:00', NULL, NULL, NULL),
(1291, 4, 4, '/director', '2018-03-28 09:40:02', NULL, NULL, NULL),
(1292, 4, 4, '/news', '2018-03-28 09:40:03', NULL, NULL, NULL),
(1293, 4, 4, '/contacts', '2018-03-28 09:40:26', NULL, NULL, NULL),
(1294, 4, 4, '/contacts', '2018-03-28 09:44:37', NULL, NULL, NULL),
(1295, 4, 4, '/contacts', '2018-03-28 09:45:19', NULL, NULL, NULL),
(1296, 4, 4, '/contacts', '2018-03-28 09:45:20', NULL, NULL, NULL),
(1297, 4, 4, '/contacts', '2018-03-28 09:46:27', NULL, NULL, NULL),
(1298, 4, 4, '/contacts', '2018-03-28 09:46:29', NULL, NULL, NULL),
(1299, 4, 4, '/contacts', '2018-03-28 09:49:47', NULL, NULL, NULL),
(1300, 4, 4, '/contacts', '2018-03-28 09:49:49', NULL, NULL, NULL),
(1301, 4, 4, '/contacts', '2018-03-28 09:50:34', NULL, NULL, NULL),
(1302, 4, 4, '/contacts', '2018-03-28 09:50:37', NULL, NULL, NULL),
(1303, 4, 4, '/contacts', '2018-03-28 09:51:52', NULL, NULL, NULL),
(1304, 4, 4, '/contacts', '2018-03-28 09:51:54', NULL, NULL, NULL),
(1305, 4, 4, '/contacts', '2018-03-28 09:52:03', NULL, NULL, NULL),
(1306, 4, 4, '/contacts', '2018-03-28 09:52:05', NULL, NULL, NULL),
(1307, 4, 4, '/contacts', '2018-03-28 09:52:18', NULL, NULL, NULL),
(1308, 4, 4, '/contacts', '2018-03-28 09:52:19', NULL, NULL, NULL),
(1309, 4, 4, '/contacts', '2018-03-28 09:53:04', NULL, NULL, NULL),
(1310, 4, 4, '/contacts', '2018-03-28 09:53:06', NULL, NULL, NULL),
(1311, 4, 4, '/contacts', '2018-03-28 09:53:15', NULL, NULL, NULL),
(1312, 4, 4, '/contacts', '2018-03-28 09:53:17', NULL, NULL, NULL),
(1313, 4, 4, '/contacts', '2018-03-28 09:54:10', NULL, NULL, NULL),
(1314, 4, 4, '/contacts', '2018-03-28 09:54:13', NULL, NULL, NULL),
(1315, 4, 4, '/contacts', '2018-03-28 09:54:24', NULL, NULL, NULL),
(1316, 4, 4, '/contacts', '2018-03-28 09:54:25', NULL, NULL, NULL),
(1317, 4, 4, '/contacts', '2018-03-28 09:54:34', NULL, NULL, NULL),
(1318, 4, 4, '/contacts', '2018-03-28 09:54:36', NULL, NULL, NULL),
(1319, 4, 4, '/contacts', '2018-03-28 09:55:44', NULL, NULL, NULL),
(1320, 4, 4, '/contacts', '2018-03-28 09:55:51', NULL, NULL, NULL),
(1321, 4, 4, '/contacts', '2018-03-28 09:56:04', NULL, NULL, NULL),
(1322, 4, 4, '/contacts', '2018-03-28 09:56:06', NULL, NULL, NULL),
(1323, 4, 4, '/contacts', '2018-03-28 09:56:19', NULL, NULL, NULL),
(1324, 4, 4, '/contacts', '2018-03-28 09:56:22', NULL, NULL, NULL),
(1325, 4, 4, '/contacts', '2018-03-28 09:56:33', NULL, NULL, NULL),
(1326, 4, 4, '/contacts', '2018-03-28 09:57:08', NULL, NULL, NULL),
(1327, 4, 4, '/contacts', '2018-03-28 09:58:02', NULL, NULL, NULL),
(1328, 4, 4, '/contacts', '2018-03-28 09:58:19', NULL, NULL, NULL),
(1329, 4, 4, '/contacts', '2018-03-28 10:00:26', NULL, NULL, NULL),
(1330, 4, 4, '/contacts', '2018-03-28 10:00:32', NULL, NULL, NULL),
(1331, 4, 4, '/contacts', '2018-03-28 10:01:48', NULL, NULL, NULL),
(1332, 4, 4, '/contacts', '2018-03-28 10:01:51', NULL, NULL, NULL),
(1333, 4, 4, '/contacts', '2018-03-28 10:02:06', NULL, NULL, NULL),
(1334, 4, 4, '/contacts', '2018-03-28 10:02:16', NULL, NULL, NULL),
(1335, 4, 4, '/contacts', '2018-03-28 10:02:20', NULL, NULL, NULL),
(1336, 4, 4, '/contacts', '2018-03-28 10:02:30', NULL, NULL, NULL),
(1337, 4, 4, '/contacts', '2018-03-28 10:16:41', NULL, NULL, NULL),
(1338, 4, 4, '/contacts', '2018-03-28 10:16:44', NULL, NULL, NULL),
(1339, 4, 4, '/contacts', '2018-03-28 10:16:47', NULL, NULL, NULL),
(1340, 4, 4, '/contacts', '2018-03-28 10:16:48', NULL, NULL, NULL),
(1341, 4, 4, '/contacts', '2018-03-28 10:18:09', NULL, NULL, NULL),
(1342, 4, 4, '/contacts', '2018-03-28 10:18:17', NULL, NULL, NULL),
(1343, 4, 4, '/contacts', '2018-03-28 10:18:52', NULL, NULL, NULL),
(1344, 4, 4, '/contacts', '2018-03-28 10:18:58', NULL, NULL, NULL),
(1345, 4, 4, '/contacts', '2018-03-28 10:23:38', NULL, NULL, NULL),
(1346, 4, 4, '/contacts', '2018-03-28 10:24:27', NULL, NULL, NULL),
(1347, 4, 4, '/contacts', '2018-03-28 10:25:20', NULL, NULL, NULL),
(1348, 4, 4, '/contacts', '2018-03-28 10:25:24', NULL, NULL, NULL),
(1349, 4, 4, '/contacts', '2018-03-28 10:25:36', NULL, NULL, NULL),
(1350, 4, 4, '/contacts', '2018-03-28 10:25:41', NULL, NULL, NULL),
(1351, 4, 4, '/contacts', '2018-03-28 10:25:50', NULL, NULL, NULL),
(1352, 4, 4, '/contacts', '2018-03-28 10:57:36', NULL, NULL, NULL),
(1353, 4, 4, '/contacts', '2018-03-28 11:00:43', NULL, NULL, NULL),
(1354, 4, 4, '/contacts', '2018-03-28 11:05:16', NULL, NULL, NULL),
(1355, 2, 2, '/info-questions', '2018-03-28 11:26:41', NULL, NULL, NULL),
(1356, 2, 2, '/company', '2018-03-28 11:26:42', NULL, NULL, NULL),
(1357, 2, 2, '/company', '2018-03-28 11:26:43', NULL, NULL, NULL),
(1358, 2, 2, '/news', '2018-03-28 11:26:44', NULL, NULL, NULL),
(1359, 2, 2, '/company-history', '2018-03-28 11:26:45', NULL, NULL, NULL),
(1360, 2, 2, '/policy', '2018-03-28 11:26:46', NULL, NULL, NULL),
(1361, 2, 2, '/company-shops', '2018-03-28 11:26:47', NULL, NULL, NULL),
(1362, 2, 2, '/achievements', '2018-03-28 11:26:48', NULL, NULL, NULL),
(1363, 2, 2, '/contacts', '2018-03-28 11:26:49', NULL, NULL, NULL),
(1364, 2, 2, '/director', '2018-03-28 11:26:52', NULL, NULL, NULL),
(1365, 2, 2, '/contacts', '2018-03-28 11:28:12', NULL, NULL, NULL),
(1366, 2, 2, '/achievements', '2018-03-28 11:28:12', NULL, NULL, NULL),
(1367, 2, 2, '/company-shops', '2018-03-28 11:28:13', NULL, NULL, NULL),
(1368, 2, 2, '/policy', '2018-03-28 11:28:14', NULL, NULL, NULL),
(1369, 2, 2, '/company-history', '2018-03-28 11:28:15', NULL, NULL, NULL),
(1370, 2, 2, '/news', '2018-03-28 11:28:15', NULL, NULL, NULL),
(1371, 2, 2, '/company', '2018-03-28 11:28:17', NULL, NULL, NULL),
(1372, 2, 2, '/company', '2018-03-28 11:28:17', NULL, NULL, NULL),
(1373, 2, 2, '/shop', '2018-03-28 11:28:17', NULL, NULL, NULL),
(1374, 2, 2, '/info', '2018-03-28 11:28:18', NULL, NULL, NULL),
(1375, 2, 2, '/info', '2018-03-28 11:28:18', NULL, NULL, NULL),
(1376, 2, 2, '/company', '2018-03-28 11:28:19', NULL, NULL, NULL),
(1377, 2, 2, '/company', '2018-03-28 11:28:19', NULL, NULL, NULL),
(1378, 2, 2, '/', '2018-03-28 11:28:20', NULL, NULL, NULL),
(1379, 2, 2, '/company', '2018-03-28 11:28:21', NULL, NULL, NULL),
(1380, 2, 2, '/company', '2018-03-28 11:28:21', NULL, NULL, NULL),
(1381, 2, 2, '/company', '2018-03-28 11:28:28', NULL, NULL, NULL),
(1382, 2, 2, '/company', '2018-03-28 11:28:28', NULL, NULL, NULL),
(1383, 2, 2, '/shop', '2018-03-28 11:28:31', NULL, NULL, NULL),
(1384, 2, 2, '/info', '2018-03-28 11:28:31', NULL, NULL, NULL),
(1385, 2, 2, '/info', '2018-03-28 11:28:32', NULL, NULL, NULL),
(1386, 4, 4, '/company', '2018-03-28 11:28:36', NULL, NULL, NULL),
(1387, 4, 4, '/company', '2018-03-28 11:28:38', NULL, NULL, NULL),
(1388, 4, 4, '/company', '2018-03-28 11:28:39', NULL, NULL, NULL),
(1389, 4, 4, '/company', '2018-03-28 11:28:39', NULL, NULL, NULL),
(1390, 2, 2, '/shop', '2018-03-28 11:28:41', NULL, NULL, NULL),
(1391, 2, 2, '/company', '2018-03-28 11:28:42', NULL, NULL, NULL),
(1392, 2, 2, '/company', '2018-03-28 11:28:43', NULL, NULL, NULL),
(1393, 4, 4, '/company-shops', '2018-03-28 11:28:43', NULL, NULL, NULL),
(1394, 4, 4, '/company', '2018-03-28 11:28:46', NULL, NULL, NULL),
(1395, 4, 4, '/company', '2018-03-28 11:28:46', NULL, NULL, NULL),
(1396, 4, 4, '/contacts', '2018-03-28 11:29:10', NULL, NULL, NULL),
(1397, 4, 4, '/company-shops', '2018-03-28 11:29:12', NULL, NULL, NULL),
(1398, 4, 4, '/contacts', '2018-03-28 11:29:17', NULL, NULL, NULL),
(1399, 4, 4, '/contacts', '2018-03-28 11:29:42', NULL, NULL, NULL),
(1400, 4, 4, '/contacts', '2018-03-28 11:29:47', NULL, NULL, NULL),
(1401, 4, 4, '/contacts', '2018-03-28 11:30:17', NULL, NULL, NULL),
(1402, 4, 4, '/contacts', '2018-03-28 11:30:21', NULL, NULL, NULL),
(1403, 4, 4, '/contacts', '2018-03-28 11:30:29', NULL, NULL, NULL),
(1404, 4, 4, '/company', '2018-03-28 11:40:54', NULL, NULL, NULL),
(1405, 4, 4, '/company', '2018-03-28 11:40:55', NULL, NULL, NULL),
(1406, 4, 4, '/contacts', '2018-03-28 11:42:34', NULL, NULL, NULL),
(1407, 4, 4, '/contacts', '2018-03-28 11:42:36', NULL, NULL, NULL),
(1408, 4, 4, '/contacts', '2018-03-28 11:42:42', NULL, NULL, NULL),
(1409, 4, 4, '/company', '2018-03-28 11:57:44', NULL, NULL, NULL),
(1410, 4, 4, '/company', '2018-03-28 11:57:45', NULL, NULL, NULL),
(1411, 4, 4, '/company', '2018-03-28 11:57:46', NULL, NULL, NULL),
(1412, 4, 4, '/company', '2018-03-28 11:57:46', NULL, NULL, NULL),
(1413, 4, 4, '/', '2018-03-28 12:01:39', NULL, NULL, NULL),
(1414, 4, 4, '/company', '2018-03-28 12:01:41', NULL, NULL, NULL),
(1415, 4, 4, '/company', '2018-03-28 12:01:41', NULL, NULL, NULL),
(1416, 4, 4, '/contacts', '2018-03-28 12:01:46', NULL, NULL, NULL),
(1417, 4, 4, '/contacts', '2018-03-28 12:01:53', NULL, NULL, NULL),
(1418, 5, 5, '/', '2018-03-28 12:24:43', NULL, NULL, NULL),
(1419, 5, 5, '/company', '2018-03-28 12:24:57', NULL, NULL, NULL),
(1420, 5, 5, '/company', '2018-03-28 12:24:57', NULL, NULL, NULL),
(1421, 5, 5, '/news', '2018-03-28 12:24:59', NULL, NULL, NULL),
(1422, 6, 6, '/', '2018-03-28 18:39:30', NULL, NULL, NULL),
(1423, 6, 6, '/shop', '2018-03-28 18:39:32', NULL, NULL, NULL),
(1424, 6, 6, '/company', '2018-03-28 18:39:33', NULL, NULL, NULL),
(1425, 6, 6, '/company', '2018-03-28 18:39:34', NULL, NULL, NULL),
(1426, 6, 6, '/company-shops', '2018-03-28 18:39:39', NULL, NULL, NULL),
(1427, 6, 6, '/login', '2018-03-28 18:39:40', NULL, NULL, NULL),
(1428, 6, 6, '/', '2018-03-28 18:39:51', NULL, NULL, NULL),
(1429, 6, 6, '/company', '2018-03-28 18:39:53', NULL, NULL, NULL),
(1430, 6, 6, '/company', '2018-03-28 18:39:53', NULL, NULL, NULL),
(1431, 6, 6, '/company-shops', '2018-03-28 18:39:57', NULL, NULL, NULL),
(1432, 6, 6, '/company-shops', '2018-03-28 18:40:02', NULL, NULL, NULL),
(1433, 6, 6, '/company-shops', '2018-03-28 18:40:09', NULL, NULL, NULL),
(1434, 6, 6, '/company-shops', '2018-03-28 18:40:17', NULL, NULL, NULL),
(1435, 6, 6, '/company-shops', '2018-03-28 18:40:20', NULL, NULL, NULL),
(1436, 6, 6, '/company-shops', '2018-03-28 18:40:26', NULL, NULL, NULL),
(1437, 6, 6, '/admin', '2018-03-28 18:40:55', NULL, NULL, NULL),
(1438, 6, 6, '/admin-routes', '2018-03-28 18:40:57', NULL, NULL, NULL),
(1439, 6, 6, '/company', '2018-03-28 18:41:12', NULL, NULL, NULL),
(1440, 6, 6, '/company', '2018-03-28 18:41:13', NULL, NULL, NULL),
(1441, 6, 6, '/company-shops', '2018-03-28 18:41:15', NULL, NULL, NULL),
(1442, 6, 6, '/company-shops', '2018-03-28 18:41:52', NULL, NULL, NULL),
(1443, 6, 6, '/admin-routes', '2018-03-28 18:42:08', NULL, NULL, NULL),
(1444, 6, 6, '/admin-routes', '2018-03-28 18:42:57', NULL, NULL, NULL),
(1445, 6, 6, '/shop-page/1', '2018-03-28 18:43:04', NULL, NULL, NULL),
(1446, 6, 6, '/shop-page/1', '2018-03-28 18:43:09', NULL, NULL, NULL),
(1447, 6, 6, '/shop-page/1', '2018-03-28 18:43:11', NULL, NULL, NULL),
(1448, 6, 6, '/shop-page/1', '2018-03-28 18:43:13', NULL, NULL, NULL),
(1449, 6, 6, '/shop-page/1', '2018-03-28 18:43:20', NULL, NULL, NULL),
(1450, 6, 6, '/shop-page/1', '2018-03-28 18:43:24', NULL, NULL, NULL),
(1451, 6, 6, '/shop-page/1', '2018-03-28 18:44:39', NULL, NULL, NULL),
(1452, 6, 6, '/shop-page/1', '2018-03-28 18:44:55', NULL, NULL, NULL),
(1453, 6, 6, '/shop-page/1', '2018-03-28 18:45:05', NULL, NULL, NULL),
(1454, 6, 6, '/company', '2018-03-28 18:45:08', NULL, NULL, NULL),
(1455, 6, 6, '/company', '2018-03-28 18:45:08', NULL, NULL, NULL),
(1456, 6, 6, '/company-shops', '2018-03-28 18:45:11', NULL, NULL, NULL),
(1457, 6, 6, '/', '2018-03-28 18:47:31', NULL, NULL, NULL),
(1458, 6, 6, '/company', '2018-03-28 18:47:32', NULL, NULL, NULL),
(1459, 6, 6, '/company', '2018-03-28 18:47:32', NULL, NULL, NULL),
(1460, 6, 6, '/shop', '2018-03-28 18:47:33', NULL, NULL, NULL),
(1461, 6, 6, '/info', '2018-03-28 18:47:35', NULL, NULL, NULL),
(1462, 6, 6, '/info', '2018-03-28 18:47:35', NULL, NULL, NULL),
(1463, 6, 6, '/legal-documents', '2018-03-28 18:47:40', NULL, NULL, NULL),
(1464, 6, 6, '/legal-documents', '2018-03-28 18:47:44', NULL, NULL, NULL),
(1465, 6, 6, '/legal-documents', '2018-03-28 18:47:51', NULL, NULL, NULL),
(1466, 6, 6, '/legal-documents', '2018-03-28 18:50:28', NULL, NULL, NULL),
(1467, 6, 6, '/', '2018-03-28 18:51:38', NULL, NULL, NULL),
(1468, 6, 6, '/company', '2018-03-28 18:51:39', NULL, NULL, NULL),
(1469, 6, 6, '/company', '2018-03-28 18:51:40', NULL, NULL, NULL),
(1470, 6, 6, '/shop', '2018-03-28 18:51:40', NULL, NULL, NULL),
(1471, 6, 6, '/info', '2018-03-28 18:51:41', NULL, NULL, NULL),
(1472, 6, 6, '/info', '2018-03-28 18:51:41', NULL, NULL, NULL),
(1473, 6, 6, '/', '2018-03-28 19:23:25', NULL, NULL, NULL),
(1474, 6, 6, '/company', '2018-03-28 19:23:25', NULL, NULL, NULL),
(1475, 6, 6, '/company', '2018-03-28 19:23:26', NULL, NULL, NULL),
(1476, 6, 6, '/shop', '2018-03-28 19:23:27', NULL, NULL, NULL),
(1477, 6, 6, '/info', '2018-03-28 19:23:28', NULL, NULL, NULL),
(1478, 6, 6, '/info', '2018-03-28 19:23:28', NULL, NULL, NULL),
(1479, 6, 6, '/shop', '2018-03-28 19:23:30', NULL, NULL, NULL),
(1480, 6, 6, '/company', '2018-03-28 19:23:33', NULL, NULL, NULL),
(1481, 6, 6, '/company', '2018-03-28 19:23:33', NULL, NULL, NULL),
(1482, 6, 6, '/', '2018-03-28 19:23:34', NULL, NULL, NULL),
(1483, 6, 6, '/shop', '2018-03-28 19:23:34', NULL, NULL, NULL),
(1484, 6, 6, '/shop', '2018-03-28 19:23:36', NULL, NULL, NULL),
(1485, 6, 6, '/shop', '2018-03-28 19:23:41', NULL, NULL, NULL),
(1486, 6, 6, '/shop', '2018-03-28 19:24:41', NULL, NULL, NULL),
(1487, 6, 6, '/shop', '2018-03-28 19:26:01', NULL, NULL, NULL),
(1488, 6, 6, '/', '2018-03-29 04:08:51', NULL, NULL, NULL),
(1489, 6, 6, '/', '2018-03-29 04:08:54', NULL, NULL, NULL),
(1490, 6, 6, '/', '2018-03-29 04:08:55', NULL, NULL, NULL),
(1491, 4, 4, '/', '2018-03-29 05:08:20', NULL, NULL, NULL),
(1492, 4, 4, '/company', '2018-03-29 05:08:36', NULL, NULL, NULL),
(1493, 4, 4, '/company', '2018-03-29 05:08:36', NULL, NULL, NULL),
(1494, 4, 4, '/', '2018-03-29 05:09:24', NULL, NULL, NULL),
(1495, 4, 4, '/shop', '2018-03-29 05:09:35', NULL, NULL, NULL),
(1496, 4, 4, '/company', '2018-03-29 05:09:35', NULL, NULL, NULL),
(1497, 4, 4, '/company', '2018-03-29 05:09:36', NULL, NULL, NULL),
(1498, 4, 4, '/info', '2018-03-29 05:11:38', NULL, NULL, NULL),
(1499, 4, 4, '/info', '2018-03-29 05:11:39', NULL, NULL, NULL),
(1500, 4, 4, '/info', '2018-03-29 05:17:19', NULL, NULL, NULL),
(1501, 4, 4, '/info', '2018-03-29 05:17:20', NULL, NULL, NULL),
(1502, 4, 4, '/info', '2018-03-29 05:17:22', NULL, NULL, NULL),
(1503, 4, 4, '/info', '2018-03-29 05:17:22', NULL, NULL, NULL),
(1504, 4, 4, '/shop', '2018-03-29 05:17:23', NULL, NULL, NULL),
(1505, 4, 4, '/shop', '2018-03-29 05:17:25', NULL, NULL, NULL),
(1506, 4, 4, '/shop', '2018-03-29 05:17:27', NULL, NULL, NULL),
(1507, 4, 4, '/shop', '2018-03-29 05:17:29', NULL, NULL, NULL),
(1508, 4, 4, '/company', '2018-03-29 05:17:30', NULL, NULL, NULL),
(1509, 4, 4, '/company', '2018-03-29 05:17:30', NULL, NULL, NULL),
(1510, 4, 4, '/company-shops', '2018-03-29 05:17:33', NULL, NULL, NULL),
(1511, 4, 4, '/company-shops', '2018-03-29 05:17:36', NULL, NULL, NULL),
(1512, 4, 4, '/company-shops', '2018-03-29 05:17:40', NULL, NULL, NULL),
(1513, 4, 4, '/shop-page/1', '2018-03-29 05:17:48', NULL, NULL, NULL),
(1514, 4, 4, '/company-shops', '2018-03-29 05:17:54', NULL, NULL, NULL),
(1515, 4, 4, '/company-shops', '2018-03-29 05:17:59', NULL, NULL, NULL),
(1516, 4, 4, '/company-shops', '2018-03-29 05:18:00', NULL, NULL, NULL),
(1517, 4, 4, '/info', '2018-03-29 05:18:04', NULL, NULL, NULL),
(1518, 4, 4, '/info', '2018-03-29 05:18:05', NULL, NULL, NULL),
(1519, 4, 4, '/company', '2018-03-29 05:18:07', NULL, NULL, NULL),
(1520, 4, 4, '/company', '2018-03-29 05:18:07', NULL, NULL, NULL),
(1521, 4, 4, '/company-reviews', '2018-03-29 05:18:10', NULL, NULL, NULL),
(1522, 4, 4, '/company-reviews', '2018-03-29 05:18:12', NULL, NULL, NULL),
(1523, 4, 4, '/company-reviews', '2018-03-29 05:18:26', NULL, NULL, NULL),
(1524, 4, 4, '/company', '2018-03-29 05:18:28', NULL, NULL, NULL),
(1525, 4, 4, '/company', '2018-03-29 05:18:28', NULL, NULL, NULL),
(1526, 4, 4, '/company-shops', '2018-03-29 05:18:30', NULL, NULL, NULL),
(1527, 4, 4, '/company-shops', '2018-03-29 05:18:32', NULL, NULL, NULL),
(1528, 4, 4, '/shop-page/1', '2018-03-29 05:18:35', NULL, NULL, NULL),
(1529, 4, 4, '/shop-page/1', '2018-03-29 05:18:49', NULL, NULL, NULL),
(1530, 4, 4, '/shop-page/1', '2018-03-29 05:18:53', NULL, NULL, NULL),
(1531, 4, 4, '/shop-page/1', '2018-03-29 05:21:00', NULL, NULL, NULL),
(1532, 4, 4, '/shop-page/1', '2018-03-29 05:21:04', NULL, NULL, NULL),
(1533, 4, 4, '/company', '2018-03-29 05:21:06', NULL, NULL, NULL),
(1534, 4, 4, '/company', '2018-03-29 05:21:06', NULL, NULL, NULL),
(1535, 4, 4, '/company-shops', '2018-03-29 05:21:08', NULL, NULL, NULL),
(1536, 4, 4, '/company-shops', '2018-03-29 05:21:26', NULL, NULL, NULL),
(1537, 4, 4, '/shop-page/1', '2018-03-29 05:21:35', NULL, NULL, NULL),
(1538, 4, 4, '/shop-page/1', '2018-03-29 05:21:57', NULL, NULL, NULL),
(1539, 4, 4, '/company', '2018-03-29 05:22:23', NULL, NULL, NULL),
(1540, 4, 4, '/company', '2018-03-29 05:22:23', NULL, NULL, NULL),
(1541, 4, 4, '/company-shops', '2018-03-29 05:22:25', NULL, NULL, NULL),
(1542, 4, 4, '/shop-page/1', '2018-03-29 05:22:26', NULL, NULL, NULL),
(1543, 4, 4, '/shop-page/1', '2018-03-29 05:22:28', NULL, NULL, NULL),
(1544, 4, 4, '/shop-page/1', '2018-03-29 05:24:24', NULL, NULL, NULL),
(1545, 4, 4, '/company', '2018-03-29 05:24:37', NULL, NULL, NULL),
(1546, 4, 4, '/company', '2018-03-29 05:24:37', NULL, NULL, NULL),
(1547, 4, 4, '/shop-page/1', '2018-03-29 05:24:40', NULL, NULL, NULL),
(1548, 4, 4, '/shop-page/1', '2018-03-29 05:24:48', NULL, NULL, NULL),
(1549, 4, 4, '/shop-page/1', '2018-03-29 05:24:50', NULL, NULL, NULL),
(1550, 4, 4, '/shop-page/1', '2018-03-29 05:24:51', NULL, NULL, NULL),
(1551, 4, 4, '/shop-page/1', '2018-03-29 05:24:57', NULL, NULL, NULL);
INSERT INTO `views` (`id`, `visit_id`, `visitor_id`, `path`, `created`, `updated`, `activated`, `closed`) VALUES
(1552, 4, 4, '/shop-page/1', '2018-03-29 05:25:01', NULL, NULL, NULL),
(1553, 4, 4, '/shop-page/1', '2018-03-29 05:25:03', NULL, NULL, NULL),
(1554, 4, 4, '/company-shops', '2018-03-29 05:25:05', NULL, NULL, NULL),
(1555, 4, 4, '/company-reviews', '2018-03-29 05:26:30', NULL, NULL, NULL),
(1556, 4, 4, '/company-reviews', '2018-03-29 05:30:14', NULL, NULL, NULL),
(1557, 4, 4, '/', '2018-03-29 05:30:16', NULL, NULL, NULL),
(1558, 4, 4, '/info', '2018-03-29 05:30:18', NULL, NULL, NULL),
(1559, 4, 4, '/info', '2018-03-29 05:30:18', NULL, NULL, NULL),
(1560, 4, 4, '/company', '2018-03-29 05:30:46', NULL, NULL, NULL),
(1561, 4, 4, '/company', '2018-03-29 05:30:47', NULL, NULL, NULL),
(1562, 4, 4, '/vacansies', '2018-03-29 05:30:51', NULL, NULL, NULL),
(1563, 4, 4, '/vacansies', '2018-03-29 05:30:52', NULL, NULL, NULL),
(1564, 4, 4, '/vacansies', '2018-03-29 05:31:08', NULL, NULL, NULL),
(1565, 4, 4, '/company', '2018-03-29 05:31:09', NULL, NULL, NULL),
(1566, 4, 4, '/company', '2018-03-29 05:31:09', NULL, NULL, NULL),
(1567, 4, 4, '/vacansies', '2018-03-29 05:31:59', NULL, NULL, NULL),
(1568, 4, 4, '/vacansies', '2018-03-29 05:32:37', NULL, NULL, NULL),
(1569, 4, 4, '/vacansies', '2018-03-29 05:32:44', NULL, NULL, NULL),
(1570, 4, 4, '/company', '2018-03-29 05:32:46', NULL, NULL, NULL),
(1571, 4, 4, '/company', '2018-03-29 05:32:46', NULL, NULL, NULL),
(1572, 4, 4, '/info', '2018-03-29 05:32:48', NULL, NULL, NULL),
(1573, 4, 4, '/info', '2018-03-29 05:32:48', NULL, NULL, NULL),
(1574, 4, 4, '/legal-documents', '2018-03-29 05:32:50', NULL, NULL, NULL),
(1575, 4, 4, '/legal-documents', '2018-03-29 05:32:51', NULL, NULL, NULL),
(1576, 4, 4, '/legal-documents', '2018-03-29 05:33:04', NULL, NULL, NULL),
(1577, 4, 4, '/', '2018-03-29 05:33:06', NULL, NULL, NULL),
(1578, 4, 4, '/info', '2018-03-29 05:33:07', NULL, NULL, NULL),
(1579, 4, 4, '/info', '2018-03-29 05:33:07', NULL, NULL, NULL),
(1580, 4, 4, '/info-questions', '2018-03-29 05:33:10', NULL, NULL, NULL),
(1581, 4, 4, '/info-questions', '2018-03-29 05:33:11', NULL, NULL, NULL),
(1582, 4, 4, '/info-questions', '2018-03-29 05:33:13', NULL, NULL, NULL),
(1583, 4, 4, '/info-questions', '2018-03-29 05:33:15', NULL, NULL, NULL),
(1584, 4, 4, '/info-questions', '2018-03-29 05:33:16', NULL, NULL, NULL),
(1585, 4, 4, '/info-questions', '2018-03-29 05:33:16', NULL, NULL, NULL),
(1586, 4, 4, '/info-questions', '2018-03-29 05:33:16', NULL, NULL, NULL),
(1587, 4, 4, '/info-questions', '2018-03-29 05:33:17', NULL, NULL, NULL),
(1588, 4, 4, '/info-questions', '2018-03-29 05:33:18', NULL, NULL, NULL),
(1589, 4, 4, '/info-questions', '2018-03-29 05:33:19', NULL, NULL, NULL),
(1590, 4, 4, '/info-questions', '2018-03-29 05:33:27', NULL, NULL, NULL),
(1591, 4, 4, '/info-questions', '2018-03-29 05:33:29', NULL, NULL, NULL),
(1592, 4, 4, '/info-questions', '2018-03-29 05:33:34', NULL, NULL, NULL),
(1593, 4, 4, '/info-questions', '2018-03-29 05:33:36', NULL, NULL, NULL),
(1594, 4, 4, '/info-questions', '2018-03-29 05:33:38', NULL, NULL, NULL),
(1595, 4, 4, '/company', '2018-03-29 05:37:19', NULL, NULL, NULL),
(1596, 4, 4, '/company', '2018-03-29 05:37:19', NULL, NULL, NULL),
(1597, 4, 4, '/contacts', '2018-03-29 05:37:21', NULL, NULL, NULL),
(1598, 2, 2, '/company-reviews', '2018-03-29 05:42:42', NULL, NULL, NULL),
(1599, 2, 2, '/company-reviews', '2018-03-29 05:42:45', NULL, NULL, NULL),
(1600, 4, 4, '/', '2018-03-29 05:42:47', NULL, NULL, NULL),
(1601, 4, 4, '/company', '2018-03-29 05:42:49', NULL, NULL, NULL),
(1602, 4, 4, '/company', '2018-03-29 05:42:49', NULL, NULL, NULL),
(1603, 2, 2, '/company-reviews', '2018-03-29 05:42:51', NULL, NULL, NULL),
(1604, 4, 4, '/news', '2018-03-29 05:43:05', NULL, NULL, NULL),
(1605, 4, 4, '/info', '2018-03-29 05:43:07', NULL, NULL, NULL),
(1606, 4, 4, '/info', '2018-03-29 05:43:08', NULL, NULL, NULL),
(1607, 4, 4, '/info-questions', '2018-03-29 05:43:09', NULL, NULL, NULL),
(1608, 4, 4, '/info-questions', '2018-03-29 05:43:11', NULL, NULL, NULL),
(1609, 4, 4, '/info', '2018-03-29 05:43:27', NULL, NULL, NULL),
(1610, 4, 4, '/info', '2018-03-29 05:43:27', NULL, NULL, NULL),
(1611, 4, 4, '/info-questions', '2018-03-29 05:43:37', NULL, NULL, NULL),
(1612, 4, 4, '/info-questions', '2018-03-29 05:43:49', NULL, NULL, NULL),
(1613, 4, 4, '/info-questions', '2018-03-29 05:44:52', NULL, NULL, NULL),
(1614, 4, 4, '/info-questions', '2018-03-29 05:45:11', NULL, NULL, NULL),
(1615, 4, 4, '/info-questions', '2018-03-29 05:45:33', NULL, NULL, NULL),
(1616, 4, 4, '/info-questions', '2018-03-29 05:45:40', NULL, NULL, NULL),
(1617, 4, 4, '/info-questions', '2018-03-29 05:45:48', NULL, NULL, NULL),
(1618, 4, 4, '/info-questions', '2018-03-29 05:45:49', NULL, NULL, NULL),
(1619, 4, 4, '/publications', '2018-03-29 05:45:50', NULL, NULL, NULL),
(1620, 4, 4, '/publications', '2018-03-29 05:45:52', NULL, NULL, NULL),
(1621, 4, 4, '/publications', '2018-03-29 05:45:52', NULL, NULL, NULL),
(1622, 4, 4, '/publications', '2018-03-29 05:45:59', NULL, NULL, NULL),
(1623, 4, 4, '/publications', '2018-03-29 05:46:02', NULL, NULL, NULL),
(1624, 4, 4, '/publications', '2018-03-29 05:46:03', NULL, NULL, NULL),
(1625, 4, 4, '/payment-and-delivery', '2018-03-29 05:46:05', NULL, NULL, NULL),
(1626, 4, 4, '/payment-and-delivery', '2018-03-29 05:46:12', NULL, NULL, NULL),
(1627, 4, 4, '/payment-and-delivery', '2018-03-29 05:46:13', NULL, NULL, NULL),
(1628, 4, 4, '/payment-and-delivery', '2018-03-29 05:46:19', NULL, NULL, NULL),
(1629, 4, 4, '/payment-and-delivery', '2018-03-29 05:46:21', NULL, NULL, NULL),
(1630, 4, 4, '/payment-and-delivery', '2018-03-29 05:46:23', NULL, NULL, NULL),
(1631, 4, 4, '/promotions-and-offers', '2018-03-29 05:46:26', NULL, NULL, NULL),
(1632, 4, 4, '/promotions-and-offers', '2018-03-29 05:46:27', NULL, NULL, NULL),
(1633, 4, 4, '/promotions-and-offers', '2018-03-29 05:46:28', NULL, NULL, NULL),
(1634, 4, 4, '/promotions-and-offers', '2018-03-29 05:46:34', NULL, NULL, NULL),
(1635, 4, 4, '/promotions-and-offers', '2018-03-29 05:46:38', NULL, NULL, NULL),
(1636, 4, 4, '/promotions-and-offers', '2018-03-29 05:46:39', NULL, NULL, NULL),
(1637, 4, 4, '/legal-documents', '2018-03-29 05:46:41', NULL, NULL, NULL),
(1638, 4, 4, '/legal-documents', '2018-03-29 05:46:43', NULL, NULL, NULL),
(1639, 4, 4, '/legal-documents', '2018-03-29 05:46:44', NULL, NULL, NULL),
(1640, 4, 4, '/legal-documents', '2018-03-29 05:46:48', NULL, NULL, NULL),
(1641, 4, 4, '/legal-documents', '2018-03-29 05:46:50', NULL, NULL, NULL),
(1642, 4, 4, '/legal-documents', '2018-03-29 05:46:52', NULL, NULL, NULL),
(1643, 4, 4, '/info-questions', '2018-03-29 05:46:53', NULL, NULL, NULL),
(1644, 4, 4, '/legal-documents', '2018-03-29 05:46:54', NULL, NULL, NULL),
(1645, 4, 4, '/promotions-and-offers', '2018-03-29 05:46:55', NULL, NULL, NULL),
(1646, 4, 4, '/payment-and-delivery', '2018-03-29 05:46:55', NULL, NULL, NULL),
(1647, 4, 4, '/publications', '2018-03-29 05:46:56', NULL, NULL, NULL),
(1648, 4, 4, '/info-questions', '2018-03-29 05:46:56', NULL, NULL, NULL),
(1649, 4, 4, '/info', '2018-03-29 05:47:02', NULL, NULL, NULL),
(1650, 4, 4, '/info', '2018-03-29 05:47:03', NULL, NULL, NULL),
(1651, 4, 4, '/info', '2018-03-29 05:47:09', NULL, NULL, NULL),
(1652, 4, 4, '/info', '2018-03-29 05:47:10', NULL, NULL, NULL),
(1653, 4, 4, '/info-questions', '2018-03-29 05:47:10', NULL, NULL, NULL),
(1654, 4, 4, '/publications', '2018-03-29 05:47:12', NULL, NULL, NULL),
(1655, 4, 4, '/payment-and-delivery', '2018-03-29 05:47:12', NULL, NULL, NULL),
(1656, 4, 4, '/promotions-and-offers', '2018-03-29 05:47:13', NULL, NULL, NULL),
(1657, 4, 4, '/legal-documents', '2018-03-29 05:47:14', NULL, NULL, NULL),
(1658, 4, 4, '/company', '2018-03-29 05:47:30', NULL, NULL, NULL),
(1659, 4, 4, '/company', '2018-03-29 05:47:31', NULL, NULL, NULL),
(1660, 4, 4, '/company-shops', '2018-03-29 05:47:33', NULL, NULL, NULL),
(1661, 4, 4, '/shop-page/1', '2018-03-29 05:47:39', NULL, NULL, NULL),
(1662, 4, 4, '/', '2018-03-29 05:47:51', NULL, NULL, NULL),
(1663, 4, 4, '/company', '2018-03-29 05:47:53', NULL, NULL, NULL),
(1664, 4, 4, '/company', '2018-03-29 05:47:53', NULL, NULL, NULL),
(1665, 4, 4, '/info', '2018-03-29 05:48:03', NULL, NULL, NULL),
(1666, 4, 4, '/info', '2018-03-29 05:48:03', NULL, NULL, NULL),
(1667, 4, 4, '/payment-and-delivery', '2018-03-29 05:48:04', NULL, NULL, NULL),
(1668, 4, 4, '/company', '2018-03-29 06:00:21', NULL, NULL, NULL),
(1669, 4, 4, '/company', '2018-03-29 06:00:22', NULL, NULL, NULL),
(1670, 4, 4, '/news', '2018-03-29 06:00:25', NULL, NULL, NULL),
(1671, 4, 4, '/news', '2018-03-29 06:00:26', NULL, NULL, NULL),
(1672, 4, 4, '/news', '2018-03-29 06:00:29', NULL, NULL, NULL),
(1673, 4, 4, '/company', '2018-03-29 06:38:24', NULL, NULL, NULL),
(1674, 4, 4, '/company', '2018-03-29 06:38:25', NULL, NULL, NULL),
(1675, 4, 4, '/shop', '2018-03-29 06:38:26', NULL, NULL, NULL),
(1676, 4, 4, '/company', '2018-03-29 06:38:27', NULL, NULL, NULL),
(1677, 4, 4, '/company', '2018-03-29 06:38:27', NULL, NULL, NULL),
(1678, 4, 4, '/company-shops', '2018-03-29 06:38:28', NULL, NULL, NULL),
(1679, 4, 4, '/company-shops', '2018-03-29 06:38:31', NULL, NULL, NULL),
(1680, 4, 4, '/company-shops', '2018-03-29 06:38:37', NULL, NULL, NULL),
(1681, 4, 4, '/company-shops', '2018-03-29 06:38:47', NULL, NULL, NULL),
(1682, 4, 4, '/company-shops', '2018-03-29 06:38:51', NULL, NULL, NULL),
(1683, 4, 4, '/shop-page/2', '2018-03-29 06:39:01', NULL, NULL, NULL),
(1684, 4, 4, '/shop-page/2', '2018-03-29 06:39:30', NULL, NULL, NULL),
(1685, 4, 4, '/shop-page/2', '2018-03-29 06:39:39', NULL, NULL, NULL),
(1686, 4, 4, '/shop-page/2', '2018-03-29 06:39:56', NULL, NULL, NULL),
(1687, 4, 4, '/shop-page/2', '2018-03-29 06:40:09', NULL, NULL, NULL),
(1688, 4, 4, '/shop-page/2', '2018-03-29 06:40:14', NULL, NULL, NULL),
(1689, 4, 4, '/shop-page/2', '2018-03-29 06:40:21', NULL, NULL, NULL),
(1690, 4, 4, '/company-shops', '2018-03-29 06:40:23', NULL, NULL, NULL),
(1691, 4, 4, '/shop-page/1', '2018-03-29 06:40:30', NULL, NULL, NULL),
(1692, 4, 4, '/shop-page/1', '2018-03-29 06:40:37', NULL, NULL, NULL),
(1693, 4, 4, '/shop-page/1', '2018-03-29 06:40:39', NULL, NULL, NULL),
(1694, 4, 4, '/shop-page/1', '2018-03-29 06:40:46', NULL, NULL, NULL),
(1695, 4, 4, '/company-shops', '2018-03-29 06:40:57', NULL, NULL, NULL),
(1696, 4, 4, '/company-shops', '2018-03-29 06:41:07', NULL, NULL, NULL),
(1697, 4, 4, '/shop-page/3', '2018-03-29 06:41:11', NULL, NULL, NULL),
(1698, 4, 4, '/shop-page/3', '2018-03-29 06:41:50', NULL, NULL, NULL),
(1699, 4, 4, '/company-shops', '2018-03-29 06:41:58', NULL, NULL, NULL),
(1700, 4, 4, '/shop-page/4', '2018-03-29 06:43:16', NULL, NULL, NULL),
(1701, 4, 4, '/shop-page/4', '2018-03-29 06:43:18', NULL, NULL, NULL),
(1702, 2, 2, '/company', '2018-03-29 06:44:09', NULL, NULL, NULL),
(1703, 2, 2, '/company', '2018-03-29 06:44:09', NULL, NULL, NULL),
(1704, 4, 4, '/shop-page/4', '2018-03-29 06:44:48', NULL, NULL, NULL),
(1705, 4, 4, '/contacts', '2018-03-29 06:44:52', NULL, NULL, NULL),
(1706, 4, 4, '/shop', '2018-03-29 06:45:01', NULL, NULL, NULL),
(1707, 4, 4, '/company', '2018-03-29 06:45:01', NULL, NULL, NULL),
(1708, 4, 4, '/company', '2018-03-29 06:45:01', NULL, NULL, NULL),
(1709, 4, 4, '/company-shops', '2018-03-29 06:45:03', NULL, NULL, NULL),
(1710, 4, 4, '/contacts', '2018-03-29 06:45:06', NULL, NULL, NULL),
(1711, 4, 4, '/company-shops', '2018-03-29 06:45:07', NULL, NULL, NULL),
(1712, 4, 4, '/shop-page/2', '2018-03-29 06:45:17', NULL, NULL, NULL),
(1713, 4, 4, '/shop-page/2', '2018-03-29 06:45:18', NULL, NULL, NULL),
(1714, 4, 4, '/shop-page/2', '2018-03-29 06:45:25', NULL, NULL, NULL),
(1715, 4, 4, '/company-shops', '2018-03-29 06:45:27', NULL, NULL, NULL),
(1716, 4, 4, '/shop-page/3', '2018-03-29 06:45:29', NULL, NULL, NULL),
(1717, 4, 4, '/shop-page/3', '2018-03-29 06:45:30', NULL, NULL, NULL),
(1718, 4, 4, '/shop-page/3', '2018-03-29 06:45:33', NULL, NULL, NULL),
(1719, 4, 4, '/company-shops', '2018-03-29 06:45:35', NULL, NULL, NULL),
(1720, 4, 4, '/shop-page/4', '2018-03-29 06:45:36', NULL, NULL, NULL),
(1721, 4, 4, '/shop-page/4', '2018-03-29 06:45:40', NULL, NULL, NULL),
(1722, 4, 4, '/shop-page/4', '2018-03-29 06:45:43', NULL, NULL, NULL),
(1723, 4, 4, '/company-shops', '2018-03-29 06:45:44', NULL, NULL, NULL),
(1724, 4, 4, '/company-shops', '2018-03-29 06:45:46', NULL, NULL, NULL),
(1725, 4, 4, '/company-shops', '2018-03-29 06:45:49', NULL, NULL, NULL),
(1726, 4, 4, '/company-shops', '2018-03-29 06:45:50', NULL, NULL, NULL),
(1727, 4, 4, '/company-shops', '2018-03-29 06:45:52', NULL, NULL, NULL),
(1728, 4, 4, '/company-shops', '2018-03-29 06:45:53', NULL, NULL, NULL),
(1729, 4, 4, '/company-shops', '2018-03-29 06:45:56', NULL, NULL, NULL),
(1730, 4, 4, '/company-shops', '2018-03-29 07:48:09', NULL, NULL, NULL),
(1731, 4, 4, '/achievements', '2018-03-29 07:49:19', NULL, NULL, NULL),
(1732, 4, 4, '/company', '2018-03-29 07:49:20', NULL, NULL, NULL),
(1733, 4, 4, '/company', '2018-03-29 07:49:21', NULL, NULL, NULL),
(1734, 4, 4, '/info', '2018-03-29 07:49:21', NULL, NULL, NULL),
(1735, 4, 4, '/info', '2018-03-29 07:49:21', NULL, NULL, NULL),
(1736, 4, 4, '/info-questions', '2018-03-29 07:49:22', NULL, NULL, NULL),
(1737, 4, 4, '/info-questions', '2018-03-29 07:50:34', NULL, NULL, NULL),
(1738, 4, 4, '/info-questions', '2018-03-29 07:50:35', NULL, NULL, NULL),
(1739, 4, 4, '/info-questions', '2018-03-29 07:50:37', NULL, NULL, NULL),
(1740, 4, 4, '/publications', '2018-03-29 07:50:39', NULL, NULL, NULL),
(1741, 4, 4, '/payment-and-delivery', '2018-03-29 07:50:40', NULL, NULL, NULL),
(1742, 4, 4, '/promotions-and-offers', '2018-03-29 07:50:40', NULL, NULL, NULL),
(1743, 4, 4, '/legal-documents', '2018-03-29 07:50:41', NULL, NULL, NULL),
(1744, 4, 4, '/info-questions', '2018-03-29 07:50:42', NULL, NULL, NULL),
(1745, 4, 4, '/info-questions', '2018-03-29 08:14:01', NULL, NULL, NULL),
(1746, 4, 4, '/info-questions', '2018-03-29 08:14:02', NULL, NULL, NULL),
(1747, 4, 4, '/', '2018-03-29 08:14:03', NULL, NULL, NULL),
(1748, 4, 4, '/company', '2018-03-29 08:14:03', NULL, NULL, NULL),
(1749, 4, 4, '/company', '2018-03-29 08:14:04', NULL, NULL, NULL),
(1750, 4, 4, '/policy', '2018-03-29 08:14:07', NULL, NULL, NULL),
(1751, 4, 4, '/policy', '2018-03-29 08:14:08', NULL, NULL, NULL),
(1752, 4, 4, '/policy', '2018-03-29 08:14:10', NULL, NULL, NULL),
(1753, 4, 4, '/policy', '2018-03-29 08:14:15', NULL, NULL, NULL),
(1754, 4, 4, '/policy', '2018-03-29 08:14:17', NULL, NULL, NULL),
(1755, 4, 4, '/company', '2018-03-29 08:14:19', NULL, NULL, NULL),
(1756, 4, 4, '/company', '2018-03-29 08:14:19', NULL, NULL, NULL),
(1757, 4, 4, '/vacansies', '2018-03-29 08:14:23', NULL, NULL, NULL),
(1758, 4, 4, '/vacansies', '2018-03-29 08:14:26', NULL, NULL, NULL),
(1759, 4, 4, '/vacansies', '2018-03-29 08:14:27', NULL, NULL, NULL),
(1760, 4, 4, '/vacansies', '2018-03-29 08:14:30', NULL, NULL, NULL),
(1761, 4, 4, '/vacansies', '2018-03-29 08:14:32', NULL, NULL, NULL),
(1762, 4, 4, '/vacansies', '2018-03-29 08:14:33', NULL, NULL, NULL),
(1763, 4, 4, '/vacansies', '2018-03-29 08:14:35', NULL, NULL, NULL),
(1764, 4, 4, '/company', '2018-03-29 08:14:40', NULL, NULL, NULL),
(1765, 4, 4, '/company', '2018-03-29 08:14:40', NULL, NULL, NULL),
(1766, 4, 4, '/vacansies', '2018-03-29 08:14:44', NULL, NULL, NULL),
(1767, 4, 4, '/vacansies', '2018-03-29 08:14:46', NULL, NULL, NULL),
(1768, 4, 4, '/vacansies', '2018-03-29 08:14:48', NULL, NULL, NULL),
(1769, 4, 4, '/vacansies', '2018-03-29 08:14:49', NULL, NULL, NULL),
(1770, 4, 4, '/vacansies', '2018-03-29 08:14:53', NULL, NULL, NULL),
(1771, 4, 4, '/vacansies', '2018-03-29 08:15:01', NULL, NULL, NULL),
(1772, 4, 4, '/vacansies', '2018-03-29 08:15:02', NULL, NULL, NULL),
(1773, 4, 4, '/company', '2018-03-29 08:15:03', NULL, NULL, NULL),
(1774, 4, 4, '/company', '2018-03-29 08:15:03', NULL, NULL, NULL),
(1775, 4, 4, '/vacansies', '2018-03-29 08:15:06', NULL, NULL, NULL),
(1776, 4, 4, '/vacansies', '2018-03-29 08:15:10', NULL, NULL, NULL),
(1777, 4, 4, '/vacansies', '2018-03-29 08:15:17', NULL, NULL, NULL),
(1778, 4, 4, '/vacansies', '2018-03-29 08:15:23', NULL, NULL, NULL),
(1779, 4, 4, '/vacansies', '2018-03-29 08:15:24', NULL, NULL, NULL),
(1780, 4, 4, '/vacansies', '2018-03-29 08:15:27', NULL, NULL, NULL),
(1781, 4, 4, '/vacansies', '2018-03-29 08:15:30', NULL, NULL, NULL),
(1782, 4, 4, '/vacansies', '2018-03-29 08:15:32', NULL, NULL, NULL),
(1783, 4, 4, '/vacansies', '2018-03-29 08:15:34', NULL, NULL, NULL),
(1784, 4, 4, '/vacansies', '2018-03-29 08:15:35', NULL, NULL, NULL),
(1785, 4, 4, '/vacansies', '2018-03-29 08:15:36', NULL, NULL, NULL),
(1786, 4, 4, '/vacansies', '2018-03-29 08:15:38', NULL, NULL, NULL),
(1787, 4, 4, '/vacansies', '2018-03-29 08:15:46', NULL, NULL, NULL),
(1788, 4, 4, '/vacansies', '2018-03-29 08:15:51', NULL, NULL, NULL),
(1789, 4, 4, '/vacansies', '2018-03-29 08:15:55', NULL, NULL, NULL),
(1790, 4, 4, '/vacansies', '2018-03-29 08:15:56', NULL, NULL, NULL),
(1791, 4, 4, '/vacansies', '2018-03-29 08:16:00', NULL, NULL, NULL),
(1792, 4, 4, '/', '2018-03-29 08:16:01', NULL, NULL, NULL),
(1793, 4, 4, '/company', '2018-03-29 08:16:03', NULL, NULL, NULL),
(1794, 4, 4, '/company', '2018-03-29 08:16:04', NULL, NULL, NULL),
(1795, 4, 4, '/company', '2018-03-29 08:16:05', NULL, NULL, NULL),
(1796, 4, 4, '/company', '2018-03-29 08:16:05', NULL, NULL, NULL),
(1797, 4, 4, '/vacansies', '2018-03-29 08:16:08', NULL, NULL, NULL),
(1798, 4, 4, '/vacansies', '2018-03-29 08:16:09', NULL, NULL, NULL),
(1799, 4, 4, '/vacansies', '2018-03-29 08:16:18', NULL, NULL, NULL),
(1800, 4, 4, '/vacansies', '2018-03-29 08:16:27', NULL, NULL, NULL),
(1801, 4, 4, '/vacansies', '2018-03-29 08:16:36', NULL, NULL, NULL),
(1802, 4, 4, '/vacansies', '2018-03-29 08:16:52', NULL, NULL, NULL),
(1803, 4, 4, '/vacansies', '2018-03-29 08:17:08', NULL, NULL, NULL),
(1804, 4, 4, '/vacansies', '2018-03-29 08:17:18', NULL, NULL, NULL),
(1805, 4, 4, '/vacansies', '2018-03-29 08:17:28', NULL, NULL, NULL),
(1806, 4, 4, '/vacansies', '2018-03-29 08:17:34', NULL, NULL, NULL),
(1807, 4, 4, '/director', '2018-03-29 08:17:36', NULL, NULL, NULL),
(1808, 4, 4, '/vacansies', '2018-03-29 08:17:36', NULL, NULL, NULL),
(1809, 4, 4, '/company-reviews', '2018-03-29 08:17:37', NULL, NULL, NULL),
(1810, 4, 4, '/company-reviews', '2018-03-29 08:17:39', NULL, NULL, NULL),
(1811, 4, 4, '/company-reviews', '2018-03-29 08:17:40', NULL, NULL, NULL),
(1812, 4, 4, '/company-reviews', '2018-03-29 08:17:43', NULL, NULL, NULL),
(1813, 4, 4, '/company-reviews', '2018-03-29 08:17:45', NULL, NULL, NULL),
(1814, 4, 4, '/company-reviews', '2018-03-29 08:17:47', NULL, NULL, NULL),
(1815, 4, 4, '/company-reviews', '2018-03-29 08:17:48', NULL, NULL, NULL),
(1816, 4, 4, '/contacts', '2018-03-29 08:17:49', NULL, NULL, NULL),
(1817, 4, 4, '/achievements', '2018-03-29 08:17:50', NULL, NULL, NULL),
(1818, 4, 4, '/company-shops', '2018-03-29 08:17:51', NULL, NULL, NULL),
(1819, 4, 4, '/policy', '2018-03-29 08:17:52', NULL, NULL, NULL),
(1820, 4, 4, '/company-history', '2018-03-29 08:17:52', NULL, NULL, NULL),
(1821, 4, 4, '/news', '2018-03-29 08:17:53', NULL, NULL, NULL),
(1822, 4, 4, '/company-shops', '2018-03-29 08:17:53', NULL, NULL, NULL),
(1823, 4, 4, '/achievements', '2018-03-29 08:17:55', NULL, NULL, NULL),
(1824, 4, 4, '/contacts', '2018-03-29 08:17:55', NULL, NULL, NULL),
(1825, 4, 4, '/company-reviews', '2018-03-29 08:17:57', NULL, NULL, NULL),
(1826, 4, 4, '/vacansies', '2018-03-29 08:17:58', NULL, NULL, NULL),
(1827, 4, 4, '/director', '2018-03-29 08:17:59', NULL, NULL, NULL),
(1828, 4, 4, '/company-reviews', '2018-03-29 08:18:00', NULL, NULL, NULL),
(1829, 4, 4, '/company-reviews', '2018-03-29 08:18:01', NULL, NULL, NULL),
(1830, 4, 4, '/company-reviews', '2018-03-29 08:18:05', NULL, NULL, NULL),
(1831, 4, 4, '/info', '2018-03-29 08:18:07', NULL, NULL, NULL),
(1832, 4, 4, '/info', '2018-03-29 08:18:07', NULL, NULL, NULL),
(1833, 4, 4, '/info-questions', '2018-03-29 08:18:08', NULL, NULL, NULL),
(1834, 4, 4, '/publications', '2018-03-29 08:18:09', NULL, NULL, NULL),
(1835, 4, 4, '/payment-and-delivery', '2018-03-29 08:18:10', NULL, NULL, NULL),
(1836, 4, 4, '/promotions-and-offers', '2018-03-29 08:18:10', NULL, NULL, NULL),
(1837, 4, 4, '/legal-documents', '2018-03-29 08:18:11', NULL, NULL, NULL),
(1838, 4, 4, '/legal-documents', '2018-03-29 08:18:12', NULL, NULL, NULL),
(1839, 4, 4, '/legal-documents', '2018-03-29 08:18:13', NULL, NULL, NULL),
(1840, 4, 4, '/company', '2018-03-29 08:21:09', NULL, NULL, NULL),
(1841, 4, 4, '/company', '2018-03-29 08:21:10', NULL, NULL, NULL),
(1842, 4, 4, '/company', '2018-03-29 08:25:30', NULL, NULL, NULL),
(1843, 4, 4, '/company', '2018-03-29 08:25:30', NULL, NULL, NULL),
(1844, 4, 4, '/contacts', '2018-03-29 08:25:34', NULL, NULL, NULL),
(1845, 4, 4, '/contacts', '2018-03-29 08:25:36', NULL, NULL, NULL),
(1846, 4, 4, '/achievements', '2018-03-29 08:25:36', NULL, NULL, NULL),
(1847, 4, 4, '/company-reviews', '2018-03-29 08:25:38', NULL, NULL, NULL),
(1848, 4, 4, '/contacts', '2018-03-29 08:25:38', NULL, NULL, NULL),
(1849, 4, 4, '/vacansies', '2018-03-29 08:25:39', NULL, NULL, NULL),
(1850, 4, 4, '/vacansies', '2018-03-29 08:25:41', NULL, NULL, NULL),
(1851, 4, 4, '/vacansies', '2018-03-29 08:25:45', NULL, NULL, NULL),
(1852, 4, 4, '/promotions-and-offers', '2018-03-29 08:25:48', NULL, NULL, NULL),
(1853, 4, 4, '/payment-and-delivery', '2018-03-29 08:25:49', NULL, NULL, NULL),
(1854, 4, 4, '/publications', '2018-03-29 08:25:49', NULL, NULL, NULL),
(1855, 4, 4, '/legal-documents', '2018-03-29 08:25:50', NULL, NULL, NULL),
(1856, 4, 4, '/legal-documents', '2018-03-29 08:25:50', NULL, NULL, NULL),
(1857, 4, 4, '/legal-documents', '2018-03-29 08:25:53', NULL, NULL, NULL),
(1858, 4, 4, '/vacansies', '2018-03-29 09:13:49', NULL, NULL, NULL),
(1859, 4, 4, '/vacansies', '2018-03-29 09:13:50', NULL, NULL, NULL),
(1860, 4, 4, '/policy', '2018-03-29 09:13:51', NULL, NULL, NULL),
(1861, 4, 4, '/policy', '2018-03-29 09:13:52', NULL, NULL, NULL),
(1862, 4, 4, '/company-shops', '2018-03-29 09:13:52', NULL, NULL, NULL),
(1863, 4, 4, '/shop-page/1', '2018-03-29 09:13:54', NULL, NULL, NULL),
(1864, 4, 4, '/promotions-and-offers', '2018-03-29 09:15:04', NULL, NULL, NULL),
(1865, 4, 4, '/payment-and-delivery', '2018-03-29 09:15:05', NULL, NULL, NULL),
(1866, 4, 4, '/publications', '2018-03-29 09:15:05', NULL, NULL, NULL),
(1867, 4, 4, '/info-questions', '2018-03-29 09:15:05', NULL, NULL, NULL),
(1868, 4, 4, '/info-questions', '2018-03-29 09:15:07', NULL, NULL, NULL),
(1869, 4, 4, '/info-questions', '2018-03-29 09:15:28', NULL, NULL, NULL),
(1870, 4, 4, '/info-questions', '2018-03-29 09:15:30', NULL, NULL, NULL),
(1871, 4, 4, '/info-questions', '2018-03-29 09:15:40', NULL, NULL, NULL),
(1872, 4, 4, '/info-questions', '2018-03-29 09:37:53', NULL, NULL, NULL),
(1873, 4, 4, '/info-questions', '2018-03-29 09:37:54', NULL, NULL, NULL),
(1874, 4, 4, '/', '2018-03-29 09:37:55', NULL, NULL, NULL),
(1875, 4, 4, '/', '2018-03-29 09:37:58', NULL, NULL, NULL),
(1876, 4, 4, '/', '2018-03-29 09:37:59', NULL, NULL, NULL),
(1877, 4, 4, '/', '2018-03-29 09:38:00', NULL, NULL, NULL),
(1878, 4, 4, '/company', '2018-03-29 09:38:01', NULL, NULL, NULL),
(1879, 4, 4, '/company', '2018-03-29 09:38:01', NULL, NULL, NULL),
(1880, 4, 4, '/news', '2018-03-29 09:38:06', NULL, NULL, NULL),
(1881, 4, 4, '/news', '2018-03-29 09:38:07', NULL, NULL, NULL),
(1882, 4, 4, '/news', '2018-03-29 09:57:51', NULL, NULL, NULL),
(1883, 4, 4, '/shop-page/1', '2018-03-29 09:57:52', NULL, NULL, NULL);

--
-- Триггеры `views`
--
DROP TRIGGER IF EXISTS `add_views_count_to_visit`;
DELIMITER //
CREATE TRIGGER `add_views_count_to_visit` AFTER INSERT ON `views`
 FOR EACH ROW UPDATE visits SET count_views = count_views + 1 WHERE id = NEW.visit_id
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `visitors`
--

CREATE TABLE IF NOT EXISTS `visitors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Пользователи' AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `visitors`
--

INSERT INTO `visitors` (`id`, `name`, `created`) VALUES
(1, NULL, '2018-03-27 05:11:45'),
(2, NULL, '2018-03-27 05:17:12'),
(3, NULL, '2018-03-27 05:22:50'),
(4, NULL, '2018-03-27 06:51:44'),
(5, NULL, '2018-03-28 12:24:43'),
(6, NULL, '2018-03-28 18:39:30');

-- --------------------------------------------------------

--
-- Структура таблицы `visits`
--

CREATE TABLE IF NOT EXISTS `visits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `visitor_id` int(10) unsigned NOT NULL COMMENT 'Идентификатор визита',
  `count_views` int(11) NOT NULL DEFAULT '0',
  `visitor_ip` varchar(55) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `closed` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `visits`
--

INSERT INTO `visits` (`id`, `visitor_id`, `count_views`, `visitor_ip`, `created`, `updated`, `closed`) VALUES
(1, 1, 10, '192.168.50.50', '2018-03-27 05:11:45', NULL, NULL),
(2, 2, 709, '185.20.179.12', '2018-03-27 05:17:12', NULL, NULL),
(3, 3, 1, '185.20.179.12', '2018-03-27 05:22:50', NULL, NULL),
(4, 4, 1090, '185.20.179.12', '2018-03-27 06:51:44', NULL, NULL),
(5, 5, 4, '85.140.19.139', '2018-03-28 12:24:43', NULL, NULL),
(6, 6, 69, '192.168.50.50', '2018-03-28 18:39:30', NULL, NULL);

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `components`
--
ALTER TABLE `components`
  ADD CONSTRAINT `components_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `fragments_blocks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `fragments`
--
ALTER TABLE `fragments`
  ADD CONSTRAINT `fragments_ibfk_1` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fragments_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `fragments_data`
--
ALTER TABLE `fragments_data`
  ADD CONSTRAINT `fragments_data_ibfk_1` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fragments_data_ibfk_2` FOREIGN KEY (`fragment_id`) REFERENCES `fragments` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `goods_cats`
--
ALTER TABLE `goods_cats`
  ADD CONSTRAINT `goods_cats_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `goods_cats` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `goods_pos`
--
ALTER TABLE `goods_pos`
  ADD CONSTRAINT `goods_pos_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `goods_cats` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `goods_pos_ibfk_2` FOREIGN KEY (`main_photo`) REFERENCES `photos` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `goods_props_bind_values`
--
ALTER TABLE `goods_props_bind_values`
  ADD CONSTRAINT `goods_props_bind_values_ibfk_1` FOREIGN KEY (`good_id`) REFERENCES `goods_pos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `goods_props_bind_values_ibfk_2` FOREIGN KEY (`prop_id`) REFERENCES `goods_props` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `goods_props_bind_values_ibfk_3` FOREIGN KEY (`prop_value_id`) REFERENCES `goods_props_values` (`id`) ON DELETE CASCADE;

--
-- Ограничения внешнего ключа таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `menu_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `orders_goods`
--
ALTER TABLE `orders_goods`
  ADD CONSTRAINT `orders_goods_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `routes_ibfk_2` FOREIGN KEY (`access`) REFERENCES `routes_access` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `routes_ibfk_3` FOREIGN KEY (`menu_id`) REFERENCES `menu_groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `routes_aliases`
--
ALTER TABLE `routes_aliases`
  ADD CONSTRAINT `routes_aliases_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
