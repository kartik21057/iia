use ViewDB;

drop view if exists customer_search ;



use ViewDB;

drop view if exists customer_search ;


Create view customer_search as 
select p.passenger_id as customer_id,p.F_name as F_Name,p.L_name as L_Name,p.Email as Email,p.Gender as Gender,p.phone_number as phone_number,b.Booking_ID as Booking_ID, b.Train_ID as entity_ID, b.class_Name as class, b.booking_time as booking_time, b.total_amount as total_amount, b.coupon_ID as coupon_ID, b.booked_by as booked_by,"Train" as Type from Train_Booking.Booking as b
join Train_Booking.Passengers as p
where b.customer_id = p.passenger_id

union All

select p.customer_id as customer_id,p.F_name as F_Name,p.L_name as L_Name,p.Email as Email,p.Gender as Gender,p.phone_number as phone_number,b.Booking_ID as Booking_ID, b.hotel_id as entity_ID, b.room_type as class, b.booking_date as booking_time, b.total_bill as total_amount, b.coupon as coupon_ID, b.booked_by as booked_by,"Hotel" as Type from 

(select b1.booking_id as Booking_id , b1.Customer_ID as customer_id , b1.hotel_ID as hotel_ID, b1.room_ID as room_ID, b1.booking_date as booking_date, b1.total_bill as total_bill, r.room_type as room_type, b1.coupon as coupon, b1.booked_by as booked_by from Hotel_Booking.Booking as b1 join Hotel_Booking.room as r
where r.room_num = b1.room_id and b1.hotel_id = r.hotel_id
) as b
join Hotel_Booking.customers as p
where b.customer_id = p.customer_id

union All

select p.customer_id as customer_id,p.F_name as F_Name,p.L_name as L_Name,p.Email as Email,p.Gender as Gender,p.phone_number as phone_number,b.Booking_ID as Booking_ID, b.home_ID as entity_ID, "" as class, b.booking_date as booking_time, b.total_bill as total_amount, b.coupon as coupon_ID, b.booked_by as booked_by,"Homestays" as Type from Homestay_Booking.Booking as b
join Homestay_Booking.customers as p
where b.customer_id = p.customer_id

union All

select p.passenger_id as customer_id,p.F_name as F_Name,p.L_name as L_Name,p.Email as Email,p.Gender as Gender,p.phone_number as phone_number,b.Booking_ID as Booking_ID, b.flight_ID as entity_ID, b.class_Name as class, b.booking_time as booking_time, b.total_amount as total_amount, b.coupon_ID as coupon_ID, b.booked_by as booked_by,"flight" as Type from flight_Booking.Booking as b
join flight_Booking.Passengers as p
where b.customer_id = p.passenger_id

union All

select p.passenger_id as customer_id,p.F_name as F_Name,p.L_name as L_Name,p.Email as Email,p.Gender as Gender,p.phone_number as phone_number,b.Booking_ID as Booking_ID, b.Bus_ID as entity_ID, "" as class, b.booking_datetime as booking_time, b.total_amount as total_amount, "" as coupon_ID, b.booked_by as booked_by,"Bus" as Type from Bus_Booking.Booking as b
join Bus_Booking.bus_Passengers as p
where b.passenger_id = p.passenger_id

union All

select p.customer_id as customer_id,p.F_name as F_Name,p.L_name as L_Name,p.Email as Email,p.Gender as Gender,p.phone_number as phone_number,b.Booking_ID as Booking_ID, b.Car_id as entity_ID, b.class as class, b.Booking_DateTime as booking_time, b.total_fare as total_amount, b.coupon as coupon_ID, b.booked_by as booked_by,"Cab Rental" as Type from (select DT.Car_id as Car_id ,    book.booking_ID as booking_ID, book.coupon as coupon, book.customer_ID as customer_ID, book.driver_ID as driver_ID, book.total_fare as total_fare, book.booking_datetime as booking_datetime, DT.class as class, book.booked_by as booked_by from cab_rental_booking.Booking as book join
(select driver.driver_ID as driver_ID, driver.car_ID as car_ID, driver.driver_name as driver_name, driver.total_rides as total_rides, driver.rating as rating, types.class as class, types.capacity as capacity from cab_rental_booking.Car_Driver as driver join cab_rental_booking.Car_type as types
where driver.car_id = types.car_id) as DT
where book.driver_id = DT.driver_id) as b
join cab_rental_booking.customers as p
where b.customer_id = p.customer_id ;

select * from Customer_Search;