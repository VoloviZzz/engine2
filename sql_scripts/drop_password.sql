-- set phone to 9876543210 and pass to 123 

UPDATE `clients` SET `phone` = '+7(987)-654-32-10' WHERE `id` = 8;

UPDATE `clients` set password = MD5('123') WHERE id = 8 LIMIT 1;