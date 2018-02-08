-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 07 2018 г., 13:28
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
(16, 'Оформление заказа', 'go-order', 2, 0, 0, NULL, NULL, NULL, '2018-02-01 11:20:25'),
(17, 'Управление компонентами', 'components-manage', 2, 0, 0, NULL, NULL, NULL, '2018-02-05 17:43:42'),
(18, 'Личный кабинет', 'my-cabinet', 2, 0, 0, NULL, NULL, NULL, '2018-02-07 06:47:14'),
(19, 'Успешный заказ', 'order-complete', 2, 0, 0, NULL, NULL, NULL, '2018-02-07 08:39:42'),
(20, 'Управление переменными сайта', 'global-variables', 2, 0, 0, NULL, NULL, NULL, '2018-02-07 11:33:46');

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
(97, 13, 48, 1, 1, '2018-01-29 11:42:49'),
(98, 13, 51, 1, 1, '2018-01-29 11:43:02'),
(99, 8, 50, 2, 1, '2018-01-29 11:43:26'),
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
(113, 20, 70, 2, 1, '2018-02-07 11:32:02');

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
(29, NULL, 105, '{\"content\":{\"slides\":[],\"lastId\":2}}', '2018-02-02 09:58:12');

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
(2, 'Пароль root-пользователя', 'rootPassword', '4c5fd6d240c4e226e5cc1b53b1dbfaf3', '2018-01-25 10:12:28', NULL),
(3, 'фыв', 'фыв', 'ыфвфыв', '2018-02-07 12:27:48', NULL);

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
  `cat_id` int(11) NOT NULL,
  `main_photo` int(11) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `goods_pos`
--

INSERT INTO `goods_pos` (`id`, `title`, `price`, `count`, `cat_id`, `main_photo`, `created`, `description`) VALUES
(55, 'Новый товар', '10000.00', 15, 10, 17, '2018-01-31 10:53:34', NULL),
(56, 'Бла бла бла', '1500.00', 15, 47, 18, '2018-01-31 11:11:56', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam purus erat, interdum at imperdiet vel, euismod ut nisi. Pellentesque at laoreet nulla. Interdum et malesuada fames ac ante ipsum primis in faucibus. Maecenas gravida vitae justo ac fermentum. In placerat justo nec metus egestas, in luctus mi hendrerit. Vivamus efficitur ac lectus vel sodales. Nulla congue justo felis, ut accumsan justo semper semper.\n\nIn sed felis fermentum, venenatis metus nec, hendrerit ipsum. Nulla non dapibus purus. Sed gravida ante ut risus pharetra rutrum. Pellentesque maximus tincidunt enim. Nunc commodo auctor dolor, eu vulputate justo tincidunt vel. Nullam quis orci mattis, dictum mauris quis, elementum erat. Nunc egestas nunc ac mauris pharetra placerat. Curabitur nisl diam, posuere ac odio eu, suscipit facilisis dolor. Donec ligula eros, euismod ut cursus eget, interdum in dolor.'),
(57, 'Новый товар', '999999999.99', 1, 48, NULL, '2018-01-31 11:34:17', NULL);

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
(15, 'Магазин', '/shop', '2018-01-26 10:15:35'),
(16, 'Корзина', '/cart', '2018-02-07 05:38:39');

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
(3, 'Меню личного кабинета', '2018-02-07 06:47:41');

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
(6, 'фыв', 'ыфвфывфыв', 0, NULL, 2, '2018-01-29 11:33:44'),
(7, 'Управление компанентами', '/admin-components', 0, NULL, 1, '2018-02-05 17:37:43'),
(8, 'Общее', '/my', 0, NULL, 3, '2018-02-07 06:47:52'),
(9, 'Глобальные переменные', '/admin-globals', 0, NULL, 1, '2018-02-07 11:27:33');

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
  `surname` varchar(60) NOT NULL,
  `firstname` varchar(60) NOT NULL,
  `patronymic` varchar(60) DEFAULT NULL,
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

INSERT INTO `orders` (`id`, `hash`, `client_id`, `surname`, `firstname`, `patronymic`, `email`, `phone`, `price`, `deliveryMethod`, `paymentMethod`, `created`) VALUES
(1, 'b7f646fc3b9070d7aa74cd3df6bb774f', 9, 'Зуев', 'Никита', 'Дмитриевич', 'bubl174rus@gmail.com', '+7(912)-793-78-10', '4500.00', 1, 1, '2018-02-07 09:55:10'),
(2, '109aa1de3e468c45a33afa7b349805b8', 9, 'Зуев', 'Никита', 'Дмитриевич', 'bubl174rus@gmail.com', '+7(912)-793-78-10', '10000.00', 1, 1, '2018-02-07 11:02:14'),
(3, '4548579cc811f270c87bb003d0c21405', 8, 'Зуев', 'Никита', NULL, NULL, '+7(912)-793-78-10', '1500.00', 1, 1, '2018-02-07 11:29:00'),
(4, '0aa202e517498eca83e3214f471297d1', 8, 'Зуев', 'Никита', NULL, NULL, '+7(912)-793-78-10', '1500.00', 1, 1, '2018-02-07 12:15:32');

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
(4, 56, 4, 1, '1500.00', '2018-02-07 12:15:32');

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
  `updated` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `routes`
--

INSERT INTO `routes` (`id`, `title`, `url`, `template_id`, `menu_id`, `access`, `dynamic`, `edit_access`, `delete_access`, `seo_keywords`, `seo_description`, `created`, `updated`) VALUES
(32, 'Главная страница', '/', 1, NULL, 1, 0, 1, 1, '', '', '2018-01-17 10:11:31', '2018-01-26 05:24:17'),
(40, 'Администрирование', '/admin', 2, 1, 3, 0, 1, 1, '', '', '2018-01-20 20:43:27', '2018-02-02 10:14:51'),
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
(66, 'Оформление заказа', '/order', 2, NULL, 1, 0, 1, 1, '', '', '2018-02-01 11:14:39', '2018-02-01 11:14:39'),
(67, 'Управление компанентами', '/admin-components', 2, 1, 3, 0, 1, 1, '', '', '2018-02-05 17:38:19', '2018-02-05 17:42:02'),
(68, 'Личный кабинет', '/my', 2, 3, 2, 0, 1, 1, '', '', '2018-02-07 06:35:22', '2018-02-07 06:47:41'),
(69, 'Успешный заказ', '/order-complete', 2, NULL, 1, 1, 1, 1, '', '', '2018-02-07 08:04:40', '2018-02-07 08:04:40'),
(70, 'Глобальные переменные', '/admin-globals', 2, 1, 3, 0, 1, 1, '', '', '2018-02-07 11:31:36', '2018-02-07 11:32:01');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `fragments`
--
ALTER TABLE `fragments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `menu_groups`
--
ALTER TABLE `menu_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `orders_goods`
--
ALTER TABLE `orders_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=445;

--
-- AUTO_INCREMENT для таблицы `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `visits`
--
ALTER TABLE `visits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

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
