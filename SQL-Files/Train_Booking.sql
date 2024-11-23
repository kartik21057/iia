-- Create a database
drop database train_booking;

CREATE DATABASE train_booking;

-- Use the newly created database
USE train_booking;


-- Create a table for train stations
CREATE TABLE Station (
    Station_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    City VARCHAR(50),
    County VARCHAR(50),
    Code VARCHAR(5)
);

-- Create a table for trains
CREATE TABLE Trains (
    Train_ID INT PRIMARY KEY,
    Train_Name VARCHAR(100) NOT NULL,
    Departure_Station INT,
    Arrival_Station INT,
    Departure_Time DATETIME,
    Arrival_Time DATETIME,
    Arrival_Platform VARCHAR(10),
    Duration INT,
    FOREIGN KEY (Departure_Station) REFERENCES Station(Station_ID),
    FOREIGN KEY (Arrival_Station) REFERENCES Station(Station_ID)
);

CREATE TABLE Class (
    Class_Name VARCHAR(10) PRIMARY KEY,
    Price DECIMAL(10, 2),
    Capacity INT,
	Class_Code VARCHAR(5),
    Train_ID INT,
    FOREIGN KEY (Train_ID) REFERENCES Trains(Train_ID)
);
-- Create a table for coupons
CREATE TABLE Coupons (
    Coupon VARCHAR(20) PRIMARY KEY,
    Discount_Percentage DECIMAL(5, 2)
);

-- Create a table for passengers
CREATE TABLE Passengers (
    Passenger_ID INT PRIMARY KEY AUTO_INCREMENT,
    F_Name VARCHAR(50),
    L_Name VARCHAR(50),
    Email VARCHAR(100),
	Gender VARCHAR(10),
    Phone_Number VARCHAR(20)
);

CREATE TABLE Booking (
    Booking_ID INT PRIMARY KEY AUTO_INCREMENT,
    Train_ID INT,
    Class_Name VARCHAR(10),
    Booking_Time DATETIME,
    Total_Amount DECIMAL(10, 2),
    Coupon_ID VARCHAR(20),
    Customer_ID INT,
    Booked_By VARCHAR(10),
    FOREIGN KEY (Train_ID) REFERENCES Trains(Train_ID),
    FOREIGN KEY (Class_Name) REFERENCES Class(Class_Name),
    FOREIGN KEY (Coupon_ID) REFERENCES Coupons(Coupon),
    FOREIGN KEY (Customer_ID) REFERENCES Passengers(Passenger_ID)
);

select * from Coupons;
Select * from Passengers;
Insert into Coupons values ( "NaN" , 0);

INSERT INTO `Station` VALUES
(-1,'---','---','---','---');
INSERT INTO `Trains` VALUES
(-1,'---',-1,-1,'1900-01-01 00:00:00','1900-01-01 00:00:00',-1,-1);