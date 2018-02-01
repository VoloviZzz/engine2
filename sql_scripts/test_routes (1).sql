-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 01 2018 г., 13:11
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
  `confirmed` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Регистрация завершена или нет',
  `surname` varchar(32) DEFAULT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `patronymic` varchar(32) DEFAULT NULL,
  `name` varchar(62) DEFAULT NULL,
  `phone` text CHARACTER SET cp1251 NOT NULL,
  `password` text NOT NULL,
  `mail` varchar(255) CHARACTER SET cp1251 DEFAULT NULL,
  `address` text CHARACTER SET cp1251,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`id`, `admin`, `root`, `confirmed`, `surname`, `firstname`, `patronymic`, `name`, `phone`, `password`, `mail`, `address`, `created`) VALUES
(8, 1, 1, 1, 'Зуев', 'Никита', 'Дмитриевич', 'Зуев Н.', '+7(912)-793-78-10', 'e10adc3949ba59abbe56e057f20f883e', 'zuarel@icloud.com', NULL, '2018-01-25 06:54:10'),
(9, 1, 0, 1, 'Иванов', 'Иван', 'Иванович', 'Иванов И.', '+7(123)-456-78-90', '202cb962ac59075b964b07152d234b70', NULL, NULL, '2018-01-25 08:24:27');

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
(16, 'Оформление заказа', 'go-order', 2, 0, 0, NULL, NULL, NULL, '2018-02-01 11:20:25');

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
(77, 9, 48, 3, 1, '2018-01-26 09:42:11'),
(78, 2, 48, 2, 1, '2018-01-26 09:45:14'),
(79, 2, 48, 2, 1, '2018-01-26 09:54:11'),
(80, 2, 48, 2, 1, '2018-01-26 09:54:12'),
(81, 2, 48, 2, 1, '2018-01-26 09:54:13'),
(89, 10, 62, 4, 1, '2018-01-29 06:53:54'),
(91, 11, 63, 2, 1, '2018-01-29 09:42:43'),
(93, 12, 63, 1, 1, '2018-01-29 10:17:57'),
(94, 13, 40, 1, 1, '2018-01-29 10:45:01'),
(95, 3, 32, 4, 1, '2018-01-29 11:13:12'),
(96, 13, 49, 1, 1, '2018-01-29 11:41:21'),
(97, 13, 48, 1, 1, '2018-01-29 11:42:49'),
(98, 13, 51, 1, 1, '2018-01-29 11:43:02'),
(99, 8, 50, 2, 1, '2018-01-29 11:43:26'),
(100, 13, 50, 1, 1, '2018-01-29 11:43:34'),
(101, 12, 64, 1, 1, '2018-01-31 06:21:53'),
(102, 14, 64, 2, 1, '2018-01-31 06:22:11'),
(103, 15, 65, 2, 1, '2018-02-01 08:20:51'),
(104, 16, 66, 2, 1, '2018-02-01 11:21:13');

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
(23, NULL, 78, '{\"content\":{\"body\":\"<p>asdasdasd</p>\\n\"}}', '2018-01-26 09:54:29'),
(24, NULL, 79, '{\"content\":{\"body\":\"<p>asdasdasdasdasdasd</p>\\n\"}}', '2018-01-26 09:54:45'),
(25, NULL, 80, '{\"content\":{\"body\":\"<p>aasdasd123213213</p>\\n\"}}', '2018-01-26 09:55:59'),
(26, NULL, 81, '{\"content\":{\"body\":\"<p>123123123123</p>\\n\"}}', '2018-01-26 09:56:14'),
(28, NULL, 89, '{\"content\":{\"slides\":[],\"lastId\":1}}', '2018-01-29 06:58:47');

-- --------------------------------------------------------

--
-- Структура таблицы `global_site_config`
--

CREATE TABLE `global_site_config` (
  `id` int(11) NOT NULL,
  `title` varchar(60) NOT NULL,
  `target` varchar(60) NOT NULL,
  `value` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `global_site_config`
--

INSERT INTO `global_site_config` (`id`, `title`, `target`, `value`, `created`, `updated`) VALUES
(1, 'Логин root-пользователя', 'rootLogin', 'root', '2018-01-25 10:11:49', NULL),
(2, 'Пароль root-пользователя', 'rootPassword', '4c5fd6d240c4e226e5cc1b53b1dbfaf3', '2018-01-25 10:12:28', NULL);

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
  `coast` decimal(11,2) NOT NULL DEFAULT '999999999.99',
  `count` int(11) NOT NULL DEFAULT '0',
  `cat_id` int(11) NOT NULL,
  `main_photo` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods_pos`
--

INSERT INTO `goods_pos` (`id`, `title`, `coast`, `count`, `cat_id`, `main_photo`, `created`, `description`) VALUES
(55, 'Новый товар', '10000.00', 15, 10, 17, '2018-01-31 10:53:34', NULL),
(56, 'Бла бла бла', '1500.00', 15, 47, 18, '2018-01-31 11:11:56', NULL),
(57, 'Новый товар', '999999999.99', 0, 48, NULL, '2018-01-31 11:34:17', NULL);

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
(2, 'Меню контактов', '2018-01-25 09:12:15');

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
(4, 'Реквизиты', '/contacts-doc', 0, NULL, 2, '2018-01-25 09:14:02'),
(5, 'Расположение', '/contacts-place', 0, NULL, 2, '2018-01-25 09:14:18'),
(6, 'фыв', 'ыфвфывфыв', 0, NULL, 2, '2018-01-29 11:33:44');

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
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `routes`
--

INSERT INTO `routes` (`id`, `title`, `url`, `template_id`, `menu_id`, `access`, `dynamic`, `edit_access`, `delete_access`, `seo_keywords`, `seo_description`, `created`, `updated`) VALUES
(32, 'Главная страница', '/', 1, NULL, 1, 0, 1, 1, '', '', '2018-01-17 10:11:31', '2018-01-26 05:24:17'),
(40, 'Администрирование', '/admin', 2, 1, 3, 0, 1, 1, '', '', '2018-01-20 20:43:27', '2018-01-25 07:13:14'),
(48, 'Компания', '/company', 2, 2, 1, 0, 1, 1, 'Ключевые, слова', 'Описание', '2018-01-24 10:07:54', '2018-01-29 11:33:40'),
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
(65, 'Корзина пользователя', '/cart', 2, NULL, 1, 0, 1, 1, '', '', '2018-02-01 08:13:30', '2018-02-01 08:13:30'),
(66, 'Оформление заказа', '/order', 2, NULL, 1, 0, 1, 1, '', '', '2018-02-01 11:14:39', '2018-02-01 11:14:39');

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

--
-- Дамп данных таблицы `routes_aliases`
--

INSERT INTO `routes_aliases` (`id`, `route_id`, `title`, `target`, `target_id`, `created`) VALUES
(1, 54, 'new-news-1', 'news', 1, '2018-01-25 09:41:17');

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
(2486, 32, 32, '/', '2018-01-31 05:19:54', NULL, NULL, NULL),
(2487, 32, 32, '/shop', '2018-01-31 05:20:16', NULL, NULL, NULL),
(2488, 32, 32, '/shop-categories/2', '2018-01-31 05:20:22', NULL, NULL, NULL),
(2489, 32, 32, '/login', '2018-01-31 05:20:30', NULL, NULL, NULL),
(2490, 32, 32, '/login', '2018-01-31 05:21:59', NULL, NULL, NULL),
(2491, 32, 32, '/', '2018-01-31 05:22:04', NULL, NULL, NULL),
(2492, 32, 32, '/shop', '2018-01-31 05:22:09', NULL, NULL, NULL),
(2493, 32, 32, '/shop-categories/5', '2018-01-31 05:22:15', NULL, NULL, NULL),
(2494, 32, 32, '/shop-categories/5', '2018-01-31 05:22:19', NULL, NULL, NULL),
(2495, 32, 32, '/shop-categories/3', '2018-01-31 05:22:20', NULL, NULL, NULL),
(2496, 32, 32, '/shop-categories/3', '2018-01-31 05:22:27', NULL, NULL, NULL),
(2497, 32, 32, '/shop-categories/3', '2018-01-31 05:22:29', NULL, NULL, NULL),
(2498, 32, 32, '/shop-categories/3', '2018-01-31 05:22:31', NULL, NULL, NULL),
(2499, 32, 32, '/shop-categories/3', '2018-01-31 05:46:18', NULL, NULL, NULL),
(2500, 32, 32, '/shop-categories/3', '2018-01-31 05:46:20', NULL, NULL, NULL),
(2501, 32, 32, '/shop-categories/10', '2018-01-31 05:55:10', NULL, NULL, NULL),
(2502, 32, 32, '/shop-categories/3', '2018-01-31 05:55:10', NULL, NULL, NULL),
(2503, 32, 32, '/shop-categories/2', '2018-01-31 05:55:11', NULL, NULL, NULL),
(2504, 32, 32, '/shop-categories/2', '2018-01-31 05:58:13', NULL, NULL, NULL),
(2505, 32, 32, '/shop-categories/2', '2018-01-31 06:02:51', NULL, NULL, NULL),
(2506, 32, 32, '/shop-categories/2', '2018-01-31 06:02:52', NULL, NULL, NULL),
(2507, 32, 32, '/shop-categories/2', '2018-01-31 06:04:23', NULL, NULL, NULL),
(2508, 32, 32, '/shop-categories/2', '2018-01-31 06:06:04', NULL, NULL, NULL),
(2509, 32, 32, '/shop-categories/2', '2018-01-31 06:06:09', NULL, NULL, NULL),
(2510, 32, 32, '/shop-categories/10', '2018-01-31 06:06:11', NULL, NULL, NULL),
(2511, 32, 32, '/shop-categories/10', '2018-01-31 06:06:12', NULL, NULL, NULL),
(2512, 32, 32, '/shop-categories/10', '2018-01-31 06:06:16', NULL, NULL, NULL),
(2513, 32, 32, '/shop-categories/10', '2018-01-31 06:07:50', NULL, NULL, NULL),
(2514, 32, 32, '/shop-categories/10', '2018-01-31 06:08:06', NULL, NULL, NULL),
(2515, 32, 32, '/shop-categories/10', '2018-01-31 06:09:14', NULL, NULL, NULL),
(2516, 32, 32, '/shop-categories/10', '2018-01-31 06:09:48', NULL, NULL, NULL),
(2517, 32, 32, '/shop-categories/10', '2018-01-31 06:13:03', NULL, NULL, NULL),
(2518, 32, 32, '/shop-categories/10', '2018-01-31 06:14:21', NULL, NULL, NULL),
(2519, 32, 32, '/shop-categories/10', '2018-01-31 06:15:07', NULL, NULL, NULL),
(2520, 32, 32, '/shop-categories/10', '2018-01-31 06:15:55', NULL, NULL, NULL),
(2521, 32, 32, '/shop-categories/10', '2018-01-31 06:15:56', NULL, NULL, NULL),
(2522, 32, 32, '/shop-categories/10', '2018-01-31 06:15:59', NULL, NULL, NULL),
(2523, 32, 32, '/shop-categories/10', '2018-01-31 06:16:00', NULL, NULL, NULL),
(2524, 32, 32, '/shop-categories/10', '2018-01-31 06:16:01', NULL, NULL, NULL),
(2525, 32, 32, '/shop-categories/10', '2018-01-31 06:16:02', NULL, NULL, NULL),
(2526, 32, 32, '/shop-categories/10', '2018-01-31 06:16:02', NULL, NULL, NULL),
(2527, 32, 32, '/shop-categories/10', '2018-01-31 06:16:03', NULL, NULL, NULL),
(2528, 32, 32, '/shop-categories/10', '2018-01-31 06:16:04', NULL, NULL, NULL),
(2529, 32, 32, '/shop-categories/10', '2018-01-31 06:16:04', NULL, NULL, NULL),
(2530, 32, 32, '/shop-categories/10', '2018-01-31 06:16:05', NULL, NULL, NULL),
(2531, 32, 32, '/shop-categories/10', '2018-01-31 06:16:06', NULL, NULL, NULL),
(2532, 32, 32, '/shop-categories/10', '2018-01-31 06:16:06', NULL, NULL, NULL),
(2533, 32, 32, '/shop-categories/10', '2018-01-31 06:16:07', NULL, NULL, NULL),
(2534, 32, 32, '/shop-categories/10', '2018-01-31 06:16:08', NULL, NULL, NULL),
(2535, 32, 32, '/shop-categories/10', '2018-01-31 06:16:08', NULL, NULL, NULL),
(2536, 32, 32, '/shop-categories/10', '2018-01-31 06:16:09', NULL, NULL, NULL),
(2537, 32, 32, '/shop-categories/10', '2018-01-31 06:16:09', NULL, NULL, NULL),
(2538, 32, 32, '/shop-categories/10', '2018-01-31 06:16:10', NULL, NULL, NULL),
(2539, 32, 32, '/shop-categories/10', '2018-01-31 06:16:11', NULL, NULL, NULL),
(2540, 32, 32, '/shop-categories/10', '2018-01-31 06:16:11', NULL, NULL, NULL),
(2541, 32, 32, '/shop-categories/10', '2018-01-31 06:16:12', NULL, NULL, NULL),
(2542, 32, 32, '/shop-categories/10', '2018-01-31 06:16:13', NULL, NULL, NULL),
(2543, 32, 32, '/shop-categories/10', '2018-01-31 06:16:13', NULL, NULL, NULL),
(2544, 32, 32, '/shop-categories/10', '2018-01-31 06:16:14', NULL, NULL, NULL),
(2545, 32, 32, '/shop-categories/10', '2018-01-31 06:16:15', NULL, NULL, NULL),
(2546, 32, 32, '/shop-categories/10', '2018-01-31 06:16:16', NULL, NULL, NULL),
(2547, 32, 32, '/shop-categories/10', '2018-01-31 06:16:16', NULL, NULL, NULL),
(2548, 32, 32, '/shop-categories/10', '2018-01-31 06:16:17', NULL, NULL, NULL),
(2549, 32, 32, '/shop-categories/10', '2018-01-31 06:16:17', NULL, NULL, NULL),
(2550, 32, 32, '/shop-categories/10', '2018-01-31 06:16:18', NULL, NULL, NULL),
(2551, 32, 32, '/shop-categories/10', '2018-01-31 06:16:19', NULL, NULL, NULL),
(2552, 32, 32, '/shop-categories/10', '2018-01-31 06:16:19', NULL, NULL, NULL),
(2553, 32, 32, '/shop-categories/10', '2018-01-31 06:16:20', NULL, NULL, NULL),
(2554, 32, 32, '/shop-categories/10', '2018-01-31 06:16:20', NULL, NULL, NULL),
(2555, 32, 32, '/shop-categories/10', '2018-01-31 06:16:21', NULL, NULL, NULL),
(2556, 32, 32, '/shop-categories/10', '2018-01-31 06:16:22', NULL, NULL, NULL),
(2557, 32, 32, '/shop-categories/10', '2018-01-31 06:16:22', NULL, NULL, NULL),
(2558, 32, 32, '/shop-categories/10', '2018-01-31 06:16:23', NULL, NULL, NULL),
(2559, 32, 32, '/shop-categories/10', '2018-01-31 06:16:24', NULL, NULL, NULL),
(2560, 32, 32, '/shop-categories/10', '2018-01-31 06:16:24', NULL, NULL, NULL),
(2561, 32, 32, '/shop-categories/10', '2018-01-31 06:16:25', NULL, NULL, NULL),
(2562, 32, 32, '/shop-categories/10', '2018-01-31 06:16:26', NULL, NULL, NULL),
(2563, 32, 32, '/shop-categories/10', '2018-01-31 06:16:27', NULL, NULL, NULL),
(2564, 32, 32, '/shop-categories/10', '2018-01-31 06:16:27', NULL, NULL, NULL),
(2565, 32, 32, '/shop-categories/10', '2018-01-31 06:16:28', NULL, NULL, NULL),
(2566, 32, 32, '/shop-categories/10', '2018-01-31 06:16:29', NULL, NULL, NULL),
(2567, 32, 32, '/shop-categories/10', '2018-01-31 06:16:29', NULL, NULL, NULL),
(2568, 32, 32, '/shop-categories/10', '2018-01-31 06:16:30', NULL, NULL, NULL),
(2569, 32, 32, '/shop-categories/10', '2018-01-31 06:16:31', NULL, NULL, NULL),
(2570, 32, 32, '/shop-categories/10', '2018-01-31 06:16:33', NULL, NULL, NULL),
(2571, 32, 32, '/shop-categories/10', '2018-01-31 06:17:32', NULL, NULL, NULL),
(2572, 32, 32, '/shop-categories/10', '2018-01-31 06:17:33', NULL, NULL, NULL),
(2573, 32, 32, '/shop-categories/10', '2018-01-31 06:17:34', NULL, NULL, NULL),
(2574, 32, 32, '/shop-categories/10', '2018-01-31 06:20:25', NULL, NULL, NULL),
(2575, 32, 32, '/shop-categories/3', '2018-01-31 06:20:26', NULL, NULL, NULL),
(2576, 32, 32, '/shop-categories/2', '2018-01-31 06:20:27', NULL, NULL, NULL),
(2577, 32, 32, '/shop-categories/3', '2018-01-31 06:20:28', NULL, NULL, NULL),
(2578, 32, 32, '/shop-categories/2', '2018-01-31 06:20:29', NULL, NULL, NULL),
(2579, 32, 32, '/shop-categories/2', '2018-01-31 06:20:30', NULL, NULL, NULL),
(2580, 32, 32, '/shop-categories/8', '2018-01-31 06:20:48', NULL, NULL, NULL),
(2581, 32, 32, '/shop-categories/8', '2018-01-31 06:20:50', NULL, NULL, NULL),
(2582, 32, 32, '/shop-categories/5', '2018-01-31 06:20:53', NULL, NULL, NULL),
(2583, 32, 32, '/shop-categories/5', '2018-01-31 06:20:54', NULL, NULL, NULL),
(2584, 32, 32, '/shop-categories/44', '2018-01-31 06:20:57', NULL, NULL, NULL),
(2585, 32, 32, '/shop-categories/8', '2018-01-31 06:20:58', NULL, NULL, NULL),
(2586, 32, 32, '/admin', '2018-01-31 06:21:10', NULL, NULL, NULL),
(2587, 32, 32, '/admin-clients', '2018-01-31 06:21:20', NULL, NULL, NULL),
(2588, 32, 32, '/admin-routes', '2018-01-31 06:21:26', NULL, NULL, NULL),
(2589, 32, 32, '/admin-routes', '2018-01-31 06:21:49', NULL, NULL, NULL),
(2590, 32, 32, '/product/54', '2018-01-31 06:21:51', NULL, NULL, NULL),
(2591, 32, 32, '/product/54', '2018-01-31 06:21:53', NULL, NULL, NULL),
(2592, 32, 32, '/product/54', '2018-01-31 06:21:57', NULL, NULL, NULL),
(2593, 32, 32, '/product/54', '2018-01-31 06:22:11', NULL, NULL, NULL),
(2594, 32, 32, '/product/54', '2018-01-31 06:40:36', NULL, NULL, NULL),
(2595, 32, 32, '/product/54', '2018-01-31 06:40:45', NULL, NULL, NULL),
(2596, 32, 32, '/product/54', '2018-01-31 06:42:21', NULL, NULL, NULL),
(2597, 32, 32, '/product/54', '2018-01-31 06:42:33', NULL, NULL, NULL),
(2598, 32, 32, '/product/54', '2018-01-31 06:43:15', NULL, NULL, NULL),
(2599, 32, 32, '/product/54', '2018-01-31 06:43:48', NULL, NULL, NULL),
(2600, 32, 32, '/product/54', '2018-01-31 06:44:40', NULL, NULL, NULL),
(2601, 32, 32, '/product/54', '2018-01-31 06:46:18', NULL, NULL, NULL),
(2602, 32, 32, '/product/54', '2018-01-31 06:46:23', NULL, NULL, NULL),
(2603, 32, 32, '/product/54', '2018-01-31 06:46:35', NULL, NULL, NULL),
(2604, 32, 32, '/product/54', '2018-01-31 06:46:54', NULL, NULL, NULL),
(2605, 32, 32, '/product/54', '2018-01-31 06:47:23', NULL, NULL, NULL),
(2606, 32, 32, '/product/54', '2018-01-31 06:47:29', NULL, NULL, NULL),
(2607, 32, 32, '/product/54', '2018-01-31 06:47:31', NULL, NULL, NULL),
(2608, 32, 32, '/product/54', '2018-01-31 06:48:52', NULL, NULL, NULL),
(2609, 32, 32, '/product/54', '2018-01-31 06:48:55', NULL, NULL, NULL),
(2610, 32, 32, '/product/54', '2018-01-31 06:48:56', NULL, NULL, NULL),
(2611, 32, 32, '/product/54', '2018-01-31 06:49:23', NULL, NULL, NULL),
(2612, 32, 32, '/product/54', '2018-01-31 07:00:20', NULL, NULL, NULL),
(2613, 32, 32, '/product/54', '2018-01-31 07:00:21', NULL, NULL, NULL),
(2614, 32, 32, '/product/54', '2018-01-31 07:00:22', NULL, NULL, NULL),
(2615, 32, 32, '/product/54', '2018-01-31 07:00:34', NULL, NULL, NULL),
(2616, 32, 32, '/product/54', '2018-01-31 07:00:34', NULL, NULL, NULL),
(2617, 32, 32, '/product/54', '2018-01-31 07:00:45', NULL, NULL, NULL),
(2618, 32, 32, '/product/54', '2018-01-31 07:00:52', NULL, NULL, NULL),
(2619, 32, 32, '/product/54', '2018-01-31 07:01:30', NULL, NULL, NULL),
(2620, 32, 32, '/product/54', '2018-01-31 07:02:07', NULL, NULL, NULL),
(2621, 32, 32, '/product/54', '2018-01-31 07:02:22', NULL, NULL, NULL),
(2622, 32, 32, '/product/54', '2018-01-31 07:02:57', NULL, NULL, NULL),
(2623, 32, 32, '/product/54', '2018-01-31 07:02:58', NULL, NULL, NULL),
(2624, 32, 32, '/product/54', '2018-01-31 07:03:01', NULL, NULL, NULL),
(2625, 32, 32, '/product/54', '2018-01-31 07:03:02', NULL, NULL, NULL),
(2626, 32, 32, '/product/54', '2018-01-31 07:03:09', NULL, NULL, NULL),
(2627, 32, 32, '/product/54', '2018-01-31 07:03:13', NULL, NULL, NULL),
(2628, 32, 32, '/product/54', '2018-01-31 07:03:17', NULL, NULL, NULL),
(2629, 32, 32, '/product/54', '2018-01-31 07:04:14', NULL, NULL, NULL),
(2630, 32, 32, '/product/54', '2018-01-31 07:04:33', NULL, NULL, NULL),
(2631, 32, 32, '/product/54', '2018-01-31 07:04:57', NULL, NULL, NULL),
(2632, 32, 32, '/product/54', '2018-01-31 07:05:24', NULL, NULL, NULL),
(2633, 32, 32, '/product/54', '2018-01-31 07:05:30', NULL, NULL, NULL),
(2634, 32, 32, '/product/54', '2018-01-31 07:13:02', NULL, NULL, NULL),
(2635, 32, 32, '/product/54', '2018-01-31 07:13:21', NULL, NULL, NULL),
(2636, 32, 32, '/product/54', '2018-01-31 07:13:29', NULL, NULL, NULL),
(2637, 32, 32, '/product/54', '2018-01-31 07:13:51', NULL, NULL, NULL),
(2638, 32, 32, '/product/54', '2018-01-31 07:15:07', NULL, NULL, NULL),
(2639, 32, 32, '/product/54', '2018-01-31 07:15:22', NULL, NULL, NULL),
(2640, 32, 32, '/product/54', '2018-01-31 07:15:38', NULL, NULL, NULL),
(2641, 32, 32, '/product/54', '2018-01-31 07:15:40', NULL, NULL, NULL),
(2642, 32, 32, '/product/54', '2018-01-31 07:15:46', NULL, NULL, NULL),
(2643, 32, 32, '/product/54', '2018-01-31 07:15:53', NULL, NULL, NULL),
(2644, 32, 32, '/product/54', '2018-01-31 07:15:56', NULL, NULL, NULL),
(2645, 32, 32, '/product/54', '2018-01-31 07:17:39', NULL, NULL, NULL),
(2646, 32, 32, '/product/54', '2018-01-31 07:18:03', NULL, NULL, NULL),
(2647, 32, 32, '/product/54', '2018-01-31 07:18:05', NULL, NULL, NULL),
(2648, 32, 32, '/product/54', '2018-01-31 07:18:07', NULL, NULL, NULL),
(2649, 32, 32, '/product/54', '2018-01-31 07:18:08', NULL, NULL, NULL),
(2650, 32, 32, '/product/54', '2018-01-31 07:18:10', NULL, NULL, NULL),
(2651, 32, 32, '/product/54', '2018-01-31 07:18:11', NULL, NULL, NULL),
(2652, 32, 32, '/product/54', '2018-01-31 07:18:25', NULL, NULL, NULL),
(2653, 32, 32, '/product/54', '2018-01-31 07:21:33', NULL, NULL, NULL),
(2654, 32, 32, '/product/54', '2018-01-31 07:21:52', NULL, NULL, NULL),
(2655, 32, 32, '/product/54', '2018-01-31 07:21:55', NULL, NULL, NULL),
(2656, 32, 32, '/product/54', '2018-01-31 07:22:12', NULL, NULL, NULL),
(2657, 32, 32, '/product/54', '2018-01-31 07:22:19', NULL, NULL, NULL),
(2658, 32, 32, '/product/54', '2018-01-31 07:24:02', NULL, NULL, NULL),
(2659, 32, 32, '/product/54', '2018-01-31 07:24:03', NULL, NULL, NULL),
(2660, 32, 32, '/product/54', '2018-01-31 07:25:47', NULL, NULL, NULL),
(2661, 32, 32, '/product/54', '2018-01-31 07:25:48', NULL, NULL, NULL),
(2662, 32, 32, '/product/54', '2018-01-31 07:27:00', NULL, NULL, NULL),
(2663, 32, 32, '/product/54', '2018-01-31 07:28:30', NULL, NULL, NULL),
(2664, 32, 32, '/product/54', '2018-01-31 07:29:28', NULL, NULL, NULL),
(2665, 32, 32, '/product/54', '2018-01-31 07:30:19', NULL, NULL, NULL),
(2666, 32, 32, '/product/54', '2018-01-31 07:30:28', NULL, NULL, NULL),
(2667, 32, 32, '/product/54', '2018-01-31 07:31:41', NULL, NULL, NULL),
(2668, 32, 32, '/product/54', '2018-01-31 07:31:45', NULL, NULL, NULL),
(2669, 32, 32, '/product/54', '2018-01-31 07:31:49', NULL, NULL, NULL),
(2670, 32, 32, '/product/54', '2018-01-31 07:31:49', NULL, NULL, NULL),
(2671, 32, 32, '/product/54', '2018-01-31 07:32:17', NULL, NULL, NULL),
(2672, 32, 32, '/product/54', '2018-01-31 07:32:22', NULL, NULL, NULL),
(2673, 32, 32, '/product/54', '2018-01-31 07:32:26', NULL, NULL, NULL),
(2674, 32, 32, '/product/54', '2018-01-31 07:33:40', NULL, NULL, NULL),
(2675, 32, 32, '/product/54', '2018-01-31 07:33:42', NULL, NULL, NULL),
(2676, 32, 32, '/product/54', '2018-01-31 07:33:43', NULL, NULL, NULL),
(2677, 32, 32, '/product/54', '2018-01-31 07:33:45', NULL, NULL, NULL),
(2678, 32, 32, '/product/54', '2018-01-31 07:33:47', NULL, NULL, NULL),
(2679, 32, 32, '/product/2', '2018-01-31 07:33:53', NULL, NULL, NULL),
(2680, 32, 32, '/product/3', '2018-01-31 07:33:53', NULL, NULL, NULL),
(2681, 32, 32, '/product/2', '2018-01-31 07:33:54', NULL, NULL, NULL),
(2682, 32, 32, '/product/3', '2018-01-31 07:33:55', NULL, NULL, NULL),
(2683, 32, 32, '/product/3', '2018-01-31 07:33:56', NULL, NULL, NULL),
(2684, 32, 32, '/product/10', '2018-01-31 07:33:57', NULL, NULL, NULL),
(2685, 32, 32, '/product/3', '2018-01-31 07:33:57', NULL, NULL, NULL),
(2686, 32, 32, '/product/2', '2018-01-31 07:33:58', NULL, NULL, NULL),
(2687, 32, 32, '/product/3', '2018-01-31 07:33:59', NULL, NULL, NULL),
(2688, 32, 32, '/product/10', '2018-01-31 07:33:59', NULL, NULL, NULL),
(2689, 32, 32, '/product/4', '2018-01-31 07:34:00', NULL, NULL, NULL),
(2690, 32, 32, '/product/5', '2018-01-31 07:34:01', NULL, NULL, NULL),
(2691, 32, 32, '/shop', '2018-01-31 07:34:21', NULL, NULL, NULL),
(2692, 32, 32, '/shop-categories/2', '2018-01-31 07:34:22', NULL, NULL, NULL),
(2693, 32, 32, '/shop-categories/2', '2018-01-31 07:34:31', NULL, NULL, NULL),
(2694, 32, 32, '/shop-categories/2', '2018-01-31 07:34:33', NULL, NULL, NULL),
(2695, 32, 32, '/product/5', '2018-01-31 07:34:34', NULL, NULL, NULL),
(2696, 32, 32, '/shop-categories/2', '2018-01-31 07:34:36', NULL, NULL, NULL),
(2697, 32, 32, '/product/1', '2018-01-31 07:34:44', NULL, NULL, NULL),
(2698, 32, 32, '/product/1', '2018-01-31 07:34:44', NULL, NULL, NULL),
(2699, 32, 32, '/product/1', '2018-01-31 07:34:46', NULL, NULL, NULL),
(2700, 32, 32, '/product/1', '2018-01-31 07:34:59', NULL, NULL, NULL),
(2701, 32, 32, '/product/1', '2018-01-31 07:35:00', NULL, NULL, NULL),
(2702, 32, 32, '/product/1', '2018-01-31 07:35:03', NULL, NULL, NULL),
(2703, 32, 32, '/product/1', '2018-01-31 07:52:01', NULL, NULL, NULL),
(2704, 32, 32, '/shop-categories/2', '2018-01-31 07:58:22', NULL, NULL, NULL),
(2705, 32, 32, '/shop-categories/3', '2018-01-31 07:58:22', NULL, NULL, NULL),
(2706, 32, 32, '/shop-categories/10', '2018-01-31 07:58:23', NULL, NULL, NULL),
(2707, 32, 32, '/product/3', '2018-01-31 07:58:24', NULL, NULL, NULL),
(2708, 32, 32, '/product/3', '2018-01-31 07:58:27', NULL, NULL, NULL),
(2709, 32, 32, '/product/3', '2018-01-31 07:58:49', NULL, NULL, NULL),
(2710, 32, 32, '/product/3', '2018-01-31 07:58:50', NULL, NULL, NULL),
(2711, 32, 32, '/product/3', '2018-01-31 07:58:57', NULL, NULL, NULL),
(2712, 32, 32, '/product/3', '2018-01-31 07:59:05', NULL, NULL, NULL),
(2713, 32, 32, '/product/3', '2018-01-31 07:59:08', NULL, NULL, NULL),
(2714, 32, 32, '/product/3', '2018-01-31 08:01:55', NULL, NULL, NULL),
(2715, 32, 32, '/product/3', '2018-01-31 08:08:59', NULL, NULL, NULL),
(2716, 32, 32, '/product/3', '2018-01-31 08:10:28', NULL, NULL, NULL),
(2717, 32, 32, '/product/3', '2018-01-31 08:12:22', NULL, NULL, NULL),
(2718, 32, 32, '/product/3', '2018-01-31 08:12:23', NULL, NULL, NULL),
(2719, 32, 32, '/product/3', '2018-01-31 08:12:43', NULL, NULL, NULL),
(2720, 32, 32, '/product/3', '2018-01-31 08:12:44', NULL, NULL, NULL),
(2721, 32, 32, '/product/3', '2018-01-31 08:12:45', NULL, NULL, NULL),
(2722, 32, 32, '/product/3', '2018-01-31 08:12:47', NULL, NULL, NULL),
(2723, 32, 32, '/product/3', '2018-01-31 08:13:05', NULL, NULL, NULL),
(2724, 32, 32, '/product/3', '2018-01-31 08:13:15', NULL, NULL, NULL),
(2725, 32, 32, '/product/3', '2018-01-31 08:13:19', NULL, NULL, NULL),
(2726, 32, 32, '/product/3', '2018-01-31 08:13:30', NULL, NULL, NULL),
(2727, 32, 32, '/product/3', '2018-01-31 08:15:38', NULL, NULL, NULL),
(2728, 32, 32, '/shop-categories/2', '2018-01-31 08:16:53', NULL, NULL, NULL),
(2729, 32, 32, '/product/53', '2018-01-31 08:16:55', NULL, NULL, NULL),
(2730, 32, 32, '/product/3', '2018-01-31 08:19:01', NULL, NULL, NULL),
(2731, 32, 32, '/product/3', '2018-01-31 08:19:04', NULL, NULL, NULL),
(2732, 32, 32, '/product/3', '2018-01-31 08:19:04', NULL, NULL, NULL),
(2733, 32, 32, '/product/3', '2018-01-31 08:19:50', NULL, NULL, NULL),
(2734, 32, 32, '/product/3', '2018-01-31 08:20:35', NULL, NULL, NULL),
(2735, 32, 32, '/product/3', '2018-01-31 08:21:00', NULL, NULL, NULL),
(2736, 32, 32, '/product/3', '2018-01-31 08:24:02', NULL, NULL, NULL),
(2737, 32, 32, '/product/3', '2018-01-31 08:24:18', NULL, NULL, NULL),
(2738, 32, 32, '/product/3', '2018-01-31 08:24:20', NULL, NULL, NULL),
(2739, 32, 32, '/product/3', '2018-01-31 08:27:40', NULL, NULL, NULL),
(2740, 32, 32, '/product/3', '2018-01-31 08:27:41', NULL, NULL, NULL),
(2741, 32, 32, '/product/3', '2018-01-31 08:31:14', NULL, NULL, NULL),
(2742, 32, 32, '/product/3', '2018-01-31 08:31:37', NULL, NULL, NULL),
(2743, 32, 32, '/product/3', '2018-01-31 08:31:38', NULL, NULL, NULL),
(2744, 32, 32, '/product/3', '2018-01-31 08:31:46', NULL, NULL, NULL),
(2745, 32, 32, '/product/3', '2018-01-31 08:31:49', NULL, NULL, NULL),
(2746, 32, 32, '/product/3', '2018-01-31 08:31:50', NULL, NULL, NULL),
(2747, 32, 32, '/product/3', '2018-01-31 08:34:16', NULL, NULL, NULL),
(2748, 32, 32, '/product/3', '2018-01-31 08:34:19', NULL, NULL, NULL),
(2749, 32, 32, '/product/3', '2018-01-31 08:34:30', NULL, NULL, NULL),
(2750, 32, 32, '/product/3', '2018-01-31 08:34:50', NULL, NULL, NULL),
(2751, 32, 32, '/product/3', '2018-01-31 08:35:06', NULL, NULL, NULL),
(2752, 32, 32, '/product/3', '2018-01-31 08:35:07', NULL, NULL, NULL),
(2753, 32, 32, '/product/3', '2018-01-31 08:35:26', NULL, NULL, NULL),
(2754, 32, 32, '/product/3', '2018-01-31 08:44:57', NULL, NULL, NULL),
(2755, 32, 32, '/product/3', '2018-01-31 08:44:57', NULL, NULL, NULL),
(2756, 32, 32, '/product/3', '2018-01-31 08:44:58', NULL, NULL, NULL),
(2757, 32, 32, '/product/3', '2018-01-31 08:45:14', NULL, NULL, NULL),
(2758, 32, 32, '/product/3', '2018-01-31 08:45:16', NULL, NULL, NULL),
(2759, 32, 32, '/product/3', '2018-01-31 08:46:08', NULL, NULL, NULL),
(2760, 32, 32, '/product/3', '2018-01-31 08:47:07', NULL, NULL, NULL),
(2761, 32, 32, '/product/3', '2018-01-31 08:47:23', NULL, NULL, NULL),
(2762, 32, 32, '/product/3', '2018-01-31 08:50:02', NULL, NULL, NULL),
(2763, 32, 32, '/product/3', '2018-01-31 08:50:12', NULL, NULL, NULL),
(2764, 32, 32, '/product/3', '2018-01-31 08:50:41', NULL, NULL, NULL),
(2765, 32, 32, '/product/3', '2018-01-31 08:51:52', NULL, NULL, NULL),
(2766, 32, 32, '/product/3', '2018-01-31 08:52:14', NULL, NULL, NULL),
(2767, 32, 32, '/product/3', '2018-01-31 08:54:00', NULL, NULL, NULL),
(2768, 32, 32, '/product/3', '2018-01-31 08:54:32', NULL, NULL, NULL),
(2769, 32, 32, '/product/3', '2018-01-31 08:57:06', NULL, NULL, NULL),
(2770, 32, 32, '/product/3', '2018-01-31 09:01:58', NULL, NULL, NULL),
(2771, 32, 32, '/product/3', '2018-01-31 09:04:26', NULL, NULL, NULL),
(2772, 33, 33, '/', '2018-01-31 09:07:22', NULL, NULL, NULL),
(2773, 33, 33, '/shop', '2018-01-31 09:07:26', NULL, NULL, NULL),
(2774, 33, 33, '/shop-categories/2', '2018-01-31 09:07:27', NULL, NULL, NULL),
(2775, 33, 33, '/product/2', '2018-01-31 09:07:31', NULL, NULL, NULL),
(2776, 33, 33, '/login', '2018-01-31 09:07:36', NULL, NULL, NULL),
(2777, 33, 33, '/', '2018-01-31 09:07:42', NULL, NULL, NULL),
(2778, 33, 33, '/product/2', '2018-01-31 09:07:43', NULL, NULL, NULL),
(2779, 33, 33, '/product/2', '2018-01-31 09:07:44', NULL, NULL, NULL),
(2780, 33, 33, '/product/2', '2018-01-31 09:23:34', NULL, NULL, NULL),
(2781, 33, 33, '/product/2', '2018-01-31 09:28:18', NULL, NULL, NULL),
(2782, 33, 33, '/product/2', '2018-01-31 09:28:53', NULL, NULL, NULL),
(2783, 33, 33, '/product/2', '2018-01-31 09:29:30', NULL, NULL, NULL),
(2784, 33, 33, '/product/2', '2018-01-31 09:30:11', NULL, NULL, NULL),
(2785, 33, 33, '/product/2', '2018-01-31 09:30:15', NULL, NULL, NULL),
(2786, 33, 33, '/product/2', '2018-01-31 09:30:28', NULL, NULL, NULL),
(2787, 33, 33, '/product/2', '2018-01-31 09:30:41', NULL, NULL, NULL),
(2788, 33, 33, '/product/2', '2018-01-31 09:35:28', NULL, NULL, NULL),
(2789, 33, 33, '/product/2', '2018-01-31 09:35:33', NULL, NULL, NULL),
(2790, 33, 33, '/product/2', '2018-01-31 09:35:53', NULL, NULL, NULL),
(2791, 33, 33, '/product/2', '2018-01-31 09:38:13', NULL, NULL, NULL),
(2792, 33, 33, '/product/2', '2018-01-31 09:38:18', NULL, NULL, NULL),
(2793, 33, 33, '/product/2', '2018-01-31 09:38:49', NULL, NULL, NULL),
(2794, 33, 33, '/product/2', '2018-01-31 09:39:05', NULL, NULL, NULL),
(2795, 33, 33, '/product/2', '2018-01-31 09:39:40', NULL, NULL, NULL),
(2796, 33, 33, '/product/2', '2018-01-31 09:41:14', NULL, NULL, NULL),
(2797, 33, 33, '/product/2', '2018-01-31 09:46:49', NULL, NULL, NULL),
(2798, 33, 33, '/product/2', '2018-01-31 09:46:52', NULL, NULL, NULL),
(2799, 33, 33, '/product/2', '2018-01-31 09:47:16', NULL, NULL, NULL),
(2800, 33, 33, '/product/2', '2018-01-31 09:47:44', NULL, NULL, NULL),
(2801, 33, 33, '/product/2', '2018-01-31 09:47:47', NULL, NULL, NULL),
(2802, 33, 33, '/product/2', '2018-01-31 09:48:33', NULL, NULL, NULL),
(2803, 33, 33, '/product/2', '2018-01-31 09:49:00', NULL, NULL, NULL),
(2804, 33, 33, '/product/2', '2018-01-31 09:49:04', NULL, NULL, NULL),
(2805, 33, 33, '/product/2', '2018-01-31 09:49:15', NULL, NULL, NULL),
(2806, 33, 33, '/product/2', '2018-01-31 09:49:15', NULL, NULL, NULL),
(2807, 33, 33, '/product/2', '2018-01-31 09:49:19', NULL, NULL, NULL),
(2808, 33, 33, '/product/2', '2018-01-31 09:49:46', NULL, NULL, NULL),
(2809, 33, 33, '/product/2', '2018-01-31 09:50:07', NULL, NULL, NULL),
(2810, 33, 33, '/product/2', '2018-01-31 09:50:20', NULL, NULL, NULL),
(2811, 33, 33, '/product/2', '2018-01-31 09:50:28', NULL, NULL, NULL),
(2812, 33, 33, '/product/2', '2018-01-31 09:52:28', NULL, NULL, NULL),
(2813, 33, 33, '/product/2', '2018-01-31 09:52:37', NULL, NULL, NULL),
(2814, 33, 33, '/admin', '2018-01-31 09:52:46', NULL, NULL, NULL),
(2815, 33, 33, '/admin', '2018-01-31 09:52:47', NULL, NULL, NULL),
(2816, 33, 33, '/product/2', '2018-01-31 09:52:52', NULL, NULL, NULL),
(2817, 33, 33, '/product/2', '2018-01-31 09:52:54', NULL, NULL, NULL),
(2818, 33, 33, '/admin', '2018-01-31 09:52:55', NULL, NULL, NULL),
(2819, 33, 33, '/product/2', '2018-01-31 09:53:06', NULL, NULL, NULL),
(2820, 33, 33, '/product/2', '2018-01-31 09:53:10', NULL, NULL, NULL),
(2821, 33, 33, '/product/2', '2018-01-31 09:53:11', NULL, NULL, NULL),
(2822, 33, 33, '/product/2', '2018-01-31 09:53:45', NULL, NULL, NULL),
(2823, 33, 33, '/product/2', '2018-01-31 09:55:55', NULL, NULL, NULL),
(2824, 33, 33, '/product/2', '2018-01-31 10:00:17', NULL, NULL, NULL),
(2825, 33, 33, '/product/2', '2018-01-31 10:00:27', NULL, NULL, NULL),
(2826, 33, 33, '/product/2', '2018-01-31 10:00:30', NULL, NULL, NULL),
(2827, 33, 33, '/product/2', '2018-01-31 10:00:42', NULL, NULL, NULL),
(2828, 33, 33, '/product/2', '2018-01-31 10:00:47', NULL, NULL, NULL),
(2829, 33, 33, '/product/2', '2018-01-31 10:00:58', NULL, NULL, NULL),
(2830, 33, 33, '/product/2', '2018-01-31 10:01:14', NULL, NULL, NULL),
(2831, 33, 33, '/product/2', '2018-01-31 10:01:36', NULL, NULL, NULL),
(2832, 33, 33, '/product/2', '2018-01-31 10:01:39', NULL, NULL, NULL),
(2833, 33, 33, '/product/2', '2018-01-31 10:01:55', NULL, NULL, NULL),
(2834, 33, 33, '/product/2', '2018-01-31 10:02:10', NULL, NULL, NULL),
(2835, 33, 33, '/product/2', '2018-01-31 10:02:38', NULL, NULL, NULL),
(2836, 33, 33, '/product/2', '2018-01-31 10:02:41', NULL, NULL, NULL),
(2837, 33, 33, '/product/2', '2018-01-31 10:02:46', NULL, NULL, NULL),
(2838, 33, 33, '/product/2', '2018-01-31 10:02:49', NULL, NULL, NULL),
(2839, 33, 33, '/product/2', '2018-01-31 10:04:36', NULL, NULL, NULL),
(2840, 33, 33, '/product/2', '2018-01-31 10:04:38', NULL, NULL, NULL),
(2841, 33, 33, '/product/2', '2018-01-31 10:05:01', NULL, NULL, NULL),
(2842, 33, 33, '/product/2', '2018-01-31 10:05:21', NULL, NULL, NULL),
(2843, 33, 33, '/product/2', '2018-01-31 10:05:24', NULL, NULL, NULL),
(2844, 33, 33, '/product/2', '2018-01-31 10:05:57', NULL, NULL, NULL),
(2845, 33, 33, '/product/2', '2018-01-31 10:06:47', NULL, NULL, NULL),
(2846, 33, 33, '/product/2', '2018-01-31 10:06:50', NULL, NULL, NULL),
(2847, 33, 33, '/product/2', '2018-01-31 10:06:59', NULL, NULL, NULL),
(2848, 33, 33, '/product/2', '2018-01-31 10:10:02', NULL, NULL, NULL),
(2849, 33, 33, '/product/2', '2018-01-31 10:10:06', NULL, NULL, NULL),
(2850, 33, 33, '/product/2', '2018-01-31 10:19:36', NULL, NULL, NULL),
(2851, 33, 33, '/product/2', '2018-01-31 10:19:40', NULL, NULL, NULL),
(2852, 33, 33, '/product/2', '2018-01-31 10:20:11', NULL, NULL, NULL),
(2853, 33, 33, '/product/2', '2018-01-31 10:20:15', NULL, NULL, NULL),
(2854, 33, 33, '/product/2', '2018-01-31 10:20:16', NULL, NULL, NULL),
(2855, 33, 33, '/product/2', '2018-01-31 10:21:06', NULL, NULL, NULL),
(2856, 33, 33, '/product/2', '2018-01-31 10:23:06', NULL, NULL, NULL),
(2857, 33, 33, '/product/2', '2018-01-31 10:23:37', NULL, NULL, NULL),
(2858, 33, 33, '/product/2', '2018-01-31 10:23:43', NULL, NULL, NULL),
(2859, 33, 33, '/product/2', '2018-01-31 10:23:50', NULL, NULL, NULL),
(2860, 33, 33, '/product/2', '2018-01-31 10:23:54', NULL, NULL, NULL),
(2861, 33, 33, '/product/2', '2018-01-31 10:24:17', NULL, NULL, NULL),
(2862, 33, 33, '/product/2', '2018-01-31 10:25:42', NULL, NULL, NULL),
(2863, 33, 33, '/product/2', '2018-01-31 10:26:47', NULL, NULL, NULL),
(2864, 33, 33, '/product/2', '2018-01-31 10:27:23', NULL, NULL, NULL),
(2865, 33, 33, '/product/2', '2018-01-31 10:27:41', NULL, NULL, NULL),
(2866, 33, 33, '/product/2', '2018-01-31 10:28:02', NULL, NULL, NULL),
(2867, 33, 33, '/product/2', '2018-01-31 10:28:13', NULL, NULL, NULL),
(2868, 33, 33, '/product/2', '2018-01-31 10:28:31', NULL, NULL, NULL),
(2869, 33, 33, '/product/2', '2018-01-31 10:28:46', NULL, NULL, NULL),
(2870, 33, 33, '/product/2', '2018-01-31 10:29:36', NULL, NULL, NULL),
(2871, 33, 33, '/product/2', '2018-01-31 10:29:56', NULL, NULL, NULL),
(2872, 33, 33, '/product/2', '2018-01-31 10:30:11', NULL, NULL, NULL),
(2873, 33, 33, '/product/2', '2018-01-31 10:30:26', NULL, NULL, NULL),
(2874, 33, 33, '/product/2', '2018-01-31 10:30:34', NULL, NULL, NULL),
(2875, 33, 33, '/product/2', '2018-01-31 10:32:47', NULL, NULL, NULL),
(2876, 33, 33, '/product/2', '2018-01-31 10:34:10', NULL, NULL, NULL),
(2877, 33, 33, '/product/2', '2018-01-31 10:34:35', NULL, NULL, NULL),
(2878, 33, 33, '/product/2', '2018-01-31 10:34:39', NULL, NULL, NULL),
(2879, 33, 33, '/product/2', '2018-01-31 10:35:01', NULL, NULL, NULL),
(2880, 33, 33, '/product/2', '2018-01-31 10:37:05', NULL, NULL, NULL),
(2881, 33, 33, '/product/2', '2018-01-31 10:37:08', NULL, NULL, NULL),
(2882, 33, 33, '/product/2', '2018-01-31 10:37:20', NULL, NULL, NULL),
(2883, 33, 33, '/product/2', '2018-01-31 10:37:24', NULL, NULL, NULL),
(2884, 33, 33, '/product/2', '2018-01-31 10:37:59', NULL, NULL, NULL),
(2885, 33, 33, '/product/2', '2018-01-31 10:38:02', NULL, NULL, NULL),
(2886, 33, 33, '/product/2', '2018-01-31 10:39:01', NULL, NULL, NULL),
(2887, 33, 33, '/product/2', '2018-01-31 10:40:27', NULL, NULL, NULL),
(2888, 33, 33, '/product/2', '2018-01-31 10:40:48', NULL, NULL, NULL),
(2889, 33, 33, '/product/2', '2018-01-31 10:46:58', NULL, NULL, NULL),
(2890, 33, 33, '/product/2', '2018-01-31 10:47:01', NULL, NULL, NULL),
(2891, 33, 33, '/product/2', '2018-01-31 10:47:45', NULL, NULL, NULL),
(2892, 33, 33, '/product/2', '2018-01-31 10:48:08', NULL, NULL, NULL),
(2893, 33, 33, '/product/2', '2018-01-31 10:48:17', NULL, NULL, NULL),
(2894, 33, 33, '/product/2', '2018-01-31 10:48:53', NULL, NULL, NULL),
(2895, 33, 33, '/product/2', '2018-01-31 10:50:51', NULL, NULL, NULL),
(2896, 33, 33, '/product/2', '2018-01-31 10:51:09', NULL, NULL, NULL),
(2897, 33, 33, '/product/2', '2018-01-31 10:51:11', NULL, NULL, NULL),
(2898, 33, 33, '/product/2', '2018-01-31 10:52:00', NULL, NULL, NULL),
(2899, 33, 33, '/shop-categories/3', '2018-01-31 10:52:59', NULL, NULL, NULL),
(2900, 33, 33, '/shop-categories/3', '2018-01-31 10:53:30', NULL, NULL, NULL),
(2901, 33, 33, '/shop-categories/3', '2018-01-31 10:53:30', NULL, NULL, NULL),
(2902, 33, 33, '/shop-categories/10', '2018-01-31 10:53:32', NULL, NULL, NULL),
(2903, 33, 33, '/shop-categories/10', '2018-01-31 10:53:34', NULL, NULL, NULL),
(2904, 33, 33, '/product/55', '2018-01-31 10:53:35', NULL, NULL, NULL),
(2905, 33, 33, '/product/55', '2018-01-31 10:53:38', NULL, NULL, NULL),
(2906, 33, 33, '/product/55', '2018-01-31 10:53:40', NULL, NULL, NULL),
(2907, 33, 33, '/product/55', '2018-01-31 10:56:19', NULL, NULL, NULL),
(2908, 33, 33, '/product/55', '2018-01-31 10:56:45', NULL, NULL, NULL),
(2909, 33, 33, '/product/55', '2018-01-31 10:56:53', NULL, NULL, NULL),
(2910, 33, 33, '/product/55', '2018-01-31 10:57:10', NULL, NULL, NULL),
(2911, 33, 33, '/product/55', '2018-01-31 10:57:17', NULL, NULL, NULL),
(2912, 33, 33, '/product/55', '2018-01-31 10:57:31', NULL, NULL, NULL),
(2913, 33, 33, '/product/55', '2018-01-31 10:58:39', NULL, NULL, NULL),
(2914, 33, 33, '/product/55', '2018-01-31 10:59:05', NULL, NULL, NULL),
(2915, 33, 33, '/product/55', '2018-01-31 11:00:08', NULL, NULL, NULL),
(2916, 33, 33, '/product/55', '2018-01-31 11:00:12', NULL, NULL, NULL),
(2917, 33, 33, '/product/55', '2018-01-31 11:02:51', NULL, NULL, NULL),
(2918, 33, 33, '/product/55', '2018-01-31 11:02:54', NULL, NULL, NULL),
(2919, 33, 33, '/product/55', '2018-01-31 11:03:08', NULL, NULL, NULL),
(2920, 33, 33, '/product/55', '2018-01-31 11:03:10', NULL, NULL, NULL),
(2921, 33, 33, '/product/55', '2018-01-31 11:03:34', NULL, NULL, NULL),
(2922, 33, 33, '/shop-categories/10', '2018-01-31 11:04:14', NULL, NULL, NULL),
(2923, 33, 33, '/product/55', '2018-01-31 11:05:28', NULL, NULL, NULL),
(2924, 33, 33, '/product/55', '2018-01-31 11:05:48', NULL, NULL, NULL),
(2925, 33, 33, '/product/55', '2018-01-31 11:05:52', NULL, NULL, NULL),
(2926, 33, 33, '/product/55', '2018-01-31 11:05:57', NULL, NULL, NULL),
(2927, 33, 33, '/product/55', '2018-01-31 11:06:01', NULL, NULL, NULL),
(2928, 33, 33, '/product/55', '2018-01-31 11:06:17', NULL, NULL, NULL),
(2929, 33, 33, '/product/55', '2018-01-31 11:06:57', NULL, NULL, NULL),
(2930, 33, 33, '/product/55', '2018-01-31 11:07:06', NULL, NULL, NULL),
(2931, 33, 33, '/product/55', '2018-01-31 11:07:39', NULL, NULL, NULL),
(2932, 33, 33, '/product/55', '2018-01-31 11:07:40', NULL, NULL, NULL),
(2933, 33, 33, '/shop-categories/10', '2018-01-31 11:07:41', NULL, NULL, NULL),
(2934, 33, 33, '/shop-categories/10', '2018-01-31 11:07:47', NULL, NULL, NULL),
(2935, 33, 33, '/shop-categories/10', '2018-01-31 11:07:52', NULL, NULL, NULL),
(2936, 33, 33, '/product/55', '2018-01-31 11:08:01', NULL, NULL, NULL),
(2937, 33, 33, '/shop-categories/5', '2018-01-31 11:08:09', NULL, NULL, NULL),
(2938, 33, 33, '/shop-categories/5', '2018-01-31 11:08:10', NULL, NULL, NULL),
(2939, 33, 33, '/shop-categories/5', '2018-01-31 11:08:12', NULL, NULL, NULL),
(2940, 33, 33, '/shop-categories/5', '2018-01-31 11:08:14', NULL, NULL, NULL),
(2941, 33, 33, '/shop-categories/5', '2018-01-31 11:08:36', NULL, NULL, NULL),
(2942, 33, 33, '/shop-categories/5', '2018-01-31 11:08:40', NULL, NULL, NULL),
(2943, 33, 33, '/shop-categories/5', '2018-01-31 11:09:06', NULL, NULL, NULL),
(2944, 33, 33, '/shop-categories/2', '2018-01-31 11:09:58', NULL, NULL, NULL),
(2945, 33, 33, '/shop-categories/3', '2018-01-31 11:09:59', NULL, NULL, NULL),
(2946, 33, 33, '/shop-categories/10', '2018-01-31 11:10:00', NULL, NULL, NULL),
(2947, 33, 33, '/product/55', '2018-01-31 11:10:01', NULL, NULL, NULL),
(2948, 33, 33, '/shop-categories/10', '2018-01-31 11:11:32', NULL, NULL, NULL),
(2949, 33, 33, '/shop-categories/4', '2018-01-31 11:11:34', NULL, NULL, NULL),
(2950, 33, 33, '/shop-categories/4', '2018-01-31 11:11:36', NULL, NULL, NULL),
(2951, 33, 33, '/shop-categories/4', '2018-01-31 11:11:37', NULL, NULL, NULL),
(2952, 33, 33, '/shop-categories/45', '2018-01-31 11:11:38', NULL, NULL, NULL),
(2953, 33, 33, '/shop-categories/45', '2018-01-31 11:11:39', NULL, NULL, NULL),
(2954, 33, 33, '/shop-categories/46', '2018-01-31 11:11:39', NULL, NULL, NULL),
(2955, 33, 33, '/shop-categories/46', '2018-01-31 11:11:40', NULL, NULL, NULL),
(2956, 33, 33, '/shop-categories/46', '2018-01-31 11:11:41', NULL, NULL, NULL),
(2957, 33, 33, '/shop-categories/47', '2018-01-31 11:11:42', NULL, NULL, NULL),
(2958, 33, 33, '/shop-categories/47', '2018-01-31 11:11:43', NULL, NULL, NULL),
(2959, 33, 33, '/shop-categories/4', '2018-01-31 11:11:44', NULL, NULL, NULL),
(2960, 33, 33, '/shop-categories/46', '2018-01-31 11:11:46', NULL, NULL, NULL),
(2961, 33, 33, '/shop-categories/47', '2018-01-31 11:11:47', NULL, NULL, NULL),
(2962, 33, 33, '/shop-categories/46', '2018-01-31 11:11:49', NULL, NULL, NULL),
(2963, 33, 33, '/shop-categories/45', '2018-01-31 11:11:49', NULL, NULL, NULL),
(2964, 33, 33, '/shop-categories/47', '2018-01-31 11:11:51', NULL, NULL, NULL),
(2965, 33, 33, '/shop-categories/46', '2018-01-31 11:11:52', NULL, NULL, NULL),
(2966, 33, 33, '/shop-categories/47', '2018-01-31 11:11:54', NULL, NULL, NULL),
(2967, 33, 33, '/shop-categories/47', '2018-01-31 11:11:56', NULL, NULL, NULL),
(2968, 33, 33, '/product/56', '2018-01-31 11:11:57', NULL, NULL, NULL),
(2969, 33, 33, '/product/56', '2018-01-31 11:11:58', NULL, NULL, NULL),
(2970, 33, 33, '/product/56', '2018-01-31 11:14:06', NULL, NULL, NULL),
(2971, 33, 33, '/product/56', '2018-01-31 11:14:12', NULL, NULL, NULL),
(2972, 33, 33, '/product/56', '2018-01-31 11:14:44', NULL, NULL, NULL),
(2973, 33, 33, '/company', '2018-01-31 11:14:45', NULL, NULL, NULL),
(2974, 33, 33, '/product/56', '2018-01-31 11:14:56', NULL, NULL, NULL),
(2975, 33, 33, '/product/56', '2018-01-31 11:15:39', NULL, NULL, NULL),
(2976, 33, 33, '/product/56', '2018-01-31 11:17:15', NULL, NULL, NULL),
(2977, 33, 33, '/product/56', '2018-01-31 11:21:59', NULL, NULL, NULL),
(2978, 33, 33, '/shop-categories/4', '2018-01-31 11:22:09', NULL, NULL, NULL),
(2979, 33, 33, '/shop-categories/4', '2018-01-31 11:22:52', NULL, NULL, NULL),
(2980, 33, 33, '/shop-categories/4', '2018-01-31 11:22:53', NULL, NULL, NULL),
(2981, 33, 33, '/shop-categories/4', '2018-01-31 11:22:54', NULL, NULL, NULL),
(2982, 33, 33, '/shop-categories/4', '2018-01-31 11:23:02', NULL, NULL, NULL),
(2983, 33, 33, '/shop-categories/46', '2018-01-31 11:23:02', NULL, NULL, NULL),
(2984, 33, 33, '/shop-categories/47', '2018-01-31 11:23:03', NULL, NULL, NULL),
(2985, 33, 33, '/product/56', '2018-01-31 11:23:04', NULL, NULL, NULL),
(2986, 33, 33, '/shop-categories/8', '2018-01-31 11:23:06', NULL, NULL, NULL),
(2987, 33, 33, '/shop-categories/5', '2018-01-31 11:23:07', NULL, NULL, NULL),
(2988, 33, 33, '/shop-categories/5', '2018-01-31 11:23:24', NULL, NULL, NULL),
(2989, 33, 33, '/shop-categories/2', '2018-01-31 11:23:24', NULL, NULL, NULL),
(2990, 33, 33, '/shop-categories/47', '2018-01-31 11:23:25', NULL, NULL, NULL),
(2991, 33, 33, '/product/56', '2018-01-31 11:23:27', NULL, NULL, NULL),
(2992, 33, 33, '/product/56', '2018-01-31 11:32:13', NULL, NULL, NULL),
(2993, 33, 33, '/product/56', '2018-01-31 11:32:15', NULL, NULL, NULL),
(2994, 33, 33, '/product/56', '2018-01-31 11:32:15', NULL, NULL, NULL),
(2995, 33, 33, '/product/56', '2018-01-31 11:32:23', NULL, NULL, NULL),
(2996, 33, 33, '/product/56', '2018-01-31 11:33:56', NULL, NULL, NULL),
(2997, 33, 33, '/product/56', '2018-01-31 11:34:04', NULL, NULL, NULL),
(2998, 33, 33, '/shop-categories/46', '2018-01-31 11:34:08', NULL, NULL, NULL),
(2999, 33, 33, '/shop-categories/46', '2018-01-31 11:34:09', NULL, NULL, NULL),
(3000, 33, 33, '/shop-categories/5', '2018-01-31 11:34:11', NULL, NULL, NULL),
(3001, 33, 33, '/shop-categories/5', '2018-01-31 11:34:13', NULL, NULL, NULL),
(3002, 33, 33, '/shop-categories/48', '2018-01-31 11:34:16', NULL, NULL, NULL),
(3003, 33, 33, '/shop-categories/48', '2018-01-31 11:34:17', NULL, NULL, NULL),
(3004, 33, 33, '/product/57', '2018-01-31 11:34:18', NULL, NULL, NULL),
(3005, 33, 33, '/product/57', '2018-01-31 11:35:13', NULL, NULL, NULL),
(3006, 33, 33, '/product/57', '2018-01-31 11:35:20', NULL, NULL, NULL),
(3007, 33, 33, '/shop-categories/47', '2018-01-31 11:35:22', NULL, NULL, NULL),
(3008, 33, 33, '/product/56', '2018-01-31 11:35:22', NULL, NULL, NULL),
(3009, 33, 33, '/product/56', '2018-01-31 11:37:12', NULL, NULL, NULL),
(3010, 33, 33, '/product/56', '2018-01-31 11:39:01', NULL, NULL, NULL),
(3011, 33, 33, '/product/56', '2018-01-31 11:39:20', NULL, NULL, NULL),
(3012, 33, 33, '/product/56', '2018-01-31 11:39:36', NULL, NULL, NULL),
(3013, 33, 33, '/product/56', '2018-01-31 11:39:41', NULL, NULL, NULL),
(3014, 33, 33, '/product/56', '2018-01-31 11:39:46', NULL, NULL, NULL),
(3015, 33, 33, '/shop-categories/10', '2018-01-31 11:39:57', NULL, NULL, NULL),
(3016, 33, 33, '/product/55', '2018-01-31 11:39:58', NULL, NULL, NULL),
(3017, 33, 33, '/product/55', '2018-01-31 11:41:57', NULL, NULL, NULL),
(3018, 33, 33, '/product/55', '2018-01-31 11:42:01', NULL, NULL, NULL),
(3019, 33, 33, '/shop-categories/3', '2018-01-31 11:42:37', NULL, NULL, NULL),
(3020, 33, 33, '/product/55', '2018-01-31 11:42:47', NULL, NULL, NULL),
(3021, 33, 33, '/shop-categories/47', '2018-01-31 11:43:22', NULL, NULL, NULL),
(3022, 33, 33, '/product/56', '2018-01-31 11:43:22', NULL, NULL, NULL),
(3023, 33, 33, '/product/56', '2018-01-31 11:43:38', NULL, NULL, NULL),
(3024, 33, 33, '/product/56', '2018-01-31 11:43:45', NULL, NULL, NULL),
(3025, 33, 33, '/product/56', '2018-01-31 11:43:47', NULL, NULL, NULL),
(3026, 33, 33, '/product/56', '2018-01-31 11:44:30', NULL, NULL, NULL),
(3027, 33, 33, '/product/56', '2018-01-31 11:44:39', NULL, NULL, NULL),
(3028, 33, 33, '/product/56', '2018-01-31 11:44:43', NULL, NULL, NULL),
(3029, 33, 33, '/product/56', '2018-01-31 11:46:02', NULL, NULL, NULL),
(3030, 33, 33, '/product/56', '2018-01-31 11:46:25', NULL, NULL, NULL),
(3031, 33, 33, '/shop-categories/45', '2018-01-31 11:46:29', NULL, NULL, NULL),
(3032, 33, 33, '/shop-categories/46', '2018-01-31 11:46:29', NULL, NULL, NULL),
(3033, 33, 33, '/shop-categories/47', '2018-01-31 11:46:30', NULL, NULL, NULL),
(3034, 33, 33, '/product/56', '2018-01-31 11:46:41', NULL, NULL, NULL),
(3035, 33, 33, '/product/56', '2018-01-31 11:46:51', NULL, NULL, NULL),
(3036, 33, 33, '/product/56', '2018-01-31 11:47:00', NULL, NULL, NULL),
(3037, 33, 33, '/product/56', '2018-01-31 11:47:06', NULL, NULL, NULL),
(3038, 33, 33, '/product/56', '2018-01-31 11:47:13', NULL, NULL, NULL),
(3039, 33, 33, '/product/56', '2018-01-31 11:47:40', NULL, NULL, NULL),
(3040, 33, 33, '/product/56', '2018-01-31 11:47:58', NULL, NULL, NULL),
(3041, 33, 33, '/product/56', '2018-01-31 11:48:08', NULL, NULL, NULL),
(3042, 33, 33, '/product/56', '2018-01-31 11:48:16', NULL, NULL, NULL),
(3043, 33, 33, '/product/56', '2018-01-31 11:48:43', NULL, NULL, NULL),
(3044, 33, 33, '/product/56', '2018-01-31 12:00:05', NULL, NULL, NULL),
(3045, 33, 33, '/product/55', '2018-01-31 12:01:00', NULL, NULL, NULL),
(3046, 33, 33, '/shop-categories/47', '2018-01-31 12:02:42', NULL, NULL, NULL),
(3047, 33, 33, '/product/56', '2018-01-31 12:02:54', NULL, NULL, NULL),
(3048, 33, 33, '/product/56', '2018-01-31 12:07:50', NULL, NULL, NULL),
(3049, 33, 33, '/product/56', '2018-01-31 12:09:58', NULL, NULL, NULL),
(3050, 33, 33, '/product/56', '2018-01-31 12:09:59', NULL, NULL, NULL),
(3051, 33, 33, '/product/56', '2018-01-31 12:10:01', NULL, NULL, NULL),
(3052, 33, 33, '/product/56', '2018-01-31 12:10:02', NULL, NULL, NULL),
(3053, 33, 33, '/product/56', '2018-01-31 12:10:08', NULL, NULL, NULL),
(3054, 33, 33, '/product/56', '2018-01-31 12:10:10', NULL, NULL, NULL),
(3055, 33, 33, '/shop-categories/10', '2018-01-31 12:10:42', NULL, NULL, NULL),
(3056, 33, 33, '/shop-categories/3', '2018-01-31 12:10:42', NULL, NULL, NULL),
(3057, 33, 33, '/shop-categories/47', '2018-01-31 12:17:19', NULL, NULL, NULL),
(3058, 33, 33, '/product/56', '2018-01-31 12:17:20', NULL, NULL, NULL),
(3059, 33, 33, '/product/56', '2018-01-31 12:40:43', NULL, NULL, NULL),
(3060, 33, 33, '/product/56', '2018-01-31 12:40:55', NULL, NULL, NULL),
(3061, 33, 33, '/product/56', '2018-01-31 12:40:58', NULL, NULL, NULL),
(3062, 34, 34, '/', '2018-02-01 05:45:48', NULL, NULL, NULL),
(3063, 34, 34, '/shop', '2018-02-01 05:45:50', NULL, NULL, NULL),
(3064, 34, 34, '/shop-categories/2', '2018-02-01 05:45:52', NULL, NULL, NULL),
(3065, 34, 34, '/shop-categories/2', '2018-02-01 05:45:53', NULL, NULL, NULL),
(3066, 34, 34, '/shop-categories/47', '2018-02-01 05:45:54', NULL, NULL, NULL),
(3067, 34, 34, '/shop-categories/46', '2018-02-01 05:45:55', NULL, NULL, NULL),
(3068, 34, 34, '/shop-categories/47', '2018-02-01 05:45:55', NULL, NULL, NULL),
(3069, 34, 34, '/product/56', '2018-02-01 05:45:56', NULL, NULL, NULL),
(3070, 34, 34, '/login', '2018-02-01 05:46:02', NULL, NULL, NULL),
(3071, 34, 34, '/', '2018-02-01 05:46:06', NULL, NULL, NULL),
(3072, 34, 34, '/product/56', '2018-02-01 05:46:07', NULL, NULL, NULL),
(3073, 34, 34, '/product/56', '2018-02-01 05:46:08', NULL, NULL, NULL),
(3074, 34, 34, '/product/56', '2018-02-01 05:46:12', NULL, NULL, NULL),
(3075, 34, 34, '/product/56', '2018-02-01 05:46:12', NULL, NULL, NULL),
(3076, 34, 34, '/product/56', '2018-02-01 05:46:32', NULL, NULL, NULL),
(3077, 34, 34, '/product/56', '2018-02-01 05:46:34', NULL, NULL, NULL),
(3078, 34, 34, '/product/56', '2018-02-01 05:46:38', NULL, NULL, NULL),
(3079, 34, 34, '/product/56', '2018-02-01 05:46:44', NULL, NULL, NULL),
(3080, 34, 34, '/product/56', '2018-02-01 05:46:46', NULL, NULL, NULL),
(3081, 34, 34, '/product/56', '2018-02-01 05:46:48', NULL, NULL, NULL),
(3082, 34, 34, '/product/56', '2018-02-01 05:46:50', NULL, NULL, NULL),
(3083, 34, 34, '/product/56', '2018-02-01 05:46:52', NULL, NULL, NULL),
(3084, 34, 34, '/product/56', '2018-02-01 06:25:56', NULL, NULL, NULL),
(3085, 34, 34, '/product/56', '2018-02-01 06:27:36', NULL, NULL, NULL),
(3086, 34, 34, '/product/56', '2018-02-01 06:27:51', NULL, NULL, NULL),
(3087, 34, 34, '/product/56', '2018-02-01 06:28:42', NULL, NULL, NULL),
(3088, 34, 34, '/product/56', '2018-02-01 06:32:51', NULL, NULL, NULL),
(3089, 34, 34, '/product/56', '2018-02-01 06:32:57', NULL, NULL, NULL),
(3090, 34, 34, '/product/56', '2018-02-01 06:33:00', NULL, NULL, NULL),
(3091, 34, 34, '/product/56', '2018-02-01 06:33:16', NULL, NULL, NULL),
(3092, 34, 34, '/product/56', '2018-02-01 06:33:31', NULL, NULL, NULL),
(3093, 34, 34, '/product/56', '2018-02-01 06:34:33', NULL, NULL, NULL),
(3094, 34, 34, '/product/56', '2018-02-01 06:35:07', NULL, NULL, NULL),
(3095, 34, 34, '/product/56', '2018-02-01 06:35:23', NULL, NULL, NULL),
(3096, 34, 34, '/product/56', '2018-02-01 06:36:04', NULL, NULL, NULL),
(3097, 34, 34, '/product/56', '2018-02-01 06:38:35', NULL, NULL, NULL),
(3098, 34, 34, '/product/56', '2018-02-01 06:38:59', NULL, NULL, NULL),
(3099, 34, 34, '/product/56', '2018-02-01 06:41:13', NULL, NULL, NULL),
(3100, 34, 34, '/product/56', '2018-02-01 06:43:00', NULL, NULL, NULL),
(3101, 34, 34, '/product/56', '2018-02-01 06:45:51', NULL, NULL, NULL),
(3102, 34, 34, '/product/56', '2018-02-01 06:45:52', NULL, NULL, NULL),
(3103, 34, 34, '/product/56', '2018-02-01 06:46:05', NULL, NULL, NULL),
(3104, 34, 34, '/product/56', '2018-02-01 06:46:12', NULL, NULL, NULL),
(3105, 34, 34, '/product/56', '2018-02-01 06:46:13', NULL, NULL, NULL),
(3106, 34, 34, '/product/56', '2018-02-01 06:46:46', NULL, NULL, NULL),
(3107, 34, 34, '/product/56', '2018-02-01 06:47:05', NULL, NULL, NULL),
(3108, 34, 34, '/product/56', '2018-02-01 06:48:02', NULL, NULL, NULL),
(3109, 34, 34, '/product/56', '2018-02-01 06:50:41', NULL, NULL, NULL),
(3110, 35, 35, '/product/56', '2018-02-01 06:55:54', NULL, NULL, NULL),
(3111, 35, 35, '/product/56', '2018-02-01 06:58:54', NULL, NULL, NULL),
(3112, 35, 35, '/product/56', '2018-02-01 07:00:06', NULL, NULL, NULL),
(3113, 35, 35, '/product/56', '2018-02-01 07:05:36', NULL, NULL, NULL),
(3114, 35, 35, '/product/56', '2018-02-01 07:05:40', NULL, NULL, NULL),
(3115, 35, 35, '/product/56', '2018-02-01 07:06:18', NULL, NULL, NULL),
(3116, 35, 35, '/product/56', '2018-02-01 07:06:38', NULL, NULL, NULL),
(3117, 35, 35, '/product/56', '2018-02-01 07:06:54', NULL, NULL, NULL),
(3118, 35, 35, '/product/56', '2018-02-01 07:07:10', NULL, NULL, NULL),
(3119, 35, 35, '/product/56', '2018-02-01 07:07:48', NULL, NULL, NULL),
(3120, 35, 35, '/product/56', '2018-02-01 07:09:55', NULL, NULL, NULL),
(3121, 35, 35, '/product/56', '2018-02-01 07:10:21', NULL, NULL, NULL),
(3122, 35, 35, '/product/56', '2018-02-01 07:11:39', NULL, NULL, NULL),
(3123, 35, 35, '/product/56', '2018-02-01 07:11:50', NULL, NULL, NULL),
(3124, 35, 35, '/product/56', '2018-02-01 07:16:58', NULL, NULL, NULL),
(3125, 35, 35, '/product/56', '2018-02-01 07:53:41', NULL, NULL, NULL),
(3126, 35, 35, '/shop-categories/2', '2018-02-01 07:54:59', NULL, NULL, NULL),
(3127, 35, 35, '/shop-categories/3', '2018-02-01 07:55:01', NULL, NULL, NULL),
(3128, 35, 35, '/shop-categories/10', '2018-02-01 07:55:01', NULL, NULL, NULL),
(3129, 35, 35, '/product/55', '2018-02-01 07:55:02', NULL, NULL, NULL),
(3130, 35, 35, '/product/55', '2018-02-01 08:05:23', NULL, NULL, NULL),
(3131, 35, 35, '/login', '2018-02-01 08:05:47', NULL, NULL, NULL),
(3132, 35, 35, '/', '2018-02-01 08:05:52', NULL, NULL, NULL),
(3133, 35, 35, '/admin', '2018-02-01 08:05:54', NULL, NULL, NULL),
(3134, 35, 35, '/admin-routes', '2018-02-01 08:05:55', NULL, NULL, NULL),
(3135, 35, 35, '/admin-routes', '2018-02-01 08:06:28', NULL, NULL, NULL),
(3136, 35, 35, '/admin-routes', '2018-02-01 08:13:30', NULL, NULL, NULL),
(3137, 35, 35, '/product/55', '2018-02-01 08:13:32', NULL, NULL, NULL),
(3138, 35, 35, '/product/55', '2018-02-01 08:16:38', NULL, NULL, NULL),
(3139, 35, 35, '/cart', '2018-02-01 08:16:56', NULL, NULL, NULL),
(3140, 35, 35, '/cart', '2018-02-01 08:19:04', NULL, NULL, NULL),
(3141, 35, 35, '/cart', '2018-02-01 08:19:07', NULL, NULL, NULL),
(3142, 35, 35, '/cart', '2018-02-01 08:20:50', NULL, NULL, NULL),
(3143, 35, 35, '/cart', '2018-02-01 08:20:51', NULL, NULL, NULL),
(3144, 35, 35, '/cart', '2018-02-01 08:21:09', NULL, NULL, NULL),
(3145, 35, 35, '/cart', '2018-02-01 08:21:10', NULL, NULL, NULL),
(3146, 35, 35, '/cart', '2018-02-01 08:21:57', NULL, NULL, NULL),
(3147, 35, 35, '/cart', '2018-02-01 08:22:14', NULL, NULL, NULL),
(3148, 35, 35, '/cart', '2018-02-01 08:22:15', NULL, NULL, NULL),
(3149, 35, 35, '/cart', '2018-02-01 08:22:32', NULL, NULL, NULL),
(3150, 35, 35, '/cart', '2018-02-01 08:22:39', NULL, NULL, NULL),
(3151, 35, 35, '/cart', '2018-02-01 08:22:49', NULL, NULL, NULL),
(3152, 35, 35, '/cart', '2018-02-01 08:23:19', NULL, NULL, NULL),
(3153, 35, 35, '/cart', '2018-02-01 08:23:38', NULL, NULL, NULL),
(3154, 35, 35, '/cart', '2018-02-01 08:23:38', NULL, NULL, NULL),
(3155, 35, 35, '/cart', '2018-02-01 08:25:57', NULL, NULL, NULL),
(3156, 35, 35, '/cart', '2018-02-01 08:26:08', NULL, NULL, NULL),
(3157, 35, 35, '/cart', '2018-02-01 08:26:16', NULL, NULL, NULL),
(3158, 35, 35, '/cart', '2018-02-01 08:35:46', NULL, NULL, NULL),
(3159, 35, 35, '/cart', '2018-02-01 08:37:02', NULL, NULL, NULL),
(3160, 35, 35, '/cart', '2018-02-01 08:37:58', NULL, NULL, NULL),
(3161, 35, 35, '/cart', '2018-02-01 08:40:10', NULL, NULL, NULL),
(3162, 35, 35, '/cart', '2018-02-01 08:41:05', NULL, NULL, NULL),
(3163, 35, 35, '/cart', '2018-02-01 08:42:31', NULL, NULL, NULL),
(3164, 35, 35, '/cart', '2018-02-01 09:01:01', NULL, NULL, NULL),
(3165, 35, 35, '/cart', '2018-02-01 09:01:34', NULL, NULL, NULL),
(3166, 35, 35, '/cart', '2018-02-01 09:01:48', NULL, NULL, NULL),
(3167, 35, 35, '/cart', '2018-02-01 09:03:54', NULL, NULL, NULL),
(3168, 35, 35, '/cart', '2018-02-01 09:05:49', NULL, NULL, NULL),
(3169, 35, 35, '/cart', '2018-02-01 09:07:02', NULL, NULL, NULL),
(3170, 35, 35, '/cart', '2018-02-01 09:08:05', NULL, NULL, NULL),
(3171, 35, 35, '/cart', '2018-02-01 09:08:20', NULL, NULL, NULL),
(3172, 35, 35, '/cart', '2018-02-01 09:08:40', NULL, NULL, NULL),
(3173, 35, 35, '/cart', '2018-02-01 09:08:43', NULL, NULL, NULL),
(3174, 35, 35, '/cart', '2018-02-01 09:10:04', NULL, NULL, NULL),
(3175, 35, 35, '/cart', '2018-02-01 09:10:31', NULL, NULL, NULL),
(3176, 35, 35, '/cart', '2018-02-01 09:11:26', NULL, NULL, NULL),
(3177, 35, 35, '/cart', '2018-02-01 09:11:37', NULL, NULL, NULL),
(3178, 35, 35, '/cart', '2018-02-01 09:13:04', NULL, NULL, NULL),
(3179, 35, 35, '/cart', '2018-02-01 09:13:43', NULL, NULL, NULL),
(3180, 35, 35, '/cart', '2018-02-01 09:16:41', NULL, NULL, NULL),
(3181, 35, 35, '/cart', '2018-02-01 09:17:17', NULL, NULL, NULL),
(3182, 35, 35, '/cart', '2018-02-01 09:19:51', NULL, NULL, NULL),
(3183, 35, 35, '/cart', '2018-02-01 09:21:20', NULL, NULL, NULL),
(3184, 35, 35, '/cart', '2018-02-01 09:22:07', NULL, NULL, NULL),
(3185, 35, 35, '/cart', '2018-02-01 09:24:50', NULL, NULL, NULL),
(3186, 35, 35, '/cart', '2018-02-01 09:25:42', NULL, NULL, NULL),
(3187, 35, 35, '/cart', '2018-02-01 09:35:33', NULL, NULL, NULL);
INSERT INTO `views` (`id`, `visit_id`, `visitor_id`, `path`, `created`, `updated`, `activated`, `closed`) VALUES
(3188, 35, 35, '/cart', '2018-02-01 09:40:39', NULL, NULL, NULL),
(3189, 35, 35, '/cart', '2018-02-01 09:40:59', NULL, NULL, NULL),
(3190, 35, 35, '/cart', '2018-02-01 09:41:01', NULL, NULL, NULL),
(3191, 35, 35, '/product/55', '2018-02-01 09:41:04', NULL, NULL, NULL),
(3192, 35, 35, '/product/55', '2018-02-01 09:41:29', NULL, NULL, NULL),
(3193, 35, 35, '/cart', '2018-02-01 09:41:31', NULL, NULL, NULL),
(3194, 35, 35, '/cart', '2018-02-01 09:41:55', NULL, NULL, NULL),
(3195, 35, 35, '/cart', '2018-02-01 09:41:59', NULL, NULL, NULL),
(3196, 35, 35, '/cart', '2018-02-01 09:42:28', NULL, NULL, NULL),
(3197, 35, 35, '/cart', '2018-02-01 09:42:35', NULL, NULL, NULL),
(3198, 35, 35, '/cart', '2018-02-01 09:47:51', NULL, NULL, NULL),
(3199, 35, 35, '/cart', '2018-02-01 09:47:51', NULL, NULL, NULL),
(3200, 35, 35, '/cart', '2018-02-01 09:48:50', NULL, NULL, NULL),
(3201, 35, 35, '/cart', '2018-02-01 09:48:51', NULL, NULL, NULL),
(3202, 35, 35, '/cart', '2018-02-01 09:49:25', NULL, NULL, NULL),
(3203, 35, 35, '/cart', '2018-02-01 09:50:17', NULL, NULL, NULL),
(3204, 35, 35, '/cart', '2018-02-01 09:50:32', NULL, NULL, NULL),
(3205, 35, 35, '/cart', '2018-02-01 09:50:41', NULL, NULL, NULL),
(3206, 35, 35, '/cart', '2018-02-01 09:51:08', NULL, NULL, NULL),
(3207, 35, 35, '/cart', '2018-02-01 09:51:14', NULL, NULL, NULL),
(3208, 35, 35, '/cart', '2018-02-01 09:52:23', NULL, NULL, NULL),
(3209, 35, 35, '/cart', '2018-02-01 09:52:24', NULL, NULL, NULL),
(3210, 35, 35, '/cart', '2018-02-01 09:52:51', NULL, NULL, NULL),
(3211, 35, 35, '/cart', '2018-02-01 09:53:05', NULL, NULL, NULL),
(3212, 35, 35, '/shop-categories/47', '2018-02-01 09:53:13', NULL, NULL, NULL),
(3213, 35, 35, '/product/56', '2018-02-01 09:53:14', NULL, NULL, NULL),
(3214, 35, 35, '/product/56', '2018-02-01 09:53:15', NULL, NULL, NULL),
(3215, 35, 35, '/product/56', '2018-02-01 09:53:30', NULL, NULL, NULL),
(3216, 35, 35, '/cart', '2018-02-01 09:53:32', NULL, NULL, NULL),
(3217, 35, 35, '/product/56', '2018-02-01 09:53:36', NULL, NULL, NULL),
(3218, 35, 35, '/cart', '2018-02-01 09:53:37', NULL, NULL, NULL),
(3219, 35, 35, '/cart', '2018-02-01 09:55:01', NULL, NULL, NULL),
(3220, 35, 35, '/cart', '2018-02-01 09:55:05', NULL, NULL, NULL),
(3221, 35, 35, '/cart', '2018-02-01 09:55:09', NULL, NULL, NULL),
(3222, 35, 35, '/cart', '2018-02-01 09:57:09', NULL, NULL, NULL),
(3223, 35, 35, '/cart', '2018-02-01 09:58:12', NULL, NULL, NULL),
(3224, 35, 35, '/product/56', '2018-02-01 09:58:15', NULL, NULL, NULL),
(3225, 35, 35, '/product/56', '2018-02-01 09:58:21', NULL, NULL, NULL),
(3226, 35, 35, '/cart', '2018-02-01 09:58:25', NULL, NULL, NULL),
(3227, 35, 35, '/cart', '2018-02-01 10:01:52', NULL, NULL, NULL),
(3228, 35, 35, '/cart', '2018-02-01 10:01:55', NULL, NULL, NULL),
(3229, 35, 35, '/cart', '2018-02-01 10:01:58', NULL, NULL, NULL),
(3230, 35, 35, '/cart', '2018-02-01 10:01:58', NULL, NULL, NULL),
(3231, 35, 35, '/cart', '2018-02-01 10:02:14', NULL, NULL, NULL),
(3232, 35, 35, '/cart', '2018-02-01 10:02:15', NULL, NULL, NULL),
(3233, 35, 35, '/cart', '2018-02-01 10:02:23', NULL, NULL, NULL),
(3234, 35, 35, '/cart', '2018-02-01 10:02:50', NULL, NULL, NULL),
(3235, 35, 35, '/cart', '2018-02-01 10:02:50', NULL, NULL, NULL),
(3236, 35, 35, '/cart', '2018-02-01 10:03:10', NULL, NULL, NULL),
(3237, 35, 35, '/cart', '2018-02-01 10:03:11', NULL, NULL, NULL),
(3238, 35, 35, '/cart', '2018-02-01 10:03:24', NULL, NULL, NULL),
(3239, 35, 35, '/cart', '2018-02-01 10:03:25', NULL, NULL, NULL),
(3240, 35, 35, '/cart', '2018-02-01 10:03:27', NULL, NULL, NULL),
(3241, 35, 35, '/cart', '2018-02-01 10:03:42', NULL, NULL, NULL),
(3242, 35, 35, '/cart', '2018-02-01 10:03:43', NULL, NULL, NULL),
(3243, 35, 35, '/cart', '2018-02-01 10:04:15', NULL, NULL, NULL),
(3244, 35, 35, '/cart', '2018-02-01 10:04:17', NULL, NULL, NULL),
(3245, 35, 35, '/cart', '2018-02-01 10:04:18', NULL, NULL, NULL),
(3246, 35, 35, '/cart', '2018-02-01 10:04:19', NULL, NULL, NULL),
(3247, 35, 35, '/cart', '2018-02-01 10:04:19', NULL, NULL, NULL),
(3248, 35, 35, '/product/56', '2018-02-01 10:05:14', NULL, NULL, NULL),
(3249, 35, 35, '/cart', '2018-02-01 10:05:15', NULL, NULL, NULL),
(3250, 35, 35, '/product/56', '2018-02-01 10:05:17', NULL, NULL, NULL),
(3251, 35, 35, '/cart', '2018-02-01 10:05:53', NULL, NULL, NULL),
(3252, 35, 35, '/cart', '2018-02-01 10:06:11', NULL, NULL, NULL),
(3253, 35, 35, '/shop-categories/2', '2018-02-01 10:06:14', NULL, NULL, NULL),
(3254, 35, 35, '/shop-categories/3', '2018-02-01 10:06:15', NULL, NULL, NULL),
(3255, 35, 35, '/shop-categories/10', '2018-02-01 10:06:15', NULL, NULL, NULL),
(3256, 35, 35, '/shop-categories/4', '2018-02-01 10:06:16', NULL, NULL, NULL),
(3257, 35, 35, '/shop-categories/10', '2018-02-01 10:06:16', NULL, NULL, NULL),
(3258, 35, 35, '/product/55', '2018-02-01 10:06:17', NULL, NULL, NULL),
(3259, 35, 35, '/cart', '2018-02-01 10:06:19', NULL, NULL, NULL),
(3260, 35, 35, '/cart', '2018-02-01 10:06:22', NULL, NULL, NULL),
(3261, 35, 35, '/cart', '2018-02-01 10:06:27', NULL, NULL, NULL),
(3262, 35, 35, '/cart', '2018-02-01 10:07:31', NULL, NULL, NULL),
(3263, 35, 35, '/cart', '2018-02-01 10:07:37', NULL, NULL, NULL),
(3264, 35, 35, '/cart', '2018-02-01 10:07:53', NULL, NULL, NULL),
(3265, 35, 35, '/cart', '2018-02-01 10:07:53', NULL, NULL, NULL),
(3266, 35, 35, '/cart', '2018-02-01 10:08:19', NULL, NULL, NULL),
(3267, 35, 35, '/cart', '2018-02-01 10:08:22', NULL, NULL, NULL),
(3268, 35, 35, '/cart', '2018-02-01 10:58:33', NULL, NULL, NULL),
(3269, 35, 35, '/cart', '2018-02-01 11:00:59', NULL, NULL, NULL),
(3270, 35, 35, '/cart', '2018-02-01 11:01:00', NULL, NULL, NULL),
(3271, 35, 35, '/product/55', '2018-02-01 11:01:02', NULL, NULL, NULL),
(3272, 35, 35, '/cart', '2018-02-01 11:01:04', NULL, NULL, NULL),
(3273, 35, 35, '/cart', '2018-02-01 11:01:04', NULL, NULL, NULL),
(3274, 35, 35, '/product/55', '2018-02-01 11:01:05', NULL, NULL, NULL),
(3275, 35, 35, '/cart', '2018-02-01 11:01:08', NULL, NULL, NULL),
(3276, 35, 35, '/cart', '2018-02-01 11:01:15', NULL, NULL, NULL),
(3277, 35, 35, '/product/55', '2018-02-01 11:01:21', NULL, NULL, NULL),
(3278, 35, 35, '/product/55', '2018-02-01 11:01:25', NULL, NULL, NULL),
(3279, 35, 35, '/cart', '2018-02-01 11:01:25', NULL, NULL, NULL),
(3280, 35, 35, '/cart', '2018-02-01 11:13:12', NULL, NULL, NULL),
(3281, 35, 35, '/company', '2018-02-01 11:13:15', NULL, NULL, NULL),
(3282, 35, 35, '/admin', '2018-02-01 11:13:16', NULL, NULL, NULL),
(3283, 35, 35, '/admin-routes', '2018-02-01 11:14:03', NULL, NULL, NULL),
(3284, 35, 35, '/admin-routes', '2018-02-01 11:14:04', NULL, NULL, NULL),
(3285, 35, 35, '/admin-routes', '2018-02-01 11:14:14', NULL, NULL, NULL),
(3286, 35, 35, '/admin-routes', '2018-02-01 11:14:39', NULL, NULL, NULL),
(3287, 35, 35, '/order', '2018-02-01 11:14:40', NULL, NULL, NULL),
(3288, 35, 35, '/order', '2018-02-01 11:14:42', NULL, NULL, NULL),
(3289, 35, 35, '/order', '2018-02-01 11:20:20', NULL, NULL, NULL),
(3290, 35, 35, '/order', '2018-02-01 11:21:12', NULL, NULL, NULL),
(3291, 35, 35, '/order', '2018-02-01 11:21:13', NULL, NULL, NULL),
(3292, 35, 35, '/order', '2018-02-01 11:21:16', NULL, NULL, NULL),
(3293, 35, 35, '/order', '2018-02-01 11:21:54', NULL, NULL, NULL),
(3294, 35, 35, '/order', '2018-02-01 11:21:56', NULL, NULL, NULL),
(3295, 35, 35, '/order', '2018-02-01 11:23:36', NULL, NULL, NULL),
(3296, 35, 35, '/order', '2018-02-01 11:23:51', NULL, NULL, NULL),
(3297, 35, 35, '/order', '2018-02-01 11:24:15', NULL, NULL, NULL),
(3298, 35, 35, '/order', '2018-02-01 11:24:22', NULL, NULL, NULL),
(3299, 35, 35, '/order', '2018-02-01 11:24:29', NULL, NULL, NULL),
(3300, 35, 35, '/order', '2018-02-01 11:24:42', NULL, NULL, NULL),
(3301, 35, 35, '/order', '2018-02-01 11:24:49', NULL, NULL, NULL),
(3302, 35, 35, '/admin-routes', '2018-02-01 11:25:54', NULL, NULL, NULL),
(3303, 35, 35, '/order', '2018-02-01 11:25:56', NULL, NULL, NULL),
(3304, 35, 35, '/order', '2018-02-01 11:28:13', NULL, NULL, NULL),
(3305, 35, 35, '/order', '2018-02-01 11:30:16', NULL, NULL, NULL),
(3306, 35, 35, '/order', '2018-02-01 11:31:05', NULL, NULL, NULL),
(3307, 35, 35, '/order', '2018-02-01 11:31:07', NULL, NULL, NULL),
(3308, 35, 35, '/order', '2018-02-01 11:31:38', NULL, NULL, NULL),
(3309, 35, 35, '/order', '2018-02-01 11:31:44', NULL, NULL, NULL),
(3310, 35, 35, '/order', '2018-02-01 11:31:49', NULL, NULL, NULL),
(3311, 35, 35, '/order', '2018-02-01 11:33:33', NULL, NULL, NULL),
(3312, 35, 35, '/order', '2018-02-01 11:33:46', NULL, NULL, NULL),
(3313, 35, 35, '/order', '2018-02-01 11:34:23', NULL, NULL, NULL),
(3314, 35, 35, '/order', '2018-02-01 11:34:38', NULL, NULL, NULL),
(3315, 35, 35, '/order', '2018-02-01 11:34:50', NULL, NULL, NULL),
(3316, 35, 35, '/order', '2018-02-01 11:35:53', NULL, NULL, NULL),
(3317, 35, 35, '/order', '2018-02-01 11:38:11', NULL, NULL, NULL),
(3318, 35, 35, '/order', '2018-02-01 11:39:04', NULL, NULL, NULL),
(3319, 35, 35, '/order', '2018-02-01 11:41:13', NULL, NULL, NULL),
(3320, 35, 35, '/order', '2018-02-01 11:41:14', NULL, NULL, NULL),
(3321, 35, 35, '/order', '2018-02-01 11:41:44', NULL, NULL, NULL),
(3322, 35, 35, '/order', '2018-02-01 11:42:54', NULL, NULL, NULL),
(3323, 35, 35, '/order', '2018-02-01 11:43:20', NULL, NULL, NULL),
(3324, 35, 35, '/order', '2018-02-01 11:43:22', NULL, NULL, NULL),
(3325, 35, 35, '/order', '2018-02-01 11:43:37', NULL, NULL, NULL),
(3326, 35, 35, '/order', '2018-02-01 11:44:11', NULL, NULL, NULL),
(3327, 35, 35, '/order', '2018-02-01 11:44:12', NULL, NULL, NULL),
(3328, 35, 35, '/order', '2018-02-01 11:45:21', NULL, NULL, NULL),
(3329, 35, 35, '/order', '2018-02-01 11:46:44', NULL, NULL, NULL),
(3330, 35, 35, '/order', '2018-02-01 11:48:07', NULL, NULL, NULL),
(3331, 35, 35, '/order', '2018-02-01 11:49:14', NULL, NULL, NULL),
(3332, 35, 35, '/order', '2018-02-01 11:49:30', NULL, NULL, NULL),
(3333, 35, 35, '/order', '2018-02-01 11:50:38', NULL, NULL, NULL),
(3334, 35, 35, '/order', '2018-02-01 11:51:00', NULL, NULL, NULL),
(3335, 35, 35, '/order', '2018-02-01 11:51:13', NULL, NULL, NULL),
(3336, 35, 35, '/order', '2018-02-01 11:51:22', NULL, NULL, NULL),
(3337, 35, 35, '/order', '2018-02-01 11:51:50', NULL, NULL, NULL),
(3338, 35, 35, '/order', '2018-02-01 11:51:59', NULL, NULL, NULL),
(3339, 35, 35, '/order', '2018-02-01 11:52:11', NULL, NULL, NULL),
(3340, 35, 35, '/order', '2018-02-01 11:54:18', NULL, NULL, NULL),
(3341, 35, 35, '/order', '2018-02-01 11:54:23', NULL, NULL, NULL),
(3342, 35, 35, '/order', '2018-02-01 11:54:29', NULL, NULL, NULL),
(3343, 35, 35, '/order', '2018-02-01 11:54:34', NULL, NULL, NULL),
(3344, 35, 35, '/order', '2018-02-01 12:01:43', NULL, NULL, NULL),
(3345, 35, 35, '/order', '2018-02-01 12:02:11', NULL, NULL, NULL);

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
(32, NULL, '2018-01-31 05:19:54'),
(33, NULL, '2018-01-31 09:07:21'),
(34, NULL, '2018-02-01 05:45:47'),
(35, NULL, '2018-02-01 06:55:54');

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
(32, 32, 286, '1', '2018-01-31 05:19:54', NULL, NULL),
(33, 33, 290, '1', '2018-01-31 09:07:22', NULL, NULL),
(34, 34, 48, '1', '2018-02-01 05:45:47', NULL, NULL),
(35, 35, 236, '1', '2018-02-01 06:55:54', NULL, NULL);

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
-- Индексы таблицы `photos`
--
ALTER TABLE `photos`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `components`
--
ALTER TABLE `components`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `fragments`
--
ALTER TABLE `fragments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT для таблицы `fragments_blocks`
--
ALTER TABLE `fragments_blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `fragments_data`
--
ALTER TABLE `fragments_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `global_site_config`
--
ALTER TABLE `global_site_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `goods_cats`
--
ALTER TABLE `goods_cats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `goods_pos`
--
ALTER TABLE `goods_pos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

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
-- AUTO_INCREMENT для таблицы `templates`
--
ALTER TABLE `templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `views`
--
ALTER TABLE `views`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3346;

--
-- AUTO_INCREMENT для таблицы `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT для таблицы `visits`
--
ALTER TABLE `visits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
