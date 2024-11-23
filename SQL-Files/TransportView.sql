-- Drop database if exists ViewDb;
-- CREATE DATABASE ViewDB;

use ViewDB;
drop table if exists ModeOfTransportation ;
-- select * from flights;
CREATE table ModeOfTransportation AS
SELECT 'Flight' AS Mode,
       ID,
       Name,
       Origin,
       Destination,
       Departure_Time,
       Arrival_Time,
       NULL AS Duration, 
       Class,
       Price
FROM flights

UNION all

SELECT 'Train' AS Mode, 
       t.Train_ID AS ID, 
       t.Train_Name AS Name, 
       os.city AS Origin, 
       ds.city AS Destination, 
       t.Departure_Time AS Departure_Time, 
       t.Arrival_Time AS Arrival_Time, 
       NULL AS Duration, -- Add NULL for missing column
       cl.Class_Code AS Class, 
       cl.Price AS Price
FROM train_booking.Trains t
JOIN train_booking.Station os ON t.Departure_Station = os.Station_ID
JOIN train_booking.Station ds ON t.Arrival_Station = ds.Station_ID
LEFT JOIN train_booking.Class cl ON t.Train_ID = cl.Train_ID

UNION
	
SELECT 'Bus' AS Mode, 
       b.Bus_ID AS ID, 
       b.Bus_Name AS Name, 
       s1.city AS Origin, 
       s2.city AS Destination, 
       b.Departure_Time AS Departure_Time, 
       b.Arrival_Time AS Arrival_Time, 
       NULL AS Duration, -- Add NULL for missing column
       b.Class AS Class, 
       b.Price AS Price
FROM bus_booking.Buses b
JOIN bus_booking.bus_stations s1 ON b.Origin_Station_ID = s1.Station_ID
JOIN bus_booking.bus_stations s2 ON b.Destination_Station_ID = s2.Station_ID;






-- CREATE table ModeOfTransportation AS
-- SELECT 'Flight' AS Mode, 
--        f.flight_id AS ID, 
--        al.name AS Name, 
--        da.city AS Origin, 
--        aa.city AS Destination, 
--        f.departure_time AS Departure_Time, 
--        f.arrival_time AS Arrival_Time, 
--        f.duration AS Duration, 
--        c.Class_Code AS Class, 
--        c.Price AS Price
-- FROM flight_booking.Flights f
-- JOIN flight_booking.Airport da ON f.Departure_Airport_ID = da.Airport_ID
-- JOIN flight_booking.Airport aa ON f.Arrival_Airport_ID = aa.Airport_ID
-- JOIN flight_booking.Airlines al ON f.Airline_ID = al.Airline_ID
-- LEFT JOIN flight_booking.Class c ON f.flight_id = c.Flight_ID

-- UNION

-- SELECT 'Train' AS Mode, 
--        t.Train_ID AS ID, 
--        t.Train_Name AS Name, 
--        os.city AS Origin, 
--        ds.city AS Destination, 
--        t.Departure_Time AS Departure_Time, 
--        t.Arrival_Time AS Arrival_Time, 
--        NULL AS Duration, -- Add NULL for missing column
--        cl.Class_Code AS Class, 
--        cl.Price AS Price
-- FROM train_booking.Trains t
-- JOIN train_booking.Station os ON t.Departure_Station = os.Station_ID
-- JOIN train_booking.Station ds ON t.Arrival_Station = ds.Station_ID
-- LEFT JOIN train_booking.Class cl ON t.Train_ID = cl.Train_ID

-- UNION
-- 	
-- SELECT 'Bus' AS Mode, 
--        b.Bus_ID AS ID, 
--        b.Bus_Name AS Name, 
--        s1.city AS Origin, 
--        s2.city AS Destination, 
--        b.Departure_Time AS Departure_Time, 
--        b.Arrival_Time AS Arrival_Time, 
--        NULL AS Duration, -- Add NULL for missing column
--        b.Class AS Class, 
--        b.Price AS Price
-- FROM bus_booking.Buses b
-- JOIN bus_booking.bus_stations s1 ON b.Origin_Station_ID = s1.Station_ID
-- JOIN bus_booking.bus_stations s2 ON b.Destination_Station_ID = s2.Station_ID;


use ViewDB;

SELECT * FROM ModeOfTransportation WHERE Destination = 'Chandigarh' ;

SELECT Mode, ID, Name, Origin, Destination, Departure_Time, Arrival_Time, Class, Price 
FROM ModeOfTransportation WHERE Origin = 'Delhi' AND Destination = 'Srinagar' AND Departure_Time >= '2023-10-28' ;

SELECT Mode, ID, Class, Price FROM ModeOfTransportation WHERE Mode = 'Bus'  AND Name = 'Capital' ;



