-- MySQL Script generated by MySQL Workbench
-- Sun Jan 26 18:44:42 2025
-- Model: New Model    Version: 1.0
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
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`market_places`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`market_places` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) CHARACTER SET 'latin1' NOT NULL,
  `password` VARCHAR(15) NOT NULL,
  `phone` INT NULL,
  `type` TINYINT NOT NULL DEFAULT 0,
  `active` TINYINT NOT NULL DEFAULT 0,
  `market_places_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_market_places1_idx` (`market_places_id` ASC) VISIBLE,
  CONSTRAINT `fk_user_market_places1`
    FOREIGN KEY (`market_places_id`)
    REFERENCES `mydb`.`market_places` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cart` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cart_user1_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `fk_cart_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `mydb`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`orders` (
  `id` BIGINT UNSIGNED NOT NULL,
  `cart_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_cart1_idx` (`cart_id` ASC) VISIBLE,
  CONSTRAINT `fk_order_cart1`
    FOREIGN KEY (`cart_id`)
    REFERENCES `mydb`.`cart` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`shipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`shipment` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `courier` VARCHAR(45) NOT NULL,
  `orders_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_shipment_order1_idx` (`orders_id` ASC) VISIBLE,
  CONSTRAINT `fk_shipment_order1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `mydb`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`address` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `street` VARCHAR(45) NOT NULL,
  `home_nr` INT NOT NULL,
  `flat_nr` INT NULL,
  `city` VARCHAR(45) NOT NULL,
  `post_code` VARCHAR(45) NOT NULL,
  `shipment_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_address_shipment1_idx` (`shipment_id` ASC) VISIBLE,
  CONSTRAINT `fk_address_shipment1`
    FOREIGN KEY (`shipment_id`)
    REFERENCES `mydb`.`shipment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`category` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`discount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`discount` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `amount` DOUBLE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`product` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` DOUBLE NOT NULL,
  `category_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `mydb`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`payment` (
  `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(45) NOT NULL,
  `orders_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_payment_order1_idx` (`orders_id` ASC) VISIBLE,
  CONSTRAINT `fk_payment_order1`
    FOREIGN KEY (`orders_id`)
    REFERENCES `mydb`.`orders` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cart_products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cart_products` (
  `cart_id` BIGINT UNSIGNED NOT NULL,
  `product_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`cart_id`, `product_id`),
  INDEX `fk_cart_has_product_product1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_cart_has_product_cart1_idx` (`cart_id` ASC) VISIBLE,
  CONSTRAINT `fk_cart_has_product_cart1`
    FOREIGN KEY (`cart_id`)
    REFERENCES `mydb`.`cart` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_cart_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `mydb`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`category_discounts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`category_discounts` (
  `category_id` BIGINT UNSIGNED NOT NULL,
  `discount_id` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`category_id`, `discount_id`),
  INDEX `fk_category_has_discount_discount1_idx` (`discount_id` ASC) VISIBLE,
  INDEX `fk_category_has_discount_category1_idx` (`category_id` ASC) VISIBLE,
  CONSTRAINT `fk_category_has_discount_category1`
    FOREIGN KEY (`category_id`)
    REFERENCES `mydb`.`category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_discount_discount1`
    FOREIGN KEY (`discount_id`)
    REFERENCES `mydb`.`discount` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
