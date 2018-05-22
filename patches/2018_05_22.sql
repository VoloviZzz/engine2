ALTER TABLE `goods_pos` ADD `float_price` BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Плавающая цена?' AFTER `price`, ADD `contract_price` BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Договорная цена?' AFTER `float_price`;

INSERT INTO `components` (`id`, `title`, `ctrl`, `block_id`, `static`, `once`, `styles`, `scripts`, `default_config`) VALUES
(NULL, 'Форма сообщения об ошибке', 'report-error-form', 2, 0, 0, NULL, NULL, NULL);