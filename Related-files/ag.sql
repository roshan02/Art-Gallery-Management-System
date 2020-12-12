-- MySQL Workbench Synchronization
-- Generated: 2019-10-24 22:45
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: User

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `art_gallery` DEFAULT CHARACTER SET utf8 ;

CREATE TABLE IF NOT EXISTS `art_gallery`.`Artist` (
  `a_id` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `phone` INT(10) NULL DEFAULT NULL,
  `Painting_url` INT(11) NOT NULL,
  `Painting_title` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`a_id`, `Painting_url`, `Painting_title`),
  UNIQUE INDEX `a_id_UNIQUE` (`a_id` ASC),
  UNIQUE INDEX `phone_UNIQUE` (`phone` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `art_gallery`.`Gallery` (
  `g_id` INT(11) NOT NULL,
  `g_name` VARCHAR(45) NOT NULL,
  `url` VARCHAR(45) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `Exhibition_e_id` INT(11) NOT NULL,
  `Gallery_g_id` INT(11) NOT NULL,
  `Gallery_Exhibition_e_id` INT(11) NOT NULL,
  `Artist_a_id` INT(11) NOT NULL,
  PRIMARY KEY (`g_id`, `Exhibition_e_id`, `Artist_a_id`),
  UNIQUE INDEX `g_id_UNIQUE` (`g_id` ASC),
  UNIQUE INDEX `g_name_UNIQUE` (`g_name` ASC),
  INDEX `fk_Gallery_Artist_idx` (`Artist_a_id` ASC),
  CONSTRAINT `fk_Gallery_Artist`
    FOREIGN KEY (`Artist_a_id`)
    REFERENCES `art_gallery`.`Artist` (`a_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `art_gallery`.`Exhibition` (
  `e_id` INT(11) NOT NULL,
  `ename` VARCHAR(45) NOT NULL,
  `e_type` VARCHAR(45) NULL DEFAULT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `Gallery_g_id` INT(11) NOT NULL,
  `Gallery_Exhibition_e_id` INT(11) NOT NULL,
  PRIMARY KEY (`e_id`),
  UNIQUE INDEX `e_id_UNIQUE` (`e_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `art_gallery`.`Painting` (
  `url` INT(11) NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `year` DATE NOT NULL,
  `Artist_a_id` INT(11) NOT NULL,
  `Artist_Painting_url` INT(11) NOT NULL,
  `Artist_Painting_title` VARCHAR(45) NOT NULL,
  `Customer_c_id` INT(11) NOT NULL,
  `cost` INT(10) NULL DEFAULT NULL,
  `Painting_url` INT(11) NOT NULL,
  `Painting_title` VARCHAR(45) NOT NULL,
  `Painting_Artist_a_id` INT(11) NOT NULL,
  `Painting_Artist_Painting_url` INT(11) NOT NULL,
  `Painting_Artist_Painting_title` VARCHAR(45) NOT NULL,
  `Painting_Customer_c_id` INT(11) NOT NULL,
  `likes_idlikes` INT(11) NOT NULL,
  PRIMARY KEY (`url`, `title`, `Artist_a_id`, `Artist_Painting_url`, `Artist_Painting_title`, `Customer_c_id`, `Painting_url`, `Painting_title`, `Painting_Artist_a_id`, `Painting_Artist_Painting_url`, `Painting_Artist_Painting_title`, `Painting_Customer_c_id`, `likes_idlikes`),
  UNIQUE INDEX `url_UNIQUE` (`url` ASC),
  INDEX `fk_Painting_Artist1_idx` (`Artist_a_id` ASC, `Artist_Painting_url` ASC, `Artist_Painting_title` ASC),
  INDEX `fk_Painting_Customer1_idx` (`Customer_c_id` ASC),
  INDEX `fk_Painting_likes1_idx` (`likes_idlikes` ASC),
  CONSTRAINT `fk_Painting_Artist1`
    FOREIGN KEY (`Artist_a_id` , `Artist_Painting_url` , `Artist_Painting_title`)
    REFERENCES `art_gallery`.`Artist` (`a_id` , `Painting_url` , `Painting_title`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Painting_Customer1`
    FOREIGN KEY (`Customer_c_id`)
    REFERENCES `art_gallery`.`Customer` (`c_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Painting_likes1`
    FOREIGN KEY (`likes_idlikes`)
    REFERENCES `art_gallery`.`likes` (`idlikes`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `art_gallery`.`Customer` (
  `c_id` INT(11) NOT NULL,
  `c_name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `phone` INT(10) NOT NULL,
  UNIQUE INDEX `c_id_UNIQUE` (`c_id` ASC),
  PRIMARY KEY (`c_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `art_gallery`.`login` (
  `Email` VARCHAR(45) NOT NULL,
  `usertype` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Email`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `art_gallery`.`Organise` (
  `Gallery_g_id` INT(11) NOT NULL,
  `Gallery_Exhibition_e_id` INT(11) NOT NULL,
  `Gallery_Artist_a_id` INT(11) NOT NULL,
  `Exhibition_e_id` INT(11) NOT NULL,
  PRIMARY KEY (`Gallery_g_id`, `Gallery_Exhibition_e_id`, `Gallery_Artist_a_id`, `Exhibition_e_id`),
  INDEX `fk_Gallery_has_Exhibition_Exhibition1_idx` (`Exhibition_e_id` ASC),
  INDEX `fk_Gallery_has_Exhibition_Gallery1_idx` (`Gallery_g_id` ASC, `Gallery_Exhibition_e_id` ASC, `Gallery_Artist_a_id` ASC),
  CONSTRAINT `fk_Gallery_has_Exhibition_Gallery1`
    FOREIGN KEY (`Gallery_g_id` , `Gallery_Exhibition_e_id` , `Gallery_Artist_a_id`)
    REFERENCES `ARRT`.`Gallery` (`g_id` , `Exhibition_e_id` , `Artist_a_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Gallery_has_Exhibition_Exhibition1`
    FOREIGN KEY (`Exhibition_e_id`)
    REFERENCES `art_gallery`.`Exhibition` (`e_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `art_gallery`.`likes` (
  `idlikes` INT(11) NULL DEFAULT 0,
  `login_Email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idlikes`, `login_Email`),
  INDEX `fk_likes_login1_idx` (`login_Email` ASC),
  CONSTRAINT `fk_likes_login1`
    FOREIGN KEY (`login_Email`)
    REFERENCES `art_gallery`.`login` (`Email`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
