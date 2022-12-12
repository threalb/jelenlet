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

-- ----------------------------
-- ünnepnap tábla 
-- ----------------------------
DROP TABLE IF EXISTS `feastdays`;
CREATE TABLE `exam_project`.`feastdays`  (
  `FeastD_ID` int(11) NOT NULL AUTO_INCREMENT,
  `FeastD_Month` int(11) NULL DEFAULT NULL,
  `FeastD_Day` int(11) NULL DEFAULT NULL,
  `FeastD_Year` int(11) NULL DEFAULT NULL,
  `FeastD_IsEveryYear` tinyint(1) NOT NULL DEFAULT 0,
  `FeastD_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `FeastD_IsActive` tinyint(1) NOT NULL DEFAULT 1,
  `deleted` TINYINT(1) NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  `created_by` INT NULL,
  `updated_by` INT NULL,
  `deleted_by` INT NULL,
  PRIMARY KEY (`FeastD_ID`));

-- ----------------------------
-- ünnepnap sorok beszúrása
-- ----------------------------
INSERT INTO `feastdays` VALUES (1, 12, 25, NULL, 1, 'Karácsony', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (2, 1, 1, NULL, 1, 'Újév', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (3, 3, 15, NULL, 1, 'Nemzeti ünnep', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (4, 4, 24, 2011, 0, 'Húsvét', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (5, 4, 25, 2011, 0, 'Húsvét', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (6, 5, 1, NULL, 1, 'Munka ünnepe', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (7, 6, 12, 2011, 0, 'Pünkösd', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (8, 6, 13, 2011, 0, 'Pünkösd', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (9, 8, 20, NULL, 1, 'I. István szentté avatása', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (10, 10, 23, NULL, 1, '1956-os forradalom évfordulója', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (11, 11, 1, NULL, 1, 'Mindenszentek napja', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (12, 12, 26, NULL, 1, 'Karácsony', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (13, 4, 17, 2017, 0, 'Húsvét', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (14, 6, 5, 2017, 0, 'Pünkösd', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (15, 12, 24, NULL, 1, 'Szenteste', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (16, 4, 14, 2017, 0, 'Húsvét', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (17, 3, 30, 2018, 0, 'Nagypéntek', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (18, 4, 2, 2018, 0, 'Húsvét', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (19, 5, 21, 2018, 0, 'Pünkösd', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (20, 12, 31, 2018, 0, 'Szilveszter', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (21, 4, 19, 2019, 0, 'Nagypéntek', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (22, 4, 22, 2019, 0, 'Húsvét', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (23, 6, 10, 2019, 0, 'Pünkösd', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (24, 4, 10, 2020, 0, 'Nagypéntek', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (25, 4, 13, 2020, 0, 'Húsvét', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (26, 6, 1, 2020, 0, 'Pünkösd', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (27, 4, 2, 2021, 0, 'Nagypéntek', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (28, 4, 5, 2021, 0, 'Húsvét', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (29, 5, 24, 2021, 0, 'Pünkösd', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (30, 4, 15, 2022, 0, 'Nagypéntek', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (31, 4, 18, 2022, 0, 'Húsvét', 1, NULL, NULL);
INSERT INTO `feastdays` VALUES (32, 6, 6, 2022, 0, 'Pünkösd', 1, NULL, NULL);

-- ----------------------------
-- jelenlét típusok
-- ----------------------------
DROP TABLE IF EXISTS `presencetype`;
CREATE TABLE `exam_project`.`presencetype`  (
  `PT_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PT_Name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `PT_DisplayCode` varchar(3) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
   `PT_IsCommon` tinyint(1) NOT NULL DEFAULT 0,
  `status` TINYINT(1) NULL DEFAULT 1, 
   `deleted` TINYINT(1) NULL DEFAULT 0,
  `created_at` TIMESTAMP NULL,
  `updated_at` TIMESTAMP NULL,
  `deleted_at` TIMESTAMP NULL,
  `created_by` INT NULL,
  `updated_by` INT NULL,
  `deleted_by` INT NULL,
 
  PRIMARY KEY (`PT_ID`));

-- ----------------------------
-- jelenlét típusok beszúrása
-- ----------------------------
INSERT INTO `presencetype` VALUES (1, 'Ledolgozott napok', 'M',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL );
INSERT INTO `presencetype` VALUES (2, 'Fizetett szabadság', 'S',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL );
INSERT INTO `presencetype` VALUES (3, 'Fizetett ünnep', 'F',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL );
INSERT INTO `presencetype` VALUES (4, 'Betegszabadság', 'B',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (5, 'Táppénz', 'TP',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (6, 'Baleseti táppénz', 'BT',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (7, 'Fizetés nélküli szabadság', 'SN',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (8, 'Igazolatlan távollét', 'IT',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (9, 'Gyermekgondozási díj', 'GD',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (10, 'Gyermekgondozási segély', 'GS',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (11, 'Ápolási díj', 'ÁD',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (12, 'Csecsemőgondozási díj', 'TS',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (13, 'Gyermeknevelési támogatás', 'GT',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (14, 'Szabadságvesztés', 'SV',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (15, 'Gyermekek utáni szabadság', 'G',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (16, 'Egyéb (rendkívüli) szabadság', 'E',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (17, 'Tanulmányi szabadság', 'T',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (18, 'Katonai szlgálatot teljesíto önkéntes', 'KS',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (19, 'Elozetes letartóztatás', 'EL',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (20, 'Igazolt fizetett távollét', 'I',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (21, 'Fizetés nélküli szabadság, gyermekápolás', 'SNG',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (22, 'Pénzbeli ellátás nélküli keresoképtelenség', 'PEK',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (23, 'Átirányítás', 'Á',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (24, 'Kiküldetés', 'K',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (25, 'Kirendelés', 'KI',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (26, 'Munkáltató által elrendelt szabadság', 'SM',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL); 
INSERT INTO `presencetype` VALUES (27, 'Ügyelet', 'U',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (28, 'óra', '1',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (29, 'Ügyvédként tevékenységét, szabadalmi ügyvivőként, közjegyzőként kamarai tagságát, egyéni vállalkozói tevékenységét szünetelteti', 'ÜSZ',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (30, 'Állat-egészségügyi szolgáltató tevékenységet végző állatorvos tevékenysége szünetel', 'ÁSZ',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (31, 'Szülési szabadság', 'Sz',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (32, 'Apasági ', 'Ap',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (33, 'Apát megilleto szabadság', 'AP',1,1,0,NULL,NULL,NULL,NULL,NULL,NULL);
INSERT INTO `presencetype` VALUES (34, 'Felmentési ido', 'FI',0,1,0,NULL,NULL,NULL,NULL,NULL,NULL);

 -- ----------------------------------
-- employee_category tábla létrehozás
-- -----------------------------------
CREATE TABLE `exam_project`.`employee_category` (
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
 -- ----------------------------
-- employee_category-ba néhány beszúrás
-- ----------------------------

INSERT INTO `exam_project`.`employee_category` (`name`) VALUES ('programozó');
INSERT INTO `exam_project`.`employee_category` (`name`) VALUES ('grafikus');
INSERT INTO `exam_project`.`employee_category` (`name`) VALUES ('ügyvezető');
 -- ----------------------------
-- employee tábla létrehozása 
-- -----------------------------
CREATE TABLE `exam_project`.`employee` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `category_id` INT NULL,
  `description` VARCHAR(45) NULL,
  `picture_link` VARCHAR(45) NULL,
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
  INDEX `categoryFK_idx` (`category_id` ASC),
  CONSTRAINT `categoryFK`
    FOREIGN KEY (`category_id`)
    REFERENCES `exam_project`.`employee_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
	
-- ---------------------------------
-- employee táblába néhány beszúrás
-- --------------------------------
INSERT INTO `exam_project`.`employee` (`first_name`, `last_name`, `email`, `category_id`, `description`) VALUES ('John', 'Doe', 'johndoe@teszt.hu', '1', 'teszt leiras');
INSERT INTO `exam_project`.`employee` (`first_name`, `last_name`, `email`, `category_id`) VALUES ('Jane', 'Doe', 'janedoe@teszt.hu', '2');
INSERT INTO `exam_project`.`employee` (`first_name`, `last_name`, `email`, `category_id`) VALUES ('Teszt', 'Elek', 'tesztelek@teszt.hu', '1');
INSERT INTO `exam_project`.`employee` (`first_name`, `last_name`, `email`, `category_id`) VALUES ('John', 'Smith', 'johnsmith@teszt.hu', '3');
