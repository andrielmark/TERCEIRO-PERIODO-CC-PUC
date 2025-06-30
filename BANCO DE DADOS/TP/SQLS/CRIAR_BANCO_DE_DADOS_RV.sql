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
-- Table `mydb`.`CONFRARIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CONFRARIA` (
  `NomeInstitucional` VARCHAR(100) NOT NULL,
  `Endereço` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`NomeInstitucional`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CONFRADE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CONFRADE` (
  `CPF` CHAR(11) NOT NULL,
  `Nome` VARCHAR(50) NOT NULL,
  `Sobrenome` VARCHAR(50) NOT NULL,
  `CONFRARIA_NomeInstitucional` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`CPF`),
  INDEX `fk_CONFRADE_CONFRARIA_idx` (`CONFRARIA_NomeInstitucional` ASC),
  CONSTRAINT `fk_CONFRADE_CONFRARIA`
    FOREIGN KEY (`CONFRARIA_NomeInstitucional`)
    REFERENCES `mydb`.`CONFRARIA` (`NomeInstitucional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`MANDATO_PRESIDENCIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`MANDATO_PRESIDENCIA` (
  `Id_Mandato` INT NOT NULL AUTO_INCREMENT,
  `Data_Inicio` DATE NOT NULL,
  `Data_Termino` DATE NOT NULL,
  `CONFRADE_CPF` CHAR(11) NOT NULL,
  PRIMARY KEY (`Id_Mandato`),
  INDEX `fk_MANDATO_PRESIDENCIA_CONFRADE1_idx` (`CONFRADE_CPF` ASC),
  CONSTRAINT `fk_MANDATO_PRESIDENCIA_CONFRADE1`
    FOREIGN KEY (`CONFRADE_CPF`)
    REFERENCES `mydb`.`CONFRADE` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`FUNCIONARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`FUNCIONARIO` (
  `CPF` CHAR(11) NOT NULL,
  `Nome` VARCHAR(50) NOT NULL,
  `Sobrenome` VARCHAR(50) NOT NULL,
  `Data_Contratacao` DATE NOT NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DOADOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DOADOR` (
  `CPF` CHAR(11) NOT NULL,
  `Nome` VARCHAR(50) NOT NULL,
  `Sobrenome` VARCHAR(50) NOT NULL,
  `Email` VARCHAR(100) NOT NULL,
  `Telefone` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`IDOSO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`IDOSO` (
  `CPF` CHAR(11) NOT NULL,
  `Nome` VARCHAR(50) NOT NULL,
  `Sobrenome` VARCHAR(50) NOT NULL,
  `Data_Nascimento` DATE NOT NULL,
  `Beneficio_Mensal` DECIMAL(10,2) NOT NULL,
  `Nome_Familiar` VARCHAR(100) NULL,
  `Telefone_Familiar` VARCHAR(15) NULL,
  PRIMARY KEY (`CPF`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`TRANSACAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`TRANSACAO` (
  `Id_Transacao` INT NOT NULL AUTO_INCREMENT,
  `Data` DATE NULL,
  `CONFRARIA_NomeInstitucional` VARCHAR(100) NOT NULL,
  `IDOSO_CPF` CHAR(11) NOT NULL,
  `DOADOR_CPF` CHAR(11) NOT NULL,
  `FUNCIONARIO_CPF` CHAR(11) NOT NULL,
  PRIMARY KEY (`Id_Transacao`),
  INDEX `fk_TRANSACAO_CONFRARIA1_idx` (`CONFRARIA_NomeInstitucional` ASC),
  INDEX `fk_TRANSACAO_IDOSO1_idx` (`IDOSO_CPF` ASC),
  INDEX `fk_TRANSACAO_DOADOR1_idx` (`DOADOR_CPF` ASC),
  INDEX `fk_TRANSACAO_FUNCIONARIO1_idx` (`FUNCIONARIO_CPF` ASC),
  CONSTRAINT `fk_TRANSACAO_CONFRARIA1`
    FOREIGN KEY (`CONFRARIA_NomeInstitucional`)
    REFERENCES `mydb`.`CONFRARIA` (`NomeInstitucional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TRANSACAO_IDOSO1`
    FOREIGN KEY (`IDOSO_CPF`)
    REFERENCES `mydb`.`IDOSO` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TRANSACAO_DOADOR1`
    FOREIGN KEY (`DOADOR_CPF`)
    REFERENCES `mydb`.`DOADOR` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TRANSACAO_FUNCIONARIO1`
    FOREIGN KEY (`FUNCIONARIO_CPF`)
    REFERENCES `mydb`.`FUNCIONARIO` (`CPF`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DOACAO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DOACAO` (
  `Id_Doacao` INT NOT NULL AUTO_INCREMENT,
  `Data` DATE NOT NULL,
  `TRANSACAO_Id_Transacao` INT NOT NULL,
  PRIMARY KEY (`Id_Doacao`),
  INDEX `fk_DOACAO_TRANSACAO1_idx` (`TRANSACAO_Id_Transacao` ASC),
  CONSTRAINT `fk_DOACAO_TRANSACAO1`
    FOREIGN KEY (`TRANSACAO_Id_Transacao`)
    REFERENCES `mydb`.`TRANSACAO` (`Id_Transacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DOACAO_MATERIAL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DOACAO_MATERIAL` (
  `DOACAO_Id_Doacao` INT NOT NULL,
  `Tipo_Item` VARCHAR(50) NOT NULL,
  `Quantidade` INT NOT NULL,
  INDEX `fk_DOACAO_MATERIAL_DOACAO1_idx` (`DOACAO_Id_Doacao` ASC),
  PRIMARY KEY (`DOACAO_Id_Doacao`),
  CONSTRAINT `fk_DOACAO_MATERIAL_DOACAO1`
    FOREIGN KEY (`DOACAO_Id_Doacao`)
    REFERENCES `mydb`.`DOACAO` (`Id_Doacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`DOACAO_FINANCEIRA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`DOACAO_FINANCEIRA` (
  `DOACAO_Id_Doacao` INT NOT NULL,
  `Valor` DECIMAL(10,2) NOT NULL,
  `Forma_Pagamento` VARCHAR(30) NOT NULL,
  INDEX `fk_DOACAO_FINANCEIRA_DOACAO1_idx` (`DOACAO_Id_Doacao` ASC),
  PRIMARY KEY (`DOACAO_Id_Doacao`),
  CONSTRAINT `fk_DOACAO_FINANCEIRA_DOACAO1`
    FOREIGN KEY (`DOACAO_Id_Doacao`)
    REFERENCES `mydb`.`DOACAO` (`Id_Doacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
