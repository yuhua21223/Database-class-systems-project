   -- Script name: inserts.sql
   -- Author:   Yuhua Wu
   -- Purpose:     insert sample data to test the integrity of this database system
   
   -- Each table in your database must have at least three inserts.


-- the database used to insert the data into.
-- SET SQL_SAFE_UPDATES = 0;
   USE AirlineManagement; 
   
      -- Transactions table inserts
       INSERT INTO Transactions (idTransactions, BookingDate, DepartureDate, Passenger, Flight, Type, Employee, Chargers, Discount, Total ) VALUES 
      (3 , '2000-03-27' ,  '2000-03-27'   , 4,5,6,7,8,9,10 );
      
    --  INSERT INTO Discount(idDiscount, Title, Amount, Description, Transactions_idTransactions) values (1, "hello", 12, 12, 1); 

   
      -- Add Employeeress table inserts
      INSERT INTO Employee (idEmployee, Name, Address, Branch, Designation, Email, Telephone, ExtesionNum, Transactions_idTransactions) VALUES 
      (1, 123, "Anaheim", 415 , 3,  "92780123", "92780123", 21223 , 94133);      
      
  --  Branches table inserts
    INSERT INTO Branches(idBranches , Center, Address, State, Employee_idEmployee , Employee_Transactions_idTransactions) VALUES 
   (1,"hello", "hello2" , 3, 4, 5 );  
   
   --       Discounts table inserts
    INSERT INTO Discount(idDiscount, Title, Amount, Description, Transactions_idTransactions) values (1, "hello", 12, 12, 1);
      
--       -- Charges table inserts
      INSERT INTO Charges(idCharges,Title, Amount, Description, Transactions_idTransactions, Branches_idBranches,Branches_Employee_idEmployee, Branches_Employee_Transactions_idTransactions) VALUES 
      (1, "Fare ", 32 , "hello", 12, 12,12,12);    








-- ----------------------------------------------------------------------------------------------Only Implenting the above inserts

--       -- State table inserts
--       INSERT INTO State(idState, StateName, Country) VALUES 
--       (1,"CA", "US" ), 
--       (2,"TA", "AS"  ), 
--       (3, "GW", "FS" );    
  
--       -- ContactDetails table inserts
--       INSERT INTO ContactDetails(idContact_Details, Email, Cell, Telephone ) VALUES 
--       (1,1, 12,2 ), 
--       (2,1, 12,2 ), 
--       (3,1, 12,2 );    
	  -- Route table inserts
--       INSERT INTO Route(idRoute, Airport, Destination, RouteCode, AirFare_idAirFare) VALUES 
--       (1, "CA" , "US","US", 2);    
--       -- AirFare table inserts
--       INSERT INTO AirFare(idAirFare, Route) VALUES 
--       (1,  123), 
--       (2, 32), 
--       (3, 34);    
--       -- Aircraft table inserts
--       INSERT INTO Aircraft(idAirCrafts, Capacity, ModifiedBy, ModifiedOn) VALUES 
--       (1, 1, "bob",2/21/12), 
--       (2,1, "dfgdfg",2/21/12 ), 
--       (3,1, "asdas" ,2/21/12 );    
--       -- Passengers table inserts
--       INSERT INTO Passengers(idPassengers, Name, Address, Age ) VALUES 
--       (1,"bob","asdads s" ,12), 
--       (2,"dfgdgf" ,"sadas  ", 23), 
--       (3, "basdob","sad ", 123);       
--       -- FlightSchedule table inserts
--       INSERT INTO FlightSchedule(idFlight_Schedule, FlightDate, Departure) VALUES 
--       (1,1, 12,2 ), 
--       (2,1, 12,2 ), 
--       (3,1, 12,2 );    
     
      