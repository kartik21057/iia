	-- Create a database

drop database flight_booking;

CREATE DATABASE flight_booking;


use flight_booking;

-- Create the Airport table
CREATE TABLE Airport (
    Airport_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50),
    Code VARCHAR(3)
);

-- Create the Airlines table
CREATE TABLE Airlines (
    Airline_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Country VARCHAR(50),
    Rating DECIMAL(3, 1)
);

-- Create the Flight_Coupons table
CREATE TABLE Flight_Coupons (
    Coupon VARCHAR(20) PRIMARY KEY,
    Discount_Percentage DECIMAL(5, 2)
);

-- Create the Flights table
CREATE TABLE Flights (
    Flight_ID INT PRIMARY KEY,
    Airline_ID INT,
    Departure_Airport_ID INT,
    Arrival_Airport_ID INT,
    Departure_Time DATETIME,
    Arrival_Time DATETIME,
    Duration INT,
    FOREIGN KEY (Airline_ID) REFERENCES Airlines(Airline_ID),
    FOREIGN KEY (Departure_Airport_ID) REFERENCES Airport(Airport_ID),
    FOREIGN KEY (Arrival_Airport_ID) REFERENCES Airport(Airport_ID)
);

-- Create the Class table
CREATE TABLE Class (
    Class_Name VARCHAR(10) PRIMARY KEY,
    Price DECIMAL(10, 2),
    Capacity INT,
    Class_Code VARCHAR(5),
    Flight_ID INT,
    FOREIGN KEY (Flight_ID) REFERENCES Flights(Flight_ID)
);

-- Create the Passengers table
CREATE TABLE Passengers (
    Passenger_ID INT PRIMARY KEY AUTO_INCREMENT,
    F_Name VARCHAR(50),
    L_Name VARCHAR(50),
    Email VARCHAR(100),
    Gender VARCHAR(10),
    Phone_Number VARCHAR(20)
    );

-- Create the Booking table
CREATE TABLE Booking (
    Booking_ID INT PRIMARY KEY AUTO_INCREMENT,
    Flight_ID INT,
    Class_Name VARCHAR(10),
    Booking_Time DATETIME,
    Total_Amount DECIMAL(10, 2),
    Customer_ID INT,
    Coupon_ID VARCHAR(20),
    Booked_By VARCHAR(10),
    FOREIGN KEY (Flight_ID) REFERENCES Flights(Flight_ID),
    FOREIGN KEY (Class_Name) REFERENCES Class(Class_Name),
    FOREIGN KEY (Coupon_ID) REFERENCES Flight_Coupons(Coupon),
    FOREIGN KEY (Customer_ID) REFERENCES Passengers(Passenger_ID)
);

select * from Passengers;
Select * from Booking;

Insert into Flight_Coupons values ( "Nan" , 0);

INSERT INTO Airport  (Airport_ID,Name,City,Country,Code) VALUES 
(-1,'---','---','---','---');
INSERT INTO Airlines VALUES
(-1,'---','---','0');
INSERT INTO `Flights` VALUES
(-1,-1,-1,-1,'1900-01-01 00:00:00','1900-01-01 00:00:00',-1);