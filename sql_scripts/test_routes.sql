-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Янв 26 2018 г., 13:26
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
(3, 'Главный слайдер', 'main-slider', 2, 0, 1, NULL, NULL, '{\"slides\":[], \"lastId\": 0}', '2018-01-10 12:17:53'),
(4, 'Страница авторизации', 'login-page', 2, 0, 1, NULL, NULL, NULL, '2018-01-15 07:19:51'),
(5, 'Отображение новости', 'news-id', 2, 0, 0, NULL, NULL, NULL, '2018-01-24 06:34:23'),
(6, 'Список новостей', 'news-list', 2, 0, 0, NULL, NULL, NULL, '2018-01-24 08:34:58'),
(7, 'Управление клиентами', 'clients-manage', 2, 0, 0, NULL, NULL, NULL, '2018-01-25 07:28:54'),
(8, 'Пустой блок', NULL, NULL, 1, 0, NULL, NULL, '{\"body\": \"\"}', '2018-01-26 07:34:57'),
(9, 'Объявления краткий список', 'announcements-short-list', 3, 0, 0, NULL, NULL, NULL, '2018-01-26 08:00:33');

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
(61, 7, 50, 2, 1, '2018-01-25 07:29:02'),
(70, 4, 61, 2, 1, '2018-01-25 11:56:34'),
(71, 3, 32, 2, 1, '2018-01-26 05:23:50'),
(77, 9, 48, 3, 1, '2018-01-26 09:42:11'),
(78, 2, 48, 2, 1, '2018-01-26 09:45:14'),
(79, 2, 48, 2, 1, '2018-01-26 09:54:11'),
(80, 2, 48, 2, 1, '2018-01-26 09:54:12'),
(81, 2, 48, 2, 1, '2018-01-26 09:54:13'),
(82, 9, 49, 3, 1, '2018-01-26 10:49:07'),
(83, 2, 62, 2, 1, '2018-01-26 11:45:15'),
(84, 9, 62, 3, 1, '2018-01-26 11:45:24'),
(85, 9, 62, 3, 1, '2018-01-26 11:45:25'),
(86, 8, 62, 3, 1, '2018-01-26 11:55:37'),
(87, 8, 62, 2, 1, '2018-01-26 12:17:12');

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
(3, 'Информативный', '2018-01-26 07:24:48');

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
(20, NULL, 71, '{\"content\":{\"slides\":[],\"lastId\":7}}', '2018-01-26 07:39:10'),
(23, NULL, 78, '{\"content\":{\"body\":\"<p>asdasdasd</p>\\n\"}}', '2018-01-26 09:54:29'),
(24, NULL, 79, '{\"content\":{\"body\":\"<p>asdasdasdasdasdasd</p>\\n\"}}', '2018-01-26 09:54:45'),
(25, NULL, 80, '{\"content\":{\"body\":\"<p>aasdasd123213213</p>\\n\"}}', '2018-01-26 09:55:59'),
(26, NULL, 81, '{\"content\":{\"body\":\"<p>123123123123</p>\\n\"}}', '2018-01-26 09:56:14'),
(27, NULL, 83, '{\"content\":{\"body\":\"\"}}', '2018-01-26 11:45:22');

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
(5, 'Расположение', '/contacts-place', 0, NULL, 2, '2018-01-25 09:14:18');

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
(48, 'Компания', '/company', 2, NULL, 1, 0, 1, 1, 'Ключевые, слова', 'Описание', '2018-01-24 10:07:54', '2018-01-26 07:37:01'),
(49, 'Управление маршрутами', '/admin-routes', 2, 1, 3, 0, 1, 1, '', '', '2018-01-25 07:14:47', '2018-01-25 09:11:00'),
(50, 'Управление клиентами', '/admin-clients', 2, 1, 3, 0, 1, 1, '', '', '2018-01-25 07:15:29', '2018-01-25 07:15:50'),
(51, 'Посещаемость', '/admin-attendance', 2, 1, 3, 0, 1, 1, '', '', '2018-01-25 08:34:36', '2018-01-25 08:34:49'),
(52, 'Контакты', '/contacts', 2, 2, 1, 0, 1, 1, 'Проверка ключевых слов', 'Проверка описания', '2018-01-25 09:05:29', '2018-01-25 09:12:15'),
(53, 'Кладбища', '/cemeteries', 1, NULL, 1, 0, 1, 1, '', '', '2018-01-25 09:28:51', '2018-01-25 09:28:51'),
(54, 'Новости', '/news', 2, NULL, 1, 1, 1, 1, '', '', '2018-01-25 09:40:37', '2018-01-25 09:42:09'),
(61, 'Авторизация', '/login', 1, NULL, 1, 0, 0, 0, '', '', '2018-01-25 11:49:17', '2018-01-25 12:00:21'),
(62, 'Магазин', '/shop', 2, NULL, 1, 0, 1, 1, 'Магазин', 'Описание', '2018-01-26 10:23:30', '2018-01-26 10:24:46');

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
(1, 2, 1, '/', '2018-01-24 10:03:08', NULL, NULL, NULL),
(2, 1, 1, '/', '2018-01-24 10:03:10', NULL, NULL, NULL),
(3, 1, 1, '/login', '2018-01-24 10:03:11', NULL, NULL, NULL),
(4, 1, 1, '/', '2018-01-24 10:03:56', NULL, NULL, NULL),
(5, 1, 1, '/admin', '2018-01-24 10:04:14', NULL, NULL, NULL),
(6, 1, 1, '/admin', '2018-01-24 10:04:57', NULL, NULL, NULL),
(7, 2, 2, '/', '2018-01-24 10:05:11', NULL, NULL, NULL),
(8, 2, 2, '/login', '2018-01-24 10:05:17', NULL, NULL, NULL),
(9, 2, 1, '/', '2018-01-24 10:05:21', NULL, NULL, NULL),
(10, 2, 1, '/admin', '2018-01-24 10:05:24', NULL, NULL, NULL),
(11, 2, 1, '/admin', '2018-01-24 10:07:04', NULL, NULL, NULL),
(12, 2, 1, '/admin', '2018-01-24 10:07:54', NULL, NULL, NULL),
(13, 2, 1, '/company', '2018-01-24 10:07:56', NULL, NULL, NULL),
(14, 2, 1, '/company', '2018-01-24 10:08:18', NULL, NULL, NULL),
(15, 2, 1, '/company', '2018-01-24 10:09:05', NULL, NULL, NULL),
(16, 2, 1, '/company', '2018-01-24 10:09:10', NULL, NULL, NULL),
(17, 2, 1, '/company', '2018-01-24 10:09:16', NULL, NULL, NULL),
(18, 2, 1, '/company', '2018-01-24 10:10:41', NULL, NULL, NULL),
(19, 2, 1, '/company', '2018-01-24 10:11:33', NULL, NULL, NULL),
(20, 2, 1, '/company', '2018-01-24 10:12:20', NULL, NULL, NULL),
(21, 2, 1, '/company', '2018-01-24 10:14:15', NULL, NULL, NULL),
(22, 2, 1, '/company', '2018-01-24 10:15:50', NULL, NULL, NULL),
(23, 2, 1, '/company', '2018-01-24 10:16:28', NULL, NULL, NULL),
(24, 2, 1, '/', '2018-01-24 10:16:53', NULL, NULL, NULL),
(25, 2, 1, '/', '2018-01-24 10:16:55', NULL, NULL, NULL),
(26, 2, 1, '/', '2018-01-24 10:16:58', NULL, NULL, NULL),
(27, 2, 1, '/', '2018-01-24 10:16:59', NULL, NULL, NULL),
(28, 2, 1, '/', '2018-01-24 10:16:59', NULL, NULL, NULL),
(29, 2, 1, '/', '2018-01-24 10:17:02', NULL, NULL, NULL),
(30, 2, 1, '/', '2018-01-24 10:17:02', NULL, NULL, NULL),
(31, 2, 1, '/', '2018-01-24 10:19:35', NULL, NULL, NULL),
(32, 2, 1, '/', '2018-01-24 10:19:36', NULL, NULL, NULL),
(33, 2, 1, '/company', '2018-01-24 10:19:36', NULL, NULL, NULL),
(34, 2, 1, '/company', '2018-01-24 10:19:39', NULL, NULL, NULL),
(35, 2, 1, '/company', '2018-01-24 10:19:50', NULL, NULL, NULL),
(36, 2, 1, '/company', '2018-01-24 10:20:00', NULL, NULL, NULL),
(37, 2, 1, '/company', '2018-01-24 10:20:30', NULL, NULL, NULL),
(38, 2, 1, '/company', '2018-01-24 10:20:32', NULL, NULL, NULL),
(39, 2, 1, '/company', '2018-01-24 10:22:48', NULL, NULL, NULL),
(40, 2, 1, '/company', '2018-01-24 10:22:57', NULL, NULL, NULL),
(41, 2, 1, '/company', '2018-01-24 10:23:18', NULL, NULL, NULL),
(42, 2, 1, '/company', '2018-01-24 10:23:25', NULL, NULL, NULL),
(43, 2, 1, '/company', '2018-01-24 10:23:27', NULL, NULL, NULL),
(44, 2, 1, '/company', '2018-01-24 10:23:53', NULL, NULL, NULL),
(45, 2, 1, '/company', '2018-01-24 10:24:33', NULL, NULL, NULL),
(46, 2, 1, '/company', '2018-01-24 10:24:36', NULL, NULL, NULL),
(47, 2, 1, '/', '2018-01-24 10:24:41', NULL, NULL, NULL),
(48, 2, 1, '/', '2018-01-24 10:24:42', NULL, NULL, NULL),
(49, 2, 1, '/', '2018-01-24 10:24:44', NULL, NULL, NULL),
(50, 2, 1, '/', '2018-01-24 10:24:45', NULL, NULL, NULL),
(51, 2, 1, '/', '2018-01-24 10:24:46', NULL, NULL, NULL),
(52, 2, 1, '/', '2018-01-24 10:24:46', NULL, NULL, NULL),
(53, 2, 1, '/', '2018-01-24 10:24:55', NULL, NULL, NULL),
(54, 2, 1, '/', '2018-01-24 10:24:55', NULL, NULL, NULL),
(55, 2, 1, '/', '2018-01-24 10:25:20', NULL, NULL, NULL),
(56, 2, 1, '/', '2018-01-24 10:25:20', NULL, NULL, NULL),
(57, 2, 1, '/', '2018-01-24 10:25:22', NULL, NULL, NULL),
(58, 2, 1, '/', '2018-01-24 10:25:22', NULL, NULL, NULL),
(59, 2, 1, '/', '2018-01-24 10:25:23', NULL, NULL, NULL),
(60, 2, 1, '/', '2018-01-24 10:25:24', NULL, NULL, NULL),
(61, 2, 1, '/', '2018-01-24 10:25:24', NULL, NULL, NULL),
(62, 2, 1, '/', '2018-01-24 10:25:33', NULL, NULL, NULL),
(63, 2, 1, '/', '2018-01-24 10:25:33', NULL, NULL, NULL),
(64, 2, 1, '/', '2018-01-24 10:27:11', NULL, NULL, NULL),
(65, 2, 1, '/', '2018-01-24 10:27:11', NULL, NULL, NULL),
(66, 2, 1, '/company', '2018-01-24 10:27:14', NULL, NULL, NULL),
(67, 2, 1, '/company', '2018-01-24 10:27:22', NULL, NULL, NULL),
(68, 2, 1, '/', '2018-01-24 10:27:35', NULL, NULL, NULL),
(69, 2, 1, '/', '2018-01-24 10:27:35', NULL, NULL, NULL),
(70, 2, 1, '/company', '2018-01-24 10:28:12', NULL, NULL, NULL),
(71, 2, 1, '/company', '2018-01-24 10:28:23', NULL, NULL, NULL),
(72, 2, 1, '/company', '2018-01-24 10:29:14', NULL, NULL, NULL),
(73, 2, 1, '/company', '2018-01-24 10:29:47', NULL, NULL, NULL),
(74, 2, 1, '/company', '2018-01-24 10:29:50', NULL, NULL, NULL),
(75, 2, 1, '/company', '2018-01-24 10:30:26', NULL, NULL, NULL),
(76, 2, 1, '/company', '2018-01-24 10:30:27', NULL, NULL, NULL),
(77, 2, 1, '/company', '2018-01-24 10:30:29', NULL, NULL, NULL),
(78, 2, 1, '/company', '2018-01-24 10:33:41', NULL, NULL, NULL),
(79, 2, 1, '/company', '2018-01-24 10:38:50', NULL, NULL, NULL),
(80, 2, 1, '/admin', '2018-01-24 10:38:52', NULL, NULL, NULL),
(81, 2, 1, '/admin', '2018-01-24 10:38:57', NULL, NULL, NULL),
(82, 2, 1, '/admin', '2018-01-24 10:39:00', NULL, NULL, NULL),
(83, 2, 1, '/admin', '2018-01-24 10:39:07', NULL, NULL, NULL),
(84, 2, 1, '/', '2018-01-25 04:32:46', NULL, NULL, NULL),
(85, 2, 1, '/', '2018-01-25 04:32:47', NULL, NULL, NULL),
(86, 2, 1, '/', '2018-01-25 04:32:49', NULL, NULL, NULL),
(87, 2, 1, '/', '2018-01-25 04:32:49', NULL, NULL, NULL),
(88, 2, 1, '/', '2018-01-25 04:32:56', NULL, NULL, NULL),
(89, 2, 1, '/', '2018-01-25 04:32:56', NULL, NULL, NULL),
(90, 2, 1, '/', '2018-01-25 04:32:59', NULL, NULL, NULL),
(91, 2, 1, '/', '2018-01-25 04:32:59', NULL, NULL, NULL),
(92, 2, 1, '/', '2018-01-25 04:33:00', NULL, NULL, NULL),
(93, 2, 1, '/', '2018-01-25 04:33:00', NULL, NULL, NULL),
(94, 2, 1, '/', '2018-01-25 04:33:01', NULL, NULL, NULL),
(95, 2, 1, '/', '2018-01-25 04:33:01', NULL, NULL, NULL),
(96, 2, 1, '/company', '2018-01-25 04:33:02', NULL, NULL, NULL),
(97, 2, 1, '/company', '2018-01-25 04:33:03', NULL, NULL, NULL),
(98, 2, 1, '/company', '2018-01-25 04:33:09', NULL, NULL, NULL),
(99, 2, 1, '/company', '2018-01-25 04:33:11', NULL, NULL, NULL),
(100, 2, 1, '/company', '2018-01-25 04:33:23', NULL, NULL, NULL),
(101, 2, 1, '/', '2018-01-25 04:33:27', NULL, NULL, NULL),
(102, 2, 1, '/', '2018-01-25 04:33:28', NULL, NULL, NULL),
(103, 2, 1, '/admin', '2018-01-25 04:33:30', NULL, NULL, NULL),
(104, 2, 1, '/', '2018-01-25 04:35:17', NULL, NULL, NULL),
(105, 2, 1, '/', '2018-01-25 04:35:18', NULL, NULL, NULL),
(106, 2, 1, '/', '2018-01-25 04:35:19', NULL, NULL, NULL),
(107, 2, 1, '/', '2018-01-25 04:35:19', NULL, NULL, NULL),
(108, 2, 1, '/', '2018-01-25 04:35:21', NULL, NULL, NULL),
(109, 2, 1, '/', '2018-01-25 04:35:21', NULL, NULL, NULL),
(110, 2, 1, '/', '2018-01-25 04:35:51', NULL, NULL, NULL),
(111, 2, 1, '/', '2018-01-25 04:35:51', NULL, NULL, NULL),
(112, 2, 1, '/', '2018-01-25 04:36:26', NULL, NULL, NULL),
(113, 2, 1, '/', '2018-01-25 04:36:27', NULL, NULL, NULL),
(114, 2, 1, '/', '2018-01-25 04:36:35', NULL, NULL, NULL),
(115, 2, 1, '/', '2018-01-25 04:36:35', NULL, NULL, NULL),
(116, 2, 1, '/company', '2018-01-25 04:36:37', NULL, NULL, NULL),
(117, 2, 1, '/', '2018-01-25 04:36:38', NULL, NULL, NULL),
(118, 2, 1, '/', '2018-01-25 04:36:38', NULL, NULL, NULL),
(119, 2, 1, '/admin', '2018-01-25 04:36:39', NULL, NULL, NULL),
(120, 2, 1, '/admin', '2018-01-25 04:36:41', NULL, NULL, NULL),
(121, 2, 1, '/admin', '2018-01-25 04:36:42', NULL, NULL, NULL),
(122, 2, 1, '/company', '2018-01-25 04:38:56', NULL, NULL, NULL),
(123, 2, 1, '/admin', '2018-01-25 04:46:44', NULL, NULL, NULL),
(124, 2, 1, '/admin', '2018-01-25 04:46:46', NULL, NULL, NULL),
(125, 2, 1, '/company', '2018-01-25 04:52:50', NULL, NULL, NULL),
(126, 2, 1, '/company', '2018-01-25 04:53:01', NULL, NULL, NULL),
(127, 2, 1, '/company', '2018-01-25 04:53:01', NULL, NULL, NULL),
(128, 2, 1, '/company', '2018-01-25 04:53:26', NULL, NULL, NULL),
(129, 2, 1, '/company', '2018-01-25 04:54:15', NULL, NULL, NULL),
(130, 2, 1, '/company', '2018-01-25 05:03:18', NULL, NULL, NULL),
(131, 2, 1, '/company', '2018-01-25 05:04:21', NULL, NULL, NULL),
(132, 2, 1, '/company', '2018-01-25 05:05:01', NULL, NULL, NULL),
(133, 2, 1, '/company', '2018-01-25 05:05:03', NULL, NULL, NULL),
(134, 2, 1, '/company', '2018-01-25 05:05:04', NULL, NULL, NULL),
(135, 2, 1, '/company', '2018-01-25 05:05:17', NULL, NULL, NULL),
(136, 2, 1, '/company', '2018-01-25 05:05:40', NULL, NULL, NULL),
(137, 2, 1, '/company', '2018-01-25 05:06:15', NULL, NULL, NULL),
(138, 2, 1, '/company', '2018-01-25 05:07:04', NULL, NULL, NULL),
(139, 2, 1, '/company', '2018-01-25 05:07:13', NULL, NULL, NULL),
(140, 2, 1, '/company', '2018-01-25 05:07:48', NULL, NULL, NULL),
(141, 2, 1, '/company', '2018-01-25 05:08:00', NULL, NULL, NULL),
(142, 2, 1, '/company', '2018-01-25 05:08:30', NULL, NULL, NULL),
(143, 2, 1, '/company', '2018-01-25 05:08:52', NULL, NULL, NULL),
(144, 2, 1, '/company', '2018-01-25 05:17:51', NULL, NULL, NULL),
(145, 2, 1, '/company', '2018-01-25 05:19:28', NULL, NULL, NULL),
(146, 2, 1, '/company', '2018-01-25 05:21:30', NULL, NULL, NULL),
(147, 2, 1, '/company', '2018-01-25 05:23:55', NULL, NULL, NULL),
(148, 2, 1, '/company', '2018-01-25 05:23:57', NULL, NULL, NULL),
(149, 2, 1, '/company', '2018-01-25 05:24:20', NULL, NULL, NULL),
(150, 2, 1, '/company', '2018-01-25 05:24:27', NULL, NULL, NULL),
(151, 2, 1, '/company', '2018-01-25 05:26:14', NULL, NULL, NULL),
(152, 2, 1, '/company', '2018-01-25 05:26:39', NULL, NULL, NULL),
(153, 2, 1, '/company', '2018-01-25 05:27:01', NULL, NULL, NULL),
(154, 2, 1, '/company', '2018-01-25 05:27:13', NULL, NULL, NULL),
(155, 2, 1, '/company', '2018-01-25 05:27:16', NULL, NULL, NULL),
(156, 2, 1, '/company', '2018-01-25 05:27:18', NULL, NULL, NULL),
(157, 2, 1, '/company', '2018-01-25 05:29:39', NULL, NULL, NULL),
(158, 2, 1, '/company', '2018-01-25 05:29:42', NULL, NULL, NULL),
(159, 2, 1, '/company', '2018-01-25 05:29:44', NULL, NULL, NULL),
(160, 2, 1, '/company', '2018-01-25 05:29:46', NULL, NULL, NULL),
(161, 2, 1, '/company', '2018-01-25 05:29:48', NULL, NULL, NULL),
(162, 2, 1, '/company', '2018-01-25 05:30:55', NULL, NULL, NULL),
(163, 2, 1, '/company', '2018-01-25 05:30:56', NULL, NULL, NULL),
(164, 2, 1, '/company', '2018-01-25 05:31:44', NULL, NULL, NULL),
(165, 2, 1, '/company', '2018-01-25 05:32:19', NULL, NULL, NULL),
(166, 2, 1, '/company', '2018-01-25 05:34:49', NULL, NULL, NULL),
(167, 2, 1, '/company', '2018-01-25 05:34:49', NULL, NULL, NULL),
(168, 2, 1, '/company', '2018-01-25 05:34:50', NULL, NULL, NULL),
(169, 2, 1, '/company', '2018-01-25 05:34:51', NULL, NULL, NULL),
(170, 2, 1, '/company', '2018-01-25 05:34:55', NULL, NULL, NULL),
(171, 2, 1, '/company', '2018-01-25 05:34:56', NULL, NULL, NULL),
(172, 2, 1, '/company', '2018-01-25 05:34:57', NULL, NULL, NULL),
(173, 2, 1, '/company', '2018-01-25 05:34:58', NULL, NULL, NULL),
(174, 2, 1, '/company', '2018-01-25 05:35:00', NULL, NULL, NULL),
(175, 2, 1, '/company', '2018-01-25 05:35:01', NULL, NULL, NULL),
(176, 2, 1, '/company', '2018-01-25 05:35:20', NULL, NULL, NULL),
(177, 2, 1, '/company', '2018-01-25 05:35:45', NULL, NULL, NULL),
(178, 2, 1, '/company', '2018-01-25 05:36:01', NULL, NULL, NULL),
(179, 2, 1, '/company', '2018-01-25 05:37:22', NULL, NULL, NULL),
(180, 2, 1, '/company', '2018-01-25 05:37:48', NULL, NULL, NULL),
(181, 2, 1, '/company', '2018-01-25 05:38:10', NULL, NULL, NULL),
(182, 2, 1, '/company', '2018-01-25 05:38:48', NULL, NULL, NULL),
(183, 2, 1, '/company', '2018-01-25 05:39:07', NULL, NULL, NULL),
(184, 2, 1, '/company', '2018-01-25 05:40:09', NULL, NULL, NULL),
(185, 2, 1, '/company', '2018-01-25 05:47:51', NULL, NULL, NULL),
(186, 2, 1, '/company', '2018-01-25 05:48:31', NULL, NULL, NULL),
(187, 3, 3, '/', '2018-01-25 05:48:42', NULL, NULL, NULL),
(188, 3, 3, '/', '2018-01-25 05:48:42', NULL, NULL, NULL),
(189, 3, 3, '/login', '2018-01-25 05:48:45', NULL, NULL, NULL),
(190, 3, 1, '/', '2018-01-25 05:48:48', NULL, NULL, NULL),
(191, 3, 1, '/', '2018-01-25 05:48:49', NULL, NULL, NULL),
(192, 3, 1, '/', '2018-01-25 05:52:57', NULL, NULL, NULL),
(193, 3, 1, '/', '2018-01-25 05:52:57', NULL, NULL, NULL),
(194, 3, 1, '/', '2018-01-25 05:53:01', NULL, NULL, NULL),
(195, 3, 1, '/', '2018-01-25 05:53:02', NULL, NULL, NULL),
(196, 3, 1, '/', '2018-01-25 05:53:55', NULL, NULL, NULL),
(197, 3, 1, '/', '2018-01-25 05:53:55', NULL, NULL, NULL),
(198, 3, 1, '/', '2018-01-25 05:54:21', NULL, NULL, NULL),
(199, 3, 1, '/', '2018-01-25 05:54:21', NULL, NULL, NULL),
(200, 3, 1, '/', '2018-01-25 05:54:23', NULL, NULL, NULL),
(201, 3, 1, '/', '2018-01-25 05:54:23', NULL, NULL, NULL),
(202, 3, 1, '/', '2018-01-25 05:54:24', NULL, NULL, NULL),
(203, 3, 1, '/', '2018-01-25 05:54:24', NULL, NULL, NULL),
(204, 3, 1, '/', '2018-01-25 05:54:25', NULL, NULL, NULL),
(205, 3, 1, '/', '2018-01-25 05:54:25', NULL, NULL, NULL),
(206, 3, 1, '/', '2018-01-25 05:54:26', NULL, NULL, NULL),
(207, 3, 1, '/', '2018-01-25 05:54:27', NULL, NULL, NULL),
(208, 3, 1, '/', '2018-01-25 05:54:28', NULL, NULL, NULL),
(209, 3, 1, '/', '2018-01-25 05:54:28', NULL, NULL, NULL),
(210, 3, 1, '/', '2018-01-25 05:54:29', NULL, NULL, NULL),
(211, 3, 1, '/', '2018-01-25 05:54:30', NULL, NULL, NULL),
(212, 3, 1, '/', '2018-01-25 05:54:32', NULL, NULL, NULL),
(213, 3, 1, '/', '2018-01-25 05:54:32', NULL, NULL, NULL),
(214, 3, 1, '/', '2018-01-25 05:54:33', NULL, NULL, NULL),
(215, 3, 1, '/', '2018-01-25 05:54:34', NULL, NULL, NULL),
(216, 3, 1, '/', '2018-01-25 05:54:53', NULL, NULL, NULL),
(217, 3, 1, '/', '2018-01-25 05:54:54', NULL, NULL, NULL),
(218, 3, 1, '/', '2018-01-25 05:55:09', NULL, NULL, NULL),
(219, 3, 1, '/', '2018-01-25 05:55:09', NULL, NULL, NULL),
(220, 3, 1, '/', '2018-01-25 05:55:12', NULL, NULL, NULL),
(221, 3, 1, '/', '2018-01-25 05:55:13', NULL, NULL, NULL),
(222, 3, 1, '/', '2018-01-25 05:55:22', NULL, NULL, NULL),
(223, 3, 1, '/', '2018-01-25 05:55:22', NULL, NULL, NULL),
(224, 3, 1, '/', '2018-01-25 05:55:30', NULL, NULL, NULL),
(225, 3, 1, '/', '2018-01-25 05:55:31', NULL, NULL, NULL),
(226, 3, 1, '/', '2018-01-25 05:55:38', NULL, NULL, NULL),
(227, 3, 1, '/', '2018-01-25 05:55:38', NULL, NULL, NULL),
(228, 3, 1, '/', '2018-01-25 05:55:39', NULL, NULL, NULL),
(229, 3, 1, '/', '2018-01-25 05:55:40', NULL, NULL, NULL),
(230, 3, 1, '/', '2018-01-25 05:55:41', NULL, NULL, NULL),
(231, 3, 1, '/', '2018-01-25 05:55:43', NULL, NULL, NULL),
(232, 3, 1, '/', '2018-01-25 05:55:46', NULL, NULL, NULL),
(233, 3, 1, '/admin', '2018-01-25 05:55:53', NULL, NULL, NULL),
(234, 3, 1, '/', '2018-01-25 05:56:17', NULL, NULL, NULL),
(235, 3, 1, '/', '2018-01-25 05:56:24', NULL, NULL, NULL),
(236, 3, 1, '/', '2018-01-25 05:56:27', NULL, NULL, NULL),
(237, 3, 1, '/', '2018-01-25 05:57:50', NULL, NULL, NULL),
(238, 3, 1, '/company', '2018-01-25 05:58:32', NULL, NULL, NULL),
(239, 3, 1, '/company', '2018-01-25 05:58:35', NULL, NULL, NULL),
(240, 3, 1, '/company', '2018-01-25 05:58:38', NULL, NULL, NULL),
(241, 3, 1, '/', '2018-01-25 05:58:52', NULL, NULL, NULL),
(242, 3, 1, '/company', '2018-01-25 05:58:53', NULL, NULL, NULL),
(243, 3, 1, '/', '2018-01-25 05:59:59', NULL, NULL, NULL),
(244, 3, 1, '/company', '2018-01-25 06:00:02', NULL, NULL, NULL),
(245, 3, 1, '/admin', '2018-01-25 06:00:04', NULL, NULL, NULL),
(246, 3, 1, '/admin', '2018-01-25 06:01:22', NULL, NULL, NULL),
(247, 3, 1, '/admin', '2018-01-25 06:01:23', NULL, NULL, NULL),
(248, 3, 1, '/admin', '2018-01-25 06:01:24', NULL, NULL, NULL),
(249, 3, 1, '/admin', '2018-01-25 06:02:12', NULL, NULL, NULL),
(250, 3, 1, '/admin', '2018-01-25 06:15:29', NULL, NULL, NULL),
(251, 3, 1, '/', '2018-01-25 06:17:36', NULL, NULL, NULL),
(252, 3, 1, '/', '2018-01-25 06:24:20', NULL, NULL, NULL),
(253, 3, 1, '/company', '2018-01-25 06:24:20', NULL, NULL, NULL),
(254, 3, 1, '/', '2018-01-25 06:24:21', NULL, NULL, NULL),
(255, 3, 1, '/', '2018-01-25 06:24:23', NULL, NULL, NULL),
(256, 3, 1, '/company', '2018-01-25 06:24:24', NULL, NULL, NULL),
(257, 3, 1, '/', '2018-01-25 06:24:24', NULL, NULL, NULL),
(258, 4, 4, '/', '2018-01-25 06:24:28', NULL, NULL, NULL),
(259, 4, 4, '/login', '2018-01-25 06:24:32', NULL, NULL, NULL),
(260, 4, 1, '/', '2018-01-25 06:24:36', NULL, NULL, NULL),
(261, 4, 1, '/', '2018-01-25 06:38:09', NULL, NULL, NULL),
(262, 5, 5, '/', '2018-01-25 06:38:10', NULL, NULL, NULL),
(263, 5, 5, '/login', '2018-01-25 06:38:11', NULL, NULL, NULL),
(264, 5, 5, '/login', '2018-01-25 06:40:04', NULL, NULL, NULL),
(265, 5, 5, '/login', '2018-01-25 06:40:11', NULL, NULL, NULL),
(266, 5, 5, '/login', '2018-01-25 06:40:12', NULL, NULL, NULL),
(267, 5, 5, '/login', '2018-01-25 06:40:33', NULL, NULL, NULL),
(268, 5, 5, '/', '2018-01-25 06:40:43', NULL, NULL, NULL),
(269, 5, 5, '/', '2018-01-25 06:41:39', NULL, NULL, NULL),
(270, 6, 6, '/', '2018-01-25 06:41:39', NULL, NULL, NULL),
(271, 6, 6, '/login', '2018-01-25 06:41:41', NULL, NULL, NULL),
(272, 6, 6, '/login', '2018-01-25 06:42:08', NULL, NULL, NULL),
(273, 6, 6, '/', '2018-01-25 06:42:18', NULL, NULL, NULL),
(274, 7, 7, '/', '2018-01-25 06:45:38', NULL, NULL, NULL),
(275, 7, 7, '/login', '2018-01-25 06:45:38', NULL, NULL, NULL),
(276, 7, 7, '/login', '2018-01-25 06:45:44', NULL, NULL, NULL),
(277, 7, 7, '/login', '2018-01-25 06:46:47', NULL, NULL, NULL),
(278, 7, 7, '/login', '2018-01-25 06:47:02', NULL, NULL, NULL),
(279, 7, 7, '/login', '2018-01-25 06:47:09', NULL, NULL, NULL),
(280, 7, 7, '/login', '2018-01-25 06:53:10', NULL, NULL, NULL),
(281, 7, 7, '/login', '2018-01-25 06:54:10', NULL, NULL, NULL),
(282, 7, 7, '/', '2018-01-25 06:54:28', NULL, NULL, NULL),
(283, 7, 7, '/', '2018-01-25 06:56:11', NULL, NULL, NULL),
(284, 7, 7, '/company', '2018-01-25 06:56:13', NULL, NULL, NULL),
(285, 7, 7, '/', '2018-01-25 07:03:23', NULL, NULL, NULL),
(286, 7, 7, '/company', '2018-01-25 07:03:24', NULL, NULL, NULL),
(287, 7, 7, '/', '2018-01-25 07:06:12', NULL, NULL, NULL),
(288, 7, 7, '/company', '2018-01-25 07:06:16', NULL, NULL, NULL),
(289, 7, 7, '/', '2018-01-25 07:06:17', NULL, NULL, NULL),
(290, 7, 7, '/company', '2018-01-25 07:06:17', NULL, NULL, NULL),
(291, 7, 7, '/', '2018-01-25 07:09:32', NULL, NULL, NULL),
(292, 7, 7, '/company', '2018-01-25 07:11:22', NULL, NULL, NULL),
(293, 7, 7, '/', '2018-01-25 07:11:23', NULL, NULL, NULL),
(294, 7, 7, '/company', '2018-01-25 07:11:56', NULL, NULL, NULL),
(295, 7, 7, '/', '2018-01-25 07:11:57', NULL, NULL, NULL),
(296, 7, 7, '/', '2018-01-25 07:12:09', NULL, NULL, NULL),
(297, 8, 8, '/', '2018-01-25 07:12:10', NULL, NULL, NULL),
(298, 8, 8, '/login', '2018-01-25 07:12:11', NULL, NULL, NULL),
(299, 8, 8, '/', '2018-01-25 07:12:19', NULL, NULL, NULL),
(300, 8, 8, '/admin', '2018-01-25 07:12:21', NULL, NULL, NULL),
(301, 8, 8, '/admin', '2018-01-25 07:12:25', NULL, NULL, NULL),
(302, 8, 8, '/admin', '2018-01-25 07:13:14', NULL, NULL, NULL),
(303, 8, 8, '/admin', '2018-01-25 07:13:26', NULL, NULL, NULL),
(304, 8, 8, '/admin', '2018-01-25 07:13:43', NULL, NULL, NULL),
(305, 8, 8, '/admin', '2018-01-25 07:13:47', NULL, NULL, NULL),
(306, 8, 8, '/admin', '2018-01-25 07:13:51', NULL, NULL, NULL),
(307, 8, 8, '/admin', '2018-01-25 07:14:13', NULL, NULL, NULL),
(308, 8, 8, '/admin', '2018-01-25 07:14:14', NULL, NULL, NULL),
(309, 8, 8, '/admin', '2018-01-25 07:14:18', NULL, NULL, NULL),
(310, 8, 8, '/admin', '2018-01-25 07:14:20', NULL, NULL, NULL),
(311, 8, 8, '/admin', '2018-01-25 07:14:23', NULL, NULL, NULL),
(312, 8, 8, '/admin', '2018-01-25 07:14:47', NULL, NULL, NULL),
(313, 8, 8, '/admin-routes', '2018-01-25 07:14:50', NULL, NULL, NULL),
(314, 8, 8, '/admin-routes', '2018-01-25 07:14:52', NULL, NULL, NULL),
(315, 8, 8, '/admin-routes', '2018-01-25 07:14:56', NULL, NULL, NULL),
(316, 8, 8, '/admin', '2018-01-25 07:15:00', NULL, NULL, NULL),
(317, 8, 8, '/admin-routes', '2018-01-25 07:15:29', NULL, NULL, NULL),
(318, 8, 8, '/admin-routes', '2018-01-25 07:15:34', NULL, NULL, NULL),
(319, 8, 8, '/admin-routes', '2018-01-25 07:15:36', NULL, NULL, NULL),
(320, 8, 8, '/admin', '2018-01-25 07:15:41', NULL, NULL, NULL),
(321, 8, 8, '/admin', '2018-01-25 07:15:43', NULL, NULL, NULL),
(322, 8, 8, '/admin-routes', '2018-01-25 07:15:45', NULL, NULL, NULL),
(323, 8, 8, '/admin-clients', '2018-01-25 07:15:46', NULL, NULL, NULL),
(324, 8, 8, '/admin-clients', '2018-01-25 07:15:48', NULL, NULL, NULL),
(325, 8, 8, '/admin-clients', '2018-01-25 07:15:50', NULL, NULL, NULL),
(326, 8, 8, '/admin-clients', '2018-01-25 07:15:52', NULL, NULL, NULL),
(327, 8, 8, '/admin-routes', '2018-01-25 07:15:52', NULL, NULL, NULL),
(328, 8, 8, '/admin-clients', '2018-01-25 07:15:53', NULL, NULL, NULL),
(329, 8, 8, '/admin-routes', '2018-01-25 07:15:54', NULL, NULL, NULL),
(330, 8, 8, '/admin-clients', '2018-01-25 07:15:55', NULL, NULL, NULL),
(331, 8, 8, '/admin-clients', '2018-01-25 07:16:03', NULL, NULL, NULL),
(332, 8, 8, '/admin-routes', '2018-01-25 07:16:04', NULL, NULL, NULL),
(333, 8, 8, '/admin-clients', '2018-01-25 07:16:18', NULL, NULL, NULL),
(334, 8, 8, '/admin-routes', '2018-01-25 07:24:37', NULL, NULL, NULL),
(335, 8, 8, '/admin-clients', '2018-01-25 07:24:38', NULL, NULL, NULL),
(336, 9, 9, '/', '2018-01-25 07:25:03', NULL, NULL, NULL),
(337, 8, 8, '/admin-clients', '2018-01-25 07:28:17', NULL, NULL, NULL),
(338, 8, 8, '/admin-clients', '2018-01-25 07:28:18', NULL, NULL, NULL),
(339, 8, 8, '/admin-clients', '2018-01-25 07:28:55', NULL, NULL, NULL),
(340, 8, 8, '/admin-clients', '2018-01-25 07:28:58', NULL, NULL, NULL),
(341, 8, 8, '/admin-clients', '2018-01-25 07:29:00', NULL, NULL, NULL),
(342, 8, 8, '/admin-clients', '2018-01-25 07:29:02', NULL, NULL, NULL),
(343, 8, 8, '/admin-clients', '2018-01-25 07:29:02', NULL, NULL, NULL),
(344, 8, 8, '/admin-clients', '2018-01-25 07:29:17', NULL, NULL, NULL),
(345, 8, 8, '/admin-clients', '2018-01-25 07:31:02', NULL, NULL, NULL),
(346, 8, 8, '/admin-clients', '2018-01-25 07:32:16', NULL, NULL, NULL),
(347, 8, 8, '/admin-clients', '2018-01-25 07:36:36', NULL, NULL, NULL),
(348, 8, 8, '/admin-clients', '2018-01-25 07:43:39', NULL, NULL, NULL),
(349, 8, 8, '/admin-clients', '2018-01-25 07:49:45', NULL, NULL, NULL),
(350, 8, 8, '/', '2018-01-25 07:49:47', NULL, NULL, NULL),
(351, 8, 8, '/', '2018-01-25 07:50:04', NULL, NULL, NULL),
(352, 8, 8, '/company', '2018-01-25 07:50:05', NULL, NULL, NULL),
(353, 8, 8, '/', '2018-01-25 07:50:06', NULL, NULL, NULL),
(354, 8, 8, '/admin', '2018-01-25 07:50:07', NULL, NULL, NULL),
(355, 8, 8, '/admin-clients', '2018-01-25 07:50:09', NULL, NULL, NULL),
(356, 8, 8, '/admin-clients', '2018-01-25 07:52:04', NULL, NULL, NULL),
(357, 8, 8, '/admin-clients', '2018-01-25 07:52:12', NULL, NULL, NULL),
(358, 8, 8, '/admin-clients', '2018-01-25 07:53:25', NULL, NULL, NULL),
(359, 8, 8, '/admin-clients', '2018-01-25 07:53:58', NULL, NULL, NULL),
(360, 8, 8, '/admin-clients', '2018-01-25 07:55:09', NULL, NULL, NULL),
(361, 8, 8, '/admin-clients', '2018-01-25 07:56:14', NULL, NULL, NULL),
(362, 8, 8, '/admin-clients', '2018-01-25 07:56:25', NULL, NULL, NULL),
(363, 8, 8, '/admin-clients', '2018-01-25 07:58:18', NULL, NULL, NULL),
(364, 8, 8, '/admin-clients', '2018-01-25 08:04:09', NULL, NULL, NULL),
(365, 8, 8, '/admin-clients', '2018-01-25 08:05:15', NULL, NULL, NULL),
(366, 8, 8, '/admin-clients', '2018-01-25 08:05:28', NULL, NULL, NULL),
(367, 8, 8, '/admin-clients', '2018-01-25 08:06:27', NULL, NULL, NULL),
(368, 8, 8, '/admin-clients', '2018-01-25 08:08:31', NULL, NULL, NULL),
(369, 8, 8, '/admin-clients', '2018-01-25 08:09:25', NULL, NULL, NULL),
(370, 8, 8, '/admin-clients', '2018-01-25 08:10:02', NULL, NULL, NULL),
(371, 8, 8, '/admin-clients', '2018-01-25 08:10:45', NULL, NULL, NULL),
(372, 8, 8, '/admin-clients', '2018-01-25 08:14:13', NULL, NULL, NULL),
(373, 8, 8, '/admin-clients', '2018-01-25 08:15:33', NULL, NULL, NULL),
(374, 8, 8, '/admin-clients', '2018-01-25 08:16:05', NULL, NULL, NULL),
(375, 8, 8, '/admin-clients', '2018-01-25 08:16:54', NULL, NULL, NULL),
(376, 8, 8, '/admin-clients', '2018-01-25 08:19:32', NULL, NULL, NULL),
(377, 8, 8, '/admin-clients', '2018-01-25 08:24:05', NULL, NULL, NULL),
(378, 8, 8, '/admin-clients', '2018-01-25 08:24:30', NULL, NULL, NULL),
(379, 8, 8, '/admin-clients', '2018-01-25 08:25:29', NULL, NULL, NULL),
(380, 8, 8, '/admin-clients', '2018-01-25 08:25:53', NULL, NULL, NULL),
(381, 8, 8, '/admin-clients', '2018-01-25 08:26:38', NULL, NULL, NULL),
(382, 8, 8, '/admin-clients', '2018-01-25 08:26:58', NULL, NULL, NULL),
(383, 8, 8, '/admin-clients', '2018-01-25 08:27:44', NULL, NULL, NULL),
(384, 8, 8, '/admin-clients', '2018-01-25 08:28:02', NULL, NULL, NULL),
(385, 8, 8, '/admin-clients', '2018-01-25 08:28:28', NULL, NULL, NULL),
(386, 8, 8, '/admin-clients', '2018-01-25 08:28:37', NULL, NULL, NULL),
(387, 8, 8, '/admin-clients', '2018-01-25 08:29:12', NULL, NULL, NULL),
(388, 8, 8, '/admin-clients', '2018-01-25 08:29:59', NULL, NULL, NULL),
(389, 8, 8, '/admin-clients', '2018-01-25 08:31:48', NULL, NULL, NULL),
(390, 8, 8, '/admin-clients', '2018-01-25 08:31:50', NULL, NULL, NULL),
(391, 8, 8, '/admin-routes', '2018-01-25 08:31:50', NULL, NULL, NULL),
(392, 8, 8, '/admin', '2018-01-25 08:33:10', NULL, NULL, NULL),
(393, 8, 8, '/admin', '2018-01-25 08:33:12', NULL, NULL, NULL),
(394, 8, 8, '/admin', '2018-01-25 08:34:02', NULL, NULL, NULL),
(395, 8, 8, '/admin', '2018-01-25 08:34:04', NULL, NULL, NULL),
(396, 8, 8, '/admin', '2018-01-25 08:34:10', NULL, NULL, NULL),
(397, 8, 8, '/admin', '2018-01-25 08:34:14', NULL, NULL, NULL),
(398, 8, 8, '/admin-routes', '2018-01-25 08:34:19', NULL, NULL, NULL),
(399, 8, 8, '/admin-routes', '2018-01-25 08:34:36', NULL, NULL, NULL),
(400, 8, 8, '/admin-attendance', '2018-01-25 08:34:37', NULL, NULL, NULL),
(401, 8, 8, '/admin', '2018-01-25 08:34:44', NULL, NULL, NULL),
(402, 8, 8, '/admin-attendance', '2018-01-25 08:34:45', NULL, NULL, NULL),
(403, 8, 8, '/admin-attendance', '2018-01-25 08:34:46', NULL, NULL, NULL),
(404, 8, 8, '/admin-attendance', '2018-01-25 08:34:49', NULL, NULL, NULL),
(405, 8, 8, '/admin-attendance', '2018-01-25 08:34:50', NULL, NULL, NULL),
(406, 8, 8, '/admin-attendance', '2018-01-25 08:35:18', NULL, NULL, NULL),
(407, 8, 8, '/admin-attendance', '2018-01-25 08:35:46', NULL, NULL, NULL),
(408, 8, 8, '/admin-routes', '2018-01-25 08:35:47', NULL, NULL, NULL),
(409, 8, 8, '/admin-clients', '2018-01-25 08:35:48', NULL, NULL, NULL),
(410, 8, 8, '/admin-attendance', '2018-01-25 08:42:05', NULL, NULL, NULL),
(411, 8, 8, '/', '2018-01-25 08:43:04', NULL, NULL, NULL),
(412, 8, 8, '/company', '2018-01-25 08:43:05', NULL, NULL, NULL),
(413, 8, 8, '/company', '2018-01-25 08:45:19', NULL, NULL, NULL),
(414, 8, 8, '/', '2018-01-25 08:46:42', NULL, NULL, NULL),
(415, 8, 8, '/admin', '2018-01-25 08:49:23', NULL, NULL, NULL),
(416, 8, 8, '/admin', '2018-01-25 08:51:02', NULL, NULL, NULL),
(417, 8, 8, '/admin', '2018-01-25 08:52:27', NULL, NULL, NULL),
(418, 8, 8, '/', '2018-01-25 08:52:29', NULL, NULL, NULL),
(419, 8, 8, '/admin', '2018-01-25 08:52:33', NULL, NULL, NULL),
(420, 8, 8, '/admin', '2018-01-25 08:52:35', NULL, NULL, NULL),
(421, 8, 8, '/admin', '2018-01-25 08:52:38', NULL, NULL, NULL),
(422, 8, 8, '/admin', '2018-01-25 08:52:41', NULL, NULL, NULL),
(423, 8, 8, '/admin', '2018-01-25 08:53:10', NULL, NULL, NULL),
(424, 8, 8, '/admin', '2018-01-25 08:53:14', NULL, NULL, NULL),
(425, 8, 8, '/', '2018-01-25 08:53:16', NULL, NULL, NULL),
(426, 10, 10, '/', '2018-01-25 08:54:01', NULL, NULL, NULL),
(427, 10, 10, '/login', '2018-01-25 08:54:04', NULL, NULL, NULL),
(428, 10, 10, '/', '2018-01-25 08:54:14', NULL, NULL, NULL),
(429, 10, 10, '/admin', '2018-01-25 08:54:16', NULL, NULL, NULL),
(430, 10, 10, '/admin-clients', '2018-01-25 08:54:18', NULL, NULL, NULL),
(431, 10, 10, '/admin-clients', '2018-01-25 08:54:24', NULL, NULL, NULL),
(432, 10, 10, '/admin-clients', '2018-01-25 08:54:29', NULL, NULL, NULL),
(433, 10, 10, '/admin-clients', '2018-01-25 08:54:30', NULL, NULL, NULL),
(434, 10, 10, '/admin-clients', '2018-01-25 08:55:22', NULL, NULL, NULL),
(435, 10, 10, '/admin-clients', '2018-01-25 08:55:31', NULL, NULL, NULL),
(436, 10, 10, '/admin-routes', '2018-01-25 08:56:06', NULL, NULL, NULL),
(437, 10, 10, '/admin-routes', '2018-01-25 08:57:49', NULL, NULL, NULL),
(438, 10, 10, '/admin-routes', '2018-01-25 08:58:02', NULL, NULL, NULL),
(439, 10, 10, '/admin-routes', '2018-01-25 09:05:29', NULL, NULL, NULL),
(440, 10, 10, '/contacts', '2018-01-25 09:05:33', NULL, NULL, NULL),
(441, 10, 10, '/contacts', '2018-01-25 09:05:37', NULL, NULL, NULL),
(442, 10, 10, '/admin-routes', '2018-01-25 09:06:51', NULL, NULL, NULL),
(443, 10, 10, '/admin-routes', '2018-01-25 09:10:51', NULL, NULL, NULL),
(444, 10, 10, '/admin-routes', '2018-01-25 09:11:00', NULL, NULL, NULL),
(445, 10, 10, '/admin-routes', '2018-01-25 09:11:14', NULL, NULL, NULL),
(446, 10, 10, '/contacts', '2018-01-25 09:11:31', NULL, NULL, NULL),
(447, 10, 10, '/contacts', '2018-01-25 09:12:15', NULL, NULL, NULL),
(448, 10, 10, '/contacts', '2018-01-25 09:12:42', NULL, NULL, NULL),
(449, 10, 10, '/contacts', '2018-01-25 09:12:43', NULL, NULL, NULL),
(450, 10, 10, '/contacts', '2018-01-25 09:14:02', NULL, NULL, NULL),
(451, 10, 10, '/contacts', '2018-01-25 09:14:18', NULL, NULL, NULL),
(452, 10, 10, '/contacts', '2018-01-25 09:14:21', NULL, NULL, NULL),
(453, 10, 10, '/contacts', '2018-01-25 09:14:42', NULL, NULL, NULL),
(454, 10, 10, '/contacts', '2018-01-25 09:15:01', NULL, NULL, NULL),
(455, 10, 10, '/contacts', '2018-01-25 09:18:50', NULL, NULL, NULL),
(456, 10, 10, '/contacts', '2018-01-25 09:19:24', NULL, NULL, NULL),
(457, 10, 10, '/contacts', '2018-01-25 09:22:57', NULL, NULL, NULL),
(458, 10, 10, '/contacts', '2018-01-25 09:23:04', NULL, NULL, NULL),
(459, 10, 10, '/contacts', '2018-01-25 09:24:23', NULL, NULL, NULL),
(460, 10, 10, '/contacts', '2018-01-25 09:24:24', NULL, NULL, NULL),
(461, 10, 10, '/contacts', '2018-01-25 09:25:33', NULL, NULL, NULL),
(462, 10, 10, '/contacts', '2018-01-25 09:27:06', NULL, NULL, NULL),
(463, 10, 10, '/', '2018-01-25 09:27:57', NULL, NULL, NULL),
(464, 10, 10, '/', '2018-01-25 09:28:00', NULL, NULL, NULL),
(465, 10, 10, '/', '2018-01-25 09:28:07', NULL, NULL, NULL),
(466, 10, 10, '/', '2018-01-25 09:28:09', NULL, NULL, NULL),
(467, 10, 10, '/', '2018-01-25 09:28:11', NULL, NULL, NULL),
(468, 10, 10, '/', '2018-01-25 09:28:13', NULL, NULL, NULL),
(469, 10, 10, '/admin-routes', '2018-01-25 09:28:26', NULL, NULL, NULL),
(470, 10, 10, '/admin-routes', '2018-01-25 09:28:28', NULL, NULL, NULL),
(471, 10, 10, '/admin-routes', '2018-01-25 09:28:51', NULL, NULL, NULL),
(472, 10, 10, '/cemeteries', '2018-01-25 09:28:53', NULL, NULL, NULL),
(473, 10, 10, '/cemeteries', '2018-01-25 09:28:57', NULL, NULL, NULL),
(474, 10, 10, '/cemeteries', '2018-01-25 09:28:58', NULL, NULL, NULL),
(475, 10, 10, '/cemeteries', '2018-01-25 09:29:07', NULL, NULL, NULL),
(476, 10, 10, '/cemeteries', '2018-01-25 09:29:08', NULL, NULL, NULL),
(477, 10, 10, '/cemeteries', '2018-01-25 09:29:10', NULL, NULL, NULL),
(478, 10, 10, '/cemeteries', '2018-01-25 09:29:12', NULL, NULL, NULL),
(479, 10, 10, '/cemeteries', '2018-01-25 09:29:18', NULL, NULL, NULL),
(480, 10, 10, '/cemeteries', '2018-01-25 09:29:20', NULL, NULL, NULL),
(481, 10, 10, '/cemeteries', '2018-01-25 09:29:21', NULL, NULL, NULL),
(482, 10, 10, '/cemeteries', '2018-01-25 09:29:23', NULL, NULL, NULL),
(483, 10, 10, '/cemeteries', '2018-01-25 09:29:23', NULL, NULL, NULL),
(484, 10, 10, '/cemeteries', '2018-01-25 09:29:42', NULL, NULL, NULL),
(485, 10, 10, '/cemeteries', '2018-01-25 09:29:56', NULL, NULL, NULL),
(486, 10, 10, '/cemeteries', '2018-01-25 09:30:08', NULL, NULL, NULL),
(487, 10, 10, '/cemeteries', '2018-01-25 09:30:13', NULL, NULL, NULL),
(488, 10, 10, '/cemeteries', '2018-01-25 09:30:14', NULL, NULL, NULL),
(489, 10, 10, '/cemeteries', '2018-01-25 09:30:15', NULL, NULL, NULL),
(490, 10, 10, '/cemeteries', '2018-01-25 09:30:29', NULL, NULL, NULL),
(491, 10, 10, '/cemeteries', '2018-01-25 09:30:30', NULL, NULL, NULL),
(492, 10, 10, '/cemeteries', '2018-01-25 09:30:38', NULL, NULL, NULL),
(493, 10, 10, '/cemeteries', '2018-01-25 09:30:39', NULL, NULL, NULL),
(494, 10, 10, '/cemeteries', '2018-01-25 09:30:41', NULL, NULL, NULL),
(495, 10, 10, '/cemeteries', '2018-01-25 09:30:41', NULL, NULL, NULL),
(496, 10, 10, '/cemeteries', '2018-01-25 09:31:07', NULL, NULL, NULL),
(497, 10, 10, '/cemeteries', '2018-01-25 09:31:08', NULL, NULL, NULL),
(498, 10, 10, '/cemeteries', '2018-01-25 09:31:12', NULL, NULL, NULL),
(499, 10, 10, '/cemeteries', '2018-01-25 09:31:12', NULL, NULL, NULL),
(500, 10, 10, '/cemeteries', '2018-01-25 09:33:15', NULL, NULL, NULL),
(501, 10, 10, '/cemeteries', '2018-01-25 09:33:15', NULL, NULL, NULL),
(502, 10, 10, '/cemeteries', '2018-01-25 09:33:19', NULL, NULL, NULL),
(503, 10, 10, '/cemeteries', '2018-01-25 09:33:19', NULL, NULL, NULL),
(504, 10, 10, '/cemeteries', '2018-01-25 09:33:22', NULL, NULL, NULL),
(505, 10, 10, '/cemeteries', '2018-01-25 09:33:22', NULL, NULL, NULL),
(506, 10, 10, '/cemeteries', '2018-01-25 09:33:25', NULL, NULL, NULL),
(507, 10, 10, '/cemeteries', '2018-01-25 09:33:25', NULL, NULL, NULL),
(508, 10, 10, '/cemeteries', '2018-01-25 09:33:29', NULL, NULL, NULL),
(509, 10, 10, '/cemeteries', '2018-01-25 09:33:31', NULL, NULL, NULL),
(510, 10, 10, '/', '2018-01-25 09:35:51', NULL, NULL, NULL),
(511, 10, 10, '/cemeteries', '2018-01-25 09:35:52', NULL, NULL, NULL),
(512, 10, 10, '/', '2018-01-25 09:35:58', NULL, NULL, NULL),
(513, 10, 10, '/admin', '2018-01-25 09:40:13', NULL, NULL, NULL),
(514, 10, 10, '/admin-clients', '2018-01-25 09:40:15', NULL, NULL, NULL),
(515, 10, 10, '/admin-routes', '2018-01-25 09:40:16', NULL, NULL, NULL),
(516, 10, 10, '/admin-routes', '2018-01-25 09:40:37', NULL, NULL, NULL),
(517, 10, 10, '/news/1', '2018-01-25 09:40:42', NULL, NULL, NULL),
(518, 10, 10, '/news/1', '2018-01-25 09:40:44', NULL, NULL, NULL),
(519, 10, 10, '/news/1', '2018-01-25 09:40:45', NULL, NULL, NULL),
(520, 10, 10, '/news/1', '2018-01-25 09:40:47', NULL, NULL, NULL),
(521, 10, 10, '/news/1', '2018-01-25 09:40:49', NULL, NULL, NULL),
(522, 10, 10, '/news/1', '2018-01-25 09:40:53', NULL, NULL, NULL),
(523, 10, 10, '/news/1', '2018-01-25 09:41:21', NULL, NULL, NULL),
(524, 10, 10, '/news/new-news-1', '2018-01-25 09:41:24', NULL, NULL, NULL),
(525, 10, 10, '/news/new-news-2', '2018-01-25 09:41:26', NULL, NULL, NULL),
(526, 10, 10, '/news/new-news-2', '2018-01-25 09:41:30', NULL, NULL, NULL),
(527, 10, 10, '/news/new-news-2', '2018-01-25 09:41:31', NULL, NULL, NULL),
(528, 10, 10, '/news/new-news-1', '2018-01-25 09:41:33', NULL, NULL, NULL),
(529, 10, 10, '/admin-routes', '2018-01-25 09:42:09', NULL, NULL, NULL),
(530, 10, 10, '/news/new-news-1', '2018-01-25 09:42:11', NULL, NULL, NULL),
(531, 10, 10, '/news/new-news-1', '2018-01-25 09:43:37', NULL, NULL, NULL),
(532, 10, 10, '/admin-clients', '2018-01-25 09:45:22', NULL, NULL, NULL),
(533, 10, 10, '/admin-clients', '2018-01-25 09:46:10', NULL, NULL, NULL),
(534, 10, 10, '/', '2018-01-25 09:46:12', NULL, NULL, NULL),
(535, 10, 10, '/', '2018-01-25 09:46:16', NULL, NULL, NULL),
(536, 10, 10, '/', '2018-01-25 09:46:17', NULL, NULL, NULL),
(537, 10, 10, '/', '2018-01-25 09:46:19', NULL, NULL, NULL),
(538, 10, 10, '/company', '2018-01-25 09:46:21', NULL, NULL, NULL),
(539, 10, 10, '/admin', '2018-01-25 09:46:24', NULL, NULL, NULL),
(540, 10, 10, '/admin-clients', '2018-01-25 09:46:27', NULL, NULL, NULL),
(541, 10, 10, '/admin-clients', '2018-01-25 09:47:17', NULL, NULL, NULL),
(542, 10, 10, '/admin-clients', '2018-01-25 09:47:34', NULL, NULL, NULL),
(543, 10, 10, '/admin-clients', '2018-01-25 09:48:53', NULL, NULL, NULL),
(544, 10, 10, '/admin-clients', '2018-01-25 09:49:28', NULL, NULL, NULL),
(545, 10, 10, '/admin-clients', '2018-01-25 09:50:53', NULL, NULL, NULL),
(546, 10, 10, '/admin-clients', '2018-01-25 09:52:02', NULL, NULL, NULL),
(547, 10, 10, '/admin-clients', '2018-01-25 09:52:17', NULL, NULL, NULL),
(548, 10, 10, '/admin-clients', '2018-01-25 09:52:34', NULL, NULL, NULL),
(549, 10, 10, '/admin-clients', '2018-01-25 09:52:53', NULL, NULL, NULL),
(550, 10, 10, '/admin-clients', '2018-01-25 09:52:58', NULL, NULL, NULL),
(551, 10, 10, '/admin-routes', '2018-01-25 09:53:36', NULL, NULL, NULL),
(552, 10, 10, '/admin-routes', '2018-01-25 09:54:24', NULL, NULL, NULL),
(553, 10, 10, '/admin-routes', '2018-01-25 09:54:57', NULL, NULL, NULL),
(554, 10, 10, '/admin-routes', '2018-01-25 09:55:34', NULL, NULL, NULL),
(555, 10, 10, '/admin-routes', '2018-01-25 09:55:36', NULL, NULL, NULL),
(556, 10, 10, '/admin-routes', '2018-01-25 09:56:46', NULL, NULL, NULL),
(557, 10, 10, '/admin-routes', '2018-01-25 09:56:57', NULL, NULL, NULL),
(558, 10, 10, '/admin-routes', '2018-01-25 09:57:20', NULL, NULL, NULL),
(559, 10, 10, '/admin-routes', '2018-01-25 09:57:30', NULL, NULL, NULL),
(560, 10, 10, '/admin-routes', '2018-01-25 09:57:45', NULL, NULL, NULL),
(561, 10, 10, '/admin-routes', '2018-01-25 09:57:56', NULL, NULL, NULL),
(562, 10, 10, '/admin-routes', '2018-01-25 09:58:11', NULL, NULL, NULL),
(563, 10, 10, '/admin-routes', '2018-01-25 10:00:27', NULL, NULL, NULL),
(564, 10, 10, '/admin-routes', '2018-01-25 10:00:28', NULL, NULL, NULL),
(565, 10, 10, '/admin-routes', '2018-01-25 10:00:54', NULL, NULL, NULL),
(566, 10, 10, '/', '2018-01-25 10:00:58', NULL, NULL, NULL),
(567, 10, 10, '/admin-routes', '2018-01-25 10:01:28', NULL, NULL, NULL),
(568, 10, 10, '/', '2018-01-25 10:01:30', NULL, NULL, NULL),
(569, 10, 10, '/admin-routes', '2018-01-25 10:05:52', NULL, NULL, NULL),
(570, 10, 10, '/admin-routes', '2018-01-25 10:06:44', NULL, NULL, NULL),
(571, 10, 10, '/admin-routes', '2018-01-25 10:07:07', NULL, NULL, NULL),
(572, 11, 11, '/', '2018-01-25 10:27:05', NULL, NULL, NULL),
(573, 11, 11, '/admin', '2018-01-25 10:28:52', NULL, NULL, NULL),
(574, 11, 11, '/login', '2018-01-25 10:29:44', NULL, NULL, NULL),
(575, 11, 11, '/admin', '2018-01-25 10:29:56', NULL, NULL, NULL),
(576, 11, 11, '/admin', '2018-01-25 10:30:02', NULL, NULL, NULL),
(577, 12, 12, '/', '2018-01-25 10:31:14', NULL, NULL, NULL),
(578, 12, 12, '/', '2018-01-25 10:31:31', NULL, NULL, NULL),
(579, 12, 12, '/company', '2018-01-25 10:31:38', NULL, NULL, NULL),
(580, 12, 12, '/admin', '2018-01-25 10:31:40', NULL, NULL, NULL),
(581, 12, 12, '/company', '2018-01-25 10:34:02', NULL, NULL, NULL),
(582, 12, 12, '/', '2018-01-25 10:34:02', NULL, NULL, NULL),
(583, 12, 12, '/login', '2018-01-25 10:37:05', NULL, NULL, NULL),
(584, 12, 12, '/', '2018-01-25 10:37:12', NULL, NULL, NULL),
(585, 12, 12, '/', '2018-01-25 10:37:14', NULL, NULL, NULL),
(586, 12, 12, '/company', '2018-01-25 10:37:15', NULL, NULL, NULL),
(587, 12, 12, '/admin', '2018-01-25 10:37:18', NULL, NULL, NULL),
(588, 12, 12, '/admin-clients', '2018-01-25 10:37:20', NULL, NULL, NULL),
(589, 12, 12, '/admin-routes', '2018-01-25 10:37:22', NULL, NULL, NULL),
(590, 12, 12, '/admin-routes', '2018-01-25 10:38:30', NULL, NULL, NULL),
(591, 12, 12, '/admin-routes', '2018-01-25 10:40:49', NULL, NULL, NULL),
(592, 12, 12, '/admin-routes', '2018-01-25 10:41:51', NULL, NULL, NULL),
(593, 12, 12, '/admin-routes', '2018-01-25 10:42:06', NULL, NULL, NULL),
(594, 12, 12, '/', '2018-01-25 10:42:07', NULL, NULL, NULL),
(595, 12, 12, '/company', '2018-01-25 10:42:08', NULL, NULL, NULL),
(596, 12, 12, '/cemeteries', '2018-01-25 10:42:09', NULL, NULL, NULL),
(597, 12, 12, '/company', '2018-01-25 10:42:09', NULL, NULL, NULL),
(598, 12, 12, '/cemeteries', '2018-01-25 10:42:10', NULL, NULL, NULL),
(599, 12, 12, '/cemeteries', '2018-01-25 10:42:59', NULL, NULL, NULL),
(600, 12, 12, '/admin-routes', '2018-01-25 10:43:02', NULL, NULL, NULL),
(601, 12, 12, '/cemeteries', '2018-01-25 10:43:05', NULL, NULL, NULL),
(602, 12, 12, '/admin-routes', '2018-01-25 10:44:12', NULL, NULL, NULL),
(603, 12, 12, '/admin-routes', '2018-01-25 10:44:27', NULL, NULL, NULL),
(604, 12, 12, '/admin-routes', '2018-01-25 10:44:55', NULL, NULL, NULL),
(605, 12, 12, '/admin-routes', '2018-01-25 10:45:09', NULL, NULL, NULL),
(606, 12, 12, '/admin-routes', '2018-01-25 10:45:50', NULL, NULL, NULL),
(607, 12, 12, '/admin-routes', '2018-01-25 10:46:08', NULL, NULL, NULL),
(608, 12, 12, '/admin-routes', '2018-01-25 10:46:17', NULL, NULL, NULL),
(609, 12, 12, '/admin-routes', '2018-01-25 10:46:33', NULL, NULL, NULL),
(610, 12, 12, '/admin-routes', '2018-01-25 10:49:37', NULL, NULL, NULL),
(611, 12, 12, '/admin-routes', '2018-01-25 10:51:27', NULL, NULL, NULL),
(612, 13, 13, '/', '2018-01-25 10:51:38', NULL, NULL, NULL),
(613, 13, 13, '/login', '2018-01-25 10:51:39', NULL, NULL, NULL),
(614, 13, 13, '/', '2018-01-25 10:52:49', NULL, NULL, NULL),
(615, 13, 13, '/admin', '2018-01-25 10:52:51', NULL, NULL, NULL),
(616, 13, 13, '/admin-clients', '2018-01-25 10:52:53', NULL, NULL, NULL),
(617, 13, 13, '/admin-routes', '2018-01-25 10:52:54', NULL, NULL, NULL),
(618, 13, 13, '/admin-routes', '2018-01-25 10:53:35', NULL, NULL, NULL),
(619, 13, 13, '/admin-routes', '2018-01-25 10:54:00', NULL, NULL, NULL),
(620, 13, 13, '/admin-routes', '2018-01-25 10:54:01', NULL, NULL, NULL),
(621, 13, 13, '/admin-routes', '2018-01-25 10:54:57', NULL, NULL, NULL),
(622, 13, 13, '/admin-routes', '2018-01-25 10:55:13', NULL, NULL, NULL),
(623, 13, 13, '/admin-routes', '2018-01-25 10:55:54', NULL, NULL, NULL),
(624, 13, 13, '/admin-routes', '2018-01-25 10:56:41', NULL, NULL, NULL),
(625, 13, 13, '/admin-routes', '2018-01-25 10:56:58', NULL, NULL, NULL),
(626, 13, 13, '/admin-routes', '2018-01-25 10:57:23', NULL, NULL, NULL),
(627, 13, 13, '/admin-routes', '2018-01-25 10:57:31', NULL, NULL, NULL),
(628, 13, 13, '/admin-routes', '2018-01-25 10:57:41', NULL, NULL, NULL),
(629, 13, 13, '/admin-routes', '2018-01-25 10:57:45', NULL, NULL, NULL),
(630, 13, 13, '/admin-routes', '2018-01-25 10:58:28', NULL, NULL, NULL),
(631, 13, 13, '/admin-routes', '2018-01-25 10:58:48', NULL, NULL, NULL),
(632, 13, 13, '/admin-routes', '2018-01-25 11:01:03', NULL, NULL, NULL),
(633, 14, 14, '/', '2018-01-25 11:01:25', NULL, NULL, NULL),
(634, 14, 14, '/login', '2018-01-25 11:01:34', NULL, NULL, NULL),
(635, 14, 14, '/', '2018-01-25 11:01:40', NULL, NULL, NULL),
(636, 14, 14, '/', '2018-01-25 11:01:42', NULL, NULL, NULL),
(637, 14, 14, '/', '2018-01-25 11:01:43', NULL, NULL, NULL),
(638, 14, 14, '/', '2018-01-25 11:04:31', NULL, NULL, NULL),
(639, 14, 14, '/', '2018-01-25 11:04:39', NULL, NULL, NULL),
(640, 14, 14, '/', '2018-01-25 11:04:53', NULL, NULL, NULL),
(641, 14, 14, '/', '2018-01-25 11:04:56', NULL, NULL, NULL),
(642, 14, 14, '/admin', '2018-01-25 11:04:57', NULL, NULL, NULL),
(643, 14, 14, '/admin-clients', '2018-01-25 11:04:58', NULL, NULL, NULL),
(644, 14, 14, '/admin-routes', '2018-01-25 11:04:59', NULL, NULL, NULL),
(645, 14, 14, '/admin-routes', '2018-01-25 11:05:34', NULL, NULL, NULL),
(646, 15, 15, '/', '2018-01-25 11:05:38', NULL, NULL, NULL),
(647, 15, 15, '/login', '2018-01-25 11:05:39', NULL, NULL, NULL),
(648, 15, 15, '/', '2018-01-25 11:05:43', NULL, NULL, NULL),
(649, 15, 15, '/admin', '2018-01-25 11:05:44', NULL, NULL, NULL),
(650, 15, 15, '/admin-clients', '2018-01-25 11:05:46', NULL, NULL, NULL),
(651, 15, 15, '/admin-routes', '2018-01-25 11:05:46', NULL, NULL, NULL),
(652, 15, 15, '/', '2018-01-25 11:10:07', NULL, NULL, NULL),
(653, 15, 15, '/', '2018-01-25 11:10:11', NULL, NULL, NULL),
(654, 15, 15, '/', '2018-01-25 11:10:12', NULL, NULL, NULL),
(655, 15, 15, '/', '2018-01-25 11:10:30', NULL, NULL, NULL),
(656, 15, 15, '/', '2018-01-25 11:10:36', NULL, NULL, NULL),
(657, 15, 15, '/', '2018-01-25 11:10:43', NULL, NULL, NULL),
(658, 15, 15, '/company', '2018-01-25 11:10:46', NULL, NULL, NULL),
(659, 15, 15, '/company', '2018-01-25 11:10:48', NULL, NULL, NULL),
(660, 15, 15, '/company', '2018-01-25 11:10:48', NULL, NULL, NULL),
(661, 15, 15, '/company', '2018-01-25 11:11:15', NULL, NULL, NULL),
(662, 15, 15, '/company', '2018-01-25 11:11:19', NULL, NULL, NULL),
(663, 15, 15, '/admin', '2018-01-25 11:12:57', NULL, NULL, NULL),
(664, 15, 15, '/admin-routes', '2018-01-25 11:12:58', NULL, NULL, NULL),
(665, 15, 15, '/admin-routes', '2018-01-25 11:12:59', NULL, NULL, NULL),
(666, 15, 15, '/admin-routes', '2018-01-25 11:13:09', NULL, NULL, NULL),
(667, 15, 15, '/admin-routes', '2018-01-25 11:13:43', NULL, NULL, NULL),
(668, 15, 15, '/admin-routes', '2018-01-25 11:13:55', NULL, NULL, NULL),
(669, 15, 15, '/admin-routes', '2018-01-25 11:14:45', NULL, NULL, NULL),
(670, 15, 15, '/admin-routes', '2018-01-25 11:14:59', NULL, NULL, NULL),
(671, 15, 15, '/admin-routes', '2018-01-25 11:15:29', NULL, NULL, NULL),
(672, 15, 15, '/admin-routes', '2018-01-25 11:15:49', NULL, NULL, NULL),
(673, 15, 15, '/admin-routes', '2018-01-25 11:16:01', NULL, NULL, NULL),
(674, 15, 15, '/admin-routes', '2018-01-25 11:16:20', NULL, NULL, NULL),
(675, 15, 15, '/admin-routes', '2018-01-25 11:18:12', NULL, NULL, NULL),
(676, 15, 15, '/admin-routes', '2018-01-25 11:19:23', NULL, NULL, NULL),
(677, 15, 15, '/admin-routes', '2018-01-25 11:19:30', NULL, NULL, NULL),
(678, 15, 15, '/admin-routes', '2018-01-25 11:20:37', NULL, NULL, NULL),
(679, 15, 15, '/admin-routes', '2018-01-25 11:20:51', NULL, NULL, NULL),
(680, 15, 15, '/admin-routes', '2018-01-25 11:21:19', NULL, NULL, NULL),
(681, 15, 15, '/admin-routes', '2018-01-25 11:21:41', NULL, NULL, NULL),
(682, 15, 15, '/admin-routes', '2018-01-25 11:23:11', NULL, NULL, NULL),
(683, 15, 15, '/admin-routes', '2018-01-25 11:24:51', NULL, NULL, NULL),
(684, 15, 15, '/admin-routes', '2018-01-25 11:25:00', NULL, NULL, NULL),
(685, 15, 15, '/admin-routes', '2018-01-25 11:25:38', NULL, NULL, NULL),
(686, 15, 15, '/admin-routes', '2018-01-25 11:26:24', NULL, NULL, NULL),
(687, 16, 16, '/', '2018-01-25 11:26:29', NULL, NULL, NULL),
(688, 16, 16, '/login', '2018-01-25 11:26:30', NULL, NULL, NULL),
(689, 16, 16, '/', '2018-01-25 11:26:35', NULL, NULL, NULL),
(690, 16, 16, '/admin', '2018-01-25 11:26:37', NULL, NULL, NULL),
(691, 16, 16, '/admin-routes', '2018-01-25 11:26:38', NULL, NULL, NULL),
(692, 16, 16, '/admin-routes', '2018-01-25 11:27:53', NULL, NULL, NULL),
(693, 16, 16, '/admin-routes', '2018-01-25 11:27:56', NULL, NULL, NULL),
(694, 16, 16, '/admin-routes', '2018-01-25 11:28:54', NULL, NULL, NULL),
(695, 17, 17, '/', '2018-01-25 11:28:55', NULL, NULL, NULL),
(696, 17, 17, '/login', '2018-01-25 11:28:56', NULL, NULL, NULL),
(697, 17, 17, '/', '2018-01-25 11:29:00', NULL, NULL, NULL),
(698, 17, 17, '/admin', '2018-01-25 11:29:01', NULL, NULL, NULL),
(699, 17, 17, '/admin-routes', '2018-01-25 11:29:02', NULL, NULL, NULL),
(700, 17, 17, '/admin-routes', '2018-01-25 11:29:13', NULL, NULL, NULL),
(701, 17, 17, '/admin-routes', '2018-01-25 11:30:32', NULL, NULL, NULL),
(702, 17, 17, '/admin-routes', '2018-01-25 11:30:53', NULL, NULL, NULL),
(703, 17, 17, '/admin-routes', '2018-01-25 11:30:55', NULL, NULL, NULL),
(704, 17, 17, '/admin-routes', '2018-01-25 11:31:39', NULL, NULL, NULL),
(705, 17, 17, '/admin-routes', '2018-01-25 11:31:56', NULL, NULL, NULL),
(706, 17, 17, '/admin-routes', '2018-01-25 11:32:01', NULL, NULL, NULL),
(707, 17, 17, '/admin-routes', '2018-01-25 11:32:08', NULL, NULL, NULL),
(708, 17, 17, '/admin-routes', '2018-01-25 11:32:37', NULL, NULL, NULL),
(709, 18, 18, '/', '2018-01-25 11:32:50', NULL, NULL, NULL),
(710, 18, 18, '/login', '2018-01-25 11:32:54', NULL, NULL, NULL),
(711, 18, 18, '/', '2018-01-25 11:33:00', NULL, NULL, NULL),
(712, 18, 18, '/admin', '2018-01-25 11:33:04', NULL, NULL, NULL),
(713, 18, 18, '/admin-routes', '2018-01-25 11:33:07', NULL, NULL, NULL),
(714, 18, 18, '/admin-routes', '2018-01-25 11:33:12', NULL, NULL, NULL),
(715, 18, 18, '/admin-routes', '2018-01-25 11:33:17', NULL, NULL, NULL),
(716, 19, 19, '/', '2018-01-25 11:33:50', NULL, NULL, NULL),
(717, 19, 19, '/login', '2018-01-25 11:33:51', NULL, NULL, NULL),
(718, 19, 19, '/', '2018-01-25 11:33:55', NULL, NULL, NULL),
(719, 19, 19, '/admin', '2018-01-25 11:33:56', NULL, NULL, NULL),
(720, 19, 19, '/admin-routes', '2018-01-25 11:33:57', NULL, NULL, NULL),
(721, 19, 19, '/admin-routes', '2018-01-25 11:34:04', NULL, NULL, NULL),
(722, 19, 19, '/admin-routes', '2018-01-25 11:34:50', NULL, NULL, NULL),
(723, 19, 19, '/admin-routes', '2018-01-25 11:34:52', NULL, NULL, NULL),
(724, 19, 19, '/admin-routes', '2018-01-25 11:35:19', NULL, NULL, NULL),
(725, 19, 19, '/admin-routes', '2018-01-25 11:35:20', NULL, NULL, NULL),
(726, 19, 19, '/admin-routes', '2018-01-25 11:35:20', NULL, NULL, NULL),
(727, 19, 19, '/admin-routes', '2018-01-25 11:35:25', NULL, NULL, NULL),
(728, 19, 19, '/admin-routes', '2018-01-25 11:35:27', NULL, NULL, NULL),
(729, 19, 19, '/admin-routes', '2018-01-25 11:36:01', NULL, NULL, NULL),
(730, 19, 19, '/admin-routes', '2018-01-25 11:39:15', NULL, NULL, NULL),
(731, 19, 19, '/admin-routes', '2018-01-25 11:39:34', NULL, NULL, NULL),
(732, 19, 19, '/admin-routes', '2018-01-25 11:39:57', NULL, NULL, NULL),
(733, 19, 19, '/admin-routes', '2018-01-25 11:41:10', NULL, NULL, NULL),
(734, 19, 19, '/admin-routes', '2018-01-25 11:41:26', NULL, NULL, NULL),
(735, 19, 19, '/admin-routes', '2018-01-25 11:42:07', NULL, NULL, NULL),
(736, 19, 19, '/admin-routes', '2018-01-25 11:42:14', NULL, NULL, NULL),
(737, 19, 19, '/admin-routes', '2018-01-25 11:42:18', NULL, NULL, NULL),
(738, 19, 19, '/admin-routes', '2018-01-25 11:43:01', NULL, NULL, NULL),
(739, 19, 19, '/admin-routes', '2018-01-25 11:43:10', NULL, NULL, NULL),
(740, 19, 19, '/admin-routes', '2018-01-25 11:43:21', NULL, NULL, NULL),
(741, 19, 19, '/admin-routes', '2018-01-25 11:43:22', NULL, NULL, NULL),
(742, 19, 19, '/admin-routes', '2018-01-25 11:43:23', NULL, NULL, NULL),
(743, 19, 19, '/admin-routes', '2018-01-25 11:43:28', NULL, NULL, NULL),
(744, 19, 19, '/admin-routes', '2018-01-25 11:44:25', NULL, NULL, NULL),
(745, 19, 19, '/admin-routes', '2018-01-25 11:44:26', NULL, NULL, NULL),
(746, 19, 19, '/admin-routes', '2018-01-25 11:44:26', NULL, NULL, NULL),
(747, 19, 19, '/admin-routes', '2018-01-25 11:44:33', NULL, NULL, NULL),
(748, 19, 19, '/admin-routes', '2018-01-25 11:44:35', NULL, NULL, NULL),
(749, 19, 19, '/admin-routes', '2018-01-25 11:44:45', NULL, NULL, NULL),
(750, 19, 19, '/admin-routes', '2018-01-25 11:45:05', NULL, NULL, NULL),
(751, 19, 19, '/admin-routes', '2018-01-25 11:45:07', NULL, NULL, NULL),
(752, 19, 19, '/admin-routes', '2018-01-25 11:45:07', NULL, NULL, NULL),
(753, 19, 19, '/admin-routes', '2018-01-25 11:45:12', NULL, NULL, NULL),
(754, 19, 19, '/admin-routes', '2018-01-25 11:45:13', NULL, NULL, NULL),
(755, 19, 19, '/admin-routes', '2018-01-25 11:45:30', NULL, NULL, NULL),
(756, 19, 19, '/admin-routes', '2018-01-25 11:46:00', NULL, NULL, NULL),
(757, 19, 19, '/admin-routes', '2018-01-25 11:46:02', NULL, NULL, NULL),
(758, 19, 19, '/admin-routes', '2018-01-25 11:46:04', NULL, NULL, NULL),
(759, 19, 19, '/admin-routes', '2018-01-25 11:46:26', NULL, NULL, NULL),
(760, 19, 19, '/admin-routes', '2018-01-25 11:47:21', NULL, NULL, NULL),
(761, 19, 19, '/admin-routes', '2018-01-25 11:47:53', NULL, NULL, NULL),
(762, 19, 19, '/admin-routes', '2018-01-25 11:48:20', NULL, NULL, NULL),
(763, 19, 19, '/admin-routes', '2018-01-25 11:49:09', NULL, NULL, NULL),
(764, 19, 19, '/admin-routes', '2018-01-25 11:49:10', NULL, NULL, NULL),
(765, 19, 19, '/admin-routes', '2018-01-25 11:49:17', NULL, NULL, NULL),
(766, 19, 19, '/admin-routes', '2018-01-25 11:49:22', NULL, NULL, NULL),
(767, 19, 19, '/admin-routes', '2018-01-25 11:49:23', NULL, NULL, NULL),
(768, 19, 19, '/admin-routes', '2018-01-25 11:49:42', NULL, NULL, NULL),
(769, 19, 19, '/admin-routes', '2018-01-25 11:51:16', NULL, NULL, NULL);
INSERT INTO `views` (`id`, `visit_id`, `visitor_id`, `path`, `created`, `updated`, `activated`, `closed`) VALUES
(770, 19, 19, '/admin-routes', '2018-01-25 11:51:17', NULL, NULL, NULL),
(771, 19, 19, '/admin-routes', '2018-01-25 11:51:41', NULL, NULL, NULL),
(772, 19, 19, '/admin-routes', '2018-01-25 11:51:42', NULL, NULL, NULL),
(773, 19, 19, '/admin-routes', '2018-01-25 11:51:44', NULL, NULL, NULL),
(774, 19, 19, '/admin-routes', '2018-01-25 11:52:01', NULL, NULL, NULL),
(775, 19, 19, '/admin-routes', '2018-01-25 11:52:50', NULL, NULL, NULL),
(776, 19, 19, '/admin-routes', '2018-01-25 11:53:08', NULL, NULL, NULL),
(777, 19, 19, '/admin-routes', '2018-01-25 11:53:41', NULL, NULL, NULL),
(778, 19, 19, '/admin-routes', '2018-01-25 11:53:43', NULL, NULL, NULL),
(779, 19, 19, '/admin-routes', '2018-01-25 11:54:41', NULL, NULL, NULL),
(780, 20, 20, '/', '2018-01-25 11:55:10', NULL, NULL, NULL),
(781, 21, 21, '/', '2018-01-25 11:55:14', NULL, NULL, NULL),
(782, 21, 21, '/login', '2018-01-25 11:55:15', NULL, NULL, NULL),
(783, 21, 21, '/login', '2018-01-25 11:55:16', NULL, NULL, NULL),
(784, 21, 21, '/login', '2018-01-25 11:55:18', NULL, NULL, NULL),
(785, 21, 21, '/login', '2018-01-25 11:55:20', NULL, NULL, NULL),
(786, 19, 19, '/', '2018-01-25 11:55:26', NULL, NULL, NULL),
(787, 22, 22, '/login', '2018-01-25 11:55:30', NULL, NULL, NULL),
(788, 22, 22, '/', '2018-01-25 11:55:35', NULL, NULL, NULL),
(789, 22, 22, '/company', '2018-01-25 11:55:36', NULL, NULL, NULL),
(790, 22, 22, '/cemeteries', '2018-01-25 11:55:36', NULL, NULL, NULL),
(791, 22, 22, '/login', '2018-01-25 11:55:43', NULL, NULL, NULL),
(792, 22, 22, '/', '2018-01-25 11:55:51', NULL, NULL, NULL),
(793, 22, 22, '/login', '2018-01-25 11:56:36', NULL, NULL, NULL),
(794, 22, 22, '/', '2018-01-25 11:56:45', NULL, NULL, NULL),
(795, 21, 21, '/login', '2018-01-25 11:56:52', NULL, NULL, NULL),
(796, 21, 21, '/', '2018-01-25 11:56:59', NULL, NULL, NULL),
(797, 21, 21, '/', '2018-01-25 11:57:00', NULL, NULL, NULL),
(798, 21, 21, '/', '2018-01-25 11:57:03', NULL, NULL, NULL),
(799, 21, 21, '/', '2018-01-25 11:57:05', NULL, NULL, NULL),
(800, 21, 21, '/', '2018-01-25 11:57:06', NULL, NULL, NULL),
(801, 21, 21, '/', '2018-01-25 11:57:06', NULL, NULL, NULL),
(802, 21, 21, '/', '2018-01-25 11:57:06', NULL, NULL, NULL),
(803, 21, 21, '/', '2018-01-25 11:57:06', NULL, NULL, NULL),
(804, 21, 21, '/', '2018-01-25 11:57:06', NULL, NULL, NULL),
(805, 21, 21, '/', '2018-01-25 11:57:07', NULL, NULL, NULL),
(806, 21, 21, '/', '2018-01-25 11:57:07', NULL, NULL, NULL),
(807, 21, 21, '/', '2018-01-25 11:57:07', NULL, NULL, NULL),
(808, 21, 21, '/', '2018-01-25 11:57:07', NULL, NULL, NULL),
(809, 21, 21, '/', '2018-01-25 11:57:07', NULL, NULL, NULL),
(810, 21, 21, '/', '2018-01-25 11:57:08', NULL, NULL, NULL),
(811, 21, 21, '/', '2018-01-25 11:57:08', NULL, NULL, NULL),
(812, 22, 22, '/', '2018-01-25 11:57:08', NULL, NULL, NULL),
(813, 22, 22, '/', '2018-01-25 11:57:09', NULL, NULL, NULL),
(814, 22, 22, '/', '2018-01-25 11:57:09', NULL, NULL, NULL),
(815, 21, 21, '/', '2018-01-25 11:57:09', NULL, NULL, NULL),
(816, 21, 21, '/', '2018-01-25 11:57:10', NULL, NULL, NULL),
(817, 23, 23, '/', '2018-01-25 11:57:10', NULL, NULL, NULL),
(818, 23, 23, '/', '2018-01-25 11:57:11', NULL, NULL, NULL),
(819, 23, 23, '/', '2018-01-25 11:57:12', NULL, NULL, NULL),
(820, 23, 23, '/', '2018-01-25 11:57:12', NULL, NULL, NULL),
(821, 23, 23, '/', '2018-01-25 11:57:12', NULL, NULL, NULL),
(822, 23, 23, '/', '2018-01-25 11:57:12', NULL, NULL, NULL),
(823, 23, 23, '/', '2018-01-25 11:57:12', NULL, NULL, NULL),
(824, 23, 23, '/', '2018-01-25 11:57:12', NULL, NULL, NULL),
(825, 23, 23, '/', '2018-01-25 11:57:13', NULL, NULL, NULL),
(826, 23, 23, '/', '2018-01-25 11:57:13', NULL, NULL, NULL),
(827, 23, 23, '/login', '2018-01-25 11:57:14', NULL, NULL, NULL),
(828, 23, 23, '/', '2018-01-25 11:57:24', NULL, NULL, NULL),
(829, 23, 23, '/', '2018-01-25 11:57:25', NULL, NULL, NULL),
(830, 24, 24, '/', '2018-01-25 11:57:26', NULL, NULL, NULL),
(831, 24, 24, '/', '2018-01-25 11:57:27', NULL, NULL, NULL),
(832, 24, 24, '/', '2018-01-25 11:57:28', NULL, NULL, NULL),
(833, 24, 24, '/login', '2018-01-25 11:57:28', NULL, NULL, NULL),
(834, 24, 24, '/', '2018-01-25 11:57:37', NULL, NULL, NULL),
(835, 24, 24, '/', '2018-01-25 11:57:47', NULL, NULL, NULL),
(836, 24, 24, '/', '2018-01-25 11:57:48', NULL, NULL, NULL),
(837, 24, 24, '/', '2018-01-25 11:57:48', NULL, NULL, NULL),
(838, 24, 24, '/', '2018-01-25 11:57:48', NULL, NULL, NULL),
(839, 24, 24, '/', '2018-01-25 11:57:48', NULL, NULL, NULL),
(840, 24, 24, '/company', '2018-01-25 11:57:49', NULL, NULL, NULL),
(841, 24, 24, '/', '2018-01-25 11:57:49', NULL, NULL, NULL),
(842, 24, 24, '/', '2018-01-25 11:57:49', NULL, NULL, NULL),
(843, 24, 24, '/company', '2018-01-25 11:57:50', NULL, NULL, NULL),
(844, 24, 24, '/company', '2018-01-25 11:57:50', NULL, NULL, NULL),
(845, 24, 24, '/company', '2018-01-25 11:57:50', NULL, NULL, NULL),
(846, 24, 24, '/cemeteries', '2018-01-25 11:57:50', NULL, NULL, NULL),
(847, 24, 24, '/cemeteries', '2018-01-25 11:57:50', NULL, NULL, NULL),
(848, 24, 24, '/cemeteries', '2018-01-25 11:57:51', NULL, NULL, NULL),
(849, 24, 24, '/cemeteries', '2018-01-25 11:57:51', NULL, NULL, NULL),
(850, 24, 24, '/cemeteries', '2018-01-25 11:57:51', NULL, NULL, NULL),
(851, 24, 24, '/cemeteries', '2018-01-25 11:57:51', NULL, NULL, NULL),
(852, 24, 24, '/cemeteries', '2018-01-25 11:57:52', NULL, NULL, NULL),
(853, 24, 24, '/admin', '2018-01-25 11:57:54', NULL, NULL, NULL),
(854, 24, 24, '/cemeteries', '2018-01-25 11:57:57', NULL, NULL, NULL),
(855, 24, 24, '/admin', '2018-01-25 11:57:59', NULL, NULL, NULL),
(856, 22, 22, '/admin', '2018-01-25 11:58:02', NULL, NULL, NULL),
(857, 22, 22, '/admin-routes', '2018-01-25 11:58:04', NULL, NULL, NULL),
(858, 24, 24, '/admin', '2018-01-25 11:58:05', NULL, NULL, NULL),
(859, 24, 24, '/admin', '2018-01-25 11:58:06', NULL, NULL, NULL),
(860, 24, 24, '/admin', '2018-01-25 11:58:06', NULL, NULL, NULL),
(861, 24, 24, '/admin', '2018-01-25 11:58:08', NULL, NULL, NULL),
(862, 24, 24, '/admin-routes', '2018-01-25 11:58:20', NULL, NULL, NULL),
(863, 24, 24, '/admin-routes', '2018-01-25 11:58:25', NULL, NULL, NULL),
(864, 22, 22, '/admin-routes', '2018-01-25 11:58:26', NULL, NULL, NULL),
(865, 24, 24, '/admin-routes', '2018-01-25 11:58:30', NULL, NULL, NULL),
(866, 22, 22, '/admin-routes', '2018-01-25 11:58:31', NULL, NULL, NULL),
(867, 24, 24, '/admin-routes', '2018-01-25 11:59:37', NULL, NULL, NULL),
(868, 24, 24, '/admin-routes', '2018-01-25 11:59:47', NULL, NULL, NULL),
(869, 22, 22, '/admin-routes', '2018-01-25 12:00:00', NULL, NULL, NULL),
(870, 22, 22, '/admin-routes', '2018-01-25 12:00:05', NULL, NULL, NULL),
(871, 24, 24, '/admin-routes', '2018-01-25 12:00:22', NULL, NULL, NULL),
(872, 22, 22, '/', '2018-01-25 12:03:55', NULL, NULL, NULL),
(873, 22, 22, '/', '2018-01-25 12:03:56', NULL, NULL, NULL),
(874, 22, 22, '/', '2018-01-25 12:04:04', NULL, NULL, NULL),
(875, 22, 22, '/', '2018-01-25 12:04:06', NULL, NULL, NULL),
(876, 22, 22, '/', '2018-01-25 12:06:26', NULL, NULL, NULL),
(877, 22, 22, '/', '2018-01-25 12:06:29', NULL, NULL, NULL),
(878, 22, 22, '/', '2018-01-25 12:06:32', NULL, NULL, NULL),
(879, 22, 22, '/', '2018-01-25 12:06:37', NULL, NULL, NULL),
(880, 22, 22, '/', '2018-01-25 12:06:41', NULL, NULL, NULL),
(881, 22, 22, '/', '2018-01-25 12:06:43', NULL, NULL, NULL),
(882, 22, 22, '/', '2018-01-25 12:06:46', NULL, NULL, NULL),
(883, 22, 22, '/', '2018-01-25 12:10:08', NULL, NULL, NULL),
(884, 22, 22, '/', '2018-01-25 12:11:51', NULL, NULL, NULL),
(885, 22, 22, '/', '2018-01-25 12:11:53', NULL, NULL, NULL),
(886, 22, 22, '/', '2018-01-25 12:12:01', NULL, NULL, NULL),
(887, 22, 22, '/admin', '2018-01-25 12:12:09', NULL, NULL, NULL),
(888, 22, 22, '/admin-clients', '2018-01-25 12:12:10', NULL, NULL, NULL),
(889, 22, 22, '/admin-routes', '2018-01-25 12:12:12', NULL, NULL, NULL),
(890, 22, 22, '/admin-routes', '2018-01-25 12:12:17', NULL, NULL, NULL),
(891, 22, 22, '/', '2018-01-25 12:12:18', NULL, NULL, NULL),
(892, 22, 22, '/', '2018-01-25 12:12:25', NULL, NULL, NULL),
(893, 22, 22, '/', '2018-01-25 12:12:43', NULL, NULL, NULL),
(894, 22, 22, '/', '2018-01-25 12:14:07', NULL, NULL, NULL),
(895, 22, 22, '/', '2018-01-25 12:16:54', NULL, NULL, NULL),
(896, 25, 25, '/', '2018-01-25 12:16:56', NULL, NULL, NULL),
(897, 25, 25, '/', '2018-01-25 12:16:57', NULL, NULL, NULL),
(898, 25, 25, '/company', '2018-01-25 12:16:58', NULL, NULL, NULL),
(899, 25, 25, '/', '2018-01-25 12:16:59', NULL, NULL, NULL),
(900, 25, 25, '/login', '2018-01-25 12:17:00', NULL, NULL, NULL),
(901, 25, 25, '/', '2018-01-25 12:17:07', NULL, NULL, NULL),
(902, 25, 25, '/admin', '2018-01-25 12:17:08', NULL, NULL, NULL),
(903, 25, 25, '/admin-clients', '2018-01-25 12:17:09', NULL, NULL, NULL),
(904, 25, 25, '/admin-attendance', '2018-01-25 12:17:10', NULL, NULL, NULL),
(905, 25, 25, '/admin-clients', '2018-01-25 12:17:11', NULL, NULL, NULL),
(906, 25, 25, '/admin-routes', '2018-01-25 12:17:11', NULL, NULL, NULL),
(907, 25, 25, '/', '2018-01-25 12:17:12', NULL, NULL, NULL),
(908, 25, 25, '/company', '2018-01-25 12:17:13', NULL, NULL, NULL),
(909, 25, 25, '/cemeteries', '2018-01-25 12:17:13', NULL, NULL, NULL),
(910, 25, 25, '/cemeteries', '2018-01-25 12:17:15', NULL, NULL, NULL),
(911, 25, 25, '/company', '2018-01-25 12:17:16', NULL, NULL, NULL),
(912, 25, 25, '/', '2018-01-25 12:17:16', NULL, NULL, NULL),
(913, 25, 25, '/', '2018-01-26 05:23:01', NULL, NULL, NULL),
(914, 25, 25, '/', '2018-01-26 05:23:32', NULL, NULL, NULL),
(915, 25, 25, '/', '2018-01-26 05:23:49', NULL, NULL, NULL),
(916, 25, 25, '/', '2018-01-26 05:23:50', NULL, NULL, NULL),
(917, 25, 25, '/', '2018-01-26 05:23:53', NULL, NULL, NULL),
(918, 25, 25, '/', '2018-01-26 05:23:58', NULL, NULL, NULL),
(919, 25, 25, '/', '2018-01-26 05:23:58', NULL, NULL, NULL),
(920, 25, 25, '/admin', '2018-01-26 05:24:03', NULL, NULL, NULL),
(921, 25, 25, '/admin', '2018-01-26 05:24:07', NULL, NULL, NULL),
(922, 25, 25, '/admin-clients', '2018-01-26 05:24:08', NULL, NULL, NULL),
(923, 25, 25, '/admin-routes', '2018-01-26 05:24:09', NULL, NULL, NULL),
(924, 25, 25, '/admin-routes', '2018-01-26 05:24:18', NULL, NULL, NULL),
(925, 25, 25, '/', '2018-01-26 05:24:19', NULL, NULL, NULL),
(926, 25, 25, '/', '2018-01-26 05:24:20', NULL, NULL, NULL),
(927, 25, 25, '/', '2018-01-26 05:26:00', NULL, NULL, NULL),
(928, 25, 25, '/', '2018-01-26 05:26:00', NULL, NULL, NULL),
(929, 25, 25, '/', '2018-01-26 05:26:24', NULL, NULL, NULL),
(930, 25, 25, '/', '2018-01-26 05:26:24', NULL, NULL, NULL),
(931, 25, 25, '/', '2018-01-26 05:28:00', NULL, NULL, NULL),
(932, 25, 25, '/', '2018-01-26 05:28:01', NULL, NULL, NULL),
(933, 25, 25, '/', '2018-01-26 05:28:07', NULL, NULL, NULL),
(934, 25, 25, '/', '2018-01-26 05:28:10', NULL, NULL, NULL),
(935, 25, 25, '/', '2018-01-26 05:28:11', NULL, NULL, NULL),
(936, 25, 25, '/', '2018-01-26 05:28:12', NULL, NULL, NULL),
(937, 25, 25, '/', '2018-01-26 05:29:18', NULL, NULL, NULL),
(938, 25, 25, '/', '2018-01-26 05:29:21', NULL, NULL, NULL),
(939, 25, 25, '/', '2018-01-26 05:29:21', NULL, NULL, NULL),
(940, 25, 25, '/', '2018-01-26 05:31:43', NULL, NULL, NULL),
(941, 25, 25, '/', '2018-01-26 05:31:44', NULL, NULL, NULL),
(942, 25, 25, '/', '2018-01-26 05:31:52', NULL, NULL, NULL),
(943, 25, 25, '/', '2018-01-26 05:31:57', NULL, NULL, NULL),
(944, 25, 25, '/', '2018-01-26 05:31:58', NULL, NULL, NULL),
(945, 25, 25, '/', '2018-01-26 05:31:59', NULL, NULL, NULL),
(946, 25, 25, '/', '2018-01-26 05:32:19', NULL, NULL, NULL),
(947, 25, 25, '/', '2018-01-26 05:32:19', NULL, NULL, NULL),
(948, 25, 25, '/', '2018-01-26 05:43:04', NULL, NULL, NULL),
(949, 25, 25, '/', '2018-01-26 05:43:04', NULL, NULL, NULL),
(950, 25, 25, '/', '2018-01-26 05:43:09', NULL, NULL, NULL),
(951, 25, 25, '/', '2018-01-26 05:43:10', NULL, NULL, NULL),
(952, 25, 25, '/', '2018-01-26 05:44:11', NULL, NULL, NULL),
(953, 25, 25, '/', '2018-01-26 05:44:11', NULL, NULL, NULL),
(954, 25, 25, '/', '2018-01-26 05:47:03', NULL, NULL, NULL),
(955, 25, 25, '/', '2018-01-26 05:47:03', NULL, NULL, NULL),
(956, 25, 25, '/', '2018-01-26 05:47:13', NULL, NULL, NULL),
(957, 25, 25, '/', '2018-01-26 05:47:13', NULL, NULL, NULL),
(958, 25, 25, '/', '2018-01-26 05:47:46', NULL, NULL, NULL),
(959, 25, 25, '/', '2018-01-26 05:47:46', NULL, NULL, NULL),
(960, 25, 25, '/', '2018-01-26 05:48:01', NULL, NULL, NULL),
(961, 25, 25, '/', '2018-01-26 05:48:02', NULL, NULL, NULL),
(962, 25, 25, '/', '2018-01-26 05:48:07', NULL, NULL, NULL),
(963, 25, 25, '/', '2018-01-26 05:48:08', NULL, NULL, NULL),
(964, 25, 25, '/', '2018-01-26 05:48:19', NULL, NULL, NULL),
(965, 25, 25, '/', '2018-01-26 05:48:20', NULL, NULL, NULL),
(966, 25, 25, '/', '2018-01-26 05:48:42', NULL, NULL, NULL),
(967, 25, 25, '/', '2018-01-26 05:48:42', NULL, NULL, NULL),
(968, 25, 25, '/', '2018-01-26 05:51:04', NULL, NULL, NULL),
(969, 25, 25, '/', '2018-01-26 05:51:05', NULL, NULL, NULL),
(970, 25, 25, '/', '2018-01-26 05:51:22', NULL, NULL, NULL),
(971, 25, 25, '/', '2018-01-26 05:51:22', NULL, NULL, NULL),
(972, 25, 25, '/', '2018-01-26 05:51:25', NULL, NULL, NULL),
(973, 25, 25, '/', '2018-01-26 05:51:26', NULL, NULL, NULL),
(974, 25, 25, '/', '2018-01-26 05:51:30', NULL, NULL, NULL),
(975, 25, 25, '/', '2018-01-26 05:51:38', NULL, NULL, NULL),
(976, 25, 25, '/', '2018-01-26 05:52:11', NULL, NULL, NULL),
(977, 25, 25, '/', '2018-01-26 05:52:25', NULL, NULL, NULL),
(978, 25, 25, '/', '2018-01-26 05:52:42', NULL, NULL, NULL),
(979, 25, 25, '/', '2018-01-26 05:53:35', NULL, NULL, NULL),
(980, 25, 25, '/', '2018-01-26 05:53:46', NULL, NULL, NULL),
(981, 25, 25, '/', '2018-01-26 06:04:06', NULL, NULL, NULL),
(982, 25, 25, '/', '2018-01-26 06:04:55', NULL, NULL, NULL),
(983, 25, 25, '/', '2018-01-26 06:05:12', NULL, NULL, NULL),
(984, 25, 25, '/', '2018-01-26 06:06:39', NULL, NULL, NULL),
(985, 25, 25, '/', '2018-01-26 06:07:42', NULL, NULL, NULL),
(986, 25, 25, '/', '2018-01-26 06:08:24', NULL, NULL, NULL),
(987, 25, 25, '/admin', '2018-01-26 06:10:39', NULL, NULL, NULL),
(988, 25, 25, '/', '2018-01-26 06:16:52', NULL, NULL, NULL),
(989, 25, 25, '/', '2018-01-26 06:17:44', NULL, NULL, NULL),
(990, 25, 25, '/', '2018-01-26 06:17:48', NULL, NULL, NULL),
(991, 25, 25, '/', '2018-01-26 06:18:10', NULL, NULL, NULL),
(992, 25, 25, '/', '2018-01-26 06:18:18', NULL, NULL, NULL),
(993, 25, 25, '/', '2018-01-26 06:20:05', NULL, NULL, NULL),
(994, 25, 25, '/', '2018-01-26 06:20:13', NULL, NULL, NULL),
(995, 25, 25, '/', '2018-01-26 06:20:16', NULL, NULL, NULL),
(996, 25, 25, '/', '2018-01-26 06:20:19', NULL, NULL, NULL),
(997, 25, 25, '/', '2018-01-26 06:20:20', NULL, NULL, NULL),
(998, 25, 25, '/', '2018-01-26 06:20:26', NULL, NULL, NULL),
(999, 25, 25, '/', '2018-01-26 06:20:54', NULL, NULL, NULL),
(1000, 25, 25, '/', '2018-01-26 06:20:55', NULL, NULL, NULL),
(1001, 25, 25, '/', '2018-01-26 06:20:57', NULL, NULL, NULL),
(1002, 25, 25, '/', '2018-01-26 06:21:25', NULL, NULL, NULL),
(1003, 25, 25, '/', '2018-01-26 06:22:18', NULL, NULL, NULL),
(1004, 25, 25, '/', '2018-01-26 06:22:24', NULL, NULL, NULL),
(1005, 25, 25, '/', '2018-01-26 06:22:26', NULL, NULL, NULL),
(1006, 25, 25, '/', '2018-01-26 06:22:28', NULL, NULL, NULL),
(1007, 25, 25, '/', '2018-01-26 06:22:29', NULL, NULL, NULL),
(1008, 25, 25, '/', '2018-01-26 06:22:39', NULL, NULL, NULL),
(1009, 25, 25, '/', '2018-01-26 06:22:39', NULL, NULL, NULL),
(1010, 25, 25, '/', '2018-01-26 06:22:40', NULL, NULL, NULL),
(1011, 25, 25, '/', '2018-01-26 06:22:41', NULL, NULL, NULL),
(1012, 25, 25, '/', '2018-01-26 06:23:05', NULL, NULL, NULL),
(1013, 25, 25, '/', '2018-01-26 06:23:05', NULL, NULL, NULL),
(1014, 25, 25, '/', '2018-01-26 06:25:44', NULL, NULL, NULL),
(1015, 25, 25, '/', '2018-01-26 06:25:44', NULL, NULL, NULL),
(1016, 25, 25, '/', '2018-01-26 06:25:46', NULL, NULL, NULL),
(1017, 25, 25, '/', '2018-01-26 06:25:46', NULL, NULL, NULL),
(1018, 25, 25, '/', '2018-01-26 06:25:47', NULL, NULL, NULL),
(1019, 25, 25, '/', '2018-01-26 06:25:48', NULL, NULL, NULL),
(1020, 25, 25, '/', '2018-01-26 06:25:49', NULL, NULL, NULL),
(1021, 25, 25, '/', '2018-01-26 06:25:49', NULL, NULL, NULL),
(1022, 25, 25, '/', '2018-01-26 06:25:50', NULL, NULL, NULL),
(1023, 25, 25, '/', '2018-01-26 06:25:51', NULL, NULL, NULL),
(1024, 25, 25, '/', '2018-01-26 06:25:52', NULL, NULL, NULL),
(1025, 25, 25, '/', '2018-01-26 06:25:53', NULL, NULL, NULL),
(1026, 25, 25, '/', '2018-01-26 06:25:56', NULL, NULL, NULL),
(1027, 25, 25, '/', '2018-01-26 06:25:56', NULL, NULL, NULL),
(1028, 25, 25, '/', '2018-01-26 06:25:58', NULL, NULL, NULL),
(1029, 25, 25, '/', '2018-01-26 06:25:58', NULL, NULL, NULL),
(1030, 25, 25, '/', '2018-01-26 06:26:11', NULL, NULL, NULL),
(1031, 25, 25, '/', '2018-01-26 06:26:11', NULL, NULL, NULL),
(1032, 25, 25, '/', '2018-01-26 06:26:23', NULL, NULL, NULL),
(1033, 25, 25, '/', '2018-01-26 06:26:23', NULL, NULL, NULL),
(1034, 25, 25, '/', '2018-01-26 06:26:24', NULL, NULL, NULL),
(1035, 25, 25, '/', '2018-01-26 06:26:25', NULL, NULL, NULL),
(1036, 25, 25, '/', '2018-01-26 06:26:26', NULL, NULL, NULL),
(1037, 25, 25, '/', '2018-01-26 06:26:26', NULL, NULL, NULL),
(1038, 25, 25, '/', '2018-01-26 06:27:08', NULL, NULL, NULL),
(1039, 25, 25, '/', '2018-01-26 06:27:08', NULL, NULL, NULL),
(1040, 25, 25, '/', '2018-01-26 06:27:10', NULL, NULL, NULL),
(1041, 25, 25, '/', '2018-01-26 06:27:11', NULL, NULL, NULL),
(1042, 25, 25, '/', '2018-01-26 06:28:26', NULL, NULL, NULL),
(1043, 25, 25, '/', '2018-01-26 06:28:27', NULL, NULL, NULL),
(1044, 25, 25, '/', '2018-01-26 06:31:39', NULL, NULL, NULL),
(1045, 25, 25, '/', '2018-01-26 06:31:40', NULL, NULL, NULL),
(1046, 25, 25, '/', '2018-01-26 06:35:38', NULL, NULL, NULL),
(1047, 25, 25, '/', '2018-01-26 06:35:38', NULL, NULL, NULL),
(1048, 25, 25, '/', '2018-01-26 06:36:16', NULL, NULL, NULL),
(1049, 25, 25, '/', '2018-01-26 06:36:17', NULL, NULL, NULL),
(1050, 25, 25, '/', '2018-01-26 06:37:32', NULL, NULL, NULL),
(1051, 25, 25, '/', '2018-01-26 06:37:33', NULL, NULL, NULL),
(1052, 25, 25, '/', '2018-01-26 06:37:51', NULL, NULL, NULL),
(1053, 25, 25, '/', '2018-01-26 06:37:51', NULL, NULL, NULL),
(1054, 25, 25, '/', '2018-01-26 06:38:56', NULL, NULL, NULL),
(1055, 25, 25, '/', '2018-01-26 06:38:56', NULL, NULL, NULL),
(1056, 25, 25, '/', '2018-01-26 06:38:58', NULL, NULL, NULL),
(1057, 25, 25, '/', '2018-01-26 06:38:59', NULL, NULL, NULL),
(1058, 25, 25, '/', '2018-01-26 06:39:01', NULL, NULL, NULL),
(1059, 25, 25, '/', '2018-01-26 06:39:02', NULL, NULL, NULL),
(1060, 25, 25, '/', '2018-01-26 06:39:38', NULL, NULL, NULL),
(1061, 25, 25, '/', '2018-01-26 06:39:39', NULL, NULL, NULL),
(1062, 25, 25, '/', '2018-01-26 06:39:43', NULL, NULL, NULL),
(1063, 25, 25, '/', '2018-01-26 06:39:44', NULL, NULL, NULL),
(1064, 25, 25, '/', '2018-01-26 06:41:18', NULL, NULL, NULL),
(1065, 25, 25, '/', '2018-01-26 06:41:19', NULL, NULL, NULL),
(1066, 25, 25, '/', '2018-01-26 06:41:21', NULL, NULL, NULL),
(1067, 25, 25, '/', '2018-01-26 06:41:21', NULL, NULL, NULL),
(1068, 25, 25, '/', '2018-01-26 06:41:24', NULL, NULL, NULL),
(1069, 25, 25, '/', '2018-01-26 06:41:25', NULL, NULL, NULL),
(1070, 25, 25, '/', '2018-01-26 06:41:27', NULL, NULL, NULL),
(1071, 25, 25, '/', '2018-01-26 06:41:27', NULL, NULL, NULL),
(1072, 25, 25, '/', '2018-01-26 06:41:31', NULL, NULL, NULL),
(1073, 25, 25, '/', '2018-01-26 06:41:32', NULL, NULL, NULL),
(1074, 25, 25, '/', '2018-01-26 06:42:46', NULL, NULL, NULL),
(1075, 25, 25, '/', '2018-01-26 06:42:47', NULL, NULL, NULL),
(1076, 25, 25, '/', '2018-01-26 06:43:13', NULL, NULL, NULL),
(1077, 25, 25, '/', '2018-01-26 06:43:13', NULL, NULL, NULL),
(1078, 25, 25, '/', '2018-01-26 06:44:50', NULL, NULL, NULL),
(1079, 25, 25, '/', '2018-01-26 06:44:50', NULL, NULL, NULL),
(1080, 25, 25, '/', '2018-01-26 06:47:19', NULL, NULL, NULL),
(1081, 25, 25, '/', '2018-01-26 06:47:19', NULL, NULL, NULL),
(1082, 25, 25, '/', '2018-01-26 06:47:24', NULL, NULL, NULL),
(1083, 25, 25, '/', '2018-01-26 06:47:25', NULL, NULL, NULL),
(1084, 25, 25, '/', '2018-01-26 06:47:31', NULL, NULL, NULL),
(1085, 25, 25, '/', '2018-01-26 06:47:32', NULL, NULL, NULL),
(1086, 25, 25, '/', '2018-01-26 06:47:34', NULL, NULL, NULL),
(1087, 25, 25, '/', '2018-01-26 06:47:35', NULL, NULL, NULL),
(1088, 25, 25, '/', '2018-01-26 06:50:00', NULL, NULL, NULL),
(1089, 25, 25, '/', '2018-01-26 06:50:00', NULL, NULL, NULL),
(1090, 25, 25, '/', '2018-01-26 06:50:22', NULL, NULL, NULL),
(1091, 25, 25, '/', '2018-01-26 06:50:22', NULL, NULL, NULL),
(1092, 25, 25, '/', '2018-01-26 06:50:43', NULL, NULL, NULL),
(1093, 25, 25, '/', '2018-01-26 06:50:44', NULL, NULL, NULL),
(1094, 25, 25, '/', '2018-01-26 06:51:31', NULL, NULL, NULL),
(1095, 25, 25, '/', '2018-01-26 06:51:32', NULL, NULL, NULL),
(1096, 25, 25, '/', '2018-01-26 06:53:04', NULL, NULL, NULL),
(1097, 25, 25, '/', '2018-01-26 06:53:05', NULL, NULL, NULL),
(1098, 25, 25, '/', '2018-01-26 06:56:14', NULL, NULL, NULL),
(1099, 25, 25, '/', '2018-01-26 06:56:14', NULL, NULL, NULL),
(1100, 25, 25, '/', '2018-01-26 06:56:16', NULL, NULL, NULL),
(1101, 25, 25, '/', '2018-01-26 06:56:17', NULL, NULL, NULL),
(1102, 25, 25, '/', '2018-01-26 06:56:22', NULL, NULL, NULL),
(1103, 25, 25, '/', '2018-01-26 06:56:23', NULL, NULL, NULL),
(1104, 25, 25, '/', '2018-01-26 06:56:30', NULL, NULL, NULL),
(1105, 25, 25, '/', '2018-01-26 06:56:31', NULL, NULL, NULL),
(1106, 25, 25, '/', '2018-01-26 06:56:52', NULL, NULL, NULL),
(1107, 25, 25, '/', '2018-01-26 06:56:52', NULL, NULL, NULL),
(1108, 25, 25, '/', '2018-01-26 06:59:30', NULL, NULL, NULL),
(1109, 25, 25, '/', '2018-01-26 06:59:30', NULL, NULL, NULL),
(1110, 25, 25, '/', '2018-01-26 06:59:43', NULL, NULL, NULL),
(1111, 25, 25, '/', '2018-01-26 06:59:43', NULL, NULL, NULL),
(1112, 25, 25, '/', '2018-01-26 06:59:49', NULL, NULL, NULL),
(1113, 25, 25, '/', '2018-01-26 06:59:49', NULL, NULL, NULL),
(1114, 25, 25, '/', '2018-01-26 07:01:13', NULL, NULL, NULL),
(1115, 25, 25, '/', '2018-01-26 07:01:14', NULL, NULL, NULL),
(1116, 25, 25, '/', '2018-01-26 07:01:20', NULL, NULL, NULL),
(1117, 25, 25, '/', '2018-01-26 07:01:20', NULL, NULL, NULL),
(1118, 25, 25, '/', '2018-01-26 07:02:55', NULL, NULL, NULL),
(1119, 25, 25, '/', '2018-01-26 07:02:56', NULL, NULL, NULL),
(1120, 25, 25, '/', '2018-01-26 07:04:01', NULL, NULL, NULL),
(1121, 25, 25, '/', '2018-01-26 07:04:01', NULL, NULL, NULL),
(1122, 25, 25, '/', '2018-01-26 07:05:29', NULL, NULL, NULL),
(1123, 25, 25, '/', '2018-01-26 07:05:29', NULL, NULL, NULL),
(1124, 25, 25, '/', '2018-01-26 07:08:13', NULL, NULL, NULL),
(1125, 25, 25, '/', '2018-01-26 07:08:13', NULL, NULL, NULL),
(1126, 25, 25, '/', '2018-01-26 07:08:27', NULL, NULL, NULL),
(1127, 25, 25, '/', '2018-01-26 07:08:27', NULL, NULL, NULL),
(1128, 25, 25, '/', '2018-01-26 07:08:32', NULL, NULL, NULL),
(1129, 25, 25, '/', '2018-01-26 07:08:33', NULL, NULL, NULL),
(1130, 25, 25, '/', '2018-01-26 07:09:39', NULL, NULL, NULL),
(1131, 25, 25, '/', '2018-01-26 07:09:40', NULL, NULL, NULL),
(1132, 25, 25, '/', '2018-01-26 07:12:06', NULL, NULL, NULL),
(1133, 25, 25, '/', '2018-01-26 07:12:06', NULL, NULL, NULL),
(1134, 25, 25, '/', '2018-01-26 07:12:16', NULL, NULL, NULL),
(1135, 25, 25, '/', '2018-01-26 07:12:16', NULL, NULL, NULL),
(1136, 25, 25, '/', '2018-01-26 07:12:43', NULL, NULL, NULL),
(1137, 25, 25, '/', '2018-01-26 07:12:43', NULL, NULL, NULL),
(1138, 25, 25, '/', '2018-01-26 07:13:08', NULL, NULL, NULL),
(1139, 25, 25, '/', '2018-01-26 07:13:08', NULL, NULL, NULL),
(1140, 25, 25, '/', '2018-01-26 07:13:44', NULL, NULL, NULL),
(1141, 25, 25, '/', '2018-01-26 07:13:44', NULL, NULL, NULL),
(1142, 25, 25, '/', '2018-01-26 07:14:13', NULL, NULL, NULL),
(1143, 25, 25, '/', '2018-01-26 07:14:13', NULL, NULL, NULL),
(1144, 25, 25, '/', '2018-01-26 07:14:15', NULL, NULL, NULL),
(1145, 25, 25, '/', '2018-01-26 07:14:15', NULL, NULL, NULL),
(1146, 25, 25, '/', '2018-01-26 07:14:16', NULL, NULL, NULL),
(1147, 25, 25, '/', '2018-01-26 07:14:17', NULL, NULL, NULL),
(1148, 25, 25, '/', '2018-01-26 07:14:34', NULL, NULL, NULL),
(1149, 25, 25, '/', '2018-01-26 07:14:34', NULL, NULL, NULL),
(1150, 25, 25, '/', '2018-01-26 07:14:36', NULL, NULL, NULL),
(1151, 25, 25, '/', '2018-01-26 07:14:36', NULL, NULL, NULL),
(1152, 25, 25, '/', '2018-01-26 07:15:57', NULL, NULL, NULL),
(1153, 25, 25, '/', '2018-01-26 07:15:57', NULL, NULL, NULL),
(1154, 25, 25, '/', '2018-01-26 07:16:00', NULL, NULL, NULL),
(1155, 25, 25, '/', '2018-01-26 07:16:01', NULL, NULL, NULL),
(1156, 25, 25, '/', '2018-01-26 07:16:02', NULL, NULL, NULL),
(1157, 25, 25, '/', '2018-01-26 07:16:02', NULL, NULL, NULL),
(1158, 25, 25, '/admin', '2018-01-26 07:16:03', NULL, NULL, NULL),
(1159, 25, 25, '/admin', '2018-01-26 07:17:15', NULL, NULL, NULL),
(1160, 25, 25, '/', '2018-01-26 07:18:23', NULL, NULL, NULL),
(1161, 25, 25, '/', '2018-01-26 07:18:23', NULL, NULL, NULL),
(1162, 25, 25, '/', '2018-01-26 07:18:24', NULL, NULL, NULL),
(1163, 25, 25, '/', '2018-01-26 07:18:24', NULL, NULL, NULL),
(1164, 25, 25, '/', '2018-01-26 07:18:25', NULL, NULL, NULL),
(1165, 25, 25, '/', '2018-01-26 07:18:25', NULL, NULL, NULL),
(1166, 25, 25, '/', '2018-01-26 07:18:25', NULL, NULL, NULL),
(1167, 25, 25, '/', '2018-01-26 07:18:26', NULL, NULL, NULL),
(1168, 25, 25, '/', '2018-01-26 07:18:26', NULL, NULL, NULL),
(1169, 25, 25, '/', '2018-01-26 07:18:26', NULL, NULL, NULL),
(1170, 25, 25, '/', '2018-01-26 07:18:27', NULL, NULL, NULL),
(1171, 25, 25, '/', '2018-01-26 07:18:27', NULL, NULL, NULL),
(1172, 25, 25, '/', '2018-01-26 07:18:28', NULL, NULL, NULL),
(1173, 25, 25, '/', '2018-01-26 07:18:28', NULL, NULL, NULL),
(1174, 25, 25, '/', '2018-01-26 07:18:29', NULL, NULL, NULL),
(1175, 25, 25, '/', '2018-01-26 07:18:30', NULL, NULL, NULL),
(1176, 25, 25, '/', '2018-01-26 07:18:30', NULL, NULL, NULL),
(1177, 25, 25, '/', '2018-01-26 07:27:19', NULL, NULL, NULL),
(1178, 25, 25, '/', '2018-01-26 07:27:23', NULL, NULL, NULL),
(1179, 25, 25, '/', '2018-01-26 07:27:25', NULL, NULL, NULL),
(1180, 25, 25, '/', '2018-01-26 07:27:28', NULL, NULL, NULL),
(1181, 25, 25, '/', '2018-01-26 07:27:30', NULL, NULL, NULL),
(1182, 25, 25, '/', '2018-01-26 07:27:34', NULL, NULL, NULL),
(1183, 25, 25, '/', '2018-01-26 07:27:39', NULL, NULL, NULL),
(1184, 25, 25, '/', '2018-01-26 07:27:42', NULL, NULL, NULL),
(1185, 25, 25, '/admin', '2018-01-26 07:31:09', NULL, NULL, NULL),
(1186, 25, 25, '/admin', '2018-01-26 07:31:10', NULL, NULL, NULL),
(1187, 25, 25, '/admin', '2018-01-26 07:32:02', NULL, NULL, NULL),
(1188, 25, 25, '/admin', '2018-01-26 07:32:16', NULL, NULL, NULL),
(1189, 25, 25, '/admin', '2018-01-26 07:32:30', NULL, NULL, NULL),
(1190, 25, 25, '/admin', '2018-01-26 07:32:49', NULL, NULL, NULL),
(1191, 25, 25, '/', '2018-01-26 07:33:08', NULL, NULL, NULL),
(1192, 25, 25, '/', '2018-01-26 07:33:10', NULL, NULL, NULL),
(1193, 25, 25, '/', '2018-01-26 07:33:10', NULL, NULL, NULL),
(1194, 25, 25, '/admin', '2018-01-26 07:35:38', NULL, NULL, NULL),
(1195, 25, 25, '/admin', '2018-01-26 07:35:43', NULL, NULL, NULL),
(1196, 25, 25, '/admin', '2018-01-26 07:35:44', NULL, NULL, NULL),
(1197, 25, 25, '/admin', '2018-01-26 07:35:46', NULL, NULL, NULL),
(1198, 25, 25, '/admin-clients', '2018-01-26 07:35:47', NULL, NULL, NULL),
(1199, 25, 25, '/admin-routes', '2018-01-26 07:35:48', NULL, NULL, NULL),
(1200, 25, 25, '/admin-attendance', '2018-01-26 07:35:48', NULL, NULL, NULL),
(1201, 25, 25, '/admin-clients', '2018-01-26 07:35:49', NULL, NULL, NULL),
(1202, 25, 25, '/admin-routes', '2018-01-26 07:35:50', NULL, NULL, NULL),
(1203, 25, 25, '/company', '2018-01-26 07:36:03', NULL, NULL, NULL),
(1204, 25, 25, '/admin-routes', '2018-01-26 07:36:14', NULL, NULL, NULL),
(1205, 25, 25, '/admin-routes', '2018-01-26 07:36:49', NULL, NULL, NULL),
(1206, 25, 25, '/admin-routes', '2018-01-26 07:37:02', NULL, NULL, NULL),
(1207, 25, 25, '/company', '2018-01-26 07:37:03', NULL, NULL, NULL),
(1208, 25, 25, '/company', '2018-01-26 07:37:09', NULL, NULL, NULL),
(1209, 25, 25, '/company', '2018-01-26 07:37:09', NULL, NULL, NULL),
(1210, 25, 25, '/company', '2018-01-26 07:37:34', NULL, NULL, NULL),
(1211, 25, 25, '/company', '2018-01-26 07:37:38', NULL, NULL, NULL),
(1212, 25, 25, '/company', '2018-01-26 07:37:40', NULL, NULL, NULL),
(1213, 25, 25, '/company', '2018-01-26 07:37:43', NULL, NULL, NULL),
(1214, 25, 25, '/company', '2018-01-26 07:37:52', NULL, NULL, NULL),
(1215, 25, 25, '/', '2018-01-26 07:37:58', NULL, NULL, NULL),
(1216, 25, 25, '/', '2018-01-26 07:37:58', NULL, NULL, NULL),
(1217, 25, 25, '/', '2018-01-26 07:38:00', NULL, NULL, NULL),
(1218, 25, 25, '/', '2018-01-26 07:39:09', NULL, NULL, NULL),
(1219, 25, 25, '/', '2018-01-26 07:39:10', NULL, NULL, NULL),
(1220, 25, 25, '/', '2018-01-26 07:39:10', NULL, NULL, NULL),
(1221, 25, 25, '/', '2018-01-26 07:39:11', NULL, NULL, NULL),
(1222, 25, 25, '/', '2018-01-26 07:39:12', NULL, NULL, NULL),
(1223, 25, 25, '/', '2018-01-26 07:39:13', NULL, NULL, NULL),
(1224, 25, 25, '/', '2018-01-26 07:39:13', NULL, NULL, NULL),
(1225, 25, 25, '/', '2018-01-26 07:39:19', NULL, NULL, NULL),
(1226, 25, 25, '/', '2018-01-26 07:39:19', NULL, NULL, NULL),
(1227, 25, 25, '/', '2018-01-26 07:39:20', NULL, NULL, NULL),
(1228, 25, 25, '/', '2018-01-26 07:39:21', NULL, NULL, NULL),
(1229, 25, 25, '/', '2018-01-26 07:39:22', NULL, NULL, NULL),
(1230, 25, 25, '/', '2018-01-26 07:39:23', NULL, NULL, NULL),
(1231, 25, 25, '/admin-routes', '2018-01-26 07:39:46', NULL, NULL, NULL),
(1232, 25, 25, '/admin-routes', '2018-01-26 07:40:32', NULL, NULL, NULL),
(1233, 25, 25, '/company', '2018-01-26 07:49:59', NULL, NULL, NULL),
(1234, 25, 25, '/admin-routes', '2018-01-26 08:11:02', NULL, NULL, NULL),
(1235, 25, 25, '/admin-routes', '2018-01-26 08:11:10', NULL, NULL, NULL),
(1236, 25, 25, '/admin', '2018-01-26 08:13:28', NULL, NULL, NULL),
(1237, 25, 25, '/admin-routes', '2018-01-26 08:13:29', NULL, NULL, NULL),
(1238, 26, 26, '/', '2018-01-26 08:13:45', NULL, NULL, NULL),
(1239, 26, 26, '/', '2018-01-26 08:13:45', NULL, NULL, NULL),
(1240, 26, 26, '/login', '2018-01-26 08:13:48', NULL, NULL, NULL),
(1241, 26, 26, '/', '2018-01-26 08:13:54', NULL, NULL, NULL),
(1242, 26, 26, '/', '2018-01-26 08:13:55', NULL, NULL, NULL),
(1243, 26, 26, '/admin', '2018-01-26 08:13:56', NULL, NULL, NULL),
(1244, 26, 26, '/admin-routes', '2018-01-26 08:13:56', NULL, NULL, NULL),
(1245, 27, 27, '/', '2018-01-26 08:15:36', NULL, NULL, NULL),
(1246, 27, 27, '/', '2018-01-26 08:15:36', NULL, NULL, NULL),
(1247, 27, 27, '/login', '2018-01-26 08:15:37', NULL, NULL, NULL),
(1248, 27, 27, '/login', '2018-01-26 08:17:33', NULL, NULL, NULL),
(1249, 27, 27, '/', '2018-01-26 08:17:39', NULL, NULL, NULL),
(1250, 27, 27, '/', '2018-01-26 08:17:40', NULL, NULL, NULL),
(1251, 27, 27, '/', '2018-01-26 08:18:59', NULL, NULL, NULL),
(1252, 27, 27, '/', '2018-01-26 08:18:59', NULL, NULL, NULL),
(1253, 27, 27, '/', '2018-01-26 08:20:25', NULL, NULL, NULL),
(1254, 27, 27, '/', '2018-01-26 08:20:25', NULL, NULL, NULL),
(1255, 27, 27, '/', '2018-01-26 08:20:53', NULL, NULL, NULL),
(1256, 27, 27, '/', '2018-01-26 08:20:53', NULL, NULL, NULL),
(1257, 27, 27, '/', '2018-01-26 08:24:01', NULL, NULL, NULL),
(1258, 27, 27, '/', '2018-01-26 08:24:02', NULL, NULL, NULL),
(1259, 27, 27, '/company', '2018-01-26 08:24:07', NULL, NULL, NULL),
(1260, 27, 27, '/company', '2018-01-26 08:24:10', NULL, NULL, NULL),
(1261, 27, 27, '/company', '2018-01-26 08:24:36', NULL, NULL, NULL),
(1262, 27, 27, '/company', '2018-01-26 08:24:38', NULL, NULL, NULL),
(1263, 27, 27, '/company', '2018-01-26 08:25:42', NULL, NULL, NULL),
(1264, 27, 27, '/company', '2018-01-26 08:26:11', NULL, NULL, NULL),
(1265, 27, 27, '/company', '2018-01-26 08:26:41', NULL, NULL, NULL),
(1266, 27, 27, '/company', '2018-01-26 08:27:05', NULL, NULL, NULL),
(1267, 27, 27, '/company', '2018-01-26 08:27:37', NULL, NULL, NULL),
(1268, 27, 27, '/company', '2018-01-26 08:28:05', NULL, NULL, NULL),
(1269, 27, 27, '/company', '2018-01-26 08:28:24', NULL, NULL, NULL),
(1270, 27, 27, '/company', '2018-01-26 08:29:32', NULL, NULL, NULL),
(1271, 27, 27, '/company', '2018-01-26 08:29:38', NULL, NULL, NULL),
(1272, 27, 27, '/company', '2018-01-26 08:29:57', NULL, NULL, NULL),
(1273, 27, 27, '/company', '2018-01-26 08:30:11', NULL, NULL, NULL),
(1274, 27, 27, '/company', '2018-01-26 08:30:15', NULL, NULL, NULL),
(1275, 27, 27, '/company', '2018-01-26 08:30:21', NULL, NULL, NULL),
(1276, 27, 27, '/company', '2018-01-26 08:30:23', NULL, NULL, NULL),
(1277, 27, 27, '/company', '2018-01-26 08:30:31', NULL, NULL, NULL),
(1278, 27, 27, '/company', '2018-01-26 08:30:33', NULL, NULL, NULL),
(1279, 27, 27, '/company', '2018-01-26 08:32:47', NULL, NULL, NULL),
(1280, 27, 27, '/', '2018-01-26 08:33:12', NULL, NULL, NULL),
(1281, 27, 27, '/', '2018-01-26 08:33:12', NULL, NULL, NULL),
(1282, 27, 27, '/', '2018-01-26 08:33:59', NULL, NULL, NULL),
(1283, 27, 27, '/', '2018-01-26 08:33:59', NULL, NULL, NULL),
(1284, 27, 27, '/company', '2018-01-26 08:35:46', NULL, NULL, NULL),
(1285, 27, 27, '/company', '2018-01-26 08:35:49', NULL, NULL, NULL),
(1286, 27, 27, '/company', '2018-01-26 08:35:50', NULL, NULL, NULL),
(1287, 27, 27, '/company', '2018-01-26 08:36:16', NULL, NULL, NULL),
(1288, 27, 27, '/company', '2018-01-26 08:37:13', NULL, NULL, NULL),
(1289, 27, 27, '/', '2018-01-26 08:37:21', NULL, NULL, NULL),
(1290, 27, 27, '/', '2018-01-26 08:37:21', NULL, NULL, NULL),
(1291, 27, 27, '/', '2018-01-26 08:37:32', NULL, NULL, NULL),
(1292, 27, 27, '/', '2018-01-26 08:37:32', NULL, NULL, NULL),
(1293, 27, 27, '/', '2018-01-26 08:37:33', NULL, NULL, NULL),
(1294, 27, 27, '/', '2018-01-26 08:37:33', NULL, NULL, NULL),
(1295, 27, 27, '/', '2018-01-26 08:37:36', NULL, NULL, NULL),
(1296, 27, 27, '/', '2018-01-26 08:37:36', NULL, NULL, NULL),
(1297, 27, 27, '/', '2018-01-26 08:37:39', NULL, NULL, NULL),
(1298, 27, 27, '/', '2018-01-26 08:37:42', NULL, NULL, NULL),
(1299, 27, 27, '/', '2018-01-26 08:37:43', NULL, NULL, NULL),
(1300, 27, 27, '/', '2018-01-26 08:37:44', NULL, NULL, NULL),
(1301, 27, 27, '/company', '2018-01-26 08:37:49', NULL, NULL, NULL),
(1302, 27, 27, '/company', '2018-01-26 08:37:50', NULL, NULL, NULL),
(1303, 27, 27, '/company', '2018-01-26 08:37:53', NULL, NULL, NULL),
(1304, 27, 27, '/company', '2018-01-26 08:37:55', NULL, NULL, NULL),
(1305, 27, 27, '/company', '2018-01-26 08:38:25', NULL, NULL, NULL),
(1306, 27, 27, '/company', '2018-01-26 08:40:22', NULL, NULL, NULL),
(1307, 27, 27, '/company', '2018-01-26 08:58:05', NULL, NULL, NULL),
(1308, 27, 27, '/company', '2018-01-26 08:58:11', NULL, NULL, NULL),
(1309, 27, 27, '/company', '2018-01-26 08:58:18', NULL, NULL, NULL),
(1310, 27, 27, '/company', '2018-01-26 08:58:23', NULL, NULL, NULL),
(1311, 27, 27, '/company', '2018-01-26 08:58:38', NULL, NULL, NULL),
(1312, 27, 27, '/company', '2018-01-26 09:04:47', NULL, NULL, NULL),
(1313, 27, 27, '/company', '2018-01-26 09:06:43', NULL, NULL, NULL),
(1314, 27, 27, '/company', '2018-01-26 09:06:55', NULL, NULL, NULL),
(1315, 27, 27, '/company', '2018-01-26 09:07:03', NULL, NULL, NULL),
(1316, 27, 27, '/company', '2018-01-26 09:07:12', NULL, NULL, NULL),
(1317, 27, 27, '/company', '2018-01-26 09:07:50', NULL, NULL, NULL),
(1318, 27, 27, '/company', '2018-01-26 09:08:50', NULL, NULL, NULL),
(1319, 27, 27, '/company', '2018-01-26 09:09:02', NULL, NULL, NULL),
(1320, 27, 27, '/company', '2018-01-26 09:09:27', NULL, NULL, NULL),
(1321, 27, 27, '/company', '2018-01-26 09:10:10', NULL, NULL, NULL),
(1322, 27, 27, '/company', '2018-01-26 09:10:37', NULL, NULL, NULL),
(1323, 27, 27, '/company', '2018-01-26 09:15:46', NULL, NULL, NULL),
(1324, 27, 27, '/company', '2018-01-26 09:16:27', NULL, NULL, NULL),
(1325, 27, 27, '/company', '2018-01-26 09:16:55', NULL, NULL, NULL),
(1326, 27, 27, '/company', '2018-01-26 09:17:57', NULL, NULL, NULL),
(1327, 27, 27, '/company', '2018-01-26 09:18:10', NULL, NULL, NULL),
(1328, 27, 27, '/company', '2018-01-26 09:20:10', NULL, NULL, NULL),
(1329, 27, 27, '/company', '2018-01-26 09:20:48', NULL, NULL, NULL),
(1330, 27, 27, '/company', '2018-01-26 09:28:49', NULL, NULL, NULL),
(1331, 27, 27, '/company', '2018-01-26 09:33:32', NULL, NULL, NULL),
(1332, 27, 27, '/company', '2018-01-26 09:33:42', NULL, NULL, NULL),
(1333, 27, 27, '/company', '2018-01-26 09:33:44', NULL, NULL, NULL),
(1334, 27, 27, '/company', '2018-01-26 09:33:46', NULL, NULL, NULL),
(1335, 27, 27, '/company', '2018-01-26 09:34:27', NULL, NULL, NULL),
(1336, 27, 27, '/company', '2018-01-26 09:34:34', NULL, NULL, NULL),
(1337, 27, 27, '/company', '2018-01-26 09:36:11', NULL, NULL, NULL),
(1338, 27, 27, '/company', '2018-01-26 09:36:14', NULL, NULL, NULL),
(1339, 27, 27, '/company', '2018-01-26 09:36:14', NULL, NULL, NULL),
(1340, 27, 27, '/company', '2018-01-26 09:36:16', NULL, NULL, NULL),
(1341, 27, 27, '/company', '2018-01-26 09:36:29', NULL, NULL, NULL),
(1342, 27, 27, '/company', '2018-01-26 09:36:33', NULL, NULL, NULL),
(1343, 27, 27, '/company', '2018-01-26 09:36:37', NULL, NULL, NULL),
(1344, 27, 27, '/company', '2018-01-26 09:36:51', NULL, NULL, NULL),
(1345, 27, 27, '/company', '2018-01-26 09:37:03', NULL, NULL, NULL),
(1346, 27, 27, '/company', '2018-01-26 09:37:07', NULL, NULL, NULL),
(1347, 27, 27, '/company', '2018-01-26 09:37:49', NULL, NULL, NULL),
(1348, 27, 27, '/company', '2018-01-26 09:39:48', NULL, NULL, NULL),
(1349, 27, 27, '/company', '2018-01-26 09:39:54', NULL, NULL, NULL),
(1350, 27, 27, '/company', '2018-01-26 09:42:09', NULL, NULL, NULL),
(1351, 27, 27, '/company', '2018-01-26 09:42:11', NULL, NULL, NULL),
(1352, 27, 27, '/company', '2018-01-26 09:42:29', NULL, NULL, NULL),
(1353, 27, 27, '/company', '2018-01-26 09:45:11', NULL, NULL, NULL),
(1354, 27, 27, '/company', '2018-01-26 09:45:14', NULL, NULL, NULL),
(1355, 27, 27, '/company', '2018-01-26 09:45:31', NULL, NULL, NULL),
(1356, 27, 27, '/company', '2018-01-26 09:45:33', NULL, NULL, NULL),
(1357, 27, 27, '/company', '2018-01-26 09:45:34', NULL, NULL, NULL),
(1358, 27, 27, '/company', '2018-01-26 09:45:35', NULL, NULL, NULL),
(1359, 27, 27, '/company', '2018-01-26 09:54:11', NULL, NULL, NULL),
(1360, 27, 27, '/company', '2018-01-26 09:54:12', NULL, NULL, NULL),
(1361, 27, 27, '/company', '2018-01-26 09:54:13', NULL, NULL, NULL),
(1362, 27, 27, '/company', '2018-01-26 09:54:24', NULL, NULL, NULL),
(1363, 27, 27, '/company', '2018-01-26 09:54:33', NULL, NULL, NULL),
(1364, 27, 27, '/company', '2018-01-26 09:54:43', NULL, NULL, NULL),
(1365, 27, 27, '/company', '2018-01-26 09:55:17', NULL, NULL, NULL),
(1366, 27, 27, '/company', '2018-01-26 09:55:31', NULL, NULL, NULL),
(1367, 27, 27, '/company', '2018-01-26 09:55:35', NULL, NULL, NULL),
(1368, 27, 27, '/company', '2018-01-26 09:55:56', NULL, NULL, NULL),
(1369, 27, 27, '/company', '2018-01-26 09:56:10', NULL, NULL, NULL),
(1370, 27, 27, '/company', '2018-01-26 09:56:15', NULL, NULL, NULL),
(1371, 27, 27, '/', '2018-01-26 10:01:39', NULL, NULL, NULL),
(1372, 27, 27, '/', '2018-01-26 10:01:41', NULL, NULL, NULL),
(1373, 27, 27, '/', '2018-01-26 10:01:42', NULL, NULL, NULL),
(1374, 27, 27, '/', '2018-01-26 10:01:42', NULL, NULL, NULL),
(1375, 27, 27, '/', '2018-01-26 10:01:44', NULL, NULL, NULL),
(1376, 27, 27, '/', '2018-01-26 10:01:44', NULL, NULL, NULL),
(1377, 27, 27, '/', '2018-01-26 10:01:45', NULL, NULL, NULL),
(1378, 27, 27, '/', '2018-01-26 10:01:46', NULL, NULL, NULL),
(1379, 27, 27, '/', '2018-01-26 10:01:46', NULL, NULL, NULL),
(1380, 27, 27, '/', '2018-01-26 10:01:47', NULL, NULL, NULL),
(1381, 27, 27, '/', '2018-01-26 10:01:52', NULL, NULL, NULL),
(1382, 27, 27, '/', '2018-01-26 10:01:52', NULL, NULL, NULL),
(1383, 27, 27, '/', '2018-01-26 10:01:53', NULL, NULL, NULL),
(1384, 27, 27, '/', '2018-01-26 10:01:54', NULL, NULL, NULL),
(1385, 27, 27, '/', '2018-01-26 10:09:14', NULL, NULL, NULL),
(1386, 27, 27, '/company', '2018-01-26 10:09:15', NULL, NULL, NULL),
(1387, 27, 27, '/company', '2018-01-26 10:09:17', NULL, NULL, NULL),
(1388, 27, 27, '/company', '2018-01-26 10:09:20', NULL, NULL, NULL),
(1389, 27, 27, '/company', '2018-01-26 10:15:34', NULL, NULL, NULL),
(1390, 27, 27, '/company', '2018-01-26 10:15:35', NULL, NULL, NULL),
(1391, 27, 27, '/company', '2018-01-26 10:15:45', NULL, NULL, NULL),
(1392, 27, 27, '/company', '2018-01-26 10:15:48', NULL, NULL, NULL),
(1393, 27, 27, '/company', '2018-01-26 10:15:53', NULL, NULL, NULL),
(1394, 27, 27, '/admin', '2018-01-26 10:16:23', NULL, NULL, NULL),
(1395, 27, 27, '/admin-routes', '2018-01-26 10:16:25', NULL, NULL, NULL),
(1396, 27, 27, '/company', '2018-01-26 10:21:28', NULL, NULL, NULL),
(1397, 27, 27, '/admin-routes', '2018-01-26 10:23:30', NULL, NULL, NULL),
(1398, 27, 27, '/shop', '2018-01-26 10:23:37', NULL, NULL, NULL),
(1399, 27, 27, '/admin-routes', '2018-01-26 10:24:07', NULL, NULL, NULL),
(1400, 27, 27, '/shop', '2018-01-26 10:24:10', NULL, NULL, NULL),
(1401, 27, 27, '/admin-routes', '2018-01-26 10:24:35', NULL, NULL, NULL),
(1402, 27, 27, '/admin-routes', '2018-01-26 10:24:47', NULL, NULL, NULL),
(1403, 27, 27, '/shop', '2018-01-26 10:24:48', NULL, NULL, NULL),
(1404, 27, 27, '/', '2018-01-26 10:25:15', NULL, NULL, NULL),
(1405, 27, 27, '/shop', '2018-01-26 10:32:01', NULL, NULL, NULL),
(1406, 27, 27, '/shop', '2018-01-26 10:32:09', NULL, NULL, NULL),
(1407, 27, 27, '/shop', '2018-01-26 10:32:10', NULL, NULL, NULL),
(1408, 27, 27, '/', '2018-01-26 10:48:57', NULL, NULL, NULL),
(1409, 27, 27, '/company', '2018-01-26 10:48:58', NULL, NULL, NULL),
(1410, 27, 27, '/cemeteries', '2018-01-26 10:48:59', NULL, NULL, NULL),
(1411, 27, 27, '/company', '2018-01-26 10:49:00', NULL, NULL, NULL),
(1412, 27, 27, '/', '2018-01-26 10:49:01', NULL, NULL, NULL),
(1413, 27, 27, '/admin', '2018-01-26 10:49:02', NULL, NULL, NULL),
(1414, 27, 27, '/admin-routes', '2018-01-26 10:49:03', NULL, NULL, NULL),
(1415, 27, 27, '/admin-routes', '2018-01-26 10:49:06', NULL, NULL, NULL),
(1416, 27, 27, '/admin-routes', '2018-01-26 10:49:07', NULL, NULL, NULL),
(1417, 27, 27, '/admin-routes', '2018-01-26 10:49:10', NULL, NULL, NULL),
(1418, 27, 27, '/admin-routes', '2018-01-26 10:49:13', NULL, NULL, NULL),
(1419, 27, 27, '/admin-routes', '2018-01-26 10:59:47', NULL, NULL, NULL),
(1420, 27, 27, '/admin-routes', '2018-01-26 11:00:06', NULL, NULL, NULL),
(1421, 27, 27, '/admin-routes', '2018-01-26 11:01:24', NULL, NULL, NULL),
(1422, 27, 27, '/admin-routes', '2018-01-26 11:01:28', NULL, NULL, NULL),
(1423, 27, 27, '/admin-routes', '2018-01-26 11:01:49', NULL, NULL, NULL),
(1424, 27, 27, '/admin-routes', '2018-01-26 11:01:51', NULL, NULL, NULL),
(1425, 27, 27, '/admin-routes', '2018-01-26 11:01:52', NULL, NULL, NULL),
(1426, 27, 27, '/shop', '2018-01-26 11:11:12', NULL, NULL, NULL),
(1427, 27, 27, '/shop', '2018-01-26 11:35:45', NULL, NULL, NULL),
(1428, 27, 27, '/', '2018-01-26 11:39:02', NULL, NULL, NULL),
(1429, 27, 27, '/shop', '2018-01-26 11:42:27', NULL, NULL, NULL),
(1430, 27, 27, '/shop', '2018-01-26 11:45:07', NULL, NULL, NULL),
(1431, 27, 27, '/shop', '2018-01-26 11:45:15', NULL, NULL, NULL),
(1432, 27, 27, '/shop', '2018-01-26 11:45:21', NULL, NULL, NULL),
(1433, 27, 27, '/shop', '2018-01-26 11:45:24', NULL, NULL, NULL),
(1434, 27, 27, '/shop', '2018-01-26 11:45:25', NULL, NULL, NULL),
(1435, 27, 27, '/shop', '2018-01-26 11:45:27', NULL, NULL, NULL),
(1436, 27, 27, '/shop', '2018-01-26 11:45:30', NULL, NULL, NULL),
(1437, 27, 27, '/shop', '2018-01-26 11:45:34', NULL, NULL, NULL),
(1438, 27, 27, '/shop', '2018-01-26 11:55:14', NULL, NULL, NULL),
(1439, 27, 27, '/shop', '2018-01-26 11:55:15', NULL, NULL, NULL),
(1440, 27, 27, '/shop', '2018-01-26 11:55:37', NULL, NULL, NULL),
(1441, 27, 27, '/', '2018-01-26 12:14:37', NULL, NULL, NULL),
(1442, 27, 27, '/', '2018-01-26 12:14:39', NULL, NULL, NULL),
(1443, 27, 27, '/', '2018-01-26 12:14:39', NULL, NULL, NULL),
(1444, 27, 27, '/admin', '2018-01-26 12:16:26', NULL, NULL, NULL),
(1445, 28, 28, '/', '2018-01-26 12:16:28', NULL, NULL, NULL),
(1446, 28, 28, '/login', '2018-01-26 12:16:29', NULL, NULL, NULL),
(1447, 28, 28, '/shop', '2018-01-26 12:17:12', NULL, NULL, NULL),
(1448, 28, 28, '/shop', '2018-01-26 12:17:16', NULL, NULL, NULL),
(1449, 28, 28, '/login', '2018-01-26 12:17:18', NULL, NULL, NULL),
(1450, 28, 28, '/', '2018-01-26 12:17:24', NULL, NULL, NULL),
(1451, 28, 28, '/', '2018-01-26 12:17:56', NULL, NULL, NULL),
(1452, 28, 28, '/', '2018-01-26 12:17:56', NULL, NULL, NULL),
(1453, 28, 28, '/', '2018-01-26 12:17:57', NULL, NULL, NULL),
(1454, 28, 28, '/', '2018-01-26 12:17:58', NULL, NULL, NULL),
(1455, 28, 28, '/', '2018-01-26 12:18:10', NULL, NULL, NULL),
(1456, 28, 28, '/', '2018-01-26 12:18:10', NULL, NULL, NULL),
(1457, 28, 28, '/', '2018-01-26 12:18:11', NULL, NULL, NULL),
(1458, 28, 28, '/', '2018-01-26 12:18:12', NULL, NULL, NULL),
(1459, 28, 28, '/', '2018-01-26 12:18:13', NULL, NULL, NULL),
(1460, 28, 28, '/', '2018-01-26 12:18:13', NULL, NULL, NULL),
(1461, 28, 28, '/', '2018-01-26 12:18:18', NULL, NULL, NULL),
(1462, 28, 28, '/', '2018-01-26 12:18:19', NULL, NULL, NULL),
(1463, 28, 28, '/', '2018-01-26 12:18:33', NULL, NULL, NULL),
(1464, 28, 28, '/', '2018-01-26 12:18:33', NULL, NULL, NULL),
(1465, 28, 28, '/', '2018-01-26 12:18:38', NULL, NULL, NULL),
(1466, 28, 28, '/', '2018-01-26 12:18:39', NULL, NULL, NULL),
(1467, 28, 28, '/', '2018-01-26 12:18:42', NULL, NULL, NULL),
(1468, 28, 28, '/', '2018-01-26 12:18:42', NULL, NULL, NULL),
(1469, 28, 28, '/', '2018-01-26 12:18:43', NULL, NULL, NULL),
(1470, 28, 28, '/', '2018-01-26 12:18:44', NULL, NULL, NULL),
(1471, 28, 28, '/', '2018-01-26 12:18:44', NULL, NULL, NULL),
(1472, 28, 28, '/', '2018-01-26 12:18:44', NULL, NULL, NULL),
(1473, 28, 28, '/', '2018-01-26 12:18:46', NULL, NULL, NULL),
(1474, 28, 28, '/', '2018-01-26 12:18:46', NULL, NULL, NULL),
(1475, 28, 28, '/', '2018-01-26 12:18:47', NULL, NULL, NULL),
(1476, 28, 28, '/', '2018-01-26 12:18:47', NULL, NULL, NULL),
(1477, 28, 28, '/', '2018-01-26 12:18:59', NULL, NULL, NULL),
(1478, 28, 28, '/', '2018-01-26 12:18:59', NULL, NULL, NULL),
(1479, 28, 28, '/', '2018-01-26 12:19:23', NULL, NULL, NULL),
(1480, 28, 28, '/', '2018-01-26 12:19:23', NULL, NULL, NULL),
(1481, 28, 28, '/', '2018-01-26 12:19:25', NULL, NULL, NULL),
(1482, 28, 28, '/', '2018-01-26 12:19:25', NULL, NULL, NULL),
(1483, 28, 28, '/', '2018-01-26 12:19:27', NULL, NULL, NULL),
(1484, 28, 28, '/', '2018-01-26 12:19:27', NULL, NULL, NULL),
(1485, 28, 28, '/', '2018-01-26 12:19:28', NULL, NULL, NULL),
(1486, 28, 28, '/', '2018-01-26 12:19:28', NULL, NULL, NULL),
(1487, 28, 28, '/', '2018-01-26 12:19:29', NULL, NULL, NULL),
(1488, 28, 28, '/', '2018-01-26 12:19:30', NULL, NULL, NULL),
(1489, 28, 28, '/', '2018-01-26 12:19:31', NULL, NULL, NULL),
(1490, 28, 28, '/', '2018-01-26 12:19:31', NULL, NULL, NULL),
(1491, 28, 28, '/', '2018-01-26 12:19:32', NULL, NULL, NULL),
(1492, 28, 28, '/', '2018-01-26 12:19:32', NULL, NULL, NULL),
(1493, 28, 28, '/', '2018-01-26 12:19:33', NULL, NULL, NULL),
(1494, 28, 28, '/', '2018-01-26 12:19:34', NULL, NULL, NULL),
(1495, 28, 28, '/', '2018-01-26 12:19:35', NULL, NULL, NULL),
(1496, 28, 28, '/', '2018-01-26 12:19:35', NULL, NULL, NULL),
(1497, 28, 28, '/', '2018-01-26 12:19:53', NULL, NULL, NULL),
(1498, 28, 28, '/', '2018-01-26 12:19:53', NULL, NULL, NULL),
(1499, 28, 28, '/', '2018-01-26 12:19:55', NULL, NULL, NULL),
(1500, 28, 28, '/', '2018-01-26 12:19:55', NULL, NULL, NULL),
(1501, 28, 28, '/', '2018-01-26 12:19:56', NULL, NULL, NULL),
(1502, 28, 28, '/', '2018-01-26 12:19:56', NULL, NULL, NULL),
(1503, 28, 28, '/', '2018-01-26 12:19:57', NULL, NULL, NULL),
(1504, 28, 28, '/', '2018-01-26 12:19:57', NULL, NULL, NULL),
(1505, 28, 28, '/', '2018-01-26 12:19:58', NULL, NULL, NULL),
(1506, 28, 28, '/', '2018-01-26 12:20:01', NULL, NULL, NULL);

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
(1, NULL, '2018-01-24 10:03:10'),
(2, NULL, '2018-01-24 10:05:11'),
(3, NULL, '2018-01-25 05:48:42'),
(4, NULL, '2018-01-25 06:24:28'),
(5, NULL, '2018-01-25 06:38:10'),
(6, NULL, '2018-01-25 06:41:39'),
(7, NULL, '2018-01-25 06:45:38'),
(8, NULL, '2018-01-25 07:12:09'),
(9, NULL, '2018-01-25 07:25:03'),
(10, NULL, '2018-01-25 08:54:01'),
(11, NULL, '2018-01-25 10:27:05'),
(12, NULL, '2018-01-25 10:31:14'),
(13, NULL, '2018-01-25 10:51:38'),
(14, NULL, '2018-01-25 11:01:25'),
(15, NULL, '2018-01-25 11:05:38'),
(16, NULL, '2018-01-25 11:26:29'),
(17, NULL, '2018-01-25 11:28:55'),
(18, NULL, '2018-01-25 11:32:50'),
(19, NULL, '2018-01-25 11:33:50'),
(20, NULL, '2018-01-25 11:55:10'),
(21, NULL, '2018-01-25 11:55:14'),
(22, NULL, '2018-01-25 11:55:30'),
(23, NULL, '2018-01-25 11:57:10'),
(24, NULL, '2018-01-25 11:57:26'),
(25, NULL, '2018-01-25 12:16:56'),
(26, NULL, '2018-01-26 08:13:44'),
(27, NULL, '2018-01-26 08:15:36'),
(28, NULL, '2018-01-26 12:16:28');

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
(1, 1, 5, '1', '2018-01-24 10:03:10', NULL, NULL),
(2, 2, 180, '1', '2018-01-24 10:05:11', NULL, NULL),
(3, 3, 71, '1', '2018-01-25 05:48:42', NULL, NULL),
(4, 4, 4, '1', '2018-01-25 06:24:28', NULL, NULL),
(5, 5, 8, '1', '2018-01-25 06:38:10', NULL, NULL),
(6, 6, 4, '1', '2018-01-25 06:41:39', NULL, NULL),
(7, 7, 23, '1', '2018-01-25 06:45:38', NULL, NULL),
(8, 8, 128, '1', '2018-01-25 07:12:09', NULL, NULL),
(9, 9, 1, '1', '2018-01-25 07:25:03', NULL, NULL),
(10, 10, 146, '1', '2018-01-25 08:54:01', NULL, NULL),
(11, 11, 5, '1', '2018-01-25 10:27:05', NULL, NULL),
(12, 12, 35, '1', '2018-01-25 10:31:14', NULL, NULL),
(13, 13, 21, '1', '2018-01-25 10:51:38', NULL, NULL),
(14, 14, 13, '1', '2018-01-25 11:01:25', NULL, NULL),
(15, 15, 41, '1', '2018-01-25 11:05:38', NULL, NULL),
(16, 16, 8, '1', '2018-01-25 11:26:29', NULL, NULL),
(17, 17, 14, '1', '2018-01-25 11:28:55', NULL, NULL),
(18, 18, 7, '1', '2018-01-25 11:32:50', NULL, NULL),
(19, 19, 65, '1', '2018-01-25 11:33:50', NULL, NULL),
(20, 20, 1, '1', '2018-01-25 11:55:10', NULL, NULL),
(21, 21, 24, '1', '2018-01-25 11:55:14', NULL, NULL),
(22, 22, 41, '1', '2018-01-25 11:55:30', NULL, NULL),
(23, 23, 13, '1', '2018-01-25 11:57:10', NULL, NULL),
(24, 24, 36, '1', '2018-01-25 11:57:26', NULL, NULL),
(25, 25, 342, '1', '2018-01-25 12:16:56', NULL, NULL),
(26, 26, 7, '1', '2018-01-26 08:13:45', NULL, NULL),
(27, 27, 200, '1', '2018-01-26 08:15:36', NULL, NULL),
(28, 28, 62, '1', '2018-01-26 12:16:28', NULL, NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `fragments`
--
ALTER TABLE `fragments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT для таблицы `fragments_blocks`
--
ALTER TABLE `fragments_blocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `fragments_data`
--
ALTER TABLE `fragments_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT для таблицы `global_site_config`
--
ALTER TABLE `global_site_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `header_nav`
--
ALTER TABLE `header_nav`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `menu_groups`
--
ALTER TABLE `menu_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1507;

--
-- AUTO_INCREMENT для таблицы `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `visits`
--
ALTER TABLE `visits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
