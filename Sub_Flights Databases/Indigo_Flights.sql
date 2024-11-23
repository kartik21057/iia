-- database
drop database IF exists Indigo_flights;
create database Indigo_flights;
use Indigo_flights;

-- Create the Airport table
CREATE TABLE Airport (
    Airport_ID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50),
    Code VARCHAR(3)
);

-- Create the Flight_Coupons table
CREATE TABLE Flight_Coupons (
    Coupon VARCHAR(20) PRIMARY KEY,
    Discount_Percentage DECIMAL(5, 2)
);

-- Create the Flights table
CREATE TABLE Flights (
    Flight_ID INT PRIMARY KEY AUTO_INCREMENT,
    Departure_Airport_ID INT,
    Arrival_Airport_ID INT,
    Departure_Time DATETIME,
    Arrival_Time DATETIME,
    Duration INT,
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


-- Data
-- Insert data into Flight_Coupons table
INSERT INTO Flight_Coupons (Coupon, Discount_Percentage)
VALUES
    ('FLIGHT10', 10.00),
    ('NEW75', 7.50);
-- Airport
INSERT INTO Airport(Airport_ID,Name,City,Country,Code) VALUES 
(1,'Indira Gandhi International Airport','Delhi','INDIA','DEL'),
(2,'Chhatrapati Shivaji Maharaj International Airport','Mumbai','INDIA','BOM'),
(3,'Kempegowda International Airport','Bangalore','INDIA','BLR'),
(4,'Chennai International Airport','Chennai','INDIA','MAA'),
(5,'Netaji Subhas Chandra Bose International Airport','Kolkata','INDIA','CCU'),
(6,'Rajiv Gandhi International Airport','Hyderabad','INDIA','HYD'),
(7,'Cochin International Airport','Kochi','INDIA','COK'),
(8,'Pune Airport','Pune','INDIA','PNQ'),
(9,'Goa International Airport','Dabolim','INDIA','GOI'),
(10,'Sardar Vallabhbhai Patel International Airport','Ahmedabad','INDIA','AMD'),
(11,'Jaipur International Airport','Jaipur','INDIA','JAI'),
(12,'Thiruvananthapuram International Airport','Thiruvananthapuram','INDIA','TRV'),
(13,'Ahmedabad Airport','Ahmedabad','INDIA','AMD'),
(14,'Biju Patnaik International Airport','Bhubaneswar','INDIA','BBI'),
(15,'Amritsar International Airport','Amritsar','INDIA','ATQ'),
(16,'Guwahati International Airport','Guwahati','INDIA','GAU'),
(17,'Mangalore Airport','Mangalore','INDIA','IXE'),
(18,'Visakhapatnam International Airport','Visakhapatnam','INDIA','VTZ'),
(19,'Lucknow Airport','Lucknow','INDIA','LKO'),
(20,'Chandigarh International Airport','Chandigarh','INDIA','IXC'),
(21,'Indore Airport','Indore','INDIA','IDR'),
(22,'Trichy International Airport','Tiruchirappalli','INDIA','TRZ'),
(23,'Calicut International Airport','Kozhikode','INDIA','CCJ'),
(24,'Vijayawada International Airport','Vijayawada','INDIA','VGA'),
(25,'Varanasi Airport','Varanasi','INDIA','VNS'),
(26,'Bagdogra Airport','Bagdogra','INDIA','IXB'),
(27,'Srinagar International Airport','Srinagar','INDIA','SXR'),
(28,'Coimbatore International Airport','Coimbatore','INDIA','CJB'),
(29,'Madurai International Airport','Madurai','INDIA','IXM'),
(30,'Trivandrum International Airport','Thiruvananthapuram','INDIA','TRV'),
(31,'Jodhpur Airport','Jodhpur','INDIA','JDH'),
(32,'Leh Kushok Bakula Rimpochee Airport','Leh','INDIA','IXL'),
(33,'Bhopal Airport','Bhopal','INDIA','BHO'),
(34,'Dehradun Airport','Dehradun','INDIA','DED'),
(35,'Jammu Airport','Jammu','INDIA','IXJ'),
(36,'Rajkot Airport','Rajkot','INDIA','RAJ'),
(37,'Agartala Airport','Agartala','INDIA','IXA'),
(38,'Silchar Airport','Silchar','INDIA','IXS'),
(39,'Dibrugarh Airport','Dibrugarh','INDIA','DIB'),
(40,'Imphal Airport','Imphal','INDIA','IMF'),
(41,'Aizawl Airport','Aizawl','INDIA','AJL'),
(42,'Port Blair Airport','Port Blair','INDIA','IXZ'),
(43,'Udaipur Airport','Udaipur','INDIA','UDR'),
(44,'Raipur Airport','Raipur','INDIA','RPR'),
(45,'Patna Airport','Patna','INDIA','PAT'),
(46,'Ranchi Airport','Ranchi','INDIA','IXR'),
(47,'Jabalpur Airport','Jabalpur','INDIA','JLR'),
(48,'Allahabad Airport','Prayagraj','INDIA','IXD'),
(49,'Kanpur Airport','Kanpur','INDIA','KNU'),
(50,'Mysore Airport','Mysore','INDIA','MYQ'),
(51,'Surat Airport','Surat','INDIA','STV'),
(52,'Belgaum Airport','Belgaum','INDIA','IXG'),
(53,'Dharamshala Airport','Dharamshala','INDIA','DHM'),
(54,'Bhavnagar Airport','Bhavnagar','INDIA','BHU'),
(55,'Tirupati Airport','Tirupati','INDIA','TIR'),
(56,'Warangal Airport','Warangal','INDIA','WGC'),
(57,'Gwalior Airport','Gwalior','INDIA','GWL'),
(58,'Shillong Airport','Shillong','INDIA','SHL'),
(59,'Hubli Airport','Hubli','INDIA','HBX'),
(60,'Ludhiana Airport','Ludhiana','INDIA','LUH'),
(61,'Kannur International Airport','Kannur','INDIA','CNN'),
(62,'Pantnagar Airport','Pantnagar','INDIA','PGH'),
(63,'Shirdi Airport','Shirdi','INDIA','SAG'),
(64,'Kullu Manali Airport','Kullu','INDIA','KUU'),
(65,'Jaisalmer Airport','Jaisalmer','INDIA','JSA'),
(66,'Kadapa Airport','Kadapa','INDIA','CDP'),
(67,'Nagpur Airport','Nagpur','INDIA','NAG'),
(68,'Jhansi Airport','Jhansi','INDIA','JHS'),
(69,'Muzaffarpur Airport','Muzaffarpur','INDIA','MZU'),
(70,'Keshod Airport','Keshod','INDIA','IXK'),
(71,'Balurghat Airport','Balurghat','INDIA','RGH'),
(72,'Bareilly Airport','Bareilly','INDIA','BEK'),
(73,'Birsa Munda Airport','Ranchi','INDIA','IXR'),
(74,'Kolhapur Airport','Kolhapur','INDIA','KLH'),
(75,'Sheikh ul Alam International Airport','Srinagar','INDIA','SXR');

-- Flights
INSERT INTO `Flights` VALUES
(1,16,5,'2023-10-29 23:50:01','2023-10-30 06:56:01',426),
(2,6,71,'2023-10-13 17:08:01','2023-10-14 01:50:01',522),
(3,54,64,'2023-09-13 09:09:34','2023-09-13 14:57:34',348),
(4,53,69,'2023-10-24 04:57:22','2023-10-24 11:33:22',396),
(5,27,55,'2023-09-28 09:38:51','2023-09-28 17:55:51',497),
(6,43,22,'2023-09-13 09:51:03','2023-09-13 17:31:03',460),
(7,5,1,'2023-10-06 14:02:24','2023-10-06 19:13:24',311),
(8,16,64,'2023-10-01 08:48:29','2023-10-01 16:47:29',479),
(9,24,39,'2023-09-21 09:20:05','2023-09-21 16:50:05',450),
(10,42,60,'2023-10-15 23:23:44','2023-10-16 05:17:44',354),
(11,26,16,'2023-10-28 20:53:09','2023-10-29 04:29:09',456),
(12,54,44,'2023-10-12 19:14:11','2023-10-13 00:35:11',321),
(13,41,73,'2023-09-08 04:40:33','2023-09-08 12:33:33',473),
(14,55,32,'2023-10-06 06:53:07','2023-10-06 14:39:07',466),
(15,75,11,'2023-09-21 07:25:06','2023-09-21 15:53:06',508),
(16,67,12,'2023-09-13 05:47:59','2023-09-13 13:22:59',455),
(17,33,28,'2023-09-15 09:10:33','2023-09-15 15:31:33',381),
(18,66,22,'2023-10-11 21:26:58','2023-10-12 05:23:58',477),
(19,48,15,'2023-10-02 15:55:19','2023-10-02 23:49:19',474),
(20,16,59,'2023-10-25 01:59:43','2023-10-25 09:36:43',457),
(21,58,9,'2023-09-23 00:49:23','2023-09-23 06:55:23',366),
(22,28,22,'2023-10-09 00:34:09','2023-10-09 06:05:09',331),
(23,20,68,'2023-10-10 08:31:19','2023-10-10 16:56:19',505),
(24,71,24,'2023-10-17 01:39:10','2023-10-17 08:43:10',424),
(25,58,37,'2023-10-22 10:15:49','2023-10-22 15:17:49',302),
(26,27,58,'2023-10-02 17:27:30','2023-10-03 01:02:30',455),
(27,70,60,'2023-09-19 07:57:32','2023-09-19 16:37:32',520),
(28,11,55,'2023-10-07 17:46:17','2023-10-08 02:26:17',520),
(29,71,13,'2023-10-27 13:47:22','2023-10-27 21:51:22',484),
(30,19,28,'2023-10-08 07:04:19','2023-10-08 13:02:19',358),
(31,22,31,'2023-09-07 23:39:22','2023-09-08 08:20:22',521),
(32,60,50,'2023-09-05 10:16:41','2023-09-05 16:43:41',387),
(33,6,3,'2023-09-01 06:03:58','2023-09-01 12:20:58',377),
(34,39,27,'2023-09-18 21:59:07','2023-09-19 04:56:07',417),
(35,24,4,'2023-10-27 18:15:11','2023-10-27 23:16:11',301),
(36,31,67,'2023-10-13 05:09:50','2023-10-13 10:41:50',332),
(37,5,57,'2023-09-27 03:56:57','2023-09-27 10:23:57',387),
(38,37,8,'2023-10-21 11:11:14','2023-10-21 18:05:14',414),
(39,16,27,'2023-09-22 03:06:07','2023-09-22 08:23:07',317),
(40,33,12,'2023-09-03 00:34:51','2023-09-03 05:41:51',307),
(41,52,69,'2023-09-02 14:24:50','2023-09-02 22:04:50',460),
(42,54,61,'2023-09-20 17:31:24','2023-09-21 00:59:24',448),
(43,42,48,'2023-10-17 02:11:11','2023-10-17 07:37:11',326),
(44,63,10,'2023-09-26 14:30:25','2023-09-26 21:06:25',396),
(45,65,27,'2023-10-22 07:33:54','2023-10-22 14:59:54',446),
(46,58,5,'2023-09-08 23:33:43','2023-09-09 05:11:43',338),
(47,42,47,'2023-09-19 04:35:07','2023-09-19 11:30:07',415),
(48,48,60,'2023-09-21 22:13:53','2023-09-22 05:35:53',442),
(49,35,43,'2023-10-24 10:15:45','2023-10-24 17:52:45',457),
(50,23,8,'2023-09-19 06:36:49','2023-09-19 14:44:49',488),
(51,57,6,'2023-09-18 18:12:17','2023-09-19 01:47:17',455),
(52,39,17,'2023-10-25 21:39:19','2023-10-26 03:23:19',344),
(53,61,73,'2023-09-19 08:01:00','2023-09-19 14:43:00',402),
(54,57,18,'2023-10-10 07:19:23','2023-10-10 15:36:23',497),
(55,58,57,'2023-09-11 14:55:08','2023-09-11 20:39:08',344),
(56,70,44,'2023-10-26 19:42:28','2023-10-27 01:30:28',348),
(57,27,11,'2023-09-18 06:39:42','2023-09-18 13:36:42',417),
(58,60,10,'2023-09-29 00:20:51','2023-09-29 05:41:51',321),
(59,33,67,'2023-10-29 08:35:08','2023-10-29 16:10:08',455),
(60,41,58,'2023-09-29 05:02:42','2023-09-29 12:43:42',461),
(61,35,65,'2023-09-27 14:21:15','2023-09-27 23:19:15',538),
(62,44,54,'2023-10-25 18:52:09','2023-10-26 03:36:09',524),
(63,65,55,'2023-09-07 14:01:48','2023-09-07 20:55:48',414),
(64,3,27,'2023-10-27 21:26:53','2023-10-28 04:33:53',427),
(65,19,14,'2023-09-26 02:24:12','2023-09-26 10:24:12',480),
(66,41,19,'2023-10-25 15:52:51','2023-10-25 21:45:51',353),
(67,72,15,'2023-09-18 15:42:08','2023-09-18 21:11:08',329),
(68,18,8,'2023-09-18 06:29:46','2023-09-18 14:46:46',497),
(69,59,15,'2023-09-26 23:06:59','2023-09-27 05:51:59',405),
(70,9,74,'2023-10-05 16:08:07','2023-10-05 21:44:07',336),
(71,34,37,'2023-09-19 05:39:28','2023-09-19 12:56:28',437),
(72,48,72,'2023-10-28 17:31:54','2023-10-29 01:20:54',469),
(73,64,65,'2023-10-28 19:47:25','2023-10-29 02:46:25',419),
(74,60,9,'2023-09-05 17:09:13','2023-09-06 01:09:13',480),
(75,55,42,'2023-10-24 14:53:25','2023-10-24 23:01:25',488),
(76,34,8,'2023-10-23 23:52:08','2023-10-24 07:33:08',461),
(77,59,47,'2023-09-28 10:04:34','2023-09-28 17:31:34',447),
(78,6,72,'2023-10-19 15:16:40','2023-10-19 20:55:40',339),
(79,22,65,'2023-10-05 17:42:42','2023-10-06 02:06:42',504),
(80,61,67,'2023-10-27 18:43:51','2023-10-28 03:07:51',504),
(81,23,2,'2023-10-21 15:10:02','2023-10-21 23:41:02',511),
(82,7,17,'2023-10-29 10:47:28','2023-10-29 19:35:28',528),
(83,49,53,'2023-10-01 02:01:54','2023-10-01 09:49:54',468),
(84,59,34,'2023-09-23 06:30:59','2023-09-23 13:34:59',424),
(85,46,1,'2023-10-18 09:55:23','2023-10-18 15:15:23',320),
(86,68,12,'2023-09-06 17:20:51','2023-09-07 02:00:51',520),
(87,21,56,'2023-10-23 09:29:33','2023-10-23 14:48:33',319),
(88,60,49,'2023-09-10 00:11:15','2023-09-10 09:09:15',538),
(89,4,29,'2023-10-29 16:00:20','2023-10-29 21:59:20',359),
(90,47,18,'2023-09-07 14:06:02','2023-09-07 19:07:02',301),
(91,21,20,'2023-10-21 03:16:18','2023-10-21 10:15:18',419),
(92,51,37,'2023-09-02 03:19:56','2023-09-02 10:11:56',412),
(93,53,5,'2023-10-14 17:11:54','2023-10-14 23:57:54',406),
(94,16,47,'2023-09-14 07:31:30','2023-09-14 14:00:30',389),
(95,42,15,'2023-09-17 14:11:44','2023-09-17 20:04:44',353),
(96,31,67,'2023-10-19 05:21:58','2023-10-19 13:15:58',474),
(97,71,54,'2023-10-21 17:57:36','2023-10-21 23:23:36',326),
(98,73,69,'2023-10-22 13:55:24','2023-10-22 19:23:24',328),
(99,49,60,'2023-09-02 22:02:32','2023-09-03 03:35:32',333),
(100,41,10,'2023-10-29 06:08:54','2023-10-29 14:07:54',479),
(101,71,73,'2023-10-26 17:30:34','2023-10-27 01:15:34',465),
(102,66,11,'2023-09-05 00:24:42','2023-09-05 08:20:42',476),
(103,34,20,'2023-09-17 00:51:19','2023-09-17 08:48:19',477),
(104,47,18,'2023-10-27 00:59:06','2023-10-27 06:41:06',342),
(105,35,47,'2023-10-18 04:19:20','2023-10-18 11:35:20',436),
(106,59,9,'2023-10-22 13:57:31','2023-10-22 21:01:31',424),
(107,39,24,'2023-09-17 07:07:41','2023-09-17 14:43:41',456),
(108,69,60,'2023-09-16 07:10:46','2023-09-16 15:56:46',526),
(109,38,2,'2023-10-23 03:20:12','2023-10-23 10:24:12',424),
(110,73,20,'2023-09-04 12:19:36','2023-09-04 18:09:36',350),
(111,75,41,'2023-10-15 15:21:18','2023-10-15 20:57:18',336),
(112,2,61,'2023-09-10 13:25:55','2023-09-10 18:33:55',308),
(113,57,59,'2023-09-22 14:18:16','2023-09-22 23:04:16',526),
(114,28,26,'2023-10-04 11:03:34','2023-10-04 18:50:34',467),
(115,14,34,'2023-09-15 18:13:30','2023-09-16 00:05:30',352),
(116,65,4,'2023-09-10 03:47:38','2023-09-10 12:35:38',528),
(117,3,49,'2023-09-02 21:45:35','2023-09-03 04:16:35',391),
(118,66,43,'2023-09-05 17:52:48','2023-09-05 23:44:48',352),
(119,58,37,'2023-09-19 20:52:00','2023-09-20 03:50:00',418),
(120,21,68,'2023-10-27 18:21:31','2023-10-28 02:55:31',514),
(121,65,68,'2023-10-28 19:12:00','2023-10-29 03:23:00',491),
(122,73,39,'2023-10-16 08:21:27','2023-10-16 13:27:27',306),
(123,34,71,'2023-10-01 14:09:27','2023-10-01 21:47:27',458),
(124,27,43,'2023-09-29 02:25:04','2023-09-29 08:22:04',357),
(125,66,41,'2023-09-02 23:24:37','2023-09-03 06:44:37',440),
(126,46,3,'2023-09-08 05:12:13','2023-09-08 10:21:13',309),
(127,60,68,'2023-09-20 02:58:07','2023-09-20 10:20:07',442),
(128,16,13,'2023-09-20 09:18:10','2023-09-20 17:17:10',479),
(129,45,17,'2023-09-16 13:55:49','2023-09-16 18:58:49',303),
(130,13,30,'2023-09-15 15:22:47','2023-09-16 00:18:47',536),
(131,51,45,'2023-09-07 16:13:50','2023-09-08 01:07:50',534),
(132,14,46,'2023-09-10 01:03:06','2023-09-10 09:19:06',496),
(133,11,10,'2023-10-12 10:48:41','2023-10-12 15:48:41',300),
(134,1,42,'2023-09-24 16:37:02','2023-09-24 21:38:02',301),
(135,34,60,'2023-10-24 06:08:28','2023-10-24 14:38:28',510),
(136,74,45,'2023-10-05 02:05:48','2023-10-05 09:10:48',425),
(137,61,4,'2023-09-12 23:12:49','2023-09-13 07:25:49',493),
(138,4,54,'2023-10-20 01:22:42','2023-10-20 06:44:42',322),
(139,14,54,'2023-10-26 20:01:29','2023-10-27 02:33:29',392),
(140,58,52,'2023-09-26 10:05:20','2023-09-26 17:33:20',448),
(141,53,6,'2023-10-28 04:55:17','2023-10-28 13:04:17',489),
(142,63,22,'2023-10-23 00:04:26','2023-10-23 06:58:26',414),
(143,29,68,'2023-09-04 17:32:48','2023-09-04 23:58:48',386),
(144,51,37,'2023-10-09 12:58:19','2023-10-09 19:27:19',389),
(145,44,17,'2023-10-07 00:24:46','2023-10-07 06:25:46',361),
(146,1,21,'2023-10-23 22:03:10','2023-10-24 06:46:10',523),
(147,45,20,'2023-09-04 03:36:54','2023-09-04 10:20:54',404),
(148,22,71,'2023-09-02 11:53:48','2023-09-02 18:02:48',369),
(149,7,43,'2023-10-06 21:22:01','2023-10-07 04:57:01',455),
(150,46,61,'2023-10-28 23:50:06','2023-10-29 06:30:06',400),
(151,37,16,'2023-09-22 06:06:59','2023-09-22 11:08:59',302),
(152,13,23,'2023-09-17 22:26:46','2023-09-18 03:38:46',312),
(153,9,15,'2023-09-17 04:15:33','2023-09-17 12:25:33',490),
(154,50,70,'2023-09-23 05:50:13','2023-09-23 14:44:13',534),
(155,52,19,'2023-10-11 02:01:21','2023-10-11 10:53:21',532),
(156,27,42,'2023-10-10 03:09:58','2023-10-10 11:45:58',516),
(157,19,6,'2023-10-24 22:27:43','2023-10-25 04:02:43',335),
(158,50,26,'2023-09-16 04:23:03','2023-09-16 11:16:03',413),
(159,56,30,'2023-10-21 09:35:07','2023-10-21 15:33:07',358),
(160,68,25,'2023-09-04 16:15:24','2023-09-04 21:38:24',323),
(161,32,74,'2023-10-12 07:50:20','2023-10-12 12:52:20',302),
(162,30,46,'2023-09-25 13:04:56','2023-09-25 18:37:56',333),
(163,33,4,'2023-10-02 17:56:10','2023-10-02 22:57:10',301),
(164,26,41,'2023-10-18 13:20:14','2023-10-18 20:52:14',452),
(165,30,45,'2023-09-13 06:14:41','2023-09-13 12:11:41',357),
(166,52,30,'2023-09-03 03:01:10','2023-09-03 11:24:10',503),
(167,7,19,'2023-09-01 17:59:28','2023-09-02 01:42:28',463),
(168,68,34,'2023-09-26 05:54:01','2023-09-26 12:31:01',397),
(169,56,28,'2023-10-03 09:23:45','2023-10-03 16:43:45',440),
(170,25,20,'2023-09-18 19:06:02','2023-09-19 02:26:02',440),
(171,38,69,'2023-10-09 02:14:14','2023-10-09 07:40:14',326),
(172,59,36,'2023-10-19 18:48:23','2023-10-20 00:10:23',322),
(173,74,44,'2023-10-18 08:47:41','2023-10-18 15:50:41',423),
(174,58,19,'2023-09-28 21:30:50','2023-09-29 04:43:50',433),
(175,60,7,'2023-09-02 15:33:10','2023-09-02 21:35:10',362),
(176,3,32,'2023-10-03 09:23:23','2023-10-03 17:41:23',498),
(177,54,59,'2023-09-13 09:54:29','2023-09-13 18:04:29',490),
(178,66,20,'2023-09-19 02:52:56','2023-09-19 11:10:56',498),
(179,42,7,'2023-10-02 18:30:16','2023-10-03 01:49:16',439),
(180,16,42,'2023-10-25 11:03:32','2023-10-25 17:19:32',376),
(181,36,26,'2023-09-13 19:45:37','2023-09-14 04:24:37',519),
(182,29,49,'2023-10-23 08:49:35','2023-10-23 15:23:35',394),
(183,3,14,'2023-09-30 03:02:24','2023-09-30 08:03:24',301),
(184,62,31,'2023-10-25 09:39:06','2023-10-25 16:05:06',386),
(185,55,71,'2023-10-08 18:08:07','2023-10-09 02:29:07',501),
(186,71,1,'2023-09-08 20:49:59','2023-09-09 04:36:59',467),
(187,69,15,'2023-09-06 16:45:20','2023-09-06 22:03:20',318),
(188,49,41,'2023-09-08 01:20:57','2023-09-08 09:30:57',490),
(189,10,44,'2023-09-12 14:24:08','2023-09-12 21:42:08',438),
(190,31,59,'2023-09-29 06:28:00','2023-09-29 13:35:00',427),
(191,23,75,'2023-09-17 05:22:44','2023-09-17 12:18:44',416),
(192,36,65,'2023-09-18 22:56:23','2023-09-19 04:13:23',317),
(193,21,69,'2023-10-19 11:31:43','2023-10-19 17:36:43',365),
(194,42,13,'2023-09-16 15:48:17','2023-09-16 23:16:17',448),
(195,21,33,'2023-10-06 04:13:31','2023-10-06 12:14:31',481),
(196,17,64,'2023-10-05 10:50:40','2023-10-05 16:22:40',332),
(197,72,28,'2023-10-22 23:55:18','2023-10-23 08:02:18',487),
(198,44,32,'2023-09-11 01:56:05','2023-09-11 08:38:05',402),
(199,23,12,'2023-09-28 01:55:11','2023-09-28 09:37:11',462),
(200,3,61,'2023-09-09 09:07:36','2023-09-09 15:48:36',401);

-- Class
INSERT INTO `Class` VALUES
('1_ECO',7704,167,'ECO',1),
('1_BUS',18413,78,'BUS',1),
('1_FST',27175,32,'FST',1),
('2_ECO',8231,189,'ECO',2),
('2_BUS',19838,54,'BUS',2),
('2_FST',22082,29,'FST',2),
('3_ECO',7801,231,'ECO',3),
('3_BUS',15945,54,'BUS',3),
('3_FST',22613,40,'FST',3),
('4_ECO',5523,175,'ECO',4),
('4_BUS',17611,76,'BUS',4),
('4_FST',25095,31,'FST',4),
('5_ECO',5482,179,'ECO',5),
('5_BUS',17724,65,'BUS',5),
('5_FST',28426,46,'FST',5),
('6_ECO',6362,123,'ECO',6),
('6_BUS',16222,99,'BUS',6),
('6_FST',25437,39,'FST',6),
('7_ECO',7749,225,'ECO',7),
('7_BUS',12945,88,'BUS',7),
('7_FST',25769,36,'FST',7),
('8_ECO',7046,158,'ECO',8),
('8_BUS',14849,93,'BUS',8),
('8_FST',20667,37,'FST',8),
('9_ECO',7745,295,'ECO',9),
('9_BUS',12925,100,'BUS',9),
('9_FST',20877,24,'FST',9),
('10_ECO',8265,220,'ECO',10),
('10_BUS',12538,63,'BUS',10),
('10_FST',20736,31,'FST',10),
('11_ECO',9061,290,'ECO',11),
('11_BUS',17932,79,'BUS',11),
('11_FST',29456,49,'FST',11),
('12_ECO',6706,215,'ECO',12),
('12_BUS',11074,52,'BUS',12),
('12_FST',26780,21,'FST',12),
('13_ECO',8707,219,'ECO',13),
('13_BUS',11342,87,'BUS',13),
('13_FST',23214,27,'FST',13),
('14_ECO',7916,250,'ECO',14),
('14_BUS',16245,55,'BUS',14),
('14_FST',28542,36,'FST',14),
('15_ECO',5797,119,'ECO',15),
('15_BUS',15775,70,'BUS',15),
('15_FST',26720,35,'FST',15),
('16_ECO',8033,116,'ECO',16),
('16_BUS',18826,85,'BUS',16),
('16_FST',23337,26,'FST',16),
('17_ECO',8246,249,'ECO',17),
('17_BUS',10510,99,'BUS',17),
('17_FST',21743,29,'FST',17),
('18_ECO',5019,187,'ECO',18),
('18_BUS',19644,97,'BUS',18),
('18_FST',21599,30,'FST',18),
('19_ECO',8720,297,'ECO',19),
('19_BUS',15775,68,'BUS',19),
('19_FST',21250,46,'FST',19),
('20_ECO',6629,280,'ECO',20),
('20_BUS',14550,74,'BUS',20),
('20_FST',22693,39,'FST',20),
('21_ECO',6004,258,'ECO',21),
('21_BUS',19262,57,'BUS',21),
('21_FST',24059,33,'FST',21),
('22_ECO',7434,171,'ECO',22),
('22_BUS',11571,75,'BUS',22),
('22_FST',24060,42,'FST',22),
('23_ECO',9599,200,'ECO',23),
('23_BUS',10860,72,'BUS',23),
('23_FST',23729,49,'FST',23),
('24_ECO',8925,114,'ECO',24),
('24_BUS',15094,50,'BUS',24),
('24_FST',28229,22,'FST',24),
('25_ECO',8913,238,'ECO',25),
('25_BUS',18145,85,'BUS',25),
('25_FST',23600,20,'FST',25),
('26_ECO',9601,205,'ECO',26),
('26_BUS',13226,86,'BUS',26),
('26_FST',22542,30,'FST',26),
('27_ECO',5808,172,'ECO',27),
('27_BUS',14958,84,'BUS',27),
('27_FST',28166,45,'FST',27),
('28_ECO',5073,223,'ECO',28),
('28_BUS',15809,52,'BUS',28),
('28_FST',27441,30,'FST',28),
('29_ECO',9722,167,'ECO',29),
('29_BUS',19584,60,'BUS',29),
('29_FST',28840,27,'FST',29),
('30_ECO',7573,278,'ECO',30),
('30_BUS',10739,99,'BUS',30),
('30_FST',20042,23,'FST',30),
('31_ECO',6569,137,'ECO',31),
('31_BUS',16965,62,'BUS',31),
('31_FST',22411,29,'FST',31),
('32_ECO',7979,163,'ECO',32),
('32_BUS',15181,60,'BUS',32),
('32_FST',24748,33,'FST',32),
('33_ECO',5197,140,'ECO',33),
('33_BUS',14958,87,'BUS',33),
('33_FST',23307,48,'FST',33),
('34_ECO',8944,107,'ECO',34),
('34_BUS',15251,68,'BUS',34),
('34_FST',20987,32,'FST',34),
('35_ECO',7800,266,'ECO',35),
('35_BUS',10821,50,'BUS',35),
('35_FST',20061,35,'FST',35),
('36_ECO',6387,263,'ECO',36),
('36_BUS',19641,96,'BUS',36),
('36_FST',21027,34,'FST',36),
('37_ECO',8844,270,'ECO',37),
('37_BUS',15927,68,'BUS',37),
('37_FST',20932,45,'FST',37),
('38_ECO',6117,230,'ECO',38),
('38_BUS',17308,72,'BUS',38),
('38_FST',22878,33,'FST',38),
('39_ECO',5351,203,'ECO',39),
('39_BUS',18479,65,'BUS',39),
('39_FST',28783,32,'FST',39),
('40_ECO',9130,267,'ECO',40),
('40_BUS',17571,95,'BUS',40),
('40_FST',22195,35,'FST',40),
('41_ECO',8098,212,'ECO',41),
('41_BUS',12046,68,'BUS',41),
('41_FST',28930,36,'FST',41),
('42_ECO',6176,211,'ECO',42),
('42_BUS',10698,57,'BUS',42),
('42_FST',24665,25,'FST',42),
('43_ECO',6274,188,'ECO',43),
('43_BUS',16087,73,'BUS',43),
('43_FST',26249,48,'FST',43),
('44_ECO',6290,275,'ECO',44),
('44_BUS',14730,52,'BUS',44),
('44_FST',22537,21,'FST',44),
('45_ECO',9214,289,'ECO',45),
('45_BUS',18740,85,'BUS',45),
('45_FST',28200,44,'FST',45),
('46_ECO',7747,166,'ECO',46),
('46_BUS',10007,57,'BUS',46),
('46_FST',25216,35,'FST',46),
('47_ECO',8463,120,'ECO',47),
('47_BUS',17115,68,'BUS',47),
('47_FST',22877,34,'FST',47),
('48_ECO',6794,151,'ECO',48),
('48_BUS',19906,100,'BUS',48),
('48_FST',29393,37,'FST',48),
('49_ECO',7880,224,'ECO',49),
('49_BUS',18334,78,'BUS',49),
('49_FST',21974,40,'FST',49),
('50_ECO',6605,202,'ECO',50),
('50_BUS',17775,89,'BUS',50),
('50_FST',29157,28,'FST',50),
('51_ECO',7983,144,'ECO',51),
('51_BUS',15898,95,'BUS',51),
('51_FST',27611,29,'FST',51),
('52_ECO',6760,196,'ECO',52),
('52_BUS',11493,71,'BUS',52),
('52_FST',21733,27,'FST',52),
('53_ECO',6464,290,'ECO',53),
('53_BUS',10259,61,'BUS',53),
('53_FST',29706,46,'FST',53),
('54_ECO',5548,226,'ECO',54),
('54_BUS',18977,93,'BUS',54),
('54_FST',28903,39,'FST',54),
('55_ECO',7744,253,'ECO',55),
('55_BUS',19517,85,'BUS',55),
('55_FST',28809,43,'FST',55),
('56_ECO',9674,297,'ECO',56),
('56_BUS',15238,74,'BUS',56),
('56_FST',24761,32,'FST',56),
('57_ECO',7149,110,'ECO',57),
('57_BUS',17287,92,'BUS',57),
('57_FST',20011,46,'FST',57),
('58_ECO',5951,260,'ECO',58),
('58_BUS',12403,90,'BUS',58),
('58_FST',20811,49,'FST',58),
('59_ECO',6998,290,'ECO',59),
('59_BUS',10822,68,'BUS',59),
('59_FST',22612,28,'FST',59),
('60_ECO',5309,187,'ECO',60),
('60_BUS',10574,79,'BUS',60),
('60_FST',27680,23,'FST',60),
('61_ECO',8755,241,'ECO',61),
('61_BUS',11342,95,'BUS',61),
('61_FST',27731,36,'FST',61),
('62_ECO',9296,280,'ECO',62),
('62_BUS',14421,66,'BUS',62),
('62_FST',29255,39,'FST',62),
('63_ECO',6949,158,'ECO',63),
('63_BUS',13186,94,'BUS',63),
('63_FST',20451,40,'FST',63),
('64_ECO',6695,137,'ECO',64),
('64_BUS',18846,69,'BUS',64),
('64_FST',29706,24,'FST',64),
('65_ECO',8328,170,'ECO',65),
('65_BUS',10551,96,'BUS',65),
('65_FST',25504,37,'FST',65),
('66_ECO',7880,234,'ECO',66),
('66_BUS',18999,57,'BUS',66),
('66_FST',23836,22,'FST',66),
('67_ECO',6395,160,'ECO',67),
('67_BUS',12751,98,'BUS',67),
('67_FST',28821,37,'FST',67),
('68_ECO',5244,269,'ECO',68),
('68_BUS',10019,91,'BUS',68),
('68_FST',26262,46,'FST',68),
('69_ECO',9759,148,'ECO',69),
('69_BUS',11524,90,'BUS',69),
('69_FST',25782,35,'FST',69),
('70_ECO',8307,127,'ECO',70),
('70_BUS',17158,55,'BUS',70),
('70_FST',23977,27,'FST',70),
('71_ECO',5681,203,'ECO',71),
('71_BUS',10330,82,'BUS',71),
('71_FST',28052,27,'FST',71),
('72_ECO',9310,178,'ECO',72),
('72_BUS',12495,52,'BUS',72),
('72_FST',20689,37,'FST',72),
('73_ECO',8236,286,'ECO',73),
('73_BUS',16672,52,'BUS',73),
('73_FST',26335,25,'FST',73),
('74_ECO',6793,182,'ECO',74),
('74_BUS',17074,81,'BUS',74),
('74_FST',28679,33,'FST',74),
('75_ECO',5071,285,'ECO',75),
('75_BUS',17654,55,'BUS',75),
('75_FST',29616,20,'FST',75),
('76_ECO',5019,147,'ECO',76),
('76_BUS',16729,89,'BUS',76),
('76_FST',25381,48,'FST',76),
('77_ECO',9998,285,'ECO',77),
('77_BUS',10055,92,'BUS',77),
('77_FST',22041,40,'FST',77),
('78_ECO',7519,154,'ECO',78),
('78_BUS',10421,60,'BUS',78),
('78_FST',24789,24,'FST',78),
('79_ECO',8016,150,'ECO',79),
('79_BUS',17825,82,'BUS',79),
('79_FST',21637,41,'FST',79),
('80_ECO',5635,255,'ECO',80),
('80_BUS',13965,70,'BUS',80),
('80_FST',27252,32,'FST',80),
('81_ECO',5460,155,'ECO',81),
('81_BUS',13106,53,'BUS',81),
('81_FST',20598,20,'FST',81),
('82_ECO',9223,160,'ECO',82),
('82_BUS',12249,74,'BUS',82),
('82_FST',28193,34,'FST',82),
('83_ECO',5621,174,'ECO',83),
('83_BUS',13161,95,'BUS',83),
('83_FST',22645,41,'FST',83),
('84_ECO',6105,142,'ECO',84),
('84_BUS',10631,52,'BUS',84),
('84_FST',21581,21,'FST',84),
('85_ECO',7038,150,'ECO',85),
('85_BUS',13307,70,'BUS',85),
('85_FST',28120,21,'FST',85),
('86_ECO',7239,283,'ECO',86),
('86_BUS',13410,96,'BUS',86),
('86_FST',29502,50,'FST',86),
('87_ECO',7707,103,'ECO',87),
('87_BUS',14253,92,'BUS',87),
('87_FST',20836,38,'FST',87),
('88_ECO',8843,122,'ECO',88),
('88_BUS',13794,54,'BUS',88),
('88_FST',25082,40,'FST',88),
('89_ECO',6104,248,'ECO',89),
('89_BUS',11211,86,'BUS',89),
('89_FST',25595,50,'FST',89),
('90_ECO',5488,206,'ECO',90),
('90_BUS',16723,72,'BUS',90),
('90_FST',24474,43,'FST',90),
('91_ECO',5690,245,'ECO',91),
('91_BUS',14562,93,'BUS',91),
('91_FST',21089,27,'FST',91),
('92_ECO',9999,112,'ECO',92),
('92_BUS',18262,84,'BUS',92),
('92_FST',28110,44,'FST',92),
('93_ECO',8484,203,'ECO',93),
('93_BUS',11067,89,'BUS',93),
('93_FST',26042,43,'FST',93),
('94_ECO',7498,223,'ECO',94),
('94_BUS',18326,81,'BUS',94),
('94_FST',29506,28,'FST',94),
('95_ECO',6248,125,'ECO',95),
('95_BUS',17658,95,'BUS',95),
('95_FST',22584,50,'FST',95),
('96_ECO',7331,160,'ECO',96),
('96_BUS',10068,65,'BUS',96),
('96_FST',23438,45,'FST',96),
('97_ECO',5785,275,'ECO',97),
('97_BUS',17479,52,'BUS',97),
('97_FST',28087,28,'FST',97),
('98_ECO',7597,291,'ECO',98),
('98_BUS',11231,64,'BUS',98),
('98_FST',27812,50,'FST',98),
('99_ECO',8339,230,'ECO',99),
('99_BUS',13707,88,'BUS',99),
('99_FST',25638,21,'FST',99),
('100_ECO',6089,244,'ECO',100),
('100_BUS',17927,99,'BUS',100),
('100_FST',28028,49,'FST',100),
('101_ECO',7920,269,'ECO',101),
('101_BUS',15804,50,'BUS',101),
('101_FST',21542,48,'FST',101),
('102_ECO',7926,288,'ECO',102),
('102_BUS',16828,80,'BUS',102),
('102_FST',27534,46,'FST',102),
('103_ECO',6656,296,'ECO',103),
('103_BUS',17673,60,'BUS',103),
('103_FST',24194,46,'FST',103),
('104_ECO',8046,173,'ECO',104),
('104_BUS',18313,58,'BUS',104),
('104_FST',26309,21,'FST',104),
('105_ECO',9810,299,'ECO',105),
('105_BUS',11792,73,'BUS',105),
('105_FST',28471,37,'FST',105),
('106_ECO',7400,279,'ECO',106),
('106_BUS',13565,76,'BUS',106),
('106_FST',29868,29,'FST',106),
('107_ECO',7286,278,'ECO',107),
('107_BUS',19613,93,'BUS',107),
('107_FST',25549,39,'FST',107),
('108_ECO',8308,159,'ECO',108),
('108_BUS',18614,82,'BUS',108),
('108_FST',20245,24,'FST',108),
('109_ECO',8667,154,'ECO',109),
('109_BUS',18571,75,'BUS',109),
('109_FST',24116,26,'FST',109),
('110_ECO',8402,223,'ECO',110),
('110_BUS',17956,82,'BUS',110),
('110_FST',22826,28,'FST',110),
('111_ECO',7859,205,'ECO',111),
('111_BUS',13728,86,'BUS',111),
('111_FST',24856,23,'FST',111),
('112_ECO',7399,168,'ECO',112),
('112_BUS',16666,69,'BUS',112),
('112_FST',22458,44,'FST',112),
('113_ECO',5987,112,'ECO',113),
('113_BUS',16797,53,'BUS',113),
('113_FST',21034,35,'FST',113),
('114_ECO',5919,112,'ECO',114),
('114_BUS',16655,82,'BUS',114),
('114_FST',25769,34,'FST',114),
('115_ECO',8882,150,'ECO',115),
('115_BUS',14938,55,'BUS',115),
('115_FST',27966,39,'FST',115),
('116_ECO',5578,110,'ECO',116),
('116_BUS',14977,89,'BUS',116),
('116_FST',20346,22,'FST',116),
('117_ECO',9775,202,'ECO',117),
('117_BUS',13175,76,'BUS',117),
('117_FST',25352,29,'FST',117),
('118_ECO',6774,110,'ECO',118),
('118_BUS',12723,62,'BUS',118),
('118_FST',21580,31,'FST',118),
('119_ECO',7838,129,'ECO',119),
('119_BUS',14092,98,'BUS',119),
('119_FST',20373,44,'FST',119),
('120_ECO',5352,263,'ECO',120),
('120_BUS',12236,76,'BUS',120),
('120_FST',21803,33,'FST',120),
('121_ECO',8095,143,'ECO',121),
('121_BUS',13100,55,'BUS',121),
('121_FST',28014,30,'FST',121),
('122_ECO',7337,137,'ECO',122),
('122_BUS',16148,95,'BUS',122),
('122_FST',25397,45,'FST',122),
('123_ECO',7589,179,'ECO',123),
('123_BUS',19470,77,'BUS',123),
('123_FST',28155,39,'FST',123),
('124_ECO',5787,179,'ECO',124),
('124_BUS',12578,56,'BUS',124),
('124_FST',22562,28,'FST',124),
('125_ECO',9453,208,'ECO',125),
('125_BUS',17635,57,'BUS',125),
('125_FST',27597,44,'FST',125),
('126_ECO',9992,265,'ECO',126),
('126_BUS',15773,89,'BUS',126),
('126_FST',21813,32,'FST',126),
('127_ECO',5377,123,'ECO',127),
('127_BUS',10457,98,'BUS',127),
('127_FST',29174,37,'FST',127),
('128_ECO',9950,121,'ECO',128),
('128_BUS',17403,97,'BUS',128),
('128_FST',28762,42,'FST',128),
('129_ECO',8628,137,'ECO',129),
('129_BUS',19063,79,'BUS',129),
('129_FST',24419,31,'FST',129),
('130_ECO',7078,285,'ECO',130),
('130_BUS',15519,96,'BUS',130),
('130_FST',20632,22,'FST',130),
('131_ECO',7182,190,'ECO',131),
('131_BUS',15630,74,'BUS',131),
('131_FST',24512,39,'FST',131),
('132_ECO',8648,282,'ECO',132),
('132_BUS',14059,70,'BUS',132),
('132_FST',25033,22,'FST',132),
('133_ECO',7163,115,'ECO',133),
('133_BUS',14813,71,'BUS',133),
('133_FST',28337,41,'FST',133),
('134_ECO',8597,276,'ECO',134),
('134_BUS',19015,66,'BUS',134),
('134_FST',25864,25,'FST',134),
('135_ECO',6201,235,'ECO',135),
('135_BUS',17098,60,'BUS',135),
('135_FST',25362,49,'FST',135),
('136_ECO',7527,150,'ECO',136),
('136_BUS',19268,62,'BUS',136),
('136_FST',21712,32,'FST',136),
('137_ECO',8757,155,'ECO',137),
('137_BUS',19907,87,'BUS',137),
('137_FST',28515,38,'FST',137),
('138_ECO',7487,161,'ECO',138),
('138_BUS',14337,59,'BUS',138),
('138_FST',25225,41,'FST',138),
('139_ECO',6610,265,'ECO',139),
('139_BUS',12133,65,'BUS',139),
('139_FST',23836,48,'FST',139),
('140_ECO',7756,169,'ECO',140),
('140_BUS',16758,55,'BUS',140),
('140_FST',29757,36,'FST',140),
('141_ECO',6173,209,'ECO',141),
('141_BUS',10798,99,'BUS',141),
('141_FST',22423,43,'FST',141),
('142_ECO',7919,200,'ECO',142),
('142_BUS',16558,55,'BUS',142),
('142_FST',26859,39,'FST',142),
('143_ECO',6505,194,'ECO',143),
('143_BUS',14527,62,'BUS',143),
('143_FST',28485,32,'FST',143),
('144_ECO',7344,299,'ECO',144),
('144_BUS',19704,80,'BUS',144),
('144_FST',20223,30,'FST',144),
('145_ECO',6224,154,'ECO',145),
('145_BUS',14868,81,'BUS',145),
('145_FST',22856,30,'FST',145),
('146_ECO',8630,254,'ECO',146),
('146_BUS',13763,76,'BUS',146),
('146_FST',28877,33,'FST',146),
('147_ECO',8944,236,'ECO',147),
('147_BUS',14952,95,'BUS',147),
('147_FST',29793,20,'FST',147),
('148_ECO',9243,178,'ECO',148),
('148_BUS',17851,61,'BUS',148),
('148_FST',22159,47,'FST',148),
('149_ECO',6236,248,'ECO',149),
('149_BUS',16513,86,'BUS',149),
('149_FST',20281,42,'FST',149),
('150_ECO',5790,293,'ECO',150),
('150_BUS',11276,69,'BUS',150),
('150_FST',20444,32,'FST',150),
('151_ECO',5072,113,'ECO',151),
('151_BUS',14123,97,'BUS',151),
('151_FST',28212,49,'FST',151),
('152_ECO',7009,253,'ECO',152),
('152_BUS',19334,86,'BUS',152),
('152_FST',25358,31,'FST',152),
('153_ECO',8701,158,'ECO',153),
('153_BUS',15749,79,'BUS',153),
('153_FST',27655,50,'FST',153),
('154_ECO',7228,200,'ECO',154),
('154_BUS',18465,86,'BUS',154),
('154_FST',27855,24,'FST',154),
('155_ECO',6032,152,'ECO',155),
('155_BUS',15566,50,'BUS',155),
('155_FST',22450,49,'FST',155),
('156_ECO',9144,226,'ECO',156),
('156_BUS',13415,73,'BUS',156),
('156_FST',20239,36,'FST',156),
('157_ECO',9044,288,'ECO',157),
('157_BUS',14763,59,'BUS',157),
('157_FST',27399,23,'FST',157),
('158_ECO',5901,199,'ECO',158),
('158_BUS',12755,52,'BUS',158),
('158_FST',24563,44,'FST',158),
('159_ECO',5343,268,'ECO',159),
('159_BUS',16055,57,'BUS',159),
('159_FST',23210,50,'FST',159),
('160_ECO',6503,236,'ECO',160),
('160_BUS',11993,59,'BUS',160),
('160_FST',20494,50,'FST',160),
('161_ECO',8882,119,'ECO',161),
('161_BUS',18619,91,'BUS',161),
('161_FST',29199,41,'FST',161),
('162_ECO',9985,166,'ECO',162),
('162_BUS',14548,99,'BUS',162),
('162_FST',27518,31,'FST',162),
('163_ECO',5687,144,'ECO',163),
('163_BUS',14132,92,'BUS',163),
('163_FST',20670,47,'FST',163),
('164_ECO',7734,140,'ECO',164),
('164_BUS',11751,61,'BUS',164),
('164_FST',28813,45,'FST',164),
('165_ECO',5375,221,'ECO',165),
('165_BUS',11895,58,'BUS',165),
('165_FST',28353,39,'FST',165),
('166_ECO',6860,181,'ECO',166),
('166_BUS',12680,55,'BUS',166),
('166_FST',20230,44,'FST',166),
('167_ECO',8196,245,'ECO',167),
('167_BUS',11049,81,'BUS',167),
('167_FST',20868,24,'FST',167),
('168_ECO',8287,252,'ECO',168),
('168_BUS',13794,79,'BUS',168),
('168_FST',21674,25,'FST',168),
('169_ECO',9764,223,'ECO',169),
('169_BUS',15989,82,'BUS',169),
('169_FST',22269,42,'FST',169),
('170_ECO',7393,129,'ECO',170),
('170_BUS',17525,73,'BUS',170),
('170_FST',26425,28,'FST',170),
('171_ECO',5344,216,'ECO',171),
('171_BUS',18169,61,'BUS',171),
('171_FST',20996,46,'FST',171),
('172_ECO',8294,233,'ECO',172),
('172_BUS',19702,67,'BUS',172),
('172_FST',25439,22,'FST',172),
('173_ECO',6958,195,'ECO',173),
('173_BUS',17442,68,'BUS',173),
('173_FST',21646,47,'FST',173),
('174_ECO',6159,189,'ECO',174),
('174_BUS',14881,53,'BUS',174),
('174_FST',29707,22,'FST',174),
('175_ECO',9011,178,'ECO',175),
('175_BUS',17352,56,'BUS',175),
('175_FST',22462,44,'FST',175),
('176_ECO',8962,255,'ECO',176),
('176_BUS',16252,82,'BUS',176),
('176_FST',25475,27,'FST',176),
('177_ECO',7428,230,'ECO',177),
('177_BUS',17880,99,'BUS',177),
('177_FST',24437,36,'FST',177),
('178_ECO',7142,167,'ECO',178),
('178_BUS',14921,75,'BUS',178),
('178_FST',22760,31,'FST',178),
('179_ECO',8099,182,'ECO',179),
('179_BUS',12062,57,'BUS',179),
('179_FST',26241,23,'FST',179),
('180_ECO',7029,199,'ECO',180),
('180_BUS',16831,97,'BUS',180),
('180_FST',20314,32,'FST',180),
('181_ECO',9754,123,'ECO',181),
('181_BUS',12581,98,'BUS',181),
('181_FST',22530,39,'FST',181),
('182_ECO',8204,123,'ECO',182),
('182_BUS',14906,76,'BUS',182),
('182_FST',22273,47,'FST',182),
('183_ECO',8542,118,'ECO',183),
('183_BUS',12899,75,'BUS',183),
('183_FST',26104,46,'FST',183),
('184_ECO',8942,239,'ECO',184),
('184_BUS',18113,62,'BUS',184),
('184_FST',26018,27,'FST',184),
('185_ECO',5948,117,'ECO',185),
('185_BUS',15652,94,'BUS',185),
('185_FST',28935,46,'FST',185),
('186_ECO',8125,250,'ECO',186),
('186_BUS',11351,95,'BUS',186),
('186_FST',22071,26,'FST',186),
('187_ECO',7509,228,'ECO',187),
('187_BUS',16704,83,'BUS',187),
('187_FST',25903,35,'FST',187),
('188_ECO',9939,113,'ECO',188),
('188_BUS',13111,85,'BUS',188),
('188_FST',27099,26,'FST',188),
('189_ECO',9577,158,'ECO',189),
('189_BUS',19574,50,'BUS',189),
('189_FST',24587,33,'FST',189),
('190_ECO',6677,103,'ECO',190),
('190_BUS',17401,93,'BUS',190),
('190_FST',29994,46,'FST',190),
('191_ECO',9636,222,'ECO',191),
('191_BUS',19937,82,'BUS',191),
('191_FST',26998,24,'FST',191),
('192_ECO',9920,204,'ECO',192),
('192_BUS',17134,98,'BUS',192),
('192_FST',21127,27,'FST',192),
('193_ECO',8311,101,'ECO',193),
('193_BUS',12140,69,'BUS',193),
('193_FST',25401,27,'FST',193),
('194_ECO',6286,129,'ECO',194),
('194_BUS',11193,79,'BUS',194),
('194_FST',29660,44,'FST',194),
('195_ECO',9245,195,'ECO',195),
('195_BUS',13388,90,'BUS',195),
('195_FST',22879,40,'FST',195),
('196_ECO',6320,183,'ECO',196),
('196_BUS',16432,79,'BUS',196),
('196_FST',28253,27,'FST',196),
('197_ECO',9491,159,'ECO',197),
('197_BUS',12803,52,'BUS',197),
('197_FST',27952,50,'FST',197),
('198_ECO',6122,236,'ECO',198),
('198_BUS',16331,78,'BUS',198),
('198_FST',27216,22,'FST',198),
('199_ECO',6432,239,'ECO',199),
('199_BUS',15986,58,'BUS',199),
('199_FST',24446,37,'FST',199),
('200_ECO',9232,219,'ECO',200),
('200_BUS',15043,71,'BUS',200),
('200_FST',28971,46,'FST',200);

Set Sql_safe_updates = 0;

Update flights
set Departure_Time = DATE_ADD(Departure_Time, INTERVAL 2 MONTH),
Arrival_Time = DATE_ADD(Arrival_Time, INTERVAL 2 MONTH);

Set sql_safe_updates = 1;
