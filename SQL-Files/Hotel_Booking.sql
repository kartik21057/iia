drop  database if exists hotel_booking ;

CREATE DATABASE hotel_booking;
use hotel_booking;

-- Create the Hotel table
CREATE TABLE Hotel (
    hotel_ID INT PRIMARY KEY,
    hotel_name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    city  VARCHAR(30) NOT NULL,
    Capacity INT NOT NULL,
    Rating DECIMAL(3, 1) NOT NULL,
    Description TEXT NOT NULL,
    photourl VARCHAR(255) NOT NULL
);

-- Create the Room table
CREATE TABLE Room (
    Room_Num INT AUTO_INCREMENT,
    Hotel_ID INT,
    Room_type VARCHAR(255) NOT NULL,
    Cost INT NOT NULL,
    Room_Capacity INT NOT NULL,
    PRIMARY KEY (Room_Num, Hotel_ID),
    FOREIGN KEY (Hotel_ID) REFERENCES Hotel(hotel_ID)
);

-- Create a table for coupons
CREATE TABLE Coupons (
    Coupon VARCHAR(20) PRIMARY KEY,
    Discount_Percentage DECIMAL(5, 2)
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

-- Create the Booking table
CREATE TABLE Booking (
    Booking_ID INT PRIMARY KEY AUTO_INCREMENT,
    Room_ID INT,
    Booking_Date datetime,
    Total_Bill Int,
    Hotel_ID INT, 
    Coupon VARCHAR(20),
    Customer_ID INT,
    Booked_By VARCHAR(10),
    FOREIGN KEY (Hotel_ID) REFERENCES Hotel(hotel_ID),
	FOREIGN KEY (Coupon) REFERENCES Coupons(Coupon),
	Foreign Key(Customer_ID) references Customers(Customer_ID)

);
Insert into Coupons values ( "NaN" , 0);
select * from coupons;
select * from Booking;
select * from Customers;

INSERT INTO `Hotel` VALUES
(-1,'---','---','---',-1,'0','---','Images\hotel8.jpg');

INSERT INTO `Room` VALUES
(-1,-1,'---',-1,-1);


