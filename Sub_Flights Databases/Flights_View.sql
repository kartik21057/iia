Use ViewDB;

drop table if exists flights ;

Create table flights as
Select f.flight_id AS ID, 
       "AirIndia" AS Name, 
       da.city AS Origin, 
       aa.city AS Destination, 
       f.departure_time AS Departure_Time, 
       f.arrival_time AS Arrival_Time, 
       f.duration AS Duration, 
       c.Class_Code AS Class, 
       c.Price AS Price 
 from AirIndia_Flights.Flights f 
 JOIN AirIndia_Flights.Airport da ON f.Departure_Airport_ID = da.Airport_ID
 JOIN AirIndia_Flights.Airport aa ON f.Arrival_Airport_ID = aa.Airport_ID
 LEFT JOIN AirIndia_Flights.Class c ON f.flight_id = c.Flight_ID

 Union All

 Select f.flight_id AS ID, 
       "SpiceJet" AS Name, 
       da.city AS Origin, 
       aa.city AS Destination, 
       f.departure_time AS Departure_Time, 
       f.arrival_time AS Arrival_Time, 
       f.duration AS Duration, 
       c.Class_Code AS Class, 
       c.Price AS Price 
 from SpiceJet_Flights.Flights f 
 JOIN SpiceJet_Flights.Airport da ON f.Departure_Airport_ID = da.Airport_ID
 JOIN SpiceJet_Flights.Airport aa ON f.Arrival_Airport_ID = aa.Airport_ID
 LEFT JOIN SpiceJet_Flights.Class c ON f.flight_id = c.Flight_ID

Union All

 Select f.flight_id AS ID, 
       "Indigo" AS Name, 
       da.city AS Origin, 
       aa.city AS Destination, 
       f.departure_time AS Departure_Time, 
       f.arrival_time AS Arrival_Time, 
       f.duration AS Duration, 
       c.Class_Code AS Class, 
       c.Price AS Price 
 from Indigo_Flights.Flights f 
 JOIN Indigo_Flights.Airport da ON f.Departure_Airport_ID = da.Airport_ID
 JOIN Indigo_Flights.Airport aa ON f.Arrival_Airport_ID = aa.Airport_ID
 LEFT JOIN Indigo_Flights.Class c ON f.flight_id = c.Flight_ID

 Union All
 
  Select f.flight_id AS ID, 
       "Indigo" AS Name, 
       da.city AS Origin, 
       aa.city AS Destination, 
       f.departure_time AS Departure_Time, 
       f.arrival_time AS Arrival_Time, 
       f.duration AS Duration, 
       c.Class_Code AS Class, 
       c.Price AS Price 
 from Indigo_Flights.Flights f 
 JOIN Indigo_Flights.Airport da ON f.Departure_Airport_ID = da.Airport_ID
 JOIN Indigo_Flights.Airport aa ON f.Arrival_Airport_ID = aa.Airport_ID
 LEFT JOIN Indigo_Flights.Class c ON f.flight_id = c.Flight_ID

Union All

   Select f.flight_id AS ID, 
       "Vistara" AS Name, 
       da.city AS Origin, 
       aa.city AS Destination, 
       f.departure_time AS Departure_Time, 
       f.arrival_time AS Arrival_Time, 
       f.duration AS Duration, 
       c.Class_Code AS Class, 
       c.Price AS Price 
 from Vistara_Flights.Flights f 
 JOIN Vistara_Flights.Airport da ON f.Departure_Airport_ID = da.Airport_ID
 JOIN Vistara_Flights.Airport aa ON f.Arrival_Airport_ID = aa.Airport_ID
 LEFT JOIN Vistara_Flights.Class c ON f.flight_id = c.Flight_ID

Union All
   Select f.flight_id AS ID, 
       "FlyBig" AS Name, 
       da.city AS Origin, 
       aa.city AS Destination, 
       f.departure_time AS Departure_Time, 
       f.arrival_time AS Arrival_Time, 
       f.duration AS Duration, 
       c.Class_Code AS Class, 
       c.Price AS Price 
 from FlyBig_Flights.Flights f 
 JOIN FlyBig_Flights.Airport da ON f.Departure_Airport_ID = da.Airport_ID
 JOIN FlyBig_Flights.Airport aa ON f.Arrival_Airport_ID = aa.Airport_ID
 LEFT JOIN FlyBig_Flights.Class c ON f.flight_id = c.Flight_ID ;
 
 select * from flights where name="TruJet" ;
 
 select * from flights;
 
 drop table if exists Airlines ;

 -- Create the Airlines table
CREATE TABLE Airlines (
    Airline_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100)
);
 -- Insert data into Airlines table
INSERT INTO Airlines VALUES
(1,'AirIndia'),
(2,'FlyBig'),
(3,'IndiGo Airline'),
(4,'SpiceJet'),
(5,'Vistara');
 select * from Airlines;
