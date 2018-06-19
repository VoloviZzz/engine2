CREATE TABLE `engine_mp`.`post_categories` ( 
	`id` INT NOT NULL AUTO_INCREMENT , 
	`title` VARCHAR(100) NOT NULL , 
	`count` INT NOT NULL DEFAULT '0' ,
	`created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	PRIMARY KEY (`id`)
) ENGINE = InnoDB;

UPDATE posts p
	LEFT JOIN post_targets pt ON p.target = pt.title
SET p.target = pt.id


ALTER TABLE `posts` CHANGE `cat` `cat` INT(11) UNSIGNED NULL DEFAULT NULL;

ALTER TABLE `routes` ADD `active_menu_item` INT NULL DEFAULT NULL COMMENT 'подсветка активного пункта меню' AFTER `menu_id`;

ALTER TABLE `fragments` ADD `published` BOOLEAN NOT NULL DEFAULT FALSE COMMENT 'Флаг публикации фрагмента' AFTER `settings`;
UPDATE `fragments` SET `published` = '1'

