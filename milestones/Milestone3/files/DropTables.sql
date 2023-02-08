   -- Script name: DropAllTables.sql
   -- Author:      Yuhua Wu
   -- Purpose:     Drops all Tables


SET SQL_SAFE_UPDATES = 0;
USE AirlineManagement;



SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `AirCrafts`;
DROP TABLE IF EXISTS `AirFare`;
DROP TABLE IF EXISTS `Branches`;
DROP TABLE IF EXISTS `Charges`;
DROP TABLE IF EXISTS `Contact_Details`;
DROP TABLE IF EXISTS `Countries`;
DROP TABLE IF EXISTS `Discount`;
DROP TABLE IF EXISTS `Employee`;
DROP TABLE IF EXISTS `Flight_Schedule`;
DROP TABLE IF EXISTS `Passengers`;
DROP TABLE IF EXISTS `Route`;
DROP TABLE IF EXISTS `State`;
DROP TABLE IF EXISTS `Transactions`;




SET FOREIGN_KEY_CHECKS = 1;