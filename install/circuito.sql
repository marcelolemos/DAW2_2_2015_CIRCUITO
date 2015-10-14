-- MySQL Script generated by MySQL Workbench
-- 10/14/15 09:56:46
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema circuito
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema circuito
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `circuito` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `circuito` ;

-- -----------------------------------------------------
-- Table `circuito`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `circuito`.`usuario` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `login` VARCHAR(32) NOT NULL COMMENT '',
  `senha` CHAR(32) NOT NULL COMMENT '',
  `nome` VARCHAR(45) NOT NULL COMMENT '',
  `alterar` TINYINT(1) NOT NULL COMMENT '',
  `excluir` TINYINT(1) NOT NULL COMMENT '',
  `incluir` TINYINT(1) NOT NULL COMMENT '',
  `data_cad` DATE NOT NULL COMMENT '',
  `email` VARCHAR(45) NOT NULL COMMENT '',
  `smtp` VARCHAR(45) NOT NULL COMMENT '',
  `email_senha` CHAR(32) NOT NULL COMMENT '',
  `email_login` VARCHAR(45) NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `circuito`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `circuito`.`categorias` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(50) NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `circuito`.`jogadores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `circuito`.`jogadores` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(50) NULL COMMENT '',
  `endereco` VARCHAR(50) NULL COMMENT '',
  `numero` VARCHAR(30) NULL COMMENT '',
  `bairro` VARCHAR(30) NULL COMMENT '',
  `cidade` VARCHAR(50) NULL COMMENT '',
  `uf` CHAR(2) NULL COMMENT '',
  `fone1` VARCHAR(14) NULL COMMENT '',
  `fone2` VARCHAR(14) NULL COMMENT '',
  `fone3` VARCHAR(14) NULL COMMENT '',
  `email` VARCHAR(50) NULL COMMENT '',
  `pontos` INT NULL COMMENT '',
  `categorias_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_jogadores_categorias_idx` (`categorias_id` ASC)  COMMENT '',
  CONSTRAINT `fk_jogadores_categorias`
    FOREIGN KEY (`categorias_id`)
    REFERENCES `circuito`.`categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `circuito`.`duplas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `circuito`.`duplas` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(50) NULL COMMENT '',
  `duplascol` VARCHAR(45) NULL COMMENT '',
  `jogadores_id` INT NOT NULL COMMENT '',
  `jogadores_id1` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_duplas_jogadores1_idx` (`jogadores_id` ASC)  COMMENT '',
  INDEX `fk_duplas_jogadores2_idx` (`jogadores_id1` ASC)  COMMENT '',
  CONSTRAINT `fk_duplas_jogadores1`
    FOREIGN KEY (`jogadores_id`)
    REFERENCES `circuito`.`jogadores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_duplas_jogadores2`
    FOREIGN KEY (`jogadores_id1`)
    REFERENCES `circuito`.`jogadores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `circuito`.`partidas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `circuito`.`partidas` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `pontos_dupla_1` INT NULL COMMENT '',
  `pontos_dupla_2` INT NULL COMMENT '',
  `duplas_id` INT NOT NULL COMMENT '',
  `duplas_id1` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`, `duplas_id`)  COMMENT '',
  INDEX `fk_partidas_duplas1_idx` (`duplas_id` ASC)  COMMENT '',
  INDEX `fk_partidas_duplas2_idx` (`duplas_id1` ASC)  COMMENT '',
  CONSTRAINT `fk_partidas_duplas1`
    FOREIGN KEY (`duplas_id`)
    REFERENCES `circuito`.`duplas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_partidas_duplas2`
    FOREIGN KEY (`duplas_id1`)
    REFERENCES `circuito`.`duplas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `circuito`.`campeonatos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `circuito`.`campeonatos` (
  `id` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `nome` VARCHAR(50) NULL COMMENT '',
  `data_ini` DATE NULL COMMENT '',
  `data_fim` DATE NULL COMMENT '',
  `partidas_id` INT NOT NULL COMMENT '',
  PRIMARY KEY (`id`)  COMMENT '',
  INDEX `fk_campeonatos_partidas1_idx` (`partidas_id` ASC)  COMMENT '',
  CONSTRAINT `fk_campeonatos_partidas1`
    FOREIGN KEY (`partidas_id`)
    REFERENCES `circuito`.`partidas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
