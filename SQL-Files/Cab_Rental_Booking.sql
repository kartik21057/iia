drop database Cab_Rental_Booking;
create database Cab_Rental_Booking;

use Cab_Rental_Booking;

-- drop table Cab_Coupons;
create table Cab_Coupons(
Coupon varchar(20) Primary Key,
Discount_Percentage decimal(5,2)
);

--  table Customers;
create table Customers(
Customer_ID int Primary Key AUTO_INCREMENT,
F_Name varchar(50),
L_Name varchar(50),
Phone_Number varchar(20),
Gender VARCHAR(10),
Email varchar(100)
);

-- drop table Booking;
create table Booking(
Booking_ID int Primary Key AUTO_INCREMENT,
Coupon varchar(20),
Customer_ID int,
Driver_ID int,
Total_Fare double,
Booking_DateTime datetime,
Booked_By VARCHAR(10),
Foreign Key(Customer_ID) references Customers(Customer_ID),
Foreign Key(Coupon) references Cab_Coupons(Coupon)
);

-- drop table Car_Type;
create table Car_Type(
Car_ID varchar(15) Primary Key,
Class varchar(30),
Cost double,
Capacity int
);

-- drop table Car_Driver
create table Car_Driver(
Driver_ID int Primary key,
Car_ID varchar(15),
Driver_Name varchar(50),
Total_Rides int,
Rating double,
Phone_Number varchar(20),
City varchar(20),
Foreign Key(Car_ID) references Car_Type(Car_ID)
);

Insert into Cab_Coupons values ( "NaN" , 0);
select * from Customers;


INSERT INTO `Car_Type` VALUES
('---','---',-1,-1);

INSERT INTO `Car_Driver` VALUES
(-1,'---','---',-1,'0',-1,'---');