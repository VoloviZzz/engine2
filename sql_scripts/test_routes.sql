-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 14 2018 г., 12:32
-- Версия сервера: 5.7.19-log
-- Версия PHP: 7.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test_routes`
--

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

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

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`id`, `admin`, `root`, `confirmed`, `surname`, `firstname`, `patronymic`, `name`, `phone`, `password`, `mail`, `address`, `created`) VALUES
(8, 1, 1, 1, 'Зуев', 'Никита', 'Дмитриевич', 'Зуев Н.', '+7(912)-793-78-10', 'e10adc3949ba59abbe56e057f20f883e', 'zuarel@icloud.com', NULL, '2018-01-25 06:54:10');

-- --------------------------------------------------------

--
-- Структура таблицы `components`
--

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

--
-- Дамп данных таблицы `components`
--

INSERT INTO `components` (`id`, `title`, `ctrl`, `block_id`, `static`, `once`, `styles`, `scripts`, `default_config`, `created`) VALUES
(1, 'Управление маршрутами', 'routes-list', 2, 0, 0, NULL, NULL, NULL, '2018-01-10 08:58:25'),
(2, 'Статический контент', NULL, 2, 1, 0, NULL, NULL, '{\"body\": \"\"}', '2018-01-10 09:22:25'),
(3, 'Главный слайдер', 'main-slider', 4, 0, 1, NULL, NULL, '{\"slides\":[], \"lastId\": 0}', '2018-01-10 12:17:53'),
(4, 'Страница авторизации', 'login-page', 2, 0, 1, NULL, NULL, NULL, '2018-01-15 07:19:51'),
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
(27, 'Отображение документа', 'document-view', 2, 0, 0, NULL, NULL, NULL, '2018-02-14 10:53:57');

-- --------------------------------------------------------

--
-- Структура таблицы `confirmed_emails`
--

CREATE TABLE `confirmed_emails` (
  `id` int(11) NOT NULL,
  `hash` varchar(75) NOT NULL,
  `client_id` int(11) NOT NULL,
  `checked` int(11) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `confirmed_emails`
--

INSERT INTO `confirmed_emails` (`id`, `hash`, `client_id`, `checked`, `created`) VALUES
(1, '25daad3d9e60b45043a70c4ab7d3b1c6', 10, 1, '2018-02-12 10:46:00');

-- --------------------------------------------------------

--
-- Структура таблицы `confirmed_phones`
--

CREATE TABLE `confirmed_phones` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `phone` varchar(25) NOT NULL,
  `code` int(6) NOT NULL,
  `confirmed` tinyint(3) UNSIGNED NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `confirmed_phones`
--

INSERT INTO `confirmed_phones` (`id`, `client_id`, `phone`, `code`, `confirmed`, `created`) VALUES
(6, 22, '+7(912)-793-78-10', 327074, 1, '2018-02-12 11:27:35');

-- --------------------------------------------------------

--
-- Структура таблицы `documents`
--

CREATE TABLE `documents` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(70) NOT NULL DEFAULT 'Новый документ',
  `text` text,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `documents`
--

INSERT INTO `documents` (`id`, `title`, `text`, `published`, `created`) VALUES
(1, 'Новый документ', 'фывфывфыв', 0, '2018-02-14 10:08:58');

-- --------------------------------------------------------

--
-- Структура таблицы `fragments`
--

CREATE TABLE `fragments` (
  `id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL DEFAULT '2',
  `route_id` int(11) NOT NULL,
  `block_id` int(11) DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `fragments`
--

INSERT INTO `fragments` (`id`, `component_id`, `route_id`, `block_id`, `priority`, `created`) VALUES
(59, 1, 49, 2, 1, '2018-01-25 07:14:52'),
(70, 4, 61, 4, 1, '2018-01-25 11:56:34'),
(89, 10, 62, 4, 1, '2018-01-29 06:53:54'),
(91, 11, 63, 2, 1, '2018-01-29 09:42:43'),
(93, 12, 63, 1, 1, '2018-01-29 10:17:57'),
(94, 13, 40, 1, 1, '2018-01-29 10:45:01'),
(96, 13, 49, 1, 1, '2018-01-29 11:41:21'),
(98, 13, 51, 1, 1, '2018-01-29 11:43:02'),
(99, 7, 50, 2, 1, '2018-01-29 11:43:26'),
(100, 13, 50, 1, 1, '2018-01-29 11:43:34'),
(101, 12, 64, 1, 1, '2018-01-31 06:21:53'),
(102, 14, 64, 2, 1, '2018-01-31 06:22:11'),
(103, 15, 65, 2, 1, '2018-02-01 08:20:51'),
(104, 16, 66, 2, 1, '2018-02-01 11:21:13'),
(105, 3, 32, 4, 1, '2018-02-02 09:57:58'),
(106, 13, 67, 1, 1, '2018-02-05 17:40:56'),
(107, 17, 67, 2, 1, '2018-02-05 17:42:55'),
(108, 18, 68, 2, 1, '2018-02-07 06:47:23'),
(109, 13, 68, 1, 1, '2018-02-07 06:47:28'),
(110, 19, 69, 2, 1, '2018-02-07 08:39:46'),
(111, 8, 69, 1, 1, '2018-02-07 08:39:56'),
(112, 13, 70, 1, 1, '2018-02-07 11:31:49'),
(113, 20, 70, 2, 1, '2018-02-07 11:32:02'),
(114, 21, 71, 2, 1, '2018-02-08 07:37:17'),
(115, 13, 71, 1, 1, '2018-02-08 07:42:58'),
(116, 13, 65, 1, 1, '2018-02-08 08:32:12'),
(117, 8, 51, 2, 1, '2018-02-08 09:28:10'),
(118, 13, 72, 1, 1, '2018-02-08 10:28:46'),
(119, 22, 72, 2, 1, '2018-02-08 10:29:16'),
(122, 13, 48, 1, 1, '2018-02-12 06:36:42'),
(123, 13, 73, 1, 1, '2018-02-12 06:50:08'),
(124, 23, 73, 2, 1, '2018-02-12 06:50:17'),
(125, 13, 74, 1, 1, '2018-02-13 07:53:56'),
(126, 24, 74, 2, 1, '2018-02-13 08:02:22'),
(127, 13, 76, 1, 1, '2018-02-13 08:56:36'),
(128, 25, 76, 2, 1, '2018-02-13 09:30:32'),
(129, 2, 48, 2, 1, '2018-02-14 09:12:04'),
(130, 13, 77, 1, 1, '2018-02-14 10:10:45'),
(131, 26, 77, 2, 1, '2018-02-14 10:10:51'),
(133, 13, 78, 1, 1, '2018-02-14 10:54:12'),
(134, 27, 78, 2, 1, '2018-02-14 10:54:19');

-- --------------------------------------------------------

--
-- Структура таблицы `fragments_blocks`
--

CREATE TABLE `fragments_blocks` (
  `id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `fragments_data` (
  `id` int(11) NOT NULL,
  `component_id` int(11) DEFAULT NULL COMMENT 'Для повторного использования данных внутри компонента',
  `fragment_id` int(11) NOT NULL COMMENT 'Для привязки данных к определенному фрагменту',
  `data` text NOT NULL COMMENT 'Сами данные',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `fragments_data`
--

INSERT INTO `fragments_data` (`id`, `component_id`, `fragment_id`, `data`, `created`) VALUES
(28, NULL, 89, '{\"content\":{\"slides\":[],\"lastId\":1}}', '2018-01-29 06:58:47'),
(29, NULL, 105, '{\"content\":{\"slides\":[],\"lastId\":4}}', '2018-02-02 09:58:12');

-- --------------------------------------------------------

--
-- Структура таблицы `global_site_config`
--

CREATE TABLE `global_site_config` (
  `id` int(11) NOT NULL,
  `title` varchar(60) DEFAULT NULL,
  `target` varchar(60) NOT NULL,
  `value` text NOT NULL,
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT '1' COMMENT '1 - текст, 2 - число, 3 - логическое, 4 - json',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `global_site_config`
--

INSERT INTO `global_site_config` (`id`, `title`, `target`, `value`, `type`, `created`, `updated`) VALUES
(1, 'Логин root-пользователя', 'rootLogin', 'root', 1, '2018-01-25 10:11:49', NULL),
(2, 'Пароль root-пользователя', 'rootPassword', '4c5fd6d240c4e226e5cc1b53b1dbfaf3', 1, '2018-01-25 10:12:28', NULL),
(6, 'Текст для футера', 'footerText', 'ООО \"Евросервис\" 2018г.', 1, '2018-02-14 05:48:39', NULL),
(12, 'Логотип сайта', 'siteLogo', '/uploads/logo[1].png', 1, '2018-02-14 09:02:06', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `goods_cats`
--

CREATE TABLE `goods_cats` (
  `id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `description` text,
  `img` text COMMENT 'Фото для слайдера',
  `parent_id` int(11) DEFAULT NULL,
  `level` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods_cats`
--

INSERT INTO `goods_cats` (`id`, `title`, `description`, `img`, `parent_id`, `level`, `created`) VALUES
(2, 'Ритуальные товары', 'Каталог ритуальных товаров и принадлежностей для погребения, предлагаемых в магазинах компании.', '/uploads/upload_cae70b7eca82a6688f0378f21d411029.png', NULL, 0, '2018-01-29 08:03:56'),
(3, 'Цветы и венки', 'В этом разделе вы можете найти все виды и типы цветочной продукции, производимой МП КПРУ.', '/uploads/upload_053f850ff24dc084aacec1d2a0d03101.jpg', NULL, 0, '2018-01-29 08:06:02'),
(4, 'Памятники', 'В разделе представлены все виды памятников и комплектующих к ним, а также варианты изображений и шрифтов для оформления памятников.', '/uploads/upload_3bbc45f54f84e26750cbd9a0e742df31.jpg', NULL, 0, '2018-01-29 08:11:22'),
(5, 'Гробы', 'Каталог гробов, производимых МП КПРУ.', '/uploads/upload_e608f7807a899eeaa08a7153a791de5e.jpg', NULL, 0, '2018-01-29 08:13:49'),
(8, 'Ограды', 'Каталог оград и кованых изделий', '/uploads/upload_2627dbb6db61a304759e65ad3791ac79.jpg', NULL, 0, '2018-01-29 08:36:23'),
(10, 'Венки \"Корзина\"', NULL, NULL, 3, 1, '2018-01-29 10:13:02'),
(45, 'Новая категория 1', NULL, NULL, 4, 1, '2018-01-31 11:11:37'),
(46, 'Новая категория 2', NULL, NULL, 45, 2, '2018-01-31 11:11:39'),
(47, 'Новая категория 3', NULL, NULL, 46, 3, '2018-01-31 11:11:40'),
(48, 'Новая категория 55', NULL, NULL, 5, 1, '2018-01-31 11:34:13');

-- --------------------------------------------------------

--
-- Структура таблицы `goods_pos`
--

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

--
-- Дамп данных таблицы `goods_pos`
--

INSERT INTO `goods_pos` (`id`, `title`, `price`, `count`, `reserv`, `cat_id`, `main_photo`, `created`, `description`) VALUES
(55, 'Новый товар', '10000.00', 15, 0, 10, 17, '2018-01-31 10:53:34', NULL),
(56, 'Бла бла бла', '1500.00', 15, 0, 47, 18, '2018-01-31 11:11:56', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam purus erat, interdum at imperdiet vel, euismod ut nisi. Pellentesque at laoreet nulla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas gravida vitae justo ac fermentum. In placerat justo nec metus egestas, in luctus mi hendrerit. Vivamus efficitur ac lectus vel sodales. Nulla congue justo felis, ut accumsan justo semper semper.\n\nIn sed felis fermentum, venenatis metus nec, hendrerit ipsum. Nulla non dapibus purus. Sed gravida ante ut risus pharetra rutrum. Pellentesque maximus tincidunt enim. Nunc commodo auctor dolor, eu vulputate justo tincidunt vel. Nullam quis orci mattis, dictum mauris quis, elementum erat. Nunc egestas nunc ac mauris pharetra placerat. Curabitur nisl diam, posuere ac odio eu, suscipit facilisis dolor. Donec ligula eros, euismod ut cursus eget, interdum in dolor.'),
(57, 'Новый товар', '999999999.99', 1, 0, 48, NULL, '2018-01-31 11:34:17', NULL),
(58, 'Новый товар', '23469.00', 15, 0, 2, NULL, '2018-02-08 05:59:49', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `goods_props`
--

CREATE TABLE `goods_props` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT 'Новый параметр',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Содержит названия параметров товаров';

--
-- Дамп данных таблицы `goods_props`
--

INSERT INTO `goods_props` (`id`, `title`, `created`) VALUES
(1, 'Материал', '2017-12-26 22:44:32'),
(2, 'Наполнитель', '2017-12-26 22:54:32'),
(3, 'Производитель', '2017-12-27 00:30:30'),
(4, 'asdasd', '2018-01-31 11:43:45');

-- --------------------------------------------------------

--
-- Структура таблицы `goods_props_bind_values`
--

CREATE TABLE `goods_props_bind_values` (
  `id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `prop_id` int(11) NOT NULL,
  `prop_value_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Содержит связь параметров товара с товаром';

--
-- Дамп данных таблицы `goods_props_bind_values`
--

INSERT INTO `goods_props_bind_values` (`id`, `good_id`, `prop_id`, `prop_value_id`, `created`) VALUES
(10, 56, 1, 1, '2018-01-31 11:43:38');

-- --------------------------------------------------------

--
-- Структура таблицы `goods_props_values`
--

CREATE TABLE `goods_props_values` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT 'Новое значение',
  `prop_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Содержит значения параметров товаров';

--
-- Дамп данных таблицы `goods_props_values`
--

INSERT INTO `goods_props_values` (`id`, `title`, `prop_id`, `created`) VALUES
(1, 'дуб, красное дерево', 1, '2017-12-26 22:46:00'),
(2, 'Берёза', 1, '2017-12-26 22:53:43'),
(4, 'Магнитогорск', 3, '2017-12-27 00:39:03'),
(7, 'фывфыв', 11, '2018-01-31 08:31:36'),
(8, 'фывфыв', 12, '2018-01-31 08:31:46'),
(9, '123', 4, '2018-01-31 11:43:45');

-- --------------------------------------------------------

--
-- Структура таблицы `header_nav`
--

CREATE TABLE `header_nav` (
  `id` int(11) NOT NULL,
  `title` varchar(70) NOT NULL DEFAULT 'Новый пункт меню',
  `href` varchar(70) NOT NULL DEFAULT '#',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `header_nav`
--

INSERT INTO `header_nav` (`id`, `title`, `href`, `created`) VALUES
(1, 'Главная', '/', '2018-01-25 04:57:57'),
(2, 'Компания', '/company', '2018-01-25 04:58:04'),
(14, 'Кладбища', '/cemeteries', '2018-01-25 09:28:58'),
(15, 'Магазин', '/shop', '2018-01-26 10:15:35');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_groups`
--

CREATE TABLE `menu_groups` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT 'Новая группа',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `menu_groups`
--

INSERT INTO `menu_groups` (`id`, `title`, `created`) VALUES
(1, 'Меню администратора', '2018-01-25 07:13:14'),
(2, 'Меню контактов', '2018-01-25 09:12:15'),
(3, 'Меню личного кабинета', '2018-02-07 06:47:41'),
(4, 'Меню корзины', '2018-02-08 08:32:24');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `href` text,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `route_id` int(11) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `menu_items`
--

INSERT INTO `menu_items` (`id`, `title`, `href`, `parent_id`, `route_id`, `group_id`, `created`) VALUES
(1, 'Маршруты', '/admin-routes', 0, NULL, 1, '2018-01-25 07:13:26'),
(2, 'Управление пользователями', '/admin-clients', 0, NULL, 1, '2018-01-25 07:13:43'),
(3, 'Посещаемость', '/admin-attendance', 0, NULL, 1, '2018-01-25 08:34:10'),
(7, 'Управление компонентами', '/admin-components', 0, NULL, 1, '2018-02-05 17:37:43'),
(8, 'Общее', '/my', 0, NULL, 3, '2018-02-07 06:47:52'),
(9, 'Глобальные переменные', '/admin-globals', 0, NULL, 1, '2018-02-07 11:27:33'),
(10, 'Заказы', '/my-orders', 0, NULL, 3, '2018-02-08 07:33:46'),
(11, 'Список товаров', '/cart', 0, NULL, 4, '2018-02-08 08:32:36'),
(12, 'Проверка заказа', '/order-check', 0, NULL, 4, '2018-02-08 08:33:09'),
(13, 'Отзывы', '/reviews', 0, NULL, 2, '2018-02-08 10:28:26'),
(14, 'Вопрос-ответ', '/questions', 0, NULL, 2, '2018-02-12 06:49:40'),
(15, 'Заказы', '/admin-orders', 0, NULL, 1, '2018-02-13 07:53:07'),
(16, 'Документы', '/documents', 0, NULL, 2, '2018-02-14 10:10:11');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

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

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, `text`, `counter_views`, `published`, `creator`, `created`, `updated`) VALUES
(1, 'Новая новость', '«Точное время с (…), поддержка в ​​трудные времена.» Это сообщение продолжительностью в восемь секунд выходило в эфир одной из радиостанций в кантоне (единица административно-политического деления Швейцарии) около трех раз в день в период с января 2014 по май 2016 года. Так похоронные услуги спонсировали точное время.\r\n\r\nИнициировал проверку законности такой «долбежки» один из врачей кантона, который как никто другой понимает чувства людей, особенно тех, кто болен или потерял близкого человека. По его мнению, такая рекламная компания нарушают действующий запрет на «крупномасштабную и тотальную рекламу подобного рода услуг», при этом проходит на грани морали и нравственности.\r\n\r\nC этим категорически не согласны в самом похоронном агентстве, где полагают, что экономическая свобода действий должна преобладать над ограничениями, установленными в кантонах.\r\n\r\nЭти доводы суду оказались недостаточными. В своей позиции он исходил из того, что похоронный бизнес всегда имеет дело с «уязвимыми людьми, которые проходят через трудные испытания, поэтому как профессионалы они обязаны блюсти в своей деятельности правильное отношение со своими клиентами и широкой общественностью, учитывать особенности таких услуг, а имеющиеся ограничения выглядят совершенно законно с точки зрения общественных интересов.»\r\n\r\nПри вынесении вердикта суд также ответил на вопрос, почему запрет касается лишь радио, а не всего информационного пространства. Так, по мнению суда, к примеру «вебсайт и газета в момент их просмотра всегда остаются под контролем читателя, поскольку он может в любой момент отказаться от просмотра рекламного сообщения, пропустить его, тогда как в рекламе на радио такой контроль отсутствует и слушатель вряд ли сможет избежать прослушивания коробящего его душу объявления.»\r\n\r\nИсточник Похоронка', 0, NULL, 0, '2018-01-24 06:31:02', NULL),
(2, 'Новая новость', '123', 0, NULL, 1, '2018-01-24 07:55:38', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

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

--
-- Дамп данных таблицы `orders`
--

INSERT INTO `orders` (`id`, `hash`, `client_id`, `manager_id`, `surname`, `firstname`, `patronymic`, `status`, `paid_status`, `payed_sum`, `email`, `phone`, `price`, `deliveryMethod`, `paymentMethod`, `created`) VALUES
(1, 'b7f646fc3b9070d7aa74cd3df6bb774f', NULL, NULL, 'Зуев', 'Никита', 'Дмитриевич', 3, 0, '0.00', 'bubl174rus@gmail.com', '+7(912)-793-78-10', '4500.00', 1, 1, '2018-02-07 09:55:10'),
(2, '109aa1de3e468c45a33afa7b349805b8', NULL, NULL, 'Зуев', 'Никита', 'Дмитриевич', 3, 0, '0.00', 'bubl174rus@gmail.com', '+7(912)-793-78-10', '10000.00', 1, 1, '2018-02-07 11:02:14'),
(3, '4548579cc811f270c87bb003d0c21405', 8, NULL, 'Зуев', 'Никита', NULL, 1, 0, '0.00', NULL, '+7(912)-793-78-10', '1500.00', 1, 1, '2018-02-07 11:29:00'),
(4, '0aa202e517498eca83e3214f471297d1', 8, NULL, 'Зуев', 'Никита', NULL, 3, 0, '750.00', NULL, '+7(912)-793-78-10', '1500.00', 1, 1, '2018-02-07 12:15:32'),
(5, '37adc1a6bc2f26aca71bf6bc7c88c76a', NULL, NULL, 'Зуев', 'Никита', 'Дмитриевич', 1, 0, '0.00', NULL, '+7(912)-793-78-10', '23469.00', 1, 1, '2018-02-08 06:07:42'),
(6, 'f2344904636ea0b430eae9acf7b503dd', 8, NULL, 'Зуев', 'Никита', 'Дмитриевич', 1, 0, '0.00', NULL, '+7(912)-793-78-10', '132938.00', 1, 1, '2018-02-08 07:53:30'),
(7, 'ae18735ee3c7d76660c271136dbc76f7', 8, NULL, 'Зуев', 'Никита', 'Дмитриевич', 1, 0, '0.00', NULL, '+7(912)-793-78-10', '23469.00', 1, 1, '2018-02-08 08:47:54'),
(8, '33f496430c93a428bc30b183731bb288', NULL, NULL, 'Зуев', 'Никита', 'Дмитриевич', 1, 0, '0.00', 'bubl174rus@gmail.com', '+7(912)-793-78-10', '70407.00', 1, 1, '2018-02-13 05:55:38'),
(9, '74d42cbe3b17f14ca2161031399a22fe', 8, NULL, 'Зуев', 'Никита', 'Дмитриевич', 1, 0, '0.00', 'bubl174rus@gmail.com', '+7(912)-793-78-10', '23469.00', 1, 1, '2018-02-13 09:36:09'),
(10, '2632a6c185994900fdd8233294ba5132', 8, NULL, 'Зуев', 'Никита', 'Дмитриевич', 1, 0, '0.00', 'bubl174rus@gmail.com', '+7(912)-793-78-10', '23469.00', 1, 1, '2018-02-13 10:45:44'),
(11, '477b364dc705ea28bc50c03755229e82', 8, 8, 'Зуев', 'Никита', 'Дмитриевич', 3, 0, '0.00', 'bubl174rus@gmail.com', '+7(912)-793-78-10', '187752.00', 1, 1, '2018-02-13 10:50:45'),
(12, 'ab82d7d7b398b753b3998f6927974f08', 8, NULL, 'Зуев', 'Никита', 'Дмитриевич', 1, 0, '0.00', 'bubl174rus@gmail.com', '+7(912)-793-78-10', '422442.00', 1, 1, '2018-02-14 07:11:17'),
(13, '6c555bb3de30858835661ab225a58a3f', 8, NULL, 'Зуев', 'Никита', 'Дмитриевич', 1, 0, '0.00', 'bubl174rus@gmail.com', '+7(912)-793-78-10', '23469.00', 1, 1, '2018-02-14 07:19:39');

-- --------------------------------------------------------

--
-- Структура таблицы `orders_goods`
--

CREATE TABLE `orders_goods` (
  `id` int(11) NOT NULL,
  `good_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `count` int(11) NOT NULL COMMENT 'Количество в заказе',
  `price` decimal(11,2) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `orders_goods`
--

INSERT INTO `orders_goods` (`id`, `good_id`, `order_id`, `count`, `price`, `created`) VALUES
(1, 56, 1, 3, '4500.00', '2018-02-07 09:55:10'),
(2, 55, 2, 1, '10000.00', '2018-02-07 11:02:15'),
(3, 56, 3, 1, '1500.00', '2018-02-07 11:29:00'),
(4, 56, 4, 1, '1500.00', '2018-02-07 12:15:32'),
(5, 58, 5, 1, '23469.00', '2018-02-08 06:07:42'),
(6, 55, 6, 8, '80000.00', '2018-02-08 07:53:30'),
(7, 56, 6, 4, '6000.00', '2018-02-08 07:53:30'),
(8, 58, 6, 2, '46938.00', '2018-02-08 07:53:31'),
(9, 58, 7, 1, '23469.00', '2018-02-08 08:47:54'),
(10, 58, 8, 3, '70407.00', '2018-02-13 05:55:38'),
(11, 58, 9, 1, '23469.00', '2018-02-13 09:36:09'),
(12, 58, 10, 1, '23469.00', '2018-02-13 10:45:44'),
(13, 58, 11, 8, '187752.00', '2018-02-13 10:50:45'),
(14, 58, 12, 18, '422442.00', '2018-02-14 07:11:17'),
(15, 58, 13, 1, '23469.00', '2018-02-14 07:19:39');

-- --------------------------------------------------------

--
-- Структура таблицы `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `price` decimal(11,2) UNSIGNED NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `photos`
--

CREATE TABLE `photos` (
  `id` int(11) NOT NULL,
  `path` text NOT NULL,
  `name` varchar(60) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `photos`
--

INSERT INTO `photos` (`id`, `path`, `name`, `created`) VALUES
(1, '/photos/b8', '5A95F1[1].png', '2018-01-31 10:47:48'),
(2, '/photos/75', '5A95F1[1].png', '2018-01-31 10:48:08'),
(3, '/photos/56', '5C3A4B[1].jpg', '2018-01-31 10:48:17'),
(4, '/photos/dc', '5C3A4B[1].jpg', '2018-01-31 10:48:53'),
(5, '/photos/0c', '3E4287[1].jpg', '2018-01-31 10:51:10'),
(6, '/photos/9d', '5A95F1[1].png', '2018-01-31 10:51:16'),
(7, '/photos/ca', '5C3A4B[1].jpg', '2018-01-31 10:52:03'),
(8, '/photos/81', '5C3A4B[1].jpg', '2018-01-31 10:56:49'),
(9, '/photos/81', '5A95F1[1].png', '2018-01-31 10:57:15'),
(10, '/photos/63', '3E4287[1].jpg', '2018-01-31 10:57:34'),
(11, '/photos/b7', '5A95F1[1].png', '2018-01-31 10:58:44'),
(12, '/photos/82', '5A95F1[1].png', '2018-01-31 10:59:09'),
(13, '/photos/dc', '5A95F1[1].png', '2018-01-31 11:00:12'),
(14, '/photos/31', '7a7b97681783e3a8c37e97bb56120389[1].jpg', '2018-01-31 11:06:01'),
(15, '/photos/bf', '8F2811[1].jpg', '2018-01-31 11:06:17'),
(16, '/photos/7f', '5A95F1[1].png', '2018-01-31 11:07:06'),
(17, '/photos/8d', '5C3A4B[1].jpg', '2018-01-31 11:42:47'),
(18, '/photos/e4', 'E04059[1].jpg', '2018-02-01 09:53:30');

-- --------------------------------------------------------

--
-- Структура таблицы `questions`
--

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

--
-- Дамп данных таблицы `questions`
--

INSERT INTO `questions` (`id`, `type`, `category_id`, `author`, `question`, `answer`, `public`, `creator`, `created`) VALUES
(6, 'category', 0, NULL, 'Общие вопросы\r\n', '', 0, NULL, '2017-06-05 04:55:48'),
(12, 'category', 0, NULL, 'Вопросы связанные с благоустройством захоронений', '', 0, NULL, '2017-06-05 04:55:48'),
(13, 'category', 0, NULL, 'Паспорта захоронений и инвентаризация кладбищ', '', 0, NULL, '2017-06-05 04:55:48'),
(14, 'question', 13, NULL, 'Для чего нужен паспорт захоронения?', 'Паспорт захоронения является основанием для произведения дополнительных захоронений на участке, а также проведения каких-либо работ по благоустройству и перепланировке. Захоронение, на которое выдан паспорт, не может попасть под повторное захоронение', 0, NULL, '2017-06-05 04:55:48'),
(18, 'question', 97, NULL, 'Какие документы необходимы для захоронения усопшего?', '1.Справка о констатации смерти (выдается бригадой скорой помощи);\r\n2.Врачебное свидетельство о смерти (выдается врачом поликлиники или работниками морга);\r\n3.Протокол осмотра тела (выдается сотрудником милиции);\r\n4.Гербовое свидетельство о смерти органов ЗАГС (выдается работниками органа ЗАГСа);\r\n5.Справка о смерти (форма -33);\r\n6.Справка на получение государственного пособия на погребение (выдается работниками органа ЗАГСа\r\n', 1, NULL, '2017-06-05 04:55:48'),
(19, 'question', 6, NULL, 'Каков порядок захоронения?', '', 0, NULL, '2017-06-05 04:55:48'),
(20, 'question', 6, NULL, 'Есть ли кремация в городе Магнитогорске?', 'В данный момент кремация в г. Магнитогорске отсутствует, т.к. крематорий только строится.', 1, NULL, '2017-06-05 04:55:48'),
(21, 'question', 6, NULL, 'Существуют ли льготы для ветеранов,участников боевых действий?', '', 0, NULL, '2017-06-05 04:55:48'),
(26, 'question', 97, NULL, 'Куда обращаться в случае смерти?', 'Мы рекомендуем обращаться к ритуальным агентам, контакты которых вы можете найти на странице <a href=\"agent.php\">Вызов агента</a>.', 1, NULL, '2017-06-05 04:55:48'),
(27, 'question', 6, NULL, 'Оказывают ли услуги в кредит?', '', 0, NULL, '2017-06-05 04:55:48'),
(28, 'question', 6, NULL, 'Как восстановить утерянное свидетельство о смерти?', 'Если вы потеряли свидетельство о смерти, то его можно восстановить в архиве ЗАГС.', 1, NULL, '2017-06-05 04:55:48'),
(29, 'question', 13, NULL, 'Кто выдаёт паспорт?', '', 0, NULL, '2017-06-05 04:55:48'),
(30, 'question', 13, NULL, 'Что делать в случае утери паспорта?', '', 0, NULL, '2017-06-05 04:55:48'),
(31, 'question', 13, NULL, 'Что делать если на паспорт претендует несколько человек? ', '', 0, NULL, '2017-06-05 04:55:48'),
(32, 'question', 12, NULL, 'Возможна ли установка памятника сразу же после захоронения?', 'Да, возможна, при условии <a href=\"tile_foundation.php\">заливки фундамента</a> под памятник.', 1, NULL, '2017-06-05 04:55:48'),
(33, 'question', 6, NULL, 'Как найти могилу усопшего?', 'Необходимо установить, на каком именно кладбище захоронен человек и приблизительные годы захоронения. Если такая информация есть, то следует обратиться в администрацию кладбища за выпиской из архива, в которой будет указан квартал кладбища, на котором находится могила. Но искать ее Вам придется самостоятельно. Если же за могилой не было надлежащего ухода, то она могла и не сохраниться.', 0, NULL, '2017-06-05 04:55:48'),
(34, 'question', 6, NULL, 'Каким образом происходит захоронение родственников в одну могилу?', 'При захоронении гроба с телом в могилу на уже имеющемся (родственном) участке какого либо кладбища, необходимо, не позднее, чем за день до похорон, заказать копку могилы в конторе этого кладбища. \r\nЗаказ на копку могилы может сделать либо ответственный за участок (держатель паспорта), либо его доверенное лицо (при наличии нотариально заверенной доверенности), а в случае, если ответственным за захоронение был умерший, то кто-либо из родственников (при наличии личного паспорта). \r\n\r\nПри оформлении заказа на копку могилы необходимо при себе иметь: \r\nГербовое свидетельство о смерти;\r\nУдостоверение на могилу (в удостоверении на могилу указано имя хозяина могилы);\r\nСчет-заказ на ритуальные принадлежности;\r\nПаспорт заявителя (хозяина могилы);\r\nДеньги для оплаты услуг кладбища.\r\n\r\nВозможность захоронения в родственную могилу определяется администрацией кладбища. Это делается на основании представленных документов и действующих нормативных и законодательных актов.\r\n\r\n', 1, NULL, '2017-06-05 04:55:48'),
(35, 'question', 6, NULL, 'Можно ли агента вызвать на дом?', 'Можно. Для вызова агента на дом можно воспользоваться номерами телефонов, указанных на странице<a href=\"agent.php\">Вызов агента</a>. Также на этой странице можно заказать обратный звонок от агента, для чего необходимо ввести свой номер телефона.', 1, NULL, '2017-06-05 04:55:48'),
(36, 'question', 6, NULL, 'Можно ли при жизни купить себе участок на кладбище?', 'Участок можно получить только на умершего', 1, NULL, '2017-06-05 04:55:48'),
(37, 'question', 6, NULL, 'Какие услуги оказывает агент?', '•Консультативную помощь лицу, взявшему на себя обязанность по организации похорон усопшего;\r\n•Получение необходимых для организации похорон документов;\r\n•Осуществление комплекса мероприятий по подготовке тела к погребению;\r\n•Приобретение предметов ритуала;\r\n•Катафальные и транспортные перевозки;\r\n•Осуществление захоронения ;\r\n•Услуги организатора ритуала похорон;\r\n•Прокат зала для проведения гражданской панихиды и обряда поминания;\r\n•Выполнение прочих услуг связанных с погребением;\r\n•Консультирует о возможности захоронения с учетом льгот усопшего, возможных пособий на погребение.\r\n', 1, NULL, '2017-06-05 04:55:48'),
(38, 'question', 6, NULL, 'В случае отсутствия паспорта умершего, как получить свидетельство о смерти?', 'Вместо утерянного паспорта можно предоставить выписку по форме А, выданную жилищно-эксплуатационной службой по последнему месту регистрации гражданина. Отсутствие полностью заполненных граф в гербовом свидетельстве о смерти, может сделать невозможным любые последующие юридические и регистрационные процедуры, от выписки из квартиры до получения наследства и т.д.', 1, NULL, '2017-06-05 04:55:48'),
(39, 'question', 6, NULL, 'Сколько человек допустимо захоронить на 1 участке?', 'Все зависит от размера участка. Если это стандартный участок 1 х 1,8 (2) м, то возможно захоронить одного человека.', 1, NULL, '2017-06-05 04:55:48'),
(41, 'question', 6, NULL, 'Кто дает разрешение на захоронение и к кому обращаться по поводу места на кладбище?', 'Смотритель кладбища.', 1, NULL, '2017-06-05 04:55:48'),
(42, 'question', 6, NULL, 'Какие услуги вы оказываете?', '1.Организация и проведение похорон и траурных церемоний;\r\n2.Благоустройство захоронений\r\n3.Изготовление и установка памятников\r\n4.Выкладка тротуарной плитки на захоронениях\r\n5.Изготовление фотографий для памятников;\r\n6.Производство и установка оград, скамеек, столов, кованых изделий\r\n', 1, NULL, '2017-06-05 04:55:48'),
(43, 'question', 6, NULL, 'Какие документы выдаются отделом ЗАГС в случае смерти?', 'Отделом ЗАГС при оформлении смерти выдаются следующие документы:\r\n\r\n— свидетельство о смерти;\r\n\r\n— справка формы № 33 на получение пособия на погребение;', 1, NULL, '2017-06-05 04:55:48'),
(44, 'question', 6, NULL, 'Где выплачивается пособие на погребение?', 'Пособие на погребение получают в следующих организациях:\r\n\r\n— в случае если умерший работал на каком-либо предприятии, пособие выплачивается по месту его работы;\r\n\r\n— для получения пособия на погребение безработного гражданина необходимо обратиться в Отдел социальной защиты;\r\n\r\n— на умерших пенсионеров пособие выплачивается в управлении Пенсионного фонда (по месту жительства)\r\n\r\n— на умерших студентов — по месту учебы, а на детей до 18 лет — по месту работы родителей. ', 1, NULL, '2017-06-05 04:55:48'),
(46, 'question', 47, NULL, 'Возможно ли расширить участок, если рядом есть свободное место?', 'Данный вопрос решается в индивидуальном порядке, для чего необходимо обратиться в администрацию кладбища, на котором расположено захоронение.', 1, NULL, '2017-06-05 04:55:48'),
(47, 'category', 0, NULL, 'Вопросы по организации территорий', '', 0, NULL, '2017-06-05 04:55:48'),
(48, 'question', 12, NULL, 'Какие документы необходимы чтобы заказать памятник?? ', 'Для заказа памятника необходимо иметь при себе паспорт. Если Вы относитесь к одной из льготных категорий, для получения скидки Вам необходимо также предъявить подтверждающие документы. Более подробно об этом Вы можете прочитать на странице <a href=\"payment.php\">оплата</a>.', 1, NULL, '2017-06-05 04:55:48'),
(49, 'question', 97, NULL, 'Можем ли мы выкопать могилу самостоятельно?', 'Можете, если захоронение будет произведено в родственную могилу. Необходимо обратиться в администрацию кладбища и предъявить свидетельство о смерти ранее захороненного человека.', 1, NULL, '2017-06-05 04:55:48'),
(51, 'question', 55, NULL, 'Не можем найти могилу 1938г. , существуют ли какие-нибудь архивы?', 'Попробуйте найти могилу через поиск на нашем сайте. Перейдите на страницу <a href=\"http://mpkpru.ru/public/places.php\" title=\"Поиск захоронений\">Поиск захоронений</a> и введите в поля известные Вам данные.\r\nЕсли Вы не нашли в списке нужное захоронение, нужно обратиться в администрацию того кладбища, на котором оно находится.', 1, NULL, '2017-06-05 04:55:48'),
(52, 'question', 6, NULL, 'Cколько стоит услуга по перезахоронению усопшего?', 'Услуга по перезахоронению усопшего расчитывается индивидуально. Примерная стоимость услуги 9300 руб. без учета стоимости новой могилы. Стоимость может менятся в зависимости от того на каком кладбище будет перезахоронен усопший(может возрасти либо уменьшится стоимость перевозки).\r\nДля того чтобы произвести перезахоронение необходимо предоставить следующие документы:\r\n- Свидетельство о смерти умершего;\r\n- Разрешение на эксгумацию со следственного комитета;\r\n- Разрешение на эксгумацию с Санэпидемстанции;\r\n- Паспорт заказчика данной услуги;\r\n- Документы подтверждающие степень родства;\r\n- Если происходит перезахоронение неизвестного, то необходимо предоставить протокол опознания, который оформляется в следственном комитете.\r\nПосле того как собраны все необходимые документы, необходимо предоставить их в МП КПРУ, по адресу ул. Чайковского, д. 90, и написать заявление на произведение перезахоронения.\r\nВы также можете обратиться за данной услугой к агенту похоронного бюро.', 1, NULL, '2017-06-05 04:55:48'),
(53, 'question', 55, NULL, 'В поиске захоронений неверно указана фамилия (имя, отчество, годы жизни, место расположения) Как исправить?\r\n', 'В результатах поиска возле каждого участка есть кнопка \"Сообщить об ошибке\". Введите данные, которые необходимо исправить в произвольной форме, и мы внесём необходимые поправки.', 1, NULL, '2017-06-05 04:55:48'),
(340, 'question', -1, NULL, 'временные памятники для мусульман цена и где купить', '', 0, NULL, '2017-06-05 04:55:48'),
(342, 'question', -1, 6683, 'Можно ли сделать заявку на получение удостоверения захоронения на сайте?', '', 0, NULL, '2017-06-05 04:55:48'),
(343, 'question', 55, NULL, ' Здравствуйте. помогите установить даты рождения и смерти Ёжкина Николая Васильевича.Левобережное кладбище -120035\r\n', 'Для уточнения дат Вы можете обратиться в администрацию кладбища, на котором находится данное захоронение и найти его в бумажном журнале захоронений. Как правило в нем указаны даты рождения и смерти (если они были известны в момент захоронения). Как минимум, найдя запись в журнале Вы узнаете дату производства захоронения.', 1, NULL, '2017-06-05 04:55:48'),
(344, 'question', -1, 6696, 'Здравствуйте,хочу выразить благодарность что существует такая служба.Долго не могли найти родственников.И вот нашли.На фотографиях не прочитать дат.Где можно установить даты смерти.Левобережное кладбище участок 120035.\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', 0, NULL, '2017-06-05 04:55:48'),
(345, 'question', -1, NULL, 'нет фотографии с места захоронения Курцева Юрия Дмитриевича,там установили памятник,кладбище Южное', '', 0, NULL, '2017-06-05 04:55:48'),
(346, 'question', -1, NULL, 'где и как узнать квартал захоронения?', '', 0, NULL, '2017-06-05 04:55:48'),
(347, 'question', -1, NULL, 'КАК НАЙТИ ЗАХОРОНИВШЕГО ГОСУДАРСТВОМ ЧЕЛОВЕКА В 2001 ГОДУ В МАГНИТОГОРСКЕ.', '', 0, NULL, '2017-06-05 04:55:48'),
(348, 'question', -1, NULL, 'КАК НАЙТИ МОГИЛУ ЗАГОРСКОГО СЕРГЕЯ АЛЕКСАНДРОВИЧА 1958 ГОДА РОЖДЕНИЯ  13СЕНТЯБРЯ,ЗАХОРОНЕН В 2001 ГОДУ.', '', 0, NULL, '2017-06-05 04:55:48'),
(349, 'question', -1, NULL, 'почему нет фото с могилы моего брата Курцева Юрия Дмитриевича,там поставили ему памятник,а фото на сайте старое.', '', 0, NULL, '2017-06-05 04:55:48'),
(55, 'category', 0, NULL, 'Поиск захоронений', '', 0, NULL, '2017-06-05 04:55:48'),
(56, 'question', 55, NULL, 'Что делать, если реально существующее захоронение отсутствует в поиске?', 'Если вы не нашли в поиске захоронение, но точно уверены, что оно существует, воспользуйтесь формой сообщения об отсутсвующем захоронении, на странице <a href=\"places_new.php\">\"Поиск захоронений\"</a>', 1, NULL, '2017-06-05 04:55:48'),
(65, 'question', 55, NULL, 'Как найти место захоронения?', 'Перейдите на страницу <a href=\"places_new.php\">Поиск захоронений</a>, введите известные Вам данные об умершем и нажмите кнопку \"Поиск\".', 1, NULL, '2017-06-05 04:55:48'),
(67, 'question', 6, NULL, 'Здравствуйте, подскажите пожалуйста где и как получить пособие на умершего пенсионера МВД?', 'Нужно обратиться в главное управление УМВД по г. Магнитогорску (ул. Строителей, д. 11; 29-86-12 приемная), при себе иметь справку о смерти (форма 33), чеки, подтверждающие расходы на захоронение, свидетельство о смерти + копия, паспорт заказчика + копия, распечатку номера лицевого счета Сбербанка или копию первой страницы сберегательной книжки Сбербанка, удостоверение пенсионера МВД + копия, военный билет + копия, при наличии. ', 1, NULL, '2017-06-05 04:55:48'),
(73, 'question', 55, NULL, 'Здравствуйте! \r\nВозможно ли заменить имеющуюся у вас на сайте фотографию захоронения (в связи с установкой памятника или производством каких-либо работ, в результате которых меняется внешний вид участка)?', 'Фотографии планируется обновлять при каждом производстве работ на участке. Если работы производятся нашими специалистами, то фотографии по мере возможности будут обновляться без Вашего участия. Если Вы заказывали работы у какой-либо другой компании или производили их сами - обратитесь в администрацию кладбища, на котором расположено захоронение и сообщите о произведенных работах (какие работы, заказчик, производитель), после чего участок также будет поставлен в очередь фотографии.', 1, NULL, '2017-06-05 04:55:48'),
(75, 'question', 55, NULL, 'СИВУХИН НИКИТА ЗИНОВЬЕВИЧ', 'http://mpkpru.ru/public/places_place.php?id=457218, участок находится на левобережном кладбище', 1, NULL, '2017-06-05 04:55:48'),
(362, 'question', -1, NULL, 'как узнать цены на памятники ?', '', 0, NULL, '2017-06-05 04:55:48'),
(363, 'question', -1, 6896, 'скажите сколько стоит памятник #323,зараннее спасибо', '', 0, NULL, '2017-06-05 04:55:48'),
(364, 'question', -1, 5881, 'Здравствуйте! Я разыскиваю захоронение моей бабушки Хареты Марии Архиповны. Несколько месяцев назад заполнила форму \"Сообщения об отсутствующих захоронениях\". Ответа до сей поры нет, направляла вопрос о поиске могилы. Тоже нет ответа. Я живу в Новгородской области и приехать в Магнитогорск для поиска могилы в настоящее время возможности нет. Куда можно обратиться, чтобы разыскать могилу.', '', 0, NULL, '2017-06-05 04:55:48'),
(81, 'question', 95, NULL, 'Как отредактировать данные в личном кабинете, добавить или изменить их?', 'В \"Кабинете клинета\" (ссылка на него расположена в правом верхнем углу сайта у зарегистрированных пользователей) во вкладке настройки напротив имени клиента кнопка \"Изменить\". Нажимайте на неё и вводите правильные данные.', 1, NULL, '2017-06-05 04:55:48'),
(82, 'question', 55, NULL, 'Где похоронен Живайкин Алексей Владимирович, дата рождения 2 мая 1978, умер март', 'Для того чтобы похоронить человека необходимо написать заявление в администрации кладбища, на котором будет проходить захоронение. Заявление на захоронение Живайкина Алексея Владимировича не было написано ни на одном кладбище нашего города (в 2014 году). В архиве городского морга записей о Живайкине А. В. тоже не найдено. Возможно он был захоронен как неопознанный на Южном кладбище (при отсутствии у умершего документов). Уточните пожалуйста дату смерти (год) и мы проверим наши книжные архивы (в книгах за 2014 год записей нет).', 1, NULL, '2017-06-05 04:55:48'),
(85, 'question', 6, NULL, 'Сколько стоит место на кладбище', 'Место для захоронения усопших предоставляется бесплатно.', 1, NULL, '2017-06-05 04:55:48'),
(86, 'question', 12, NULL, 'При заказе и установки у Вас памятника дается ли гарантия и на сколько?', 'Гарантия на установку памятника 1 год. Если в течении года памятник покосится, необходимо обратиться а администрацию кладбища, на котором был сделан заказ (с чеком), после чего памятник будет бесплатно поправлен и срок гарантии продлевается еще на год.', 1, NULL, '2017-06-05 04:55:48'),
(84, 'question', 55, NULL, 'Буренина Наталья Петровна,где захоронена\r\n', 'http://mpkpru.ru/public/places_place.php?id=127755, участок находится на левобережном кладбище.', 1, NULL, '2017-06-05 04:55:48'),
(95, 'category', 0, NULL, 'Вопросы по работе сайта', '', 0, NULL, '2017-06-05 04:55:48'),
(96, 'question', 97, NULL, 'Располагает ли предприятие спецтранспортом для перевозки умершего из другого города и какова стоимость этой услуги?', 'Компания располагает специальным транспортом и оказывает услуги по доставке умерших как на внешних (т.е. в другой город), так и и на внутренних (т.е. из других городов) направлениях. Кроме того, возможна организация похорон и сопровождения на выезде. Стоимость рассчитывается индивидуально и зависит от типа транспорта, расстояния и дополнительных услуг. Для получения более подробной информации о стоимости услуги необходимо обратиться по телефону 40-30-00 (круглосуточно) или 48-85-80 (ежедневно с 8:00 до 20:00).', 1, NULL, '2017-06-05 04:55:48'),
(97, 'category', 0, NULL, 'Вопросы по организации похорон', '', 0, NULL, '2017-06-05 04:55:48'),
(98, 'question', 12, NULL, 'Памятник на могиле отца требует ремонта: пришел в негодность цветник. Захоронение находится в Абзелиловском районе, село Янгельское. Я проживаю в Свердловской области, хотела бы произвести ремонт в районе 10 июля, смогу подъехать. Стелла в хорошем состоянии - мраморная, ее необходимо переустановить с заменой цветника. Как оформить заказ? Какие сроки? Цена работы? На месте есть доверенные лица, представляющие мои интересы.\r\nЖду ответа. С УВАЖЕНИЕМ ОСТРЕНИНА ЕВГЕНИЯ.', 'Вы можете оформить заказ, даже не приезжая на кладбище, позвоните по телефону 8(3519) 28-99-33 - наши менеджеры помогут Вам с выбором, при необходимости предоставят фотографии интересующих Вас материалов и составят подробный расчёт стоимости заказа. Стоимость будет рассчитана в зависимости от объема работ, места расположения захоронения и выбранных материалов. Срок выполнения работ как правило не превышает 3-4 дня, в зависимости от загрузки. Оплата также возможна любым безналичным способом, по готовности заказа Вам сделают фотоотчёт, либо Ваши доверенные лица смогут лично принять заказ.\r\nТакже Вы можете подъехать в любой из отделов по благоустройству, расположенных на кладбищах Магнитогорска и произвести заказ лично.', 1, NULL, '2017-06-05 04:55:48'),
(102, 'question', 95, NULL, 'Здравствуйте мы заказывали памятник с установкой. памятник установили, о чем сообщили по телефону, так как мы из другого города.Нам рассказали о возможности посмотреть в личном кабинете на сайте.На сегодняшний день пока фото нет.', 'Здравствуйте ! В связи с неблагоприятной погодой, фотографирование захоронений задерживается. Как только погода установится, фото на сайте будет обновлено. Приносим свои извинения.', 1, NULL, '2017-06-05 04:55:48'),
(100, 'question', 55, NULL, 'не могу найти захоронение отца Еремин Борис Семенович 1920 г. р. похоронен на л.б. кладбище прпимерно 1973-1976 года, помогите пожалуйста\r\n', 'Поиск по базе данных результатов не дал. Возможно на захоронении отсутствуют какие-либо опознавательные знаки и оно отмечено как неопознанное. Вы можете обратиться в администрацию кладбища и просмотреть архивы захоронений за указанные годы. В архивной книге указывается квартал, куда производилось захоронение и точная дата погребения. Как правило, этих данных достаточно для того, чтобы найти нужное захоронение.', 1, NULL, '2017-06-05 04:55:48'),
(361, 'question', -1, 2028, 'Здравствуйте! Скажите пожалуйста как изменить контактный телефон и почтовый адрес? сим карты сменились...прежние заблокированы...чтобы набудущее не возникло проблем с входом в личный кабинет. Спасибо. ', '', 0, NULL, '2017-06-05 04:55:48'),
(106, 'question', 95, 51, 'Добрый день! У меня не получается загрузить фотографии в Книгу памяти. Помогите пожалуйста.', 'Для загрузки доступны фотографии в форматах .jpg и .jpeg размером не более 3 мб. Если эти критерии соблюдаются и загрузка не происходит, позвоните пожалуйста по телефону 8-919-316-28-99 и мы решим этот вопрос в ближайшее время.', 1, NULL, '2017-06-05 04:55:48'),
(357, 'question', -1, 6783, 'Можно ли заказать ленту с надписью на венок при оформлении возложения цветов через сайт?', '', 0, NULL, '2017-06-05 04:55:48'),
(352, 'question', -1, 6745, 'Почему оплаченный заказ на показ место захоронения на карте до сих пор весит, как не оплаченный?!', '', 0, NULL, '2017-06-05 04:55:48'),
(111, 'question', 12, NULL, 'Можно ли заказать уборку в месте захоронения возле могил(в оградке), сколько будет стоить и как это заказать\r\n\r\n', 'Уборку заказать возможно либо при личном присутствии в администрации кладбища, либо Вы можете связаться с нашими мастерами по телефонам: 8-951-780-24-05, 8-912-805-12-07. Они найдут участок в электронной базе захоронений, проедут на место, после чего свяжутся с Вами и сообщат стоимость интересующих Вас работ. Стоимость зависит от того насколько большая территория захоронения и в каком состоянии оно находится.', 1, NULL, '2017-06-05 04:55:48'),
(112, 'question', 6, NULL, 'Где можно найти журнал захоронений?', 'Журналы захоронений хранятся на кладбище у смотрителя.', 1, NULL, '2017-06-05 04:55:48'),
(113, 'question', 55, 3082, 'Мои отец похоронен как бездомный я заходила на сайт посмотреть где он похоронен но таких захоронений с бездомными там нет. Где на сайте можно это узнать его похоронили в ... году с приюта для бездомных который находится на Менжинского', 'Если на сайте найти захоронение по фамилии у Вас не получилось, то скорее всего на памятнике ничего не написано. Обратитесь в организацию, которая являлась заказчиком захоронения, у них должны быть данные о месте захоронения. Также Вы можете обратиться в администрацию Южного кладбища и проверить по книге регистрации бесхозные захоронения. В случае если человек не был захоронен как безымянный в книге должна быть запись о нём.', 1, NULL, '2017-06-05 04:55:48'),
(341, 'question', -1, 6681, 'В какой братской могиле захоронен во время ВОВ мой дед Коньков Александр Егорович, работник ММК? Есть ли какие то архивные данные?', '', 0, NULL, '2017-06-05 04:55:48'),
(337, 'question', -1, 5157, 'Здравствуйте. Разыскиваю захоронение своей прапрабабушки Прокопенко Анны Трофимовны. После долгих поисков мною было выяснено, что захоронение числится как неопознанное из-за отсутствия таблички. Нашла ее по захороненному рядом сыну (Прокопенко Иван Игнатьевич) участок № 450799, квартал 5ст. Есть ли у Вас более точные дынные по поиску захоронению кроме номера квартала - ряд, место? И возможно ли у Вас найти информацию по дате рождения и смерти, чтобы изготовить табличку? Мне известно только примерный год ее захоронения - 1950.', '', 0, NULL, '2017-06-05 04:55:48'),
(338, 'question', -1, NULL, 'К кому обращаться если не правильно написана на сайте фамилия захороненной написано: Кольникина, а должно быть Колышкина Левобережное кладбище № 411983', '', 0, NULL, '2017-06-05 04:55:48'),
(339, 'question', -1, NULL, 'Здравствуйте почему нет  номера квартала ведь мы ищем умерших по кварталу а не по шестизначному номеру захоронения-раньше были указаны номера кварталов захоронения-пожалуйста доработайте -премного благодарны будут вам люди -спасибо', '', 0, NULL, '2017-06-05 04:55:48'),
(116, 'question', 12, NULL, 'хотела бы узнать поставили памятник или нет', 'Вам нужно связаться с менеджером у которого делали заказ. На сайте эта информация не публикуется. Телефоны отделов можно посмотреть в разделе <a href=\"/public/shops.php\" target=\"_blank\">Магазины</a>', 1, NULL, '2017-06-05 04:55:48'),
(118, 'question', 55, 2800, 'Не можем найти захоронение нашей сестры Митрошиной Нины Николаевны. Умерла где-то в 1948-1949г. Хоронили на Левобережном кладбище. Книги архивные за эти годы остались?', 'К сожалению в архиве не сохранились книги за 1948-1949 г. Вы можете обратиться в архив ЗАГСа, где Вам дадут копию свидетельства о смерти, в котором точно будет указана дата смерти (если все же год смерти будет 1948 или 1949, то к сожалению помочь не сможем).', 1, NULL, '2017-06-05 04:55:48'),
(359, 'question', -1, 6846, 'На странице захоронения не нашла кнопку \"Сообщить об ошибке\". Ошибка: захоронена Попова Клавдия Фёдоровна участок 33563 \r\nДата рождения:\r\n19 марта 1910.  Неверно указана дата, нужно 15 марта. Ошибка из-за брызг грязи после дождя, если внимательно посмотреть, то это видно\r\n', '', 0, NULL, '2017-06-05 04:55:48'),
(360, 'question', -1, 6845, 'Как получить удостоверение, если утеряно свидетельство о смерти матери - участок №453326? мы с братом проживаем в других городах и у нас нет возможности приехать в Магнитогорский ЗАГС.', '', 0, NULL, '2017-06-05 04:55:48'),
(128, 'question', -1, 3356, 'Здравствуйте! На днях узнала о вашем сайте. Как здорово что вы есть. У меня огромная просьба. я не могу найти могилу отца КИРПИЧНИКОВА ВЛАДИМИРА ИЛЬИЧА, дата рождения 1 ноября 1939г, дата смерти 26 февраля 1996г. У меня есть свидетельство о смерти.где на обратной стороне стоит печать левобережного кладбища и указана дата 29.02.1996......я не участвовала в похоронах.....и скорее всего он похоронен как бездомный возможно.....хотя он имел жильё на Белинского 77-4...но жил по К-маркса  с сожительницей и у неё умер.....пожалуйста помогите найти.....Наталья', '', 0, NULL, '2017-06-05 04:55:48'),
(129, 'question', 12, NULL, 'Cколько будет стоить работа по укладке плиткой 15 кв.м', 'Стоимость будет зависеть от того, какую плитку Вы выберете, а также от объема работ по подготовке места для укладки. Рекомендуем позвонить по телефонам мастеров 45-05-69, 44-02-53 и уточнить более подробно.', 1, NULL, '2017-06-05 04:55:48'),
(354, 'question', -1, NULL, 'Здравствуйте, можно ли сделать эксгумацию? И что для этого нужно?', '', 0, NULL, '2017-06-05 04:55:48'),
(355, 'question', -1, NULL, 'Здравствуйте.Я живу в Израиле. Не могу ввести номер телефона при регистрации. У нас 10 цифр и начинается с 0 или +972', '', 0, NULL, '2017-06-05 04:55:48'),
(356, 'question', -1, NULL, 'Мы ищем отца,думаем что он уже умер,Багин Дмитрий Григорьевич 1937 года 27.10 хотели бы найти место захоронения.', '', 0, NULL, '2017-06-05 04:55:48'),
(143, 'question', 6, 3695, 'На вашем сайте не правильно указаны дата и год рождения моего отца. К кому обратится?', 'На странице каждого захоронения есть кнопка \"Сообщить об ошибке\". Необходимо нажать эту кнопку, в появившейся форме указать причину обращения и верные данные. После чего наши специалисты все исправят.', 1, NULL, '2017-06-05 04:55:48'),
(144, 'question', 6, 3422, ' По фотографии участка видно,что на памятнике была установлена табличка с ФИО, датой рождения и смерти.К сожалению, мы с сестрой помним только,что деда звали Евтух Сергей, ни даты рождения, ни даты смерти не знаем. Как восстановить эти данные? Посоветуйте,пожалуйста, будем вам очень благодарны. Евтух Светлана.', 'Вы можете обратиться в архив ЗАГСа по адресу: ул. К. Маркса д. 184/1. Там нужно составить запрос, с известными Вам данными. Сотрудники ЗАГСа обязательно помогут. Информацию о дате смерти и о дате рождения (если такая имеется) Вам сообщат.', 1, NULL, '2017-06-05 04:55:48'),
(148, 'question', 55, NULL, 'Не могу найти захоронения двух дочерей моей бабушки(мы ходим каждый год).Могилы находятся недалеко друг от друга, захоронения примерно 52-53гг. Емельяновы Зинаида и Валентина. На крестах записей нет. Зинаида похоронена на детском кладбище, возле дороги.', 'Так как на памятниках нет опознавательных знаков, захоронения сфотографированы и отмечены как неизвестные. Просим либо подписать памятники, либо изготовить специальные таблички, а также по возможности обратитесь в администрацию кладбища. С Вами на место проедет фотограф, сделает новые фотографии и внесет изменения в базу данных.', 0, NULL, '2017-06-05 04:55:48'),
(149, 'question', 55, NULL, 'Женщина ищет свою дочь.Примерно 20 ноября не была ли похоронена на вашем кладбище Землянухина Надежда?', 'На кладбищах города Магнитогорска Землянухина Надежда не зарегистрирована.', 1, NULL, '2017-06-05 04:55:48'),
(150, 'question', 12, NULL, 'Хотелось бы заказать окраску ограды проживаю в другом городе ,способ оплаты ', 'Мы работаем со всеми видами оплат, включая наличный, безналичный расчет, электронные деньги, банковские переводы.', 1, NULL, '2017-06-05 04:55:48'),
(151, 'question', 47, NULL, 'Куда обратиться по благоустройству дороги около захоронения. Каждую весну приходится чистить памятники от грязи,т.к. около захоронения № 456035 Огромная лужа...отец мой Ветеран Великой Отечественной войны.. Может в юбилейный год администрация кладбища сделает \"подарок\", засыпит щебёнкой эту яму? К КОМУ МЫ ДОЛЖНЫ ОБРАТИТЬСЯ С ЭТИМ ВОПРОСОМ?', 'Вам необходимо обратиться в Администрацию города Магнитогорска в управление капитального строительства и благоустройства либо в личном кабинете администрации города Магнитогорска (magnitogorsk.ru) написать сообщение на имя главы города', 1, NULL, '2017-06-05 04:55:48'),
(152, 'question', 12, NULL, 'Добрый день сколько дней изготавливается памятник из мрамора?', 'От трех до десяти дней , в зависимости от загруженности и сложности заказа.', 1, NULL, '2017-06-05 04:55:48'),
(153, 'question', -1, 3938, 'Добрый день! Мои родители: Александров Борис Леонидович и Александрова Римма Федоровна похоронены на Левобережном кладбище ( квартал 460708), на Вашем сайте я нашла их могилы и памятники, в настоящее время мы поставили им общий памятник.Будет ли на Вашем сайте изменение?\r\n', '', 0, NULL, '2017-06-05 04:55:48'),
(156, 'question', -1, 3950, 'Здравствуйте,не могу найти могилу Коновалов Юрий Александрович г.р.1947,ориентировочно умер в 2007 году.Приходила к Вам перелистывала все журналы,теперь ищу в компьютере,но к сожалению безрезультатно.Если сможете помочь -буду признательна.', '', 0, NULL, '2017-06-05 04:55:48'),
(155, 'question', 6, 208, 'Планируется ли создание электронных книг захоронений аналог бумажным книгам?', 'На сегодняшний день, оцифрована большая часть архивных книг. Ввиду того, что некоторые из книг находятся не в лучшем состоянии, работы продолжаются.', 0, NULL, '2017-06-05 04:55:48'),
(158, 'question', 95, NULL, 'Что даёт регистрация захоронения участника ВОВ?', 'Эта отметка нужна для выявления всех ветеранов боевых действий захороненных на кладбищах Магнитогорска. В первую очередь это необходимо для оценки состояния захоронений и приведения их в надлежащий вид. Также сейчас ведутся разработки по созданию отдельной электронной книги памяти по всем участникам боевых действий.', 1, NULL, '2017-06-05 04:55:48'),
(159, 'question', 95, 4102, '<span style=\"color:red;\">Можно ли оплатить регистрацию через терминал?</span> ', 'Регистрация на сайте АБСОЛЮТНО БЕСПЛАТНА, и её нигде не надо оплачивать - вводите имя, подтверждаете телефон и пользуетесь. Если же Вы имеете в виду другие платные услуги, например карту, то их можно оплатить при помощи любых электронных видов оплаты, включая терминалы.', 1, NULL, '2017-06-05 04:55:48'),
(358, 'question', -1, NULL, 'добрый день!\r\nСколько будет стоить катафалк до н.новгорода магнитогорск\r\n', '', 0, NULL, '2017-06-05 04:55:48'),
(353, 'question', -1, NULL, 'Кто не может копать могилу при смерти моей сестры', '', 0, NULL, '2017-06-05 04:55:48'),
(351, 'question', -1, NULL, 'Здравствуйте уважаемые работники МП КПРУ г. Магнитогорска. Я Тартаковский Владимир Ильич с помощью Вашей информации нашёл могилу моего отца на левобережном кладбище, на участке 580655. Сейчас она считается \"неопознанным захоронением\", т.к. часть плиты разрушилась и нет надписей. Сообщаю информацию о моём дорогом папе: \r\nТартаковский Илья Харитонович, родился 30 марта 1901г., умер 23 марта 1946г.,\r\nо чём в книге регистрации актов о смерти 1946г марта месяца 25 числа прозведена запись за № 333. Место регистрации: Кировский ЗАГС г. Магнитогорска. Дата выдачи 23 июля 1990 (повторное). \r\nРядом с ним захоронена моя бабушка(мамина мама) Труг Берта Львовна и сестра отца Тартаковская Мария Харитоновна. Хотелось бы получить удостоверение на захоронение отца. И ещё - хотел восстановить плиту и надписи на ней. С уважением, Владимир ', '', 0, NULL, '2017-06-05 04:55:48'),
(329, 'question', -1, NULL, 'oUGPkx http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(330, 'question', -1, NULL, 'ZyuyH2 http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(331, 'question', -1, NULL, 'eAe3FN http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(332, 'question', -1, NULL, 'GR7Its http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(333, 'question', -1, NULL, 'SZmFe3 http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(334, 'question', -1, NULL, 'fnvI3P http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(335, 'question', -1, 6620, 'Здравствуйте.\r\nМой дед, Дерюга Фёдор Савельевич, уч #704614, захоронен в 1977г. Он был ветераном ВОВ. Существуют ли какие либо льготы на изготовление и установку нового мраморного памятника? Какие в этом случае требуются документы и куда следует обратиться? Рядом захоронена его жена Дерюга Мария Петровна, возможно ли изготовление и установка одного общего памятника с учетом возможной льготы на деда?', '', 0, NULL, '2017-06-05 04:55:48'),
(350, 'question', -1, 6731, 'Добрый день! Проживаю в Томской области в г. Магнитогорске на Правобережном кладбище участок \r\n34400 захоронены мой дедушка Губанов Валерий Григорьевич, прадедушка и прабабушка, хотела бы заказать уборку участка (вырезка кустарников и т.д.) прошу вас как сойдет снег и возможно будет оценить состояние участка и о возможных работах по  его благоустройству, организовать выезд специалиста на  участок и проинформировать меня о текущем состоянии, предлагаемых работах по благоустройству и стоимости этих работ. Заранее благодарю Вас за помощь, спасибо Вам за оказание таких услуг и помощи многим людям, желаю Вам успехов в работе и во всех начинаниях. С уважением, Быкова Ольга Валерьевна.\r\n', '', 0, NULL, '2017-06-05 04:55:48'),
(314, 'question', -1, NULL, 'fY9h35 http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(315, 'question', -1, NULL, '71JvLe http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(316, 'question', -1, NULL, 'PklanQ http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(318, 'question', -1, NULL, 'aEN9uF http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(319, 'question', -1, NULL, 'YdgA7N http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(320, 'question', -1, NULL, 'U84khO http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(321, 'question', -1, NULL, 'AVqNRV http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(322, 'question', -1, NULL, '3eJRJw http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(323, 'question', -1, NULL, '21CMZ8 http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(324, 'question', -1, NULL, 'KDeziC http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(325, 'question', -1, NULL, '512uyA http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(326, 'question', -1, 6024, 'хороните ли вы по мусульманским обычаям?', '', 0, NULL, '2017-06-05 04:55:48'),
(327, 'question', -1, NULL, 'thzes7 http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(182, 'question', 6, 4830, 'Левобережное кладбище, уч. 459757. Неопознанное захоронение- мой дед- Евтух Сергей Васильевич, рождения 1902 года, призванный в армию в 1939 году, начавший воевать с первого дня войны - Западный фронт с 23.06.1941г по 05.06.1944 г, затем 3-ий Белорусский с 05.06.1944г. по 09.05.1945г., гвардии лейтенант, имеющий награды: орден \"Красной звезды\" (30.10.1944г.), медали- \"За отвагу\"(20.03.1945г), За взятие Кёнигсберга\"(1945г), \"За оборону Москвы\", \"За победу над Германией\". Точную дату смерти я не знаю, но дети Василия и Ираиды ( мои двоюродные брат и сестра), всю жизнь прожившие рядом с дедом и бабушкой, неужели они ничего не могут сделать, хотя бы к 60-летию Победы? Дед умер первым.Участок №459757 выделялся ему. Может в документации кладбища сохранилась дата смерти?', 'На кладбище существует книжный архив, он очень большой. Для того чтобы узнать дату смерти, нужно пролистать очень много книг или можно обратиться в архив ЗАГСа(пишете заявление о том что хотели бы узнать точные годы жизни). Работники ЗАГСа найдут архивную запись и предоставят необходимую информацию. К сожалению дубликат свидетельства о смерти Вы получить не сможете, так как его выдают только близким родственникам(родители, дети).', 1, NULL, '2017-06-05 04:55:48'),
(183, 'question', 97, 4832, 'Можно ли захоронить урну с прахом к  родственной могиле,  что для этого надо и  куда обращаться? ', 'Да можно. Для этого необходимо обратиться в администрацию кладбища, написать заявление, предоставить свидетельство о смерти ранее захороненного родственника и свидетельство о смерти человека, которого будете хоронить.', 1, NULL, '2017-06-05 04:55:48'),
(192, 'question', 6, NULL, 'Можно ли купить место на Левобережном кладбище и сколько это будет стоить?', 'Места на кладбищах нашего города предоставляются бесплатно, но заранее место приобрести никак нельзя. ', 0, NULL, '2017-06-05 04:55:48'),
(186, 'question', -1, NULL, 'Добрый день, меня зовут Дружинина Елена Павловна. буквально недавно узнали, что мой двоюродный брат и его отеца больше нет среди живых ( Князькин Денис Геннадьевич и Князькин Геннадий Иванович) и благодаря вашему сайту, мы нашли могилу моего брата- это Князькин Денис Геннадьевич (18 октября 1979 г-22 августа 2013г) участок 6715, но вопрос состоит в другом, мы на вашем сайте не можем найти место захоронения моего  родного дяди,  Князькина Геннадия Ивановича, я не помню дату рождения он  умер за несколько лет до смерти своего сына( так сообщили соседи по квартире).Очень вас прошу помочь найти могилу дяди т.е. Князькина Геннадия Ивановича.Моя мама Кузнецова(Князькина) Надежда Ивановна является родной сестрой Князькина Геннадия Ивановича.(хотя бы знать где похоронены наши родные). Мы проживаем в г Екатеринбурге, а наша мама вг. Красноуфимск.(d-elena77@list.ru Мой эл. адрес.)', '', 0, NULL, '2017-06-05 04:55:48'),
(189, 'question', 12, NULL, 'я оплатила за фото на эмали и за установку сама я с челябинска как я могу увидеть сделаную работу', 'После выполнения работ на сайте должна обновиться фотография захоронения. Если этого не произошло, свяжитесь с менеджером, у которого делали заказ.', 1, NULL, '2017-06-05 04:55:48'),
(307, 'question', -1, NULL, 'на южном кладбище есть ритуальный зал', '', 0, NULL, '2017-06-05 04:55:48'),
(308, 'question', -1, NULL, 'есть ли рассрочка на памятник', '', 0, NULL, '2017-06-05 04:55:48'),
(309, 'question', -1, NULL, 'Хороните ли вы по мусульманским обычаям?', '', 0, NULL, '2017-06-05 04:55:48'),
(310, 'question', -1, NULL, 'PqQI34 http://brothosonkonlonwon.ru', '', 0, NULL, '2017-06-05 04:55:48'),
(311, 'question', -1, NULL, 'исправьте пожалуйста дату рождения Тарасенко Михаила Архиповича на 20.06.1935г вместо указанной 07.06.1935г . на кресте указаны правильные даты смерти и рождения. с уважением , сын Тарасенко Михаила Архиповича .', '', 0, NULL, '2017-06-05 04:55:48'),
(312, 'question', -1, 6585, 'Добрый день! Помогите, пожалуйста отыскать  место захоронения Болтачёва Никанора Филипповича. Похоронен был приблизительно с 30го по 40ой год прошлого века на кладбище посёлка старая магнитка и должен быть перезахоронен на левобережном кладбище ', '', 0, NULL, '2017-06-05 04:55:48'),
(196, 'question', 6, NULL, 'Как найти могилу похороненного из морга как невостребованный', 'Здравствуйте! Если человека хоронят как «невостребованного», то необходимо выяснить номер под которым был похоронен человек. Для этого необходимо написать заявление в морг о предоставлении данной информации. Далее, после того как номер будет известен, нужно обратиться на Южное кладбище к смотрителю. Смотритель внесет в систему данные об умершем и предоставит Вам данные о том, где был захоронен человек. ', 1, NULL, '2017-06-05 04:55:48'),
(198, 'question', -1, 1261, 'Как можно заменить фото могилы на сайте?  И как добавить новое захоронение и его фото в раздел инвентаризации?', '', 0, NULL, '2017-06-05 04:55:48'),
(199, 'question', -1, 1261, 'Можно ли оставить заявку на замену фото на сайте, сменили таблички на захоронениях, участок 2797, южное кладбище, захоронены Шарапова Е.А. и Гнетов В.В. На фото  нас сайте ужасный вид и нет табличек. Спасибо', '', 0, NULL, '2017-06-05 04:55:48'),
(200, 'question', 12, NULL, 'Здравствуйте! Мы хотели бы выложить плиткой могилку, но дело в том, что находимся не в Магнитогорске, а в другом городе. Можно ли с Вами связаться по сотовой связи или через интернет?', 'Здравствуйте! Вы можете связаться с нашими мастерами по телефонам, указанным на странице <a href=\"/public/tile.php\" target=\"_blank\">«Выкладка плитки»</a>. Они Вас проконсультируют, если будет нужно, то предоставят фото ранее выполненных работ. Проедут на место, сделают все необходимые замеры и сообщат Вам о стоимости и сроках работ, которые необходимо провести.', 1, NULL, '2017-06-05 04:55:48'),
(201, 'question', 55, 5415, 'Добрый день!!! Помогите, пожалуйста. Через поиск на сайте нашла (как подозреваю) могилу сестры, но там видны только фамилия и имя, дат нет. Прочитала, что на кладбищах существуют специальные книги учета-регистрации захоронений. Есть ли они на левобережном кладбище и где они находятся?', 'Здравствуйте! На левобережном кладбище, как и на всех остальных, существуют книжные архивы. Вы можете обратиться в администрацию кладбища, где Вам помогут разыскать интересующее Вас захоронение.', 1, NULL, '2017-06-05 04:55:48'),
(228, 'question', -1, NULL, 'Почему не установлена фотография Киселевой Наталье Илларионовне, все оплачено, накладная №180 от 18 мая 2013г.', '', 0, NULL, '2017-06-05 04:55:48'),
(304, 'question', -1, NULL, 'Здравствуйте, на Южном кладбище нету фотографии с могилы Рыжковой Натальи Михайловны, хотя раньше фото было. Умерла 20 ноября 2015 года', '', 0, NULL, '2017-06-05 04:55:48'),
(305, 'question', -1, 6490, 'Можно ли сделать инвентаризацию удаленно? Прислав по электронной почте скан паспорта и скан св-ва о смерти.', '', 0, NULL, '2017-06-05 04:55:48'),
(306, 'question', -1, 6364, 'Здравствуйте! на южном кладбище похоронена моя бабушка. не могу найти могилу. через поиск захоронений тоже не нашла. помогите пожалуйста найти Титлянову Анфису Петровну умерла 1997-1998 точнее незнаю. спасибо', '', 0, NULL, '2017-06-05 04:55:48'),
(299, 'question', -1, NULL, 'Добрый день. Я проживаю в другом городе.Родители захоронены на Ново-северном кладбище.Я слышала,что при получении удостоверения на захоронение будет предоставляться скидка на установку памятника и ограды. Если вместо двух памятников мы хотим сделать общий , то скидка будет , как на один? А на ограду скидка каким образом распространяется.?На один заказ или количество захороненных? В ограде 5 родственников. ', '', 0, NULL, '2017-06-05 04:55:48'),
(216, 'question', -1, 5603, 'Добрый день, мои родственники похороненны на правобережном кладбище, не так давно рядом с нашими захоронениями так называемые \"соседи\" поставили новую ограду на искосок тем самым перекрыв проход к нашим захоронениям. Теперь не возможно пройти к нашим могилам, преходится либо перелазить через другие ограды, либо идти по головам чьих то умерших родственников. Каждое родительское стоит шум, гам и ругань из за этой ограды. Номер участка этих нарушителей 29297 там захоронен Славута Александр Степанович и еще 2 человека год последнего захоронения 2008. Просим принять меры по демонтажу угла этого ограждения, который мешает сотням человек добраться к могилам своих близких.', '', 0, NULL, '2017-06-05 04:55:48'),
(303, 'question', -1, NULL, 'КАК ПОЛУЧИТЬ УДОСТОВЕРЕНИЕ О ЗАХОРОНЕНИИ', '', 0, NULL, '2017-06-05 04:55:48'),
(224, 'question', 12, NULL, 'Добрый день! мы заказали благоустройство могилы, где мы можем посмотреть фотоотчет?', 'Фотографии выкладываются на страницу захоронения. Если Вы заказывали благоустройство в нашей компании - они будут обновлены в течение 1-2 дней после проведения работ. Если в другой - сообщите об изменениях на участке в администрацию кладбища, на котором находится захоронение.', 1, NULL, '2017-06-05 04:55:48'),
(225, 'question', -1, NULL, 'в поиске нет отметки о захоронении мамы и папы Миндарова Мунибя Зайнулловна и Миндаров Медхат Минхаирович.для связи телефон 43-43-05', '', 0, NULL, '2017-06-05 04:55:48'),
(297, 'question', -1, NULL, 'здраствуйте можно узнать сколько стоит раскопать яму', '', 0, NULL, '2017-06-05 04:55:48'),
(298, 'question', -1, NULL, 'сколько стоят услуги похоронного агента\r\n', '', 0, NULL, '2017-06-05 04:55:48'),
(230, 'question', 13, NULL, 'Мой отец Андреев Георгий Сергеевич,умер 7 мая 1990 год.Похоронен на левобережном кладбище.Я ухаживаю за могилой.Могу ли я сделать паспорт захоронения,без свидетельства о смерти.Имея свидетельство о своем рождении.', 'Для оформления удостоверения на захоронение необходимо именно свидетельство о смерти, если оно утеряно, то с 15 ноября 2015 года можно получить удостоверение на любом кладбище нашего города.(Левобережное, Правобережное, Ново-северное, Южное)', 1, NULL, '2017-06-05 04:55:48'),
(296, 'question', -1, NULL, 'До какого времени можно будет получить документ о том, что был захоронен кто-то', '', 0, NULL, '2017-06-05 04:55:48'),
(233, 'question', 13, 5821, 'Какие документы нужны для получения удостоверения захоронения?\r\n', 'Для получения удостоверения необходимо иметь при себе документ, удостоверяющий личность (паспорт или СНИЛС), а также свидетельство о смерти захороненного.', 1, NULL, '2017-06-05 04:55:48'),
(234, 'question', -1, 5821, 'является ли обязательным получение паспорта на захоронение? платная ли эта услуга?', '', 0, NULL, '2017-06-05 04:55:48'),
(267, 'question', -1, 6076, 'Как осуществить предварительную запись на получение паспорта захоронения', '', 0, NULL, '2017-06-05 04:55:48'),
(294, 'question', -1, NULL, 'xkcIQX  <a href=\"http://jowhzvgafcex.com/\">jowhzvgafcex</a>, [url=http://nxixfljwfuhn.com/]nxixfljwfuhn[/url], [link=http://uxwobfwzcyzb.com/]uxwobfwzcyzb[/link], http://jifndmtdvlti.com/', '', 0, NULL, '2017-06-05 04:55:48'),
(295, 'question', -1, NULL, 'Просмотр по карте не работает, оплата прошла, письма с подтверждением оплаты не пришло.Ни один браузер ни в Windows ни в MAC os карту не открывает. Как быть?', '', 0, NULL, '2017-06-05 04:55:48'),
(293, 'question', -1, 6364, 'Здравствуйте! помоготе найти могилу на левобережном кладбище, подхоронена Фатеева татьяна Викторовна  умерла 08,11,2004.Спасибо', '', 0, NULL, '2017-06-05 04:55:48'),
(241, 'question', -1, 5881, 'Здравствуйте! Помогите пожалуйста найти место захоронения (квартал, участок) моей бабушки. Харета Мария Архиповна, умерла 13 октября 1996 года. Похоронена на Левобережном кладбище. На могиле может быть установлен деревянный (самодельный крест), но вероятнее всего и этого нет. Поиск на вашем сайте результатов не дал.\r\n С уважением Юркина Ирина Вячеславовна. E-mail: solo80kotik@yandex.ru ', '', 0, NULL, '2017-06-05 04:55:48'),
(292, 'question', -1, 6364, 'Здравствуйте! Помогите пожалуйст найти могилу бабушки. В поисковике нет. но точно знаю, что похоронили на южном кладбище.знаю только ФИО и дату рождения. Титлянова Анфиса Тетровна 4 марта родилась.спасибо буду очень благодарна.', '', 0, NULL, '2017-06-05 04:55:48'),
(247, 'question', -1, 5592, 'Здравствуйте. Благодарю за то, что нашли захоронение моего прадеда Багрова Р.Ф и прислали фотографию его захоронения. Родственники уже давно решили , что могилы нет. Теперь вот такой вопрос- паспорт захоронения на могилы умерших обязательно оформлять? Если да, то сколько это стоит, если стоит и сроки оформления? Что будет , если не оформить паспорт? И что делать, если нет свидетельства о смерти? ', '', 0, NULL, '2017-06-05 04:55:48'),
(248, 'question', -1, 5592, 'За могилой моего прадеда никто не ухаживал. Если я Вам перешлю отсканированную его фотографию - возможно ли ее поместить на памятнике? Знаю, что нужно оплатить - оплатим, даже если нужно будет приехать', '', 0, NULL, '2017-06-05 04:55:48'),
(249, 'question', -1, NULL, 'Надо ли регистрировать землю на кладбище после захоронения', '', 0, NULL, '2017-06-05 04:55:48'),
(291, 'question', -1, NULL, 'Мой дедушка Козачков П.Д.похоронен на левобережном кладбище.Я ухаживаю за могилой.Могу ли я - внучка получить паспорт на захоронение,если свидетельство о смерти утеряно и какие для этого нужны документы?', '', 0, NULL, '2017-06-05 04:55:48');
INSERT INTO `questions` (`id`, `type`, `category_id`, `author`, `question`, `answer`, `public`, `creator`, `created`) VALUES
(251, 'question', -1, NULL, 'Уважаемый свайт!Была обрадована присланной ссылке и возможности пользоваться услугами Вашего сайта Радость моя оказалась преждевременной,т.к.не могу пройти регистрацию.Мой мобильный телефон содержит12 цифр,окно регистрации дает возможность вписывать номер от 0 до 9 цифр.Возможно,именно это и есть ПРИЧИНА моей неудачной попытки зарегистрироваться. Буду рада получить ОТВЕТ на свой вопрос,это для меня очень ВАЖНО!Сообщаю  адрес моей эл.почты:baba.dina@mail.ru', '', 0, NULL, '2017-06-05 04:55:48'),
(252, 'question', -1, NULL, 'Удостоверение о захоронении-это тот же паспорт на захоронение? И как это связано с \"приватизацией участков под захоронение?', '', 0, NULL, '2017-06-05 04:55:48'),
(253, 'question', -1, NULL, 'Обязательно ли получать паспорт на захоронение?', '', 0, NULL, '2017-06-05 04:55:48'),
(254, 'question', -1, NULL, 'Идут слухи о приватизации земельного участка?\r\n', '', 0, NULL, '2017-06-05 04:55:48'),
(255, 'question', -1, NULL, 'Едет вопрос о приватизации места захоронения?', '', 0, NULL, '2017-06-05 04:55:48'),
(256, 'question', -1, NULL, 'надо ли приватизировать участок', '', 0, NULL, '2017-06-05 04:55:48'),
(259, 'question', 13, NULL, 'Здравствуйте...слышал такую новость...что все должны до нового года зарегистрировать свои могилы ...будто после нового года будет за деньги...а потом и вовсе незарегистрированные могилы будут сравнивать с землёй...', 'Здравствуйте! С 14 июля 2015 года начали выдавать удостоверения на захоронения. К сожалению большинство людей подумали, что идет некая приватизация земли. Удостоверения действительно выдаются на кладбищах нашего города, но они выдаются БЕСПЛАТНО. Данная процедура будет длиться в течение 3-4 лет, все это время выдача удостоверений будет производится бесплатно.\r\n<br />\r\n____________________________________________________\r\n<br />\r\nПаспортизация будет проводиться до 2019 года. Всё это время она будет проводиться БЕСПЛАТНО. А по поводу того, что будут сравнивать с землёй - очередные слухи. Закон о повторных захоронениях вступит в силу в 2018 году, но даже сейчас в предварительном тексте закона говорится, что повторное захоронение будет производиться только по решению суда.', 1, NULL, '2017-06-05 04:55:48'),
(260, 'question', -1, 6006, 'Вчера мы сделали заявку на паспорт захоронения. Как долго он будет оформляться? И как узнать о том, когда его можно получить?', '', 0, NULL, '2017-06-05 04:55:48'),
(261, 'question', -1, 6041, 'Здравствуйте.Мой отец Бычковский Петр Иванович захоронен 1994 Могила №# 536232. Другая могила с красной  звездочкой и с фамилией ЕЖИКОВ уже была,причем данных о ней и об усопшем нет.В день похорон отца из за размеров уже заказанной изгороди пришлось ее тоже оградить.Мы за ней присматриваем  20 лет.Как поступить  нам с ЕЖИКОВЫМ при  получении паспорта на отцовскую могилу? Вопрос от дочери Логачевой Галины Петровны', '', 0, NULL, '2017-06-05 04:55:48'),
(262, 'question', -1, 6041, 'Здравствуйте.Мой отец Бычковский Петр Иванович захоронен 1994 Могила №# 536232. Другая могила с красной  звездочкой и с фамилией ЕЖИКОВ уже была,причем данных о ней и об усопшем нет.В день похорон отца из за размеров уже заказанной изгороди пришлось ее тоже оградить.Мы за ней присматриваем  20 лет.Как поступить  нам с ЕЖИКОВЫМ при  получении паспорта на отцовскую могилу? Вопрос от дочери Логачевой Галины Петровны', '', 0, NULL, '2017-06-05 04:55:48'),
(263, 'question', -1, 6027, '29 октября 2015 г. через личный кабинет подал заявки на получение паспортов на 5 захоронений. Где, когда и как можно получить эти паспорта. Дорогобид Виктор Григорьевич', '', 0, NULL, '2017-06-05 04:55:48'),
(270, 'question', -1, NULL, 'Моя неродная бабушка , которая с1949 года воспитывала мою маму  умерла в 1988году и захоронена на Левобережном кладбище . Опекунство над детьми она не оформила да и мы никогда не думали , чтобы взять над ней опеку . Документов подтверждающих кровное родство у нас естественно нет . Но на всем протяжении этих лет мы ухаживаем за ее могилой . Моя мама  спрашивает как можно изыскать возможность и похоронить ее рядом с БАБУШКОЙ . Номера захоронения я не помню , но звали ее Серикова Александра  Ивановна 1911 года рождения. Похоронена 1 . 01 . 88 .  Можем ли мы решить этот вопрос . ', '', 0, NULL, '2017-06-05 04:55:48'),
(266, 'question', 12, NULL, 'Можно ли заказать памятник,сделать 100% предоплату,но установить через пять-шесть месяцев?', 'Да, конечно. Вы можете к примеру заказать памятник осенью, мы его изготовим, и положим на склад до начала теплого сезона. Весной, когда будет возможна установка, памятник будет смонтирован на захоронении и Вам сообщат о готовности. Также будут обновлены фотографии на сайте. Кроме того, в зимнее время действует беспроцентная рассрочка на памятники, ограды и другие элементы благоустройства.', 1, NULL, '2017-06-05 04:55:48'),
(271, 'question', -1, 6105, 'Моя неродная бабушка , которая с1949 года воспитывала мою маму  умерла в 1988году и захоронена на Левобережном кладбище . Опекунство над детьми она не оформила да и мы никогда не думали , чтобы взять над ней опеку . Документов подтверждающих кровное родство у нас естественно нет . Но на всем протяжении этих лет мы ухаживаем за ее могилой . Моя мама  спрашивает как можно изыскать возможность и похоронить ее рядом с БАБУШКОЙ . Номера захоронения я не помню , но звали ее Серикова Александра  Ивановна 1911 года рождения. Похоронена 1 . 01 . 88 .  Можем ли мы решить этот вопрос . ', '', 0, NULL, '2017-06-05 04:55:48'),
(272, 'question', -1, 6027, 'Почему исчезли фото захоронений на участках 41821 и 41435 на Правобережном кладбище?', '', 0, NULL, '2017-06-05 04:55:48'),
(273, 'question', -1, 6141, 'Здравствуйте! Можно ли получить паспорта на захоронения близких, если свидетельства о их смерти находятся за границей у уехавших туда жить родственников. Я тоже являюсь родственницей (внучкой) и живу в Магнитогорске.', '', 0, NULL, '2017-06-05 04:55:48'),
(274, 'question', -1, 6184, 'Ежегодно не можем свободно с центральной дороги пройти к могилам родителей (отец-участник ВОВ). Участок 29525.Соседние ограды настолько расширили, что приходится боком проходить,рвем одежду, пачкаемся, нет возможности качественно убраться на могилах.Ведь кто-то должен призвать к порядку этих граждан! уже нет   дорожек между рядами!Предлагаю ограды, сделанные с нарушением габаритов, демонтировать и сдавать на металлолом!   Уверена- меня поддержат многие! Восстановите проходы- порядка станет больше! ', '', 0, NULL, '2017-06-05 04:55:48'),
(275, 'question', -1, NULL, 'Здравствуйте! Спасибо за Вашу работу по поиску захоронений. Нашла номер участка (115552), хотела бы сходить на кладбище. Есть ли карта левобережного кладбища, как добраться до могилы?', '', 0, NULL, '2017-06-05 04:55:48'),
(277, 'question', -1, 6296, 'Здравствуйте, у нас в ограде три покойника. инвентаризацию провели по одному покойнику. Нужно ли, проводить инвентаризацию по другим?', '', 0, NULL, '2017-06-05 04:55:48'),
(279, 'question', -1, NULL, 'Можно ли через интернет заказать удостоверение захоронения?\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n', '', 0, NULL, '2017-06-05 04:55:48'),
(280, 'question', -1, NULL, 'Пожалуйста, не могу найти место захоронения на Новосеверном кладбище - Зиновьев Николай Иванович. Точно захоронен там, вдоль дороги, но не могу найти.', '', 0, NULL, '2017-06-05 04:55:48'),
(281, 'question', -1, NULL, 'Скажите, как вы работаете с Казахстаном? Сама живу в Казахстане, часто ездить не могу, а вот Вашими услугами воспользовалась бы с удовольствием. Спасибо за ответ.\r\n', '', 0, NULL, '2017-06-05 04:55:48'),
(282, 'question', -1, NULL, 'Пытаюсь зарегистрироваться,но ничего не получается На участке  29313 похоронены мои родители и моя бабушка из нашей семьи я осталась одна и ухаживаю за могилами хотя живу в г. Челябинске все свидетельства о смерти всех находятся у меня и мне бы не хотелось чтобы до моего приезда и оформления паспортов на могилы уже кто-то из родственников это сделал, ведь как я поняла что оформить эти паспорта можно и без предъявления свидетельства о смерти. Петрова-Сидоренко Наталья Николаевна г.Челябинск', '', 0, NULL, '2017-06-05 04:55:48'),
(283, 'question', -1, 656, 'СУЩЕСТВУЕТ ЛИ ЭЛЕКТРОННАЯ ОЧЕРЕДЬ НА ПОЛУЧЕНИЕ СВИДЕТЕЛЬСТВА О ЗАХОРОНЕНИИ, КАК МОЖНО ЗАПИСАТЬСЯ? ', '', 0, NULL, '2017-06-05 04:55:48'),
(284, 'question', -1, 6312, 'Где можно получить удостоверение на захоронение', '', 0, NULL, '2017-06-05 04:55:48'),
(300, 'question', -1, NULL, 'Зиновьев Николай Иванович, захоронен на Новосеверном кладбище, точно. Почему то в базе данных его нет. Как мне его найти? Пожалуйста, помогите.', '', 0, NULL, '2017-06-05 04:55:48'),
(301, 'question', -1, NULL, 'паспорт захоронения выдается только на кладбищах7', '', 0, NULL, '2017-06-05 04:55:48'),
(302, 'question', -1, NULL, 'возможно ли внучке получить удостоверение захоронения (пройти паспортизацию) бабушки и какие документы при себе нужно иметь. Возможно ли это сделать с копией свидетельства о смерти, т.к. оригинал находится в доме \"Ветеран\", администрация которого занималась захоронением бабушки. куда при этом нужно обращаться? заранее благодарна за ответ.', '', 0, NULL, '2017-06-05 04:55:48'),
(365, 'question', -1, NULL, 'Здравствуйте! Хочу узнать, остались ли в настоящее время на территории Левобережного кладбища захоронения так называемые \"детские могилы\"? Рядом с ними было захоронение моего деда, мама просила попытаться найти ее. Дед был похоронен летом 1948 года, как репрессированному, ему был не положен памятник с указанием его данных, только какой-то красный кружок на табличке. Есть ли смысл начинать поиски или эти захоронения уже использованы повторно? Знаю, что его ряд был вторым или третьим от еврейского кладбища. Буду благодарна за любую информацию', '', 0, NULL, '2017-06-05 04:55:48'),
(366, 'question', -1, 6691, 'Живу в Ялте, заказал возложение цветов, оплатил, всё хорошо. Заказал уборку, мастер позвонил, назвал цену, а как дальше оплачивать не знаю.', '', 0, NULL, '2017-06-05 04:55:48'),
(367, 'question', -1, 6691, 'Куда платить за уборку могилы?', '', 0, NULL, '2017-06-05 04:55:48'),
(368, 'question', -1, NULL, 'где можно узнать расценки на ваши услуги и сколько стоят услуги вашего агента', '', 0, NULL, '2017-06-05 04:55:48'),
(369, 'question', -1, 3855, 'Здравствуйте. Если у нас заявлено удостоверение на захоронение на сайте, как получать это удостоверение  и где? И достаточно ли для получения удостоверения на захоронение паспорта заявителя или что то ещё нужно?', '', 0, NULL, '2017-06-05 04:55:48'),
(370, 'question', -1, NULL, 'На Левобережном кладбище (129 квартал) похоронен мой дядя Белов Леонид Михайлович (28.02.41-19.05.1982г.г.). На памятнике указан Белов Л.М. Фото отсутствует (Фотография испортилась). За могилой ухаживаем, но в электронной базе сведения о нём отсутствуют. Кроме того, на Левобережном кладбище захоронен его брат Белов Александр Михайлович (28.01.1929-16.11.1990 г.г.). Его также нет в электронной базе, за могилой никто из родственников не ухаживает, т. к. не можем найти захоронение.', '', 0, NULL, '2017-06-05 04:55:48'),
(371, 'question', -1, NULL, 'Здраыствуйте!мы похоронили бабушку возле ее бывшего мужа но пришли соседи и сказали что место принадлежит им! Что может произойти?возможна ли принудительная эксгумация?спасибо', '', 0, NULL, '2017-06-05 04:55:48'),
(372, 'question', -1, NULL, 'как по номеру участка найти квартал захоронения?', '', 0, NULL, '2017-06-05 04:55:48'),
(373, 'question', -1, 4164, 'Добрый день! На правобережном кладбище, участок #40935 был заменен памятник. Как можно заказать новую фотографию? В администрации сказали обратиться на сайт.', '', 0, NULL, '2017-06-05 04:55:48'),
(374, 'question', -1, NULL, 'не могу найти захоронение ----Берестин Константин Николаевич.Умер в 1996г.,родился---1908г.', '', 0, NULL, '2017-06-05 04:55:48'),
(375, 'question', -1, 2894, 'Родственник проживающий в другом городе желает оформить паспорт захоронения, возможно ли это сделать для него с помощью родственников проживающих в Магнитогорске. Куда обращаться и какие документы необходимо предоставить?', '', 0, NULL, '2017-06-05 04:55:48'),
(376, 'question', -1, NULL, 'Не приходит смс с кодом подтверждения. Что делать?', '', 0, NULL, '2017-06-05 04:55:48'),
(377, 'question', -1, NULL, 'Можно ли пройти на кладбище без свидетельства о смерти к родственникам?', '', 0, NULL, '2017-06-05 04:55:48'),
(378, 'question', -1, NULL, 'почему не приходит код подтверждения регистрации?', '', 0, NULL, '2017-06-05 04:55:48'),
(379, 'question', -1, NULL, 'на левобережном кладбище захоронены мои близкие без ограды. но есть еще рядом одно место. могу ли им воспользоваться. что для этого нужно', '', 0, NULL, '2017-06-05 04:55:48'),
(380, 'question', -1, NULL, 'какой квартал?', '', 0, NULL, '2017-06-05 04:55:48'),
(381, 'question', -1, NULL, 'Не можем найти могилу Огурцова Валерия захоронен в декабре 1996 года на Левобережном кладбище. Архивов этого года к сожалению в конторе Левобережного кладбища не оказалось! ', '', 0, NULL, '2017-06-05 04:55:48'),
(382, 'question', -1, NULL, 'Ямщяков  Владимир Емельянович где захоронен', '', 0, NULL, '2017-06-05 04:55:48'),
(383, 'question', -1, NULL, 'Никак не можем зарегистрироваться на сайте не приходит код на телефон моя почта 242055mts@mail.ru', '', 0, NULL, '2017-06-05 04:55:48'),
(384, 'question', -1, NULL, 'Почему не присылается код?', '', 0, NULL, '2017-06-05 04:55:48'),
(385, 'question', -1, NULL, 'Здравствуйте! Могилу моего деда со всех сторон прижали оградами так, что невозможно пройти, приходится перепрыгивать заборы, что нереально для 82-х летнего отца. Куда обратиться с просьбой о переносе соседних оград. И должен ли кто-то контролировать установку оградок? Пройти на могилы усопших родственников зачастую  невозможно! ', '', 0, NULL, '2017-06-05 04:55:48'),
(386, 'question', -1, NULL, 'почему левобережное и южное кладбище фотографируют с датой и фото умершего,а правобережное только с датой?', '', 0, NULL, '2017-06-05 04:55:48'),
(387, 'question', -1, NULL, 'Куда нужно обратиться, чтобы убрали свалку возле захоронений, которую набросали работники кладбища перед родительской?', '', 0, NULL, '2017-06-05 04:55:48'),
(388, 'question', -1, NULL, 'здравствуйте! подскажите,пожалуйста,что даёт паспорт захоронения?(невозможность \"подселения\" другими родственниками без согласия владельца паспорта? А также любые другие правовые действия с могилой? заранее,спасибо!!!', '', 0, NULL, '2017-06-05 04:55:48'),
(389, 'question', -1, NULL, 'Помогите найти захоронение брата. Кирюшин Виктор Николаевич.20.03.79г.есть вероятность,что захоронен как безимянный,просто с номером.', '', 0, NULL, '2017-06-05 04:55:48'),
(390, 'question', -1, 7271, 'Добрый день! Если я знаю номер учатска. как узнать на каком он квартале расположен?', '', 0, NULL, '2017-06-05 04:55:48'),
(391, 'question', -1, NULL, 'Хочу зарегистрироваться на сайте, но не могу, т.к.не имею телефона с российской симкой( живу в другой стране).Возможно ли зарегистрироваться через е-майл?', '', 0, NULL, '2017-06-05 04:55:48'),
(392, 'question', -1, 7287, 'Здравствуйте, по номеру участка захоронения, на кладбище трудно найти могилу. В информации об участке отсутствует номер квартала. Можно ли найти схему расположения кварталов и участков?', '', 0, NULL, '2017-06-05 04:55:48'),
(393, 'question', -1, NULL, 'захоронение на 17 мая 2016 года', '', 0, NULL, '2017-06-05 04:55:48'),
(394, 'question', -1, NULL, 'Как получить сведетельство о захоронения ', '', 0, NULL, '2017-06-05 04:55:48'),
(395, 'question', -1, 7177, 'Здравствуйте!Как найти могилу Щерба Михаила Артемовича?Умер2005 примерно точно незнаю', '', 0, NULL, '2017-06-05 04:55:48'),
(396, 'question', -1, NULL, 'Здавствуйте. Благодаря вашему сайту я нашла умершего которого очень долго искала.Очень бы хотелось придти на могилку и положить цветы. Как можно по номеру участка найти захороненного?', '', 0, NULL, '2017-06-05 04:55:48'),
(397, 'question', -1, NULL, 'Сколько стоит копка могилы?', '', 0, NULL, '2017-06-05 04:55:48'),
(398, 'question', -1, NULL, 'Здравствуйте, я живу в германии,но родители похоронены в Магнитогорске, я хочу благоустроить могилу,памятник на двоих,выложить все плиткой,возможно ли мне это сделать,сколько мне это стоить и как я могу это все оплатить?', '', 0, NULL, '2017-06-05 04:55:48'),
(399, 'question', -1, NULL, 'Как узнать место захоронения деда если неизвестны полные данные,год смерти приблизительно 1959-1960 фамилия Довгаль Никита', '', 0, NULL, '2017-06-05 04:55:48'),
(400, 'question', -1, NULL, 'Добрый день.Мы заказывали благоустройство могилы 14.09.2014 в вашей компании а фотографии об изменениях на участке нет?', '', 0, NULL, '2017-06-05 04:55:48'),
(401, 'question', -1, 758, 'Здравствуйте!Подскажите,пожалуйста,свидетельство по инвентаризации нужно делать на каждое захоронение в ограде или одно на всех? Когда я оформляла свидетельства,мне сказали,что достаточно сделать его на одну могилу в ограде.', '', 0, NULL, '2017-06-05 04:55:48'),
(402, 'question', -1, 758, 'Можно ли узнать точнее могилу,если известен только квартал(захоронение 50-60 годов,могила не подписана).', '', 0, NULL, '2017-06-05 04:55:48'),
(403, 'question', -1, 758, 'Где похоронена Синицына Ирина Михайловна', '', 0, NULL, '2017-06-05 04:55:48'),
(404, 'question', -1, NULL, 'Добрый  день,   нашла  могилу родственника  , скажите  можно ли узнать кто его похоронил,', '', 0, NULL, '2017-06-05 04:55:48'),
(405, 'question', -1, NULL, 'зарегистрировалась на сайте,войти повторно не получается, система пишет такого телефона нет, а у меня осталась СМС с кодом подтверждения регистрации на  этом номере телефона. Помогите.', '', 0, NULL, '2017-06-05 04:55:48'),
(406, 'question', -1, NULL, 'Здравствуйте! Моя мама похоронена на Левобережном кладбище.Я бы хотела благоустроить место захоронения.Поменять памятник,выложить плитку,покрасить оградку,столик,скамейку.Я живу далеко от Магнитогорска и хотела бы узнать как заказать Ваши услуги по компьютеру.Помогите мне пожалуйста! Мой электронный адрес:\r\nodellin@msn.com. Заранее Вас благодарю!\r\n', '', 0, NULL, '2017-06-05 04:55:48'),
(407, 'question', -1, NULL, 'Мою маму Муратова Фаина Сергеевна похоронили в феврале 1952 года ,в феврале.онатбыла сиротой,погибла на производстве, на ММК,хоронила организация.мне было 11 месяцев.Свидетельства о смерти у меня нет,Но Манилу мне указали свидетели.записи нет,что делать?', '', 0, NULL, '2017-06-05 04:55:48'),
(408, 'question', -1, NULL, 'Здравствуйте! Я обращаюсь повторно с вопросом- где расположен участок с детскими могилами 1948 года? На нем был похоронен мой дед, как репрессированный, он не имел права на памятник и другую опознавательную информацию, я знаю как найти место его захоронения, но не могу найти сам участок. Мама описывает место от дороги в прямоугольнике между Братскими могилами, Мемориалом Носова и Еврейским кладбищем. Там действительно детские захоронения, но уже 50-х годов. Мы не претендуем на место для перезахоронения.  Мне нужны только координаты участка с детскими могилами 1948 года, чтобы сфотографировать его как память о деде. Помогите пожалуйста- моя мама тяжело больна, и каждый день требует от нас найти хотя бы участок с захоронениями этого года. Даже если он весь перезахоронен, прошу убедительно дать его координаты. Очень надеюсь на ответ Не верю что участок исчез бесследно или исчезла информация о нем. Первый раз писала в марте или апреле, но ответа не получила. Спасибо заранее', '', 0, NULL, '2017-06-05 04:55:48'),
(409, 'question', -1, 7245, 'Добрый день!\r\nЦелый месяц общаюсь с сотрудниками МП КПРУ г. Магнитогорск...Сотрудники сначала оперативно отвечают на вопросы, реагируют?, перезванивают....потом снова пропадают... никаких ответов и приветов,... м.б. не хотят отвечать на не очень удобные, но конкретные вопросы...! Хочу получить нормальный и конкретный контакт для общения...Я живу в СПб и мне нужно благоустроить захоронение прабабушки № 590028\r\nАтякшев Евгений Георгиевич +7 921  643 23 78   e-mail: evgeniy.atyakshev@gmail.com', '', 0, NULL, '2017-06-05 04:55:48'),
(410, 'question', -1, 7405, 'Здравствуйте. Я бы очень хотела бы найти могилу друга. На вашем сайте я нашла страницу захоронения,но на кладбище самом я думаю,что это будет проблема найти. Есть ли у вас услуга,не знаю как правильно назвать,чтоб кто то помог мне на кладбище соорентироваться и найти мне нужную могилу?', '', 0, NULL, '2017-06-05 04:55:48'),
(411, 'question', -1, NULL, 'Здравствуйте! нашла могилу своего отца и бабушки , чем была невероятно рада. но дело в том, что я живу в екатеринбурге, и не знаю никого из своих родственников по отцовской линии. скажите могли бы вы помочь поднять архивы, кто хоронил моих бабушку и отца и дать координаты. не знаю ка еще найти родственников, так как знаю только фамилию - Семеновы. Бабушка вроде жила на Лермонтова 80. спасибо большое заранее за любую помощь! ', '', 0, NULL, '2017-06-05 04:55:48'),
(412, 'question', -1, 7585, 'Личный кабинет клиента: изменился телефон и адрес эл.почты, кнопка \"изменить\" дает возможность корректировки только ФИО клиента. Как изменить остальное? спасибо.', '', 0, NULL, '2017-06-05 04:55:48'),
(413, 'question', -1, NULL, 'Мой племянник Гончарова Владимир Викторович похоронен 18.10.2015г. На Левобережном кладбище, номер участка - 704905, 2 июля 2016 было открытие ему памятника, по состоянию здоровья приехать не смогла, очень прошу обновить информацию по его захоронению, чтобы мы могли увидеть, что ещё не забываются у нас ребята прошедшие эту проклятую войну и раньше времени ушедшие от нас, кто от пули, а кто после пережившего в этой войне. Будем вам очень благодарны!', '', 0, NULL, '2017-06-05 04:55:48'),
(414, 'question', -1, NULL, 'если ухаживаю за могилой родственника (двоюродный дядя),но свидетельства о смерти негде взять. могу ли я туда в дальнейшем захоронить усопшего7', '', 0, NULL, '2017-06-05 04:55:48'),
(415, 'question', -1, NULL, 'где находится общее захоронение недоношенных деток.где их хоронят после роддома?', '', 0, NULL, '2017-06-05 04:55:48'),
(416, 'question', -1, NULL, 'Здравствуйте! Я вторично задаю вопрос. Мой отец Сергиенко Дмитрий Владимирович 01.11.1929г.р.похоронен на участке №596474, дата смерти 28.04.1986г. Но на участке №595879 имеется неизвестное захоронение с данными отца. Прошу разобраться:у человека не должно быть две могилы, это обстоятельство задевает чувства всех родных ', '', 0, NULL, '2017-06-05 04:55:48'),
(417, 'question', -1, 7717, 'Здравствуйте! Я Гайер Марина Владимировна,живу в Оренбурге. Много лет не могла найти могилу деда потому что на момент его смерти была 14 летним ребёнком и не запомнила место захоронения.Зимой узнала что в Магнитогорске существует ваш сайт и нашла фото с могилы моего деда. Написала вам с просьбой исправить ошибку в дате смерти,что вы и сделали очень оперативно! Приехав в отпуск решила навестить могилу,привести её в порядок,но теперь на запрос показать могилу сайт отвечает \"ничего не найдено\"! Как это может быть?! Неужели кому-то понадобилось это место?! Жду вашего ответа. Мой дед Забродин Николай Егорович (Георгиевич) дату рождения не помню,дата смерти 6 марта 1977 год.', '', 0, NULL, '2017-06-05 04:55:48'),
(418, 'question', -1, NULL, 'Добрый день. \r\nЗарегистрировалась на сайте. Хотела отметить могилу как посещаемую. Получила ответ, что пользователь с такими данными не существует. При повторной регистрации пишут, что пользователь с таким номером уже есть.', '', 0, NULL, '2017-06-05 04:55:48'),
(419, 'question', -1, NULL, 'Раньше на сайте была возможность узнать номер квартала, где расположен участок. Есть ли она сейчас или квартала вообще упразднены?', '', 0, NULL, '2017-06-05 04:55:48'),
(420, 'question', -1, NULL, 'Добрый день.Хотела ввести пометку о том, что мой отец ветеран ВОВ.Но возможности для пометки на его странице захоронения нет.Почему.', '', 0, NULL, '2017-06-05 04:55:48'),
(421, 'question', -1, NULL, 'l2O3jE http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(422, 'question', -1, NULL, 'Jp7uCW http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(423, 'question', -1, NULL, 'VFa7NV http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(424, 'question', -1, NULL, 'Был установлен новый памятник на могиле папы. Фото на эмалированной табличке осталось лежать у подножия плиты. Можно ли прикрепить это фото к плите? Могила на правобережном кладбище-Борисов Пётр Александрович', '', 0, NULL, '2017-06-05 04:55:48'),
(425, 'question', -1, NULL, '5OsVDv http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(426, 'question', -1, NULL, '5sgbgb http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(427, 'question', -1, NULL, 'wj6POW http://www.FyLitCl7Pf7kjQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(428, 'question', -1, NULL, 'Здравствуйте. Что даёт удостоверения захоронения?', '', 0, NULL, '2017-06-05 04:55:48'),
(429, 'question', -1, NULL, 'Куда обратиться с претензией?', '', 0, NULL, '2017-06-05 04:55:48'),
(430, 'question', -1, 5489, 'Добрый день ,как заменить фото на странице умершего уже с изменением,установили памятник', '', 0, NULL, '2017-06-05 04:55:48'),
(431, 'question', -1, NULL, 'Здравствуйте! Я живу в Севастополе, узнала о вашем сайте, спасибо что он есть.Я родилась в Магнитогорске, мои родители похоронены на вашем кладбище.Могу ли я по эл.почте отправить вам документы для получения удостоверения захоронения, ', '', 0, NULL, '2017-06-05 04:55:48'),
(432, 'question', -1, 7813, 'Здравствуйте! Куда нужно обратиться за удостоверением о захоронении?', '', 0, NULL, '2017-06-05 04:55:48'),
(433, 'question', -1, 7822, 'добрый день. я загрузила фотографии с места захоронения отца. но через некоторое время после проверки этих фото на сайте появился отчет с фотографией захоронения но с упавшей табличкой о дате смерти. нельзя ли поменять это фото на другое, я же выложила несколько фотографий. спасибо.', '', 0, NULL, '2017-06-05 04:55:48'),
(434, 'question', -1, 7855, 'Доброго времени суток. Моя бабушка захоронена на этом кладбище, могу ли я узнать кто делал из родственников похороны. и возможно ли найти контакт с ними ?', '', 0, NULL, '2017-06-05 04:55:48'),
(435, 'question', -1, 7822, 'нельзя ли поменять на вашем сайте фото с места захоронения. я в книгу памяти добавляла много фото, а родственники смотрят на сайте, а там фото с упавшей табличкой. Вообще то мы все поправляли. Спасибо.', '', 0, NULL, '2017-06-05 04:55:48'),
(436, 'question', -1, NULL, 'Сивухин Никита зиновьевич', '', 0, NULL, '2017-06-05 04:55:48'),
(437, 'question', -1, NULL, 'http://w.w.w/ Соберем для Вас по интернет базу данных контактов потенциальных клиентов для массовой продажи Ваших товаров и услуг в городе, стране или в мире. В базе - название, телефон, факс, местоположение, mail, имена руководителей или сотрудников итд Узнайте об этом подробнее! тел +79139230330 Skype: prodawez390 Whatsapp: +79139230330 Viber: +79139230330 Telegram: +79139230330 Email: nbirukov38@gmail.com Спасибо за быстрый ответ!\r\nСоберем для Вас по интернет базу данных контактов потенциальных клиентов для массовой продажи Ваших товаров и услуг в городе, стране или в мире. В базе - название, телефон, факс, местоположение, mail, имена руководителей или сотрудников итд Узнайте об этом подробнее! тел +79139230330 Skype: prodawez390 Whatsapp: +79139230330 Viber: +79139230330 Telegram: +79139230330 Email: nbirukov38@gmail.com Спасибо за быстрый ответ! http://w.w.w/', '', 0, NULL, '2017-06-05 04:55:48'),
(438, 'question', -1, 7906, 'Здравствуйте. Удостоверения на захоронение нужно обязательно получить лично? В какое время и где?', '', 0, NULL, '2017-06-05 04:55:48'),
(439, 'question', -1, NULL, 'Здравствуйте! Скажите, если я получу паспорт захоронения, на моем участке могут установить или заменить памятник без моего согласия?', '', 0, NULL, '2017-06-05 04:55:48'),
(440, 'question', -1, NULL, 'V3qgBb  <a href=\"http://lqrbxprlmsdo.com/\">lqrbxprlmsdo</a>, [url=http://othaduhromhp.com/]othaduhromhp[/url], [link=http://qyhiitbfvozr.com/]qyhiitbfvozr[/link], http://nzvxalfizxbz.com/', '', 0, NULL, '2017-06-05 04:55:48'),
(441, 'question', -1, 7947, 'Хотелось бы поменять фото на свежие, загруженные 3.10.2016. Спасибо. ', '', 0, NULL, '2017-06-05 04:55:48'),
(442, 'question', -1, 8013, 'размер 3х4,какие параметры оградки должны быть?', '', 0, NULL, '2017-06-05 04:55:48'),
(443, 'question', -1, 8013, 'здравствуйте! какие параметры оград вы предлагаете? ', '', 0, NULL, '2017-06-05 04:55:48'),
(444, 'question', -1, NULL, 'Т.к. Вы не отвечаете на электронную почту, вопрос остается открытым - как участвовать в инвентаризации родственникам, проживающим в другом городе и не имеющим возможность приехать? Есть ли возможность участия дистанционно или отправкой документов почтой, либо другие варианты? Объясните пожалуйста подробнее. Спасибо', '', 0, NULL, '2017-06-05 04:55:48'),
(445, 'question', -1, NULL, 'Родственники ', '', 0, NULL, '2017-06-05 04:55:48'),
(446, 'question', -1, NULL, 'Узнать о родственников', '', 0, NULL, '2017-06-05 04:55:48'),
(447, 'question', -1, NULL, 'Как узнать о наличии родственников умершего ', '', 0, NULL, '2017-06-05 04:55:48'),
(448, 'question', -1, 8062, 'КАК ОФОРМИТЬ ДОКУМЕНТЫ НА МОГИЛУ ЕСЛИ МЫ ЖИВЕМ В ДРУГОМ ГОРОДЕ И НЕТ ВОЗМОЖНОСТИ ПРИЕХАТЬ', '', 0, NULL, '2017-06-05 04:55:48'),
(449, 'question', -1, NULL, 'Здравствуйте, а можно ли узнать причину смерти или связаться с близкими усопшего? участок 120164, Культиков Эдуард Анатольевич.', '', 0, NULL, '2017-06-05 04:55:48'),
(450, 'question', -1, 8074, 'Здравствуйте!Подскажите пожалуйста,есть ли подобный сайт по агаповским кладбищам?', '', 0, NULL, '2017-06-05 04:55:48'),
(451, 'question', -1, 8108, 'Здравствуйте. Прошу сообщить мои координаты родственникам усобших Неклеёновым,это возможно?\r\nС уважением Ольга. Спасибо', '', 0, NULL, '2017-06-05 04:55:48'),
(452, 'question', -1, NULL, 'Здравствуйте, моя мама была замужем официально за мужчиной, который был а разводе. В 1997 году он умер и был захоронен на левобережном кладбище. В этом году умерла его первая супруга и она была похоронена ( без нашего согласия) рядом с мужем моей мамы. На основании чего она была захоронена на данном участке, если эти два человека давно в разводе! Все документы есть. Так же в этом году мы облагородили могилу и затратили не мало собственных средств. Как теперь разъединить эти могилы. Жду ответ . Т89068999101 Елена ', '', 0, NULL, '2017-06-05 04:55:48'),
(453, 'question', -1, 5008, 'Здравствуйте! Я добавила на страницу моего деда биографию, но она не появляется на экране. Пишется \"Ожидается проверка\". И так в течении длительного отрезка времени. Сколько времени проводится проверка информации?', '', 0, NULL, '2017-06-05 04:55:48'),
(454, 'question', -1, NULL, 'какое государственное пособие на захоронение и как его получить для похорон\r\n', '', 0, NULL, '2017-06-05 04:55:48'),
(455, 'question', -1, NULL, 'как долго будет длиться бесплатная приватизация земли и могил?', '', 0, NULL, '2017-06-05 04:55:48'),
(456, 'question', -1, NULL, 'как долго будет длиться бесплатная приватизация земли и могил?', '', 0, NULL, '2017-06-05 04:55:48'),
(457, 'question', -1, NULL, 'Можно ли сделать захоронение сверху уже имеющегося', '', 0, NULL, '2017-06-05 04:55:48'),
(458, 'question', -1, NULL, 'Можно ли сделать захоронение сверху уже имеющегося', '', 0, NULL, '2017-06-05 04:55:48'),
(459, 'question', -1, NULL, 'Можно ли сделать захоронение сверху уже имеющегося,сколько лет должно пройти для того чтоб можно было захоронить сверху уже имеющегося гроба', '', 0, NULL, '2017-06-05 04:55:48'),
(460, 'question', -1, NULL, 'NnpRXp http://www.FyLitCl7Pf7ojQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(461, 'question', -1, NULL, 'я привезла  землю с родителской магилы  .могу ли я  захоронить их в магнитогорске я живу в магнитке.что для этого мне надо? спасибо', '', 0, NULL, '2017-06-05 04:55:48'),
(462, 'question', -1, NULL, 'Прaкmuчески cамoе мощное ycтрoйcтвo нa pынкe. 3аряжаетcя om сoлнцa и cemи 220W. Пoлнorо зарядa порmamивноrо зарядного усmpойcmва POWER BANK 20000 mAh хвamaeт дo 10 полныx заpядok гaджетoв. \r\nMожem заpяжать cразу 2 гаджemа. Этo совершеннo новый уpoвень cвoбoды u мобилbноcmи для Bac u Bаших устройcmв. \r\nНебoлbшoй вес: 240 гp. \r\nИмeеm очень комnакmныe неболbшuе размеры: 120мм X 75мм x 22мм и вес вcего 240 rр. \r\nЧтo nозволяюm брaть noртативное зaряднoе ycmройсmво POWER BANK с сoбой и бытb cnokойным за нaдежнocmb u бeсnеребoйнocтb pабоmы свoerо rаджеma, кудa бы Bы не нaправлялиcь. Подxодиm ко всeм видaм гаджетов. \r\nДoполнительнo uмеeтся встроенный cвemoдuoдный фoнариk и кабелb-пeреxoдник. \r\nПoдробно http://urla.ru/10000NCL', '', 0, NULL, '2017-06-05 04:55:48'),
(463, 'question', -1, NULL, 'PBr9jE http://www.FyLitCl7Pf7ojQdDUOLQOuaxTXbj5iNG.com', '', 0, NULL, '2017-06-05 04:55:48'),
(464, 'question', -1, NULL, 'c3GfSU  <a href=\"http://jljeegfkryht.com/\">jljeegfkryht</a>, [url=http://uvvtarabfeiu.com/]uvvtarabfeiu[/url], [link=http://gvblquuoyzcm.com/]gvblquuoyzcm[/link], http://qlxsrjucbmko.com/', '', 0, NULL, '2017-06-05 04:55:48'),
(465, 'question', -1, NULL, 'ЗАГС выдающий свидетельство  о смерти имеет привязку к месту жительства? т.е. если человек жил в Ленинском районе - свидетельство выдает ЗАГС Ленинского района?если человек постоянно прописан в Башкирии, а в городе есть временная регистрация, где получать свидетельство о смерти?', '', 0, NULL, '2017-06-05 04:55:48'),
(466, 'question', -1, NULL, 'Добрый день, не принимайте это за спам и извините за беспокойство. \r\nя предлагаю Вам возможность начать получать 121% прибыли каждый день \r\nДля получения более подробной информации, перейдите сюда <a href=https://goo.gl/nSzmyJ>https://goo.gl/nSzmyJ</a>', '', 0, NULL, '2017-06-05 04:55:48'),
(467, 'question', -1, NULL, 'Ребят, а кто-то слышал про инвест проект - <a href=http://goo.gl/EiVm0G>http://goo.gl/EiVm0G</a> ?', '', 0, NULL, '2017-06-05 04:55:48'),
(468, 'question', -1, NULL, 'Как можно посмотреть карту, я знаю номер участка, но как его найти Бочаров Анатолий Парфирьевич', '', 0, NULL, '2017-06-05 04:55:48'),
(469, 'question', -1, NULL, 'ogezS5  <a href=\"http://wcoaopatidbe.com/\">wcoaopatidbe</a>, [url=http://ftihasmookch.com/]ftihasmookch[/url], [link=http://gjawdirpwhah.com/]gjawdirpwhah[/link], http://erilenqxknhf.com/', '', 0, NULL, '2017-06-05 04:55:48'),
(470, 'question', -1, NULL, 'Kонmакm – вeчный атpибут нacтоящей жuзнедеятелbнocти kaждого чeловeка. B эmoм uмеют нeобxoдuмoсть даже дoвольно caмoдосmатoчныe людu, свыкшueся улaживamь cвою жизнeдeятельнoстb cовсeм без nостopонней выpучkи. Paзлuчныe cвязu, npеkрacные и kpасочныe, дают возмoжнoсmb nротащиmb обнoвленнocmь в nовсeдневную oбычнyю жuзнь u отделaтbcя om тocкливоcти. \r\nЕcтb маcсa вapuaнтoв завecmu знаkoмство, но оченb kомфорmным и резулbтamuвным из uх числa являюmcя знaкoмсmвa онлaйн на mемаmuчeсkoм uнmepнет-сaйmе. Kakовorо бы общения вы ни pазыckивaлu, в kaкoм rоpодkе нu жилu и каkой бы нapужнocmью нu облaдалu – неcомнeнно пoмoжем вaм доcmuчb oжuдаeмогo резyлbтаmа! \r\nНаслаждайтеcь общением, знaкомbтeсb в свoe удoволbcтвие u ни в koeм случаe не дoзволяйтe нeвeселым pабoчим дням cделаmb вaшy жизнb беcцветнoй u одноoбразной! \r\n \r\nПодpобнo http://goo.gl/9o87MA', '', 0, NULL, '2017-06-05 04:55:48'),
(471, 'question', -1, NULL, 'J7ll3L  <a href=\"http://aydasuhzvtsb.com/\">aydasuhzvtsb</a>, [url=http://kusobqlpzgte.com/]kusobqlpzgte[/url], [link=http://xwkkpwrcnrxp.com/]xwkkpwrcnrxp[/link], http://uxainfurckic.com/', '', 0, NULL, '2017-06-05 04:55:48'),
(472, 'question', -1, NULL, 'thank youefm <a href=\" http://cialis24.top \">pronounce cialis 20mg</a> y k b generic cialis 20mg best buy mexico', '', 0, NULL, '2017-06-05 04:55:48'),
(473, 'question', -1, NULL, 'Hellorhv <a href=\" http://cialis24.top \">purchase cheap cialis online</a> u l z side effects rash cialis 20mg', '', 0, NULL, '2017-06-05 04:55:48'),
(474, 'question', -1, NULL, 'Hellorjb http://tadalafil365.bid buy cialis online cheap', '', 0, NULL, '2017-06-05 04:55:48'),
(475, 'question', -1, NULL, 'nice sitewdz <a href=\" http://tadalafil365.bid \">generic cialis 5mg</a> b s x buy generic cialis in canada', '', 0, NULL, '2017-06-05 04:55:48'),
(476, 'question', -1, NULL, 'Right here is an offer where you can get in to win an Apple Watch. This is going to be the base version one they give away, the Apple WatchSport with a value of $349! Wonderful possibility to win this before you can get it! \r\n \r\nAnswer the question currently for a chance to win. \r\nClick here: http://tinyurl.com/gopjobw', '', 0, NULL, '2017-06-05 04:55:48'),
(477, 'question', -1, NULL, 'thank youaac <a href=\" http://tadalafil.party \">viagra with cocaine cialis pills</a> i f z cialis canada online pharmacy', '', 0, NULL, '2017-06-05 04:55:48'),
(478, 'question', -1, NULL, 'pgx http://cashadvance.party payday lending legislation', '', 0, NULL, '2017-06-05 04:55:48'),
(479, 'question', -1, NULL, 'nice siteegv <a href=\" http://tadalafil.party \">mix viagra and alcohol cialis pills</a> w h x buy generic cialis computer', '', 0, NULL, '2017-06-05 04:55:48'),
(480, 'question', -1, NULL, 'bkz http://cashadvance.party payday advance interest rates', '', 0, NULL, '2017-06-05 04:55:48'),
(481, 'question', -1, NULL, 'good siterkm <a href=\" http://sildenafil.party/ \">viagra cheap buy</a> b k n cheap pfizer viagra', '', 0, NULL, '2017-06-05 04:55:48'),
(482, 'question', -1, NULL, 'nice siteikm http://sildenafil.party/ best viagra price', '', 0, NULL, '2017-06-05 04:55:48'),
(483, 'question', -1, NULL, 'wjm http://sildenafil.party/ ,  http://tadalafil.review/ , http://vardenafil.top/ , http://fastpaydayloans.review/ , http://fastpharmacy.men/', '', 0, NULL, '2017-06-05 04:55:48'),
(484, 'question', -1, NULL, 'pgc http://sildenafil.party/ ,  http://tadalafil.review/ , http://vardenafil.top/ , http://fastpaydayloans.review/ , http://fastpharmacy.men/', '', 0, NULL, '2017-06-05 04:55:48'),
(485, 'question', -1, NULL, 'comment5, http://cialis-online.review Cialis Official Site,  411830, ', '', 0, NULL, '2017-06-05 04:55:48'),
(486, 'question', -1, NULL, 'Здравствуйте!в поиске захоронений не могу найти своего деда Куликов Василий Федорович умер 1989 или 1990', '', 0, NULL, '2017-06-05 04:55:48'),
(487, 'question', -1, NULL, 'comment2, http://viagra-online.men buy viagra online,  37133, ', '', 0, NULL, '2017-06-05 04:55:48'),
(488, 'question', -1, NULL, 'comment5, http://payday-loan-online.review cash advance online,  738, ', '', 0, NULL, '2017-06-05 04:55:48'),
(489, 'question', -1, NULL, 'comment2, http://levitra-online.men Levitra 20 MG Cost Walmart,  tnvv, http://canadian-pharmacy-online.review pharmacy Canada,  wcvwtu, http://payday-loan-online.review payday loan online,  60089, http://viagra-online.men Pfizer Free Samples,  wox, ', '', 0, NULL, '2017-06-05 04:55:48'),
(490, 'question', -1, NULL, 'comment2, http://viagra-online.men Viagra Prices,  957, ', '', 0, NULL, '2017-06-05 04:55:48'),
(491, 'question', -1, NULL, 'comment1, <a href=\" http://canpharm.win \">canada pharmacy</a>,  647, ', '', 0, NULL, '2017-06-05 04:55:48'),
(492, 'question', -1, NULL, 'comment3, http://canpharm.top here,  >:OO, http://ciatrust.review Cost of Cialis in USA,  =(, http://canpharm.win Canadian Pharmacy,  23531, ', '', 0, NULL, '2017-06-05 04:55:48'),
(493, 'question', -1, NULL, 'comment3, <a href=\" http://viatrust.top \">buy viagra</a>,  8-D, ', '', 0, NULL, '2017-06-05 04:55:48'),
(494, 'question', -1, NULL, 'comment2, <a href=\" http://canpharm.top \">pharmacy from canada</a>,  :-[, ', '', 0, NULL, '2017-06-05 04:55:48'),
(495, 'question', -1, NULL, 'comment6, <a href=\" http://canpharm.top \">Canadian Pharmacy</a>,  :-)), ', '', 0, NULL, '2017-06-05 04:55:48'),
(496, 'question', -1, NULL, 'comment1, <a href=\" http://canpharm.top \">cialis</a>,  483847, ', '', 0, NULL, '2017-06-05 04:55:48'),
(497, 'question', -1, NULL, 'comment2, http://paydaytrust.review payday loan,  457, ', '', 0, NULL, '2017-06-05 04:55:48'),
(498, 'question', -1, NULL, 'comment1, <a href=\" http://ciatrust.review \">Cialis</a>,  itdcko, ', '', 0, NULL, '2017-06-05 04:55:48'),
(499, 'question', -1, NULL, 'comment2, <a href=\" http://levtrust.men \">Levitra 20mg Best Price</a>,  276, ', '', 0, NULL, '2017-06-05 04:55:48'),
(500, 'question', -1, NULL, 'comment2, <a href=\" http://zithromax.party \">Zithromax Over Counter</a>,  48431, ', '', 0, NULL, '2017-06-05 04:55:48'),
(501, 'question', -1, NULL, 'comment6, <a href=\" http://canpharm.top \">CA Pharmacy</a>,  ujofd, ', '', 0, NULL, '2017-06-05 04:55:48'),
(502, 'question', -1, NULL, 'comment1, <a href=\" http://generic-viagra.click \">Viagra Prices</a>,  zga, ', '', 0, NULL, '2017-06-05 04:55:48'),
(503, 'question', -1, NULL, 'Осенью сделали цветник(не ваша организация), в который нельзя посадить цветы(там плитка, высота земли  только 5см).Сохранились платёжные документы. Это норма? ', '', 0, NULL, '2017-06-05 04:55:48'),
(504, 'question', -1, NULL, 'comment5, <a href=\" http://canada-pharm.click \">CA Pharmacy</a>,  =OOO, ', '', 0, NULL, '2017-06-05 04:55:48'),
(505, 'question', -1, NULL, 'comment2, <a href=\" http://generic-cialis.review \">buy cialis</a>,  91885, ', '', 0, NULL, '2017-06-05 04:55:48'),
(506, 'question', -1, NULL, 'По ссылке http://мпкпру.рф/public/cemeteries/person/?i=142794\r\n\r\nДата смерти не 1904 год а 1964 !!! Исправьте пожалуйста', '', 0, NULL, '2017-06-05 04:55:48'),
(507, 'question', -1, NULL, 'comment4, http://cialis-online.review Cialis Official Website,  >:-PP, ', '', 0, NULL, '2017-06-05 04:55:48'),
(508, 'question', -1, NULL, 'comment1, http://cialis24h.party how to buy cialis,  884265, ', '', 0, NULL, '2017-06-05 04:55:48'),
(509, 'question', -1, NULL, 'comment3, http://cialis24h.party Cialis,  ddi, ', '', 0, NULL, '2017-06-05 04:55:48'),
(510, 'question', -1, NULL, 'comment4, http://levitra24h.review how to buy levitra,  rgyz, ', '', 0, NULL, '2017-06-05 04:55:48'),
(511, 'question', -1, NULL, 'comment3, http://cialis24h.party how to buy cialis,  771, ', '', 0, NULL, '2017-06-05 04:55:48'),
(512, 'question', -1, NULL, 'comment4, http://canadapharm24h.review where the best canadian pharmacy,  68310, ', '', 0, NULL, '2017-06-05 04:55:48'),
(513, 'question', -1, NULL, 'comment1, http://levitra24h.review buy levitra,  skbi, ', '', 0, NULL, '2017-06-05 04:55:48'),
(514, 'question', -1, NULL, 'comment3, http://paydayloans24h.review cash advance,  8-((, ', '', 0, NULL, '2017-06-05 04:55:48'),
(515, 'question', -1, NULL, 'comment6, http://viagra-rx.accountant Viagra Coupons,  :P, ', '', 0, NULL, '2017-06-05 04:55:48'),
(516, 'question', -1, NULL, 'comment6, http://sildenafil-rx.accountant Sildenafil 20 Mg Reviews,  1295, ', '', 0, NULL, '2017-06-05 04:55:48'),
(517, 'question', -1, NULL, 'comment6, http://viagra-rx.accountant viagra rx,  6312, ', '', 0, NULL, '2017-06-05 04:55:48'),
(518, 'question', -1, NULL, 'comment5, http://viagra-rx.accountant viagra,  331891, ', '', 0, NULL, '2017-06-05 04:55:48'),
(519, 'question', -1, NULL, 'comment3, http://buy-viagra-online.review where to buy viagra over the counter,  8-[[, ', '', 0, NULL, '2017-06-05 04:55:48'),
(520, 'question', -1, NULL, 'comment4, http://generic-viagra.click sildenafil dosage,  :-(((, http://buy-viagra-online.site viagra 100mg,  gjhl, ', '', 0, NULL, '2017-06-05 04:55:48'),
(521, 'question', -1, NULL, 'comment5, http://viagrarx.top viagra online prescription free,  ulp, http://generic-viagra.click Generic Viagra Available in USA,  %PP, http://viagraonlinea.com sildenafil 20 mg,  jdfbp, http://viadr01.top viagra over the counter,  8-[[[, ', '', 0, NULL, '2017-06-05 04:55:48'),
(522, 'question', -1, NULL, '<a href=http://lip48.ru/>объявления липецк без посредников</a> - это доска частных бесплатных объявлений с фото в Липецке, объявления <a href=http://lip48.ru/uslugi>услуги в Липецке</a>', '', 0, NULL, '2017-06-05 04:55:48'),
(523, 'question', -1, NULL, 'comment4, http://buyviagra.pw best place to buy viagra online,  060677, http://vvv01.review viagra online canadian pharmacy,  328, http://viadr01.top Viagra 100 mg Prices,  mbjo, ', '', 0, NULL, '2017-06-05 04:55:48'),
(524, 'question', -1, NULL, 'comment2, http://viagraed.us.com where to buy viagra over the counter,  3296, http://sildenafil.party viagra use,  bjxbsc, http://viagrafromcanada.men cheap generic viagra,  616064, http://viatrust.top sildenafil over the counter,  0823, ', '', 0, NULL, '2017-06-05 04:55:48'),
(525, 'question', -1, NULL, 'comment1, http://viagrarx.review Lowest Price on Generic Viagra,  73226, ', '', 0, NULL, '2017-06-05 04:55:48'),
(526, 'question', -1, NULL, 'comment2, http://buyviagra.pw buy viagra 100mg,  iii, http://viagraonline.party viagra 100mg,  477780, ', '', 0, NULL, '2017-06-05 04:55:48'),
(527, 'question', -1, NULL, 'comment5, http://buyviagra.pw sildenafil generic,  126035, ', '', 0, NULL, '2017-06-05 04:55:48'),
(528, 'question', -1, NULL, 'comment1, http://viagraon.top cheap generic viagra,  00800, ', '', 0, NULL, '2017-06-05 04:55:48'),
(529, 'question', -1, NULL, 'comment2, http://buy-viagra.men how to buy viagra online,  3064, http://buyviagra.pw generic viagra review,  162, ', '', 0, NULL, '2017-06-05 04:55:48'),
(530, 'question', -1, NULL, 'comment2, http://buy-viagra-online.site Generic Viagra in the US,  uqtr, ', '', 0, NULL, '2017-06-05 04:55:48'),
(531, 'question', -1, NULL, 'comment4, http://buyviagraformen.com viagra for sale,  :DDD, ', '', 0, NULL, '2017-06-05 04:55:48'),
(532, 'question', -1, NULL, 'comment1, http://canadapharm24h.review canadian pharmacy online,  =DDD, ', '', 0, NULL, '2017-06-05 04:55:48'),
(533, 'question', -1, NULL, 'comment1, http://canadianpharmacy.bid canadian pharmacy online,  980532, http://canadapharm365.top canada pharmacy online viagra,  %))), http://canadianpharmacy.review viagra online pharmacy,  :]]], http://online-pharmacy.review online pharmacy,  rfs, ', '', 0, NULL, '2017-06-05 04:55:48'),
(534, 'question', -1, NULL, 'Hello, good site http://buygenericrx.men', '', 0, NULL, '2017-06-05 04:55:48'),
(535, 'question', -1, 8286, 'здравствуйте у меня в 1997году 4 февраля умерла мать Шестопалова Елена Григорьевна я немогу найти где она похоронена', '', 0, NULL, '2017-06-05 04:55:48'),
(536, 'question', -1, NULL, 'ehm http://buygenericrx.men ; http://via01.biz ; http://sildenafil.review ; http://viadr01.top ; http://viaph01.com', '', 0, NULL, '2017-06-05 04:55:48'),
(537, 'question', -1, NULL, 'uo71iQ  <a href=\"http://zbzztvruozcx.com/\">zbzztvruozcx</a>, [url=http://qrfzktkxhpgl.com/]qrfzktkxhpgl[/url], [link=http://uyxusmqujpnn.com/]uyxusmqujpnn[/link], http://ifpyywabkaeo.com/', '', 0, NULL, '2017-06-05 04:55:48'),
(538, 'question', -1, NULL, '6HSsiB  <a href=\"http://jpzclqlvsrlm.com/\">jpzclqlvsrlm</a>, [url=http://cofkhceuriol.com/]cofkhceuriol[/url], [link=http://iikgkbtjngeg.com/]iikgkbtjngeg[/link], http://lmeocsoxeyie.com/', '', 0, NULL, '2017-06-05 04:55:48'),
(539, 'question', -1, NULL, 'io8E3K  <a href=\"http://clgoyzmblhio.com/\">clgoyzmblhio</a>, [url=http://nsezdsikvjmk.com/]nsezdsikvjmk[/url], [link=http://uvtpfrnjmczh.com/]uvtpfrnjmczh[/link], http://rgyglaulpzfe.com/', '', 0, NULL, '2017-06-05 04:55:48'),
(540, 'question', -1, NULL, 'http://128.fo.ru КЛИЕНТСКИЕ БАЗЫ http://128.fo.ru\r\n <a href=\"http://128.fo.ru\" >КЛИЕНТСКИЕ БАЗЫ http://128.fo.ru</a> [url=http://128.fo.ru]КЛИЕНТСКИЕ БАЗЫ http://128.fo.ru[/url]', '', 0, NULL, '2017-06-05 04:55:48'),
(541, 'question', -1, NULL, 'http://128.fo.ru КЛИЕНТСКИЕ БАЗЫ http://128.fo.ru\r\n <a href=\"http://128.fo.ru\" >КЛИЕНТСКИЕ БАЗЫ http://128.fo.ru</a> [url=http://128.fo.ru]КЛИЕНТСКИЕ БАЗЫ http://128.fo.ru[/url]', '', 0, NULL, '2017-06-05 04:55:48'),
(542, 'question', -1, NULL, 'http://128.fo.ru КЛИЕНТСКИЕ БАЗЫ http://128.fo.ru\r\n <a href=\"http://128.fo.ru\" >КЛИЕНТСКИЕ БАЗЫ http://128.fo.ru</a> [url=http://128.fo.ru]КЛИЕНТСКИЕ БАЗЫ http://128.fo.ru[/url]', '', 0, NULL, '2017-06-05 04:55:48'),
(543, 'question', -1, NULL, 'http://128.fo.ru КЛИЕНТСКИЕ БАЗЫ http://128.fo.ru\r\n <a href=\"http://128.fo.ru\" >КЛИЕНТСКИЕ БАЗЫ http://128.fo.ru</a> [url=http://128.fo.ru]КЛИЕНТСКИЕ БАЗЫ http://128.fo.ru[/url]', '', 0, NULL, '2017-06-05 04:55:48'),
(544, 'question', -1, NULL, 'comment4, http://cialison.click Cialis online,  cvkg, ', '', 0, NULL, '2017-06-05 04:55:48'),
(545, 'question', -1, NULL, 'comment5, http://canadapharm.review 24 hour pharmacy,  303, ', '', 0, NULL, '2017-06-05 04:55:48'),
(546, 'question', -1, NULL, 'comment4, http://viagraon.click sildenafil over the counter,  49185, ', '', 0, NULL, '2017-06-05 04:55:48'),
(547, 'question', -1, NULL, 'http://128.fo.ru КЛИЕНТСКИЕ БАЗЫ http://128.fo.ru\r\nКЛИЕНТСКИЕ БАЗЫ http://128.fo.ru http://128.fo.ru', '', 0, NULL, '2017-06-05 04:55:48'),
(548, 'question', -1, NULL, 'Где можно сделать увеличенное фото усопшего ', '', 0, NULL, '2017-06-05 04:55:48'),
(549, 'question', -1, NULL, 'http://128.fo.ru КЛИЕНТСКИЕ БАЗЫ http://128.fo.ru\r\nКЛИЕНТСКИЕ БАЗЫ http://128.fo.ru http://128.fo.ru', '', 0, NULL, '2017-06-05 04:55:48'),
(550, 'question', -1, NULL, 'http://128.fo.ru БАЗЫ для ПРОЗВОНА любые! http://128.fo.ru\r\nБАЗЫ для ПРОЗВОНА любые! http://128.fo.ru http://128.fo.ru', '', 0, NULL, '2017-06-05 04:55:48'),
(551, 'question', -1, NULL, 'http://128.fo.ru Здравствуйте! Вас интересуют базы данных для прозвона Ваших потенциальных клиентов? http://128.fo.ru\r\nЗдравствуйте! Вас интересуют базы данных для прозвона Ваших потенциальных клиентов? http://128.fo.ru http://128.fo.ru', '', 0, NULL, '2017-06-05 04:55:48'),
(552, 'question', -1, NULL, 'http://goo.gl/mKWJPn Базы прозвона рассылок http://goo.gl/mKWJPn\r\nБазы прозвона рассылок http://goo.gl/mKWJPn http://goo.gl/mKWJPn', '', 0, NULL, '2017-06-05 04:55:48'),
(553, 'question', -1, NULL, 'http://goo.gl/mKWJPn Базы прозвона рассылок http://goo.gl/mKWJPn\r\n <a href=\"http://goo.gl/mKWJPn\" >Базы прозвона рассылок http://goo.gl/mKWJPn</a> [url=http://goo.gl/mKWJPn]Базы прозвона рассылок http://goo.gl/mKWJPn[/url]', '', 0, NULL, '2017-06-05 04:55:48');
INSERT INTO `questions` (`id`, `type`, `category_id`, `author`, `question`, `answer`, `public`, `creator`, `created`) VALUES
(554, 'question', -1, NULL, 'http://goo.gl/mKWJPn Базы прозвона рассылок http://goo.gl/mKWJPn\r\n <a href=\"http://goo.gl/mKWJPn\" >Базы прозвона рассылок http://goo.gl/mKWJPn</a> [url=http://goo.gl/mKWJPn]Базы прозвона рассылок http://goo.gl/mKWJPn[/url]', '', 0, NULL, '2017-06-05 04:55:48'),
(555, 'question', -1, NULL, 'http://128.fo.ru ЦЕЛЕВЫЕ БАЗЫ http://128.fo.ru УЗНАЙТЕ ПОДРОБНЕЕ!!!\r\n <a href=\"http://128.fo.ru\" >ЦЕЛЕВЫЕ БАЗЫ http://128.fo.ru УЗНАЙТЕ ПОДРОБНЕЕ!!!</a> [url=http://128.fo.ru]ЦЕЛЕВЫЕ БАЗЫ http://128.fo.ru УЗНАЙТЕ ПОДРОБНЕЕ!!![/url]', '', 0, NULL, '2017-06-05 04:55:48'),
(556, 'question', -1, NULL, 'http://128.fo.ru ЦЕЛЕВЫЕ БАЗЫ http://128.fo.ru УЗНАЙТЕ ПОДРОБНЕЕ!!!\r\n <a href=\"http://128.fo.ru\" >ЦЕЛЕВЫЕ БАЗЫ http://128.fo.ru УЗНАЙТЕ ПОДРОБНЕЕ!!!</a> [url=http://128.fo.ru]ЦЕЛЕВЫЕ БАЗЫ http://128.fo.ru УЗНАЙТЕ ПОДРОБНЕЕ!!![/url]', '', 0, NULL, '2017-06-05 04:55:48'),
(557, 'question', -1, NULL, 'http://without-prescription-buyretin-a.net/ - without-prescription-buyretin-a.net.ankor <a href=\"http://doxycycline100mgbuy.com/\">doxycycline100mgbuy.com.ankor</a> http://cialistadalafillowest-price.net/', '', 0, NULL, '2017-06-05 04:55:48'),
(558, 'question', -1, NULL, 'http://without-prescription-buyretin-a.net/ - without-prescription-buyretin-a.net.ankor <a href=\"http://doxycycline100mgbuy.com/\">doxycycline100mgbuy.com.ankor</a> http://cialistadalafillowest-price.net/', '', 0, NULL, '2017-06-05 04:55:48'),
(559, 'question', -1, NULL, 'http://without-prescription-buyretin-a.net/ - without-prescription-buyretin-a.net.ankor <a href=\"http://doxycycline100mgbuy.com/\">doxycycline100mgbuy.com.ankor</a> http://cialistadalafillowest-price.net/', '', 0, NULL, '2017-06-05 04:55:48'),
(560, 'question', -1, NULL, 'http://without-prescription-buyretin-a.net/ - without-prescription-buyretin-a.net.ankor <a href=\"http://doxycycline100mgbuy.com/\">doxycycline100mgbuy.com.ankor</a> http://cialistadalafillowest-price.net/', '', 0, NULL, '2017-06-05 04:55:48'),
(561, 'question', -1, NULL, 'http://usa-onlineprednisone.net/ - usa-onlineprednisone.net.ankor <a href=\"http://salbutamol-ventolin-buy.net/\">salbutamol-ventolin-buy.net.ankor</a> http://online-viagracanada.net/', '', 0, NULL, '2017-06-05 04:55:48'),
(562, 'question', -1, NULL, 'http://usa-onlineprednisone.net/ - usa-onlineprednisone.net.ankor <a href=\"http://salbutamol-ventolin-buy.net/\">salbutamol-ventolin-buy.net.ankor</a> http://online-viagracanada.net/', '', 0, NULL, '2017-06-05 04:55:48'),
(563, 'question', -1, NULL, 'Найти захоронение Бычковского Григория Николаевича', '', 0, NULL, '2017-06-05 04:55:48'),
(564, 'question', -1, NULL, 'У меня умер брат, в 2004 году летом, какого месяца я не знаю. Через месяц мне сказали в морге или в милиции точно уже не помню. Похоронили под номером. Как узнать где именно, в загсе сказали что такой не зарегистрирован. Спасибо!', '', 0, NULL, '2017-06-05 04:55:48'),
(565, 'question', -1, NULL, 'http://xurl.es/128 ЦЕЛЕВЫЕ КЛИЕНТСКИЕ БАЗЫ для АКТИВНОЙ ПРОДАЖИ ВАШИХ ТОВАРОВ И УСЛУГ! ФОРМА ПОЛУЧЕНИЯ БЕСПЛАТНОЙ ДЕМОВЕРСИИ: http://xurl.es/128\r\n <a href=\"http://xurl.es/128\" >ЦЕЛЕВЫЕ КЛИЕНТСКИЕ БАЗЫ для АКТИВНОЙ ПРОДАЖИ ВАШИХ ТОВАРОВ И УСЛУГ! ФОРМА ПОЛУЧЕНИЯ БЕСПЛАТНОЙ ДЕМОВЕРСИИ: http://xurl.es/128</a> [url=http://xurl.es/128]ЦЕЛЕВЫЕ КЛИЕНТСКИЕ БАЗЫ для АКТИВНОЙ ПРОДАЖИ ВАШИХ ТОВАРОВ И УСЛУГ! ФОРМА ПОЛУЧЕНИЯ БЕСПЛАТНОЙ ДЕМОВЕРСИИ: http://xurl.es/128[/url]', '', 0, NULL, '2017-06-05 04:55:48'),
(566, 'question', -1, NULL, 'http://xurl.es/128 ЦЕЛЕВЫЕ КЛИЕНТСКИЕ БАЗЫ для АКТИВНОЙ ПРОДАЖИ ВАШИХ ТОВАРОВ И УСЛУГ! ФОРМА ПОЛУЧЕНИЯ БЕСПЛАТНОЙ ДЕМОВЕРСИИ: http://xurl.es/128\r\n <a href=\"http://xurl.es/128\" >ЦЕЛЕВЫЕ КЛИЕНТСКИЕ БАЗЫ для АКТИВНОЙ ПРОДАЖИ ВАШИХ ТОВАРОВ И УСЛУГ! ФОРМА ПОЛУЧЕНИЯ БЕСПЛАТНОЙ ДЕМОВЕРСИИ: http://xurl.es/128</a> [url=http://xurl.es/128]ЦЕЛЕВЫЕ КЛИЕНТСКИЕ БАЗЫ для АКТИВНОЙ ПРОДАЖИ ВАШИХ ТОВАРОВ И УСЛУГ! ФОРМА ПОЛУЧЕНИЯ БЕСПЛАТНОЙ ДЕМОВЕРСИИ: http://xurl.es/128[/url]', '', 0, NULL, '2017-06-05 04:55:48'),
(567, 'question', -1, NULL, 'BhqQWH  <a href=\"http://hsqvwjfmyuiz.com/\">hsqvwjfmyuiz</a>, [url=http://cybshjoesyai.com/]cybshjoesyai[/url], [link=http://ebvobwizeqxd.com/]ebvobwizeqxd[/link], http://ijajfwqtdtkx.com/', '', 0, NULL, '2017-06-05 04:55:48'),
(568, 'question', -1, 3650, 'Памятник поменяли.На фото зарегистрирован старый что нужно сделать ', '', 0, NULL, '2017-06-05 04:55:48'),
(569, 'question', -1, 2634, 'Добрый день! Как заказать паспорт на захоронение?Спасибо', '', 0, NULL, '2017-06-05 04:55:48'),
(570, 'question', -1, 8397, 'На левобережном кладбище захоронены мои бабушка и отец, уч. 535146.\r\nНужно ли приезжать к вам, чтобы получить документ о \"приватизации\" или можно получить по эл. почте?\r\nAON55@mail.ru\r\n', '', 0, NULL, '2017-06-05 04:55:48'),
(571, 'question', -1, 7405, 'Здравствуйте. Я нашла усопшего. Хотела бы найти его могилу. Зарегестрировалась,оплатила 30 руб. Подскажите пожалуйста,как посмотреть карту', '', 0, NULL, '2017-06-05 04:55:48'),
(572, 'question', -1, NULL, 'cr346467rhsvczxvmkaskoADKM FD453456YGFFFFdd bvu67i4yhgfdh', '', 0, NULL, '2017-06-05 04:55:48'),
(573, 'question', -1, NULL, 'cr346467rhsvczxvmkaskoADKM FD453456YGFFFFdd bvu67i4yhgfdh', '', 0, NULL, '2017-06-05 04:55:48'),
(574, 'question', -1, NULL, 'cr346467rhsvczxvmkaskoADKM FD453456YGFFFFdd bvu67i4yhgfdh', '', 0, NULL, '2017-06-05 04:55:48'),
(575, 'question', -1, NULL, 'here <a href= http://canpharm24.net >canada pharmacy</a> , <a href= http://levcanpharm.net >buy levitra</a> , <a href= http://tadalcanpharm.net >cialis</a> , <a href= http://viacanpharm.net >buy generic viagra online</a>', '', 0, NULL, '2017-06-05 04:55:48'),
(576, 'question', -1, NULL, 'good site: http://canpharm24.net , http://levcanpharm.net , http://tadalcanpharm.net , http://viacanpharm.net', '', 0, NULL, '2017-06-05 04:55:48'),
(577, 'question', -1, NULL, '6Uf8vz http://brothosonkonlonwon.ru check link', '', 0, NULL, '2017-06-05 04:55:48'),
(578, 'question', -1, NULL, '97RAPw http://brothosonkonlonwon.ru check link', '', 0, NULL, '2017-06-05 04:55:48'),
(579, 'question', -1, NULL, 'AtMBda http://www.LnAJ7K8QSpkiStk3sLL0hQP6MO2wQ8gO.com', '', 0, NULL, '2017-06-05 04:55:48'),
(580, 'question', -1, NULL, 'AVYBoZ http://www.LnAJ7K8QSpkiStk3sLL0hQP6MO2wQ8gO.com', '', 0, NULL, '2017-06-05 04:55:48'),
(581, 'question', -1, NULL, 'Good site http://ciadr01.party , http://candr01.click , http://pdl01.bid , http://viagra-rx-online.com', '', 0, NULL, '2017-06-05 04:55:48'),
(582, 'question', -1, NULL, 'На участке 22324 захоронен участник ВОВ. Как заказать льготный памятник?', '', 0, NULL, '2017-06-05 04:55:48'),
(583, 'question', -1, NULL, 'На участке 22324 захоронет Ветеран ВОв  Шумилов Александр Прокопьевич. Как заказать льготный памятник от военкомата ', '', 0, NULL, '2017-06-05 04:55:48'),
(584, 'question', -1, NULL, '2UmG4R http://www.LnAJ7K8QSpkiStk3sLL0hQP6MO2wQ8gO.com', '', 0, NULL, '2017-06-05 04:55:48'),
(585, 'question', -1, NULL, 'Oj5Jxa http://www.LnAJ7K8QSpkiStk3sLL0hQP6MO2wQ8gO.com', '', 0, NULL, '2017-06-05 04:55:48'),
(586, 'question', -1, NULL, 'hMikO4 http://www.LnAJ7K8QSpkiStk3sLL0hQP6MO2wQ8gO.com', '', 0, NULL, '2017-06-05 04:55:48'),
(587, 'question', -1, NULL, 'coyoHp http://www.LnAJ7K8QSpkiStk3sLL0hQP6MO2wQ8gO.com', '', 0, NULL, '2017-06-05 04:55:48'),
(588, 'question', -1, NULL, 'hi http://cialisdr.party - http://pdl01.com - http://viaph01.com - http://lev01.top - http://canp01.bid', '', 0, NULL, '2017-06-05 04:55:48'),
(589, 'question', -1, NULL, 'OVivPp http://www.LnAJ7K8QSpkiStk3sLL0hQP6MO2wQ8gO.com', '', 0, NULL, '2017-06-05 04:55:48'),
(590, 'question', -1, NULL, 'auqczm http://www.LnAJ7K8QSpkiStk3sLL0hQP6MO2wQ8gO.com', '', 0, NULL, '2017-06-05 04:55:48'),
(591, 'question', -1, NULL, 'E0Accc http://www.LnAJ7K8QSpkiStk3sLL0hQP6MO2wQ8gO.com', '', 0, NULL, '2017-06-05 04:55:48'),
(592, 'question', -1, NULL, 'LQPkjH http://www.LnAJ7K8QSpkiStk3sLL0hQP6MO2wQ8gO.com', '', 0, NULL, '2017-06-05 04:55:48'),
(593, 'question', -1, NULL, 'good site: <a href= http://buytadalafilmh.com >buy cialis online</a> , <a href= http://buysildenafilmh.com >sildenafil</a> , <a href= http://buyvardenafilmh.com >levitra coupons 2017</a>', '', 0, NULL, '2017-06-05 04:55:48'),
(594, 'question', -1, NULL, 'good site: http://buytadalafilmh.com , http://buysildenafilmh.com , http://buyvardenafilmh.com', '', 0, NULL, '2017-06-05 04:55:48'),
(595, 'question', -1, NULL, ' <a href= http://buysildenafilmh.com >buy viagra</a>', '', 0, NULL, '2017-06-05 04:55:48'),
(596, 'question', -1, 758, 'Подскажите, пожалуйста, информацию по возложению цветов. Как заказать несколько цветов. У меня не получается, приходится делать заказ несколько раз, и оплачивать каждый отдельно. И ещё: не все цветы возможны к заказу из представленных вариантов. Будет ли пополнение ассортимента?', '', 0, NULL, '2017-06-05 04:55:48'),
(597, 'question', -1, NULL, 'comment6, http://predni-sone.review buy prednisone,  :-((, http://buysildenafilon.com viagra over the counter,  159052, ', '', 0, NULL, '2017-06-05 04:55:48'),
(598, 'question', -1, NULL, 'comment3, <a href=\" http://canadian-ph.life/ \">reputable canadian online pharmacies</a>,  gjuihl, ', '', 0, NULL, '2017-06-05 04:55:48'),
(599, 'question', -1, NULL, 'comment2, http://buycialisrx.review/ cialis online,  18772, ', '', 0, NULL, '2017-06-05 04:55:48'),
(600, 'question', -1, NULL, 'здравствуйте мне выдали сертификат на выполнение услуг в размере 1000 действует ли он?', '', 0, NULL, '2017-06-05 04:55:48'),
(601, 'question', -1, NULL, 'КЛИЕНТСКИЕ БАЗЫ http://xurl.es/PR0DAWEZ УЗНАЙТЕ ПОДРОБНЕЕ! KLIENTSKIE BAZY http://xurl.es/PR0DAWEZ Uznajte podrobnee!', '', 0, NULL, '2017-06-05 04:55:48'),
(602, 'question', -1, 6577, 'Можно ли заказать венок за сутки до захоронения непосредственно к моменту захоронения, если точно известен номер участка, дата и время захоронения?\r\n ', '', 0, NULL, '2017-06-05 04:55:48'),
(603, 'question', -1, NULL, 'ЗАМЕНИЛИ ПАМЯТНИК НА НОВЫЙ. ГДЕ ЭТО МОЖНО УВИДЕТЬ.  КУДА ОБРАТИТЬТСЯ.', '', 0, NULL, '2017-06-05 04:55:48'),
(604, 'question', -1, 8718, 'Здравствуйте.. \nкак можно заменить фотографию на сайте \"поиск захоронений\"? ', '', 0, NULL, '2017-06-05 05:35:39'),
(605, 'question', -1, 8703, '.гдето выгоду 1955 был похоронен годовалый ребёнок Белобородов Саша возможно ли отыскать могилу', '', 0, NULL, '2017-06-05 04:55:48'),
(606, 'question', -1, 8764, 'Зимой хоронили сестру и заметили, что пропал стол и скамья железные, какую нибудь ответственность несет организация КПРУ в данном случае?', '', 0, NULL, '2017-06-05 04:55:48'),
(607, 'question', -1, 8764, 'Ищу могилу прадеда (скорее всего заброшенная) Ковалев Яков (отчество не знаю) праДед был похоронен  в 1947г в возрасте 76 лет, примерно в районе участка  #459460, где похоронена моя бабушка -его дочь Желнова Анна Яковлевна. Из воспоминаний родственников  там недалеко стоял крест деревянный и была надпись Ковалев Яков. ', '', 0, NULL, '2017-06-05 04:55:48'),
(608, 'question', -1, 7854, 'на сайте нашел могилу бабушки. по линии мамы.Какие документы необходимы,для правильной установки ограды и дальнейших действий.', '', 0, NULL, '2017-06-05 04:55:48'),
(609, 'question', -1, 4517, 'Нашла захоронение .где похоронена мама моего бывшего отчима.могила заброшенная.могу ли я ухаживать за могилой и сделать сертификат.', '', 0, NULL, '2017-06-05 04:55:48'),
(610, 'question', -1, 4767, 'Пожалуйста, добавьте на ваш сайт план кладбища. Где находится 14 квартал?', '', 0, NULL, '2017-06-05 04:55:48'),
(611, 'question', -1, NULL, 'http://xurl.es/PR0DAWEZ  КЛИЕНТСКИЕ БАЗЫ http://xurl.es/PR0DAWEZ Получите свою!\r\n[url=http://xurl.es/PR0DAWEZ]КЛИЕНТСКИЕ БАЗЫ http://xurl.es/PR0DAWEZ Получите свою![/url]', '', 0, NULL, '2017-06-05 04:55:48'),
(612, 'question', -1, NULL, 'comment5, <a href=\" http://levardph.com/ \">levitra coupon</a>,  wyop, ', '', 0, NULL, '2017-06-05 04:55:48'),
(613, 'question', -1, NULL, 'http://xurl.es/PR0DAWEZ  КЛИЕНТСКИЕ БАЗЫ http://xurl.es/PR0DAWEZ Получите свою!\n[url=http://xurl.es/PR0DAWEZ]КЛИЕНТСКИЕ БАЗЫ http://xurl.es/PR0DAWEZ Получите свою![/url]', '', 0, NULL, '2017-06-05 05:34:53'),
(614, 'question', -1, NULL, 'http://xurl.es/PR0DAWEZ  КЛИЕНТСКИЕ БАЗЫ http://xurl.es/PR0DAWEZ Получите свою!\r\n[url=http://xurl.es/PR0DAWEZ]КЛИЕНТСКИЕ БАЗЫ http://xurl.es/PR0DAWEZ Получите свою![/url]', '', 0, NULL, '2017-06-05 04:55:48'),
(615, 'question', -1, 8761, 'Как найти на коком квартале захаронен человек?', '', 0, NULL, '2017-06-05 04:55:48'),
(616, 'question', -1, 8761, 'Как найти на каком квартале захаронен человек?', '', 0, NULL, '2017-06-05 04:55:48'),
(617, 'question', -1, 7036, 'В личном кабинете не могу изменить номер телефона...Меняется только ФИО и пароль, а телефон, который указан там, у меня давно уже другой...Как можно поменять в личном кабинете свой номер телефона?', '', 0, NULL, '2017-06-05 04:55:48'),
(618, 'question', -1, NULL, 'КАК УЗНАТЬ КВАРТАЛ ЗАХОРОНЕНИЯ ЕСТЬ НОМЕР 404724', '', 0, NULL, '2017-06-05 04:55:48'),
(619, 'question', -1, NULL, 'Добрый день! Проживаю в городе Санкт- Петербурге, подскажите возможно ли получить удостоверение на захоронение дистанционно? ', '', 0, NULL, '2017-06-05 04:55:48'),
(620, 'question', 6, NULL, 'asdasdasdasd', NULL, 0, NULL, '2017-06-05 05:29:37'),
(621, 'question', 6, NULL, 'фывфывфывфыв', NULL, 0, NULL, '2017-06-05 05:33:38'),
(622, 'question', 6, NULL, 'asdasdasd', NULL, 0, NULL, '2018-02-12 06:58:37'),
(623, 'question', 6, NULL, 'asdasdasdasd', NULL, 0, NULL, '2018-02-12 06:58:44');

-- --------------------------------------------------------

--
-- Структура таблицы `reviews`
--

CREATE TABLE `reviews` (
  `id` int(10) UNSIGNED NOT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `target_type` varchar(50) DEFAULT NULL,
  `target_id` int(10) UNSIGNED DEFAULT NULL,
  `text` text NOT NULL,
  `published` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Опубликован или нет',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `reviews`
--

INSERT INTO `reviews` (`id`, `client_id`, `target_type`, `target_id`, `text`, `published`, `created`) VALUES
(1, 8, NULL, NULL, 'фывфывфывфывфывфыв', 0, '2018-02-08 10:27:35'),
(2, 9, NULL, NULL, 'asdasdasdasdasdasdasd', 0, '2018-02-08 10:44:38'),
(3, 9, NULL, NULL, 'asadasdasdasasdasdadasd', 0, '2018-02-08 10:44:42'),
(4, 8, NULL, NULL, 'aasdasdasdasdasd', 0, '2018-02-12 06:37:31');

-- --------------------------------------------------------

--
-- Структура таблицы `routes`
--

CREATE TABLE `routes` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT 'Новый маршрут',
  `url` varchar(255) NOT NULL,
  `template_id` int(11) DEFAULT '1',
  `menu_id` int(11) DEFAULT NULL,
  `access` int(11) DEFAULT '1',
  `dynamic` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `edit_access` tinyint(4) NOT NULL DEFAULT '1',
  `delete_access` tinyint(4) NOT NULL DEFAULT '1',
  `seo_keywords` text,
  `seo_description` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `routes`
--

INSERT INTO `routes` (`id`, `title`, `url`, `template_id`, `menu_id`, `access`, `dynamic`, `edit_access`, `delete_access`, `seo_keywords`, `seo_description`, `created`, `updated`) VALUES
(32, 'Главная страница', '/', 1, NULL, 1, 0, 1, 1, '', '', '2018-01-17 10:11:31', '2018-01-26 05:24:17'),
(40, 'Администрирование', '/admin', 2, 1, 3, 0, 1, 1, '', '', '2018-01-20 20:43:27', '2018-02-02 10:14:51'),
(48, 'Компания', '/company', 2, 2, 1, 0, 1, 1, 'Ключевые, слова', 'Описание', '2018-01-24 10:07:54', '2018-02-12 06:37:15'),
(49, 'Управление маршрутами', '/admin-routes', 2, 1, 3, 0, 1, 1, '', '', '2018-01-25 07:14:47', '2018-01-25 09:11:00'),
(50, 'Управление клиентами', '/admin-clients', 2, 1, 3, 0, 1, 1, '', '', '2018-01-25 07:15:29', '2018-01-25 07:15:50'),
(51, 'Посещаемость', '/admin-attendance', 2, 1, 3, 0, 1, 1, '', '', '2018-01-25 08:34:36', '2018-01-25 08:34:49'),
(52, 'Контакты', '/contacts', 2, 2, 1, 0, 1, 1, 'Проверка ключевых слов', 'Проверка описания', '2018-01-25 09:05:29', '2018-01-25 09:12:15'),
(53, 'Кладбища', '/cemeteries', 1, NULL, 1, 0, 1, 1, '', '', '2018-01-25 09:28:51', '2018-01-25 09:28:51'),
(54, 'Новости', '/news', 2, NULL, 1, 1, 1, 1, '', '', '2018-01-25 09:40:37', '2018-01-25 09:42:09'),
(61, 'Авторизация', '/login', 1, NULL, 1, 0, 0, 0, '', '', '2018-01-25 11:49:17', '2018-01-25 12:00:21'),
(62, 'Магазин', '/shop', 1, NULL, 1, 0, 1, 1, 'Магазин', 'Описание', '2018-01-26 10:23:30', '2018-01-29 06:53:14'),
(63, 'Страница категории товаров', '/shop-categories', 2, NULL, 1, 1, 1, 1, '', '', '2018-01-29 08:51:10', '2018-01-29 11:15:15'),
(64, 'Страница продукта', '/product', 2, NULL, 1, 1, 1, 1, '', '', '2018-01-31 06:21:49', '2018-01-31 06:21:49'),
(65, 'Корзина пользователя', '/cart', 2, 4, 1, 0, 1, 1, '', '', '2018-02-01 08:13:30', '2018-02-08 08:32:24'),
(66, 'Оформление заказа', '/order', 2, NULL, 1, 0, 1, 1, '', '', '2018-02-01 11:14:39', '2018-02-01 11:14:39'),
(67, 'Управление компонентами', '/admin-components', 2, 1, 3, 0, 1, 1, '', '', '2018-02-05 17:38:19', '2018-02-08 09:11:39'),
(68, 'Личный кабинет', '/my', 2, 3, 2, 0, 1, 1, '', '', '2018-02-07 06:35:22', '2018-02-07 06:47:41'),
(69, 'Успешный заказ', '/order-complete', 2, NULL, 1, 1, 1, 1, '', '', '2018-02-07 08:04:40', '2018-02-07 08:04:40'),
(70, 'Глобальные переменные', '/admin-globals', 2, 1, 3, 0, 1, 1, '', '', '2018-02-07 11:31:36', '2018-02-07 11:32:01'),
(71, 'Мои заказы', '/my-orders', 2, 3, 2, 0, 1, 1, '', '', '2018-02-08 07:34:52', '2018-02-08 07:43:03'),
(72, 'Отзывы', '/reviews', 2, 2, 1, 0, 1, 1, '', '', '2018-02-08 10:28:42', '2018-02-08 10:28:54'),
(73, 'Вопрос-ответ', '/questions', 2, 2, 1, 0, 1, 1, '', '', '2018-02-12 06:50:04', '2018-02-12 06:50:14'),
(74, 'Заказы', '/admin-orders', 2, 1, 3, 0, 0, 0, '', '', '2018-02-13 07:53:28', '2018-02-13 07:54:01'),
(76, 'Страница заказа', '/order-page', 2, 1, 1, 1, 0, 0, '', '', '2018-02-13 08:49:57', '2018-02-13 09:39:17'),
(77, 'Документы', '/documents', 2, 2, 1, 0, 1, 1, '', '', '2018-02-14 10:10:37', '2018-02-14 10:10:50'),
(78, 'Страница документа', '/document', 2, 2, 1, 1, 1, 1, '', '', '2018-02-14 10:25:30', '2018-02-14 10:54:17');

-- --------------------------------------------------------

--
-- Структура таблицы `routes_access`
--

CREATE TABLE `routes_access` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `routes_aliases` (
  `id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `target` varchar(64) NOT NULL,
  `target_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `social_links`
--

CREATE TABLE `social_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(60) NOT NULL DEFAULT 'Новая ссылка',
  `icon` varchar(20) DEFAULT 'fa-question',
  `href` varchar(100) NOT NULL DEFAULT '#',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ссылки на социальные сети';

--
-- Дамп данных таблицы `social_links`
--

INSERT INTO `social_links` (`id`, `title`, `icon`, `href`, `created`) VALUES
(13, 'Вконтакте', 'fa-vk', 'http://vk.com/', '2018-02-14 08:41:59');

-- --------------------------------------------------------

--
-- Структура таблицы `templates`
--

CREATE TABLE `templates` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT 'Новый шаблон',
  `name` varchar(64) DEFAULT NULL COMMENT 'Название файла шаблона',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `templates`
--

INSERT INTO `templates` (`id`, `title`, `name`, `created`) VALUES
(1, 'Пустая страница', 'empty', '2018-01-12 05:06:14'),
(2, 'Трёхколоночный макет страницы', 'three-column', '2018-01-12 05:06:48');

-- --------------------------------------------------------

--
-- Структура таблицы `views`
--

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

--
-- Дамп данных таблицы `views`
--

INSERT INTO `views` (`id`, `visit_id`, `visitor_id`, `path`, `created`, `updated`, `activated`, `closed`) VALUES
(1, 46, 46, '/', '2018-02-07 08:19:47', NULL, NULL, NULL),
(2, 46, 46, '/', '2018-02-07 08:19:48', NULL, NULL, NULL),
(3, 46, 46, '/login', '2018-02-07 08:19:55', NULL, NULL, NULL),
(4, 46, 46, '/', '2018-02-07 08:20:00', NULL, NULL, NULL),
(5, 46, 46, '/', '2018-02-07 08:20:01', NULL, NULL, NULL),
(6, 46, 46, '/admin', '2018-02-07 08:20:02', NULL, NULL, NULL),
(7, 46, 46, '/', '2018-02-07 08:20:03', NULL, NULL, NULL),
(8, 46, 46, '/', '2018-02-07 08:20:04', NULL, NULL, NULL),
(9, 46, 46, '/', '2018-02-07 08:20:07', NULL, NULL, NULL),
(10, 46, 46, '/', '2018-02-07 08:20:07', NULL, NULL, NULL),
(11, 46, 46, '/', '2018-02-07 08:20:09', NULL, NULL, NULL),
(12, 46, 46, '/', '2018-02-07 08:20:09', NULL, NULL, NULL),
(13, 46, 46, '/', '2018-02-07 08:20:10', NULL, NULL, NULL),
(14, 46, 46, '/', '2018-02-07 08:20:12', NULL, NULL, NULL),
(15, 46, 46, '/company', '2018-02-07 08:20:53', NULL, NULL, NULL),
(16, 46, 46, '/admin-routes', '2018-02-07 08:20:56', NULL, NULL, NULL),
(17, 46, 46, '/company', '2018-02-07 08:20:58', NULL, NULL, NULL),
(18, 46, 46, '/cart', '2018-02-07 08:20:59', NULL, NULL, NULL),
(19, 46, 46, '/shop', '2018-02-07 08:20:59', NULL, NULL, NULL),
(20, 46, 46, '/shop-categories/3', '2018-02-07 08:21:01', NULL, NULL, NULL),
(21, 46, 46, '/shop-categories/47', '2018-02-07 08:21:02', NULL, NULL, NULL),
(22, 46, 46, '/product/56', '2018-02-07 08:21:03', NULL, NULL, NULL),
(23, 46, 46, '/cart', '2018-02-07 08:21:05', NULL, NULL, NULL),
(24, 46, 46, '/cart', '2018-02-07 08:21:07', NULL, NULL, NULL),
(25, 46, 46, '/cart', '2018-02-07 08:21:10', NULL, NULL, NULL),
(26, 46, 46, '/order', '2018-02-07 08:24:01', NULL, NULL, NULL),
(27, 46, 46, '/product/56', '2018-02-07 08:27:58', NULL, NULL, NULL),
(28, 46, 46, '/order', '2018-02-07 08:33:36', NULL, NULL, NULL),
(29, 46, 46, '/order', '2018-02-07 08:35:38', NULL, NULL, NULL),
(30, 46, 46, '/order-complete/302485f9f47f41c3bc02593e100ed285', '2018-02-07 08:35:43', NULL, NULL, NULL),
(31, 46, 46, '/order-complete/302485f9f47f41c3bc02593e100ed285', '2018-02-07 08:36:44', NULL, NULL, NULL),
(32, 46, 46, '/order-complete/302485f9f47f41c3bc02593e100ed285', '2018-02-07 08:39:45', NULL, NULL, NULL),
(33, 46, 46, '/order-complete/302485f9f47f41c3bc02593e100ed285', '2018-02-07 08:39:46', NULL, NULL, NULL),
(34, 46, 46, '/order-complete/302485f9f47f41c3bc02593e100ed285', '2018-02-07 08:39:52', NULL, NULL, NULL),
(35, 46, 46, '/order-complete/302485f9f47f41c3bc02593e100ed285', '2018-02-07 08:39:54', NULL, NULL, NULL),
(36, 46, 46, '/order-complete/302485f9f47f41c3bc02593e100ed285', '2018-02-07 08:39:56', NULL, NULL, NULL),
(37, 46, 46, '/order-complete/302485f9f47f41c3bc02593e100ed285', '2018-02-07 08:40:00', NULL, NULL, NULL),
(38, 46, 46, '/order-complete/302485f9f47f41c3bc02593e100ed285', '2018-02-07 08:40:48', NULL, NULL, NULL),
(39, 46, 46, '/order-complete/302485f9f47f41c3bc02593e100ed285', '2018-02-07 08:41:33', NULL, NULL, NULL),
(40, 46, 46, '/order-complete/302485f9f47f41c3bc02593e100ed285', '2018-02-07 08:41:37', NULL, NULL, NULL),
(41, 46, 46, '/order-complete/302485f9f47f41c3bc02593e100ed285', '2018-02-07 08:43:06', NULL, NULL, NULL),
(42, 46, 46, '/order-complete/302485f9f47f41c3bc02593e100ed285', '2018-02-07 08:43:50', NULL, NULL, NULL),
(43, 46, 46, '/order-complete/302485f9f47f41c3bc02593e100ed285', '2018-02-07 08:44:11', NULL, NULL, NULL),
(44, 46, 46, '/order-complete/302485f9f47f41c3bc02593e100ed285', '2018-02-07 08:44:25', NULL, NULL, NULL),
(45, 46, 46, '/order-complete/302485f9f47f41c3bc02593e100ed285', '2018-02-07 08:45:06', NULL, NULL, NULL),
(46, 46, 46, '/order-complete/302485f9f47f41c3bc02593e100ed285', '2018-02-07 08:45:36', NULL, NULL, NULL),
(47, 46, 46, '/order-complete/302485f9f47f41c3bc02593e100ed285', '2018-02-07 08:49:32', NULL, NULL, NULL),
(48, 46, 46, '/cart', '2018-02-07 08:49:35', NULL, NULL, NULL),
(49, 46, 46, '/order', '2018-02-07 08:49:36', NULL, NULL, NULL),
(50, 46, 46, '/order-complete/d5fd98ea0dc644e8011f5e4d8fb0ac91', '2018-02-07 08:51:07', NULL, NULL, NULL),
(51, 46, 46, '/order', '2018-02-07 08:51:25', NULL, NULL, NULL),
(52, 46, 46, '/order-complete/87fcca7eca3027dd13307119612191aa', '2018-02-07 08:52:13', NULL, NULL, NULL),
(53, 46, 46, '/cart', '2018-02-07 08:53:30', NULL, NULL, NULL),
(54, 46, 46, '/order', '2018-02-07 08:53:33', NULL, NULL, NULL),
(55, 46, 46, '/order-complete/521e66b553e00768b07993fb21caed03', '2018-02-07 08:53:39', NULL, NULL, NULL),
(56, 46, 46, '/cart', '2018-02-07 08:53:42', NULL, NULL, NULL),
(57, 46, 46, '/order-complete/521e66b553e00768b07993fb21caed03', '2018-02-07 08:54:20', NULL, NULL, NULL),
(58, 46, 46, '/order-complete/521e66b553e00768b07993fb21caed03', '2018-02-07 08:54:26', NULL, NULL, NULL),
(59, 46, 46, '/order-complete/521e66b553e00768b07993fb21caed03', '2018-02-07 08:54:36', NULL, NULL, NULL),
(60, 46, 46, '/order-complete/521e66b553e00768b07993fb21caed03', '2018-02-07 08:55:46', NULL, NULL, NULL),
(61, 46, 46, '/order-complete/521e66b553e00768b07993fb21caed03', '2018-02-07 08:57:22', NULL, NULL, NULL),
(62, 46, 46, '/order-complete/521e66b553e00768b07993fb21caed03', '2018-02-07 09:01:43', NULL, NULL, NULL),
(63, 46, 46, '/order-complete/521e66b553e00768b07993fb21caed03', '2018-02-07 09:02:09', NULL, NULL, NULL),
(64, 46, 46, '/order-complete/521e66b553e00768b07993fb21caed03', '2018-02-07 09:02:21', NULL, NULL, NULL),
(65, 46, 46, '/order-complete/521e66b553e00768b07993fb21caed03', '2018-02-07 09:02:31', NULL, NULL, NULL),
(66, 46, 46, '/order-complete/521e66b553e00768b07993fb21caed03', '2018-02-07 09:04:24', NULL, NULL, NULL),
(67, 46, 46, '/order-complete/521e66b553e00768b07993fb21caed03', '2018-02-07 09:06:31', NULL, NULL, NULL),
(68, 46, 46, '/order-complete/521e66b553e00768b07993fb21caed03', '2018-02-07 09:06:42', NULL, NULL, NULL),
(69, 46, 46, '/order-complete/521e66b553e00768b07993fb21caed03', '2018-02-07 09:08:13', NULL, NULL, NULL),
(70, 46, 46, '/order-complete/521e66b553e00768b07993fb21caed03', '2018-02-07 09:08:37', NULL, NULL, NULL),
(71, 46, 46, '/order-complete/521e66b553e00768b07993fb21caed03', '2018-02-07 09:08:53', NULL, NULL, NULL),
(72, 46, 46, '/order-complete/521e66b553e00768b07993fb21caed03', '2018-02-07 09:09:04', NULL, NULL, NULL),
(73, 46, 46, '/order-complete/521e66b553e00768b07993fb21caed03', '2018-02-07 09:09:52', NULL, NULL, NULL),
(74, 46, 46, '/order-complete/521e66b553e00768b07993fb21caed03', '2018-02-07 09:10:33', NULL, NULL, NULL),
(75, 46, 46, '/cart', '2018-02-07 09:10:59', NULL, NULL, NULL),
(76, 46, 46, '/shop', '2018-02-07 09:10:59', NULL, NULL, NULL),
(77, 46, 46, '/shop-categories/4', '2018-02-07 09:11:01', NULL, NULL, NULL),
(78, 46, 46, '/shop-categories/4', '2018-02-07 09:11:02', NULL, NULL, NULL),
(79, 46, 46, '/shop-categories/4', '2018-02-07 09:11:17', NULL, NULL, NULL),
(80, 46, 46, '/shop-categories/46', '2018-02-07 09:11:20', NULL, NULL, NULL),
(81, 46, 46, '/shop-categories/47', '2018-02-07 09:11:21', NULL, NULL, NULL),
(82, 46, 46, '/product/56', '2018-02-07 09:11:25', NULL, NULL, NULL),
(83, 46, 46, '/cart', '2018-02-07 09:11:36', NULL, NULL, NULL),
(84, 46, 46, '/order', '2018-02-07 09:11:41', NULL, NULL, NULL),
(85, 46, 46, '/order', '2018-02-07 09:12:35', NULL, NULL, NULL),
(86, 46, 46, '/order', '2018-02-07 09:12:55', NULL, NULL, NULL),
(87, 46, 46, '/order', '2018-02-07 09:18:59', NULL, NULL, NULL),
(88, 46, 46, '/shop', '2018-02-07 09:19:03', NULL, NULL, NULL),
(89, 46, 46, '/shop-categories/4', '2018-02-07 09:19:04', NULL, NULL, NULL),
(90, 46, 46, '/shop-categories/2', '2018-02-07 09:19:05', NULL, NULL, NULL),
(91, 46, 46, '/shop-categories/2', '2018-02-07 09:19:06', NULL, NULL, NULL),
(92, 46, 46, '/shop-categories/3', '2018-02-07 09:19:06', NULL, NULL, NULL),
(93, 46, 46, '/shop-categories/10', '2018-02-07 09:19:07', NULL, NULL, NULL),
(94, 46, 46, '/shop-categories/2', '2018-02-07 09:19:08', NULL, NULL, NULL),
(95, 46, 46, '/shop-categories/3', '2018-02-07 09:19:09', NULL, NULL, NULL),
(96, 46, 46, '/shop-categories/10', '2018-02-07 09:19:09', NULL, NULL, NULL),
(97, 46, 46, '/shop-categories/4', '2018-02-07 09:19:10', NULL, NULL, NULL),
(98, 46, 46, '/shop-categories/45', '2018-02-07 09:19:11', NULL, NULL, NULL),
(99, 46, 46, '/shop-categories/46', '2018-02-07 09:19:11', NULL, NULL, NULL),
(100, 46, 46, '/shop-categories/47', '2018-02-07 09:19:12', NULL, NULL, NULL),
(101, 46, 46, '/shop-categories/4', '2018-02-07 09:19:12', NULL, NULL, NULL),
(102, 46, 46, '/shop-categories/10', '2018-02-07 09:19:13', NULL, NULL, NULL),
(103, 46, 46, '/product/55', '2018-02-07 09:19:13', NULL, NULL, NULL),
(104, 46, 46, '/cart', '2018-02-07 09:19:15', NULL, NULL, NULL),
(105, 46, 46, '/cart', '2018-02-07 09:19:25', NULL, NULL, NULL),
(106, 46, 46, '/cart', '2018-02-07 09:19:26', NULL, NULL, NULL),
(107, 46, 46, '/cart', '2018-02-07 09:19:27', NULL, NULL, NULL),
(108, 46, 46, '/cart', '2018-02-07 09:19:27', NULL, NULL, NULL),
(109, 46, 46, '/cart', '2018-02-07 09:19:28', NULL, NULL, NULL),
(110, 46, 46, '/cart', '2018-02-07 09:19:28', NULL, NULL, NULL),
(111, 46, 46, '/cart', '2018-02-07 09:19:29', NULL, NULL, NULL),
(112, 46, 46, '/cart', '2018-02-07 09:19:29', NULL, NULL, NULL),
(113, 46, 46, '/cart', '2018-02-07 09:19:30', NULL, NULL, NULL),
(114, 46, 46, '/order', '2018-02-07 09:19:43', NULL, NULL, NULL),
(115, 46, 46, '/order', '2018-02-07 09:21:20', NULL, NULL, NULL),
(116, 46, 46, '/order-complete/a8a41326a452abe6d14b60a8fbdf3f2d', '2018-02-07 09:21:27', NULL, NULL, NULL),
(117, 46, 46, '/', '2018-02-07 09:21:52', NULL, NULL, NULL),
(118, 46, 46, '/cart', '2018-02-07 09:21:55', NULL, NULL, NULL),
(119, 46, 46, '/', '2018-02-07 09:21:55', NULL, NULL, NULL),
(120, 46, 46, '/cart', '2018-02-07 09:24:34', NULL, NULL, NULL),
(121, 46, 46, '/shop', '2018-02-07 09:24:36', NULL, NULL, NULL),
(122, 46, 46, '/shop-categories/2', '2018-02-07 09:24:37', NULL, NULL, NULL),
(123, 46, 46, '/shop-categories/2', '2018-02-07 09:24:38', NULL, NULL, NULL),
(124, 46, 46, '/shop-categories/3', '2018-02-07 09:24:38', NULL, NULL, NULL),
(125, 46, 46, '/shop-categories/10', '2018-02-07 09:24:39', NULL, NULL, NULL),
(126, 46, 46, '/product/55', '2018-02-07 09:24:41', NULL, NULL, NULL),
(127, 46, 46, '/cart', '2018-02-07 09:24:43', NULL, NULL, NULL),
(128, 46, 46, '/shop-categories/47', '2018-02-07 09:24:45', NULL, NULL, NULL),
(129, 46, 46, '/product/56', '2018-02-07 09:24:46', NULL, NULL, NULL),
(130, 46, 46, '/cart', '2018-02-07 09:24:48', NULL, NULL, NULL),
(131, 46, 46, '/cart', '2018-02-07 09:24:50', NULL, NULL, NULL),
(132, 46, 46, '/cart', '2018-02-07 09:24:51', NULL, NULL, NULL),
(133, 46, 46, '/cart', '2018-02-07 09:24:51', NULL, NULL, NULL),
(134, 46, 46, '/cart', '2018-02-07 09:24:52', NULL, NULL, NULL),
(135, 46, 46, '/order', '2018-02-07 09:24:55', NULL, NULL, NULL),
(136, 46, 46, '/order-complete/2e5e5019e44b15e9f7e7555e3d080696', '2018-02-07 09:24:59', NULL, NULL, NULL),
(137, 46, 46, '/order-complete/2e5e5019e44b15e9f7e7555e3d080696', '2018-02-07 09:25:58', NULL, NULL, NULL),
(138, 46, 46, '/cart', '2018-02-07 09:26:03', NULL, NULL, NULL),
(139, 46, 46, '/order', '2018-02-07 09:26:04', NULL, NULL, NULL),
(140, 46, 46, '/order-complete/afa324f56f6811e451589b8964886a19', '2018-02-07 09:26:30', NULL, NULL, NULL),
(141, 46, 46, '/cart', '2018-02-07 09:27:27', NULL, NULL, NULL),
(142, 46, 46, '/order-complete/2e5e5019e44b15e9f7e7555e3d080696', '2018-02-07 09:28:42', NULL, NULL, NULL),
(143, 46, 46, '/cart', '2018-02-07 09:29:00', NULL, NULL, NULL),
(144, 46, 46, '/shop', '2018-02-07 09:29:02', NULL, NULL, NULL),
(145, 46, 46, '/shop-categories/2', '2018-02-07 09:29:03', NULL, NULL, NULL),
(146, 46, 46, '/shop-categories/4', '2018-02-07 09:29:04', NULL, NULL, NULL),
(147, 46, 46, '/shop-categories/45', '2018-02-07 09:29:05', NULL, NULL, NULL),
(148, 46, 46, '/shop-categories/46', '2018-02-07 09:29:05', NULL, NULL, NULL),
(149, 46, 46, '/shop-categories/47', '2018-02-07 09:29:05', NULL, NULL, NULL),
(150, 46, 46, '/product/56', '2018-02-07 09:29:06', NULL, NULL, NULL),
(151, 46, 46, '/cart', '2018-02-07 09:29:09', NULL, NULL, NULL),
(152, 46, 46, '/order', '2018-02-07 09:29:12', NULL, NULL, NULL),
(153, 46, 46, '/order-complete/c88555b6371fe3da79180124f0683035', '2018-02-07 09:29:18', NULL, NULL, NULL),
(154, 46, 46, '/order-complete/c88555b6371fe3da79180124f0683035', '2018-02-07 09:31:04', NULL, NULL, NULL),
(155, 46, 46, '/order-complete/c88555b6371fe3da79180124f0683035', '2018-02-07 09:31:29', NULL, NULL, NULL),
(156, 46, 46, '/cart', '2018-02-07 09:31:30', NULL, NULL, NULL),
(157, 46, 46, '/shop', '2018-02-07 09:31:31', NULL, NULL, NULL),
(158, 46, 46, '/shop-categories/5', '2018-02-07 09:31:33', NULL, NULL, NULL),
(159, 46, 46, '/shop-categories/4', '2018-02-07 09:31:34', NULL, NULL, NULL),
(160, 46, 46, '/shop-categories/45', '2018-02-07 09:31:34', NULL, NULL, NULL),
(161, 46, 46, '/shop-categories/47', '2018-02-07 09:31:35', NULL, NULL, NULL),
(162, 46, 46, '/product/56', '2018-02-07 09:31:35', NULL, NULL, NULL),
(163, 46, 46, '/shop-categories/2', '2018-02-07 09:31:37', NULL, NULL, NULL),
(164, 46, 46, '/shop-categories/3', '2018-02-07 09:31:38', NULL, NULL, NULL),
(165, 46, 46, '/shop-categories/10', '2018-02-07 09:31:38', NULL, NULL, NULL),
(166, 46, 46, '/product/55', '2018-02-07 09:31:39', NULL, NULL, NULL),
(167, 46, 46, '/order-complete/2e5e5019e44b15e9f7e7555e3d080696', '2018-02-07 09:31:41', NULL, NULL, NULL),
(168, 46, 46, '/cart', '2018-02-07 09:31:42', NULL, NULL, NULL),
(169, 46, 46, '/order', '2018-02-07 09:31:45', NULL, NULL, NULL),
(170, 46, 46, '/order-complete/cde5cc96e44c0b2abdf6f572951c6b16', '2018-02-07 09:31:51', NULL, NULL, NULL),
(171, 46, 46, '/shop', '2018-02-07 09:33:31', NULL, NULL, NULL),
(172, 46, 46, '/shop-categories/2', '2018-02-07 09:33:33', NULL, NULL, NULL),
(173, 46, 46, '/shop-categories/48', '2018-02-07 09:33:35', NULL, NULL, NULL),
(174, 46, 46, '/product/57', '2018-02-07 09:33:36', NULL, NULL, NULL),
(175, 46, 46, '/product/57', '2018-02-07 09:33:40', NULL, NULL, NULL),
(176, 46, 46, '/product/57', '2018-02-07 09:33:43', NULL, NULL, NULL),
(177, 46, 46, '/cart', '2018-02-07 09:33:45', NULL, NULL, NULL),
(178, 46, 46, '/cart', '2018-02-07 09:33:47', NULL, NULL, NULL),
(179, 46, 46, '/cart', '2018-02-07 09:33:48', NULL, NULL, NULL),
(180, 46, 46, '/cart', '2018-02-07 09:33:50', NULL, NULL, NULL),
(181, 46, 46, '/cart', '2018-02-07 09:33:51', NULL, NULL, NULL),
(182, 46, 46, '/order', '2018-02-07 09:33:52', NULL, NULL, NULL),
(183, 46, 46, '/order-complete/de27ce32f3bfbdb3b5df47de05bb399f', '2018-02-07 09:34:00', NULL, NULL, NULL),
(184, 46, 46, '/order-complete/de27ce32f3bfbdb3b5df47de05bb399f', '2018-02-07 09:36:07', NULL, NULL, NULL),
(185, 46, 46, '/order-complete/de27ce32f3bfbdb3b5df47de05bb399f', '2018-02-07 09:36:24', NULL, NULL, NULL),
(186, 46, 46, '/order-complete/de27ce32f3bfbdb3b5df47de05bb399f', '2018-02-07 09:36:31', NULL, NULL, NULL),
(187, 46, 46, '/order-complete/de27ce32f3bfbdb3b5df47de05bb399f', '2018-02-07 09:36:49', NULL, NULL, NULL),
(188, 46, 46, '/order-complete/de27ce32f3bfbdb3b5df47de05bb399f', '2018-02-07 09:37:02', NULL, NULL, NULL),
(189, 46, 46, '/order-complete/de27ce32f3bfbdb3b5df47de05bb399f', '2018-02-07 09:37:14', NULL, NULL, NULL),
(190, 46, 46, '/order-complete/de27ce32f3bfbdb3b5df47de05bb399f', '2018-02-07 09:37:51', NULL, NULL, NULL),
(191, 46, 46, '/order-complete/de27ce32f3bfbdb3b5df47de05bb399f', '2018-02-07 09:38:04', NULL, NULL, NULL),
(192, 46, 46, '/', '2018-02-07 09:38:24', NULL, NULL, NULL),
(193, 46, 46, '/cart', '2018-02-07 09:38:27', NULL, NULL, NULL),
(194, 46, 46, '/order', '2018-02-07 09:38:28', NULL, NULL, NULL),
(195, 46, 46, '/order', '2018-02-07 09:38:50', NULL, NULL, NULL),
(196, 46, 46, '/order-complete/de27ce32f3bfbdb3b5df47de05bb399f', '2018-02-07 09:38:52', NULL, NULL, NULL),
(197, 46, 46, '/order-complete/de27ce32f3bfbdb3b5df47de05bb399f', '2018-02-07 09:38:57', NULL, NULL, NULL),
(198, 46, 46, '/order-complete/de27ce32f3bfbdb3b5df47de05bb399f', '2018-02-07 09:39:45', NULL, NULL, NULL),
(199, 46, 46, '/order-complete/cde5cc96e44c0b2abdf6f572951c6b16', '2018-02-07 09:40:00', NULL, NULL, NULL),
(200, 46, 46, '/order-complete/cde5cc96e44c0b2abdf6f572951c6b16', '2018-02-07 09:40:19', NULL, NULL, NULL),
(201, 46, 46, '/order-complete/cde5cc96e44c0b2abdf6f572951c6b16', '2018-02-07 09:40:42', NULL, NULL, NULL),
(202, 46, 46, '/order-complete/cde5cc96e44c0b2abdf6f572951c6b16', '2018-02-07 09:40:43', NULL, NULL, NULL),
(203, 46, 46, '/order-complete/cde5cc96e44c0b2abdf6f572951c6b16', '2018-02-07 09:43:17', NULL, NULL, NULL),
(204, 46, 46, '/', '2018-02-07 09:48:06', NULL, NULL, NULL),
(205, 46, 46, '/company', '2018-02-07 09:48:08', NULL, NULL, NULL),
(206, 46, 46, '/cemeteries', '2018-02-07 09:48:08', NULL, NULL, NULL),
(207, 46, 46, '/shop', '2018-02-07 09:48:09', NULL, NULL, NULL),
(208, 46, 46, '/cemeteries', '2018-02-07 09:48:10', NULL, NULL, NULL),
(209, 46, 46, '/cemeteries', '2018-02-07 09:48:11', NULL, NULL, NULL),
(210, 46, 46, '/cemeteries', '2018-02-07 09:48:12', NULL, NULL, NULL),
(211, 46, 46, '/company', '2018-02-07 09:48:12', NULL, NULL, NULL),
(212, 46, 46, '/company', '2018-02-07 09:48:13', NULL, NULL, NULL),
(213, 46, 46, '/company', '2018-02-07 09:48:21', NULL, NULL, NULL),
(214, 46, 46, '/company', '2018-02-07 09:48:26', NULL, NULL, NULL),
(215, 46, 46, '/company', '2018-02-07 09:48:28', NULL, NULL, NULL),
(216, 46, 46, '/company', '2018-02-07 09:48:30', NULL, NULL, NULL),
(217, 46, 46, '/company', '2018-02-07 09:48:32', NULL, NULL, NULL),
(218, 46, 46, '/company', '2018-02-07 09:48:39', NULL, NULL, NULL),
(219, 46, 46, '/company', '2018-02-07 09:48:43', NULL, NULL, NULL),
(220, 46, 46, '/company', '2018-02-07 09:48:45', NULL, NULL, NULL),
(221, 46, 46, '/company', '2018-02-07 09:48:45', NULL, NULL, NULL),
(222, 46, 46, '/company', '2018-02-07 09:48:47', NULL, NULL, NULL),
(223, 46, 46, '/company', '2018-02-07 09:48:49', NULL, NULL, NULL),
(224, 46, 46, '/company', '2018-02-07 09:48:51', NULL, NULL, NULL),
(225, 46, 46, '/shop', '2018-02-07 09:48:53', NULL, NULL, NULL),
(226, 46, 46, '/shop-categories/2', '2018-02-07 09:48:55', NULL, NULL, NULL),
(227, 46, 46, '/shop-categories/8', '2018-02-07 09:49:00', NULL, NULL, NULL),
(228, 46, 46, '/shop-categories/47', '2018-02-07 09:49:01', NULL, NULL, NULL),
(229, 46, 46, '/cart', '2018-02-07 09:49:02', NULL, NULL, NULL),
(230, 46, 46, '/cart', '2018-02-07 09:49:13', NULL, NULL, NULL),
(231, 46, 46, '/cart', '2018-02-07 09:49:14', NULL, NULL, NULL),
(232, 46, 46, '/product/56', '2018-02-07 09:49:15', NULL, NULL, NULL),
(233, 46, 46, '/shop-categories/47', '2018-02-07 09:49:43', NULL, NULL, NULL),
(234, 46, 46, '/cart', '2018-02-07 09:49:56', NULL, NULL, NULL),
(235, 46, 46, '/product/56', '2018-02-07 09:49:57', NULL, NULL, NULL),
(236, 46, 46, '/cart', '2018-02-07 09:49:59', NULL, NULL, NULL),
(237, 46, 46, '/cart', '2018-02-07 09:50:01', NULL, NULL, NULL),
(238, 46, 46, '/order', '2018-02-07 09:50:04', NULL, NULL, NULL),
(239, 46, 46, '/order-complete/cc99390a491afa6f35041797af380faa', '2018-02-07 09:50:10', NULL, NULL, NULL),
(240, 46, 46, '/product/56', '2018-02-07 09:51:02', NULL, NULL, NULL),
(241, 46, 46, '/order-complete/cc99390a491afa6f35041797af380faa', '2018-02-07 09:51:07', NULL, NULL, NULL),
(242, 46, 46, '/order-complete/cc99390a491afa6f35041797af380faa', '2018-02-07 09:51:27', NULL, NULL, NULL),
(243, 46, 46, '/order', '2018-02-07 09:51:31', NULL, NULL, NULL),
(244, 46, 46, '/order-complete/cc99390a491afa6f35041797af380faa', '2018-02-07 09:51:33', NULL, NULL, NULL),
(245, 46, 46, '/order-complete/cc99390a491afa6f35041797af380fa123', '2018-02-07 09:51:51', NULL, NULL, NULL),
(246, 46, 46, '/order-complete/cc99390a491afa6f35041797af380fa123', '2018-02-07 09:52:16', NULL, NULL, NULL),
(247, 46, 46, '/product/56', '2018-02-07 09:52:35', NULL, NULL, NULL),
(248, 46, 46, '/order-complete/cc99390a491afa6f35041797af380fa123', '2018-02-07 09:54:37', NULL, NULL, NULL),
(249, 46, 46, '/', '2018-02-07 09:54:50', NULL, NULL, NULL),
(250, 46, 46, '/company', '2018-02-07 09:54:50', NULL, NULL, NULL),
(251, 46, 46, '/cemeteries', '2018-02-07 09:54:51', NULL, NULL, NULL),
(252, 46, 46, '/shop', '2018-02-07 09:54:52', NULL, NULL, NULL),
(253, 46, 46, '/cart', '2018-02-07 09:54:54', NULL, NULL, NULL),
(254, 46, 46, '/shop', '2018-02-07 09:54:56', NULL, NULL, NULL),
(255, 46, 46, '/cart', '2018-02-07 09:54:57', NULL, NULL, NULL),
(256, 46, 46, '/cart', '2018-02-07 09:54:58', NULL, NULL, NULL),
(257, 46, 46, '/cart', '2018-02-07 09:54:59', NULL, NULL, NULL),
(258, 46, 46, '/cart', '2018-02-07 09:55:01', NULL, NULL, NULL),
(259, 46, 46, '/order', '2018-02-07 09:55:04', NULL, NULL, NULL),
(260, 46, 46, '/order-complete/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-07 09:55:10', NULL, NULL, NULL),
(261, 46, 46, '/order-complete/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-07 09:55:48', NULL, NULL, NULL),
(262, 46, 46, '/order-complete/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-07 09:55:51', NULL, NULL, NULL),
(263, 46, 46, '/order-complete/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-07 09:55:52', NULL, NULL, NULL),
(264, 46, 46, '/order-complete/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-07 09:55:52', NULL, NULL, NULL),
(265, 46, 46, '/cart', '2018-02-07 09:58:33', NULL, NULL, NULL),
(266, 46, 46, '/order-complete/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-07 10:05:35', NULL, NULL, NULL),
(267, 46, 46, '/', '2018-02-07 10:58:57', NULL, NULL, NULL),
(268, 46, 46, '/cart', '2018-02-07 10:58:59', NULL, NULL, NULL),
(269, 46, 46, '/shop', '2018-02-07 10:59:11', NULL, NULL, NULL),
(270, 46, 46, '/shop', '2018-02-07 11:01:17', NULL, NULL, NULL),
(271, 46, 46, '/shop-categories/2', '2018-02-07 11:01:19', NULL, NULL, NULL),
(272, 46, 46, '/shop-categories/47', '2018-02-07 11:01:20', NULL, NULL, NULL),
(273, 46, 46, '/product/56', '2018-02-07 11:01:21', NULL, NULL, NULL),
(274, 46, 46, '/shop-categories/2', '2018-02-07 11:01:23', NULL, NULL, NULL),
(275, 46, 46, '/shop-categories/3', '2018-02-07 11:01:24', NULL, NULL, NULL),
(276, 46, 46, '/shop-categories/10', '2018-02-07 11:01:25', NULL, NULL, NULL),
(277, 46, 46, '/product/55', '2018-02-07 11:01:26', NULL, NULL, NULL),
(278, 46, 46, '/cart', '2018-02-07 11:01:29', NULL, NULL, NULL),
(279, 46, 46, '/cart', '2018-02-07 11:01:35', NULL, NULL, NULL),
(280, 46, 46, '/cart', '2018-02-07 11:01:36', NULL, NULL, NULL),
(281, 46, 46, '/cart', '2018-02-07 11:01:36', NULL, NULL, NULL),
(282, 46, 46, '/cart', '2018-02-07 11:01:40', NULL, NULL, NULL),
(283, 46, 46, '/cart', '2018-02-07 11:01:42', NULL, NULL, NULL),
(284, 46, 46, '/cart', '2018-02-07 11:01:43', NULL, NULL, NULL),
(285, 46, 46, '/cart', '2018-02-07 11:01:45', NULL, NULL, NULL),
(286, 46, 46, '/order', '2018-02-07 11:01:47', NULL, NULL, NULL),
(287, 46, 46, '/cart', '2018-02-07 11:01:52', NULL, NULL, NULL),
(288, 46, 46, '/order', '2018-02-07 11:02:09', NULL, NULL, NULL),
(289, 46, 46, '/order-complete/109aa1de3e468c45a33afa7b349805b8', '2018-02-07 11:02:15', NULL, NULL, NULL),
(290, 46, 46, '/order', '2018-02-07 11:08:55', NULL, NULL, NULL),
(291, 46, 46, '/order-complete/109aa1de3e468c45a33afa7b349805b8', '2018-02-07 11:09:00', NULL, NULL, NULL),
(292, 46, 46, '/cart', '2018-02-07 11:09:02', NULL, NULL, NULL),
(293, 46, 46, '/order', '2018-02-07 11:09:08', NULL, NULL, NULL),
(294, 46, 46, '/cart', '2018-02-07 11:09:12', NULL, NULL, NULL),
(295, 46, 46, '/order', '2018-02-07 11:09:32', NULL, NULL, NULL),
(296, 1, 1, '/', '2018-02-07 11:10:37', NULL, NULL, NULL),
(297, 1, 1, '/order', '2018-02-07 11:10:41', NULL, NULL, NULL),
(298, 1, 1, '/order', '2018-02-07 11:10:44', NULL, NULL, NULL),
(299, 1, 1, '/order', '2018-02-07 11:10:50', NULL, NULL, NULL),
(300, 1, 1, '/cart', '2018-02-07 11:10:59', NULL, NULL, NULL),
(301, 1, 1, '/order-complete/109aa1de3e468c45a33afa7b349805b8', '2018-02-07 11:11:01', NULL, NULL, NULL),
(302, 1, 1, '/', '2018-02-07 11:11:02', NULL, NULL, NULL),
(303, 1, 1, '/company', '2018-02-07 11:11:03', NULL, NULL, NULL),
(304, 1, 1, '/cemeteries', '2018-02-07 11:11:04', NULL, NULL, NULL),
(305, 1, 1, '/shop', '2018-02-07 11:11:04', NULL, NULL, NULL),
(306, 1, 1, '/shop-categories/2', '2018-02-07 11:11:06', NULL, NULL, NULL),
(307, 1, 1, '/shop-categories/4', '2018-02-07 11:11:06', NULL, NULL, NULL),
(308, 1, 1, '/shop-categories/45', '2018-02-07 11:11:07', NULL, NULL, NULL),
(309, 1, 1, '/shop-categories/47', '2018-02-07 11:11:07', NULL, NULL, NULL),
(310, 1, 1, '/product/56', '2018-02-07 11:11:09', NULL, NULL, NULL),
(311, 1, 1, '/cart', '2018-02-07 11:11:10', NULL, NULL, NULL),
(312, 1, 1, '/cart', '2018-02-07 11:11:13', NULL, NULL, NULL),
(313, 1, 1, '/order', '2018-02-07 11:11:14', NULL, NULL, NULL),
(314, 1, 1, '/order', '2018-02-07 11:11:19', NULL, NULL, NULL),
(315, 1, 1, '/order', '2018-02-07 11:11:28', NULL, NULL, NULL),
(316, 1, 1, '/order', '2018-02-07 11:11:30', NULL, NULL, NULL),
(317, 1, 1, '/cart', '2018-02-07 11:11:32', NULL, NULL, NULL),
(318, 1, 1, '/cart', '2018-02-07 11:11:37', NULL, NULL, NULL),
(319, 1, 1, '/cart', '2018-02-07 11:11:40', NULL, NULL, NULL),
(320, 1, 1, '/order', '2018-02-07 11:11:41', NULL, NULL, NULL),
(321, 1, 1, '/cart', '2018-02-07 11:11:43', NULL, NULL, NULL),
(322, 1, 1, '/order', '2018-02-07 11:11:44', NULL, NULL, NULL),
(323, 1, 1, '/order', '2018-02-07 11:11:49', NULL, NULL, NULL),
(324, 1, 1, '/cart', '2018-02-07 11:12:13', NULL, NULL, NULL),
(325, 1, 1, '/order', '2018-02-07 11:12:13', NULL, NULL, NULL),
(326, 1, 1, '/order', '2018-02-07 11:12:14', NULL, NULL, NULL),
(327, 1, 1, '/order', '2018-02-07 11:12:15', NULL, NULL, NULL),
(328, 1, 1, '/order', '2018-02-07 11:12:16', NULL, NULL, NULL),
(329, 1, 1, '/order', '2018-02-07 11:12:25', NULL, NULL, NULL),
(330, 1, 1, '/order', '2018-02-07 11:13:10', NULL, NULL, NULL),
(331, 1, 1, '/product/56', '2018-02-07 11:13:17', NULL, NULL, NULL),
(332, 1, 1, '/order', '2018-02-07 11:13:18', NULL, NULL, NULL),
(333, 1, 1, '/order', '2018-02-07 11:13:58', NULL, NULL, NULL),
(334, 1, 1, '/cart', '2018-02-07 11:13:59', NULL, NULL, NULL),
(335, 1, 1, '/cart', '2018-02-07 11:14:02', NULL, NULL, NULL),
(336, 1, 1, '/order', '2018-02-07 11:17:32', NULL, NULL, NULL),
(337, 1, 1, '/order', '2018-02-07 11:18:36', NULL, NULL, NULL),
(338, 1, 1, '/shop', '2018-02-07 11:18:38', NULL, NULL, NULL),
(339, 1, 1, '/', '2018-02-07 11:21:43', NULL, NULL, NULL),
(340, 1, 1, '/cart', '2018-02-07 11:26:07', NULL, NULL, NULL),
(341, 1, 1, '/', '2018-02-07 11:26:11', NULL, NULL, NULL),
(342, 1, 1, '/cemeteries', '2018-02-07 11:26:13', NULL, NULL, NULL),
(343, 1, 1, '/shop', '2018-02-07 11:26:14', NULL, NULL, NULL),
(344, 1, 1, '/cart', '2018-02-07 11:26:15', NULL, NULL, NULL),
(345, 1, 1, '/login', '2018-02-07 11:26:52', NULL, NULL, NULL),
(346, 1, 1, '/', '2018-02-07 11:26:56', NULL, NULL, NULL),
(347, 1, 1, '/shop', '2018-02-07 11:26:58', NULL, NULL, NULL),
(348, 1, 1, '/cart', '2018-02-07 11:26:58', NULL, NULL, NULL),
(349, 1, 1, '/admin', '2018-02-07 11:26:59', NULL, NULL, NULL),
(350, 1, 1, '/admin', '2018-02-07 11:27:19', NULL, NULL, NULL),
(351, 1, 1, '/admin', '2018-02-07 11:27:33', NULL, NULL, NULL),
(352, 1, 1, '/admin', '2018-02-07 11:27:34', NULL, NULL, NULL),
(353, 1, 1, '/admin-routes', '2018-02-07 11:27:36', NULL, NULL, NULL),
(354, 1, 1, '/cart', '2018-02-07 11:28:23', NULL, NULL, NULL),
(355, 1, 1, '/shop', '2018-02-07 11:28:25', NULL, NULL, NULL),
(356, 1, 1, '/shop-categories/2', '2018-02-07 11:28:26', NULL, NULL, NULL),
(357, 1, 1, '/shop-categories/47', '2018-02-07 11:28:28', NULL, NULL, NULL),
(358, 1, 1, '/product/56', '2018-02-07 11:28:28', NULL, NULL, NULL),
(359, 1, 1, '/cart', '2018-02-07 11:28:29', NULL, NULL, NULL),
(360, 1, 1, '/order', '2018-02-07 11:28:55', NULL, NULL, NULL),
(361, 1, 1, '/order-complete/4548579cc811f270c87bb003d0c21405', '2018-02-07 11:29:00', NULL, NULL, NULL),
(362, 1, 1, '/admin-routes', '2018-02-07 11:31:36', NULL, NULL, NULL),
(363, 1, 1, '/admin-globals', '2018-02-07 11:31:38', NULL, NULL, NULL),
(364, 1, 1, '/admin-globals', '2018-02-07 11:31:39', NULL, NULL, NULL),
(365, 1, 1, '/admin-routes', '2018-02-07 11:31:47', NULL, NULL, NULL),
(366, 1, 1, '/admin-globals', '2018-02-07 11:31:48', NULL, NULL, NULL),
(367, 1, 1, '/admin-globals', '2018-02-07 11:31:49', NULL, NULL, NULL),
(368, 1, 1, '/admin-globals', '2018-02-07 11:31:59', NULL, NULL, NULL),
(369, 1, 1, '/admin-globals', '2018-02-07 11:32:01', NULL, NULL, NULL),
(370, 1, 1, '/admin-globals', '2018-02-07 11:32:03', NULL, NULL, NULL),
(371, 1, 1, '/admin-globals', '2018-02-07 11:33:06', NULL, NULL, NULL),
(372, 1, 1, '/admin-globals', '2018-02-07 11:33:49', NULL, NULL, NULL),
(373, 1, 1, '/admin-globals', '2018-02-07 11:33:57', NULL, NULL, NULL),
(374, 1, 1, '/admin-globals', '2018-02-07 11:33:59', NULL, NULL, NULL),
(375, 1, 1, '/admin-globals', '2018-02-07 11:38:06', NULL, NULL, NULL),
(376, 1, 1, '/admin-globals', '2018-02-07 11:38:10', NULL, NULL, NULL),
(377, 1, 1, '/admin-globals', '2018-02-07 11:40:04', NULL, NULL, NULL),
(378, 1, 1, '/admin-globals', '2018-02-07 11:40:44', NULL, NULL, NULL),
(379, 1, 1, '/admin-globals', '2018-02-07 11:41:33', NULL, NULL, NULL),
(380, 1, 1, '/admin-globals', '2018-02-07 11:41:48', NULL, NULL, NULL),
(381, 1, 1, '/admin-globals', '2018-02-07 11:42:24', NULL, NULL, NULL),
(382, 1, 1, '/admin-globals', '2018-02-07 11:42:39', NULL, NULL, NULL),
(383, 1, 1, '/admin-globals', '2018-02-07 11:42:47', NULL, NULL, NULL),
(384, 1, 1, '/admin-globals', '2018-02-07 11:43:05', NULL, NULL, NULL),
(385, 1, 1, '/admin-globals', '2018-02-07 11:44:05', NULL, NULL, NULL),
(386, 1, 1, '/admin-globals', '2018-02-07 11:45:33', NULL, NULL, NULL),
(387, 1, 1, '/admin-globals', '2018-02-07 11:45:50', NULL, NULL, NULL),
(388, 1, 1, '/admin-globals', '2018-02-07 11:46:36', NULL, NULL, NULL),
(389, 1, 1, '/admin-globals', '2018-02-07 11:46:55', NULL, NULL, NULL),
(390, 1, 1, '/admin-globals', '2018-02-07 11:46:58', NULL, NULL, NULL),
(391, 1, 1, '/admin-globals', '2018-02-07 11:47:19', NULL, NULL, NULL),
(392, 1, 1, '/admin-globals', '2018-02-07 11:47:37', NULL, NULL, NULL),
(393, 1, 1, '/admin-globals', '2018-02-07 11:47:49', NULL, NULL, NULL),
(394, 1, 1, '/admin-globals', '2018-02-07 11:48:04', NULL, NULL, NULL),
(395, 1, 1, '/admin-globals', '2018-02-07 11:48:20', NULL, NULL, NULL),
(396, 1, 1, '/admin-globals', '2018-02-07 11:48:37', NULL, NULL, NULL),
(397, 1, 1, '/admin-globals', '2018-02-07 11:48:41', NULL, NULL, NULL),
(398, 1, 1, '/admin-globals', '2018-02-07 11:48:54', NULL, NULL, NULL),
(399, 1, 1, '/admin-globals', '2018-02-07 11:49:05', NULL, NULL, NULL),
(400, 1, 1, '/admin-globals', '2018-02-07 11:50:45', NULL, NULL, NULL),
(401, 1, 1, '/admin-globals', '2018-02-07 11:56:33', NULL, NULL, NULL),
(402, 1, 1, '/admin-globals', '2018-02-07 11:56:42', NULL, NULL, NULL),
(403, 1, 1, '/admin-globals', '2018-02-07 11:56:51', NULL, NULL, NULL),
(404, 1, 1, '/admin-globals', '2018-02-07 11:57:32', NULL, NULL, NULL),
(405, 1, 1, '/admin-globals', '2018-02-07 11:57:33', NULL, NULL, NULL),
(406, 1, 1, '/admin-globals', '2018-02-07 12:07:20', NULL, NULL, NULL),
(407, 1, 1, '/admin-globals', '2018-02-07 12:07:22', NULL, NULL, NULL),
(408, 1, 1, '/admin-globals', '2018-02-07 12:07:25', NULL, NULL, NULL),
(409, 1, 1, '/admin-globals', '2018-02-07 12:07:26', NULL, NULL, NULL),
(410, 1, 1, '/admin-globals', '2018-02-07 12:07:27', NULL, NULL, NULL),
(411, 1, 1, '/admin-globals', '2018-02-07 12:08:33', NULL, NULL, NULL),
(412, 1, 1, '/admin-globals', '2018-02-07 12:09:49', NULL, NULL, NULL),
(413, 1, 1, '/admin-globals', '2018-02-07 12:09:59', NULL, NULL, NULL),
(414, 1, 1, '/admin-globals', '2018-02-07 12:10:19', NULL, NULL, NULL),
(415, 1, 1, '/admin-globals', '2018-02-07 12:11:27', NULL, NULL, NULL),
(416, 1, 1, '/admin-globals', '2018-02-07 12:11:37', NULL, NULL, NULL),
(417, 1, 1, '/admin-globals', '2018-02-07 12:13:12', NULL, NULL, NULL),
(418, 1, 1, '/cart', '2018-02-07 12:13:32', NULL, NULL, NULL),
(419, 1, 1, '/cart', '2018-02-07 12:15:10', NULL, NULL, NULL),
(420, 1, 1, '/shop', '2018-02-07 12:15:12', NULL, NULL, NULL),
(421, 1, 1, '/shop-categories/2', '2018-02-07 12:15:20', NULL, NULL, NULL),
(422, 1, 1, '/shop-categories/47', '2018-02-07 12:15:21', NULL, NULL, NULL),
(423, 1, 1, '/product/56', '2018-02-07 12:15:21', NULL, NULL, NULL),
(424, 1, 1, '/cart', '2018-02-07 12:15:26', NULL, NULL, NULL),
(425, 1, 1, '/order', '2018-02-07 12:15:27', NULL, NULL, NULL),
(426, 1, 1, '/order-complete/0aa202e517498eca83e3214f471297d1', '2018-02-07 12:15:32', NULL, NULL, NULL),
(427, 1, 1, '/admin-globals', '2018-02-07 12:17:47', NULL, NULL, NULL),
(428, 1, 1, '/admin-globals', '2018-02-07 12:18:24', NULL, NULL, NULL),
(429, 1, 1, '/admin-globals', '2018-02-07 12:19:37', NULL, NULL, NULL),
(430, 1, 1, '/admin-globals', '2018-02-07 12:20:15', NULL, NULL, NULL),
(431, 1, 1, '/admin-globals', '2018-02-07 12:20:30', NULL, NULL, NULL),
(432, 1, 1, '/admin-globals', '2018-02-07 12:21:01', NULL, NULL, NULL),
(433, 1, 1, '/admin-globals', '2018-02-07 12:21:17', NULL, NULL, NULL),
(434, 1, 1, '/admin-globals', '2018-02-07 12:22:17', NULL, NULL, NULL),
(435, 1, 1, '/admin-globals', '2018-02-07 12:22:43', NULL, NULL, NULL),
(436, 1, 1, '/admin-globals', '2018-02-07 12:23:04', NULL, NULL, NULL),
(437, 1, 1, '/admin-globals', '2018-02-07 12:23:15', NULL, NULL, NULL),
(438, 1, 1, '/admin-globals', '2018-02-07 12:24:03', NULL, NULL, NULL),
(439, 1, 1, '/admin-globals', '2018-02-07 12:25:40', NULL, NULL, NULL),
(440, 1, 1, '/admin-globals', '2018-02-07 12:25:45', NULL, NULL, NULL),
(441, 1, 1, '/admin-globals', '2018-02-07 12:26:08', NULL, NULL, NULL),
(442, 1, 1, '/admin-globals', '2018-02-07 12:27:28', NULL, NULL, NULL),
(443, 1, 1, '/admin-globals', '2018-02-07 12:27:45', NULL, NULL, NULL),
(444, 1, 1, '/admin-globals', '2018-02-07 12:27:49', NULL, NULL, NULL),
(445, 1, 1, '/', '2018-02-08 05:04:16', NULL, NULL, NULL),
(446, 1, 1, '/my', '2018-02-08 05:04:19', NULL, NULL, NULL),
(447, 1, 1, '/cart', '2018-02-08 05:04:23', NULL, NULL, NULL),
(448, 1, 1, '/shop', '2018-02-08 05:04:24', NULL, NULL, NULL),
(449, 1, 1, '/cart', '2018-02-08 05:04:24', NULL, NULL, NULL),
(450, 1, 1, '/cart', '2018-02-08 05:05:05', NULL, NULL, NULL),
(451, 1, 1, '/cart', '2018-02-08 05:05:13', NULL, NULL, NULL),
(452, 1, 1, '/cart', '2018-02-08 05:05:15', NULL, NULL, NULL),
(453, 1, 1, '/cart', '2018-02-08 05:05:17', NULL, NULL, NULL),
(454, 1, 1, '/cart', '2018-02-08 05:30:42', NULL, NULL, NULL),
(455, 1, 1, '/cart', '2018-02-08 05:31:02', NULL, NULL, NULL),
(456, 1, 1, '/cart', '2018-02-08 05:31:06', NULL, NULL, NULL),
(457, 1, 1, '/cart', '2018-02-08 05:31:58', NULL, NULL, NULL),
(458, 1, 1, '/cart', '2018-02-08 05:32:02', NULL, NULL, NULL),
(459, 1, 1, '/cart', '2018-02-08 05:32:22', NULL, NULL, NULL),
(460, 1, 1, '/cart', '2018-02-08 05:32:56', NULL, NULL, NULL),
(461, 1, 1, '/cart', '2018-02-08 05:33:54', NULL, NULL, NULL),
(462, 1, 1, '/cart', '2018-02-08 05:34:01', NULL, NULL, NULL),
(463, 1, 1, '/cart', '2018-02-08 05:34:10', NULL, NULL, NULL),
(464, 1, 1, '/cart', '2018-02-08 05:34:34', NULL, NULL, NULL),
(465, 1, 1, '/cart', '2018-02-08 05:35:11', NULL, NULL, NULL),
(466, 1, 1, '/cart', '2018-02-08 05:36:16', NULL, NULL, NULL),
(467, 1, 1, '/cart', '2018-02-08 05:36:26', NULL, NULL, NULL),
(468, 1, 1, '/cart', '2018-02-08 05:36:43', NULL, NULL, NULL),
(469, 1, 1, '/cart', '2018-02-08 05:36:44', NULL, NULL, NULL),
(470, 1, 1, '/cart', '2018-02-08 05:37:08', NULL, NULL, NULL),
(471, 1, 1, '/cart', '2018-02-08 05:38:24', NULL, NULL, NULL),
(472, 1, 1, '/shop', '2018-02-08 05:38:25', NULL, NULL, NULL),
(473, 1, 1, '/shop-categories/2', '2018-02-08 05:38:27', NULL, NULL, NULL),
(474, 1, 1, '/shop-categories/47', '2018-02-08 05:38:28', NULL, NULL, NULL),
(475, 1, 1, '/product/56', '2018-02-08 05:38:29', NULL, NULL, NULL),
(476, 1, 1, '/product/56', '2018-02-08 05:38:57', NULL, NULL, NULL),
(477, 1, 1, '/product/56', '2018-02-08 05:39:14', NULL, NULL, NULL),
(478, 1, 1, '/product/56', '2018-02-08 05:39:35', NULL, NULL, NULL),
(479, 1, 1, '/product/56', '2018-02-08 05:39:46', NULL, NULL, NULL),
(480, 1, 1, '/product/56', '2018-02-08 05:40:12', NULL, NULL, NULL),
(481, 1, 1, '/product/56', '2018-02-08 05:40:15', NULL, NULL, NULL),
(482, 1, 1, '/cart', '2018-02-08 05:40:17', NULL, NULL, NULL),
(483, 1, 1, '/cart', '2018-02-08 05:40:21', NULL, NULL, NULL),
(484, 1, 1, '/product/56', '2018-02-08 05:40:22', NULL, NULL, NULL),
(485, 2, 2, '/', '2018-02-08 05:40:25', NULL, NULL, NULL),
(486, 2, 2, '/', '2018-02-08 05:40:39', NULL, NULL, NULL),
(487, 2, 2, '/', '2018-02-08 05:41:06', NULL, NULL, NULL),
(488, 2, 2, '/', '2018-02-08 05:42:44', NULL, NULL, NULL),
(489, 2, 2, '/', '2018-02-08 05:43:06', NULL, NULL, NULL),
(490, 2, 2, '/', '2018-02-08 05:43:58', NULL, NULL, NULL),
(491, 2, 2, '/', '2018-02-08 05:45:47', NULL, NULL, NULL),
(492, 2, 2, '/company', '2018-02-08 05:46:00', NULL, NULL, NULL),
(493, 2, 2, '/cemeteries', '2018-02-08 05:46:01', NULL, NULL, NULL),
(494, 2, 2, '/shop', '2018-02-08 05:46:02', NULL, NULL, NULL),
(495, 2, 2, '/', '2018-02-08 05:46:03', NULL, NULL, NULL),
(496, 2, 2, '/shop', '2018-02-08 05:46:05', NULL, NULL, NULL),
(497, 2, 2, '/shop-categories/2', '2018-02-08 05:46:06', NULL, NULL, NULL),
(498, 2, 2, '/shop-categories/47', '2018-02-08 05:46:07', NULL, NULL, NULL),
(499, 2, 2, '/product/56', '2018-02-08 05:46:08', NULL, NULL, NULL),
(500, 2, 2, '/cart', '2018-02-08 05:46:12', NULL, NULL, NULL),
(501, 2, 2, '/cart', '2018-02-08 05:46:15', NULL, NULL, NULL),
(502, 2, 2, '/', '2018-02-08 05:46:17', NULL, NULL, NULL),
(503, 2, 2, '/shop', '2018-02-08 05:46:18', NULL, NULL, NULL),
(504, 2, 2, '/shop', '2018-02-08 05:46:47', NULL, NULL, NULL),
(505, 2, 2, '/shop-categories/3', '2018-02-08 05:46:52', NULL, NULL, NULL),
(506, 2, 2, '/shop-categories/47', '2018-02-08 05:46:53', NULL, NULL, NULL),
(507, 2, 2, '/product/56', '2018-02-08 05:46:55', NULL, NULL, NULL),
(508, 2, 2, '/product/56', '2018-02-08 05:47:37', NULL, NULL, NULL),
(509, 2, 2, '/product/56', '2018-02-08 05:47:41', NULL, NULL, NULL),
(510, 2, 2, '/product/56', '2018-02-08 05:48:45', NULL, NULL, NULL),
(511, 2, 2, '/product/56', '2018-02-08 05:48:53', NULL, NULL, NULL),
(512, 2, 2, '/product/56', '2018-02-08 05:48:59', NULL, NULL, NULL),
(513, 2, 2, '/product/56', '2018-02-08 05:50:14', NULL, NULL, NULL),
(514, 2, 2, '/product/56', '2018-02-08 05:50:19', NULL, NULL, NULL),
(515, 2, 2, '/product/56', '2018-02-08 05:50:23', NULL, NULL, NULL),
(516, 2, 2, '/product/56', '2018-02-08 05:50:26', NULL, NULL, NULL),
(517, 2, 2, '/cart', '2018-02-08 05:50:30', NULL, NULL, NULL),
(518, 2, 2, '/', '2018-02-08 05:50:33', NULL, NULL, NULL),
(519, 2, 2, '/company', '2018-02-08 05:50:42', NULL, NULL, NULL),
(520, 2, 2, '/shop', '2018-02-08 05:50:42', NULL, NULL, NULL),
(521, 2, 2, '/shop-categories/2', '2018-02-08 05:50:44', NULL, NULL, NULL),
(522, 2, 2, '/cart', '2018-02-08 05:50:45', NULL, NULL, NULL),
(523, 2, 2, '/cart', '2018-02-08 05:50:47', NULL, NULL, NULL),
(524, 2, 2, '/cart', '2018-02-08 05:52:09', NULL, NULL, NULL),
(525, 2, 2, '/cart', '2018-02-08 05:53:04', NULL, NULL, NULL),
(526, 2, 2, '/cart', '2018-02-08 05:53:18', NULL, NULL, NULL),
(527, 2, 2, '/cart', '2018-02-08 05:53:23', NULL, NULL, NULL),
(528, 2, 2, '/shop', '2018-02-08 05:53:23', NULL, NULL, NULL),
(529, 2, 2, '/shop-categories/2', '2018-02-08 05:53:25', NULL, NULL, NULL),
(530, 2, 2, '/shop-categories/47', '2018-02-08 05:53:27', NULL, NULL, NULL),
(531, 2, 2, '/product/56', '2018-02-08 05:53:28', NULL, NULL, NULL),
(532, 2, 2, '/cart', '2018-02-08 05:53:36', NULL, NULL, NULL),
(533, 2, 2, '/cart', '2018-02-08 05:54:29', NULL, NULL, NULL),
(534, 2, 2, '/cart', '2018-02-08 05:55:25', NULL, NULL, NULL),
(535, 2, 2, '/cart', '2018-02-08 05:55:29', NULL, NULL, NULL),
(536, 2, 2, '/cart', '2018-02-08 05:55:30', NULL, NULL, NULL),
(537, 2, 2, '/cart', '2018-02-08 05:55:31', NULL, NULL, NULL),
(538, 2, 2, '/cart', '2018-02-08 05:55:31', NULL, NULL, NULL),
(539, 2, 2, '/cart', '2018-02-08 05:55:33', NULL, NULL, NULL),
(540, 2, 2, '/cart', '2018-02-08 05:55:34', NULL, NULL, NULL),
(541, 2, 2, '/cart', '2018-02-08 05:55:34', NULL, NULL, NULL),
(542, 2, 2, '/cart', '2018-02-08 05:55:35', NULL, NULL, NULL),
(543, 2, 2, '/cart', '2018-02-08 05:55:36', NULL, NULL, NULL),
(544, 2, 2, '/cart', '2018-02-08 05:55:36', NULL, NULL, NULL),
(545, 2, 2, '/cart', '2018-02-08 05:55:37', NULL, NULL, NULL),
(546, 2, 2, '/cart', '2018-02-08 05:55:38', NULL, NULL, NULL),
(547, 2, 2, '/cart', '2018-02-08 05:55:38', NULL, NULL, NULL),
(548, 2, 2, '/cart', '2018-02-08 05:55:39', NULL, NULL, NULL),
(549, 2, 2, '/cart', '2018-02-08 05:55:40', NULL, NULL, NULL),
(550, 2, 2, '/cart', '2018-02-08 05:55:40', NULL, NULL, NULL),
(551, 2, 2, '/cart', '2018-02-08 05:55:41', NULL, NULL, NULL),
(552, 2, 2, '/cart', '2018-02-08 05:55:42', NULL, NULL, NULL),
(553, 2, 2, '/cart', '2018-02-08 05:55:42', NULL, NULL, NULL),
(554, 2, 2, '/cart', '2018-02-08 05:55:43', NULL, NULL, NULL),
(555, 2, 2, '/cart', '2018-02-08 05:55:44', NULL, NULL, NULL),
(556, 2, 2, '/cart', '2018-02-08 05:55:44', NULL, NULL, NULL),
(557, 2, 2, '/cart', '2018-02-08 05:55:45', NULL, NULL, NULL),
(558, 2, 2, '/cart', '2018-02-08 05:55:46', NULL, NULL, NULL),
(559, 2, 2, '/cart', '2018-02-08 05:55:46', NULL, NULL, NULL),
(560, 2, 2, '/cart', '2018-02-08 05:55:47', NULL, NULL, NULL),
(561, 2, 2, '/cart', '2018-02-08 05:55:48', NULL, NULL, NULL),
(562, 2, 2, '/cart', '2018-02-08 05:55:48', NULL, NULL, NULL),
(563, 2, 2, '/cart', '2018-02-08 05:55:48', NULL, NULL, NULL),
(564, 2, 2, '/cart', '2018-02-08 05:55:49', NULL, NULL, NULL),
(565, 2, 2, '/cart', '2018-02-08 05:55:50', NULL, NULL, NULL),
(566, 2, 2, '/cart', '2018-02-08 05:55:50', NULL, NULL, NULL),
(567, 2, 2, '/cart', '2018-02-08 05:55:51', NULL, NULL, NULL),
(568, 2, 2, '/cart', '2018-02-08 05:55:52', NULL, NULL, NULL),
(569, 2, 2, '/cart', '2018-02-08 05:55:53', NULL, NULL, NULL),
(570, 2, 2, '/cart', '2018-02-08 05:55:53', NULL, NULL, NULL),
(571, 2, 2, '/cart', '2018-02-08 05:55:54', NULL, NULL, NULL),
(572, 2, 2, '/cart', '2018-02-08 05:55:54', NULL, NULL, NULL),
(573, 2, 2, '/cart', '2018-02-08 05:55:55', NULL, NULL, NULL),
(574, 2, 2, '/cart', '2018-02-08 05:55:56', NULL, NULL, NULL),
(575, 2, 2, '/cart', '2018-02-08 05:56:02', NULL, NULL, NULL),
(576, 2, 2, '/cart', '2018-02-08 05:56:13', NULL, NULL, NULL),
(577, 2, 2, '/cart', '2018-02-08 05:56:40', NULL, NULL, NULL),
(578, 2, 2, '/cart', '2018-02-08 05:56:45', NULL, NULL, NULL),
(579, 2, 2, '/cart', '2018-02-08 05:56:46', NULL, NULL, NULL),
(580, 2, 2, '/cart', '2018-02-08 05:56:48', NULL, NULL, NULL),
(581, 2, 2, '/cart', '2018-02-08 05:58:13', NULL, NULL, NULL),
(582, 2, 2, '/cart', '2018-02-08 05:58:14', NULL, NULL, NULL),
(583, 2, 2, '/cart', '2018-02-08 05:59:31', NULL, NULL, NULL),
(584, 2, 2, '/shop', '2018-02-08 05:59:33', NULL, NULL, NULL),
(585, 2, 2, '/shop-categories/2', '2018-02-08 05:59:34', NULL, NULL, NULL),
(586, 2, 2, '/shop-categories/2', '2018-02-08 05:59:35', NULL, NULL, NULL),
(587, 2, 2, '/shop-categories/3', '2018-02-08 05:59:35', NULL, NULL, NULL),
(588, 2, 2, '/shop-categories/10', '2018-02-08 05:59:36', NULL, NULL, NULL),
(589, 2, 2, '/shop-categories/2', '2018-02-08 05:59:36', NULL, NULL, NULL),
(590, 2, 2, '/login', '2018-02-08 05:59:40', NULL, NULL, NULL),
(591, 2, 2, '/', '2018-02-08 05:59:44', NULL, NULL, NULL),
(592, 2, 2, '/shop', '2018-02-08 05:59:45', NULL, NULL, NULL),
(593, 2, 2, '/shop-categories/2', '2018-02-08 05:59:47', NULL, NULL, NULL),
(594, 2, 2, '/shop-categories/2', '2018-02-08 05:59:48', NULL, NULL, NULL),
(595, 2, 2, '/shop-categories/2', '2018-02-08 05:59:49', NULL, NULL, NULL),
(596, 2, 2, '/shop-categories/2', '2018-02-08 05:59:50', NULL, NULL, NULL),
(597, 2, 2, '/product/58', '2018-02-08 05:59:52', NULL, NULL, NULL),
(598, 2, 2, '/product/58', '2018-02-08 05:59:52', NULL, NULL, NULL),
(599, 2, 2, '/product/58', '2018-02-08 06:00:05', NULL, NULL, NULL),
(600, 2, 2, '/cart', '2018-02-08 06:00:08', NULL, NULL, NULL),
(601, 2, 2, '/cart', '2018-02-08 06:00:18', NULL, NULL, NULL),
(602, 2, 2, '/cart', '2018-02-08 06:00:24', NULL, NULL, NULL),
(603, 2, 2, '/cart', '2018-02-08 06:01:32', NULL, NULL, NULL),
(604, 2, 2, '/cart', '2018-02-08 06:01:33', NULL, NULL, NULL),
(605, 2, 2, '/cart', '2018-02-08 06:01:35', NULL, NULL, NULL),
(606, 2, 2, '/cart', '2018-02-08 06:01:37', NULL, NULL, NULL),
(607, 2, 2, '/cart', '2018-02-08 06:01:37', NULL, NULL, NULL),
(608, 2, 2, '/cart', '2018-02-08 06:02:20', NULL, NULL, NULL),
(609, 2, 2, '/cart', '2018-02-08 06:02:22', NULL, NULL, NULL),
(610, 2, 2, '/cart', '2018-02-08 06:02:23', NULL, NULL, NULL),
(611, 2, 2, '/cart', '2018-02-08 06:02:24', NULL, NULL, NULL),
(612, 2, 2, '/cart', '2018-02-08 06:02:25', NULL, NULL, NULL),
(613, 2, 2, '/cart', '2018-02-08 06:02:27', NULL, NULL, NULL),
(614, 2, 2, '/shop', '2018-02-08 06:02:29', NULL, NULL, NULL),
(615, 2, 2, '/shop-categories/2', '2018-02-08 06:02:31', NULL, NULL, NULL),
(616, 2, 2, '/product/58', '2018-02-08 06:02:33', NULL, NULL, NULL),
(617, 2, 2, '/cart', '2018-02-08 06:02:36', NULL, NULL, NULL),
(618, 2, 2, '/cart', '2018-02-08 06:02:37', NULL, NULL, NULL),
(619, 2, 2, '/cart', '2018-02-08 06:02:38', NULL, NULL, NULL),
(620, 2, 2, '/cart', '2018-02-08 06:02:39', NULL, NULL, NULL),
(621, 2, 2, '/cart', '2018-02-08 06:02:39', NULL, NULL, NULL),
(622, 2, 2, '/cart', '2018-02-08 06:02:40', NULL, NULL, NULL),
(623, 2, 2, '/cart', '2018-02-08 06:02:41', NULL, NULL, NULL),
(624, 2, 2, '/cart', '2018-02-08 06:02:42', NULL, NULL, NULL),
(625, 2, 2, '/cart', '2018-02-08 06:02:42', NULL, NULL, NULL),
(626, 2, 2, '/cart', '2018-02-08 06:02:43', NULL, NULL, NULL),
(627, 2, 2, '/cart', '2018-02-08 06:02:44', NULL, NULL, NULL),
(628, 2, 2, '/cart', '2018-02-08 06:02:44', NULL, NULL, NULL),
(629, 2, 2, '/cart', '2018-02-08 06:02:45', NULL, NULL, NULL),
(630, 2, 2, '/product/58', '2018-02-08 06:02:46', NULL, NULL, NULL),
(631, 2, 2, '/cart', '2018-02-08 06:02:48', NULL, NULL, NULL),
(632, 2, 2, '/cart', '2018-02-08 06:02:52', NULL, NULL, NULL),
(633, 2, 2, '/cart', '2018-02-08 06:02:53', NULL, NULL, NULL),
(634, 2, 2, '/cart', '2018-02-08 06:02:55', NULL, NULL, NULL),
(635, 2, 2, '/cart', '2018-02-08 06:03:21', NULL, NULL, NULL),
(636, 2, 2, '/cart', '2018-02-08 06:03:25', NULL, NULL, NULL),
(637, 2, 2, '/cart', '2018-02-08 06:03:26', NULL, NULL, NULL),
(638, 2, 2, '/cart', '2018-02-08 06:03:30', NULL, NULL, NULL),
(639, 2, 2, '/cart', '2018-02-08 06:03:32', NULL, NULL, NULL),
(640, 2, 2, '/product/58', '2018-02-08 06:03:40', NULL, NULL, NULL),
(641, 2, 2, '/cart', '2018-02-08 06:03:42', NULL, NULL, NULL),
(642, 2, 2, '/cart', '2018-02-08 06:03:44', NULL, NULL, NULL),
(643, 2, 2, '/cart', '2018-02-08 06:03:44', NULL, NULL, NULL),
(644, 2, 2, '/cart', '2018-02-08 06:03:48', NULL, NULL, NULL),
(645, 2, 2, '/cart', '2018-02-08 06:03:48', NULL, NULL, NULL),
(646, 2, 2, '/cart', '2018-02-08 06:03:50', NULL, NULL, NULL),
(647, 2, 2, '/product/58', '2018-02-08 06:04:24', NULL, NULL, NULL),
(648, 2, 2, '/cart', '2018-02-08 06:04:25', NULL, NULL, NULL),
(649, 2, 2, '/shop-categories/2', '2018-02-08 06:04:52', NULL, NULL, NULL),
(650, 2, 2, '/shop-categories/3', '2018-02-08 06:04:53', NULL, NULL, NULL),
(651, 2, 2, '/shop-categories/10', '2018-02-08 06:04:53', NULL, NULL, NULL),
(652, 2, 2, '/shop-categories/4', '2018-02-08 06:04:54', NULL, NULL, NULL),
(653, 2, 2, '/shop-categories/10', '2018-02-08 06:04:55', NULL, NULL, NULL),
(654, 2, 2, '/my', '2018-02-08 06:05:05', NULL, NULL, NULL),
(655, 3, 3, '/', '2018-02-08 06:06:45', NULL, NULL, NULL),
(656, 3, 3, '/shop', '2018-02-08 06:06:46', NULL, NULL, NULL),
(657, 3, 3, '/shop-categories/2', '2018-02-08 06:06:47', NULL, NULL, NULL),
(658, 3, 3, '/product/58', '2018-02-08 06:06:49', NULL, NULL, NULL),
(659, 3, 3, '/cart', '2018-02-08 06:06:57', NULL, NULL, NULL),
(660, 3, 3, '/order', '2018-02-08 06:06:59', NULL, NULL, NULL),
(661, 3, 3, '/order-complete/37adc1a6bc2f26aca71bf6bc7c88c76a', '2018-02-08 06:07:42', NULL, NULL, NULL),
(662, 3, 3, '/', '2018-02-08 06:07:52', NULL, NULL, NULL),
(663, 3, 3, '/shop', '2018-02-08 06:07:55', NULL, NULL, NULL),
(664, 3, 3, '/cemeteries', '2018-02-08 06:09:13', NULL, NULL, NULL),
(665, 3, 3, '/company', '2018-02-08 06:09:14', NULL, NULL, NULL),
(666, 3, 3, '/', '2018-02-08 06:09:14', NULL, NULL, NULL),
(667, 3, 3, '/company', '2018-02-08 06:09:15', NULL, NULL, NULL),
(668, 3, 3, '/cemeteries', '2018-02-08 06:09:15', NULL, NULL, NULL),
(669, 3, 3, '/shop', '2018-02-08 06:09:16', NULL, NULL, NULL),
(670, 3, 3, '/shop', '2018-02-08 06:09:29', NULL, NULL, NULL),
(671, 3, 3, '/company', '2018-02-08 06:09:44', NULL, NULL, NULL),
(672, 3, 3, '/cemeteries', '2018-02-08 06:09:44', NULL, NULL, NULL),
(673, 3, 3, '/company', '2018-02-08 06:09:45', NULL, NULL, NULL),
(674, 3, 3, '/cemeteries', '2018-02-08 06:09:45', NULL, NULL, NULL),
(675, 3, 3, '/', '2018-02-08 06:09:47', NULL, NULL, NULL),
(676, 3, 3, '/company', '2018-02-08 06:09:48', NULL, NULL, NULL),
(677, 3, 3, '/cemeteries', '2018-02-08 06:09:49', NULL, NULL, NULL),
(678, 3, 3, '/company', '2018-02-08 06:09:49', NULL, NULL, NULL),
(679, 3, 3, '/cemeteries', '2018-02-08 06:12:44', NULL, NULL, NULL),
(680, 3, 3, '/shop', '2018-02-08 06:12:46', NULL, NULL, NULL),
(681, 3, 3, '/cemeteries', '2018-02-08 06:12:47', NULL, NULL, NULL),
(682, 3, 3, '/company', '2018-02-08 06:12:48', NULL, NULL, NULL),
(683, 3, 3, '/', '2018-02-08 06:12:51', NULL, NULL, NULL),
(684, 3, 3, '/company', '2018-02-08 06:12:52', NULL, NULL, NULL),
(685, 3, 3, '/cemeteries', '2018-02-08 06:12:52', NULL, NULL, NULL),
(686, 3, 3, '/company', '2018-02-08 06:12:53', NULL, NULL, NULL),
(687, 3, 3, '/cemeteries', '2018-02-08 06:12:53', NULL, NULL, NULL),
(688, 3, 3, '/shop', '2018-02-08 06:12:54', NULL, NULL, NULL),
(689, 3, 3, '/shop-categories/2', '2018-02-08 06:12:55', NULL, NULL, NULL),
(690, 3, 3, '/login', '2018-02-08 06:13:05', NULL, NULL, NULL),
(691, 3, 3, '/', '2018-02-08 06:13:12', NULL, NULL, NULL),
(692, 4, 4, '/', '2018-02-08 06:13:15', NULL, NULL, NULL),
(693, 4, 4, '/login', '2018-02-08 06:13:16', NULL, NULL, NULL),
(694, 4, 4, '/login', '2018-02-08 06:13:44', NULL, NULL, NULL),
(695, 4, 4, '/', '2018-02-08 06:13:53', NULL, NULL, NULL),
(696, 4, 4, '/my', '2018-02-08 06:13:55', NULL, NULL, NULL),
(697, 4, 4, '/my', '2018-02-08 06:14:01', NULL, NULL, NULL),
(698, 4, 4, '/my', '2018-02-08 06:15:11', NULL, NULL, NULL),
(699, 4, 4, '/my', '2018-02-08 06:16:09', NULL, NULL, NULL),
(700, 4, 4, '/my', '2018-02-08 06:17:02', NULL, NULL, NULL),
(701, 4, 4, '/my', '2018-02-08 06:17:43', NULL, NULL, NULL),
(702, 4, 4, '/my', '2018-02-08 06:17:49', NULL, NULL, NULL),
(703, 4, 4, '/my', '2018-02-08 06:18:38', NULL, NULL, NULL),
(704, 4, 4, '/my', '2018-02-08 06:18:52', NULL, NULL, NULL),
(705, 4, 4, '/my', '2018-02-08 06:19:23', NULL, NULL, NULL),
(706, 4, 4, '/my', '2018-02-08 06:19:37', NULL, NULL, NULL),
(707, 4, 4, '/my', '2018-02-08 06:20:23', NULL, NULL, NULL),
(708, 4, 4, '/my', '2018-02-08 06:20:46', NULL, NULL, NULL),
(709, 4, 4, '/my', '2018-02-08 06:20:52', NULL, NULL, NULL),
(710, 4, 4, '/my', '2018-02-08 06:25:01', NULL, NULL, NULL),
(711, 4, 4, '/my', '2018-02-08 06:25:04', NULL, NULL, NULL),
(712, 4, 4, '/my', '2018-02-08 06:27:37', NULL, NULL, NULL),
(713, 4, 4, '/my', '2018-02-08 06:27:55', NULL, NULL, NULL),
(714, 4, 4, '/my', '2018-02-08 06:27:56', NULL, NULL, NULL),
(715, 4, 4, '/my', '2018-02-08 06:30:28', NULL, NULL, NULL);
INSERT INTO `views` (`id`, `visit_id`, `visitor_id`, `path`, `created`, `updated`, `activated`, `closed`) VALUES
(716, 4, 4, '/my', '2018-02-08 06:30:29', NULL, NULL, NULL),
(717, 4, 4, '/my', '2018-02-08 06:30:33', NULL, NULL, NULL),
(718, 4, 4, '/my', '2018-02-08 06:35:35', NULL, NULL, NULL),
(719, 4, 4, '/my', '2018-02-08 06:35:37', NULL, NULL, NULL),
(720, 4, 4, '/my', '2018-02-08 06:36:56', NULL, NULL, NULL),
(721, 4, 4, '/my', '2018-02-08 06:37:04', NULL, NULL, NULL),
(722, 4, 4, '/my', '2018-02-08 06:37:31', NULL, NULL, NULL),
(723, 4, 4, '/my', '2018-02-08 06:37:33', NULL, NULL, NULL),
(724, 4, 4, '/my', '2018-02-08 06:38:43', NULL, NULL, NULL),
(725, 4, 4, '/my', '2018-02-08 06:42:46', NULL, NULL, NULL),
(726, 4, 4, '/my', '2018-02-08 06:43:10', NULL, NULL, NULL),
(727, 4, 4, '/my', '2018-02-08 06:43:13', NULL, NULL, NULL),
(728, 4, 4, '/my', '2018-02-08 06:43:18', NULL, NULL, NULL),
(729, 4, 4, '/my', '2018-02-08 06:43:31', NULL, NULL, NULL),
(730, 4, 4, '/my', '2018-02-08 06:43:37', NULL, NULL, NULL),
(731, 4, 4, '/my', '2018-02-08 06:43:44', NULL, NULL, NULL),
(732, 4, 4, '/my', '2018-02-08 06:43:47', NULL, NULL, NULL),
(733, 4, 4, '/my', '2018-02-08 06:43:56', NULL, NULL, NULL),
(734, 4, 4, '/my', '2018-02-08 06:45:37', NULL, NULL, NULL),
(735, 4, 4, '/my', '2018-02-08 06:45:40', NULL, NULL, NULL),
(736, 4, 4, '/my', '2018-02-08 06:45:47', NULL, NULL, NULL),
(737, 4, 4, '/my', '2018-02-08 06:46:02', NULL, NULL, NULL),
(738, 4, 4, '/', '2018-02-08 06:47:23', NULL, NULL, NULL),
(739, 4, 4, '/login', '2018-02-08 06:47:27', NULL, NULL, NULL),
(740, 4, 4, '/my', '2018-02-08 06:48:13', NULL, NULL, NULL),
(741, 4, 4, '/my', '2018-02-08 06:48:15', NULL, NULL, NULL),
(742, 4, 4, '/my', '2018-02-08 06:48:58', NULL, NULL, NULL),
(743, 4, 4, '/my', '2018-02-08 06:49:02', NULL, NULL, NULL),
(744, 4, 4, '/my', '2018-02-08 06:49:11', NULL, NULL, NULL),
(745, 4, 4, '/my', '2018-02-08 06:49:41', NULL, NULL, NULL),
(746, 4, 4, '/my', '2018-02-08 06:49:52', NULL, NULL, NULL),
(747, 4, 4, '/my', '2018-02-08 06:50:42', NULL, NULL, NULL),
(748, 4, 4, '/my', '2018-02-08 06:51:04', NULL, NULL, NULL),
(749, 4, 4, '/my', '2018-02-08 06:51:07', NULL, NULL, NULL),
(750, 4, 4, '/my', '2018-02-08 06:51:49', NULL, NULL, NULL),
(751, 4, 4, '/my', '2018-02-08 06:52:10', NULL, NULL, NULL),
(752, 4, 4, '/my', '2018-02-08 06:52:11', NULL, NULL, NULL),
(753, 4, 4, '/my', '2018-02-08 06:52:28', NULL, NULL, NULL),
(754, 4, 4, '/my', '2018-02-08 06:52:55', NULL, NULL, NULL),
(755, 4, 4, '/my', '2018-02-08 06:54:23', NULL, NULL, NULL),
(756, 4, 4, '/my', '2018-02-08 06:54:28', NULL, NULL, NULL),
(757, 4, 4, '/my', '2018-02-08 06:54:33', NULL, NULL, NULL),
(758, 4, 4, '/my', '2018-02-08 06:55:03', NULL, NULL, NULL),
(759, 4, 4, '/my', '2018-02-08 06:55:08', NULL, NULL, NULL),
(760, 4, 4, '/my', '2018-02-08 06:55:48', NULL, NULL, NULL),
(761, 4, 4, '/my', '2018-02-08 06:56:12', NULL, NULL, NULL),
(762, 4, 4, '/my', '2018-02-08 06:56:23', NULL, NULL, NULL),
(763, 4, 4, '/my', '2018-02-08 06:59:41', NULL, NULL, NULL),
(764, 4, 4, '/my', '2018-02-08 07:00:37', NULL, NULL, NULL),
(765, 4, 4, '/my', '2018-02-08 07:00:39', NULL, NULL, NULL),
(766, 4, 4, '/my', '2018-02-08 07:00:39', NULL, NULL, NULL),
(767, 4, 4, '/my', '2018-02-08 07:00:50', NULL, NULL, NULL),
(768, 4, 4, '/my', '2018-02-08 07:01:02', NULL, NULL, NULL),
(769, 4, 4, '/my', '2018-02-08 07:03:41', NULL, NULL, NULL),
(770, 4, 4, '/', '2018-02-08 07:04:03', NULL, NULL, NULL),
(771, 4, 4, '/login', '2018-02-08 07:04:04', NULL, NULL, NULL),
(772, 4, 4, '/login', '2018-02-08 07:04:20', NULL, NULL, NULL),
(773, 4, 4, '/', '2018-02-08 07:04:34', NULL, NULL, NULL),
(774, 4, 4, '/my', '2018-02-08 07:04:36', NULL, NULL, NULL),
(775, 4, 4, '/my', '2018-02-08 07:04:40', NULL, NULL, NULL),
(776, 4, 4, '/my', '2018-02-08 07:04:50', NULL, NULL, NULL),
(777, 5, 5, '/', '2018-02-08 07:04:55', NULL, NULL, NULL),
(778, 5, 5, '/login', '2018-02-08 07:04:57', NULL, NULL, NULL),
(779, 5, 5, '/', '2018-02-08 07:05:04', NULL, NULL, NULL),
(780, 5, 5, '/my', '2018-02-08 07:05:34', NULL, NULL, NULL),
(781, 5, 5, '/company', '2018-02-08 07:05:41', NULL, NULL, NULL),
(782, 5, 5, '/cemeteries', '2018-02-08 07:05:41', NULL, NULL, NULL),
(783, 5, 5, '/shop', '2018-02-08 07:05:42', NULL, NULL, NULL),
(784, 5, 5, '/', '2018-02-08 07:05:43', NULL, NULL, NULL),
(785, 5, 5, '/my', '2018-02-08 07:06:12', NULL, NULL, NULL),
(786, 5, 5, '/my', '2018-02-08 07:06:27', NULL, NULL, NULL),
(787, 5, 5, '/company', '2018-02-08 07:07:24', NULL, NULL, NULL),
(788, 5, 5, '/cemeteries', '2018-02-08 07:07:24', NULL, NULL, NULL),
(789, 5, 5, '/shop', '2018-02-08 07:07:25', NULL, NULL, NULL),
(790, 5, 5, '/', '2018-02-08 07:07:26', NULL, NULL, NULL),
(791, 5, 5, '/shop', '2018-02-08 07:07:41', NULL, NULL, NULL),
(792, 5, 5, '/my', '2018-02-08 07:09:32', NULL, NULL, NULL),
(793, 5, 5, '/shop', '2018-02-08 07:09:35', NULL, NULL, NULL),
(794, 5, 5, '/cart', '2018-02-08 07:09:35', NULL, NULL, NULL),
(795, 6, 6, '/', '2018-02-08 07:09:37', NULL, NULL, NULL),
(796, 6, 6, '/shop', '2018-02-08 07:09:40', NULL, NULL, NULL),
(797, 6, 6, '/shop-categories/2', '2018-02-08 07:09:42', NULL, NULL, NULL),
(798, 6, 6, '/product/58', '2018-02-08 07:09:43', NULL, NULL, NULL),
(799, 6, 6, '/login', '2018-02-08 07:09:45', NULL, NULL, NULL),
(800, 6, 6, '/', '2018-02-08 07:09:53', NULL, NULL, NULL),
(801, 6, 6, '/cart', '2018-02-08 07:09:55', NULL, NULL, NULL),
(802, 6, 6, '/cart', '2018-02-08 07:09:56', NULL, NULL, NULL),
(803, 6, 6, '/admin', '2018-02-08 07:09:57', NULL, NULL, NULL),
(804, 6, 6, '/admin-clients', '2018-02-08 07:10:12', NULL, NULL, NULL),
(805, 6, 6, '/admin-attendance', '2018-02-08 07:10:15', NULL, NULL, NULL),
(806, 6, 6, '/admin-clients', '2018-02-08 07:10:16', NULL, NULL, NULL),
(807, 6, 6, '/admin-clients', '2018-02-08 07:10:18', NULL, NULL, NULL),
(808, 6, 6, '/admin-clients', '2018-02-08 07:10:25', NULL, NULL, NULL),
(809, 6, 6, '/admin-clients', '2018-02-08 07:10:26', NULL, NULL, NULL),
(810, 6, 6, '/admin-clients', '2018-02-08 07:10:34', NULL, NULL, NULL),
(811, 6, 6, '/admin-clients', '2018-02-08 07:10:40', NULL, NULL, NULL),
(812, 6, 6, '/admin-attendance', '2018-02-08 07:11:02', NULL, NULL, NULL),
(813, 6, 6, '/admin-components', '2018-02-08 07:11:03', NULL, NULL, NULL),
(814, 6, 6, '/admin-globals', '2018-02-08 07:11:05', NULL, NULL, NULL),
(815, 6, 6, '/admin-components', '2018-02-08 07:11:06', NULL, NULL, NULL),
(816, 6, 6, '/admin-globals', '2018-02-08 07:11:21', NULL, NULL, NULL),
(817, 6, 6, '/admin-globals', '2018-02-08 07:11:30', NULL, NULL, NULL),
(818, 6, 6, '/admin-components', '2018-02-08 07:11:38', NULL, NULL, NULL),
(819, 6, 6, '/admin-components', '2018-02-08 07:13:35', NULL, NULL, NULL),
(820, 6, 6, '/admin-components', '2018-02-08 07:13:37', NULL, NULL, NULL),
(821, 6, 6, '/admin-components', '2018-02-08 07:14:32', NULL, NULL, NULL),
(822, 6, 6, '/admin-components', '2018-02-08 07:14:48', NULL, NULL, NULL),
(823, 6, 6, '/admin-components', '2018-02-08 07:18:14', NULL, NULL, NULL),
(824, 6, 6, '/admin-components', '2018-02-08 07:18:21', NULL, NULL, NULL),
(825, 6, 6, '/admin-components', '2018-02-08 07:18:26', NULL, NULL, NULL),
(826, 6, 6, '/admin-components', '2018-02-08 07:18:36', NULL, NULL, NULL),
(827, 6, 6, '/admin-components', '2018-02-08 07:18:47', NULL, NULL, NULL),
(828, 6, 6, '/admin-components', '2018-02-08 07:20:34', NULL, NULL, NULL),
(829, 6, 6, '/admin-components', '2018-02-08 07:20:37', NULL, NULL, NULL),
(830, 6, 6, '/admin-components', '2018-02-08 07:20:38', NULL, NULL, NULL),
(831, 6, 6, '/admin-components', '2018-02-08 07:20:39', NULL, NULL, NULL),
(832, 6, 6, '/admin-components', '2018-02-08 07:20:40', NULL, NULL, NULL),
(833, 6, 6, '/admin-components', '2018-02-08 07:20:42', NULL, NULL, NULL),
(834, 6, 6, '/admin-components', '2018-02-08 07:21:01', NULL, NULL, NULL),
(835, 6, 6, '/admin-components', '2018-02-08 07:21:09', NULL, NULL, NULL),
(836, 6, 6, '/admin-components', '2018-02-08 07:21:18', NULL, NULL, NULL),
(837, 6, 6, '/admin-components', '2018-02-08 07:22:39', NULL, NULL, NULL),
(838, 6, 6, '/admin-components', '2018-02-08 07:23:12', NULL, NULL, NULL),
(839, 6, 6, '/admin-components', '2018-02-08 07:23:49', NULL, NULL, NULL),
(840, 6, 6, '/admin-globals', '2018-02-08 07:23:52', NULL, NULL, NULL),
(841, 6, 6, '/admin-components', '2018-02-08 07:23:54', NULL, NULL, NULL),
(842, 6, 6, '/admin-components', '2018-02-08 07:24:14', NULL, NULL, NULL),
(843, 6, 6, '/admin-components', '2018-02-08 07:24:21', NULL, NULL, NULL),
(844, 6, 6, '/admin-components', '2018-02-08 07:25:20', NULL, NULL, NULL),
(845, 6, 6, '/admin-components', '2018-02-08 07:25:38', NULL, NULL, NULL),
(846, 6, 6, '/admin-components', '2018-02-08 07:27:24', NULL, NULL, NULL),
(847, 6, 6, '/admin-globals', '2018-02-08 07:32:49', NULL, NULL, NULL),
(848, 6, 6, '/my', '2018-02-08 07:33:33', NULL, NULL, NULL),
(849, 6, 6, '/my', '2018-02-08 07:33:37', NULL, NULL, NULL),
(850, 6, 6, '/my', '2018-02-08 07:33:46', NULL, NULL, NULL),
(851, 6, 6, '/my', '2018-02-08 07:33:48', NULL, NULL, NULL),
(852, 6, 6, '/admin', '2018-02-08 07:33:58', NULL, NULL, NULL),
(853, 6, 6, '/admin-routes', '2018-02-08 07:34:26', NULL, NULL, NULL),
(854, 6, 6, '/admin-routes', '2018-02-08 07:34:52', NULL, NULL, NULL),
(855, 6, 6, '/my-orders', '2018-02-08 07:34:54', NULL, NULL, NULL),
(856, 6, 6, '/my-orders', '2018-02-08 07:34:59', NULL, NULL, NULL),
(857, 6, 6, '/my-orders', '2018-02-08 07:37:13', NULL, NULL, NULL),
(858, 6, 6, '/my-orders', '2018-02-08 07:37:17', NULL, NULL, NULL),
(859, 6, 6, '/my-orders', '2018-02-08 07:37:20', NULL, NULL, NULL),
(860, 6, 6, '/my-orders', '2018-02-08 07:38:22', NULL, NULL, NULL),
(861, 6, 6, '/my-orders', '2018-02-08 07:39:04', NULL, NULL, NULL),
(862, 6, 6, '/my-orders', '2018-02-08 07:39:10', NULL, NULL, NULL),
(863, 6, 6, '/my-orders', '2018-02-08 07:39:30', NULL, NULL, NULL),
(864, 6, 6, '/my-orders', '2018-02-08 07:41:30', NULL, NULL, NULL),
(865, 6, 6, '/my-orders', '2018-02-08 07:41:46', NULL, NULL, NULL),
(866, 6, 6, '/my-orders', '2018-02-08 07:42:09', NULL, NULL, NULL),
(867, 6, 6, '/my-orders', '2018-02-08 07:42:45', NULL, NULL, NULL),
(868, 6, 6, '/my-orders', '2018-02-08 07:42:54', NULL, NULL, NULL),
(869, 6, 6, '/my-orders', '2018-02-08 07:42:56', NULL, NULL, NULL),
(870, 6, 6, '/my-orders', '2018-02-08 07:42:58', NULL, NULL, NULL),
(871, 6, 6, '/my-orders', '2018-02-08 07:43:01', NULL, NULL, NULL),
(872, 6, 6, '/my-orders', '2018-02-08 07:43:03', NULL, NULL, NULL),
(873, 6, 6, '/my-orders', '2018-02-08 07:43:04', NULL, NULL, NULL),
(874, 6, 6, '/my', '2018-02-08 07:43:05', NULL, NULL, NULL),
(875, 6, 6, '/my-orders', '2018-02-08 07:43:06', NULL, NULL, NULL),
(876, 6, 6, '/my-orders', '2018-02-08 07:44:33', NULL, NULL, NULL),
(877, 6, 6, '/my-orders', '2018-02-08 07:44:48', NULL, NULL, NULL),
(878, 6, 6, '/my-orders', '2018-02-08 07:44:54', NULL, NULL, NULL),
(879, 6, 6, '/my-orders', '2018-02-08 07:47:10', NULL, NULL, NULL),
(880, 6, 6, '/my-orders', '2018-02-08 07:50:02', NULL, NULL, NULL),
(881, 6, 6, '/my-orders', '2018-02-08 07:50:11', NULL, NULL, NULL),
(882, 6, 6, '/my-orders', '2018-02-08 07:50:26', NULL, NULL, NULL),
(883, 6, 6, '/my-orders', '2018-02-08 07:50:52', NULL, NULL, NULL),
(884, 6, 6, '/my-orders', '2018-02-08 07:51:07', NULL, NULL, NULL),
(885, 6, 6, '/my-orders', '2018-02-08 07:52:50', NULL, NULL, NULL),
(886, 6, 6, '/shop', '2018-02-08 07:53:05', NULL, NULL, NULL),
(887, 6, 6, '/shop-categories/2', '2018-02-08 07:53:07', NULL, NULL, NULL),
(888, 6, 6, '/shop-categories/2', '2018-02-08 07:53:07', NULL, NULL, NULL),
(889, 6, 6, '/product/58', '2018-02-08 07:53:09', NULL, NULL, NULL),
(890, 6, 6, '/shop-categories/47', '2018-02-08 07:53:13', NULL, NULL, NULL),
(891, 6, 6, '/product/56', '2018-02-08 07:53:15', NULL, NULL, NULL),
(892, 6, 6, '/shop-categories/4', '2018-02-08 07:53:18', NULL, NULL, NULL),
(893, 6, 6, '/shop-categories/10', '2018-02-08 07:53:18', NULL, NULL, NULL),
(894, 6, 6, '/product/55', '2018-02-08 07:53:19', NULL, NULL, NULL),
(895, 6, 6, '/cart', '2018-02-08 07:53:22', NULL, NULL, NULL),
(896, 6, 6, '/order', '2018-02-08 07:53:25', NULL, NULL, NULL),
(897, 6, 6, '/order-complete/f2344904636ea0b430eae9acf7b503dd', '2018-02-08 07:53:31', NULL, NULL, NULL),
(898, 6, 6, '/my', '2018-02-08 07:53:34', NULL, NULL, NULL),
(899, 6, 6, '/my-orders', '2018-02-08 07:53:37', NULL, NULL, NULL),
(900, 6, 6, '/my-orders', '2018-02-08 08:16:09', NULL, NULL, NULL),
(901, 6, 6, '/', '2018-02-08 08:16:12', NULL, NULL, NULL),
(902, 6, 6, '/', '2018-02-08 08:16:13', NULL, NULL, NULL),
(903, 6, 6, '/', '2018-02-08 08:16:15', NULL, NULL, NULL),
(904, 6, 6, '/', '2018-02-08 08:16:16', NULL, NULL, NULL),
(905, 6, 6, '/', '2018-02-08 08:16:31', NULL, NULL, NULL),
(906, 6, 6, '/', '2018-02-08 08:16:32', NULL, NULL, NULL),
(907, 6, 6, '/shop', '2018-02-08 08:16:41', NULL, NULL, NULL),
(908, 6, 6, '/shop-categories/2', '2018-02-08 08:16:43', NULL, NULL, NULL),
(909, 6, 6, '/product/58', '2018-02-08 08:16:44', NULL, NULL, NULL),
(910, 6, 6, '/', '2018-02-08 08:16:49', NULL, NULL, NULL),
(911, 6, 6, '/', '2018-02-08 08:16:49', NULL, NULL, NULL),
(912, 6, 6, '/cart', '2018-02-08 08:17:00', NULL, NULL, NULL),
(913, 6, 6, '/cart', '2018-02-08 08:17:02', NULL, NULL, NULL),
(914, 6, 6, '/cart', '2018-02-08 08:17:03', NULL, NULL, NULL),
(915, 6, 6, '/cart', '2018-02-08 08:17:03', NULL, NULL, NULL),
(916, 6, 6, '/company', '2018-02-08 08:17:37', NULL, NULL, NULL),
(917, 6, 6, '/company', '2018-02-08 08:17:41', NULL, NULL, NULL),
(918, 6, 6, '/company', '2018-02-08 08:17:43', NULL, NULL, NULL),
(919, 6, 6, '/company', '2018-02-08 08:17:44', NULL, NULL, NULL),
(920, 6, 6, '/company', '2018-02-08 08:19:02', NULL, NULL, NULL),
(921, 6, 6, '/company', '2018-02-08 08:25:07', NULL, NULL, NULL),
(922, 6, 6, '/cemeteries', '2018-02-08 08:25:22', NULL, NULL, NULL),
(923, 6, 6, '/shop', '2018-02-08 08:25:23', NULL, NULL, NULL),
(924, 6, 6, '/cart', '2018-02-08 08:25:31', NULL, NULL, NULL),
(925, 6, 6, '/order', '2018-02-08 08:25:34', NULL, NULL, NULL),
(926, 6, 6, '/order-complete/f2344904636ea0b430eae9acf7b503dd', '2018-02-08 08:26:54', NULL, NULL, NULL),
(927, 6, 6, '/shop', '2018-02-08 08:27:27', NULL, NULL, NULL),
(928, 6, 6, '/cart', '2018-02-08 08:27:55', NULL, NULL, NULL),
(929, 6, 6, '/cart', '2018-02-08 08:27:56', NULL, NULL, NULL),
(930, 6, 6, '/company', '2018-02-08 08:28:12', NULL, NULL, NULL),
(931, 6, 6, '/cart', '2018-02-08 08:31:35', NULL, NULL, NULL),
(932, 6, 6, '/cart', '2018-02-08 08:32:01', NULL, NULL, NULL),
(933, 6, 6, '/cart', '2018-02-08 08:32:12', NULL, NULL, NULL),
(934, 6, 6, '/cart', '2018-02-08 08:32:12', NULL, NULL, NULL),
(935, 6, 6, '/cart', '2018-02-08 08:32:15', NULL, NULL, NULL),
(936, 6, 6, '/cart', '2018-02-08 08:32:24', NULL, NULL, NULL),
(937, 6, 6, '/cart', '2018-02-08 08:32:36', NULL, NULL, NULL),
(938, 6, 6, '/cart', '2018-02-08 08:32:58', NULL, NULL, NULL),
(939, 6, 6, '/cart', '2018-02-08 08:33:00', NULL, NULL, NULL),
(940, 6, 6, '/cart', '2018-02-08 08:33:09', NULL, NULL, NULL),
(941, 6, 6, '/cart', '2018-02-08 08:33:11', NULL, NULL, NULL),
(942, 6, 6, '/cart', '2018-02-08 08:34:58', NULL, NULL, NULL),
(943, 6, 6, '/cart', '2018-02-08 08:36:23', NULL, NULL, NULL),
(944, 6, 6, '/cart', '2018-02-08 08:37:55', NULL, NULL, NULL),
(945, 6, 6, '/cart', '2018-02-08 08:38:06', NULL, NULL, NULL),
(946, 6, 6, '/cart', '2018-02-08 08:38:08', NULL, NULL, NULL),
(947, 6, 6, '/shop', '2018-02-08 08:47:17', NULL, NULL, NULL),
(948, 6, 6, '/shop-categories/2', '2018-02-08 08:47:18', NULL, NULL, NULL),
(949, 6, 6, '/product/58', '2018-02-08 08:47:20', NULL, NULL, NULL),
(950, 6, 6, '/shop', '2018-02-08 08:47:21', NULL, NULL, NULL),
(951, 6, 6, '/cart', '2018-02-08 08:47:23', NULL, NULL, NULL),
(952, 6, 6, '/order', '2018-02-08 08:47:25', NULL, NULL, NULL),
(953, 6, 6, '/order-complete/ae18735ee3c7d76660c271136dbc76f7', '2018-02-08 08:47:54', NULL, NULL, NULL),
(954, 6, 6, '/admin', '2018-02-08 08:52:08', NULL, NULL, NULL),
(955, 6, 6, '/admin', '2018-02-08 08:58:47', NULL, NULL, NULL),
(956, 6, 6, '/admin-routes', '2018-02-08 08:58:50', NULL, NULL, NULL),
(957, 6, 6, '/admin-clients', '2018-02-08 09:00:25', NULL, NULL, NULL),
(958, 6, 6, '/admin-clients', '2018-02-08 09:00:51', NULL, NULL, NULL),
(959, 6, 6, '/admin-clients', '2018-02-08 09:00:55', NULL, NULL, NULL),
(960, 6, 6, '/admin-attendance', '2018-02-08 09:03:37', NULL, NULL, NULL),
(961, 6, 6, '/admin-attendance', '2018-02-08 09:03:44', NULL, NULL, NULL),
(962, 6, 6, '/admin-attendance', '2018-02-08 09:03:47', NULL, NULL, NULL),
(963, 6, 6, '/admin-attendance', '2018-02-08 09:03:48', NULL, NULL, NULL),
(964, 6, 6, '/admin-attendance', '2018-02-08 09:03:48', NULL, NULL, NULL),
(965, 6, 6, '/admin-attendance', '2018-02-08 09:03:48', NULL, NULL, NULL),
(966, 6, 6, '/admin-attendance', '2018-02-08 09:03:49', NULL, NULL, NULL),
(967, 6, 6, '/admin-attendance', '2018-02-08 09:03:49', NULL, NULL, NULL),
(968, 6, 6, '/admin-attendance', '2018-02-08 09:03:49', NULL, NULL, NULL),
(969, 6, 6, '/admin-attendance', '2018-02-08 09:03:49', NULL, NULL, NULL),
(970, 6, 6, '/admin-attendance', '2018-02-08 09:04:06', NULL, NULL, NULL),
(971, 6, 6, '/admin-attendance', '2018-02-08 09:04:11', NULL, NULL, NULL),
(972, 6, 6, '/admin-attendance', '2018-02-08 09:06:52', NULL, NULL, NULL),
(973, 6, 6, '/admin-attendance', '2018-02-08 09:07:02', NULL, NULL, NULL),
(974, 6, 6, '/admin-attendance', '2018-02-08 09:07:06', NULL, NULL, NULL),
(975, 6, 6, '/admin-attendance', '2018-02-08 09:07:06', NULL, NULL, NULL),
(976, 6, 6, '/admin-attendance', '2018-02-08 09:07:07', NULL, NULL, NULL),
(977, 6, 6, '/admin-attendance', '2018-02-08 09:07:07', NULL, NULL, NULL),
(978, 6, 6, '/admin-attendance', '2018-02-08 09:07:08', NULL, NULL, NULL),
(979, 6, 6, '/admin-attendance', '2018-02-08 09:07:08', NULL, NULL, NULL),
(980, 6, 6, '/admin-attendance', '2018-02-08 09:07:08', NULL, NULL, NULL),
(981, 6, 6, '/admin-attendance', '2018-02-08 09:07:08', NULL, NULL, NULL),
(982, 6, 6, '/admin-attendance', '2018-02-08 09:07:08', NULL, NULL, NULL),
(983, 6, 6, '/admin-attendance', '2018-02-08 09:07:09', NULL, NULL, NULL),
(984, 6, 6, '/admin-attendance', '2018-02-08 09:07:09', NULL, NULL, NULL),
(985, 6, 6, '/admin-attendance', '2018-02-08 09:07:09', NULL, NULL, NULL),
(986, 6, 6, '/admin-attendance', '2018-02-08 09:07:09', NULL, NULL, NULL),
(987, 6, 6, '/admin-attendance', '2018-02-08 09:07:10', NULL, NULL, NULL),
(988, 6, 6, '/admin-attendance', '2018-02-08 09:07:12', NULL, NULL, NULL),
(989, 6, 6, '/admin-attendance', '2018-02-08 09:07:12', NULL, NULL, NULL),
(990, 6, 6, '/admin-attendance', '2018-02-08 09:07:12', NULL, NULL, NULL),
(991, 6, 6, '/admin-attendance', '2018-02-08 09:07:12', NULL, NULL, NULL),
(992, 6, 6, '/admin-attendance', '2018-02-08 09:07:13', NULL, NULL, NULL),
(993, 6, 6, '/admin-attendance', '2018-02-08 09:07:13', NULL, NULL, NULL),
(994, 6, 6, '/admin-attendance', '2018-02-08 09:07:14', NULL, NULL, NULL),
(995, 6, 6, '/admin-attendance', '2018-02-08 09:07:14', NULL, NULL, NULL),
(996, 6, 6, '/admin-attendance', '2018-02-08 09:07:14', NULL, NULL, NULL),
(997, 6, 6, '/admin-attendance', '2018-02-08 09:07:14', NULL, NULL, NULL),
(998, 6, 6, '/admin-attendance', '2018-02-08 09:07:14', NULL, NULL, NULL),
(999, 6, 6, '/admin-attendance', '2018-02-08 09:07:14', NULL, NULL, NULL),
(1000, 6, 6, '/admin-attendance', '2018-02-08 09:07:15', NULL, NULL, NULL),
(1001, 6, 6, '/admin-attendance', '2018-02-08 09:07:15', NULL, NULL, NULL),
(1002, 6, 6, '/admin-attendance', '2018-02-08 09:07:15', NULL, NULL, NULL),
(1003, 6, 6, '/admin-attendance', '2018-02-08 09:07:15', NULL, NULL, NULL),
(1004, 6, 6, '/admin-attendance', '2018-02-08 09:07:15', NULL, NULL, NULL),
(1005, 6, 6, '/admin-attendance', '2018-02-08 09:07:15', NULL, NULL, NULL),
(1006, 6, 6, '/admin-attendance', '2018-02-08 09:07:16', NULL, NULL, NULL),
(1007, 6, 6, '/admin-attendance', '2018-02-08 09:07:16', NULL, NULL, NULL),
(1008, 6, 6, '/admin-attendance', '2018-02-08 09:07:16', NULL, NULL, NULL),
(1009, 6, 6, '/admin-attendance', '2018-02-08 09:07:16', NULL, NULL, NULL),
(1010, 6, 6, '/admin-attendance', '2018-02-08 09:07:17', NULL, NULL, NULL),
(1011, 6, 6, '/shop', '2018-02-08 09:07:17', NULL, NULL, NULL),
(1012, 6, 6, '/shop-categories/2', '2018-02-08 09:07:19', NULL, NULL, NULL),
(1013, 6, 6, '/product/58', '2018-02-08 09:07:20', NULL, NULL, NULL),
(1014, 6, 6, '/shop', '2018-02-08 09:07:23', NULL, NULL, NULL),
(1015, 6, 6, '/cart', '2018-02-08 09:07:24', NULL, NULL, NULL),
(1016, 6, 6, '/cart', '2018-02-08 09:07:25', NULL, NULL, NULL),
(1017, 6, 6, '/cart', '2018-02-08 09:07:26', NULL, NULL, NULL),
(1018, 6, 6, '/cart', '2018-02-08 09:07:26', NULL, NULL, NULL),
(1019, 6, 6, '/cart', '2018-02-08 09:07:26', NULL, NULL, NULL),
(1020, 6, 6, '/cart', '2018-02-08 09:07:27', NULL, NULL, NULL),
(1021, 6, 6, '/cart', '2018-02-08 09:07:27', NULL, NULL, NULL),
(1022, 6, 6, '/cart', '2018-02-08 09:07:28', NULL, NULL, NULL),
(1023, 6, 6, '/cart', '2018-02-08 09:07:28', NULL, NULL, NULL),
(1024, 6, 6, '/cart', '2018-02-08 09:07:28', NULL, NULL, NULL),
(1025, 6, 6, '/cart', '2018-02-08 09:07:29', NULL, NULL, NULL),
(1026, 6, 6, '/cart', '2018-02-08 09:07:29', NULL, NULL, NULL),
(1027, 6, 6, '/cart', '2018-02-08 09:07:30', NULL, NULL, NULL),
(1028, 6, 6, '/cart', '2018-02-08 09:07:30', NULL, NULL, NULL),
(1029, 6, 6, '/cart', '2018-02-08 09:07:31', NULL, NULL, NULL),
(1030, 6, 6, '/cart', '2018-02-08 09:07:31', NULL, NULL, NULL),
(1031, 6, 6, '/cart', '2018-02-08 09:07:32', NULL, NULL, NULL),
(1032, 6, 6, '/cart', '2018-02-08 09:07:32', NULL, NULL, NULL),
(1033, 6, 6, '/cart', '2018-02-08 09:07:32', NULL, NULL, NULL),
(1034, 6, 6, '/cart', '2018-02-08 09:07:33', NULL, NULL, NULL),
(1035, 6, 6, '/cart', '2018-02-08 09:07:33', NULL, NULL, NULL),
(1036, 6, 6, '/cart', '2018-02-08 09:07:34', NULL, NULL, NULL),
(1037, 6, 6, '/cart', '2018-02-08 09:07:34', NULL, NULL, NULL),
(1038, 6, 6, '/cart', '2018-02-08 09:07:34', NULL, NULL, NULL),
(1039, 6, 6, '/cart', '2018-02-08 09:07:35', NULL, NULL, NULL),
(1040, 6, 6, '/cart', '2018-02-08 09:07:35', NULL, NULL, NULL),
(1041, 6, 6, '/cart', '2018-02-08 09:07:35', NULL, NULL, NULL),
(1042, 6, 6, '/cart', '2018-02-08 09:07:36', NULL, NULL, NULL),
(1043, 6, 6, '/cart', '2018-02-08 09:07:36', NULL, NULL, NULL),
(1044, 6, 6, '/cart', '2018-02-08 09:07:37', NULL, NULL, NULL),
(1045, 6, 6, '/cart', '2018-02-08 09:07:37', NULL, NULL, NULL),
(1046, 6, 6, '/cart', '2018-02-08 09:07:37', NULL, NULL, NULL),
(1047, 6, 6, '/cart', '2018-02-08 09:07:38', NULL, NULL, NULL),
(1048, 6, 6, '/cart', '2018-02-08 09:07:38', NULL, NULL, NULL),
(1049, 6, 6, '/cart', '2018-02-08 09:07:38', NULL, NULL, NULL),
(1050, 6, 6, '/cart', '2018-02-08 09:07:39', NULL, NULL, NULL),
(1051, 6, 6, '/cart', '2018-02-08 09:07:39', NULL, NULL, NULL),
(1052, 6, 6, '/cart', '2018-02-08 09:07:40', NULL, NULL, NULL),
(1053, 6, 6, '/cart', '2018-02-08 09:07:40', NULL, NULL, NULL),
(1054, 6, 6, '/cart', '2018-02-08 09:07:40', NULL, NULL, NULL),
(1055, 6, 6, '/cart', '2018-02-08 09:07:41', NULL, NULL, NULL),
(1056, 6, 6, '/cart', '2018-02-08 09:07:41', NULL, NULL, NULL),
(1057, 6, 6, '/cart', '2018-02-08 09:07:41', NULL, NULL, NULL),
(1058, 6, 6, '/cart', '2018-02-08 09:07:42', NULL, NULL, NULL),
(1059, 6, 6, '/cart', '2018-02-08 09:07:42', NULL, NULL, NULL),
(1060, 6, 6, '/cart', '2018-02-08 09:07:43', NULL, NULL, NULL),
(1061, 6, 6, '/cart', '2018-02-08 09:07:43', NULL, NULL, NULL),
(1062, 6, 6, '/cart', '2018-02-08 09:07:44', NULL, NULL, NULL),
(1063, 6, 6, '/cart', '2018-02-08 09:07:44', NULL, NULL, NULL),
(1064, 6, 6, '/cart', '2018-02-08 09:07:44', NULL, NULL, NULL),
(1065, 6, 6, '/cart', '2018-02-08 09:07:45', NULL, NULL, NULL),
(1066, 6, 6, '/admin-attendance', '2018-02-08 09:09:05', NULL, NULL, NULL),
(1067, 6, 6, '/admin-components', '2018-02-08 09:09:09', NULL, NULL, NULL),
(1068, 6, 6, '/admin-components', '2018-02-08 09:11:20', NULL, NULL, NULL),
(1069, 6, 6, '/admin-components', '2018-02-08 09:11:22', NULL, NULL, NULL),
(1070, 6, 6, '/admin-components', '2018-02-08 09:11:23', NULL, NULL, NULL),
(1071, 6, 6, '/admin-components', '2018-02-08 09:11:25', NULL, NULL, NULL),
(1072, 6, 6, '/admin-components', '2018-02-08 09:11:26', NULL, NULL, NULL),
(1073, 6, 6, '/admin-routes', '2018-02-08 09:11:27', NULL, NULL, NULL),
(1074, 6, 6, '/admin-routes', '2018-02-08 09:11:39', NULL, NULL, NULL),
(1075, 6, 6, '/admin-components', '2018-02-08 09:11:41', NULL, NULL, NULL),
(1076, 6, 6, '/admin-globals', '2018-02-08 09:11:53', NULL, NULL, NULL),
(1077, 6, 6, '/admin-globals', '2018-02-08 09:11:59', NULL, NULL, NULL),
(1078, 6, 6, '/shop', '2018-02-08 09:20:01', NULL, NULL, NULL),
(1079, 6, 6, '/shop-categories/2', '2018-02-08 09:20:02', NULL, NULL, NULL),
(1080, 6, 6, '/product/58', '2018-02-08 09:20:03', NULL, NULL, NULL),
(1081, 6, 6, '/product/58', '2018-02-08 09:20:05', NULL, NULL, NULL),
(1082, 6, 6, '/product/58', '2018-02-08 09:20:27', NULL, NULL, NULL),
(1083, 6, 6, '/cart', '2018-02-08 09:20:35', NULL, NULL, NULL),
(1084, 6, 6, '/product/58', '2018-02-08 09:23:18', NULL, NULL, NULL),
(1085, 6, 6, '/shop', '2018-02-08 09:23:22', NULL, NULL, NULL),
(1086, 6, 6, '/shop-categories/2', '2018-02-08 09:23:26', NULL, NULL, NULL),
(1087, 6, 6, '/admin', '2018-02-08 09:25:16', NULL, NULL, NULL),
(1088, 6, 6, '/admin-globals', '2018-02-08 09:25:17', NULL, NULL, NULL),
(1089, 6, 6, '/admin-components', '2018-02-08 09:25:17', NULL, NULL, NULL),
(1090, 6, 6, '/admin-attendance', '2018-02-08 09:27:19', NULL, NULL, NULL),
(1091, 6, 6, '/admin-attendance', '2018-02-08 09:27:32', NULL, NULL, NULL),
(1092, 6, 6, '/admin-attendance', '2018-02-08 09:27:39', NULL, NULL, NULL),
(1093, 6, 6, '/admin-attendance', '2018-02-08 09:28:08', NULL, NULL, NULL),
(1094, 6, 6, '/admin-attendance', '2018-02-08 09:28:10', NULL, NULL, NULL),
(1095, 6, 6, '/admin-attendance', '2018-02-08 09:35:40', NULL, NULL, NULL),
(1096, 6, 6, '/my', '2018-02-08 09:36:23', NULL, NULL, NULL),
(1097, 7, 7, '/', '2018-02-08 09:37:19', NULL, NULL, NULL),
(1098, 7, 7, '/', '2018-02-08 09:37:19', NULL, NULL, NULL),
(1099, 7, 7, '/login', '2018-02-08 09:37:21', NULL, NULL, NULL),
(1100, 7, 7, '/login', '2018-02-08 09:41:40', NULL, NULL, NULL),
(1101, 7, 7, '/', '2018-02-08 09:41:44', NULL, NULL, NULL),
(1102, 7, 7, '/', '2018-02-08 09:41:44', NULL, NULL, NULL),
(1103, 7, 7, '/my', '2018-02-08 09:41:45', NULL, NULL, NULL),
(1104, 7, 7, '/my-orders', '2018-02-08 09:43:35', NULL, NULL, NULL),
(1105, 7, 7, '/my-orders', '2018-02-08 09:49:00', NULL, NULL, NULL),
(1106, 7, 7, '/', '2018-02-08 10:28:18', NULL, NULL, NULL),
(1107, 7, 7, '/', '2018-02-08 10:28:18', NULL, NULL, NULL),
(1108, 7, 7, '/company', '2018-02-08 10:28:19', NULL, NULL, NULL),
(1109, 7, 7, '/company', '2018-02-08 10:28:19', NULL, NULL, NULL),
(1110, 7, 7, '/company', '2018-02-08 10:28:26', NULL, NULL, NULL),
(1111, 7, 7, '/company', '2018-02-08 10:28:27', NULL, NULL, NULL),
(1112, 7, 7, '/admin', '2018-02-08 10:28:28', NULL, NULL, NULL),
(1113, 7, 7, '/admin-routes', '2018-02-08 10:28:30', NULL, NULL, NULL),
(1114, 7, 7, '/admin-routes', '2018-02-08 10:28:42', NULL, NULL, NULL),
(1115, 7, 7, '/reviews', '2018-02-08 10:28:44', NULL, NULL, NULL),
(1116, 7, 7, '/reviews', '2018-02-08 10:28:45', NULL, NULL, NULL),
(1117, 7, 7, '/reviews', '2018-02-08 10:28:46', NULL, NULL, NULL),
(1118, 7, 7, '/reviews', '2018-02-08 10:28:48', NULL, NULL, NULL),
(1119, 7, 7, '/reviews', '2018-02-08 10:28:54', NULL, NULL, NULL),
(1120, 7, 7, '/reviews', '2018-02-08 10:28:56', NULL, NULL, NULL),
(1121, 7, 7, '/reviews', '2018-02-08 10:29:04', NULL, NULL, NULL),
(1122, 7, 7, '/reviews', '2018-02-08 10:29:05', NULL, NULL, NULL),
(1123, 7, 7, '/reviews', '2018-02-08 10:29:07', NULL, NULL, NULL),
(1124, 7, 7, '/reviews', '2018-02-08 10:29:08', NULL, NULL, NULL),
(1125, 7, 7, '/reviews', '2018-02-08 10:29:09', NULL, NULL, NULL),
(1126, 7, 7, '/reviews', '2018-02-08 10:29:14', NULL, NULL, NULL),
(1127, 7, 7, '/reviews', '2018-02-08 10:29:15', NULL, NULL, NULL),
(1128, 7, 7, '/reviews', '2018-02-08 10:29:16', NULL, NULL, NULL),
(1129, 7, 7, '/reviews', '2018-02-08 10:29:39', NULL, NULL, NULL),
(1130, 7, 7, '/reviews', '2018-02-08 10:29:42', NULL, NULL, NULL),
(1131, 7, 7, '/reviews', '2018-02-08 10:30:41', NULL, NULL, NULL),
(1132, 7, 7, '/reviews', '2018-02-08 10:31:03', NULL, NULL, NULL),
(1133, 7, 7, '/reviews', '2018-02-08 10:31:08', NULL, NULL, NULL),
(1134, 7, 7, '/reviews', '2018-02-08 10:31:25', NULL, NULL, NULL),
(1135, 7, 7, '/reviews', '2018-02-08 10:32:02', NULL, NULL, NULL),
(1136, 7, 7, '/reviews', '2018-02-08 10:32:17', NULL, NULL, NULL),
(1137, 7, 7, '/reviews', '2018-02-08 10:32:31', NULL, NULL, NULL),
(1138, 7, 7, '/reviews', '2018-02-08 10:32:55', NULL, NULL, NULL),
(1139, 7, 7, '/reviews', '2018-02-08 10:32:57', NULL, NULL, NULL),
(1140, 7, 7, '/reviews', '2018-02-08 10:33:08', NULL, NULL, NULL),
(1141, 7, 7, '/reviews', '2018-02-08 10:33:19', NULL, NULL, NULL),
(1142, 7, 7, '/reviews', '2018-02-08 10:33:53', NULL, NULL, NULL),
(1143, 7, 7, '/reviews', '2018-02-08 10:34:12', NULL, NULL, NULL),
(1144, 7, 7, '/reviews', '2018-02-08 10:34:47', NULL, NULL, NULL),
(1145, 8, 8, '/', '2018-02-08 10:35:19', NULL, NULL, NULL),
(1146, 8, 8, '/', '2018-02-08 10:35:19', NULL, NULL, NULL),
(1147, 8, 8, '/reviews', '2018-02-08 10:35:21', NULL, NULL, NULL),
(1148, 8, 8, '/reviews', '2018-02-08 10:36:01', NULL, NULL, NULL),
(1149, 8, 8, '/reviews', '2018-02-08 10:36:12', NULL, NULL, NULL),
(1150, 8, 8, '/reviews', '2018-02-08 10:39:26', NULL, NULL, NULL),
(1151, 8, 8, '/reviews', '2018-02-08 10:39:29', NULL, NULL, NULL),
(1152, 8, 8, '/reviews', '2018-02-08 10:39:38', NULL, NULL, NULL),
(1153, 8, 8, '/reviews', '2018-02-08 10:39:53', NULL, NULL, NULL),
(1154, 8, 8, '/reviews', '2018-02-08 10:40:02', NULL, NULL, NULL),
(1155, 8, 8, '/reviews', '2018-02-08 10:40:07', NULL, NULL, NULL),
(1156, 8, 8, '/login', '2018-02-08 10:40:08', NULL, NULL, NULL),
(1157, 8, 8, '/', '2018-02-08 10:40:15', NULL, NULL, NULL),
(1158, 8, 8, '/', '2018-02-08 10:40:15', NULL, NULL, NULL),
(1159, 8, 8, '/reviews', '2018-02-08 10:40:17', NULL, NULL, NULL),
(1160, 8, 8, '/reviews', '2018-02-08 10:42:06', NULL, NULL, NULL),
(1161, 8, 8, '/reviews', '2018-02-08 10:43:40', NULL, NULL, NULL),
(1162, 8, 8, '/reviews', '2018-02-08 10:44:04', NULL, NULL, NULL),
(1163, 8, 8, '/reviews', '2018-02-08 10:44:38', NULL, NULL, NULL),
(1164, 8, 8, '/reviews', '2018-02-08 10:44:42', NULL, NULL, NULL),
(1165, 8, 8, '/reviews', '2018-02-08 10:44:56', NULL, NULL, NULL),
(1166, 8, 8, '/reviews', '2018-02-08 10:45:03', NULL, NULL, NULL),
(1167, 8, 8, '/reviews', '2018-02-08 10:45:21', NULL, NULL, NULL),
(1168, 8, 8, '/reviews', '2018-02-08 10:45:30', NULL, NULL, NULL),
(1169, 8, 8, '/reviews', '2018-02-08 10:45:38', NULL, NULL, NULL),
(1170, 8, 8, '/reviews', '2018-02-08 10:45:48', NULL, NULL, NULL),
(1171, 8, 8, '/reviews', '2018-02-08 10:45:51', NULL, NULL, NULL),
(1172, 8, 8, '/reviews', '2018-02-08 10:45:52', NULL, NULL, NULL),
(1173, 8, 8, '/reviews', '2018-02-08 10:46:22', NULL, NULL, NULL),
(1174, 9, 9, '/', '2018-02-12 06:30:38', NULL, NULL, NULL),
(1175, 9, 9, '/', '2018-02-12 06:30:38', NULL, NULL, NULL),
(1176, 9, 9, '/company', '2018-02-12 06:30:41', NULL, NULL, NULL),
(1177, 9, 9, '/cemeteries', '2018-02-12 06:30:41', NULL, NULL, NULL),
(1178, 9, 9, '/company', '2018-02-12 06:35:28', NULL, NULL, NULL),
(1179, 9, 9, '/', '2018-02-12 06:35:29', NULL, NULL, NULL),
(1180, 9, 9, '/', '2018-02-12 06:35:29', NULL, NULL, NULL),
(1181, 9, 9, '/company', '2018-02-12 06:35:30', NULL, NULL, NULL),
(1182, 9, 9, '/cemeteries', '2018-02-12 06:35:30', NULL, NULL, NULL),
(1183, 9, 9, '/shop', '2018-02-12 06:35:31', NULL, NULL, NULL),
(1184, 9, 9, '/cart', '2018-02-12 06:35:34', NULL, NULL, NULL),
(1185, 9, 9, '/company', '2018-02-12 06:35:36', NULL, NULL, NULL),
(1186, 9, 9, '/company', '2018-02-12 06:35:38', NULL, NULL, NULL),
(1187, 9, 9, '/reviews', '2018-02-12 06:35:39', NULL, NULL, NULL),
(1188, 9, 9, '/login', '2018-02-12 06:35:45', NULL, NULL, NULL),
(1189, 9, 9, '/', '2018-02-12 06:35:56', NULL, NULL, NULL),
(1190, 9, 9, '/', '2018-02-12 06:35:56', NULL, NULL, NULL),
(1191, 9, 9, '/cemeteries', '2018-02-12 06:35:58', NULL, NULL, NULL),
(1192, 9, 9, '/company', '2018-02-12 06:35:58', NULL, NULL, NULL),
(1193, 9, 9, '/company', '2018-02-12 06:35:59', NULL, NULL, NULL),
(1194, 9, 9, '/company', '2018-02-12 06:36:02', NULL, NULL, NULL),
(1195, 9, 9, '/company', '2018-02-12 06:36:02', NULL, NULL, NULL),
(1196, 9, 9, '/company', '2018-02-12 06:36:04', NULL, NULL, NULL),
(1197, 9, 9, '/cemeteries', '2018-02-12 06:36:05', NULL, NULL, NULL),
(1198, 9, 9, '/cemeteries', '2018-02-12 06:36:06', NULL, NULL, NULL),
(1199, 9, 9, '/cemeteries', '2018-02-12 06:36:07', NULL, NULL, NULL),
(1200, 9, 9, '/cemeteries', '2018-02-12 06:36:10', NULL, NULL, NULL),
(1201, 9, 9, '/cemeteries', '2018-02-12 06:36:11', NULL, NULL, NULL),
(1202, 9, 9, '/cemeteries', '2018-02-12 06:36:12', NULL, NULL, NULL),
(1203, 9, 9, '/cemeteries', '2018-02-12 06:36:16', NULL, NULL, NULL),
(1204, 9, 9, '/company', '2018-02-12 06:36:17', NULL, NULL, NULL),
(1205, 9, 9, '/company', '2018-02-12 06:36:18', NULL, NULL, NULL),
(1206, 9, 9, '/company', '2018-02-12 06:36:19', NULL, NULL, NULL),
(1207, 9, 9, '/company', '2018-02-12 06:36:40', NULL, NULL, NULL),
(1208, 9, 9, '/company', '2018-02-12 06:36:42', NULL, NULL, NULL),
(1209, 9, 9, '/company', '2018-02-12 06:36:43', NULL, NULL, NULL),
(1210, 9, 9, '/company', '2018-02-12 06:36:46', NULL, NULL, NULL),
(1211, 9, 9, '/company', '2018-02-12 06:36:50', NULL, NULL, NULL),
(1212, 9, 9, '/company', '2018-02-12 06:36:55', NULL, NULL, NULL),
(1213, 9, 9, '/company', '2018-02-12 06:36:57', NULL, NULL, NULL),
(1214, 9, 9, '/company', '2018-02-12 06:36:59', NULL, NULL, NULL),
(1215, 9, 9, '/company', '2018-02-12 06:37:00', NULL, NULL, NULL),
(1216, 9, 9, '/company', '2018-02-12 06:37:10', NULL, NULL, NULL),
(1217, 9, 9, '/company', '2018-02-12 06:37:11', NULL, NULL, NULL),
(1218, 9, 9, '/company', '2018-02-12 06:37:12', NULL, NULL, NULL),
(1219, 9, 9, '/company', '2018-02-12 06:37:13', NULL, NULL, NULL),
(1220, 9, 9, '/company', '2018-02-12 06:37:14', NULL, NULL, NULL),
(1221, 9, 9, '/company', '2018-02-12 06:37:15', NULL, NULL, NULL),
(1222, 9, 9, '/company', '2018-02-12 06:37:26', NULL, NULL, NULL),
(1223, 9, 9, '/reviews', '2018-02-12 06:37:28', NULL, NULL, NULL),
(1224, 9, 9, '/reviews', '2018-02-12 06:37:31', NULL, NULL, NULL),
(1225, 9, 9, '/company', '2018-02-12 06:37:38', NULL, NULL, NULL),
(1226, 9, 9, '/cemeteries', '2018-02-12 06:37:39', NULL, NULL, NULL),
(1227, 9, 9, '/shop', '2018-02-12 06:37:40', NULL, NULL, NULL),
(1228, 9, 9, '/cemeteries', '2018-02-12 06:37:40', NULL, NULL, NULL),
(1229, 9, 9, '/company', '2018-02-12 06:37:41', NULL, NULL, NULL),
(1230, 9, 9, '/', '2018-02-12 06:37:41', NULL, NULL, NULL),
(1231, 9, 9, '/', '2018-02-12 06:37:41', NULL, NULL, NULL),
(1232, 9, 9, '/company', '2018-02-12 06:37:42', NULL, NULL, NULL),
(1233, 9, 9, '/cemeteries', '2018-02-12 06:37:42', NULL, NULL, NULL),
(1234, 9, 9, '/admin', '2018-02-12 06:37:43', NULL, NULL, NULL),
(1235, 9, 9, '/', '2018-02-12 06:37:45', NULL, NULL, NULL),
(1236, 9, 9, '/', '2018-02-12 06:37:45', NULL, NULL, NULL),
(1237, 9, 9, '/company', '2018-02-12 06:37:45', NULL, NULL, NULL),
(1238, 9, 9, '/cemeteries', '2018-02-12 06:37:46', NULL, NULL, NULL),
(1239, 9, 9, '/shop', '2018-02-12 06:37:47', NULL, NULL, NULL),
(1240, 9, 9, '/company', '2018-02-12 06:37:47', NULL, NULL, NULL),
(1241, 9, 9, '/company', '2018-02-12 06:42:19', NULL, NULL, NULL),
(1242, 9, 9, '/company', '2018-02-12 06:49:31', NULL, NULL, NULL),
(1243, 9, 9, '/company', '2018-02-12 06:49:32', NULL, NULL, NULL),
(1244, 9, 9, '/company', '2018-02-12 06:49:40', NULL, NULL, NULL),
(1245, 9, 9, '/company', '2018-02-12 06:49:41', NULL, NULL, NULL),
(1246, 9, 9, '/admin', '2018-02-12 06:49:43', NULL, NULL, NULL),
(1247, 9, 9, '/admin-routes', '2018-02-12 06:49:45', NULL, NULL, NULL),
(1248, 9, 9, '/admin-routes', '2018-02-12 06:50:04', NULL, NULL, NULL),
(1249, 9, 9, '/company', '2018-02-12 06:50:05', NULL, NULL, NULL),
(1250, 9, 9, '/questions', '2018-02-12 06:50:06', NULL, NULL, NULL),
(1251, 9, 9, '/questions', '2018-02-12 06:50:08', NULL, NULL, NULL),
(1252, 9, 9, '/questions', '2018-02-12 06:50:08', NULL, NULL, NULL),
(1253, 9, 9, '/questions', '2018-02-12 06:50:11', NULL, NULL, NULL),
(1254, 9, 9, '/questions', '2018-02-12 06:50:14', NULL, NULL, NULL),
(1255, 9, 9, '/questions', '2018-02-12 06:50:15', NULL, NULL, NULL),
(1256, 9, 9, '/questions', '2018-02-12 06:50:16', NULL, NULL, NULL),
(1257, 9, 9, '/questions', '2018-02-12 06:50:17', NULL, NULL, NULL),
(1258, 9, 9, '/questions', '2018-02-12 06:50:19', NULL, NULL, NULL),
(1259, 9, 9, '/questions', '2018-02-12 06:50:21', NULL, NULL, NULL),
(1260, 9, 9, '/questions', '2018-02-12 06:51:01', NULL, NULL, NULL),
(1261, 9, 9, '/questions', '2018-02-12 06:51:56', NULL, NULL, NULL),
(1262, 9, 9, '/questions', '2018-02-12 06:51:56', NULL, NULL, NULL),
(1263, 9, 9, '/questions', '2018-02-12 06:56:16', NULL, NULL, NULL),
(1264, 9, 9, '/questions', '2018-02-12 06:57:04', NULL, NULL, NULL),
(1265, 9, 9, '/questions', '2018-02-12 06:57:44', NULL, NULL, NULL),
(1266, 9, 9, '/questions', '2018-02-12 06:58:37', NULL, NULL, NULL),
(1267, 9, 9, '/questions', '2018-02-12 06:58:44', NULL, NULL, NULL),
(1268, 9, 9, '/admin-routes', '2018-02-12 07:00:02', NULL, NULL, NULL),
(1269, 9, 9, '/admin-routes', '2018-02-12 07:00:05', NULL, NULL, NULL),
(1270, 9, 9, '/questions', '2018-02-12 07:00:06', NULL, NULL, NULL),
(1271, 9, 9, '/questions', '2018-02-12 07:00:10', NULL, NULL, NULL),
(1272, 9, 9, '/questions', '2018-02-12 07:01:42', NULL, NULL, NULL),
(1273, 9, 9, '/questions', '2018-02-12 07:04:39', NULL, NULL, NULL),
(1274, 9, 9, '/shop', '2018-02-12 07:11:14', NULL, NULL, NULL),
(1275, 9, 9, '/shop-categories/2', '2018-02-12 07:11:17', NULL, NULL, NULL),
(1276, 9, 9, '/product/58', '2018-02-12 07:11:18', NULL, NULL, NULL),
(1277, 9, 9, '/cart', '2018-02-12 07:11:22', NULL, NULL, NULL),
(1278, 9, 9, '/cart', '2018-02-12 07:14:16', NULL, NULL, NULL),
(1279, 9, 9, '/order', '2018-02-12 07:14:18', NULL, NULL, NULL),
(1280, 9, 9, '/order', '2018-02-12 07:20:12', NULL, NULL, NULL),
(1281, 10, 10, '/', '2018-02-12 07:20:13', NULL, NULL, NULL),
(1282, 10, 10, '/', '2018-02-12 07:20:14', NULL, NULL, NULL),
(1283, 10, 10, '/order', '2018-02-12 07:20:15', NULL, NULL, NULL),
(1284, 10, 10, '/login', '2018-02-12 07:20:18', NULL, NULL, NULL),
(1285, 11, 11, '/cart', '2018-02-12 07:20:24', NULL, NULL, NULL),
(1286, 11, 11, '/order', '2018-02-12 07:20:27', NULL, NULL, NULL),
(1287, 10, 10, '/', '2018-02-12 07:28:39', NULL, NULL, NULL),
(1288, 10, 10, '/', '2018-02-12 07:28:39', NULL, NULL, NULL),
(1289, 10, 10, '/cart', '2018-02-12 07:28:41', NULL, NULL, NULL),
(1290, 10, 10, '/order', '2018-02-12 07:29:02', NULL, NULL, NULL),
(1291, 10, 10, '/order', '2018-02-12 07:29:12', NULL, NULL, NULL),
(1292, 10, 10, '/order', '2018-02-12 07:32:05', NULL, NULL, NULL),
(1293, 12, 12, '/order', '2018-02-12 07:33:31', NULL, NULL, NULL),
(1294, 12, 12, '/shop', '2018-02-12 07:33:35', NULL, NULL, NULL),
(1295, 12, 12, '/shop-categories/2', '2018-02-12 07:33:36', NULL, NULL, NULL),
(1296, 12, 12, '/product/58', '2018-02-12 07:33:37', NULL, NULL, NULL),
(1297, 12, 12, '/order', '2018-02-12 07:33:40', NULL, NULL, NULL),
(1298, 12, 12, '/cart', '2018-02-12 07:33:42', NULL, NULL, NULL),
(1299, 12, 12, '/order', '2018-02-12 07:33:44', NULL, NULL, NULL),
(1300, 10, 10, '/my', '2018-02-12 07:34:19', NULL, NULL, NULL),
(1301, 10, 10, '/my-orders', '2018-02-12 07:34:20', NULL, NULL, NULL),
(1302, 10, 10, '/my', '2018-02-12 07:34:25', NULL, NULL, NULL),
(1303, 10, 10, '/my', '2018-02-12 07:34:39', NULL, NULL, NULL),
(1304, 10, 10, '/my', '2018-02-12 07:34:43', NULL, NULL, NULL),
(1305, 10, 10, '/order', '2018-02-12 07:34:45', NULL, NULL, NULL),
(1306, 10, 10, '/order', '2018-02-12 07:35:05', NULL, NULL, NULL),
(1307, 10, 10, '/order', '2018-02-12 07:35:16', NULL, NULL, NULL),
(1308, 10, 10, '/order', '2018-02-12 07:37:57', NULL, NULL, NULL),
(1309, 10, 10, '/order', '2018-02-12 07:38:06', NULL, NULL, NULL),
(1310, 10, 10, '/order', '2018-02-12 07:38:17', NULL, NULL, NULL),
(1311, 10, 10, '/my', '2018-02-12 07:38:53', NULL, NULL, NULL),
(1312, 13, 13, '/', '2018-02-12 07:38:55', NULL, NULL, NULL),
(1313, 13, 13, '/', '2018-02-12 07:38:55', NULL, NULL, NULL),
(1314, 13, 13, '/login', '2018-02-12 07:38:57', NULL, NULL, NULL),
(1315, 13, 13, '/cemeteries', '2018-02-12 07:38:58', NULL, NULL, NULL),
(1316, 13, 13, '/login', '2018-02-12 07:38:59', NULL, NULL, NULL),
(1317, 13, 13, '/login', '2018-02-12 07:42:22', NULL, NULL, NULL),
(1318, 13, 13, '/login', '2018-02-12 07:43:31', NULL, NULL, NULL),
(1319, 13, 13, '/login', '2018-02-12 07:43:48', NULL, NULL, NULL),
(1320, 13, 13, '/login', '2018-02-12 07:44:06', NULL, NULL, NULL),
(1321, 13, 13, '/login', '2018-02-12 07:44:40', NULL, NULL, NULL),
(1322, 13, 13, '/login', '2018-02-12 07:49:41', NULL, NULL, NULL),
(1323, 13, 13, '/login', '2018-02-12 07:49:59', NULL, NULL, NULL),
(1324, 13, 13, '/login', '2018-02-12 07:51:57', NULL, NULL, NULL),
(1325, 13, 13, '/login', '2018-02-12 07:52:24', NULL, NULL, NULL),
(1326, 13, 13, '/login', '2018-02-12 07:53:34', NULL, NULL, NULL),
(1327, 13, 13, '/login', '2018-02-12 07:57:01', NULL, NULL, NULL),
(1328, 13, 13, '/login', '2018-02-12 09:19:15', NULL, NULL, NULL),
(1329, 13, 13, '/login', '2018-02-12 09:21:16', NULL, NULL, NULL),
(1330, 13, 13, '/login', '2018-02-12 09:22:41', NULL, NULL, NULL),
(1331, 13, 13, '/login', '2018-02-12 09:24:30', NULL, NULL, NULL),
(1332, 13, 13, '/login', '2018-02-12 09:25:32', NULL, NULL, NULL),
(1333, 13, 13, '/login', '2018-02-12 09:29:50', NULL, NULL, NULL),
(1334, 13, 13, '/login', '2018-02-12 09:30:28', NULL, NULL, NULL),
(1335, 13, 13, '/login', '2018-02-12 09:31:59', NULL, NULL, NULL),
(1336, 13, 13, '/login', '2018-02-12 09:32:50', NULL, NULL, NULL),
(1337, 13, 13, '/login', '2018-02-12 09:36:20', NULL, NULL, NULL),
(1338, 13, 13, '/login', '2018-02-12 09:37:44', NULL, NULL, NULL),
(1339, 13, 13, '/login', '2018-02-12 09:39:15', NULL, NULL, NULL),
(1340, 13, 13, '/login', '2018-02-12 09:46:38', NULL, NULL, NULL),
(1341, 13, 13, '/login', '2018-02-12 09:46:45', NULL, NULL, NULL),
(1342, 13, 13, '/login', '2018-02-12 09:47:11', NULL, NULL, NULL),
(1343, 13, 13, '/login', '2018-02-12 09:58:09', NULL, NULL, NULL),
(1344, 13, 13, '/login', '2018-02-12 10:01:50', NULL, NULL, NULL),
(1345, 13, 13, '/login', '2018-02-12 10:02:58', NULL, NULL, NULL),
(1346, 13, 13, '/login', '2018-02-12 10:04:10', NULL, NULL, NULL),
(1347, 13, 13, '/login', '2018-02-12 10:05:26', NULL, NULL, NULL),
(1348, 13, 13, '/login', '2018-02-12 10:05:52', NULL, NULL, NULL),
(1349, 13, 13, '/login', '2018-02-12 10:11:45', NULL, NULL, NULL),
(1350, 13, 13, '/login', '2018-02-12 10:11:54', NULL, NULL, NULL),
(1351, 13, 13, '/login', '2018-02-12 10:20:05', NULL, NULL, NULL),
(1352, 13, 13, '/login', '2018-02-12 10:20:07', NULL, NULL, NULL),
(1353, 13, 13, '/login', '2018-02-12 10:20:37', NULL, NULL, NULL),
(1354, 13, 13, '/', '2018-02-12 10:22:10', NULL, NULL, NULL),
(1355, 13, 13, '/', '2018-02-12 10:22:10', NULL, NULL, NULL),
(1356, 14, 14, '/', '2018-02-12 10:22:14', NULL, NULL, NULL),
(1357, 14, 14, '/', '2018-02-12 10:22:15', NULL, NULL, NULL),
(1358, 14, 14, '/login', '2018-02-12 10:22:36', NULL, NULL, NULL),
(1359, 14, 14, '/login', '2018-02-12 10:24:03', NULL, NULL, NULL),
(1360, 14, 14, '/login', '2018-02-12 10:49:40', NULL, NULL, NULL),
(1361, 14, 14, '/', '2018-02-12 10:49:51', NULL, NULL, NULL),
(1362, 14, 14, '/', '2018-02-12 10:49:52', NULL, NULL, NULL),
(1363, 14, 14, '/login', '2018-02-12 10:49:52', NULL, NULL, NULL),
(1364, 14, 14, '/', '2018-02-12 10:49:57', NULL, NULL, NULL),
(1365, 14, 14, '/', '2018-02-12 10:49:58', NULL, NULL, NULL),
(1366, 14, 14, '/admin', '2018-02-12 10:49:59', NULL, NULL, NULL),
(1367, 14, 14, '/admin-routes', '2018-02-12 10:50:00', NULL, NULL, NULL),
(1368, 14, 14, '/admin-routes', '2018-02-12 10:50:46', NULL, NULL, NULL),
(1369, 14, 14, '/admin-routes', '2018-02-12 10:50:59', NULL, NULL, NULL),
(1370, 14, 14, '/confirm-email/t=25daad3d9e60b45043a70c4ab7d3b1c6', '2018-02-12 10:51:03', NULL, NULL, NULL),
(1371, 14, 14, '/confirm-email/t=25daad3d9e60b45043a70c4ab7d3b1c6', '2018-02-12 10:51:52', NULL, NULL, NULL),
(1372, 14, 14, '/my', '2018-02-12 10:52:45', NULL, NULL, NULL),
(1373, 14, 14, '/admin-routes', '2018-02-12 10:52:47', NULL, NULL, NULL),
(1374, 14, 14, '/admin-routes', '2018-02-12 10:52:50', NULL, NULL, NULL),
(1375, 14, 14, '/login', '2018-02-12 10:55:23', NULL, NULL, NULL),
(1376, 15, 15, '/', '2018-02-12 10:58:01', NULL, NULL, NULL),
(1377, 15, 15, '/', '2018-02-12 10:58:02', NULL, NULL, NULL),
(1378, 15, 15, '/login', '2018-02-12 10:58:03', NULL, NULL, NULL),
(1379, 15, 15, '/login', '2018-02-12 11:02:32', NULL, NULL, NULL),
(1380, 15, 15, '/login', '2018-02-12 11:04:49', NULL, NULL, NULL),
(1381, 15, 15, '/login', '2018-02-12 11:06:03', NULL, NULL, NULL),
(1382, 15, 15, '/login', '2018-02-12 11:07:23', NULL, NULL, NULL),
(1383, 15, 15, '/', '2018-02-12 11:11:20', NULL, NULL, NULL),
(1384, 15, 15, '/', '2018-02-12 11:11:21', NULL, NULL, NULL),
(1385, 16, 16, '/', '2018-02-12 11:11:22', NULL, NULL, NULL),
(1386, 16, 16, '/', '2018-02-12 11:11:23', NULL, NULL, NULL),
(1387, 16, 16, '/', '2018-02-12 11:12:24', NULL, NULL, NULL),
(1388, 16, 16, '/', '2018-02-12 11:12:25', NULL, NULL, NULL),
(1389, 16, 16, '/', '2018-02-12 11:14:10', NULL, NULL, NULL),
(1390, 16, 16, '/', '2018-02-12 11:14:10', NULL, NULL, NULL),
(1391, 16, 16, '/login', '2018-02-12 11:26:14', NULL, NULL, NULL),
(1392, 16, 16, '/login', '2018-02-12 11:27:46', NULL, NULL, NULL),
(1393, 16, 16, '/', '2018-02-12 11:27:58', NULL, NULL, NULL),
(1394, 16, 16, '/', '2018-02-12 11:27:59', NULL, NULL, NULL),
(1395, 16, 16, '/my', '2018-02-12 11:28:00', NULL, NULL, NULL),
(1396, 16, 16, '/cart', '2018-02-12 11:28:03', NULL, NULL, NULL),
(1397, 16, 16, '/order', '2018-02-12 11:28:05', NULL, NULL, NULL),
(1398, 17, 17, '/', '2018-02-12 11:28:12', NULL, NULL, NULL),
(1399, 17, 17, '/', '2018-02-12 11:28:12', NULL, NULL, NULL),
(1400, 17, 17, '/', '2018-02-13 05:54:14', NULL, NULL, NULL),
(1401, 17, 17, '/', '2018-02-13 05:54:14', NULL, NULL, NULL),
(1402, 17, 17, '/shop', '2018-02-13 05:54:17', NULL, NULL, NULL),
(1403, 17, 17, '/shop-categories/2', '2018-02-13 05:54:19', NULL, NULL, NULL),
(1404, 17, 17, '/login', '2018-02-13 05:54:27', NULL, NULL, NULL),
(1405, 17, 17, '/', '2018-02-13 05:55:02', NULL, NULL, NULL),
(1406, 17, 17, '/', '2018-02-13 05:55:02', NULL, NULL, NULL),
(1407, 17, 17, '/my', '2018-02-13 05:55:05', NULL, NULL, NULL),
(1408, 17, 17, '/my-orders', '2018-02-13 05:55:17', NULL, NULL, NULL),
(1409, 17, 17, '/cart', '2018-02-13 05:55:22', NULL, NULL, NULL),
(1410, 17, 17, '/order', '2018-02-13 05:55:23', NULL, NULL, NULL),
(1411, 17, 17, '/order', '2018-02-13 05:55:33', NULL, NULL, NULL),
(1412, 17, 17, '/order-complete/33f496430c93a428bc30b183731bb288', '2018-02-13 05:55:39', NULL, NULL, NULL),
(1413, 17, 17, '/my-orders', '2018-02-13 05:55:40', NULL, NULL, NULL),
(1414, 17, 17, '/my', '2018-02-13 05:55:54', NULL, NULL, NULL),
(1415, 17, 17, '/my-orders', '2018-02-13 05:55:56', NULL, NULL, NULL),
(1416, 17, 17, '/my', '2018-02-13 05:56:02', NULL, NULL, NULL),
(1417, 17, 17, '/my', '2018-02-13 05:59:07', NULL, NULL, NULL),
(1418, 17, 17, '/my', '2018-02-13 05:59:19', NULL, NULL, NULL),
(1419, 17, 17, '/my', '2018-02-13 06:00:44', NULL, NULL, NULL),
(1420, 17, 17, '/my', '2018-02-13 06:00:45', NULL, NULL, NULL),
(1421, 17, 17, '/my', '2018-02-13 06:00:55', NULL, NULL, NULL),
(1422, 17, 17, '/my', '2018-02-13 06:09:49', NULL, NULL, NULL),
(1423, 17, 17, '/my', '2018-02-13 06:10:19', NULL, NULL, NULL),
(1424, 17, 17, '/my', '2018-02-13 06:10:29', NULL, NULL, NULL),
(1425, 17, 17, '/my', '2018-02-13 06:11:32', NULL, NULL, NULL),
(1426, 17, 17, '/my', '2018-02-13 06:13:40', NULL, NULL, NULL),
(1427, 17, 17, '/my', '2018-02-13 06:14:30', NULL, NULL, NULL),
(1428, 17, 17, '/my', '2018-02-13 06:15:30', NULL, NULL, NULL),
(1429, 17, 17, '/my', '2018-02-13 06:16:15', NULL, NULL, NULL),
(1430, 17, 17, '/my', '2018-02-13 06:17:47', NULL, NULL, NULL),
(1431, 17, 17, '/my', '2018-02-13 06:19:17', NULL, NULL, NULL),
(1432, 17, 17, '/my', '2018-02-13 06:21:33', NULL, NULL, NULL),
(1433, 17, 17, '/my', '2018-02-13 06:22:52', NULL, NULL, NULL),
(1434, 17, 17, '/my', '2018-02-13 06:23:06', NULL, NULL, NULL),
(1435, 17, 17, '/my', '2018-02-13 06:23:48', NULL, NULL, NULL),
(1436, 17, 17, '/my', '2018-02-13 06:23:57', NULL, NULL, NULL),
(1437, 17, 17, '/my', '2018-02-13 06:25:21', NULL, NULL, NULL),
(1438, 17, 17, '/my', '2018-02-13 06:29:48', NULL, NULL, NULL),
(1439, 17, 17, '/my', '2018-02-13 06:42:17', NULL, NULL, NULL),
(1440, 17, 17, '/my', '2018-02-13 06:42:20', NULL, NULL, NULL),
(1441, 17, 17, '/my', '2018-02-13 06:50:20', NULL, NULL, NULL),
(1442, 17, 17, '/my', '2018-02-13 06:59:07', NULL, NULL, NULL),
(1443, 17, 17, '/my', '2018-02-13 06:59:46', NULL, NULL, NULL),
(1444, 17, 17, '/my', '2018-02-13 06:59:49', NULL, NULL, NULL),
(1445, 17, 17, '/my', '2018-02-13 07:00:18', NULL, NULL, NULL),
(1446, 17, 17, '/my-orders', '2018-02-13 07:00:19', NULL, NULL, NULL),
(1447, 17, 17, '/my', '2018-02-13 07:00:44', NULL, NULL, NULL),
(1448, 17, 17, '/my', '2018-02-13 07:00:46', NULL, NULL, NULL),
(1449, 17, 17, '/my', '2018-02-13 07:00:48', NULL, NULL, NULL),
(1450, 17, 17, '/my', '2018-02-13 07:00:51', NULL, NULL, NULL),
(1451, 17, 17, '/my', '2018-02-13 07:04:12', NULL, NULL, NULL),
(1452, 17, 17, '/my-orders', '2018-02-13 07:04:13', NULL, NULL, NULL),
(1453, 17, 17, '/my', '2018-02-13 07:05:08', NULL, NULL, NULL),
(1454, 17, 17, '/my', '2018-02-13 07:06:00', NULL, NULL, NULL),
(1455, 17, 17, '/my', '2018-02-13 07:06:04', NULL, NULL, NULL),
(1456, 17, 17, '/my', '2018-02-13 07:06:08', NULL, NULL, NULL),
(1457, 17, 17, '/my', '2018-02-13 07:12:07', NULL, NULL, NULL),
(1458, 17, 17, '/my', '2018-02-13 07:12:10', NULL, NULL, NULL),
(1459, 17, 17, '/my', '2018-02-13 07:12:14', NULL, NULL, NULL),
(1460, 17, 17, '/my', '2018-02-13 07:13:26', NULL, NULL, NULL),
(1461, 17, 17, '/my-orders', '2018-02-13 07:15:57', NULL, NULL, NULL),
(1462, 17, 17, '/my', '2018-02-13 07:15:58', NULL, NULL, NULL),
(1463, 17, 17, '/my', '2018-02-13 07:19:02', NULL, NULL, NULL),
(1464, 17, 17, '/my', '2018-02-13 07:19:06', NULL, NULL, NULL),
(1465, 18, 18, '/', '2018-02-13 07:19:09', NULL, NULL, NULL),
(1466, 18, 18, '/', '2018-02-13 07:19:09', NULL, NULL, NULL),
(1467, 18, 18, '/login', '2018-02-13 07:19:10', NULL, NULL, NULL),
(1468, 18, 18, '/', '2018-02-13 07:19:18', NULL, NULL, NULL),
(1469, 18, 18, '/', '2018-02-13 07:19:18', NULL, NULL, NULL),
(1470, 18, 18, '/my', '2018-02-13 07:19:56', NULL, NULL, NULL),
(1471, 18, 18, '/my', '2018-02-13 07:20:47', NULL, NULL, NULL),
(1472, 18, 18, '/my', '2018-02-13 07:20:58', NULL, NULL, NULL),
(1473, 18, 18, '/my', '2018-02-13 07:22:04', NULL, NULL, NULL),
(1474, 18, 18, '/my', '2018-02-13 07:22:09', NULL, NULL, NULL),
(1475, 18, 18, '/my', '2018-02-13 07:22:11', NULL, NULL, NULL),
(1476, 18, 18, '/my', '2018-02-13 07:22:14', NULL, NULL, NULL),
(1477, 18, 18, '/my', '2018-02-13 07:25:30', NULL, NULL, NULL),
(1478, 18, 18, '/my', '2018-02-13 07:25:33', NULL, NULL, NULL),
(1479, 18, 18, '/my', '2018-02-13 07:25:41', NULL, NULL, NULL),
(1480, 18, 18, '/my', '2018-02-13 07:25:45', NULL, NULL, NULL);
INSERT INTO `views` (`id`, `visit_id`, `visitor_id`, `path`, `created`, `updated`, `activated`, `closed`) VALUES
(1481, 18, 18, '/my-orders', '2018-02-13 07:27:36', NULL, NULL, NULL),
(1482, 18, 18, '/my-orders', '2018-02-13 07:29:22', NULL, NULL, NULL),
(1483, 18, 18, '/my', '2018-02-13 07:29:24', NULL, NULL, NULL),
(1484, 18, 18, '/my-orders', '2018-02-13 07:29:25', NULL, NULL, NULL),
(1485, 19, 19, '/', '2018-02-13 07:33:50', NULL, NULL, NULL),
(1486, 19, 19, '/', '2018-02-13 07:33:50', NULL, NULL, NULL),
(1487, 19, 19, '/login', '2018-02-13 07:33:51', NULL, NULL, NULL),
(1488, 19, 19, '/', '2018-02-13 07:34:12', NULL, NULL, NULL),
(1489, 19, 19, '/', '2018-02-13 07:34:13', NULL, NULL, NULL),
(1490, 19, 19, '/my', '2018-02-13 07:34:14', NULL, NULL, NULL),
(1491, 19, 19, '/my', '2018-02-13 07:35:01', NULL, NULL, NULL),
(1492, 19, 19, '/my', '2018-02-13 07:35:02', NULL, NULL, NULL),
(1493, 19, 19, '/my', '2018-02-13 07:35:11', NULL, NULL, NULL),
(1494, 19, 19, '/my', '2018-02-13 07:35:16', NULL, NULL, NULL),
(1495, 19, 19, '/my', '2018-02-13 07:36:31', NULL, NULL, NULL),
(1496, 19, 19, '/my', '2018-02-13 07:37:47', NULL, NULL, NULL),
(1497, 19, 19, '/my', '2018-02-13 07:37:54', NULL, NULL, NULL),
(1498, 19, 19, '/my', '2018-02-13 07:39:52', NULL, NULL, NULL),
(1499, 19, 19, '/my', '2018-02-13 07:40:42', NULL, NULL, NULL),
(1500, 19, 19, '/my', '2018-02-13 07:41:17', NULL, NULL, NULL),
(1501, 19, 19, '/my', '2018-02-13 07:42:07', NULL, NULL, NULL),
(1502, 19, 19, '/my', '2018-02-13 07:42:08', NULL, NULL, NULL),
(1503, 19, 19, '/my', '2018-02-13 07:42:12', NULL, NULL, NULL),
(1504, 19, 19, '/my', '2018-02-13 07:43:04', NULL, NULL, NULL),
(1505, 19, 19, '/my', '2018-02-13 07:43:07', NULL, NULL, NULL),
(1506, 19, 19, '/my-orders', '2018-02-13 07:44:21', NULL, NULL, NULL),
(1507, 19, 19, '/my-orders', '2018-02-13 07:44:23', NULL, NULL, NULL),
(1508, 19, 19, '/my-orders', '2018-02-13 07:47:12', NULL, NULL, NULL),
(1509, 19, 19, '/my', '2018-02-13 07:51:12', NULL, NULL, NULL),
(1510, 19, 19, '/my-orders', '2018-02-13 07:51:13', NULL, NULL, NULL),
(1511, 19, 19, '/my-orders', '2018-02-13 07:51:23', NULL, NULL, NULL),
(1512, 19, 19, '/my-orders', '2018-02-13 07:51:27', NULL, NULL, NULL),
(1513, 19, 19, '/my-orders', '2018-02-13 07:51:32', NULL, NULL, NULL),
(1514, 19, 19, '/my-orders', '2018-02-13 07:51:34', NULL, NULL, NULL),
(1515, 19, 19, '/my-orders', '2018-02-13 07:51:34', NULL, NULL, NULL),
(1516, 19, 19, '/my-orders', '2018-02-13 07:51:35', NULL, NULL, NULL),
(1517, 19, 19, '/my-orders', '2018-02-13 07:51:36', NULL, NULL, NULL),
(1518, 19, 19, '/my-orders', '2018-02-13 07:51:56', NULL, NULL, NULL),
(1519, 19, 19, '/my-orders', '2018-02-13 07:51:57', NULL, NULL, NULL),
(1520, 19, 19, '/admin', '2018-02-13 07:52:54', NULL, NULL, NULL),
(1521, 19, 19, '/admin', '2018-02-13 07:52:57', NULL, NULL, NULL),
(1522, 19, 19, '/admin', '2018-02-13 07:53:07', NULL, NULL, NULL),
(1523, 19, 19, '/admin', '2018-02-13 07:53:09', NULL, NULL, NULL),
(1524, 19, 19, '/admin-routes', '2018-02-13 07:53:14', NULL, NULL, NULL),
(1525, 19, 19, '/admin-routes', '2018-02-13 07:53:28', NULL, NULL, NULL),
(1526, 19, 19, '/admin-routes', '2018-02-13 07:53:40', NULL, NULL, NULL),
(1527, 19, 19, '/admin-orders', '2018-02-13 07:53:43', NULL, NULL, NULL),
(1528, 19, 19, '/admin-orders', '2018-02-13 07:53:53', NULL, NULL, NULL),
(1529, 19, 19, '/admin-orders', '2018-02-13 07:53:55', NULL, NULL, NULL),
(1530, 19, 19, '/admin-orders', '2018-02-13 07:53:56', NULL, NULL, NULL),
(1531, 19, 19, '/admin-orders', '2018-02-13 07:53:59', NULL, NULL, NULL),
(1532, 19, 19, '/admin-orders', '2018-02-13 07:54:01', NULL, NULL, NULL),
(1533, 19, 19, '/admin-orders', '2018-02-13 07:54:02', NULL, NULL, NULL),
(1534, 19, 19, '/admin-orders', '2018-02-13 07:54:31', NULL, NULL, NULL),
(1535, 19, 19, '/admin-orders', '2018-02-13 07:54:35', NULL, NULL, NULL),
(1536, 19, 19, '/my', '2018-02-13 07:56:10', NULL, NULL, NULL),
(1537, 19, 19, '/my-orders', '2018-02-13 07:56:11', NULL, NULL, NULL),
(1538, 19, 19, '/my-orders', '2018-02-13 07:57:17', NULL, NULL, NULL),
(1539, 19, 19, '/my-orders', '2018-02-13 07:57:22', NULL, NULL, NULL),
(1540, 19, 19, '/admin', '2018-02-13 07:57:43', NULL, NULL, NULL),
(1541, 19, 19, '/admin-orders', '2018-02-13 07:57:44', NULL, NULL, NULL),
(1542, 19, 19, '/admin-orders', '2018-02-13 08:01:52', NULL, NULL, NULL),
(1543, 19, 19, '/admin-orders', '2018-02-13 08:02:20', NULL, NULL, NULL),
(1544, 19, 19, '/admin-orders', '2018-02-13 08:02:21', NULL, NULL, NULL),
(1545, 19, 19, '/admin-orders', '2018-02-13 08:02:22', NULL, NULL, NULL),
(1546, 19, 19, '/admin-orders', '2018-02-13 08:02:25', NULL, NULL, NULL),
(1547, 19, 19, '/admin-orders', '2018-02-13 08:02:26', NULL, NULL, NULL),
(1548, 19, 19, '/admin-orders', '2018-02-13 08:02:28', NULL, NULL, NULL),
(1549, 19, 19, '/admin-orders', '2018-02-13 08:02:30', NULL, NULL, NULL),
(1550, 19, 19, '/admin-orders', '2018-02-13 08:02:33', NULL, NULL, NULL),
(1551, 19, 19, '/admin-orders', '2018-02-13 08:03:50', NULL, NULL, NULL),
(1552, 19, 19, '/admin-orders', '2018-02-13 08:03:56', NULL, NULL, NULL),
(1553, 19, 19, '/my', '2018-02-13 08:10:04', NULL, NULL, NULL),
(1554, 19, 19, '/my-orders', '2018-02-13 08:10:06', NULL, NULL, NULL),
(1555, 19, 19, '/my-orders', '2018-02-13 08:11:30', NULL, NULL, NULL),
(1556, 19, 19, '/admin-orders', '2018-02-13 08:11:31', NULL, NULL, NULL),
(1557, 19, 19, '/admin-orders', '2018-02-13 08:11:43', NULL, NULL, NULL),
(1558, 19, 19, '/admin-orders', '2018-02-13 08:12:12', NULL, NULL, NULL),
(1559, 19, 19, '/admin-orders', '2018-02-13 08:12:21', NULL, NULL, NULL),
(1560, 19, 19, '/admin-orders', '2018-02-13 08:12:31', NULL, NULL, NULL),
(1561, 19, 19, '/admin-orders', '2018-02-13 08:12:45', NULL, NULL, NULL),
(1562, 19, 19, '/admin-orders', '2018-02-13 08:13:08', NULL, NULL, NULL),
(1563, 19, 19, '/admin-orders', '2018-02-13 08:13:17', NULL, NULL, NULL),
(1564, 19, 19, '/admin-orders', '2018-02-13 08:13:47', NULL, NULL, NULL),
(1565, 19, 19, '/admin-orders', '2018-02-13 08:14:59', NULL, NULL, NULL),
(1566, 19, 19, '/admin-orders', '2018-02-13 08:15:18', NULL, NULL, NULL),
(1567, 19, 19, '/admin-orders', '2018-02-13 08:15:27', NULL, NULL, NULL),
(1568, 19, 19, '/admin-orders', '2018-02-13 08:15:33', NULL, NULL, NULL),
(1569, 19, 19, '/admin-orders', '2018-02-13 08:15:45', NULL, NULL, NULL),
(1570, 19, 19, '/admin-orders', '2018-02-13 08:16:02', NULL, NULL, NULL),
(1571, 19, 19, '/admin-orders', '2018-02-13 08:16:16', NULL, NULL, NULL),
(1572, 19, 19, '/admin-orders', '2018-02-13 08:16:30', NULL, NULL, NULL),
(1573, 19, 19, '/admin-orders', '2018-02-13 08:16:52', NULL, NULL, NULL),
(1574, 19, 19, '/admin-orders', '2018-02-13 08:23:18', NULL, NULL, NULL),
(1575, 19, 19, '/admin-orders', '2018-02-13 08:24:47', NULL, NULL, NULL),
(1576, 19, 19, '/admin-orders', '2018-02-13 08:27:16', NULL, NULL, NULL),
(1577, 19, 19, '/admin-orders', '2018-02-13 08:27:31', NULL, NULL, NULL),
(1578, 19, 19, '/admin-orders', '2018-02-13 08:27:41', NULL, NULL, NULL),
(1579, 19, 19, '/admin-orders', '2018-02-13 08:28:35', NULL, NULL, NULL),
(1580, 19, 19, '/admin-orders', '2018-02-13 08:29:58', NULL, NULL, NULL),
(1581, 19, 19, '/admin-orders', '2018-02-13 08:31:16', NULL, NULL, NULL),
(1582, 19, 19, '/admin-orders', '2018-02-13 08:31:23', NULL, NULL, NULL),
(1583, 19, 19, '/admin-orders', '2018-02-13 08:32:28', NULL, NULL, NULL),
(1584, 19, 19, '/admin-orders', '2018-02-13 08:33:05', NULL, NULL, NULL),
(1585, 19, 19, '/admin-orders', '2018-02-13 08:33:44', NULL, NULL, NULL),
(1586, 19, 19, '/my', '2018-02-13 08:34:15', NULL, NULL, NULL),
(1587, 19, 19, '/my-orders', '2018-02-13 08:34:16', NULL, NULL, NULL),
(1588, 19, 19, '/admin-orders', '2018-02-13 08:34:36', NULL, NULL, NULL),
(1589, 19, 19, '/admin-routes', '2018-02-13 08:34:56', NULL, NULL, NULL),
(1590, 19, 19, '/admin-clients', '2018-02-13 08:35:00', NULL, NULL, NULL),
(1591, 19, 19, '/admin-routes', '2018-02-13 08:35:01', NULL, NULL, NULL),
(1592, 19, 19, '/admin-globals', '2018-02-13 08:35:10', NULL, NULL, NULL),
(1593, 19, 19, '/admin-components', '2018-02-13 08:35:11', NULL, NULL, NULL),
(1594, 19, 19, '/admin-attendance', '2018-02-13 08:35:12', NULL, NULL, NULL),
(1595, 19, 19, '/admin-clients', '2018-02-13 08:35:13', NULL, NULL, NULL),
(1596, 19, 19, '/admin-routes', '2018-02-13 08:35:14', NULL, NULL, NULL),
(1597, 19, 19, '/admin-clients', '2018-02-13 08:35:27', NULL, NULL, NULL),
(1598, 19, 19, '/admin-attendance', '2018-02-13 08:35:31', NULL, NULL, NULL),
(1599, 19, 19, '/admin-components', '2018-02-13 08:35:32', NULL, NULL, NULL),
(1600, 19, 19, '/admin-routes', '2018-02-13 08:35:41', NULL, NULL, NULL),
(1601, 19, 19, '/admin-orders', '2018-02-13 08:37:59', NULL, NULL, NULL),
(1602, 19, 19, '/admin-orders', '2018-02-13 08:40:14', NULL, NULL, NULL),
(1603, 19, 19, '/admin-orders', '2018-02-13 08:40:15', NULL, NULL, NULL),
(1604, 19, 19, '/my', '2018-02-13 08:40:45', NULL, NULL, NULL),
(1605, 19, 19, '/my-orders', '2018-02-13 08:40:46', NULL, NULL, NULL),
(1606, 19, 19, '/my-orders', '2018-02-13 08:40:51', NULL, NULL, NULL),
(1607, 19, 19, '/my-orders', '2018-02-13 08:41:17', NULL, NULL, NULL),
(1608, 19, 19, '/admin-orders', '2018-02-13 08:41:22', NULL, NULL, NULL),
(1609, 19, 19, '/admin-orders', '2018-02-13 08:41:37', NULL, NULL, NULL),
(1610, 19, 19, '/admin-orders', '2018-02-13 08:42:09', NULL, NULL, NULL),
(1611, 19, 19, '/admin-orders', '2018-02-13 08:43:16', NULL, NULL, NULL),
(1612, 19, 19, '/admin-orders', '2018-02-13 08:43:47', NULL, NULL, NULL),
(1613, 19, 19, '/admin-orders', '2018-02-13 08:44:00', NULL, NULL, NULL),
(1614, 19, 19, '/admin-routes', '2018-02-13 08:45:10', NULL, NULL, NULL),
(1615, 19, 19, '/admin-clients', '2018-02-13 08:45:17', NULL, NULL, NULL),
(1616, 19, 19, '/admin-attendance', '2018-02-13 08:45:18', NULL, NULL, NULL),
(1617, 19, 19, '/admin-components', '2018-02-13 08:45:19', NULL, NULL, NULL),
(1618, 19, 19, '/admin-globals', '2018-02-13 08:45:19', NULL, NULL, NULL),
(1619, 19, 19, '/admin-orders', '2018-02-13 08:45:20', NULL, NULL, NULL),
(1620, 19, 19, '/admin-globals', '2018-02-13 08:45:21', NULL, NULL, NULL),
(1621, 19, 19, '/admin-components', '2018-02-13 08:45:21', NULL, NULL, NULL),
(1622, 19, 19, '/admin-attendance', '2018-02-13 08:45:22', NULL, NULL, NULL),
(1623, 19, 19, '/admin-clients', '2018-02-13 08:45:22', NULL, NULL, NULL),
(1624, 19, 19, '/admin-routes', '2018-02-13 08:45:22', NULL, NULL, NULL),
(1625, 19, 19, '/my-orders', '2018-02-13 08:45:44', NULL, NULL, NULL),
(1626, 19, 19, '/admin', '2018-02-13 08:45:52', NULL, NULL, NULL),
(1627, 19, 19, '/admin-routes', '2018-02-13 08:45:56', NULL, NULL, NULL),
(1628, 19, 19, '/admin-orders', '2018-02-13 08:46:11', NULL, NULL, NULL),
(1629, 19, 19, '/admin-routes', '2018-02-13 08:46:33', NULL, NULL, NULL),
(1630, 19, 19, '/admin-orders', '2018-02-13 08:46:34', NULL, NULL, NULL),
(1631, 19, 19, '/admin-routes', '2018-02-13 08:46:35', NULL, NULL, NULL),
(1632, 19, 19, '/admin-routes', '2018-02-13 08:48:01', NULL, NULL, NULL),
(1633, 19, 19, '/admin-routes', '2018-02-13 08:48:07', NULL, NULL, NULL),
(1634, 19, 19, '/admin-orders', '2018-02-13 08:48:13', NULL, NULL, NULL),
(1635, 19, 19, '/admin-routes', '2018-02-13 08:48:14', NULL, NULL, NULL),
(1636, 19, 19, '/admin-orders', '2018-02-13 08:48:41', NULL, NULL, NULL),
(1637, 19, 19, '/admin-routes', '2018-02-13 08:49:17', NULL, NULL, NULL),
(1638, 19, 19, '/admin-routes', '2018-02-13 08:49:34', NULL, NULL, NULL),
(1639, 19, 19, '/admin-routes', '2018-02-13 08:49:44', NULL, NULL, NULL),
(1640, 19, 19, '/admin-routes', '2018-02-13 08:49:57', NULL, NULL, NULL),
(1641, 19, 19, '/admin-orders', '2018-02-13 08:50:54', NULL, NULL, NULL),
(1642, 19, 19, '/admin-order/1', '2018-02-13 08:50:56', NULL, NULL, NULL),
(1643, 19, 19, '/admin-orders', '2018-02-13 08:51:00', NULL, NULL, NULL),
(1644, 19, 19, '/admin-orders', '2018-02-13 08:53:00', NULL, NULL, NULL),
(1645, 19, 19, '/', '2018-02-13 08:53:04', NULL, NULL, NULL),
(1646, 19, 19, '/', '2018-02-13 08:53:05', NULL, NULL, NULL),
(1647, 19, 19, '/', '2018-02-13 08:53:08', NULL, NULL, NULL),
(1648, 19, 19, '/', '2018-02-13 08:53:08', NULL, NULL, NULL),
(1649, 19, 19, '/', '2018-02-13 08:53:37', NULL, NULL, NULL),
(1650, 19, 19, '/', '2018-02-13 08:53:37', NULL, NULL, NULL),
(1651, 19, 19, '/admin-orders', '2018-02-13 08:53:41', NULL, NULL, NULL),
(1652, 19, 19, '/admin-orders', '2018-02-13 08:54:17', NULL, NULL, NULL),
(1653, 19, 19, '/my', '2018-02-13 08:54:18', NULL, NULL, NULL),
(1654, 19, 19, '/my-orders', '2018-02-13 08:54:20', NULL, NULL, NULL),
(1655, 19, 19, '/admin-order/1', '2018-02-13 08:54:42', NULL, NULL, NULL),
(1656, 19, 19, '/admin-orders', '2018-02-13 08:56:29', NULL, NULL, NULL),
(1657, 19, 19, '/admin-order/1', '2018-02-13 08:56:31', NULL, NULL, NULL),
(1658, 19, 19, '/admin-orders', '2018-02-13 08:56:32', NULL, NULL, NULL),
(1659, 19, 19, '/admin-order/1', '2018-02-13 08:56:35', NULL, NULL, NULL),
(1660, 19, 19, '/admin-order/1', '2018-02-13 08:56:36', NULL, NULL, NULL),
(1661, 19, 19, '/admin-order/1', '2018-02-13 08:56:38', NULL, NULL, NULL),
(1662, 19, 19, '/admin-order/1', '2018-02-13 08:56:40', NULL, NULL, NULL),
(1663, 19, 19, '/admin-order/1', '2018-02-13 08:56:43', NULL, NULL, NULL),
(1664, 19, 19, '/admin-order/1', '2018-02-13 08:56:44', NULL, NULL, NULL),
(1665, 19, 19, '/admin-orders', '2018-02-13 08:56:45', NULL, NULL, NULL),
(1666, 19, 19, '/admin-orders', '2018-02-13 08:58:09', NULL, NULL, NULL),
(1667, 19, 19, '/admin-orders', '2018-02-13 09:00:19', NULL, NULL, NULL),
(1668, 19, 19, '/admin-orders', '2018-02-13 09:02:12', NULL, NULL, NULL),
(1669, 19, 19, '/admin-orders', '2018-02-13 09:02:13', NULL, NULL, NULL),
(1670, 19, 19, '/admin-orders', '2018-02-13 09:02:14', NULL, NULL, NULL),
(1671, 19, 19, '/admin-orders', '2018-02-13 09:02:17', NULL, NULL, NULL),
(1672, 19, 19, '/admin-orders', '2018-02-13 09:02:18', NULL, NULL, NULL),
(1673, 19, 19, '/admin-orders', '2018-02-13 09:04:35', NULL, NULL, NULL),
(1674, 19, 19, '/admin-orders', '2018-02-13 09:05:10', NULL, NULL, NULL),
(1675, 19, 19, '/admin-orders', '2018-02-13 09:06:23', NULL, NULL, NULL),
(1676, 19, 19, '/my', '2018-02-13 09:07:01', NULL, NULL, NULL),
(1677, 19, 19, '/my-orders', '2018-02-13 09:07:02', NULL, NULL, NULL),
(1678, 19, 19, '/my-orders', '2018-02-13 09:07:21', NULL, NULL, NULL),
(1679, 19, 19, '/my-orders', '2018-02-13 09:07:34', NULL, NULL, NULL),
(1680, 19, 19, '/admin', '2018-02-13 09:07:35', NULL, NULL, NULL),
(1681, 19, 19, '/admin-orders', '2018-02-13 09:07:38', NULL, NULL, NULL),
(1682, 19, 19, '/admin-orders', '2018-02-13 09:24:51', NULL, NULL, NULL),
(1683, 19, 19, '/admin-globals', '2018-02-13 09:25:16', NULL, NULL, NULL),
(1684, 19, 19, '/admin-orders', '2018-02-13 09:25:17', NULL, NULL, NULL),
(1685, 19, 19, '/admin-orders', '2018-02-13 09:25:35', NULL, NULL, NULL),
(1686, 19, 19, '/admin-orders', '2018-02-13 09:26:25', NULL, NULL, NULL),
(1687, 19, 19, '/admin-orders', '2018-02-13 09:26:48', NULL, NULL, NULL),
(1688, 19, 19, '/admin-orders', '2018-02-13 09:27:41', NULL, NULL, NULL),
(1689, 19, 19, '/my', '2018-02-13 09:28:43', NULL, NULL, NULL),
(1690, 19, 19, '/my-orders', '2018-02-13 09:28:44', NULL, NULL, NULL),
(1691, 19, 19, '/my-orders', '2018-02-13 09:29:37', NULL, NULL, NULL),
(1692, 19, 19, '/my-orders', '2018-02-13 09:29:49', NULL, NULL, NULL),
(1693, 19, 19, '/admin-orders', '2018-02-13 09:29:54', NULL, NULL, NULL),
(1694, 19, 19, '/admin-order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 09:29:56', NULL, NULL, NULL),
(1695, 19, 19, '/admin-order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 09:30:20', NULL, NULL, NULL),
(1696, 19, 19, '/admin-order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 09:30:22', NULL, NULL, NULL),
(1697, 19, 19, '/admin-order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 09:30:29', NULL, NULL, NULL),
(1698, 19, 19, '/admin-order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 09:30:30', NULL, NULL, NULL),
(1699, 19, 19, '/admin-order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 09:30:32', NULL, NULL, NULL),
(1700, 19, 19, '/admin-order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 09:31:19', NULL, NULL, NULL),
(1701, 19, 19, '/admin-order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 09:31:24', NULL, NULL, NULL),
(1702, 19, 19, '/admin-order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 09:31:27', NULL, NULL, NULL),
(1703, 19, 19, '/admin-order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 09:31:41', NULL, NULL, NULL),
(1704, 19, 19, '/admin-order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 09:32:39', NULL, NULL, NULL),
(1705, 19, 19, '/admin-order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 09:33:05', NULL, NULL, NULL),
(1706, 19, 19, '/shop', '2018-02-13 09:35:02', NULL, NULL, NULL),
(1707, 19, 19, '/shop-categories/2', '2018-02-13 09:35:04', NULL, NULL, NULL),
(1708, 19, 19, '/product/58', '2018-02-13 09:35:05', NULL, NULL, NULL),
(1709, 19, 19, '/cart', '2018-02-13 09:35:07', NULL, NULL, NULL),
(1710, 19, 19, '/order', '2018-02-13 09:35:09', NULL, NULL, NULL),
(1711, 19, 19, '/order-complete/74d42cbe3b17f14ca2161031399a22fe', '2018-02-13 09:36:09', NULL, NULL, NULL),
(1712, 19, 19, '/order-complete/74d42cbe3b17f14ca2161031399a22fe', '2018-02-13 09:38:15', NULL, NULL, NULL),
(1713, 19, 19, '/admin', '2018-02-13 09:38:17', NULL, NULL, NULL),
(1714, 19, 19, '/admin-orders', '2018-02-13 09:38:18', NULL, NULL, NULL),
(1715, 19, 19, '/admin-order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 09:38:24', NULL, NULL, NULL),
(1716, 19, 19, '/admin-orders', '2018-02-13 09:38:47', NULL, NULL, NULL),
(1717, 19, 19, '/admin-routes', '2018-02-13 09:38:53', NULL, NULL, NULL),
(1718, 19, 19, '/admin-routes', '2018-02-13 09:39:17', NULL, NULL, NULL),
(1719, 19, 19, '/order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 09:39:18', NULL, NULL, NULL),
(1720, 19, 19, '/order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 09:39:28', NULL, NULL, NULL),
(1721, 19, 19, '/admin-orders', '2018-02-13 09:42:29', NULL, NULL, NULL),
(1722, 19, 19, '/order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 09:42:31', NULL, NULL, NULL),
(1723, 19, 19, '/order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 09:43:27', NULL, NULL, NULL),
(1724, 19, 19, '/order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 09:44:12', NULL, NULL, NULL),
(1725, 19, 19, '/order/ae18735ee3c7d76660c271136dbc76f7', '2018-02-13 09:44:15', NULL, NULL, NULL),
(1726, 19, 19, '/order/f2344904636ea0b430eae9acf7b503dd', '2018-02-13 09:44:18', NULL, NULL, NULL),
(1727, 19, 19, '/order/f2344904636ea0b430eae9acf7b503dd', '2018-02-13 09:52:06', NULL, NULL, NULL),
(1728, 19, 19, '/order/f2344904636ea0b430eae9acf7b503dd', '2018-02-13 09:52:10', NULL, NULL, NULL),
(1729, 19, 19, '/order/f2344904636ea0b430eae9acf7b503dd', '2018-02-13 09:52:39', NULL, NULL, NULL),
(1730, 19, 19, '/order/f2344904636ea0b430eae9acf7b503dd', '2018-02-13 09:52:47', NULL, NULL, NULL),
(1731, 19, 19, '/order/f2344904636ea0b430eae9acf7b503dd', '2018-02-13 09:53:04', NULL, NULL, NULL),
(1732, 19, 19, '/order/f2344904636ea0b430eae9acf7b503dd', '2018-02-13 09:53:18', NULL, NULL, NULL),
(1733, 19, 19, '/order/f2344904636ea0b430eae9acf7b503dd', '2018-02-13 09:53:27', NULL, NULL, NULL),
(1734, 19, 19, '/admin-orders', '2018-02-13 09:54:58', NULL, NULL, NULL),
(1735, 19, 19, '/order/f2344904636ea0b430eae9acf7b503dd', '2018-02-13 09:55:50', NULL, NULL, NULL),
(1736, 19, 19, '/order/f2344904636ea0b430eae9acf7b503dd', '2018-02-13 09:56:23', NULL, NULL, NULL),
(1737, 19, 19, '/order/0aa202e517498eca83e3214f471297d1', '2018-02-13 09:56:46', NULL, NULL, NULL),
(1738, 19, 19, '/order/0aa202e517498eca83e3214f471297d1', '2018-02-13 10:05:38', NULL, NULL, NULL),
(1739, 19, 19, '/admin-orders', '2018-02-13 10:05:48', NULL, NULL, NULL),
(1740, 19, 19, '/order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 10:05:52', NULL, NULL, NULL),
(1741, 19, 19, '/order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 10:12:16', NULL, NULL, NULL),
(1742, 19, 19, '/order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 10:13:37', NULL, NULL, NULL),
(1743, 19, 19, '/order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 10:19:25', NULL, NULL, NULL),
(1744, 20, 20, '/', '2018-02-13 10:19:29', NULL, NULL, NULL),
(1745, 20, 20, '/', '2018-02-13 10:19:30', NULL, NULL, NULL),
(1746, 20, 20, '/order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 10:19:31', NULL, NULL, NULL),
(1747, 20, 20, '/login', '2018-02-13 10:19:33', NULL, NULL, NULL),
(1748, 20, 20, '/', '2018-02-13 10:19:37', NULL, NULL, NULL),
(1749, 20, 20, '/', '2018-02-13 10:19:37', NULL, NULL, NULL),
(1750, 20, 20, '/admin-orders', '2018-02-13 10:19:39', NULL, NULL, NULL),
(1751, 20, 20, '/order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 10:19:40', NULL, NULL, NULL),
(1752, 20, 20, '/admin-orders', '2018-02-13 10:24:17', NULL, NULL, NULL),
(1753, 20, 20, '/admin-routes', '2018-02-13 10:24:51', NULL, NULL, NULL),
(1754, 20, 20, '/admin-clients', '2018-02-13 10:29:07', NULL, NULL, NULL),
(1755, 20, 20, '/admin-attendance', '2018-02-13 10:29:07', NULL, NULL, NULL),
(1756, 20, 20, '/admin-routes', '2018-02-13 10:29:08', NULL, NULL, NULL),
(1757, 20, 20, '/admin-routes', '2018-02-13 10:29:09', NULL, NULL, NULL),
(1758, 20, 20, '/admin-clients', '2018-02-13 10:29:10', NULL, NULL, NULL),
(1759, 20, 20, '/admin-attendance', '2018-02-13 10:29:11', NULL, NULL, NULL),
(1760, 20, 20, '/admin-components', '2018-02-13 10:29:12', NULL, NULL, NULL),
(1761, 20, 20, '/admin-orders', '2018-02-13 10:29:14', NULL, NULL, NULL),
(1762, 20, 20, '/order/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 10:29:17', NULL, NULL, NULL),
(1763, 20, 20, '/admin-routes', '2018-02-13 10:33:06', NULL, NULL, NULL),
(1764, 20, 20, '/shop', '2018-02-13 10:38:40', NULL, NULL, NULL),
(1765, 20, 20, '/shop-categories/2', '2018-02-13 10:38:42', NULL, NULL, NULL),
(1766, 20, 20, '/shop', '2018-02-13 10:39:00', NULL, NULL, NULL),
(1767, 20, 20, '/shop-categories/2', '2018-02-13 10:39:01', NULL, NULL, NULL),
(1768, 20, 20, '/admin-routes', '2018-02-13 10:41:39', NULL, NULL, NULL),
(1769, 20, 20, '/admin-routes', '2018-02-13 10:41:42', NULL, NULL, NULL),
(1770, 20, 20, '/admin-routes', '2018-02-13 10:41:43', NULL, NULL, NULL),
(1771, 20, 20, '/admin-routes', '2018-02-13 10:41:45', NULL, NULL, NULL),
(1772, 20, 20, '/admin-routes', '2018-02-13 10:41:46', NULL, NULL, NULL),
(1773, 20, 20, '/admin-routes', '2018-02-13 10:41:47', NULL, NULL, NULL),
(1774, 20, 20, '/admin-routes', '2018-02-13 10:41:48', NULL, NULL, NULL),
(1775, 20, 20, '/admin-routes', '2018-02-13 10:41:49', NULL, NULL, NULL),
(1776, 20, 20, '/admin-routes', '2018-02-13 10:41:50', NULL, NULL, NULL),
(1777, 20, 20, '/admin-routes', '2018-02-13 10:41:51', NULL, NULL, NULL),
(1778, 20, 20, '/admin-routes', '2018-02-13 10:41:52', NULL, NULL, NULL),
(1779, 20, 20, '/admin-routes', '2018-02-13 10:41:53', NULL, NULL, NULL),
(1780, 20, 20, '/admin-routes', '2018-02-13 10:41:54', NULL, NULL, NULL),
(1781, 20, 20, '/admin-routes', '2018-02-13 10:41:55', NULL, NULL, NULL),
(1782, 20, 20, '/admin-routes', '2018-02-13 10:41:56', NULL, NULL, NULL),
(1783, 20, 20, '/admin-routes', '2018-02-13 10:41:58', NULL, NULL, NULL),
(1784, 20, 20, '/admin-routes', '2018-02-13 10:41:59', NULL, NULL, NULL),
(1785, 20, 20, '/admin-routes', '2018-02-13 10:42:00', NULL, NULL, NULL),
(1786, 20, 20, '/admin-routes', '2018-02-13 10:42:01', NULL, NULL, NULL),
(1787, 20, 20, '/admin-routes', '2018-02-13 10:42:02', NULL, NULL, NULL),
(1788, 20, 20, '/admin-routes', '2018-02-13 10:42:03', NULL, NULL, NULL),
(1789, 20, 20, '/admin-routes', '2018-02-13 10:42:04', NULL, NULL, NULL),
(1790, 20, 20, '/admin-routes', '2018-02-13 10:42:05', NULL, NULL, NULL),
(1791, 20, 20, '/admin-routes', '2018-02-13 10:42:06', NULL, NULL, NULL),
(1792, 20, 20, '/admin-routes', '2018-02-13 10:42:07', NULL, NULL, NULL),
(1793, 20, 20, '/admin-routes', '2018-02-13 10:42:09', NULL, NULL, NULL),
(1794, 20, 20, '/admin-routes', '2018-02-13 10:42:10', NULL, NULL, NULL),
(1795, 20, 20, '/admin-routes', '2018-02-13 10:42:11', NULL, NULL, NULL),
(1796, 20, 20, '/admin-routes', '2018-02-13 10:42:12', NULL, NULL, NULL),
(1797, 20, 20, '/admin-routes', '2018-02-13 10:42:12', NULL, NULL, NULL),
(1798, 20, 20, '/admin-routes', '2018-02-13 10:42:13', NULL, NULL, NULL),
(1799, 20, 20, '/admin-routes', '2018-02-13 10:42:14', NULL, NULL, NULL),
(1800, 20, 20, '/admin-routes', '2018-02-13 10:42:15', NULL, NULL, NULL),
(1801, 20, 20, '/admin-routes', '2018-02-13 10:42:16', NULL, NULL, NULL),
(1802, 20, 20, '/admin-routes', '2018-02-13 10:42:40', NULL, NULL, NULL),
(1803, 20, 20, '/admin-routes', '2018-02-13 10:42:41', NULL, NULL, NULL),
(1804, 20, 20, '/admin-routes', '2018-02-13 10:42:43', NULL, NULL, NULL),
(1805, 20, 20, '/admin-routes', '2018-02-13 10:42:44', NULL, NULL, NULL),
(1806, 20, 20, '/admin-routes', '2018-02-13 10:42:51', NULL, NULL, NULL),
(1807, 20, 20, '/admin-routes', '2018-02-13 10:42:53', NULL, NULL, NULL),
(1808, 20, 20, '/admin-routes', '2018-02-13 10:42:55', NULL, NULL, NULL),
(1809, 20, 20, '/admin-routes', '2018-02-13 10:42:56', NULL, NULL, NULL),
(1810, 20, 20, '/admin-routes', '2018-02-13 10:42:57', NULL, NULL, NULL),
(1811, 20, 20, '/admin-routes', '2018-02-13 10:42:58', NULL, NULL, NULL),
(1812, 20, 20, '/admin-routes', '2018-02-13 10:43:01', NULL, NULL, NULL),
(1813, 20, 20, '/admin-routes', '2018-02-13 10:43:02', NULL, NULL, NULL),
(1814, 20, 20, '/admin-routes', '2018-02-13 10:43:06', NULL, NULL, NULL),
(1815, 20, 20, '/shop', '2018-02-13 10:43:41', NULL, NULL, NULL),
(1816, 20, 20, '/shop-categories/2', '2018-02-13 10:43:42', NULL, NULL, NULL),
(1817, 20, 20, '/product/58', '2018-02-13 10:43:43', NULL, NULL, NULL),
(1818, 20, 20, '/cart', '2018-02-13 10:43:46', NULL, NULL, NULL),
(1819, 20, 20, '/admin-routes', '2018-02-13 10:43:59', NULL, NULL, NULL),
(1820, 20, 20, '/cart', '2018-02-13 10:44:51', NULL, NULL, NULL),
(1821, 20, 20, '/cart', '2018-02-13 10:44:55', NULL, NULL, NULL),
(1822, 20, 20, '/cart', '2018-02-13 10:44:56', NULL, NULL, NULL),
(1823, 20, 20, '/order', '2018-02-13 10:45:38', NULL, NULL, NULL),
(1824, 20, 20, '/order-complete/2632a6c185994900fdd8233294ba5132', '2018-02-13 10:45:44', NULL, NULL, NULL),
(1825, 20, 20, '/order-complete/2632a6c185994900fdd8233294ba5132', '2018-02-13 10:48:37', NULL, NULL, NULL),
(1826, 20, 20, '/', '2018-02-13 10:48:39', NULL, NULL, NULL),
(1827, 20, 20, '/', '2018-02-13 10:48:39', NULL, NULL, NULL),
(1828, 20, 20, '/admin', '2018-02-13 10:48:41', NULL, NULL, NULL),
(1829, 20, 20, '/admin-orders', '2018-02-13 10:48:42', NULL, NULL, NULL),
(1830, 20, 20, '/admin-routes', '2018-02-13 10:48:46', NULL, NULL, NULL),
(1831, 20, 20, '/admin-globals', '2018-02-13 10:49:00', NULL, NULL, NULL),
(1832, 20, 20, '/admin-components', '2018-02-13 10:49:01', NULL, NULL, NULL),
(1833, 20, 20, '/admin-orders', '2018-02-13 10:49:02', NULL, NULL, NULL),
(1834, 20, 20, '/order-page/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 10:49:08', NULL, NULL, NULL),
(1835, 20, 20, '/product/58', '2018-02-13 10:50:23', NULL, NULL, NULL),
(1836, 20, 20, '/cart', '2018-02-13 10:50:26', NULL, NULL, NULL),
(1837, 20, 20, '/cart', '2018-02-13 10:50:27', NULL, NULL, NULL),
(1838, 20, 20, '/cart', '2018-02-13 10:50:28', NULL, NULL, NULL),
(1839, 20, 20, '/cart', '2018-02-13 10:50:29', NULL, NULL, NULL),
(1840, 20, 20, '/cart', '2018-02-13 10:50:29', NULL, NULL, NULL),
(1841, 20, 20, '/cart', '2018-02-13 10:50:30', NULL, NULL, NULL),
(1842, 20, 20, '/cart', '2018-02-13 10:50:30', NULL, NULL, NULL),
(1843, 20, 20, '/cart', '2018-02-13 10:50:31', NULL, NULL, NULL),
(1844, 20, 20, '/order', '2018-02-13 10:50:32', NULL, NULL, NULL),
(1845, 20, 20, '/order-complete/477b364dc705ea28bc50c03755229e82', '2018-02-13 10:50:45', NULL, NULL, NULL),
(1846, 20, 20, '/cart', '2018-02-13 10:51:00', NULL, NULL, NULL),
(1847, 20, 20, '/shop', '2018-02-13 10:51:01', NULL, NULL, NULL),
(1848, 20, 20, '/shop-categories/2', '2018-02-13 10:51:02', NULL, NULL, NULL),
(1849, 20, 20, '/product/58', '2018-02-13 10:51:03', NULL, NULL, NULL),
(1850, 20, 20, '/cart', '2018-02-13 10:51:05', NULL, NULL, NULL),
(1851, 20, 20, '/order', '2018-02-13 10:51:06', NULL, NULL, NULL),
(1852, 20, 20, '/shop', '2018-02-13 10:51:46', NULL, NULL, NULL),
(1853, 20, 20, '/admin-routes', '2018-02-13 10:52:10', NULL, NULL, NULL),
(1854, 20, 20, '/admin-orders', '2018-02-13 10:52:24', NULL, NULL, NULL),
(1855, 20, 20, '/order-page/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 10:52:25', NULL, NULL, NULL),
(1856, 20, 20, '/my', '2018-02-13 10:54:40', NULL, NULL, NULL),
(1857, 20, 20, '/my-orders', '2018-02-13 10:54:40', NULL, NULL, NULL),
(1858, 20, 20, '/my-orders', '2018-02-13 11:02:19', NULL, NULL, NULL),
(1859, 20, 20, '/order-page/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 11:02:29', NULL, NULL, NULL),
(1860, 20, 20, '/cemeteries', '2018-02-13 11:03:17', NULL, NULL, NULL),
(1861, 20, 20, '/company', '2018-02-13 11:03:19', NULL, NULL, NULL),
(1862, 20, 20, '/', '2018-02-13 11:03:20', NULL, NULL, NULL),
(1863, 20, 20, '/', '2018-02-13 11:03:20', NULL, NULL, NULL),
(1864, 20, 20, '/company', '2018-02-13 11:03:21', NULL, NULL, NULL),
(1865, 20, 20, '/cemeteries', '2018-02-13 11:03:21', NULL, NULL, NULL),
(1866, 20, 20, '/admin', '2018-02-13 11:03:25', NULL, NULL, NULL),
(1867, 20, 20, '/admin-orders', '2018-02-13 11:03:26', NULL, NULL, NULL),
(1868, 20, 20, '/order-page/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 11:03:27', NULL, NULL, NULL),
(1869, 20, 20, '/admin-orders', '2018-02-13 11:05:18', NULL, NULL, NULL),
(1870, 20, 20, '/order-page/4548579cc811f270c87bb003d0c21405', '2018-02-13 11:05:21', NULL, NULL, NULL),
(1871, 20, 20, '/order-page/4548579cc811f270c87bb003d0c21405', '2018-02-13 11:08:53', NULL, NULL, NULL),
(1872, 20, 20, '/order-page/4548579cc811f270c87bb003d0c21405', '2018-02-13 11:08:57', NULL, NULL, NULL),
(1873, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:09:12', NULL, NULL, NULL),
(1874, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:09:19', NULL, NULL, NULL),
(1875, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:11:26', NULL, NULL, NULL),
(1876, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:12:50', NULL, NULL, NULL),
(1877, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:13:01', NULL, NULL, NULL),
(1878, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:13:02', NULL, NULL, NULL),
(1879, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:13:03', NULL, NULL, NULL),
(1880, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:13:12', NULL, NULL, NULL),
(1881, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:13:49', NULL, NULL, NULL),
(1882, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:13:56', NULL, NULL, NULL),
(1883, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:14:26', NULL, NULL, NULL),
(1884, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:14:28', NULL, NULL, NULL),
(1885, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:16:08', NULL, NULL, NULL),
(1886, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:16:11', NULL, NULL, NULL),
(1887, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:16:17', NULL, NULL, NULL),
(1888, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:16:31', NULL, NULL, NULL),
(1889, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:16:53', NULL, NULL, NULL),
(1890, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:17:42', NULL, NULL, NULL),
(1891, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:18:53', NULL, NULL, NULL),
(1892, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:20:29', NULL, NULL, NULL),
(1893, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:28:19', NULL, NULL, NULL),
(1894, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:28:38', NULL, NULL, NULL),
(1895, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:28:42', NULL, NULL, NULL),
(1896, 20, 20, '/admin-orders', '2018-02-13 11:31:04', NULL, NULL, NULL),
(1897, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:31:07', NULL, NULL, NULL),
(1898, 20, 20, '/order-page/477b364dc705ea28bc50c03755229e82', '2018-02-13 11:32:31', NULL, NULL, NULL),
(1899, 20, 20, '/admin-globals', '2018-02-13 11:32:35', NULL, NULL, NULL),
(1900, 20, 20, '/admin-orders', '2018-02-13 11:32:36', NULL, NULL, NULL),
(1901, 20, 20, '/order-page/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 11:32:43', NULL, NULL, NULL),
(1902, 20, 20, '/order-page/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 11:37:32', NULL, NULL, NULL),
(1903, 20, 20, '/order-page/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 11:37:41', NULL, NULL, NULL),
(1904, 20, 20, '/order-page/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 11:37:44', NULL, NULL, NULL),
(1905, 20, 20, '/order-page/b7f646fc3b9070d7aa74cd3df6bb774f', '2018-02-13 11:37:59', NULL, NULL, NULL),
(1906, 20, 20, '/admin-orders', '2018-02-13 11:38:00', NULL, NULL, NULL),
(1907, 20, 20, '/order-page/109aa1de3e468c45a33afa7b349805b8', '2018-02-13 11:38:02', NULL, NULL, NULL),
(1908, 20, 20, '/order-page/109aa1de3e468c45a33afa7b349805b8', '2018-02-13 11:38:03', NULL, NULL, NULL),
(1909, 20, 20, '/admin-orders', '2018-02-13 11:38:04', NULL, NULL, NULL),
(1910, 20, 20, '/order-page/109aa1de3e468c45a33afa7b349805b8', '2018-02-13 11:38:07', NULL, NULL, NULL),
(1911, 20, 20, '/order-page/0aa202e517498eca83e3214f471297d1', '2018-02-13 11:38:07', NULL, NULL, NULL),
(1912, 20, 20, '/order-page/109aa1de3e468c45a33afa7b349805b8', '2018-02-13 11:38:09', NULL, NULL, NULL),
(1913, 20, 20, '/order-page/0aa202e517498eca83e3214f471297d1', '2018-02-13 11:38:10', NULL, NULL, NULL),
(1914, 20, 20, '/admin-orders', '2018-02-13 11:38:25', NULL, NULL, NULL),
(1915, 20, 20, '/', '2018-02-14 05:44:02', NULL, NULL, NULL),
(1916, 20, 20, '/', '2018-02-14 05:44:02', NULL, NULL, NULL),
(1917, 20, 20, '/', '2018-02-14 05:46:17', NULL, NULL, NULL),
(1918, 20, 20, '/', '2018-02-14 05:46:27', NULL, NULL, NULL),
(1919, 20, 20, '/', '2018-02-14 05:46:27', NULL, NULL, NULL),
(1920, 20, 20, '/', '2018-02-14 05:51:11', NULL, NULL, NULL),
(1921, 20, 20, '/', '2018-02-14 05:51:11', NULL, NULL, NULL),
(1922, 20, 20, '/', '2018-02-14 05:51:20', NULL, NULL, NULL),
(1923, 20, 20, '/', '2018-02-14 05:51:20', NULL, NULL, NULL),
(1924, 20, 20, '/', '2018-02-14 05:51:33', NULL, NULL, NULL),
(1925, 20, 20, '/', '2018-02-14 05:51:33', NULL, NULL, NULL),
(1926, 20, 20, '/', '2018-02-14 05:51:48', NULL, NULL, NULL),
(1927, 20, 20, '/', '2018-02-14 05:51:48', NULL, NULL, NULL),
(1928, 20, 20, '/', '2018-02-14 05:54:20', NULL, NULL, NULL),
(1929, 20, 20, '/', '2018-02-14 05:54:22', NULL, NULL, NULL),
(1930, 20, 20, '/', '2018-02-14 05:54:26', NULL, NULL, NULL),
(1931, 20, 20, '/', '2018-02-14 05:54:34', NULL, NULL, NULL),
(1932, 20, 20, '/', '2018-02-14 05:54:34', NULL, NULL, NULL),
(1933, 20, 20, '/', '2018-02-14 06:01:19', NULL, NULL, NULL),
(1934, 20, 20, '/', '2018-02-14 06:01:20', NULL, NULL, NULL),
(1935, 20, 20, '/', '2018-02-14 06:01:48', NULL, NULL, NULL),
(1936, 20, 20, '/', '2018-02-14 06:02:04', NULL, NULL, NULL),
(1937, 20, 20, '/', '2018-02-14 06:02:04', NULL, NULL, NULL),
(1938, 20, 20, '/', '2018-02-14 06:02:42', NULL, NULL, NULL),
(1939, 20, 20, '/', '2018-02-14 06:02:43', NULL, NULL, NULL),
(1940, 20, 20, '/', '2018-02-14 06:02:47', NULL, NULL, NULL),
(1941, 20, 20, '/', '2018-02-14 06:02:48', NULL, NULL, NULL),
(1942, 20, 20, '/', '2018-02-14 06:02:50', NULL, NULL, NULL),
(1943, 20, 20, '/', '2018-02-14 06:02:50', NULL, NULL, NULL),
(1944, 20, 20, '/', '2018-02-14 06:02:55', NULL, NULL, NULL),
(1945, 20, 20, '/', '2018-02-14 06:02:56', NULL, NULL, NULL),
(1946, 20, 20, '/', '2018-02-14 06:03:02', NULL, NULL, NULL),
(1947, 20, 20, '/', '2018-02-14 06:03:03', NULL, NULL, NULL),
(1948, 20, 20, '/', '2018-02-14 06:05:41', NULL, NULL, NULL),
(1949, 20, 20, '/', '2018-02-14 06:05:42', NULL, NULL, NULL),
(1950, 20, 20, '/', '2018-02-14 06:05:49', NULL, NULL, NULL),
(1951, 20, 20, '/', '2018-02-14 06:05:49', NULL, NULL, NULL),
(1952, 20, 20, '/', '2018-02-14 06:05:58', NULL, NULL, NULL),
(1953, 20, 20, '/', '2018-02-14 06:05:58', NULL, NULL, NULL),
(1954, 20, 20, '/', '2018-02-14 06:08:45', NULL, NULL, NULL),
(1955, 20, 20, '/', '2018-02-14 06:08:45', NULL, NULL, NULL),
(1956, 20, 20, '/', '2018-02-14 06:08:47', NULL, NULL, NULL),
(1957, 20, 20, '/', '2018-02-14 06:08:47', NULL, NULL, NULL),
(1958, 20, 20, '/', '2018-02-14 06:10:47', NULL, NULL, NULL),
(1959, 20, 20, '/', '2018-02-14 06:10:47', NULL, NULL, NULL),
(1960, 20, 20, '/', '2018-02-14 06:10:49', NULL, NULL, NULL),
(1961, 20, 20, '/', '2018-02-14 06:10:49', NULL, NULL, NULL),
(1962, 20, 20, '/', '2018-02-14 06:11:07', NULL, NULL, NULL),
(1963, 20, 20, '/', '2018-02-14 06:11:07', NULL, NULL, NULL),
(1964, 20, 20, '/', '2018-02-14 06:11:12', NULL, NULL, NULL),
(1965, 20, 20, '/', '2018-02-14 06:11:12', NULL, NULL, NULL),
(1966, 20, 20, '/cart', '2018-02-14 06:11:38', NULL, NULL, NULL),
(1967, 20, 20, '/', '2018-02-14 06:11:39', NULL, NULL, NULL),
(1968, 20, 20, '/', '2018-02-14 06:11:39', NULL, NULL, NULL),
(1969, 20, 20, '/', '2018-02-14 06:11:41', NULL, NULL, NULL),
(1970, 20, 20, '/', '2018-02-14 06:11:42', NULL, NULL, NULL),
(1971, 20, 20, '/', '2018-02-14 06:11:51', NULL, NULL, NULL),
(1972, 20, 20, '/', '2018-02-14 06:11:51', NULL, NULL, NULL),
(1973, 20, 20, '/', '2018-02-14 06:11:53', NULL, NULL, NULL),
(1974, 20, 20, '/', '2018-02-14 06:11:53', NULL, NULL, NULL),
(1975, 20, 20, '/', '2018-02-14 06:12:01', NULL, NULL, NULL),
(1976, 20, 20, '/', '2018-02-14 06:12:01', NULL, NULL, NULL),
(1977, 20, 20, '/', '2018-02-14 06:22:10', NULL, NULL, NULL),
(1978, 20, 20, '/', '2018-02-14 06:22:10', NULL, NULL, NULL),
(1979, 20, 20, '/admin', '2018-02-14 06:22:15', NULL, NULL, NULL),
(1980, 20, 20, '/admin', '2018-02-14 06:22:19', NULL, NULL, NULL),
(1981, 20, 20, '/admin-globals', '2018-02-14 06:22:22', NULL, NULL, NULL),
(1982, 20, 20, '/', '2018-02-14 06:25:50', NULL, NULL, NULL),
(1983, 20, 20, '/', '2018-02-14 06:25:51', NULL, NULL, NULL),
(1984, 20, 20, '/', '2018-02-14 06:25:53', NULL, NULL, NULL),
(1985, 20, 20, '/', '2018-02-14 06:25:53', NULL, NULL, NULL),
(1986, 20, 20, '/', '2018-02-14 06:26:06', NULL, NULL, NULL),
(1987, 20, 20, '/', '2018-02-14 06:26:06', NULL, NULL, NULL),
(1988, 20, 20, '/', '2018-02-14 06:26:22', NULL, NULL, NULL),
(1989, 20, 20, '/', '2018-02-14 06:26:22', NULL, NULL, NULL),
(1990, 20, 20, '/', '2018-02-14 06:26:23', NULL, NULL, NULL),
(1991, 20, 20, '/', '2018-02-14 06:26:23', NULL, NULL, NULL),
(1992, 20, 20, '/', '2018-02-14 06:26:25', NULL, NULL, NULL),
(1993, 20, 20, '/', '2018-02-14 06:26:25', NULL, NULL, NULL),
(1994, 20, 20, '/', '2018-02-14 06:27:55', NULL, NULL, NULL),
(1995, 20, 20, '/', '2018-02-14 06:27:56', NULL, NULL, NULL),
(1996, 20, 20, '/', '2018-02-14 06:27:57', NULL, NULL, NULL),
(1997, 20, 20, '/', '2018-02-14 06:27:57', NULL, NULL, NULL),
(1998, 20, 20, '/', '2018-02-14 06:28:48', NULL, NULL, NULL),
(1999, 20, 20, '/', '2018-02-14 06:28:48', NULL, NULL, NULL),
(2000, 20, 20, '/', '2018-02-14 06:32:49', NULL, NULL, NULL),
(2001, 20, 20, '/', '2018-02-14 06:32:49', NULL, NULL, NULL),
(2002, 20, 20, '/', '2018-02-14 06:34:52', NULL, NULL, NULL),
(2003, 20, 20, '/', '2018-02-14 06:34:53', NULL, NULL, NULL),
(2004, 20, 20, '/', '2018-02-14 06:35:20', NULL, NULL, NULL),
(2005, 20, 20, '/', '2018-02-14 06:35:20', NULL, NULL, NULL),
(2006, 20, 20, '/', '2018-02-14 06:35:22', NULL, NULL, NULL),
(2007, 20, 20, '/', '2018-02-14 06:35:22', NULL, NULL, NULL),
(2008, 20, 20, '/', '2018-02-14 06:38:11', NULL, NULL, NULL),
(2009, 20, 20, '/', '2018-02-14 06:38:11', NULL, NULL, NULL),
(2010, 20, 20, '/', '2018-02-14 06:38:23', NULL, NULL, NULL),
(2011, 20, 20, '/', '2018-02-14 06:38:23', NULL, NULL, NULL),
(2012, 20, 20, '/', '2018-02-14 06:38:28', NULL, NULL, NULL),
(2013, 20, 20, '/', '2018-02-14 06:38:28', NULL, NULL, NULL),
(2014, 20, 20, '/', '2018-02-14 06:38:31', NULL, NULL, NULL),
(2015, 20, 20, '/', '2018-02-14 06:38:32', NULL, NULL, NULL),
(2016, 20, 20, '/', '2018-02-14 06:38:59', NULL, NULL, NULL),
(2017, 20, 20, '/', '2018-02-14 06:38:59', NULL, NULL, NULL),
(2018, 20, 20, '/', '2018-02-14 06:39:02', NULL, NULL, NULL),
(2019, 20, 20, '/', '2018-02-14 06:39:02', NULL, NULL, NULL),
(2020, 20, 20, '/', '2018-02-14 06:39:09', NULL, NULL, NULL),
(2021, 20, 20, '/', '2018-02-14 06:39:09', NULL, NULL, NULL),
(2022, 20, 20, '/', '2018-02-14 06:39:13', NULL, NULL, NULL),
(2023, 20, 20, '/', '2018-02-14 06:39:14', NULL, NULL, NULL),
(2024, 20, 20, '/', '2018-02-14 06:39:20', NULL, NULL, NULL),
(2025, 20, 20, '/', '2018-02-14 06:39:20', NULL, NULL, NULL),
(2026, 20, 20, '/', '2018-02-14 06:41:12', NULL, NULL, NULL),
(2027, 20, 20, '/', '2018-02-14 06:41:13', NULL, NULL, NULL),
(2028, 20, 20, '/', '2018-02-14 06:41:17', NULL, NULL, NULL),
(2029, 20, 20, '/', '2018-02-14 06:41:17', NULL, NULL, NULL),
(2030, 20, 20, '/', '2018-02-14 06:41:24', NULL, NULL, NULL),
(2031, 20, 20, '/', '2018-02-14 06:41:24', NULL, NULL, NULL),
(2032, 20, 20, '/', '2018-02-14 06:42:38', NULL, NULL, NULL),
(2033, 20, 20, '/', '2018-02-14 06:42:39', NULL, NULL, NULL),
(2034, 20, 20, '/', '2018-02-14 06:42:41', NULL, NULL, NULL),
(2035, 20, 20, '/', '2018-02-14 06:42:41', NULL, NULL, NULL),
(2036, 20, 20, '/', '2018-02-14 06:42:45', NULL, NULL, NULL),
(2037, 20, 20, '/', '2018-02-14 06:42:46', NULL, NULL, NULL),
(2038, 20, 20, '/', '2018-02-14 06:42:50', NULL, NULL, NULL),
(2039, 20, 20, '/', '2018-02-14 06:42:50', NULL, NULL, NULL),
(2040, 20, 20, '/', '2018-02-14 06:42:54', NULL, NULL, NULL),
(2041, 20, 20, '/', '2018-02-14 06:42:54', NULL, NULL, NULL),
(2042, 20, 20, '/', '2018-02-14 06:42:58', NULL, NULL, NULL),
(2043, 20, 20, '/', '2018-02-14 06:42:58', NULL, NULL, NULL),
(2044, 20, 20, '/', '2018-02-14 06:42:59', NULL, NULL, NULL),
(2045, 20, 20, '/', '2018-02-14 06:43:00', NULL, NULL, NULL),
(2046, 20, 20, '/', '2018-02-14 06:43:10', NULL, NULL, NULL),
(2047, 20, 20, '/', '2018-02-14 06:43:10', NULL, NULL, NULL),
(2048, 20, 20, '/', '2018-02-14 06:43:21', NULL, NULL, NULL),
(2049, 20, 20, '/', '2018-02-14 06:43:21', NULL, NULL, NULL),
(2050, 20, 20, '/', '2018-02-14 06:45:01', NULL, NULL, NULL),
(2051, 20, 20, '/', '2018-02-14 06:45:02', NULL, NULL, NULL),
(2052, 20, 20, '/', '2018-02-14 06:45:04', NULL, NULL, NULL),
(2053, 20, 20, '/', '2018-02-14 06:45:19', NULL, NULL, NULL),
(2054, 20, 20, '/', '2018-02-14 06:45:21', NULL, NULL, NULL),
(2055, 20, 20, '/admin-globals', '2018-02-14 06:46:08', NULL, NULL, NULL),
(2056, 20, 20, '/admin-globals', '2018-02-14 06:46:12', NULL, NULL, NULL),
(2057, 20, 20, '/admin-globals', '2018-02-14 06:46:21', NULL, NULL, NULL),
(2058, 20, 20, '/admin-globals', '2018-02-14 06:46:35', NULL, NULL, NULL),
(2059, 20, 20, '/admin-globals', '2018-02-14 06:46:42', NULL, NULL, NULL),
(2060, 20, 20, '/admin-globals', '2018-02-14 06:47:30', NULL, NULL, NULL),
(2061, 20, 20, '/admin', '2018-02-14 06:50:36', NULL, NULL, NULL),
(2062, 20, 20, '/admin', '2018-02-14 06:50:40', NULL, NULL, NULL),
(2063, 20, 20, '/admin', '2018-02-14 06:50:42', NULL, NULL, NULL),
(2064, 20, 20, '/admin-globals', '2018-02-14 06:50:42', NULL, NULL, NULL),
(2065, 20, 20, '/admin-globals', '2018-02-14 06:54:36', NULL, NULL, NULL),
(2066, 20, 20, '/', '2018-02-14 06:56:58', NULL, NULL, NULL),
(2067, 20, 20, '/order-complete/f2344904636ea0b430eae9acf7b503dd', '2018-02-14 06:57:07', NULL, NULL, NULL),
(2068, 20, 20, '/order-complete/f2344904636ea0b430eae9acf7b503dd', '2018-02-14 07:03:00', NULL, NULL, NULL),
(2069, 20, 20, '/order-complete/37adc1a6bc2f26aca71bf6bc7c88c76a', '2018-02-14 07:03:03', NULL, NULL, NULL),
(2070, 20, 20, '/order-complete/2632a6c185994900fdd8233294ba5132', '2018-02-14 07:03:07', NULL, NULL, NULL),
(2071, 20, 20, '/admin-globals', '2018-02-14 07:09:12', NULL, NULL, NULL),
(2072, 20, 20, '/', '2018-02-14 07:09:16', NULL, NULL, NULL),
(2073, 20, 20, '/company', '2018-02-14 07:09:18', NULL, NULL, NULL),
(2074, 20, 20, '/cemeteries', '2018-02-14 07:09:19', NULL, NULL, NULL),
(2075, 20, 20, '/shop', '2018-02-14 07:09:21', NULL, NULL, NULL),
(2076, 20, 20, '/cart', '2018-02-14 07:09:23', NULL, NULL, NULL),
(2077, 20, 20, '/cart', '2018-02-14 07:09:24', NULL, NULL, NULL),
(2078, 20, 20, '/cart', '2018-02-14 07:09:24', NULL, NULL, NULL),
(2079, 20, 20, '/cart', '2018-02-14 07:09:25', NULL, NULL, NULL),
(2080, 20, 20, '/cart', '2018-02-14 07:09:25', NULL, NULL, NULL),
(2081, 20, 20, '/cart', '2018-02-14 07:09:26', NULL, NULL, NULL),
(2082, 20, 20, '/cart', '2018-02-14 07:09:26', NULL, NULL, NULL),
(2083, 20, 20, '/cart', '2018-02-14 07:09:27', NULL, NULL, NULL),
(2084, 20, 20, '/cart', '2018-02-14 07:09:27', NULL, NULL, NULL),
(2085, 20, 20, '/cart', '2018-02-14 07:09:27', NULL, NULL, NULL),
(2086, 20, 20, '/cart', '2018-02-14 07:09:28', NULL, NULL, NULL),
(2087, 20, 20, '/cart', '2018-02-14 07:09:28', NULL, NULL, NULL),
(2088, 20, 20, '/cart', '2018-02-14 07:09:28', NULL, NULL, NULL),
(2089, 20, 20, '/cart', '2018-02-14 07:09:29', NULL, NULL, NULL),
(2090, 20, 20, '/cart', '2018-02-14 07:09:29', NULL, NULL, NULL),
(2091, 20, 20, '/cart', '2018-02-14 07:09:30', NULL, NULL, NULL),
(2092, 20, 20, '/cart', '2018-02-14 07:09:30', NULL, NULL, NULL),
(2093, 20, 20, '/cart', '2018-02-14 07:09:30', NULL, NULL, NULL),
(2094, 20, 20, '/order', '2018-02-14 07:09:31', NULL, NULL, NULL),
(2095, 20, 20, '/order', '2018-02-14 07:10:13', NULL, NULL, NULL),
(2096, 20, 20, '/order', '2018-02-14 07:11:02', NULL, NULL, NULL),
(2097, 20, 20, '/order-complete/ab82d7d7b398b753b3998f6927974f08', '2018-02-14 07:11:17', NULL, NULL, NULL),
(2098, 20, 20, '/', '2018-02-14 07:11:20', NULL, NULL, NULL),
(2099, 20, 20, '/cart', '2018-02-14 07:12:05', NULL, NULL, NULL),
(2100, 20, 20, '/shop', '2018-02-14 07:12:07', NULL, NULL, NULL),
(2101, 20, 20, '/shop-categories/2', '2018-02-14 07:12:08', NULL, NULL, NULL),
(2102, 20, 20, '/product/58', '2018-02-14 07:12:09', NULL, NULL, NULL),
(2103, 20, 20, '/cart', '2018-02-14 07:12:11', NULL, NULL, NULL),
(2104, 20, 20, '/order', '2018-02-14 07:12:12', NULL, NULL, NULL),
(2105, 20, 20, '/order', '2018-02-14 07:13:45', NULL, NULL, NULL),
(2106, 20, 20, '/order', '2018-02-14 07:14:16', NULL, NULL, NULL),
(2107, 20, 20, '/order', '2018-02-14 07:14:26', NULL, NULL, NULL),
(2108, 20, 20, '/order', '2018-02-14 07:14:49', NULL, NULL, NULL),
(2109, 20, 20, '/order', '2018-02-14 07:15:32', NULL, NULL, NULL),
(2110, 20, 20, '/order', '2018-02-14 07:16:18', NULL, NULL, NULL),
(2111, 20, 20, '/order', '2018-02-14 07:16:43', NULL, NULL, NULL),
(2112, 20, 20, '/order', '2018-02-14 07:16:59', NULL, NULL, NULL),
(2113, 20, 20, '/order', '2018-02-14 07:17:05', NULL, NULL, NULL),
(2114, 20, 20, '/order', '2018-02-14 07:17:37', NULL, NULL, NULL),
(2115, 20, 20, '/order', '2018-02-14 07:18:37', NULL, NULL, NULL),
(2116, 20, 20, '/order', '2018-02-14 07:18:40', NULL, NULL, NULL),
(2117, 20, 20, '/order', '2018-02-14 07:19:00', NULL, NULL, NULL),
(2118, 20, 20, '/order', '2018-02-14 07:19:17', NULL, NULL, NULL),
(2119, 20, 20, '/order-complete/6c555bb3de30858835661ab225a58a3f', '2018-02-14 07:19:39', NULL, NULL, NULL),
(2120, 20, 20, '/', '2018-02-14 07:19:41', NULL, NULL, NULL),
(2121, 20, 20, '/', '2018-02-14 07:19:47', NULL, NULL, NULL),
(2122, 20, 20, '/', '2018-02-14 07:19:54', NULL, NULL, NULL),
(2123, 20, 20, '/company', '2018-02-14 07:19:55', NULL, NULL, NULL),
(2124, 20, 20, '/', '2018-02-14 07:19:56', NULL, NULL, NULL),
(2125, 20, 20, '/', '2018-02-14 07:19:57', NULL, NULL, NULL),
(2126, 20, 20, '/', '2018-02-14 07:19:59', NULL, NULL, NULL),
(2127, 20, 20, '/', '2018-02-14 07:20:01', NULL, NULL, NULL),
(2128, 20, 20, '/', '2018-02-14 07:20:02', NULL, NULL, NULL),
(2129, 20, 20, '/', '2018-02-14 07:21:43', NULL, NULL, NULL),
(2130, 20, 20, '/admin', '2018-02-14 07:22:24', NULL, NULL, NULL),
(2131, 20, 20, '/admin', '2018-02-14 07:22:25', NULL, NULL, NULL),
(2132, 20, 20, '/admin-globals', '2018-02-14 07:22:26', NULL, NULL, NULL),
(2133, 20, 20, '/admin-globals', '2018-02-14 07:23:53', NULL, NULL, NULL),
(2134, 20, 20, '/admin-globals', '2018-02-14 07:24:13', NULL, NULL, NULL),
(2135, 20, 20, '/shop', '2018-02-14 07:24:56', NULL, NULL, NULL),
(2136, 20, 20, '/shop-categories/2', '2018-02-14 07:24:57', NULL, NULL, NULL),
(2137, 20, 20, '/product/58', '2018-02-14 07:24:58', NULL, NULL, NULL),
(2138, 20, 20, '/cart', '2018-02-14 07:25:00', NULL, NULL, NULL),
(2139, 20, 20, '/order', '2018-02-14 07:25:02', NULL, NULL, NULL),
(2140, 20, 20, '/order', '2018-02-14 07:26:01', NULL, NULL, NULL),
(2141, 20, 20, '/order', '2018-02-14 07:26:04', NULL, NULL, NULL),
(2142, 20, 20, '/order', '2018-02-14 07:26:05', NULL, NULL, NULL),
(2143, 20, 20, '/order', '2018-02-14 07:26:06', NULL, NULL, NULL),
(2144, 20, 20, '/order', '2018-02-14 07:26:07', NULL, NULL, NULL),
(2145, 20, 20, '/order', '2018-02-14 07:26:09', NULL, NULL, NULL),
(2146, 20, 20, '/order', '2018-02-14 07:26:10', NULL, NULL, NULL),
(2147, 20, 20, '/order', '2018-02-14 07:26:11', NULL, NULL, NULL),
(2148, 20, 20, '/order', '2018-02-14 07:26:12', NULL, NULL, NULL),
(2149, 20, 20, '/order', '2018-02-14 07:26:13', NULL, NULL, NULL),
(2150, 20, 20, '/order', '2018-02-14 07:26:14', NULL, NULL, NULL),
(2151, 20, 20, '/order', '2018-02-14 07:26:15', NULL, NULL, NULL),
(2152, 20, 20, '/order', '2018-02-14 07:26:16', NULL, NULL, NULL),
(2153, 20, 20, '/order', '2018-02-14 07:26:17', NULL, NULL, NULL),
(2154, 20, 20, '/order', '2018-02-14 07:26:18', NULL, NULL, NULL),
(2155, 20, 20, '/order', '2018-02-14 07:26:19', NULL, NULL, NULL),
(2156, 20, 20, '/order', '2018-02-14 07:26:20', NULL, NULL, NULL),
(2157, 20, 20, '/order', '2018-02-14 07:26:26', NULL, NULL, NULL),
(2158, 20, 20, '/order', '2018-02-14 07:26:27', NULL, NULL, NULL),
(2159, 20, 20, '/order', '2018-02-14 07:26:28', NULL, NULL, NULL),
(2160, 20, 20, '/order', '2018-02-14 07:26:31', NULL, NULL, NULL),
(2161, 20, 20, '/order', '2018-02-14 07:26:31', NULL, NULL, NULL),
(2162, 20, 20, '/order', '2018-02-14 07:26:32', NULL, NULL, NULL),
(2163, 20, 20, '/order', '2018-02-14 07:26:33', NULL, NULL, NULL),
(2164, 20, 20, '/', '2018-02-14 07:26:35', NULL, NULL, NULL),
(2165, 20, 20, '/', '2018-02-14 07:26:36', NULL, NULL, NULL),
(2166, 20, 20, '/', '2018-02-14 07:26:40', NULL, NULL, NULL),
(2167, 20, 20, '/', '2018-02-14 07:26:42', NULL, NULL, NULL),
(2168, 20, 20, '/', '2018-02-14 07:26:47', NULL, NULL, NULL),
(2169, 20, 20, '/', '2018-02-14 07:26:50', NULL, NULL, NULL),
(2170, 20, 20, '/', '2018-02-14 07:29:31', NULL, NULL, NULL),
(2171, 20, 20, '/', '2018-02-14 07:30:05', NULL, NULL, NULL),
(2172, 20, 20, '/', '2018-02-14 07:30:30', NULL, NULL, NULL),
(2173, 20, 20, '/', '2018-02-14 07:32:55', NULL, NULL, NULL),
(2174, 20, 20, '/', '2018-02-14 07:33:02', NULL, NULL, NULL),
(2175, 20, 20, '/', '2018-02-14 07:34:17', NULL, NULL, NULL),
(2176, 20, 20, '/', '2018-02-14 07:34:19', NULL, NULL, NULL),
(2177, 20, 20, '/', '2018-02-14 07:34:24', NULL, NULL, NULL),
(2178, 20, 20, '/', '2018-02-14 07:34:51', NULL, NULL, NULL),
(2179, 20, 20, '/', '2018-02-14 07:35:13', NULL, NULL, NULL),
(2180, 20, 20, '/', '2018-02-14 07:35:37', NULL, NULL, NULL);
INSERT INTO `views` (`id`, `visit_id`, `visitor_id`, `path`, `created`, `updated`, `activated`, `closed`) VALUES
(2181, 20, 20, '/', '2018-02-14 07:36:19', NULL, NULL, NULL),
(2182, 20, 20, '/', '2018-02-14 07:36:36', NULL, NULL, NULL),
(2183, 20, 20, '/', '2018-02-14 07:36:50', NULL, NULL, NULL),
(2184, 20, 20, '/', '2018-02-14 07:38:52', NULL, NULL, NULL),
(2185, 20, 20, '/', '2018-02-14 07:40:29', NULL, NULL, NULL),
(2186, 20, 20, '/', '2018-02-14 07:42:58', NULL, NULL, NULL),
(2187, 20, 20, '/', '2018-02-14 07:44:28', NULL, NULL, NULL),
(2188, 20, 20, '/', '2018-02-14 07:51:15', NULL, NULL, NULL),
(2189, 20, 20, '/', '2018-02-14 07:51:25', NULL, NULL, NULL),
(2190, 20, 20, '/', '2018-02-14 07:52:55', NULL, NULL, NULL),
(2191, 20, 20, '/', '2018-02-14 07:53:13', NULL, NULL, NULL),
(2192, 20, 20, '/', '2018-02-14 07:54:22', NULL, NULL, NULL),
(2193, 20, 20, '/', '2018-02-14 07:54:23', NULL, NULL, NULL),
(2194, 20, 20, '/', '2018-02-14 07:54:25', NULL, NULL, NULL),
(2195, 20, 20, '/', '2018-02-14 07:54:44', NULL, NULL, NULL),
(2196, 20, 20, '/', '2018-02-14 07:55:06', NULL, NULL, NULL),
(2197, 20, 20, '/', '2018-02-14 07:55:08', NULL, NULL, NULL),
(2198, 20, 20, '/', '2018-02-14 07:55:10', NULL, NULL, NULL),
(2199, 20, 20, '/', '2018-02-14 07:55:12', NULL, NULL, NULL),
(2200, 20, 20, '/', '2018-02-14 07:58:33', NULL, NULL, NULL),
(2201, 20, 20, '/', '2018-02-14 07:59:45', NULL, NULL, NULL),
(2202, 20, 20, '/', '2018-02-14 07:59:56', NULL, NULL, NULL),
(2203, 20, 20, '/', '2018-02-14 08:00:06', NULL, NULL, NULL),
(2204, 20, 20, '/', '2018-02-14 08:00:07', NULL, NULL, NULL),
(2205, 20, 20, '/', '2018-02-14 08:01:12', NULL, NULL, NULL),
(2206, 20, 20, '/', '2018-02-14 08:01:16', NULL, NULL, NULL),
(2207, 20, 20, '/', '2018-02-14 08:01:20', NULL, NULL, NULL),
(2208, 20, 20, '/', '2018-02-14 08:01:56', NULL, NULL, NULL),
(2209, 20, 20, '/', '2018-02-14 08:02:14', NULL, NULL, NULL),
(2210, 20, 20, '/', '2018-02-14 08:03:07', NULL, NULL, NULL),
(2211, 20, 20, '/', '2018-02-14 08:03:23', NULL, NULL, NULL),
(2212, 20, 20, '/', '2018-02-14 08:03:52', NULL, NULL, NULL),
(2213, 20, 20, '/', '2018-02-14 08:04:09', NULL, NULL, NULL),
(2214, 20, 20, '/', '2018-02-14 08:05:29', NULL, NULL, NULL),
(2215, 20, 20, '/', '2018-02-14 08:06:18', NULL, NULL, NULL),
(2216, 20, 20, '/', '2018-02-14 08:06:19', NULL, NULL, NULL),
(2217, 20, 20, '/', '2018-02-14 08:06:20', NULL, NULL, NULL),
(2218, 20, 20, '/', '2018-02-14 08:07:15', NULL, NULL, NULL),
(2219, 20, 20, '/', '2018-02-14 08:07:42', NULL, NULL, NULL),
(2220, 20, 20, '/', '2018-02-14 08:08:07', NULL, NULL, NULL),
(2221, 20, 20, '/', '2018-02-14 08:09:36', NULL, NULL, NULL),
(2222, 20, 20, '/', '2018-02-14 08:10:15', NULL, NULL, NULL),
(2223, 20, 20, '/', '2018-02-14 08:11:17', NULL, NULL, NULL),
(2224, 20, 20, '/', '2018-02-14 08:11:54', NULL, NULL, NULL),
(2225, 20, 20, '/', '2018-02-14 08:11:56', NULL, NULL, NULL),
(2226, 20, 20, '/', '2018-02-14 08:11:58', NULL, NULL, NULL),
(2227, 20, 20, '/', '2018-02-14 08:12:15', NULL, NULL, NULL),
(2228, 20, 20, '/', '2018-02-14 08:12:53', NULL, NULL, NULL),
(2229, 20, 20, '/', '2018-02-14 08:13:07', NULL, NULL, NULL),
(2230, 20, 20, '/', '2018-02-14 08:13:44', NULL, NULL, NULL),
(2231, 20, 20, '/', '2018-02-14 08:13:56', NULL, NULL, NULL),
(2232, 20, 20, '/', '2018-02-14 08:14:31', NULL, NULL, NULL),
(2233, 20, 20, '/', '2018-02-14 08:15:02', NULL, NULL, NULL),
(2234, 20, 20, '/', '2018-02-14 08:15:59', NULL, NULL, NULL),
(2235, 20, 20, '/', '2018-02-14 08:17:32', NULL, NULL, NULL),
(2236, 20, 20, '/', '2018-02-14 08:21:29', NULL, NULL, NULL),
(2237, 20, 20, '/', '2018-02-14 08:21:34', NULL, NULL, NULL),
(2238, 20, 20, '/', '2018-02-14 08:21:54', NULL, NULL, NULL),
(2239, 20, 20, '/', '2018-02-14 08:21:57', NULL, NULL, NULL),
(2240, 20, 20, '/', '2018-02-14 08:22:05', NULL, NULL, NULL),
(2241, 20, 20, '/', '2018-02-14 08:22:20', NULL, NULL, NULL),
(2242, 20, 20, '/', '2018-02-14 08:22:22', NULL, NULL, NULL),
(2243, 20, 20, '/', '2018-02-14 08:22:36', NULL, NULL, NULL),
(2244, 20, 20, '/', '2018-02-14 08:22:37', NULL, NULL, NULL),
(2245, 20, 20, '/', '2018-02-14 08:22:38', NULL, NULL, NULL),
(2246, 20, 20, '/', '2018-02-14 08:23:11', NULL, NULL, NULL),
(2247, 20, 20, '/', '2018-02-14 08:25:29', NULL, NULL, NULL),
(2248, 20, 20, '/', '2018-02-14 08:25:32', NULL, NULL, NULL),
(2249, 20, 20, '/', '2018-02-14 08:25:53', NULL, NULL, NULL),
(2250, 20, 20, '/', '2018-02-14 08:25:57', NULL, NULL, NULL),
(2251, 20, 20, '/', '2018-02-14 08:25:58', NULL, NULL, NULL),
(2252, 20, 20, '/', '2018-02-14 08:26:03', NULL, NULL, NULL),
(2253, 20, 20, '/', '2018-02-14 08:26:05', NULL, NULL, NULL),
(2254, 20, 20, '/', '2018-02-14 08:26:06', NULL, NULL, NULL),
(2255, 20, 20, '/', '2018-02-14 08:26:13', NULL, NULL, NULL),
(2256, 20, 20, '/', '2018-02-14 08:26:18', NULL, NULL, NULL),
(2257, 20, 20, '/', '2018-02-14 08:26:32', NULL, NULL, NULL),
(2258, 20, 20, '/', '2018-02-14 08:27:07', NULL, NULL, NULL),
(2259, 20, 20, '/', '2018-02-14 08:27:10', NULL, NULL, NULL),
(2260, 20, 20, '/', '2018-02-14 08:27:16', NULL, NULL, NULL),
(2261, 20, 20, '/', '2018-02-14 08:27:38', NULL, NULL, NULL),
(2262, 20, 20, '/', '2018-02-14 08:27:49', NULL, NULL, NULL),
(2263, 20, 20, '/', '2018-02-14 08:28:05', NULL, NULL, NULL),
(2264, 20, 20, '/', '2018-02-14 08:28:06', NULL, NULL, NULL),
(2265, 20, 20, '/', '2018-02-14 08:28:11', NULL, NULL, NULL),
(2266, 20, 20, '/', '2018-02-14 08:28:25', NULL, NULL, NULL),
(2267, 20, 20, '/', '2018-02-14 08:28:27', NULL, NULL, NULL),
(2268, 20, 20, '/', '2018-02-14 08:28:42', NULL, NULL, NULL),
(2269, 20, 20, '/', '2018-02-14 08:28:43', NULL, NULL, NULL),
(2270, 20, 20, '/', '2018-02-14 08:28:51', NULL, NULL, NULL),
(2271, 20, 20, '/', '2018-02-14 08:28:55', NULL, NULL, NULL),
(2272, 20, 20, '/', '2018-02-14 08:28:59', NULL, NULL, NULL),
(2273, 20, 20, '/', '2018-02-14 08:29:01', NULL, NULL, NULL),
(2274, 20, 20, '/', '2018-02-14 08:29:11', NULL, NULL, NULL),
(2275, 20, 20, '/', '2018-02-14 08:29:19', NULL, NULL, NULL),
(2276, 20, 20, '/', '2018-02-14 08:29:55', NULL, NULL, NULL),
(2277, 20, 20, '/', '2018-02-14 08:29:59', NULL, NULL, NULL),
(2278, 20, 20, '/', '2018-02-14 08:30:32', NULL, NULL, NULL),
(2279, 20, 20, '/', '2018-02-14 08:30:37', NULL, NULL, NULL),
(2280, 20, 20, '/', '2018-02-14 08:31:03', NULL, NULL, NULL),
(2281, 20, 20, '/', '2018-02-14 08:31:20', NULL, NULL, NULL),
(2282, 20, 20, '/', '2018-02-14 08:32:28', NULL, NULL, NULL),
(2283, 20, 20, '/', '2018-02-14 08:33:02', NULL, NULL, NULL),
(2284, 20, 20, '/', '2018-02-14 08:33:30', NULL, NULL, NULL),
(2285, 20, 20, '/', '2018-02-14 08:33:32', NULL, NULL, NULL),
(2286, 20, 20, '/', '2018-02-14 08:33:33', NULL, NULL, NULL),
(2287, 20, 20, '/', '2018-02-14 08:33:44', NULL, NULL, NULL),
(2288, 20, 20, '/', '2018-02-14 08:34:19', NULL, NULL, NULL),
(2289, 20, 20, '/', '2018-02-14 08:34:52', NULL, NULL, NULL),
(2290, 20, 20, '/', '2018-02-14 08:35:15', NULL, NULL, NULL),
(2291, 20, 20, '/', '2018-02-14 08:35:19', NULL, NULL, NULL),
(2292, 20, 20, '/', '2018-02-14 08:35:21', NULL, NULL, NULL),
(2293, 20, 20, '/', '2018-02-14 08:35:24', NULL, NULL, NULL),
(2294, 20, 20, '/', '2018-02-14 08:35:46', NULL, NULL, NULL),
(2295, 20, 20, '/', '2018-02-14 08:35:52', NULL, NULL, NULL),
(2296, 20, 20, '/', '2018-02-14 08:36:22', NULL, NULL, NULL),
(2297, 20, 20, '/', '2018-02-14 08:36:24', NULL, NULL, NULL),
(2298, 20, 20, '/', '2018-02-14 08:36:50', NULL, NULL, NULL),
(2299, 20, 20, '/', '2018-02-14 08:37:03', NULL, NULL, NULL),
(2300, 20, 20, '/', '2018-02-14 08:37:08', NULL, NULL, NULL),
(2301, 20, 20, '/', '2018-02-14 08:37:17', NULL, NULL, NULL),
(2302, 20, 20, '/', '2018-02-14 08:38:03', NULL, NULL, NULL),
(2303, 20, 20, '/', '2018-02-14 08:38:29', NULL, NULL, NULL),
(2304, 20, 20, '/', '2018-02-14 08:38:42', NULL, NULL, NULL),
(2305, 20, 20, '/', '2018-02-14 08:38:58', NULL, NULL, NULL),
(2306, 20, 20, '/', '2018-02-14 08:39:12', NULL, NULL, NULL),
(2307, 20, 20, '/', '2018-02-14 08:39:50', NULL, NULL, NULL),
(2308, 20, 20, '/', '2018-02-14 08:40:02', NULL, NULL, NULL),
(2309, 20, 20, '/', '2018-02-14 08:40:14', NULL, NULL, NULL),
(2310, 20, 20, '/', '2018-02-14 08:40:49', NULL, NULL, NULL),
(2311, 20, 20, '/', '2018-02-14 08:40:50', NULL, NULL, NULL),
(2312, 20, 20, '/', '2018-02-14 08:40:54', NULL, NULL, NULL),
(2313, 20, 20, '/', '2018-02-14 08:40:57', NULL, NULL, NULL),
(2314, 20, 20, '/', '2018-02-14 08:41:06', NULL, NULL, NULL),
(2315, 20, 20, '/', '2018-02-14 08:41:21', NULL, NULL, NULL),
(2316, 20, 20, '/', '2018-02-14 08:41:40', NULL, NULL, NULL),
(2317, 20, 20, '/', '2018-02-14 08:41:54', NULL, NULL, NULL),
(2318, 20, 20, '/', '2018-02-14 08:41:57', NULL, NULL, NULL),
(2319, 20, 20, '/', '2018-02-14 08:41:59', NULL, NULL, NULL),
(2320, 20, 20, '/', '2018-02-14 08:42:20', NULL, NULL, NULL),
(2321, 20, 20, '/', '2018-02-14 08:53:39', NULL, NULL, NULL),
(2322, 20, 20, '/', '2018-02-14 08:53:41', NULL, NULL, NULL),
(2323, 20, 20, '/', '2018-02-14 08:56:19', NULL, NULL, NULL),
(2324, 20, 20, '/', '2018-02-14 08:59:53', NULL, NULL, NULL),
(2325, 20, 20, '/', '2018-02-14 08:59:54', NULL, NULL, NULL),
(2326, 20, 20, '/', '2018-02-14 08:59:55', NULL, NULL, NULL),
(2327, 20, 20, '/', '2018-02-14 08:59:58', NULL, NULL, NULL),
(2328, 20, 20, '/', '2018-02-14 09:01:24', NULL, NULL, NULL),
(2329, 20, 20, '/', '2018-02-14 09:02:22', NULL, NULL, NULL),
(2330, 20, 20, '/admin', '2018-02-14 09:06:03', NULL, NULL, NULL),
(2331, 20, 20, '/admin', '2018-02-14 09:06:05', NULL, NULL, NULL),
(2332, 20, 20, '/', '2018-02-14 09:06:06', NULL, NULL, NULL),
(2333, 20, 20, '/admin-globals', '2018-02-14 09:06:07', NULL, NULL, NULL),
(2334, 20, 20, '/', '2018-02-14 09:07:00', NULL, NULL, NULL),
(2335, 20, 20, '/', '2018-02-14 09:07:07', NULL, NULL, NULL),
(2336, 20, 20, '/', '2018-02-14 09:07:21', NULL, NULL, NULL),
(2337, 20, 20, '/', '2018-02-14 09:07:24', NULL, NULL, NULL),
(2338, 20, 20, '/', '2018-02-14 09:07:25', NULL, NULL, NULL),
(2339, 20, 20, '/', '2018-02-14 09:07:52', NULL, NULL, NULL),
(2340, 20, 20, '/', '2018-02-14 09:07:54', NULL, NULL, NULL),
(2341, 20, 20, '/', '2018-02-14 09:08:03', NULL, NULL, NULL),
(2342, 20, 20, '/', '2018-02-14 09:08:09', NULL, NULL, NULL),
(2343, 20, 20, '/', '2018-02-14 09:09:56', NULL, NULL, NULL),
(2344, 20, 20, '/', '2018-02-14 09:12:00', NULL, NULL, NULL),
(2345, 20, 20, '/company', '2018-02-14 09:12:01', NULL, NULL, NULL),
(2346, 20, 20, '/company', '2018-02-14 09:12:03', NULL, NULL, NULL),
(2347, 20, 20, '/company', '2018-02-14 09:12:04', NULL, NULL, NULL),
(2348, 20, 20, '/company', '2018-02-14 09:12:11', NULL, NULL, NULL),
(2349, 20, 20, '/admin-globals', '2018-02-14 09:14:23', NULL, NULL, NULL),
(2350, 20, 20, '/admin-globals', '2018-02-14 09:14:26', NULL, NULL, NULL),
(2351, 20, 20, '/company', '2018-02-14 09:14:31', NULL, NULL, NULL),
(2352, 20, 20, '/company', '2018-02-14 09:14:32', NULL, NULL, NULL),
(2353, 20, 20, '/company', '2018-02-14 09:14:33', NULL, NULL, NULL),
(2354, 20, 20, '/', '2018-02-14 09:14:36', NULL, NULL, NULL),
(2355, 20, 20, '/', '2018-02-14 09:14:38', NULL, NULL, NULL),
(2356, 20, 20, '/', '2018-02-14 09:14:45', NULL, NULL, NULL),
(2357, 20, 20, '/', '2018-02-14 09:14:46', NULL, NULL, NULL),
(2358, 20, 20, '/', '2018-02-14 09:14:47', NULL, NULL, NULL),
(2359, 20, 20, '/', '2018-02-14 09:16:09', NULL, NULL, NULL),
(2360, 20, 20, '/', '2018-02-14 09:16:55', NULL, NULL, NULL),
(2361, 20, 20, '/', '2018-02-14 09:17:34', NULL, NULL, NULL),
(2362, 20, 20, '/', '2018-02-14 09:18:02', NULL, NULL, NULL),
(2363, 20, 20, '/', '2018-02-14 09:18:22', NULL, NULL, NULL),
(2364, 20, 20, '/', '2018-02-14 09:22:15', NULL, NULL, NULL),
(2365, 20, 20, '/admin-globals', '2018-02-14 09:27:34', NULL, NULL, NULL),
(2366, 20, 20, '/admin-globals', '2018-02-14 09:27:35', NULL, NULL, NULL),
(2367, 20, 20, '/admin-globals', '2018-02-14 09:27:36', NULL, NULL, NULL),
(2368, 20, 20, '/admin-globals', '2018-02-14 09:27:36', NULL, NULL, NULL),
(2369, 20, 20, '/admin-globals', '2018-02-14 09:27:37', NULL, NULL, NULL),
(2370, 20, 20, '/admin-globals', '2018-02-14 09:28:04', NULL, NULL, NULL),
(2371, 20, 20, '/admin-globals', '2018-02-14 09:28:55', NULL, NULL, NULL),
(2372, 20, 20, '/admin-globals', '2018-02-14 09:33:39', NULL, NULL, NULL),
(2373, 20, 20, '/admin-globals', '2018-02-14 09:34:27', NULL, NULL, NULL),
(2374, 20, 20, '/admin-globals', '2018-02-14 09:35:07', NULL, NULL, NULL),
(2375, 20, 20, '/admin-globals', '2018-02-14 09:37:05', NULL, NULL, NULL),
(2376, 20, 20, '/admin-globals', '2018-02-14 09:39:37', NULL, NULL, NULL),
(2377, 20, 20, '/admin-globals', '2018-02-14 09:39:38', NULL, NULL, NULL),
(2378, 20, 20, '/admin-globals', '2018-02-14 09:40:19', NULL, NULL, NULL),
(2379, 20, 20, '/admin-globals', '2018-02-14 09:41:01', NULL, NULL, NULL),
(2380, 20, 20, '/admin-globals', '2018-02-14 09:42:12', NULL, NULL, NULL),
(2381, 20, 20, '/admin-globals', '2018-02-14 09:42:49', NULL, NULL, NULL),
(2382, 20, 20, '/admin-globals', '2018-02-14 09:43:31', NULL, NULL, NULL),
(2383, 20, 20, '/admin-globals', '2018-02-14 09:43:44', NULL, NULL, NULL),
(2384, 20, 20, '/admin-globals', '2018-02-14 09:46:32', NULL, NULL, NULL),
(2385, 20, 20, '/admin-globals', '2018-02-14 09:46:49', NULL, NULL, NULL),
(2386, 20, 20, '/admin-globals', '2018-02-14 09:47:01', NULL, NULL, NULL),
(2387, 20, 20, '/admin-globals', '2018-02-14 09:47:04', NULL, NULL, NULL),
(2388, 20, 20, '/admin-globals', '2018-02-14 09:47:18', NULL, NULL, NULL),
(2389, 20, 20, '/admin-globals', '2018-02-14 09:50:33', NULL, NULL, NULL),
(2390, 20, 20, '/admin-globals', '2018-02-14 09:50:33', NULL, NULL, NULL),
(2391, 20, 20, '/admin-globals', '2018-02-14 09:50:41', NULL, NULL, NULL),
(2392, 20, 20, '/admin-globals', '2018-02-14 09:51:08', NULL, NULL, NULL),
(2393, 20, 20, '/admin-globals', '2018-02-14 09:51:37', NULL, NULL, NULL),
(2394, 20, 20, '/admin-globals', '2018-02-14 09:54:21', NULL, NULL, NULL),
(2395, 20, 20, '/admin-globals', '2018-02-14 09:54:36', NULL, NULL, NULL),
(2396, 20, 20, '/company', '2018-02-14 10:09:58', NULL, NULL, NULL),
(2397, 20, 20, '/company', '2018-02-14 10:09:59', NULL, NULL, NULL),
(2398, 20, 20, '/company', '2018-02-14 10:10:02', NULL, NULL, NULL),
(2399, 20, 20, '/company', '2018-02-14 10:10:04', NULL, NULL, NULL),
(2400, 20, 20, '/company', '2018-02-14 10:10:11', NULL, NULL, NULL),
(2401, 20, 20, '/company', '2018-02-14 10:10:12', NULL, NULL, NULL),
(2402, 20, 20, '/admin', '2018-02-14 10:10:15', NULL, NULL, NULL),
(2403, 20, 20, '/admin-routes', '2018-02-14 10:10:16', NULL, NULL, NULL),
(2404, 20, 20, '/admin-routes', '2018-02-14 10:10:37', NULL, NULL, NULL),
(2405, 20, 20, '/documents', '2018-02-14 10:10:39', NULL, NULL, NULL),
(2406, 20, 20, '/documents', '2018-02-14 10:10:44', NULL, NULL, NULL),
(2407, 20, 20, '/documents', '2018-02-14 10:10:45', NULL, NULL, NULL),
(2408, 20, 20, '/documents', '2018-02-14 10:10:47', NULL, NULL, NULL),
(2409, 20, 20, '/documents', '2018-02-14 10:10:50', NULL, NULL, NULL),
(2410, 20, 20, '/documents', '2018-02-14 10:10:51', NULL, NULL, NULL),
(2411, 20, 20, '/documents', '2018-02-14 10:10:54', NULL, NULL, NULL),
(2412, 20, 20, '/documents', '2018-02-14 10:12:23', NULL, NULL, NULL),
(2413, 20, 20, '/documents', '2018-02-14 10:12:42', NULL, NULL, NULL),
(2414, 20, 20, '/documents', '2018-02-14 10:12:52', NULL, NULL, NULL),
(2415, 20, 20, '/documents', '2018-02-14 10:12:58', NULL, NULL, NULL),
(2416, 20, 20, '/documents', '2018-02-14 10:13:32', NULL, NULL, NULL),
(2417, 20, 20, '/documents', '2018-02-14 10:13:46', NULL, NULL, NULL),
(2418, 20, 20, '/documents', '2018-02-14 10:14:18', NULL, NULL, NULL),
(2419, 20, 20, '/documents', '2018-02-14 10:14:36', NULL, NULL, NULL),
(2420, 20, 20, '/documents', '2018-02-14 10:15:08', NULL, NULL, NULL),
(2421, 20, 20, '/documents', '2018-02-14 10:15:38', NULL, NULL, NULL),
(2422, 20, 20, '/documents', '2018-02-14 10:15:51', NULL, NULL, NULL),
(2423, 20, 20, '/documents', '2018-02-14 10:18:03', NULL, NULL, NULL),
(2424, 20, 20, '/documents', '2018-02-14 10:18:42', NULL, NULL, NULL),
(2425, 20, 20, '/documents', '2018-02-14 10:19:05', NULL, NULL, NULL),
(2426, 20, 20, '/documents', '2018-02-14 10:20:13', NULL, NULL, NULL),
(2427, 20, 20, '/documents', '2018-02-14 10:20:20', NULL, NULL, NULL),
(2428, 20, 20, '/documents', '2018-02-14 10:20:41', NULL, NULL, NULL),
(2429, 20, 20, '/documents', '2018-02-14 10:20:43', NULL, NULL, NULL),
(2430, 20, 20, '/documents', '2018-02-14 10:21:12', NULL, NULL, NULL),
(2431, 20, 20, '/documents', '2018-02-14 10:21:16', NULL, NULL, NULL),
(2432, 20, 20, '/documents', '2018-02-14 10:21:17', NULL, NULL, NULL),
(2433, 20, 20, '/documents', '2018-02-14 10:23:46', NULL, NULL, NULL),
(2434, 20, 20, '/documents', '2018-02-14 10:24:02', NULL, NULL, NULL),
(2435, 20, 20, '/documents', '2018-02-14 10:24:18', NULL, NULL, NULL),
(2436, 20, 20, '/documents', '2018-02-14 10:24:23', NULL, NULL, NULL),
(2437, 20, 20, '/documents', '2018-02-14 10:24:31', NULL, NULL, NULL),
(2438, 20, 20, '/documents', '2018-02-14 10:24:38', NULL, NULL, NULL),
(2439, 20, 20, '/documents', '2018-02-14 10:24:52', NULL, NULL, NULL),
(2440, 20, 20, '/documents', '2018-02-14 10:24:54', NULL, NULL, NULL),
(2441, 20, 20, '/documents', '2018-02-14 10:24:56', NULL, NULL, NULL),
(2442, 20, 20, '/documents', '2018-02-14 10:24:57', NULL, NULL, NULL),
(2443, 20, 20, '/admin', '2018-02-14 10:25:15', NULL, NULL, NULL),
(2444, 20, 20, '/admin-routes', '2018-02-14 10:25:16', NULL, NULL, NULL),
(2445, 20, 20, '/admin-routes', '2018-02-14 10:25:30', NULL, NULL, NULL),
(2446, 20, 20, '/documents', '2018-02-14 10:25:33', NULL, NULL, NULL),
(2447, 20, 20, '/document/1', '2018-02-14 10:25:34', NULL, NULL, NULL),
(2448, 20, 20, '/company', '2018-02-14 10:26:05', NULL, NULL, NULL),
(2449, 20, 20, '/documents', '2018-02-14 10:26:06', NULL, NULL, NULL),
(2450, 20, 20, '/documents', '2018-02-14 10:26:07', NULL, NULL, NULL),
(2451, 20, 20, '/documents', '2018-02-14 10:26:07', NULL, NULL, NULL),
(2452, 20, 20, '/documents', '2018-02-14 10:26:09', NULL, NULL, NULL),
(2453, 20, 20, '/documents', '2018-02-14 10:26:11', NULL, NULL, NULL),
(2454, 20, 20, '/documents', '2018-02-14 10:26:16', NULL, NULL, NULL),
(2455, 20, 20, '/documents', '2018-02-14 10:26:22', NULL, NULL, NULL),
(2456, 20, 20, '/documents', '2018-02-14 10:33:48', NULL, NULL, NULL),
(2457, 20, 20, '/documents', '2018-02-14 10:38:03', NULL, NULL, NULL),
(2458, 20, 20, '/documents', '2018-02-14 10:38:41', NULL, NULL, NULL),
(2459, 20, 20, '/documents', '2018-02-14 10:38:43', NULL, NULL, NULL),
(2460, 20, 20, '/documents', '2018-02-14 10:38:46', NULL, NULL, NULL),
(2461, 20, 20, '/documents', '2018-02-14 10:38:48', NULL, NULL, NULL),
(2462, 20, 20, '/documents', '2018-02-14 10:38:51', NULL, NULL, NULL),
(2463, 20, 20, '/documents', '2018-02-14 10:39:00', NULL, NULL, NULL),
(2464, 20, 20, '/documents', '2018-02-14 10:40:23', NULL, NULL, NULL),
(2465, 20, 20, '/documents', '2018-02-14 10:40:32', NULL, NULL, NULL),
(2466, 20, 20, '/documents', '2018-02-14 10:40:35', NULL, NULL, NULL),
(2467, 20, 20, '/documents', '2018-02-14 10:40:43', NULL, NULL, NULL),
(2468, 20, 20, '/documents', '2018-02-14 10:40:48', NULL, NULL, NULL),
(2469, 20, 20, '/documents', '2018-02-14 10:41:06', NULL, NULL, NULL),
(2470, 20, 20, '/documents', '2018-02-14 10:41:08', NULL, NULL, NULL),
(2471, 20, 20, '/documents', '2018-02-14 10:41:10', NULL, NULL, NULL),
(2472, 20, 20, '/documents', '2018-02-14 10:41:19', NULL, NULL, NULL),
(2473, 20, 20, '/documents', '2018-02-14 10:41:57', NULL, NULL, NULL),
(2474, 20, 20, '/documents', '2018-02-14 10:41:58', NULL, NULL, NULL),
(2475, 20, 20, '/documents', '2018-02-14 10:42:37', NULL, NULL, NULL),
(2476, 20, 20, '/documents', '2018-02-14 10:42:48', NULL, NULL, NULL),
(2477, 20, 20, '/documents', '2018-02-14 10:42:50', NULL, NULL, NULL),
(2478, 20, 20, '/documents', '2018-02-14 10:42:52', NULL, NULL, NULL),
(2479, 20, 20, '/documents', '2018-02-14 10:42:55', NULL, NULL, NULL),
(2480, 20, 20, '/documents', '2018-02-14 10:42:57', NULL, NULL, NULL),
(2481, 20, 20, '/documents', '2018-02-14 10:50:57', NULL, NULL, NULL),
(2482, 20, 20, '/documents', '2018-02-14 10:51:02', NULL, NULL, NULL),
(2483, 20, 20, '/documents', '2018-02-14 10:51:06', NULL, NULL, NULL),
(2484, 20, 20, '/documents', '2018-02-14 10:51:08', NULL, NULL, NULL),
(2485, 20, 20, '/document/1', '2018-02-14 10:51:12', NULL, NULL, NULL),
(2486, 20, 20, '/document/1', '2018-02-14 10:54:10', NULL, NULL, NULL),
(2487, 20, 20, '/document/1', '2018-02-14 10:54:12', NULL, NULL, NULL),
(2488, 20, 20, '/document/1', '2018-02-14 10:54:14', NULL, NULL, NULL),
(2489, 20, 20, '/document/1', '2018-02-14 10:54:17', NULL, NULL, NULL),
(2490, 20, 20, '/document/1', '2018-02-14 10:54:19', NULL, NULL, NULL),
(2491, 20, 20, '/document/1', '2018-02-14 10:54:21', NULL, NULL, NULL),
(2492, 20, 20, '/document/1', '2018-02-14 10:54:25', NULL, NULL, NULL),
(2493, 20, 20, '/document/1', '2018-02-14 10:57:27', NULL, NULL, NULL),
(2494, 20, 20, '/document/1', '2018-02-14 10:57:28', NULL, NULL, NULL),
(2495, 20, 20, '/document/1', '2018-02-14 10:57:36', NULL, NULL, NULL),
(2496, 20, 20, '/document/1', '2018-02-14 10:58:36', NULL, NULL, NULL),
(2497, 20, 20, '/document/5', '2018-02-14 10:58:38', NULL, NULL, NULL),
(2498, 20, 20, '/document/10', '2018-02-14 10:58:41', NULL, NULL, NULL),
(2499, 20, 20, '/document/1', '2018-02-14 10:58:44', NULL, NULL, NULL),
(2500, 20, 20, '/questions', '2018-02-14 11:01:55', NULL, NULL, NULL),
(2501, 20, 20, '/document/1', '2018-02-14 11:02:39', NULL, NULL, NULL),
(2502, 20, 20, '/document/1', '2018-02-14 11:03:04', NULL, NULL, NULL),
(2503, 20, 20, '/document/100', '2018-02-14 11:03:12', NULL, NULL, NULL),
(2504, 20, 20, '/document/100', '2018-02-14 11:03:27', NULL, NULL, NULL),
(2505, 20, 20, '/document/100', '2018-02-14 11:03:43', NULL, NULL, NULL),
(2506, 20, 20, '/documents', '2018-02-14 11:19:01', NULL, NULL, NULL),
(2507, 20, 20, '/document/1', '2018-02-14 11:19:03', NULL, NULL, NULL),
(2508, 20, 20, '/document/1', '2018-02-14 11:19:57', NULL, NULL, NULL),
(2509, 20, 20, '/document/1', '2018-02-14 11:20:55', NULL, NULL, NULL),
(2510, 20, 20, '/document/1', '2018-02-14 11:20:58', NULL, NULL, NULL),
(2511, 20, 20, '/document/1', '2018-02-14 11:22:58', NULL, NULL, NULL),
(2512, 20, 20, '/document/1', '2018-02-14 11:23:07', NULL, NULL, NULL),
(2513, 20, 20, '/document/1', '2018-02-14 11:23:34', NULL, NULL, NULL),
(2514, 20, 20, '/document/1', '2018-02-14 11:23:36', NULL, NULL, NULL),
(2515, 20, 20, '/document/1', '2018-02-14 11:23:37', NULL, NULL, NULL),
(2516, 20, 20, '/document/1', '2018-02-14 11:25:22', NULL, NULL, NULL),
(2517, 20, 20, '/document/1', '2018-02-14 11:26:28', NULL, NULL, NULL),
(2518, 20, 20, '/document/1', '2018-02-14 11:26:38', NULL, NULL, NULL),
(2519, 20, 20, '/document/1', '2018-02-14 11:27:13', NULL, NULL, NULL);

--
-- Триггеры `views`
--
DELIMITER $$
CREATE TRIGGER `add_views_count_to_visit` AFTER INSERT ON `views` FOR EACH ROW UPDATE visits SET count_views = count_views + 1 WHERE id = NEW.visit_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Структура таблицы `visitors`
--

CREATE TABLE `visitors` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Пользователи';

--
-- Дамп данных таблицы `visitors`
--

INSERT INTO `visitors` (`id`, `name`, `created`) VALUES
(1, NULL, '2018-02-07 11:10:37'),
(2, NULL, '2018-02-08 05:40:25'),
(3, NULL, '2018-02-08 06:06:45'),
(4, NULL, '2018-02-08 06:13:15'),
(5, NULL, '2018-02-08 07:04:55'),
(6, NULL, '2018-02-08 07:09:37'),
(7, NULL, '2018-02-08 09:37:19'),
(8, NULL, '2018-02-08 10:35:19'),
(9, NULL, '2018-02-12 06:30:37'),
(10, NULL, '2018-02-12 07:20:13'),
(11, NULL, '2018-02-12 07:20:24'),
(12, NULL, '2018-02-12 07:33:31'),
(13, NULL, '2018-02-12 07:38:54'),
(14, NULL, '2018-02-12 10:22:14'),
(15, NULL, '2018-02-12 10:58:01'),
(16, NULL, '2018-02-12 11:11:22'),
(17, NULL, '2018-02-12 11:28:12'),
(18, NULL, '2018-02-13 07:19:09'),
(19, NULL, '2018-02-13 07:33:49'),
(20, NULL, '2018-02-13 10:19:29');

-- --------------------------------------------------------

--
-- Структура таблицы `visits`
--

CREATE TABLE `visits` (
  `id` int(10) UNSIGNED NOT NULL,
  `visitor_id` int(10) UNSIGNED NOT NULL COMMENT 'Идентификатор визита',
  `count_views` int(11) NOT NULL DEFAULT '0',
  `visitor_ip` varchar(55) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  `closed` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `visits`
--

INSERT INTO `visits` (`id`, `visitor_id`, `count_views`, `visitor_ip`, `created`, `updated`, `closed`) VALUES
(1, 1, 189, '1', '2018-02-07 11:10:37', NULL, NULL),
(2, 2, 170, '1', '2018-02-08 05:40:25', NULL, NULL),
(3, 3, 37, '1', '2018-02-08 06:06:45', NULL, NULL),
(4, 4, 85, '1', '2018-02-08 06:13:15', NULL, NULL),
(5, 5, 18, '1', '2018-02-08 07:04:55', NULL, NULL),
(6, 6, 302, '1', '2018-02-08 07:09:37', NULL, NULL),
(7, 7, 48, '1', '2018-02-08 09:37:19', NULL, NULL),
(8, 8, 29, '1', '2018-02-08 10:35:19', NULL, NULL),
(9, 9, 107, '1', '2018-02-12 06:30:38', NULL, NULL),
(10, 10, 22, '1', '2018-02-12 07:20:13', NULL, NULL),
(11, 11, 2, '1', '2018-02-12 07:20:24', NULL, NULL),
(12, 12, 7, '1', '2018-02-12 07:33:31', NULL, NULL),
(13, 13, 44, '1', '2018-02-12 07:38:55', NULL, NULL),
(14, 14, 20, '1', '2018-02-12 10:22:14', NULL, NULL),
(15, 15, 9, '1', '2018-02-12 10:58:01', NULL, NULL),
(16, 16, 13, '1', '2018-02-12 11:11:22', NULL, NULL),
(17, 17, 67, '1', '2018-02-12 11:28:12', NULL, NULL),
(18, 18, 20, '1', '2018-02-13 07:19:09', NULL, NULL),
(19, 19, 259, '1', '2018-02-13 07:33:50', NULL, NULL),
(20, 20, 776, '1', '2018-02-13 10:19:29', NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `components`
--
ALTER TABLE `components`
  ADD PRIMARY KEY (`id`),
  ADD KEY `block_id` (`block_id`);

--
-- Индексы таблицы `confirmed_emails`
--
ALTER TABLE `confirmed_emails`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `confirmed_phones`
--
ALTER TABLE `confirmed_phones`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fragments`
--
ALTER TABLE `fragments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fragments_ibfk_1` (`component_id`),
  ADD KEY `fragments_ibfk_2` (`route_id`);

--
-- Индексы таблицы `fragments_blocks`
--
ALTER TABLE `fragments_blocks`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fragments_data`
--
ALTER TABLE `fragments_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `component_id` (`component_id`),
  ADD KEY `fragments_data_ibfk_2` (`fragment_id`);

--
-- Индексы таблицы `global_site_config`
--
ALTER TABLE `global_site_config`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `goods_cats`
--
ALTER TABLE `goods_cats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_cats_ibfk_1` (`parent_id`);

--
-- Индексы таблицы `goods_pos`
--
ALTER TABLE `goods_pos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_id` (`cat_id`);

--
-- Индексы таблицы `goods_props`
--
ALTER TABLE `goods_props`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `goods_props_bind_values`
--
ALTER TABLE `goods_props_bind_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `good_id` (`good_id`),
  ADD KEY `prop_id` (`prop_id`),
  ADD KEY `prop_value_id` (`prop_value_id`);

--
-- Индексы таблицы `goods_props_values`
--
ALTER TABLE `goods_props_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prop_id` (`prop_id`);

--
-- Индексы таблицы `header_nav`
--
ALTER TABLE `header_nav`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menu_groups`
--
ALTER TABLE `menu_groups`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `menu_items_ibfk_1` (`group_id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_ibfk_1` (`client_id`);

--
-- Индексы таблицы `orders_goods`
--
ALTER TABLE `orders_goods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `good_id` (`good_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_id` (`template_id`),
  ADD KEY `access` (`access`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Индексы таблицы `routes_access`
--
ALTER TABLE `routes_access`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `routes_aliases`
--
ALTER TABLE `routes_aliases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `route_id` (`route_id`);

--
-- Индексы таблицы `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `visits`
--
ALTER TABLE `visits`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `components`
--
ALTER TABLE `components`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `confirmed_emails`
--
ALTER TABLE `confirmed_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `confirmed_phones`
--
ALTER TABLE `confirmed_phones`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `fragments`
--
ALTER TABLE `fragments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT для таблицы `fragments_blocks`
--
ALTER TABLE `fragments_blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `fragments_data`
--
ALTER TABLE `fragments_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT для таблицы `global_site_config`
--
ALTER TABLE `global_site_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `goods_cats`
--
ALTER TABLE `goods_cats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `goods_pos`
--
ALTER TABLE `goods_pos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT для таблицы `goods_props`
--
ALTER TABLE `goods_props`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `goods_props_bind_values`
--
ALTER TABLE `goods_props_bind_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `goods_props_values`
--
ALTER TABLE `goods_props_values`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `header_nav`
--
ALTER TABLE `header_nav`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `menu_groups`
--
ALTER TABLE `menu_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `orders_goods`
--
ALTER TABLE `orders_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT для таблицы `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ид', AUTO_INCREMENT=624;

--
-- AUTO_INCREMENT для таблицы `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT для таблицы `routes_access`
--
ALTER TABLE `routes_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `routes_aliases`
--
ALTER TABLE `routes_aliases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `templates`
--
ALTER TABLE `templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `views`
--
ALTER TABLE `views`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2520;

--
-- AUTO_INCREMENT для таблицы `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `visits`
--
ALTER TABLE `visits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
  ADD CONSTRAINT `goods_pos_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `goods_cats` (`id`) ON DELETE NO ACTION;

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
  ADD CONSTRAINT `orders_goods_ibfk_1` FOREIGN KEY (`good_id`) REFERENCES `goods_pos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `orders_goods_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
