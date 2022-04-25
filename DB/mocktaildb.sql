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
  `id` INT NOT NULL AUTO_INCREMENT,
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
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id` INT NOT NULL AUTO_INCREMENT,
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
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `name` TEXT NOT NULL,
  `description` TEXT NOT NULL,
  `image_url` VARCHAR(2000) NULL,
  `active` TINYINT NOT NULL DEFAULT 0,
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
  `id` INT NOT NULL AUTO_INCREMENT,
  `address_id` INT NOT NULL,
  `user_id` INT NOT NULL,
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
  INDEX `fk_meetup_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_Meetup_address1`
    FOREIGN KEY (`address_id`)
    REFERENCES `address` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_meetup_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `recipe`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `recipe` ;

CREATE TABLE IF NOT EXISTS `recipe` (
  `id` INT NOT NULL AUTO_INCREMENT,
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
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` TEXT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ingredient`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ingredient` ;

CREATE TABLE IF NOT EXISTS `ingredient` (
  `id` INT NOT NULL AUTO_INCREMENT,
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
  `id` INT NOT NULL AUTO_INCREMENT,
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
  `id` INT NOT NULL AUTO_INCREMENT,
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
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (1, 'admin', 'admin', 'admin', 'admin@admin.com', 'admin', 1, '', '', '2016-04-03 00:09:00', 'data_admin');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (2, 'NeAlte', 'BY4Z8Gmf', 'Nelle', 'jude.nikolaus@baumbach.com', 'Altenwerth', 1, '', '', '2016-04-03 00:09:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (3, 'MaPark', 'v8dTLmB4', 'Madge', 'maynard50@homenick.com', 'Parker', 0, '', '', '1990-06-09 00:09:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (4, 'JaHaag', 'xaHJy9BU', 'Jamar', 'jermain.considine@crooks.org', 'Haag', 1, '', '', '1978-11-09 00:09:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (5, 'DaJerd', 'hWunj8Us', 'Damaris', 'floy42@yahoo.com', 'Jerde', 0, '', '', '1988-12-27 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (6, 'JaZbon', 'Cg4YvheM', 'Janae', 'shyann77@gmail.com', 'Zboncak', 1, '', '', '1991-09-26 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (7, 'TiPark', 'dNUfwy7j', 'Timmy', 'collins.lew@yahoo.com', 'Parker', 0, '', '', '1991-03-06 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (8, 'MaLark', 'jbPdx4v2', 'Maude', 'lauriane35@yahoo.com', 'Larkin', 1, '', '', '1983-01-08 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (9, 'BoVolk', 'BLew89cH', 'Bobby', 'romaguera.clare@gorczany.com', 'Volkman', 1, '', '', '1984-08-09 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (10, 'JuHick', 'QCqTn8Dr', 'Judah', 'ylehner@yahoo.com', 'Hickle', 0, '', '', '2017-12-14 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (11, 'LaBots', 'bUr7nYvj', 'Laurel', 'mayra72@labadie.info', 'Botsford', 1, '', '', '2001-08-22 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (12, 'MaLubo', 'TBq5KmDW', 'Marcelino', 'tyrel76@dicki.com', 'Lubowitz', 1, '', '', '1980-05-24 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (13, 'JaWitt', 'E8nJw29x', 'Jayden', 'marvin70@gmail.com', 'Witting', 1, '', '', '2021-04-16 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (14, 'KeBloc', 'exXJ35Z6', 'Keeley', 'marcel.rice@harris.com', 'Block', 1, '', '', '1984-03-03 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (15, 'DaMcDe', 'W4pagXCD', 'Daisha', 'lacey.miller@gmail.com', 'McDermott', 1, '', '', '2018-09-06 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (16, 'LuFram', 'ETr7RdZv', 'Luisa', 'heidenreich.jonathon@bailey.com', 'Frami', 1, '', '', '1976-04-07 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (17, 'CaDeck', 'yM7qsUK9', 'Catherine', 'uvandervort@macejkovic.org', 'Deckow', 1, '', '', '1999-09-11 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (18, 'ClTreu', '7YPWLDad', 'Cloyd', 'eugenia.reynolds@yahoo.com', 'Treutel', 1, '', '', '2012-04-24 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (19, 'WaCrem', 'jxnhAv2Q', 'Wava', 'gferry@vandervort.com', 'Cremin', 0, '', '', '1987-02-11 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (20, 'MaMosc', 'ceXyzw6s', 'Maximillia', 'reva47@dubuque.com', 'Mosciski', 1, '', '', '2000-07-19 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (21, 'YoRunt', '97CUfc5z', 'Yolanda', 'mckayla65@welch.org', 'Runte', 1, '', '', '1999-04-02 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (22, 'NoKono', '9prgRXKH', 'Norene', 'lavinia.kuvalis@satterfield.biz', 'Konopelski', 1, '', '', '2020-10-18 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (23, 'KeMaye', 'ZA2ks5QT', 'Kevon', 'wjacobson@streich.com', 'Mayert', 1, '', '', '2019-09-12 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (24, 'RaKshl', 'WnBfP4g3', 'Ramon', 'lavern02@koss.com', 'Kshlerin', 0, '', '', '2019-12-16 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (25, 'GaWill', 'rCLEza8M', 'Garland', 'katelynn76@vandervort.com', 'Willms', 1, '', '', '2019-02-24 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (26, 'AdJask', '2nwyeUqm', 'Adrienne', 'brielle61@heaney.info', 'Jaskolski', 1, '', '', '2015-03-06 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (27, 'ZeRuec', 'DL3nh8rP', 'Zena', 'hollie16@gmail.com', 'Ruecker', 1, '', '', '1984-08-02 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (28, 'ChRatk', 'zvJY7TDa', 'Chase', 'elody84@gmail.com', 'Ratke', 0, '', '', '1997-06-08 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (29, 'LlVolk', 'qUWRQTj2', 'Lloyd', 'nratke@yahoo.com', 'Volkman', 1, '', '', '1980-07-14 09:00:00', 'user');
INSERT INTO `user` (`id`, `username`, `password`, `first_name`, `email`, `last_name`, `active`, `bio`, `photo_url`, `created_date`, `role`) VALUES (30, 'CrErns', 'KjR2qrW7', 'Cristal', 'crona.wilma@jacobi.com', 'Ernser', 1, '', '', '1990-03-22 09:00:00', 'user');

COMMIT;


-- -----------------------------------------------------
-- Data for table `address`
-- -----------------------------------------------------
START TRANSACTION;
USE `mocktaildb`;
INSERT INTO `address` (`id`, `street`, `city`, `state_abbr`, `postal_code`) VALUES (1, 'Shirley Street', 'CO springs', 'CO', '11111');
INSERT INTO `address` (`id`, `street`, `city`, `state_abbr`, `postal_code`) VALUES (2, '2636 Walnut St., Suite 104', 'Denver', 'CO', '80205');
INSERT INTO `address` (`id`, `street`, `city`, `state_abbr`, `postal_code`) VALUES (3, '3601 West 32 Avenue ', 'Denver', 'CO', '80211');
INSERT INTO `address` (`id`, `street`, `city`, `state_abbr`, `postal_code`) VALUES (4, '1615 Platte Street', 'Denver', 'CO', '80202');
INSERT INTO `address` (`id`, `street`, `city`, `state_abbr`, `postal_code`) VALUES (5, '2240 North Clay Street', 'Denver', 'CO', '80211');
INSERT INTO `address` (`id`, `street`, `city`, `state_abbr`, `postal_code`) VALUES (6, '4024 Tennyson Street', 'Denver', 'CO', '80212');
INSERT INTO `address` (`id`, `street`, `city`, `state_abbr`, `postal_code`) VALUES (7, '2021 West 32 Ave', 'Denver', 'CO', '80211');

COMMIT;


-- -----------------------------------------------------
-- Data for table `drink`
-- -----------------------------------------------------
START TRANSACTION;
USE `mocktaildb`;
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (1, 1, 'Shirley Temple', 'The Shirley Temple is a nice way to dress up your average soda.', 'https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fpublic-assets-ucg.meredithcorp.io%2Fe51bc8325a8d881664ef66ecf4137f29%2F4477843.jpg&w=595&h=595&c=sc&poi=face&q=60', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (2, 1, 'Chill-Out Honeydew Cucumber Slushy', 'High in B vitamins, cucumbers both cool and calm you. This recipe is part of the Healthyish slushy trifecta.', 'https://assets.bonappetit.com/photos/5b197fb764405a252ac834f0/1:1/w_2240,c_limit/honeydew-cucumber-and-mint-slushy.jpg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (3, 2, 'Salted Watermelon Juice', 'There is truly nothing more refreshing than a cold glass of salted watermelon juice', 'https://assets.bonappetit.com/photos/5b5f56663e10293cd2ae361c/1:1/w_2240,c_limit/20180515%20WELL2045.jpg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (4, 3, 'Chile-Lime-Pineapple Soda', 'Zesty with Chile flavor and a little heat', 'https://assets.bonappetit.com/photos/5947f70841d81c7bc3015f67/1:1/w_2240,c_limit/cold-infused-chile-lime-pineapple-soda.jpg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (5, 4, 'Strawberry-Ginger Lemonade', 'Summer drink is perfect for an all-day hang.', 'https://assets.bonappetit.com/photos/57ad43a653e63daf11a4dd81/master/w_1280,c_limit/strawberry-ginger-lemonade.jpg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (6, 4, 'Huckleberry Shrub', 'A tart drinking vinegar that can be made with whatever berries you have on hand. Use for spritzers, cocktails, even ice cream floats.', 'https://assets.bonappetit.com/photos/57ace77153e63daf11a4db58/master/w_1280,c_limit/huckleberry-shrub.jpg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (7, 3, 'Frozen Apple-Rita', 'A perfectly tart and citrusy spin on a classic', 'https://img.taste.com.au/fxIfB-0j/w720-h480-cfill-q80/taste/2017/12/frozen-apple-margarita-taste_1980x1320-133752-1.jpg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (8, 4, 'Tropical Punch', 'Hints of passionfruit, mint, and lemongrass', 'https://img.taste.com.au/U_uSqdWD/w720-h480-cfill-q80/taste/2020/09/october20_tropical-punch-mocktail-taste-165147-1.jpg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (9, 5, 'Cranberry Sangria', 'Perfect non-alcoholic party punch', 'https://img.taste.com.au/X9RiCuBV/w720-h480-cfill-q80/taste/2017/09/cranberry-sangria-131046-1.jpg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (10, 2, 'Watermelon Mojitos', 'Featuring watermelon and mint for the perfect refreshing combo', 'https://img.taste.com.au/wlrZhzaR/w720-h480-cfill-q80/taste/2017/10/watermelon-nojitos-131462-1.jpg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (11, 6, 'Pineapple, Apricot, Lime Punch', 'Feeling a little under the weather? This punch is sure to revive you!', 'https://img.taste.com.au/UQsWiSA4/w720-h480-cfill-q80/taste/2016/11/pineapple-apricot-and-lime-punch-31677-1.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (12, 3, 'Fizzy Grapefruit', 'This bubbly pink grapefruit fizz is great as a mocktail or as an alternative to traditional soft drinks.', 'https://img.taste.com.au/4q_hQKgj/w720-h480-cfill-q80/taste/2016/11/pink-grapefruit-fizz-76870-1.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (13, 7, 'Orange Mango Crush', 'This tropical mocktail is given an extra flavour hit by adding lemon sorbet and mango nectar.', 'https://img.taste.com.au/pmkr9kPn/w720-h480-cfill-q80/taste/2016/11/orange-mango-crush-110416-1.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (14, 7, 'Strawberry Apple Punch', 'Nothing says party like punch!', 'https://img.taste.com.au/oVTPQ0dl/w720-h480-cfill-q80/taste/2016/11/strawberry-apple-punch-32476-1.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (15, 3, 'Lime and Mint Sodie', 'Impress with Mexican lime and mint sodas that are huge on flavour and light on the budget!', 'https://img.taste.com.au/OwnOMhLc/w643-h428-cfill-q90/taste/2016/11/lime-and-mint-sodas-83835-1.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (16, 15, 'Strawberry Agua', 'Fresh strawberries, lime juice, and mint', 'https://img.taste.com.au/cn8tILvl/w720-h480-cfill-q80/taste/2017/10/curtis-stones-fresh-strawberry-water-1980x1320-131434-1.jpg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (17, 5, 'Peach Melba Punch', 'A drink everyone can enjoy!', 'https://img.taste.com.au/SDJmKiee/w720-h480-cfill-q80/taste/2018/10/peach-melba-punch-recipe-143151-2.jpg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (18, 2, 'Wild Raspberry and Hibiscus Fruit Drink', 'For a burst of freshness try this gorgeous raspberry and hibiscus fruit boost punch.', 'https://img.taste.com.au/qJg7UImR/w720-h480-cfill-q80/taste/2017/02/boost-punch_1980x1320-121118-1.jpg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (19, 3, 'Watermelon Breeze', 'Rich in antioxidants, this drink makes a refreshing change if you\'re trying to cut back on your alcohol intake during the festive season.', 'https://img.taste.com.au/XjX4VEKM/w720-h480-cfill-q80/taste/2016/11/watermelon-breeze-77853-1.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (20, 15, 'Ginger Punch', 'Everyone will love this non-alcoholic fruit punch this festive season.', 'https://img.taste.com.au/1vZGGy4N/w720-h480-cfill-q80/taste/2016/11/ginger-punch-61213-1.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (21, 18, 'Peachy Palmer', 'Fruit infused with notes of mint and strawberries', 'https://img.taste.com.au/rTVzbrDp/w720-h480-cfill-q80/taste/2016/11/peachy-mint-iced-tea-110412-1.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (22, 23, 'Rosewater Lemonade', 'Take a trip to a far-flung land with this delicious rosewater lemonade.', 'https://img.taste.com.au/-8uDnEH7/w720-h480-cfill-q80/taste/2016/11/rosewater-lemonade-58415-1.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (23, 22, 'Lemongrass and Ginger Crush', 'A mocktail perfect for an Asian-inspired dinner party or a refreshing drink for friends on a summers day.', 'https://img.taste.com.au/gHipM46C/w720-h480-cfill-q80/taste/2016/11/lemongrass-ginger-and-lime-crush-105308-1.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (24, 21, 'Pineapple Passionfruit Soda', 'Be a whizz with fizz and create this refreshing soda that will have your tastebuds bubbling!', 'https://img.taste.com.au/zJjlx2oG/w720-h480-cfill-q80/taste/2016/11/pineapple-and-passionfruit-soda-86910-1.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (25, 15, 'Apple Mint Grape Punch', 'Kick start your celebrations with a non alcoholic punch packed with fresh fruity flavour.', 'https://img.taste.com.au/0F87CeX3/w720-h480-cfill-q80/taste/2016/11/apple-mint-and-grape-punch-57459-1.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (26, 10, 'Tea-Tini Mocktail', 'A refreshing spin on a Southern Sweet Tea', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2016/12/17/3/YW0910H_roberts-nonalcoholic-martini_s4x3.jpg.rend.hgtvcom.826.620.suffix/1482008569831.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (27, 9, 'Virgin Marys', 'Delicious spin on a classic', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2009/4/20/0/BX0124-1_Virgin-Marys_s4x3.jpg.rend.hgtvcom.826.620.suffix/1532458324910.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (28, 8, 'Sparkling Tropical Mock-tail', 'A mocktail that will make you feel like you are on an island sunbathing ', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2014/8/15/1/KC0305H_Sparkling-Tropical-Mock-tail_s4x3.jpg.rend.hgtvcom.826.620.suffix/1408655622864.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (29, 5, 'Chocolate Martini Mockta', 'Calling all chocolate lovers! ', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2014/5/20/0/CCBAB109H_Chocolate-Martini-Mocktail_s4x3.jpg.rend.hgtvcom.966.725.suffix/1400740922053.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (30, 1, 'Cranberry-Lime Mocktail', 'This mocktail with homemade cranberry syrup and fresh lime juice is tart, slightly sweet and completely refreshing.', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2018/3/30/1/LS-Library_Cranberry-Lime-Mocktail_s4x3.jpg.rend.hgtvcom.966.725.suffix/1522444012488.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (31, 3, 'Mermaid Refresher', 'This sweet and refreshing punch will remind you of the ocean, and a touch of pineapple juice gives it just a hint of tropical flavor.', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2017/8/8/0/KC1406H_Mermaid-Lemonade-Refresher_s4x3.jpg.rend.hgtvcom.966.725.suffix/1502227830858.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (32, 6, 'Mock Colada', 'Turn your favorite coconut-flavored seltzer into a bubbly virgin pina colada.', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2018/3/1/0/FN_Snap-MOCK-PINA-COLADA_s4x3.jpg.rend.hgtvcom.966.725.suffix/1519931125954.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (33, 1, 'Mock Grapefruit-Pom Paloma', 'This refreshing fizzy drink swaps out tequila for the pleasant pucker of grapefruit and pomegranate juices.', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2018/3/1/0/FN_Snap-MOCK-GRAPEFRUIT-POM-PALOMA_s4x3.jpg.rend.hgtvcom.966.725.suffix/1519931126445.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (34, 2, 'Mango-Lime Spritzer', 'Make sure you opt for ginger beer (as opposed to ginger ale). It is spicier and the perfect balance for sweet mango.', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2017/10/9/0/YW1012H_Mango-Lime-Spritzer_s4x3.jpg.rend.hgtvcom.966.725.suffix/1507562209163.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (35, 5, 'Cherry-Lime Rickey', 'You won\'t miss the gin (or bourbon) with this rickey-inspired mocktail. It\'s sweet, bubbly and garnished with a lime wheel. What\'s not to love?!', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2016/6/9/2/KC1004H_Cherry-Lime-Rickey_s4x3.jpg.rend.hgtvcom.966.725.suffix/1466714867267.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (36, 7, 'Mock Apple-Cider Sour', 'Play mixologist with this fizzy apple-cider sour. The flamed orange peel garnish provides a hint of smoke to mimic whiskey\'s oaked taste.', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2018/3/1/0/FN_Snap-Mock-Cider-Sour_s4x3.jpg.rend.hgtvcom.966.725.suffix/1519931126336.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (37, 3, 'Honey Orangeade', 'Simple syrup from fresh squeeze orange juice and honey and uses it to dress up plain, chilled seltzer. The result? A sweet and refreshing sip that\'s way better than any cocktail.', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2020/09/02/QK303_honey-orangeade_s4x3.jpg.rend.hgtvcom.966.725.suffix/1599064724156.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (38, 1, 'Mock Mule', 'You\'ll hardly miss the vodka with this effervescent mock Moscow mule. The candied ginger garnish adds a little sugar and spice.', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2018/3/1/0/FN_Snap-MOCK-MULE_s4x3.jpg.rend.hgtvcom.966.725.suffix/1519931126215.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (39, 7, 'Thanksgiving Mocktail', 'Blood orange, thyme and ginger beer (it\'s non-alcoholic) make this mocktail light, bright and refreshing. If you\'ve never tried it, ginger beer is a spicier, more intensely flavored alternative to ginger ale, and is also delicious on its own.', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2019/11/27/FNK_Thanksgiving_Mocktail_H_0141.jpg.rend.hgtvcom.966.725.suffix/1574815971237.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (40, 2, 'Sunny\'s Grapefruit-Coconut Cooler', 'Mixes grapefruit juice, cream of coconut and agave nectar for a sweet and refreshing sip that is sure to please.', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2017/12/28/1/KC1512_Grapefruit-Coconut-Cooler_s3x4.jpg.rend.hgtvcom.966.1288.suffix/1514497107272.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (41, 4, 'Virgin Mango Margaritas', 'Break out the blender! Start mixing up refreshing, mango margarita-inspired slushies along with  lemon-lime soda to give this simple, speedy frozen mocktail a familiar flavor.', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2012/8/29/1/WU0305H_virgin-mango-margaritas_s4x3.jpg.rend.hgtvcom.966.725.suffix/1371609389895.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (42, 3, 'Cranberry Spritzer', 'You only need 4 simple ingredients and some ice to make these pretty and oh-so-flavorful non-alcoholic mixed drinks.', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2008/10/3/0/poinsettia-cocktail_s3x4.jpg.rend.hgtvcom.966.1288.suffix/1382992714870.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (43, 4, 'Winter Spice Lemonade', 'Turn simple, homemade lemonade into an alcohol-free, party-worthy sip by adding fresh ginger, star anise and cinnamon sticks.', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2016/1/26/1/KC0810H_Winter-Lemonade_s4x3.jpg.rend.hgtvcom.966.725.suffix/1454527372943.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (44, 2, 'Orange Cream Mimosa', 'Grab whatever you have on hand (non-alcoholic sparkling wine, sparkling cider or ginger ale) and use it to top off a simple, homemade orange cream for a fizzy and delicious drink', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2011/5/3/2/CC_Orange-Cream-Mimosa_s4x3.jpg.rend.hgtvcom.966.725.suffix/1371597616926.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (45, 7, 'Brood Brew', 'A touch of sparkling cider gives this booze-free beverage a few bubbles, making it feel just like a fizzy mixed drink.', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2016/9/25/3/KC1104H_Geoffrey-Zakarians-Brood-Brew_s4x3.jpg.rend.hgtvcom.966.725.suffix/1476374436300.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (46, 8, 'Mock Mango Fizz', 'Fruity and refreshing, this mango mocktail has all the trappings of a cocktail - except the tequila.', 'https://food.fnr.sndimg.com/content/dam/images/food/fullset/2018/3/1/0/FN_Snap-MOCK-MANGO-ORANGE-FIZZ_s4x3.jpg.rend.hgtvcom.966.725.suffix/1519931126139.jpeg', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (47, 9, 'Virgin Raspberry Mango Margarita Slushies', 'When it\'s a real scorcher, refresh with these gorgeous frozen virgin margaritas, made zesty with lots of lime.', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/raspberry-mango-virgin-margarita-slushy-1647982788.jpg?crop=0.9332711152589828xw:1xh;center,top&resize=980:*', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (48, 13, 'Triple Berry Sparklers', 'The secret to this super patriotic refresher? The berry ice cubes.', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/triple-berry-sparklers-1647986138.jpg?crop=0.9332711152589828xw:1xh;center,top&resize=980:*', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (49, 14, 'Blackberry Virgin Mojito', 'This non-alcoholic mojito is still every bit as refreshing with an easy mint simple syrup and fresh blackberries.', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/20191120-blackberry-virgin-mojito-delish-ehg-4728-1583519572.jpg?crop=0.9334315892901007xw:1xh;center,top&resize=980:*', 1);
INSERT INTO `drink` (`id`, `user_id`, `name`, `description`, `image_url`, `active`) VALUES (50, 15, 'Strawberry Lemonade', 'Freshly squeezed lemons team up with juicy strawberries for the perfect summer drink. It\'s tart, sweet, and all around refreshing.', 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/strawberry-lemonade-1647983116.jpg?crop=1xw:1xh;center,top&resize=980:*', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `meetup`
-- -----------------------------------------------------
START TRANSACTION;
USE `mocktaildb`;
INSERT INTO `meetup` (`id`, `address_id`, `user_id`, `title`, `meetup_date`, `description`, `date_created`, `start_time`, `end_time`, `max_attendees`, `active`, `image_url`) VALUES (1, 1, 1, 'This is a new meetup', '2022-01-01', 'Descrip', NULL, NULL, NULL, 10, 1, NULL);

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

