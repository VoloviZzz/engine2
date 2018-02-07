-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 07 2018 г., 11:59
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
(19, 'Успешный заказ', 'order-complete', 2, 0, 0, NULL, NULL, NULL, '2018-02-07 08:39:42');

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
(111, 8, 69, 1, 1, '2018-02-07 08:39:56');

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
(8, 'Общее', '/my', 0, NULL, 3, '2018-02-07 06:47:52');

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
(1, 'b7f646fc3b9070d7aa74cd3df6bb774f', 9, 'Зуев', 'Никита', 'Дмитриевич', 'bubl174rus@gmail.com', '+7(912)-793-78-10', '4500.00', 1, 1, '2018-02-07 09:55:10');

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
(1, 56, 1, 3, '4500.00', '2018-02-07 09:55:10');

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
(69, 'Успешный заказ', '/order-complete', 2, NULL, 1, 1, 1, 1, '', '', '2018-02-07 08:04:40', '2018-02-07 08:04:40');

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
(269, 46, 46, '/shop', '2018-02-07 10:59:11', NULL, NULL, NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT для таблицы `fragments`
--
ALTER TABLE `fragments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `orders_goods`
--
ALTER TABLE `orders_goods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=270;

--
-- AUTO_INCREMENT для таблицы `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `visits`
--
ALTER TABLE `visits`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

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
