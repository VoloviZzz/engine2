SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
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
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

INSERT INTO `clients` (`id`, `admin`, `root`, `confirmed`, `surname`, `firstname`, `patronymic`, `name`, `phone`, `password`, `mail`, `address`, `created`) VALUES
(8, 1, 1, 1, 'root', 'root', 'root', 'root', '+7(999)-999-99-99', '202cb962ac59075b964b07152d234b70', '', NULL, '2018-01-25 06:54:10');

CREATE TABLE `components` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `ctrl` varchar(64) DEFAULT NULL,
  `block_id` int(11) DEFAULT NULL,
  `static` tinyint(1) NOT NULL,
  `once` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Единственный на странице',
  `styles` text,
  `scripts` text,
  `default_config` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `components` (`id`, `title`, `ctrl`, `block_id`, `static`, `once`, `styles`, `scripts`, `default_config`, `created`) VALUES
(1, 'Управление маршрутами', 'routes-list', 2, 0, 0, NULL, NULL, NULL, '2018-01-10 08:58:25'),
(2, 'Статический контент', NULL, NULL, 1, 0, NULL, NULL, '{\"body\": \"\"}', '2018-01-10 09:22:25'),
(3, 'Главный слайдер', 'main-slider', 4, 0, 1, NULL, NULL, '{\"slides\":[], \"lastId\": 0}', '2018-01-10 12:17:53'),
(4, 'Страница авторизации', 'login-page', NULL, 0, 1, NULL, NULL, NULL, '2018-01-15 07:19:51'),
(5, 'Отображение новости', 'news-id', 2, 0, 0, NULL, NULL, NULL, '2018-01-24 06:34:23'),
(6, 'Список новостей', 'news-list', 2, 0, 0, NULL, NULL, NULL, '2018-01-24 08:34:58'),
(7, 'Управление клиентами', 'clients-manage', 2, 0, 0, NULL, NULL, NULL, '2018-01-25 07:28:54'),
(8, 'Пустой блок', NULL, NULL, 1, 0, NULL, NULL, '{\"body\": \"\"}', '2018-01-26 07:34:57'),
(9, 'Объявления краткий список', 'announcements-short-list', 3, 0, 0, NULL, NULL, NULL, '2018-01-26 08:00:33'),
(10, 'Слайдер для магазина', 'shop-slider', 4, 0, 1, NULL, NULL, '{\"slides\":[], \"lastId\": 0}', '2018-01-29 06:52:55'),
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
(32, 'Заголовок страницы', 'page-title', NULL, 0, 0, NULL, NULL, '{\"body\": \"\"}', '2018-03-10 14:27:06'),
(33, 'Отображение посещаемости', 'attendance-view', 2, 0, 0, NULL, NULL, NULL, '2018-03-10 15:09:21');

CREATE TABLE `confirmed_emails` (
  `id` int(11) NOT NULL,
  `hash` varchar(75) NOT NULL,
  `client_id` int(11) NOT NULL,
  `checked` int(11) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

CREATE TABLE `confirmed_phones` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `phone` varchar(25) NOT NULL,
  `code` int(6) NOT NULL,
  `confirmed` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(70) NOT NULL DEFAULT 'Новый документ',
  `text` text,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `fragments` (
  `id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL DEFAULT '2',
  `route_id` int(11) NOT NULL,
  `block_id` int(11) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `fragments` (`id`, `component_id`, `route_id`, `block_id`, `priority`, `created`) VALUES
(2, 4, 61, 4, 1, '2018-03-19 11:06:56'),
(3, 1, 40, 2, 1, '2018-03-19 11:07:07');

CREATE TABLE `fragments_blocks` (
  `id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `fragments_blocks` (`id`, `title`, `created`) VALUES
(1, 'Навигация', '2018-01-26 07:24:36'),
(2, 'Контент', '2018-01-26 07:24:43'),
(3, 'Информативный', '2018-01-26 07:24:48'),
(4, 'Вся часть страницы', '2018-01-29 09:06:38');

CREATE TABLE `fragments_data` (
  `id` int(11) NOT NULL,
  `component_id` int(11) DEFAULT NULL COMMENT 'Для повторного использования данных внутри компонента',
  `fragment_id` int(11) NOT NULL COMMENT 'Для привязки данных к определенному фрагменту',
  `data` text NOT NULL COMMENT 'Сами данные',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `global_site_config` (
  `id` int(11) NOT NULL,
  `title` varchar(60) DEFAULT NULL,
  `target` varchar(60) NOT NULL,
  `value` text NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1 - текст, 2 - число, 3 - логическое, 4 - json, 5 - ссылка на изображение',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `global_site_config` (`id`, `title`, `target`, `value`, `type`, `created`, `updated`) VALUES
(1, '', 'siteLogo', '/uploads/logo.png', 1, '2018-03-19 11:05:40', NULL);

CREATE TABLE `goods_cats` (
  `id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `description` text,
  `img` text COMMENT 'Фото для слайдера',
  `parent_id` int(11) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `goods_pos` (
  `id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `price` decimal(11,2) NOT NULL DEFAULT '999999999.99',
  `count` int(11) NOT NULL DEFAULT '0',
  `reserv` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Зарезервировано в заказах',
  `cat_id` int(11) NOT NULL,
  `main_photo` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `goods_props` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT 'Новый параметр',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Содержит названия параметров товаров';

CREATE TABLE `goods_props_bind_values` (
  `id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `prop_id` int(11) NOT NULL,
  `prop_value_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Содержит связь параметров товара с товаром';

CREATE TABLE `goods_props_values` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT 'Новое значение',
  `prop_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Содержит значения параметров товаров';

CREATE TABLE `header_nav` (
  `id` int(11) NOT NULL,
  `title` varchar(70) NOT NULL DEFAULT 'Новый пункт меню',
  `href` varchar(70) NOT NULL DEFAULT '#',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `menu_groups` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT 'Новая группа',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `href` text,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `route_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL DEFAULT 'Новая новость',
  `text` text,
  `counter_views` int(11) NOT NULL DEFAULT '0',
  `published` timestamp NULL DEFAULT NULL,
  `creator` int(11) NOT NULL,
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `hash` varchar(40) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `manager_id` int(10) UNSIGNED DEFAULT NULL COMMENT 'Менеджер, обработавший заказ',
  `surname` varchar(60) NOT NULL,
  `firstname` varchar(60) NOT NULL,
  `patronymic` varchar(60) DEFAULT NULL,
  `status` int(10) UNSIGNED NOT NULL DEFAULT '1' COMMENT 'Статус заказа: 1 - новый, 2 - в работе, 3 - завершен',
  `paid_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Состояние оплаты',
  `payed_sum` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT 'Выплаченная сумма',
  `email` varchar(70) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `price` decimal(11,2) NOT NULL COMMENT 'Общая стоимость',
  `deliveryMethod` int(11) NOT NULL,
  `paymentMethod` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `orders_goods` (
  `id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `count` int(11) NOT NULL COMMENT 'Количество в заказе',
  `price` decimal(11,2) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `price` decimal(11,2) UNSIGNED NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `target` varchar(25) DEFAULT NULL,
  `target_id` int(10) UNSIGNED DEFAULT NULL,
  `path` text NOT NULL,
  `name` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `questions` (
  `id` int(11) NOT NULL COMMENT 'ид',
  `type` varchar(8) NOT NULL COMMENT 'тип записи',
  `category_id` int(11) NOT NULL DEFAULT '6' COMMENT 'id родительской категории',
  `author` smallint(5) UNSIGNED DEFAULT NULL,
  `question` text NOT NULL COMMENT 'вопрос',
  `answer` text COMMENT 'ответ',
  `public` int(2) NOT NULL DEFAULT '0' COMMENT 'Публиковать',
  `creator` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='faq';

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `target_type` varchar(50) DEFAULT NULL,
  `target_id` int(10) UNSIGNED DEFAULT NULL,
  `text` text NOT NULL,
  `published` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Опубликован или нет',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT 'Новый маршрут',
  `url` varchar(255) NOT NULL,
  `template_id` int(11) DEFAULT '1',
  `menu_id` int(11) DEFAULT NULL,
  `show_title` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Показывать или скрывать тайтл на странице',
  `use_component_title` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Использовать заголовок из компонента или нет',
  `access` int(11) DEFAULT '1',
  `dynamic` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Обязательный маршрут или нет. Обязательные нельзя удалять',
  `edit_access` tinyint(4) NOT NULL DEFAULT '1',
  `delete_access` tinyint(4) NOT NULL DEFAULT '1',
  `seo_keywords` text,
  `seo_description` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `routes` (`id`, `title`, `url`, `template_id`, `menu_id`, `show_title`, `use_component_title`, `access`, `dynamic`, `required`, `edit_access`, `delete_access`, `seo_keywords`, `seo_description`, `created`, `updated`) VALUES
(32, 'Главная страница', '/', 1, NULL, 1, 0, 1, 0, 1, 1, 1, '', '', '2018-01-17 10:11:31', '2018-01-26 05:24:17'),
(40, 'Администрирование', '/admin', 2, NULL, 1, 0, 3, 0, 1, 1, 1, '', '', '2018-01-20 20:43:27', '2018-02-02 10:14:51'),
(49, 'Управление маршрутами', '/admin-routes', 2, NULL, 1, 0, 3, 0, 1, 1, 1, '', '', '2018-01-25 07:14:47', '2018-01-25 09:11:00'),
(50, 'Управление клиентами', '/admin-clients', 2, NULL, 1, 0, 3, 0, 1, 1, 1, '', '', '2018-01-25 07:15:29', '2018-01-25 07:15:50'),
(51, 'Посещаемость', '/admin-attendance', 2, NULL, 1, 0, 3, 0, 1, 1, 1, '', '', '2018-01-25 08:34:36', '2018-01-25 08:34:49'),
(61, 'Авторизация', '/login', 1, NULL, 1, 0, 1, 0, 1, 0, 0, '', '', '2018-01-25 11:49:17', '2018-01-25 12:00:21'),
(67, 'Управление компонентами', '/admin-components', 2, NULL, 1, 0, 3, 0, 1, 1, 1, '', '', '2018-02-05 17:38:19', '2018-02-08 09:11:39'),
(70, 'Глобальные переменные', '/admin-globals', 2, NULL, 1, 0, 3, 0, 1, 1, 1, '', '', '2018-02-07 11:31:36', '2018-02-07 11:32:01');

CREATE TABLE `routes_access` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `routes_access` (`id`, `title`) VALUES
(1, 'Публичный маршрут'),
(2, 'Только авторизованным пользователям'),
(3, 'Только для администратора');

CREATE TABLE `routes_aliases` (
  `id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `target` varchar(64) NOT NULL,
  `target_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `shops_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(70) DEFAULT NULL,
  `main_photo` text,
  `text` text,
  `address` varchar(250) DEFAULT NULL,
  `phones` varchar(255) DEFAULT NULL,
  `schedule` text COMMENT 'График работы',
  `coords` varchar(255) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `social_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(60) NOT NULL DEFAULT 'Новая ссылка',
  `icon` varchar(20) DEFAULT 'fa-question',
  `href` varchar(100) NOT NULL DEFAULT '#',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ссылки на социальные сети';

CREATE TABLE `templates` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT 'Новый шаблон',
  `name` varchar(64) DEFAULT NULL COMMENT 'Название файла шаблона',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `templates` (`id`, `title`, `name`, `created`) VALUES
(1, 'Пустая страница', 'empty', '2018-01-12 05:06:14'),
(2, 'Трёхколоночный макет страницы', 'three-column', '2018-01-12 05:06:48');

CREATE TABLE `vacancies` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(70) NOT NULL DEFAULT 'Новая вакансия',
  `text` text,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `views` (
  `id` int(10) UNSIGNED NOT NULL,
  `visit_id` int(10) UNSIGNED NOT NULL COMMENT 'Идентификатор визита',
  `visitor_id` int(10) UNSIGNED DEFAULT NULL,
  `path` varchar(155) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `activated` timestamp NULL DEFAULT NULL,
  `closed` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
DELIMITER $$
CREATE TRIGGER `add_views_count_to_visit` AFTER INSERT ON `views` FOR EACH ROW UPDATE visits SET count_views = count_views + 1 WHERE id = NEW.visit_id
$$
DELIMITER ;

CREATE TABLE `visitors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пользователи';

CREATE TABLE `visits` (
  `id` int(10) UNSIGNED NOT NULL,
  `visitor_id` int(10) UNSIGNED NOT NULL COMMENT 'Идентификатор визита',
  `count_views` int(11) NOT NULL DEFAULT '0',
  `visitor_ip` varchar(55) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `closed` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `components`
  ADD PRIMARY KEY (`id`),
  ADD KEY `block_id` (`block_id`);

ALTER TABLE `confirmed_emails`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `confirmed_phones`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `fragments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fragments_ibfk_1` (`component_id`),
  ADD KEY `fragments_ibfk_2` (`route_id`);

ALTER TABLE `fragments_blocks`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `fragments_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `component_id` (`component_id`),
  ADD KEY `fragments_data_ibfk_2` (`fragment_id`);

ALTER TABLE `global_site_config`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `goods_cats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_cats_ibfk_1` (`parent_id`);

ALTER TABLE `goods_pos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`),
  ADD KEY `goods_pos_ibfk_2` (`main_photo`);

ALTER TABLE `goods_props`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `goods_props_bind_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `good_id` (`good_id`),
  ADD KEY `prop_id` (`prop_id`),
  ADD KEY `prop_value_id` (`prop_value_id`);

ALTER TABLE `goods_props_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prop_id` (`prop_id`);

ALTER TABLE `header_nav`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `menu_groups`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `menu_items_ibfk_1` (`group_id`);

ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_ibfk_1` (`client_id`);

ALTER TABLE `orders_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `good_id` (`good_id`),
  ADD KEY `order_id` (`order_id`);

ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_id` (`template_id`),
  ADD KEY `access` (`access`),
  ADD KEY `menu_id` (`menu_id`);

ALTER TABLE `routes_access`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `routes_aliases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `route_id` (`route_id`);

ALTER TABLE `shops_list`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `vacancies`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `views`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

ALTER TABLE `components`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

ALTER TABLE `confirmed_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `confirmed_phones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `fragments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `fragments_blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

ALTER TABLE `fragments_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `global_site_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

ALTER TABLE `goods_cats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `goods_pos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `goods_props`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `goods_props_bind_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `goods_props_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `header_nav`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `menu_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `orders_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ид';

ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

ALTER TABLE `routes_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

ALTER TABLE `routes_aliases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `shops_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `social_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

ALTER TABLE `vacancies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `views`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `visitors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `visits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;


ALTER TABLE `components`
  ADD CONSTRAINT `components_ibfk_1` FOREIGN KEY (`block_id`) REFERENCES `fragments_blocks` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `fragments`
  ADD CONSTRAINT `fragments_ibfk_1` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fragments_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `fragments_data`
  ADD CONSTRAINT `fragments_data_ibfk_1` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fragments_data_ibfk_2` FOREIGN KEY (`fragment_id`) REFERENCES `fragments` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `goods_cats`
  ADD CONSTRAINT `goods_cats_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `goods_cats` (`id`) ON DELETE CASCADE;

ALTER TABLE `goods_pos`
  ADD CONSTRAINT `goods_pos_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `goods_cats` (`id`) ON DELETE NO ACTION,
  ADD CONSTRAINT `goods_pos_ibfk_2` FOREIGN KEY (`main_photo`) REFERENCES `photos` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

ALTER TABLE `goods_props_bind_values`
  ADD CONSTRAINT `goods_props_bind_values_ibfk_1` FOREIGN KEY (`good_id`) REFERENCES `goods_pos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `goods_props_bind_values_ibfk_2` FOREIGN KEY (`prop_id`) REFERENCES `goods_props` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `goods_props_bind_values_ibfk_3` FOREIGN KEY (`prop_value_id`) REFERENCES `goods_props_values` (`id`) ON DELETE CASCADE;

ALTER TABLE `menu_items`
  ADD CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `menu_groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;

ALTER TABLE `orders_goods`
  ADD CONSTRAINT `orders_goods_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

ALTER TABLE `routes`
  ADD CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `routes_ibfk_2` FOREIGN KEY (`access`) REFERENCES `routes_access` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `routes_ibfk_3` FOREIGN KEY (`menu_id`) REFERENCES `menu_groups` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE `routes_aliases`
  ADD CONSTRAINT `routes_aliases_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
