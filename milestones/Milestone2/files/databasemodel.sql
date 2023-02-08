-- MySQL Workbench Forward Engineering

SET SQL_SAFE_UPDATES = 0;
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
-- Table `AirlineManagement`.`Transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `AirlineManagement`.`Transactions` (
  `idTransactions` INT NOT NULL,
  `BookingDate` DATETIME NOT NULL,
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
  PRIMARY KEY (`idFlight_Schedule`),
  INDEX `NetFare_flight_idx` (`NetFare` ASC),
  CONSTRAINT `NetFare_flight`
    FOREIGN KEY (`NetFare`)
    REFERENCES `AirlineManagement`.`Transactions` (`idTransactions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  PRIMARY KEY (`idPassengers`, `Transactions_idTransactions`),
  INDEX `fk_Passengers_Transactions1_idx` (`Transactions_idTransactions` ASC),
  CONSTRAINT `fk_Passengers_Transactions1`
    FOREIGN KEY (`Transactions_idTransactions`)
    REFERENCES `AirlineManagement`.`Transactions` (`idTransactions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  PRIMARY KEY (`idAirCrafts`, `Flight_Schedule_idFlight_Schedule`),
  INDEX `fk_AirCrafts_Flight_Schedule1_idx` (`Flight_Schedule_idFlight_Schedule` ASC),
  CONSTRAINT `fk_AirCrafts_Flight_Schedule1`
    FOREIGN KEY (`Flight_Schedule_idFlight_Schedule`)
    REFERENCES `AirlineManagement`.`Flight_Schedule` (`idFlight_Schedule`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  PRIMARY KEY (`idAirFare`, `Flight_Schedule_idFlight_Schedule`, `Flight_Schedule_Transactions_idTransactions`),
  INDEX `fk_AirFare_Flight_Schedule1_idx` (`Flight_Schedule_idFlight_Schedule` ASC),
  CONSTRAINT `fk_AirFare_Flight_Schedule1`
    FOREIGN KEY (`Flight_Schedule_idFlight_Schedule`)
    REFERENCES `AirlineManagement`.`Flight_Schedule` (`idFlight_Schedule`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  PRIMARY KEY (`idContact_Details`, `Passengers_idPassengers`),
  INDEX `fk_Contact_Details_Passengers1_idx` (`Passengers_idPassengers` ASC),
  CONSTRAINT `fk_Contact_Details_Passengers1`
    FOREIGN KEY (`Passengers_idPassengers`)
    REFERENCES `AirlineManagement`.`Passengers` (`idPassengers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  UNIQUE INDEX `RouteCode_UNIQUE` (`RouteCode` ASC),
  INDEX `fk_Route_AirFare1_idx` (`AirFare_idAirFare` ASC),
  CONSTRAINT `fk_Route_AirFare1`
    FOREIGN KEY (`AirFare_idAirFare`)
    REFERENCES `AirlineManagement`.`AirFare` (`idAirFare`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  PRIMARY KEY (`idEmployee`, `Transactions_idTransactions`),
  INDEX `fk_Employee_Transactions1_idx` (`Transactions_idTransactions` ASC),
  CONSTRAINT `fk_Employee_Transactions1`
    FOREIGN KEY (`Transactions_idTransactions`)
    REFERENCES `AirlineManagement`.`Transactions` (`idTransactions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  PRIMARY KEY (`idBranches`, `Employee_idEmployee`, `Employee_Transactions_idTransactions`),
  INDEX `fk_Branches_Employee1_idx` (`Employee_idEmployee` ASC, `Employee_Transactions_idTransactions` ASC),
  CONSTRAINT `fk_Branches_Employee1`
    FOREIGN KEY (`Employee_idEmployee` , `Employee_Transactions_idTransactions`)
    REFERENCES `AirlineManagement`.`Employee` (`idEmployee` , `Transactions_idTransactions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  PRIMARY KEY (`idState`, `Branches_idBranches`, `Branches_Employee_idEmployee`, `Branches_Employee_Transactions_idTransactions`, `Contact_Details_idContact_Details`),
  INDEX `fk_State_Branches1_idx` (`Branches_idBranches` ASC, `Branches_Employee_idEmployee` ASC, `Branches_Employee_Transactions_idTransactions` ASC),
  INDEX `fk_State_Contact_Details1_idx` (`Contact_Details_idContact_Details` ASC),
  CONSTRAINT `fk_State_Branches1`
    FOREIGN KEY (`Branches_idBranches` , `Branches_Employee_idEmployee` , `Branches_Employee_Transactions_idTransactions`)
    REFERENCES `AirlineManagement`.`Branches` (`idBranches` , `Employee_idEmployee` , `Employee_Transactions_idTransactions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_State_Contact_Details1`
    FOREIGN KEY (`Contact_Details_idContact_Details`)
    REFERENCES `AirlineManagement`.`Contact_Details` (`idContact_Details`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  PRIMARY KEY (`idCountries`, `State_idState`, `State_Branches_idBranches`, `State_Branches_Employee_idEmployee`, `State_Branches_Employee_Transactions_idTransactions`),
  INDEX `fk_Countries_State1_idx` (`State_idState` ASC, `State_Branches_idBranches` ASC, `State_Branches_Employee_idEmployee` ASC, `State_Branches_Employee_Transactions_idTransactions` ASC),
  CONSTRAINT `fk_Countries_State1`
    FOREIGN KEY (`State_idState` , `State_Branches_idBranches` , `State_Branches_Employee_idEmployee` , `State_Branches_Employee_Transactions_idTransactions`)
    REFERENCES `AirlineManagement`.`State` (`idState` , `Branches_idBranches` , `Branches_Employee_idEmployee` , `Branches_Employee_Transactions_idTransactions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  PRIMARY KEY (`idCharges`, `Transactions_idTransactions`, `Branches_idBranches`, `Branches_Employee_idEmployee`, `Branches_Employee_Transactions_idTransactions`),
  INDEX `fk_Charges_Transactions_idx` (`Transactions_idTransactions` ASC),
  INDEX `fk_Charges_Branches1_idx` (`Branches_idBranches` ASC, `Branches_Employee_idEmployee` ASC, `Branches_Employee_Transactions_idTransactions` ASC),
  CONSTRAINT `fk_Charges_Transactions`
    FOREIGN KEY (`Transactions_idTransactions`)
    REFERENCES `AirlineManagement`.`Transactions` (`idTransactions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Charges_Branches1`
    FOREIGN KEY (`Branches_idBranches` , `Branches_Employee_idEmployee` , `Branches_Employee_Transactions_idTransactions`)
    REFERENCES `AirlineManagement`.`Branches` (`idBranches` , `Employee_idEmployee` , `Employee_Transactions_idTransactions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  PRIMARY KEY (`idDiscount`, `Transactions_idTransactions`),
  INDEX `fk_Discount_Transactions1_idx` (`Transactions_idTransactions` ASC),
  CONSTRAINT `fk_Discount_Transactions1`
    FOREIGN KEY (`Transactions_idTransactions`)
    REFERENCES `AirlineManagement`.`Transactions` (`idTransactions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
