-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema MH_trabalho
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema MH_trabalho
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `MH_trabalho` DEFAULT CHARACTER SET utf8 ;
USE `MH_trabalho` ;

-- -----------------------------------------------------
-- Table `MH_trabalho`.`MH_Horta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MH_trabalho`.`MH_Horta` (
  `id_Horta` INT NOT NULL,
  PRIMARY KEY (`id_Horta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MH_trabalho`.`MH_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MH_trabalho`.`MH_Cliente` (
  `id_Cliente` INT NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_Cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MH_trabalho`.`MH_Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MH_trabalho`.`MH_Venda` (
  `id_Venda` INT NOT NULL AUTO_INCREMENT,
  `data_venda` DATE NOT NULL,
  `situacao` VARCHAR(15) NOT NULL,
  `id_func` VARCHAR(45) NULL,
  `id_Horta` INT NOT NULL,
  `id_Cliente` INT NOT NULL,
  PRIMARY KEY (`id_Venda`, `id_Cliente`),
  INDEX `fk_MH_Venda_MH_Horta2_idx` (`id_Horta` ASC) ,
  INDEX `fk_MH_Venda_MH_Cliente2_idx` (`id_Cliente` ASC) ,
  CONSTRAINT `fk_MH_Venda_MH_Horta2`
    FOREIGN KEY (`id_Horta`)
    REFERENCES `MH_trabalho`.`MH_Horta` (`id_Horta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MH_Venda_MH_Cliente2`
    FOREIGN KEY (`id_Cliente`)
    REFERENCES `MH_trabalho`.`MH_Cliente` (`id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MH_trabalho`.`MH_Produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MH_trabalho`.`MH_Produto` (
  `id_Produto` INT NOT NULL,
  `valor` DECIMAL NOT NULL,
  `nome` VARCHAR(50) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `estoque` VARCHAR(45) NULL,
  PRIMARY KEY (`id_Produto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `MH_trabalho`.`MH_Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `MH_trabalho`.`MH_Pedido` (
  `id_Pedido` INT NOT NULL AUTO_INCREMENT,
  `quantidade` VARCHAR(45) NOT NULL,
  `id_Venda` INT NOT NULL,
  `id_Cliente` INT NOT NULL,
  `id_Produto` INT NOT NULL,
  PRIMARY KEY (`id_Pedido`, `id_Venda`, `id_Cliente`, `id_Produto`),
  INDEX `fk_MH_Pedido_MH_Venda2_idx` (`id_Venda` ASC, `id_Cliente` ASC) ,
  INDEX `fk_MH_Pedido_MH_Produto2_idx` (`id_Produto` ASC) ,
  CONSTRAINT `fk_MH_Pedido_MH_Venda2`
    FOREIGN KEY (`id_Venda` , `id_Cliente`)
    REFERENCES `MH_trabalho`.`MH_Venda` (`id_Venda` , `id_Cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_MH_Pedido_MH_Produto2`
    FOREIGN KEY (`id_Produto`)
    REFERENCES `MH_trabalho`.`MH_Produto` (`id_Produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
