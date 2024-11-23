-- Drop database if exists ViewDb;
-- CREATE DATABASE ViewDB;

use ViewDB;

drop table if exists Accommodation ;
select * from flights;
CREATE table accommodation AS
SELECT
    Hotel.hotel_ID AS accommodation_ID,
    hotel_name AS accommodation_name,
    address AS accommodation_address,
    city AS accommodation_city,
    Capacity AS accommodation_capacity,
    Rating AS accommodation_rating,
    Description AS accommodation_description,
    photourl AS accommodation_photourl,
    'Hotel' AS accommodation_type,
    Room.Room_type AS room_type, 
    Room.Cost AS Price
FROM
    Hotel_Booking.Hotel
LEFT JOIN
    Hotel_Booking.Room ON Hotel.hotel_ID = Room.Hotel_ID 
UNION 
SELECT
    Home_ID AS accommodation_ID,
    'Homestay' AS accommodation_name,
    Address AS accommodation_address,
    City AS accommodation_city,
    Capacity AS accommodation_capacity,
    Rating AS accommodation_rating,
    Description AS accommodation_description,
    '' AS accommodation_photourl,
    'Homestay' AS accommodation_type,
    'HomeStays' AS room_type,
    Home_Rent AS Price
FROM
    homestay_booking.Home;


select * from accommodation;
    

