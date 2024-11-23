drop database Bus_Booking;
create database Bus_Booking;

use Bus_Booking;

-- drop table bus_Stations
create table bus_stations(
Station_ID int Primary Key,
Station_Name varchar(50),
City varchar(50),
Country varchar(50),
Area varchar(50)
);

-- drop table Bus_Passengers
create table Bus_Passengers(
Passenger_ID int primary key AUTO_INCREMENT,
F_Name varchar(50),
L_Name varchar(50),
Email varchar(50),    
Gender VARCHAR(10),
Phone_Number varchar(20)
);

-- drop table Driver
create table Driver(
Driver_ID int primary key,
Driver_Name varchar(50),
Rating double,
Phone_Number varchar(20)
);

-- drop table Buses
create table Buses(
Bus_ID int primary key,
Bus_Name varchar(80),
Bus_Number_Plate varchar(50),
Bus_Color varchar(20),
Bus_Brand varchar(30),
Class varchar(20),
Departure_Time datetime,
Arrival_Time datetime,
Duration INT,
Price double,
Origin_Station_ID int,
Destination_Station_ID int,
Driver_ID int,
Foreign Key(Origin_Station_ID) references bus_stations(Station_ID),
foreign key(Destination_Station_ID) references bus_stations(Station_ID),
foreign key(Driver_ID) references Driver(Driver_ID)
);

-- drop table Bus_Bookings
create table Booking(
Booking_ID int Primary Key AUTO_INCREMENT,
Booking_Datetime datetime,
Total_amount double,
Passenger_ID int,
Bus_ID int,
Booked_By VARCHAR(10),
Foreign Key(Passenger_ID) references Bus_Passengers(Passenger_ID),
Foreign key(Bus_ID) references Buses(Bus_ID)
);
select * from Bus_Passengers;
Select * from Bus_bookings;

INSERT INTO `bus_stations` VALUES
(-1,'---','---','---','---');

INSERT INTO `Driver` VALUES
(-1,'---','0',-1);

INSERT INTO `Buses` VALUES
(-1,'---','---','---','---','---','1900-01-01 00:00:00','1900-01-01 00:00:00',-1,-1,-1,-1,-1);