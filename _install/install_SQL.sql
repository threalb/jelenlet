-- DB létrehozása
CREATE SCHEMA `exam_project` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci ;

-- kiválasztja az adatbázist
use `exam_project`;

-- user_role tábla létrehozás
CREATE TABLE `exam_project`.`user_role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `status` TINYINT(1) NULL DEFAULT 1,
  `deleted` TINYINT(1) NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  `created_by` INT NULL,
  `updated_by` INT NULL,
  `deleted_by` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC));

-- user_role-ba néhány beszúrás
INSERT INTO `exam_project`.`user_role` (`name`) VALUES ('superadmin');
INSERT INTO `exam_project`.`user_role` (`name`) VALUES ('admin');
INSERT INTO `exam_project`.`user_role` (`name`) VALUES ('ügyintéző');

-- user tábla létrehozása
CREATE TABLE `exam_project`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(255) NULL,
  `role_id` INT NULL,
  `status` TINYINT(1) NULL DEFAULT 1,
  `deleted` TINYINT(1) NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  `created_by` INT NULL,
  `updated_by` INT NULL,
  `deleted_by` INT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `role_FK_idx` (`role_id` ASC),
  CONSTRAINT `role_FK`
    FOREIGN KEY (`role_id`)
    REFERENCES `cms`.`user_role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
-- user táblába néhány beszúrás
-- Super Admin jelszó 123
INSERT INTO `exam_project`.`user` (`first_name`, `last_name`, `email`, `password`, `role_id`) VALUES ('Super', 'Admin', 'superadmin@admin.hu', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '1');
-- Simple Admin jelszó 456
INSERT INTO `exam_project`.`user` (`first_name`, `last_name`, `email`, `password`, `role_id`) VALUES ('Simple', 'admin', 'admin@admin.hu', '51eac6b471a284d3341d8c0c63d0f1a286262a18', '2');
-- Simple User jelszó 789
INSERT INTO `exam_project`.`user` (`first_name`, `last_name`, `email`, `password`, `role_id`) VALUES ('Simple', 'User', 'user@admin.hu', 'fc1200c7a7aa52109d762a9f005b149abef01479', '3');