drop database  if exists UserDB ;

-- Create User DB
CREATE DATABASE UserDB;

-- Use the User DB
USE UserDB;

select * from Authentication_System; 
-- Create Authentication_System table
CREATE TABLE Authentication_System (
    PhoneNumber VARCHAR(15) PRIMARY KEY,
    Password VARCHAR(100)
    
);

CREATE TABLE `User` (
  `User_Id` int NOT NULL AUTO_INCREMENT,
  `Login_Type` varchar(50) DEFAULT NULL,
  `PhoneNumber` varchar(50) NOT NULL,
  PRIMARY KEY (`User_Id`,`PhoneNumber`),
  KEY `PhoneNumber` (`PhoneNumber`),
FOREIGN KEY (PhoneNumber) REFERENCES Authentication_System(PhoneNumber)

) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
select * from user;

-- Create Customer_Details table
CREATE TABLE Customer_Details (
    PhoneNumber VARCHAR(15) PRIMARY KEY,
    F_Name VARCHAR(50),
    L_Name VARCHAR(50),
    Email VARCHAR(100),
    H_No VARCHAR(20),
    Area VARCHAR(100),
    State VARCHAR(50),
    Pin VARCHAR(10),
	FOREIGN KEY (PhoneNumber) REFERENCES User(PhoneNumber)

);




-- Create Admin_Details table
CREATE TABLE Admin_Details (
    PhoneNumber VARCHAR(15) PRIMARY KEY,
    Admin_Name VARCHAR(100),
    Email VARCHAR(100),
    H_No VARCHAR(20),
    Area VARCHAR(100),
    State VARCHAR(50),
    Pin VARCHAR(10),
    FOREIGN KEY (PhoneNumber) REFERENCES User(PhoneNumber)
);

select * from Authentication_System;

select * from user;

select * from customer_details;

insert into Authentication_System values ( '911' , '911');
insert into Authentication_System values ( '912' , '912');
insert into Authentication_System values ( '913' , '913');
insert into Authentication_System values ( '914' , '914');

insert into User (login_type , PhoneNumber) values (  'Admin' , '911');
insert into User (login_type , PhoneNumber) values (  'Admin' , '912');
insert into User (login_type , PhoneNumber) values (  'Admin' , '913');
insert into User (login_type , PhoneNumber) values (  'Admin' , '914');

insert into Admin_Details values ( '911' , 'Ashwin Sheoran' , 'ashwin20288@iiitd.ac.in' , '1'  , 'IIITD' , 'New Delhi' , '110020');
insert into Admin_Details values ( '912' , 'Sourav Goyal' , 'sourav20341@iiitd.ac.in' , '2'  , 'IIITD' , 'New Delhi' , '110020');
insert into Admin_Details values ( '913' , 'Shivam Jindal' , 'shivam20125@iiitd.ac.in' , '3'  , 'IIITD' , 'New Delhi' , '110020');
insert into Admin_Details values ( '914' , 'Vedant Patil' , 'vedant20348@iiitd.ac.in' , '4'  , 'IIITD' , 'New Delhi' , '110020');

select * from authentication_system;
