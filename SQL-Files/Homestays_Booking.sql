
drop database homestay_booking;

CREATE DATABASE homestay_booking;

USE homestay_booking;

CREATE TABLE Home (
    Home_ID INT PRIMARY KEY AUTO_INCREMENT,
    Capacity INT NOT NULL,
    Rating DECIMAL(3, 1) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(255) NOT NULL,
    Home_Rent DECIMAL(10, 2) NOT NULL,
    Description TEXT
);

CREATE TABLE Booking (
    Booking_ID INT PRIMARY KEY AUTO_INCREMENT,
    Home_ID INT NOT NULL,
     Booking_Date datetime,
    Customer_ID INT NOT NULL,
    Total_Bill DECIMAL(10, 2) NOT NULL,
    Coupon VARCHAR(20),
    Booked_By VARCHAR(10),
    FOREIGN KEY (Home_ID) REFERENCES Home(Home_ID)
);

CREATE TABLE Coupon (
    Coupon VARCHAR(20) PRIMARY KEY,
    Discount_Percentage DECIMAL(5, 2) NOT NULL
);

create table Customers(
Customer_ID int Primary Key AUTO_INCREMENT,
F_Name varchar(50),
L_Name varchar(50),
Phone_Number varchar(20),
Gender VARCHAR(10),
Email varchar(100)
);

select * from Home;
Insert into Coupon values ( "NaN" , 0);
select * from coupon;

select * from booking;
select * from Customers;

insert into Home (Home_ID, Capacity, Rating, Address, City, Home_Rent, Description) values (-1, -1, 0.0, '---', '---', -1, '---');
