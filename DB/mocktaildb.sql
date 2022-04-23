-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mocktaildb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mocktaildb` ;

-- -----------------------------------------------------
-- Schema mocktaildb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mocktaildb` DEFAULT CHARACTER SET utf8 ;
USE `mocktaildb` ;

-- -----------------------------------------------------
-- Table `user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user` ;

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `active` TINYINT NOT NULL DEFAULT 0,
  `bio` TEXT NULL,
  `photo_url` VARCHAR(2000) NULL,
  `created_date` DATETIME NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL,
  `street` VARCHAR(100) NOT NULL,
  `city` VARCHAR(50) NOT NULL,
  `state_abbr` CHAR(2) NOT NULL,
  `postal_code` VARCHAR(11) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `drink`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `drink` ;

CREATE TABLE IF NOT EXISTS `drink` (
  `id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `name` TEXT NOT NULL,
  `description` TEXT NULL,
  `image_url` VARCHAR(2000) NULL,
  `active` TINYINT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_drink_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_drink_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meetup`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meetup` ;

CREATE TABLE IF NOT EXISTS `meetup` (
  `id` INT NOT NULL,
  `address_id` INT NOT NULL,
  `title` VARCHAR(100) NOT NULL,
  `meetup_date` DATE NOT NULL,
  `description` TEXT NULL,
  `date_created` DATETIME NULL,
  `start_time` TIME NULL,
  `end_time` TIME NULL,
  `max_attendees` INT NULL,
  `active` TINYINT NOT NULL DEFAULT 0,
  `image_url` VARCHAR(2000) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Meetup_address1_idx` (`address_id` ASC),
  CONSTRAINT `fk_Meetup_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe` ;

CREATE TABLE IF NOT EXISTS `recipe` (
  `id` INT NOT NULL,
  `drink_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `name` VARCHAR(200) NOT NULL,
  `serving_size` INT NULL,
  `description` TEXT NULL,
  `active` TINYINT NOT NULL DEFAULT 0,
  `instructions` TEXT NULL,
  `image_url` VARCHAR(2000) NULL,
  `created_date` DATETIME NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipe_drink1_idx` (`drink_id` ASC),
  INDEX `fk_recipe_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_recipe_drink1`
    FOREIGN KEY (`drink_id`)
    REFERENCES `drink` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL,
  `name` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ingredient` ;

CREATE TABLE IF NOT EXISTS `ingredient` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `image_url` VARCHAR(2000) NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_ingredient` ;

CREATE TABLE IF NOT EXISTS `recipe_ingredient` (
  `recipe_id` INT NOT NULL,
  `ingredient_id` INT NOT NULL,
  `quantity` DOUBLE NOT NULL,
  `unit` VARCHAR(45) NOT NULL,
  `instruction` TEXT NULL,
  PRIMARY KEY (`recipe_id`, `ingredient_id`),
  INDEX `fk_recipe_ingredient_ingredient1_idx` (`ingredient_id` ASC),
  CONSTRAINT `fk_recipe_ingredients_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_ingredient_ingredient1`
    FOREIGN KEY (`ingredient_id`)
    REFERENCES `ingredient` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `meetup_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `meetup_comment` ;

CREATE TABLE IF NOT EXISTS `meetup_comment` (
  `id` INT NOT NULL,
  `meetup_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `text_content` TEXT NOT NULL,
  `post_date` DATETIME NULL,
  `in_reply_to_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_meetup_comment_meetup1_idx` (`meetup_id` ASC),
  INDEX `fk_meetup_comment_user1_idx` (`user_id` ASC),
  INDEX `fk_meetup_comment_meetup_comment1_idx` (`in_reply_to_id` ASC),
  CONSTRAINT `fk_meetup_comment_meetup1`
    FOREIGN KEY (`meetup_id`)
    REFERENCES `meetup` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meetup_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meetup_comment_meetup_comment1`
    FOREIGN KEY (`in_reply_to_id`)
    REFERENCES `meetup_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `favorite_recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `favorite_recipe` ;

CREATE TABLE IF NOT EXISTS `favorite_recipe` (
  `user_id` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `recipe_id`),
  INDEX `fk_User_has_recipe_recipe1_idx` (`recipe_id` ASC),
  INDEX `fk_User_has_recipe_User1_idx` (`user_id` ASC),
  CONSTRAINT `fk_User_has_recipe_User1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_User_has_recipe_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `drink_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `drink_category` ;

CREATE TABLE IF NOT EXISTS `drink_category` (
  `drink_id` INT NOT NULL,
  `category_id` INT NOT NULL,
  PRIMARY KEY (`drink_id`, `category_id`),
  INDEX `fk_drink_has_category_category1_idx` (`category_id` ASC),
  INDEX `fk_drink_has_category_drink1_idx` (`drink_id` ASC),
  CONSTRAINT `fk_drink_has_category_drink1`
    FOREIGN KEY (`drink_id`)
    REFERENCES `drink` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_drink_has_category_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe_comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe_comment` ;

CREATE TABLE IF NOT EXISTS `recipe_comment` (
  `id` INT NOT NULL,
  `recipe_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `text_content` TEXT NOT NULL,
  `post_date` DATETIME NULL,
  `in_reply_to_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_recipe_comment_recipe_comment1_idx` (`in_reply_to_id` ASC),
  INDEX `fk_recipe_comment_recipe1_idx` (`recipe_id` ASC),
  INDEX `fk_recipe_comment_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_recipe_comment_recipe_comment1`
    FOREIGN KEY (`in_reply_to_id`)
    REFERENCES `recipe_comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_comment_recipe1`
    FOREIGN KEY (`recipe_id`)
    REFERENCES `recipe` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_recipe_comment_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `user_meeting`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `user_meeting` ;

CREATE TABLE IF NOT EXISTS `user_meeting` (
  `user_id` INT NOT NULL,
  `meetup_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `meetup_id`),
  INDEX `fk_user_has_meetup_meetup1_idx` (`meetup_id` ASC),
  INDEX `fk_user_has_meetup_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_has_meetup_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_meetup_meetup1`
    FOREIGN KEY (`meetup_id`)
    REFERENCES `meetup` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS mocktailuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'mocktailuser'@'localhost' IDENTIFIED BY 'mocktail';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'mocktailuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `user`
-- -----------------------------------------------------
START TRANSACTION;
USE `mocktaildb`;
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (1, 'Andre5000', 'rock_paper_spock', 'Big', 'outcast@heyya.com', 'Boie', 1, ' ', ' ', '1988-04-23 07:16:20', 'data_admin');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (3, 'NeAlte', 'BY4Z8Gmf', 'Nelle', 'jude.nikolaus@baumbach.com', 'Altenwerth', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (4, 'MaPark01', 'v8dTLmB4', 'Madge', 'maynard50@homenick.com', 'Parker', 0, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (5, 'JaHaag', 'xaHJy9BU', 'Jamar', 'jermain.considine@crooks.org', 'Haag', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (6, 'DaJerd', 'hWunj8Us', 'Damaris', 'floy42@yahoo.com', 'Jerde', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (7, 'JaZbon', 'Cg4YvheM', 'Janae', 'shyann77@gmail.com', 'Zboncak', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (8, 'MaPark', 'dNUfwy7j', 'Marlin', 'collins.lew@yahoo.com', 'Parker', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (9, 'MaLark', 'jbPdx4v2', 'Maude', 'lauriane35@yahoo.com', 'Larkin', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (10, 'BoVolk', 'BLew89cH', 'Bobby', 'romaguera.clare@gorczany.com', 'Volkman', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (11, 'JuHick', 'QCqTn8Dr', 'Judah', 'ylehner@yahoo.com', 'Hickle', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (12, 'LaBots', 'bUr7nYvj', 'Laurel', 'mayra72@labadie.info', 'Botsford', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (13, 'MaLubo', 'TBq5KmDW', 'Marcelino', 'tyrel76@dicki.com', 'Lubowitz', 0, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (14, 'JaWitt', 'E8nJw29x', 'Jayden', 'marvin70@gmail.com', 'Witting', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (15, 'KeBloc', 'exXJ35Z6', 'Keeley', 'marcel.rice@harris.com', 'Block', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (16, 'DaMcDe', 'W4pagXCD', 'Daisha', 'lacey.miller@gmail.com', 'McDermott', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (17, 'LuFram', 'ETr7RdZv', 'Luisa', 'heidenreich.jonathon@bailey.com', 'Frami', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (18, 'CaDeck', 'yM7qsUK9', 'Catherine', 'uvandervort@macejkovic.org', 'Deckow', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (19, 'ClTreu', '7YPWLDad', 'Cloyd', 'eugenia.reynolds@yahoo.com', 'Treutel', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (20, 'WaCrem', 'jxnhAv2Q', 'Wava', 'gferry@vandervort.com', 'Cremin', 0, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (21, 'MaMosc', 'ceXyzw6s', 'Maximillia', 'reva47@dubuque.com', 'Mosciski', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (22, 'YoRunt', '97CUfc5z', 'Yolanda', 'mckayla65@welch.org', 'Runte', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (23, 'NoKono', '9prgRXKH', 'Norene', 'lavinia.kuvalis@satterfield.biz', 'Konopelski', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (24, 'KeMaye', 'ZA2ks5QT', 'Kevon', 'wjacobson@streich.com', 'Mayert', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (25, 'RaKshl', 'WnBfP4g3', 'Ramon', 'lavern02@koss.com', 'Kshlerin', 0, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (26, 'GaWill', 'rCLEza8M', 'Garland', 'katelynn76@vandervort.com', 'Willms', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (27, 'AdJask', '2nwyeUqm', 'Adrienne', 'brielle61@heaney.info', 'Jaskolski', 0, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (28, 'ZeRuec', 'DL3nh8rP', 'Zena', 'hollie16@gmail.com', 'Ruecker', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (29, 'ChRatk', 'zvJY7TDa', 'Chase', 'elody84@gmail.com', 'Ratke', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (30, 'LlVolk', 'qUWRQTj2', 'Lloyd', 'nratke@yahoo.com', 'Volkman', 1, '', '', '1988-04-23 07:16:20', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (31, 'CrErns', 'KjR2qrW7', 'Cristal', 'crona.wilma@jacobi.com', 'Ernser', 1, '', '', '1988-04-23 07:16:20', 'user');

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `mocktaildb`;
INSERT INTO `address` (`id`, `street`, `city`, `state_abbr`, `postal_code`) VALUES (1, 'Shirley Street', 'CO springs', 'CO', '11111');

COMMIT;


-- -----------------------------------------------------
-- Data for table `drink`
-- -----------------------------------------------------
START TRANSACTION;
USE `mocktaildb`;
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (1, 1, 'Shirley Temple', 'Sample data', ' ', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `meetup`
-- -----------------------------------------------------
START TRANSACTION;
USE `mocktaildb`;
INSERT INTO `meetup` (`id`, `address_id`, `title`, `meetup_date`, `description`, `date_created`, `start_time`, `end_time`, `max_attendees`, `active`, `image_url`) VALUES (1, 1, 'This is a new meetup', '2022-01-01', 'Descrip', NULL, NULL, NULL, 10, 1, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `mocktaildb`;
INSERT INTO `recipe` (`id`, `drink_id`, `user_id`, `name`, `serving_size`, `description`, `active`, `instructions`, `image_url`, `created_date`) VALUES (1, 1, 1, 'Shirley Temple sample recipe', 12, NULL, 0, NULL, NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
USE `mocktaildb`;
INSERT INTO `category` (`id`, `name`) VALUES (1, 'Frozen');

COMMIT;


-- -----------------------------------------------------
-- Data for table `ingredient`
-- -----------------------------------------------------
START TRANSACTION;
USE `mocktaildb`;
INSERT INTO `ingredient` (`id`, `name`, `image_url`, `description`) VALUES (1, 'lemon juice', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_ingredient`
-- -----------------------------------------------------
START TRANSACTION;
USE `mocktaildb`;
INSERT INTO `recipe_ingredient` (`recipe_id`, `ingredient_id`, `quantity`, `unit`, `instruction`) VALUES (1, 1, 10, 'ounces', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `meetup_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `mocktaildb`;
INSERT INTO `meetup_comment` (`id`, `meetup_id`, `user_id`, `text_content`, `post_date`, `in_reply_to_id`) VALUES (1, 1, 1, 'This is a planned meeting', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `favorite_recipe`
-- -----------------------------------------------------
START TRANSACTION;
USE `mocktaildb`;
INSERT INTO `favorite_recipe` (`user_id`, `recipe_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `drink_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `mocktaildb`;
INSERT INTO `drink_category` (`drink_id`, `category_id`) VALUES (1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `recipe_comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `mocktaildb`;
INSERT INTO `recipe_comment` (`id`, `recipe_id`, `user_id`, `text_content`, `post_date`, `in_reply_to_id`) VALUES (1, 1, 1, 'Comment on Shirley Temple', NULL, NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `user_meeting`
-- -----------------------------------------------------
START TRANSACTION;
USE `mocktaildb`;
INSERT INTO `user_meeting` (`user_id`, `meetup_id`) VALUES (1, 1);

COMMIT;

