-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Янв 24 2018 г., 13:34
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
-- База данных: `test-routes`
--

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `id` int(11) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'является ли пользователь администратором',
  `userId` int(11) NOT NULL DEFAULT '0' COMMENT 'id пользователя',
  `confirmed` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Регистрация завершена или нет',
  `surname` varchar(32) DEFAULT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `patronymic` varchar(32) DEFAULT NULL,
  `name` varchar(62) DEFAULT NULL,
  `phone` text CHARACTER SET cp1251 NOT NULL,
  `password` text NOT NULL,
  `hash` varchar(32) DEFAULT NULL,
  `mail` varchar(255) CHARACTER SET cp1251 DEFAULT NULL,
  `address` text CHARACTER SET cp1251,
  `passAdress` text CHARACTER SET cp1251,
  `passport` text CHARACTER SET cp1251,
  `passGivedDate` int(11) DEFAULT NULL,
  `passGivedOrg` text CHARACTER SET cp1251,
  `source` int(11) DEFAULT NULL,
  `sourceType` int(11) DEFAULT NULL,
  `answer1` text CHARACTER SET cp1251,
  `answer2` text CHARACTER SET cp1251,
  `answer3` text CHARACTER SET cp1251,
  `answer5` text CHARACTER SET cp1251,
  `answer6` text CHARACTER SET cp1251,
  `success` text CHARACTER SET cp1251,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`id`, `admin`, `userId`, `confirmed`, `surname`, `firstname`, `patronymic`, `name`, `phone`, `password`, `hash`, `mail`, `address`, `passAdress`, `passport`, `passGivedDate`, `passGivedOrg`, `source`, `sourceType`, `answer1`, `answer2`, `answer3`, `answer5`, `answer6`, `success`, `created`) VALUES
(1, 1, 0, 1, 'Зуев', 'Никита', 'Дмитриевич', NULL, '123456789', '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-01-15 09:35:10');

-- --------------------------------------------------------

--
-- Структура таблицы `components`
--

CREATE TABLE `components` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `ctrl` varchar(64) DEFAULT NULL,
  `static` tinyint(1) NOT NULL,
  `once` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Единственный на странице',
  `type` int(11) NOT NULL COMMENT 'Статический или исполняемый',
  `styles` text,
  `scripts` text,
  `default_config` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `components`
--

INSERT INTO `components` (`id`, `title`, `name`, `ctrl`, `static`, `once`, `type`, `styles`, `scripts`, `default_config`, `created`) VALUES
(1, 'Управление маршрутами', 'routes-list', 'routes-list', 0, 0, 2, NULL, NULL, NULL, '2018-01-10 08:58:25'),
(2, 'Статический контент', 'static-content', NULL, 1, 0, 1, NULL, NULL, '{\"content\": {\"body\": \"text\"}}', '2018-01-10 09:22:25'),
(3, 'Главный слайдер', 'main-slider', 'main-slider', 0, 1, 1, NULL, NULL, '{\"content\":{\"slides\":[]}}', '2018-01-10 12:17:53'),
(4, 'Страница авторизации', 'login-page', 'login-page', 0, 1, 2, NULL, NULL, NULL, '2018-01-15 07:19:51'),
(5, 'Отображение новости', 'news-id', 'news-id', 0, 0, 2, NULL, NULL, NULL, '2018-01-24 06:34:23'),
(6, 'Список новостей', 'news-list', 'news-list', 0, 0, 2, NULL, NULL, NULL, '2018-01-24 08:34:58');

-- --------------------------------------------------------

--
-- Структура таблицы `component_types`
--

CREATE TABLE `component_types` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `component_types`
--

INSERT INTO `component_types` (`id`, `title`) VALUES
(1, 'Статический'),
(2, 'Исполняемый');

-- --------------------------------------------------------

--
-- Структура таблицы `fragments`
--

CREATE TABLE `fragments` (
  `id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL DEFAULT '2',
  `route_id` int(11) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `fragments`
--

INSERT INTO `fragments` (`id`, `component_id`, `route_id`, `priority`, `created`) VALUES
(38, 1, 40, 1, '2018-01-17 10:44:49'),
(39, 4, 41, 1, '2018-01-17 10:46:24'),
(52, 5, 45, 1, '2018-01-24 06:35:02'),
(54, 6, 47, 1, '2018-01-24 08:35:35'),
(55, 2, 48, 1, '2018-01-24 10:08:18'),
(56, 3, 32, 1, '2018-01-24 10:16:55');

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
(8, NULL, 56, '{\"content\":{\"slides\":[{\"id\":1,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"12323\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"},{\"id\":2,\"img\":\"\",\"img_bottom\":\"\",\"title\":\"\",\"title_bottom\":\"\",\"description\":\"\",\"href\":\"\"}]}}', '2018-01-24 10:16:59'),
(11, NULL, 55, '{\"content\":{\"body\":\"<p><img alt=\\\"\\\" src=\\\"/uploads/upload_a8ca4e2a9cc065a9bb90e2507086ed4b.png\\\" style=\\\"height:270px; width:480px\\\" /></p>\\n\\n<p>12123213123</p>\\n\"}}', '2018-01-24 10:29:49');

-- --------------------------------------------------------

--
-- Структура таблицы `menu_groups`
--

CREATE TABLE `menu_groups` (
  `id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT 'Новая группа',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `name` varchar(64) NOT NULL,
  `title` varchar(64) NOT NULL DEFAULT 'Новый маршрут',
  `url` varchar(255) NOT NULL,
  `ctrl` varchar(55) DEFAULT NULL,
  `template_id` int(11) DEFAULT '1',
  `menu_id` int(11) DEFAULT NULL,
  `access` int(11) DEFAULT '1',
  `dynamic` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `seo_keywords` text,
  `seo_description` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `routes`
--

INSERT INTO `routes` (`id`, `name`, `title`, `url`, `ctrl`, `template_id`, `menu_id`, `access`, `dynamic`, `seo_keywords`, `seo_description`, `created`, `updated`) VALUES
(32, 'home', 'Главная страница', '/', 'home', 1, NULL, 1, 0, NULL, NULL, '2018-01-17 10:11:31', '2018-01-20 20:44:11'),
(40, 'admin', 'Администрирование', '/admin', NULL, 2, NULL, 3, 0, '', '', '2018-01-20 20:43:27', '2018-01-24 10:39:07'),
(41, 'login', 'login', '/login', NULL, 1, NULL, 1, 0, NULL, NULL, '2018-01-17 10:46:17', '2018-01-20 20:44:11'),
(48, 'company', 'Компания', '/company', NULL, 1, NULL, 1, 0, 'Ключевые, слова', 'Описание', '2018-01-24 10:07:54', '2018-01-24 10:07:54');

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
(83, 2, 1, '/admin', '2018-01-24 10:39:07', NULL, NULL, NULL);

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
(2, NULL, '2018-01-24 10:05:11');

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
(2, 2, 77, '1', '2018-01-24 10:05:11', NULL, NULL);

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
  ADD KEY `type` (`type`);

--
-- Индексы таблицы `component_types`
--
ALTER TABLE `component_types`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `fragments`
--
ALTER TABLE `fragments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fragments_ibfk_1` (`component_id`),
  ADD KEY `fragments_ibfk_2` (`route_id`);

--
-- Индексы таблицы `fragments_data`
--
ALTER TABLE `fragments_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `component_id` (`component_id`),
  ADD KEY `fragments_data_ibfk_2` (`fragment_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `components`
--
ALTER TABLE `components`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `component_types`
--
ALTER TABLE `component_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `fragments`
--
ALTER TABLE `fragments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT для таблицы `fragments_data`
--
ALTER TABLE `fragments_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `menu_groups`
--
ALTER TABLE `menu_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `routes_access`
--
ALTER TABLE `routes_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `routes_aliases`
--
ALTER TABLE `routes_aliases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `templates`
--
ALTER TABLE `templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `views`
--
ALTER TABLE `views`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT для таблицы `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `visits`
--
ALTER TABLE `visits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `components`
--
ALTER TABLE `components`
  ADD CONSTRAINT `components_ibfk_1` FOREIGN KEY (`type`) REFERENCES `component_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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