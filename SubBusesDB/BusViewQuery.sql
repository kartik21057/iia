
 use ViewDB;
Drop table  if exists Buses ;
Create Table Buses as

SELECT b.Bus_ID AS ID,
       b.Bus_Name AS Name, 
       "LotusDream" as Travels,
       s1.city AS Origin, 
       s2.city AS Destination, 
       b.Departure_Time AS Departure_Time, 
       b.Arrival_Time AS Arrival_Time, 
       b.duration AS Duration,
       b.Class AS Class, 
       b.Price AS Price
FROM LotusDream_Travels.Buses b
JOIN LotusDream_Travels.bus_stations s1 ON b.Origin_Station_ID = s1.Station_ID
JOIN LotusDream_Travels.bus_stations s2 ON b.Destination_Station_ID = s2.Station_ID

Union

SELECT b.Bus_ID AS ID,
       b.Bus_Name AS Name, 
       "MysticIndia" as Travels,
       s1.city AS Origin, 
       s2.city AS Destination, 
       b.Departure_Time AS Departure_Time, 
       b.Arrival_Time AS Arrival_Time, 
       b.duration AS Duration,
       b.Class AS Class, 
       b.Price AS Price
FROM MysticIndia_Travels.Buses b
JOIN MysticIndia_Travels.bus_stations s1 ON b.Origin_Station_ID = s1.Station_ID
JOIN MysticIndia_Travels.bus_stations s2 ON b.Destination_Station_ID = s2.Station_ID

Union

SELECT b.Bus_ID AS ID,
       b.Bus_Name AS Name, 
       "RoadExplorer" as Travels,
       s1.city AS Origin, 
       s2.city AS Destination, 
       b.Departure_Time AS Departure_Time, 
       b.Arrival_Time AS Arrival_Time, 
       b.duration AS Duration,
       b.Class AS Class, 
       b.Price AS Price
FROM RoadExplorers_Travels.Buses b
JOIN RoadExplorers_Travels.bus_stations s1 ON b.Origin_Station_ID = s1.Station_ID
JOIN RoadExplorers_Travels.bus_stations s2 ON b.Destination_Station_ID = s2.Station_ID

Union

SELECT b.Bus_ID AS ID,
       b.Bus_Name AS Name, 
       "Express" as Travels,
       s1.city AS Origin, 
       s2.city AS Destination, 
       b.Departure_Time AS Departure_Time, 
       b.Arrival_Time AS Arrival_Time, 
       b.duration AS Duration,
       b.Class AS Class, 
       b.Price AS Price
FROM Express_Travels.Buses b
JOIN Express_Travels.bus_stations s1 ON b.Origin_Station_ID = s1.Station_ID
JOIN Express_Travels.bus_stations s2 ON b.Destination_Station_ID = s2.Station_ID;

select * from Buses;
select * from Buses where Destination = "Srinagar";

Use ViewDB;
 drop table if exists Travels ;

 -- Create the Airlines table
CREATE TABLE Travels (
    Travel_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100)
);
 -- Insert data into Airlines table
INSERT INTO Travels VALUES
(1,'Express'),
(2,'lotusDream'),
(3,'MysticIndia'),
(4,'RoadExplorer');
 select * from Travels;
