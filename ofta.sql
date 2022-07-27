-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ofta` DEFAULT CHARACTER SET utf8 ;
USE `ofta` ;

-- -----------------------------------------------------
-- Table `ofta`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ofta`.`users` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `birth_day` DATE NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `employee_number` VARCHAR(25) NULL,
  `student_id` VARCHAR(45) NULL,
  `role` VARCHAR(45) NOT NULL,
  `status` TINYINT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ofta`.`schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ofta`.`schedule` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `start_date` DATETIME NOT NULL,
  `end_date` DATETIME NOT NULL,
  `description` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ofta`.`place`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ofta`.`place` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ofta`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ofta`.`course` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `description` VARCHAR(200) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `status` TINYINT NOT NULL,
  `place_id` BIGINT NOT NULL,
  `users_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_course_place1_idx` (`place_id` ASC) VISIBLE,
  INDEX `fk_course_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_place1`
    FOREIGN KEY (`place_id`)
    REFERENCES `ofta`.`place` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `ofta`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ofta`.`course_schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ofta`.`course_schedule` (
  `idcourse_schedule` BIGINT NOT NULL AUTO_INCREMENT,
  `course_id` BIGINT NOT NULL,
  `schedule_id` BIGINT NOT NULL,
  PRIMARY KEY (`idcourse_schedule`),
  INDEX `fk_course_schedule_course1_idx` (`course_id` ASC) VISIBLE,
  INDEX `fk_course_schedule_schedule1_idx` (`schedule_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_schedule_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `ofta`.`course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_course_schedule_schedule1`
    FOREIGN KEY (`schedule_id`)
    REFERENCES `ofta`.`schedule` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ofta`.`quarter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ofta`.`quarter` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ofta`.`period`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ofta`.`period` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `status` TINYINT NOT NULL DEFAULT 1,
  `type` VARCHAR(45) NOT NULL,
  `quarter_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_period_quarter1_idx` (`quarter_id` ASC) VISIBLE,
  CONSTRAINT `fk_period_quarter1`
    FOREIGN KEY (`quarter_id`)
    REFERENCES `ofta`.`quarter` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ofta`.`suscriptions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ofta`.`suscriptions` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `created_at` DATETIME NOT NULL DEFAULT now(),
  `status` TINYINT NOT NULL DEFAULT 1,
  `users_id` BIGINT NOT NULL,
  `course_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_suscriptions_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_suscriptions_course1_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `fk_suscriptions_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `ofta`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_suscriptions_course1`
    FOREIGN KEY (`course_id`)
    REFERENCES `ofta`.`course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ofta`.`suscrition_periods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ofta`.`suscrition_periods` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status` TINYINT NOT NULL DEFAULT 1,
  `period_id` BIGINT NOT NULL,
  `suscriptions_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_suscrition_periods_period1_idx` (`period_id` ASC) VISIBLE,
  INDEX `fk_suscrition_periods_suscriptions1_idx` (`suscriptions_id` ASC) VISIBLE,
  CONSTRAINT `fk_suscrition_periods_period1`
    FOREIGN KEY (`period_id`)
    REFERENCES `ofta`.`period` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_suscrition_periods_suscriptions1`
    FOREIGN KEY (`suscriptions_id`)
    REFERENCES `ofta`.`suscriptions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
