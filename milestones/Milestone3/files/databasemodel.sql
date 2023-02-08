-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema AirlineManagement
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema AirlineManagement
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `AirlineManagement` ;
USE `AirlineManagement` ;

-- -----------------------------------------------------
-- Table `AirlineManagement`.`Flight_Schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AirlineManagement`.`Flight_Schedule` (
  `idFlight_Schedule` INT NOT NULL,
  `FlightDate` DATETIME NOT NULL,
  `Departure` DATETIME NOT NULL,
  `Arrival` DATETIME NOT NULL,
  `AirCraft` INT NOT NULL,
  `NetFare` INT NOT NULL,
  PRIMARY KEY (`idFlight_Schedule`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AirlineManagement`.`Passengers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AirlineManagement`.`Passengers` (
  `idPassengers` INT NOT NULL,
  `Name` VARCHAR(32) NOT NULL,
  `Address` VARCHAR(64) NOT NULL,
  `Age` INT NOT NULL,
  `Nationality` VARCHAR(16) NOT NULL,
  `Contacts` INT NOT NULL,
  `Transactions_idTransactions` INT NOT NULL,
  PRIMARY KEY (`idPassengers`, `Transactions_idTransactions`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AirlineManagement`.`AirCrafts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AirlineManagement`.`AirCrafts` (
  `idAirCrafts` INT NOT NULL,
  `AirCraftNumber` VARCHAR(45) NOT NULL,
  `Capacity` INT NOT NULL,
  `ModifiedBy` VARCHAR(128) NOT NULL,
  `ModifiedOn` DATETIME NOT NULL,
  `Flight_Schedule_idFlight_Schedule` INT NOT NULL,
  PRIMARY KEY (`idAirCrafts`, `Flight_Schedule_idFlight_Schedule`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AirlineManagement`.`AirFare`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AirlineManagement`.`AirFare` (
  `idAirFare` INT NOT NULL,
  `Route` INT NOT NULL COMMENT '\n																															\n\n',
  `Fare Currency` INT NOT NULL,
  `FSC Currency` INT NOT NULL,
  `Flight_Schedule_idFlight_Schedule` INT NOT NULL,
  `Flight_Schedule_Transactions_idTransactions` INT NOT NULL,
  PRIMARY KEY (`idAirFare`, `Flight_Schedule_idFlight_Schedule`, `Flight_Schedule_Transactions_idTransactions`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AirlineManagement`.`Contact_Details`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AirlineManagement`.`Contact_Details` (
  `idContact_Details` INT NOT NULL,
  `Email` VARCHAR(16) NOT NULL,
  `Cell` VARCHAR(16) NOT NULL,
  `Telephone` VARCHAR(16) NOT NULL,
  `Street` VARCHAR(64) NOT NULL,
  `State` INT NOT NULL,
  `Passengers_idPassengers` INT NOT NULL,
  PRIMARY KEY (`idContact_Details`, `Passengers_idPassengers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AirlineManagement`.`Route`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AirlineManagement`.`Route` (
  `idRoute` INT NOT NULL,
  `Airport` VARCHAR(32) NOT NULL,
  `Distination` VARCHAR(32) NOT NULL,
  `RouteCode` VARCHAR(16) NOT NULL,
  `AirFare_idAirFare` INT NOT NULL,
  PRIMARY KEY (`idRoute`, `AirFare_idAirFare`),
  UNIQUE INDEX `RouteCode_UNIQUE` (`RouteCode` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AirlineManagement`.`Countries`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AirlineManagement`.`Countries` (
  `idCountries` INT NOT NULL,
  `CountryName` VARCHAR(32) NOT NULL,
  `State_idState` INT NOT NULL,
  `State_Branches_idBranches` INT NOT NULL,
  `State_Branches_Employee_idEmployee` INT NOT NULL,
  `State_Branches_Employee_Transactions_idTransactions` INT NOT NULL,
  PRIMARY KEY (`idCountries`, `State_idState`, `State_Branches_idBranches`, `State_Branches_Employee_idEmployee`, `State_Branches_Employee_Transactions_idTransactions`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AirlineManagement`.`State`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AirlineManagement`.`State` (
  `idState` INT NOT NULL,
  `StateName` VARCHAR(32) NOT NULL,
  `Country` INT NOT NULL,
  `Branches_idBranches` INT NOT NULL,
  `Branches_Employee_idEmployee` INT NOT NULL,
  `Branches_Employee_Transactions_idTransactions` INT NOT NULL,
  `Contact_Details_idContact_Details` INT NOT NULL,
  PRIMARY KEY (`idState`, `Branches_idBranches`, `Branches_Employee_idEmployee`, `Branches_Employee_Transactions_idTransactions`, `Contact_Details_idContact_Details`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AirlineManagement`.`Charges`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AirlineManagement`.`Charges` (
  `idCharges` INT NOT NULL,
  `Title` VARCHAR(32) NOT NULL,
  `Amount` INT NOT NULL,
  `Description` VARCHAR(255) NOT NULL,
  `Transactions_idTransactions` INT NOT NULL,
  `Branches_idBranches` INT NOT NULL,
  `Branches_Employee_idEmployee` INT NOT NULL,
  `Branches_Employee_Transactions_idTransactions` INT NOT NULL,
  PRIMARY KEY (`idCharges`, `Transactions_idTransactions`, `Branches_idBranches`, `Branches_Employee_idEmployee`, `Branches_Employee_Transactions_idTransactions`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AirlineManagement`.`Discount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AirlineManagement`.`Discount` (
  `idDiscount` INT NOT NULL,
  `Title` VARCHAR(32) NOT NULL,
  `Amount` INT NOT NULL,
  `Description` VARCHAR(255) NULL,
  `Transactions_idTransactions` INT NOT NULL,
  PRIMARY KEY (`idDiscount`, `Transactions_idTransactions`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AirlineManagement`.`Branches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AirlineManagement`.`Branches` (
  `idBranches` INT NOT NULL,
  `Center` VARCHAR(16) NOT NULL,
  `Address` VARCHAR(32) NOT NULL,
  `State` INT NOT NULL,
  `Employee_idEmployee` INT NOT NULL,
  `Employee_Transactions_idTransactions` INT NOT NULL,
  PRIMARY KEY (`idBranches`, `Employee_idEmployee`, `Employee_Transactions_idTransactions`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AirlineManagement`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AirlineManagement`.`Employee` (
  `idEmployee` INT NOT NULL,
  `Name` VARCHAR(32) NOT NULL,
  `Address` VARCHAR(32) NOT NULL,
  `Branch` INT NOT NULL,
  `Designation` VARCHAR(32) NOT NULL,
  `Email` VARCHAR(16) NOT NULL,
  `Telephone` VARCHAR(16) NOT NULL,
  `ExtesionNum` INT NULL,
  `Transactions_idTransactions` INT NOT NULL,
  PRIMARY KEY (`idEmployee`, `Transactions_idTransactions`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `AirlineManagement`.`Transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AirlineManagement`.`Transactions` (
  `idTransactions` INT NOT NULL,
  `BookingDate` DATETIME NULL DEFAULT NULL,
  `DepartureDate` DATETIME NOT NULL,
  `Passenger` INT NOT NULL,
  `Flight` INT NOT NULL,
  `Type` BIT(32) NOT NULL,
  `Employee` INT NOT NULL,
  `Chargers` INT NOT NULL,
  `Discount` INT NOT NULL,
  `Total` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTransactions`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
