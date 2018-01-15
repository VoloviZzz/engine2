-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Янв 15 2018 г., 12:56
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
  `confirmed` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Регистрация завершена или нет',
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
(1, 1, 0, 1, 'Зуев', 'Никита', 'Дмитриевич', NULL, '+79127937810', '202cb962ac59075b964b07152d234b70', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2018-01-15 09:35:10');

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
(2, 'Пустой блок', 'clear-block', NULL, 1, 0, 1, NULL, NULL, NULL, '2018-01-10 09:22:25'),
(3, 'Главный слайдер', 'main-slider', 'main-slider', 0, 1, 1, NULL, NULL, '{\"slides\": []}', '2018-01-10 12:17:53'),
(4, 'Страница авторизации', 'login-page', 'login-page', 0, 1, 2, NULL, NULL, NULL, '2018-01-15 07:19:51');

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
(23, 2, 17, 1, '2018-01-11 11:35:09'),
(25, 3, 1, 1, '2018-01-11 12:37:50'),
(26, 3, 19, 1, '2018-01-12 10:35:44'),
(27, 3, 22, 1, '2018-01-12 10:39:06'),
(28, 2, 23, 1, '2018-01-12 11:23:34'),
(29, 4, 28, 1, '2018-01-15 07:22:04'),
(30, 2, 25, 1, '2018-01-15 08:10:12'),
(31, 2, 25, 1, '2018-01-15 08:10:14'),
(32, 1, 17, 1, '2018-01-15 10:26:54'),
(33, 2, 26, 1, '2018-01-15 11:32:16');

-- --------------------------------------------------------

--
-- Структура таблицы `fragments_data`
--

CREATE TABLE `fragments_data` (
  `id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL COMMENT 'Для повторного использования данных внутри компонента',
  `fragment_id` int(11) NOT NULL COMMENT 'Для привязки данных к определенному фрагменту',
  `data` text NOT NULL COMMENT 'Сами данные',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `fragments_data`
--

INSERT INTO `fragments_data` (`id`, `component_id`, `fragment_id`, `data`, `created`) VALUES
(1, 3, 26, '{\"slides\": [{\"href\":\"/news\",\"img\":\"http://it-kmm.com/images/News.jpg\",\"img_bottom\":\"http://it-kmm.com/images/News.jpg\",\"title\":\"Новости\",\"title_bottom\":\"Новости\",\"description\":\"\\n            <p class=\\\"top-slide-info\\\">Раздел с новостями</p>\\n        \"},{\"href\":\"/shops\",\"img\":\"/img/main_slides/4.jpg\",\"img_bottom\":\"/img/main_slides/4.jpg\",\"title\":\"Магазины компании\",\"title_bottom\":\"Магазины компании\",\"description\":\"\\n            <p class=\\\"top-slide-info\\\">В магазинах компании ООО \\\"Евросервис\\\" всегда в наличии полный ассортимент ритуальной продукции. Магазины имеют удобное расположение и находятся в каждом районе города. Здесь вы можете найти подробную информацию о месте нахождения и контактных телефонов каждого из них.</p>\\n        \"},{\"href\":\"/procurement\",\"img\":\"http://www.video-step.ru/img/location/be5ac1c1b5951dbe49d8fd4f668b8bfa1c61c8fb29ca898144bc19c01fe74cccc33ab3fe6f81ec04812cc4fef9072c2c66c2e801be17f126da0cb65d49da8cae/8ad361c5a6781e44d2f4e0e90fc568c351455f85.png\",\"img_bottom\":\"http://www.video-step.ru/img/location/be5ac1c1b5951dbe49d8fd4f668b8bfa1c61c8fb29ca898144bc19c01fe74cccc33ab3fe6f81ec04812cc4fef9072c2c66c2e801be17f126da0cb65d49da8cae/8ad361c5a6781e44d2f4e0e90fc568c351455f85.png\",\"title\":\"Поставщикам\",\"title_bottom\":\"Поставщикам\",\"description\":\"\\n            <p class=\\\"top-slide-info\\\">Приоритетом компании является покупка товаров и услуг по наиболее выгодной цене у наиболее надёжных и квалифицированных поставщиков. На этой странице размещается вся информация о закупках ООО \\\"Евросервис\\\", а также вся информация для новых и существующих партнеров компании.</p>\\n        \"},{\"href\":\"/contacts\",\"img\":\"http://yarmarka62rus.ru/wp-content/uploads/2016/04/%D0%9A%D0%BE%D0%BD%D1%82%D0%B0%D0%BA%D1%82%D1%8B-%D0%BA%D0%BE%D0%BC%D0%BF%D0%B0%D0%BD%D0%B8%D0%B8-%D0%94%D0%BE%D0%BC-%D0%A1%D1%82%D1%80%D0%BE%D0%B8%D1%82%D0%B5%D0%BB%D0%B5%D0%B9.jpg\",\"img_bottom\":\"http://yarmarka62rus.ru/wp-content/uploads/2016/04/%D0%9A%D0%BE%D0%BD%D1%82%D0%B0%D0%BA%D1%82%D1%8B-%D0%BA%D0%BE%D0%BC%D0%BF%D0%B0%D0%BD%D0%B8%D0%B8-%D0%94%D0%BE%D0%BC-%D0%A1%D1%82%D1%80%D0%BE%D0%B8%D1%82%D0%B5%D0%BB%D0%B5%D0%B9.jpg\",\"title\":\"Контакты\",\"title_bottom\":\"Контакты\",\"description\":\"\\n            <p class=\\\"top-slide-info\\\">На этой странице Вы можете найти контактные телефоны, а также адреса и реквизиты центрального офиса компании ООО \\\"Евросервис\\\".</p>\\n        \"}]}', '2018-01-12 10:49:08'),
(2, 3, 25, '{\"slides\": [{\"img\":\"/img/main_slides/17.jpg\",\"img_bottom\":\"/img/main_bottom_slides/0.jpg\",\"title\":\"Если в дом пришла беда - мы поможем Вам всегда\",\"title_bottom\":\"Главная\",\"description\":\"Официальный сайт ООО \\\"Евросервис\\\"\",\"mainSlide\":true},{\"href\":\"/shops\",\"img\":\"/img/main_slides/8.jpg\",\"img_bottom\":\"/img/main_bottom_slides/8.jpg\",\"title\":\"Магазины компании\",\"title_bottom\":\"Магазины\",\"description\":\"<p class=\\\"top-slide-info\\\">В магазинах компании ООО \\\"Евросервис\\\" всегда в наличии полный ассортимент ритуальной продукции. Магазины имеют удобное расположение и находятся в каждом районе города. Здесь вы можете найти подробную информацию о месте нахождения и контактных телефонов каждого из них.</p>\\n        \"}]}', '2018-01-12 11:19:30'),
(3, 2, 27, '{\"content\": \"text\"}', '2018-01-12 11:38:17');

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
  `dynamic` tinyint(1) UNSIGNED NOT NULL DEFAULT '0',
  `public` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Публичный маршрут?',
  `admin` int(11) NOT NULL DEFAULT '0' COMMENT 'Только для администратора',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `routes`
--

INSERT INTO `routes` (`id`, `name`, `title`, `url`, `ctrl`, `template_id`, `dynamic`, `public`, `admin`, `created`) VALUES
(1, 'home', 'Домашняя страница', '/', NULL, 1, 0, 1, 0, '2018-01-10 12:03:58'),
(17, 'admin', 'Администрирование страниц', '/admin', NULL, 2, 0, 0, 1, '2018-01-10 12:02:03'),
(19, 'company', 'О компании', '/company', NULL, 1, 0, 1, 0, '2018-01-12 10:28:43'),
(22, 'shop', 'Магазин', '/shop', NULL, 1, 0, 1, 0, '2018-01-12 10:39:02'),
(23, 'news', 'Новости', '/news', NULL, 1, 0, 1, 0, '2018-01-12 11:23:30'),
(24, 'new', 'Страница новости', '/new', NULL, 1, 1, 1, 0, '2018-01-12 11:24:24'),
(25, 'shops', 'Магазины', '/shops', NULL, 1, 0, 1, 0, '2018-01-12 11:32:52'),
(26, 'procurement', 'Поставщикам', '/procurement', NULL, 1, 0, 1, 0, '2018-01-12 11:33:14'),
(27, 'contacts', 'Контактные данные', '/contacts', NULL, 1, 0, 1, 0, '2018-01-12 11:33:49'),
(28, 'login', 'Авторизация', '/login', NULL, 1, 0, 1, 0, '2018-01-12 11:35:36'),
(29, 'cart', 'Корзина', '/cart', NULL, 1, 0, 1, 0, '2018-01-12 11:37:25'),
(30, 'category', 'Товары по категории', '/cat', NULL, 1, 1, 1, 0, '2018-01-12 12:15:33'),
(31, 'subcat', 'Товары по подкатегории', '/subcat', NULL, 1, 1, 1, 0, '2018-01-12 12:15:23');

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
(1, 4, 'novaya-novost', 'news', 1, '2018-01-09 08:29:31'),
(2, 4, 'novaya-novost-2', 'news', 2, '2018-01-09 09:12:35');

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
  ADD KEY `component_id` (`component_id`),
  ADD KEY `route_id` (`route_id`);

--
-- Индексы таблицы `fragments_data`
--
ALTER TABLE `fragments_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `component_id` (`component_id`),
  ADD KEY `fragments_data_ibfk_2` (`fragment_id`);

--
-- Индексы таблицы `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_id` (`template_id`);

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
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `components`
--
ALTER TABLE `components`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `component_types`
--
ALTER TABLE `component_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `fragments`
--
ALTER TABLE `fragments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT для таблицы `fragments_data`
--
ALTER TABLE `fragments_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `routes`
--
ALTER TABLE `routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT для таблицы `routes_aliases`
--
ALTER TABLE `routes_aliases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `templates`
--
ALTER TABLE `templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  ADD CONSTRAINT `fragments_ibfk_1` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fragments_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `routes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `fragments_data`
--
ALTER TABLE `fragments_data`
  ADD CONSTRAINT `fragments_data_ibfk_1` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fragments_data_ibfk_2` FOREIGN KEY (`fragment_id`) REFERENCES `fragments` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
