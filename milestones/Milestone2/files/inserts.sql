   -- Script name: inserts.sql
   -- Author:   Yuhua Wu
   -- Purpose:     insert sample data to test the integrity of this database system
   
   -- Each table in your database must have at least three inserts.


-- the database used to insert the data into.
-- SET SQL_SAFE_UPDATES = 0;
   USE AirlineManagement; 
   
      -- Account table inserts
      INSERT INTO Transactions (idTransactions, Passenger, Flight, Amount) VALUES 
      (1, 123124, 12,  23), 
      (2, 3274723, 64, 14), 
      (3, 7182342, 65, 19);

   
      -- Add Employeeress table inserts
      INSERT INTO Employee (idEmployee, Branch, city, Telephone, Email, Designation) VALUES 
      (1, 123, "Anaheim", "SF", "92780123", "sa@gmail.com" , "United States"), 
      (2, 445,"Irvine", "SF", "94117345","saasd@gmail.com" ,  "United States"), 
      (3, 345,  "Tustin", "SF", "9280045645","sfsdfa@gmail.com" ,  "United States");      
      
      -- Charges table inserts
      INSERT INTO Charges(idCharges, Title, Amount) VALUES 
      (1, "Fare ", 32), 
      (2,"Ticket ", 78 ), 
      (3, "BagWeight ", 56);    
      
      -- Discounts table inserts
      INSERT INTO Discounts(idDiscount, Amount, Description) VALUES 
      (1, 12 , "DiscountCode "), 
      (2,212 , "Free Trip " ), 
      (3, 90 , "DiscountCode90 ");    
      -- State table inserts
      INSERT INTO State(idState, StateName, Country) VALUES 
      (1,"CA", "US" ), 
      (2,"TA", "AS"  ), 
      (3, "GW", "FS" );    
      -- Branches table inserts
      INSERT INTO Branches(idBranches, Center, Address, State ) VALUES 
      (1, 12, "840 Jacksiin St " , "CA"), 
      (2,45, "345 sdfsdf St " , "FG" ), 
      (3, 23, "12312 dsfdgg St " , "DA");    
      -- ContactDetails table inserts
      INSERT INTO ContactDetails(idContact_Details, Email, Cell, Telephone ) VALUES 
      (1,1, 12,2 ), 
      (2,1, 12,2 ), 
      (3,1, 12,2 );    
	  -- Route table inserts
      INSERT INTO Route(idRoute, Airport, Destination) VALUES 
      (1, "CA" , "US"), 
      (2, "CA" , "US"), 
      (3,"CA" , "US" );    
      -- AirFare table inserts
      INSERT INTO AirFare(idAirFare, Route) VALUES 
      (1,  123), 
      (2, 32), 
      (3, 34);    
      -- Aircraft table inserts
      INSERT INTO Aircraft(idAirCrafts, Capacity, ModifiedBy, ModifiedOn) VALUES 
      (1, 1, "bob",2/21/12), 
      (2,1, "dfgdfg",2/21/12 ), 
      (3,1, "asdas" ,2/21/12 );    
      -- Passengers table inserts
      INSERT INTO Passengers(idPassengers, Name, Address, Age ) VALUES 
      (1,"bob","asdads s" ,12), 
      (2,"dfgdgf" ,"sadas  ", 23), 
      (3, "basdob","sad ", 123);       
      -- FlightSchedule table inserts
      INSERT INTO FlightSchedule(idFlight_Schedule, FlightDate, Departure) VALUES 
      (1,1, 12,2 ), 
      (2,1, 12,2 ), 
      (3,1, 12,2 );    
     
      