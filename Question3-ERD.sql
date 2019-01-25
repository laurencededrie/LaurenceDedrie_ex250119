-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Question3-ERD
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Question3-ERD
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Question3-ERD` ;
USE `Question3-ERD` ;

-- -----------------------------------------------------
-- Table `Question3-ERD`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Question3-ERD`.`Gene` (
  `idGene` INT NOT NULL,
  `Gene_name` VARCHAR(45) NULL,
  `Description` VARCHAR(255) NULL,
  PRIMARY KEY (`idGene`),
  UNIQUE INDEX `idGene_UNIQUE` (`idGene` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Question3-ERD`.`Chromosomal_position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Question3-ERD`.`Chromosomal_position` (
  `idChromosomal_position` INT NOT NULL,
  `Chromosome` VARCHAR(2) NULL,
  `Start` INT NULL,
  `End` INT NULL,
  `Gene` INT NOT NULL,
  PRIMARY KEY (`idChromosomal_position`),
  UNIQUE INDEX `idChromosomal_position_UNIQUE` (`idChromosomal_position` ASC) VISIBLE,
  UNIQUE INDEX `Gene_UNIQUE` (`Gene` ASC) VISIBLE,
  CONSTRAINT `fk_Chromosomal_position_1`
    FOREIGN KEY (`Gene`)
    REFERENCES `Question3-ERD`.`Gene` (`idGene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Question3-ERD`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Question3-ERD`.`Syndrome` (
  `idSyndrome` INT NOT NULL,
  `Syndrome` VARCHAR(45) NULL,
  `Description` VARCHAR(255) NULL,
  PRIMARY KEY (`idSyndrome`),
  UNIQUE INDEX `idSyndrome_UNIQUE` (`idSyndrome` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Question3-ERD`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Question3-ERD`.`Patient` (
  `idPatient` INT NOT NULL,
  `Patient_name` VARCHAR(45) NULL,
  `Gender` ENUM('M', 'F') NULL,
  `Age_at_diagnosis` INT NULL,
  `Patient_syndrome` INT NOT NULL,
  PRIMARY KEY (`idPatient`),
  UNIQUE INDEX `idPatient_UNIQUE` (`idPatient` ASC) VISIBLE,
  UNIQUE INDEX `Patient_syndrome_UNIQUE` (`Patient_syndrome` ASC) VISIBLE,
  CONSTRAINT `fk_Patient_1`
    FOREIGN KEY (`Patient_syndrome`)
    REFERENCES `Question3-ERD`.`Syndrome` (`idSyndrome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Question3-ERD`.`Cross_reference_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Question3-ERD`.`Cross_reference_table` (
  `idCross_reference_table` INT NOT NULL,
  `Gene` INT NOT NULL,
  `Syndrome` INT NOT NULL,
  PRIMARY KEY (`idCross_reference_table`),
  UNIQUE INDEX `idCross_reference_table_UNIQUE` (`idCross_reference_table` ASC) VISIBLE,
  UNIQUE INDEX `Gene_UNIQUE` (`Gene` ASC) VISIBLE,
  UNIQUE INDEX `Syndrome_UNIQUE` (`Syndrome` ASC) VISIBLE,
  CONSTRAINT `fk_Cross_reference_table_1`
    FOREIGN KEY (`Gene`)
    REFERENCES `Question3-ERD`.`Gene` (`idGene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cross_reference_table_2`
    FOREIGN KEY (`Syndrome`)
    REFERENCES `Question3-ERD`.`Syndrome` (`idSyndrome`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
