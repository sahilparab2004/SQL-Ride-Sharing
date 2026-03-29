create database ride;
use ride;
show databases;


-- rider table
CREATE TABLE Riders (
    rider_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    city VARCHAR(50)
);

desc Riders;

-- driver table;
CREATE TABLE Drivers (
    driver_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    vehicle_number VARCHAR(20),
    city VARCHAR(50)
);

desc Drivers;

-- trip
CREATE TABLE Trips (
    trip_id INT PRIMARY KEY AUTO_INCREMENT,
    rider_id INT,
    driver_id INT,
    start_location VARCHAR(100),
    end_location VARCHAR(100),
    trip_date DATETIME,
    distance_km DECIMAL(5,2),
    fare DECIMAL(10,2),
    status ENUM('Completed', 'Cancelled'),
    FOREIGN KEY (rider_id) REFERENCES Riders(rider_id),
    FOREIGN KEY (driver_id) REFERENCES Drivers(driver_id)
);

desc trips;

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    trip_id INT,
    payment_method ENUM('Cash', 'Card', 'Wallet'),
    amount DECIMAL(10,2),
    payment_date DATETIME,
    FOREIGN KEY (trip_id) REFERENCES Trips(trip_id)
);

desc payments;

CREATE TABLE Ratings (
    rating_id INT PRIMARY KEY AUTO_INCREMENT,
    trip_id INT,
    rider_rating INT CHECK(rider_rating BETWEEN 1 AND 5),
    driver_rating INT CHECK(driver_rating BETWEEN 1 AND 5),
    comments VARCHAR(255),
    FOREIGN KEY (trip_id) REFERENCES Trips(trip_id)
);

desc ratings;



select * from trips;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Ratings;
TRUNCATE TABLE Payments;
TRUNCATE TABLE Trips;
TRUNCATE TABLE Drivers;
TRUNCATE TABLE Riders;
SET FOREIGN_KEY_CHECKS = 1;



INSERT INTO Riders (rider_id, name, email, phone, city) VALUES
(1, 'Brandon Russell', 'grayanna@christian-moore.com', '+1-532-061-9610', 'Mumbai'),
(2, 'Jerome Whitehead', 'davidknox@pruitt-berry.com', '045.873.9895x06', 'Thane'),
(3, 'Margaret Estrada', 'cbrooks@hotmail.com', '(174)255-8617', 'Mumbai'),
(4, 'Richard Smith', 'alexander53@patel-cummings.com', '+1-473-872-2876', 'Pune'),
(5, 'Alex Lindsey', 'awalters@gmail.com', '+1-185-116-0861', 'Thane'),
(6, 'Mrs. Kaitlyn Potter', 'obailey@hotmail.com', '(612)531-0868', 'Mumbai'),
(7, 'Thomas Barton', 'irichardson@yahoo.com', '129.660.2705x77', 'Mumbai'),
(8, 'Frederick Black', 'vincent85@barry.com', '833-546-0813x83', 'Pune'),
(9, 'Justin Miller', 'petersonamanda@hotmail.com', '(776)049-7563', 'Nashik'),
(10, 'Tammy Lynch', 'lcooper@vazquez.info', '(655)375-3260x6', 'Nashik'),
(11, 'Tim Gates', 'chad41@yahoo.com', '950.609.6417x95', 'Thane'),
(12, 'Kristine Cooper', 'matthew02@gmail.com', '6727807825', 'Thane'),
(13, 'Stephanie Walker', 'mgordon@thornton-santana.com', '631-442-6560x90', 'Mumbai'),
(14, 'Joseph Gallagher', 'vincent73@rose-garcia.org', '+1-843-816-6710', 'Navi Mumbai'),
(15, 'Pamela Graham', 'trevorlee@gmail.com', '033.160.0658', 'Navi Mumbai'),
(16, 'Tim Wright', 'sara41@yahoo.com', '+1-538-052-7363', 'Thane'),
(17, 'William Crawford', 'donald12@stevens.net', '+1-078-545-3601', 'Nashik'),
(18, 'Nancy Deleon', 'iwhite@taylor-roy.com', '501-237-6360', 'Thane'),
(19, 'Brian Dominguez', 'howardstephanie@montoya.biz', '210-456-5300x81', 'Navi Mumbai'),
(20, 'Justin Smith', 'jbray@yahoo.com', '(260)945-5058x0', 'Navi Mumbai'),
(21, 'Clifford Nguyen', 'raymondgregory@harris.biz', '001-748-826-040', 'Mumbai'),
(22, 'Miss Debra Orozco MD', 'michael46@oliver.net', '815-447-3011', 'Pune'),
(23, 'Tara Alexander', 'sherry22@yahoo.com', '6330621284', 'Mumbai'),
(24, 'Richard Price', 'russodavid@hotmail.com', '(490)834-4985x0', 'Nashik'),
(25, 'Christina Lewis', 'zjones@jackson.net', '179.369.6851', 'Pune'),
(26, 'Shannon Davis', 'jacqueline30@wyatt.com', '001-067-965-266', 'Mumbai'),
(27, 'Robert Taylor', 'william44@yahoo.com', '(888)109-9289', 'Mumbai'),
(28, 'Lindsay Gibson', 'sjohnson@brooks-singh.net', '001-995-320-509', 'Thane'),
(29, 'Lisa Hall', 'williammarquez@yahoo.com', '387.559.6457x23', 'Pune'),
(30, 'Briana Mahoney', 'lindsayjackson@ross.com', '278.072.4587x31', 'Mumbai'),
(31, 'Mark Hancock', 'scott01@reeves.com', '388-795-3022x73', 'Mumbai'),
(32, 'Matthew Martinez', 'emily53@gmail.com', '828-097-8667', 'Mumbai'),
(33, 'Colin Bailey', 'hmclaughlin@yahoo.com', '586-134-1152', 'Navi Mumbai'),
(34, 'Sean Henderson', 'therring@gmail.com', '(014)866-5551x5', 'Navi Mumbai'),
(35, 'Jonathan Johnson', 'leslie42@jacobs-ward.net', '001-097-235-378', 'Mumbai'),
(36, 'Karen Griffin', 'scortez@gmail.com', '+1-671-956-9998', 'Thane'),
(37, 'Rachel Wallace', 'kimberlythompson@hotmail.com', '619.681.5722', 'Pune'),
(38, 'Kevin Taylor', 'dmoore@yahoo.com', '+1-393-439-9043', 'Nashik'),
(39, 'Raymond Dean', 'benjamin30@lewis-thompson.info', '(218)809-3162x3', 'Pune'),
(40, 'Nancy Krueger', 'ryan92@hotmail.com', '(334)782-9328', 'Thane'),
(41, 'Jonathan Garner', 'courtney07@miranda.net', '+1-396-144-8443', 'Pune'),
(42, 'Michael Davis', 'djones@yahoo.com', '168.417.0245x27', 'Mumbai'),
(43, 'Karen Bell', 'terrichoi@scott.com', '+1-557-762-2325', 'Thane'),
(44, 'Robert Watson', 'victoria56@park.com', '393.295.7950x75', 'Thane'),
(45, 'David Lara', 'xwhite@durham.com', '(870)696-4521x3', 'Nashik'),
(46, 'Carol Butler', 'dharvey@gmail.com', '(763)187-0995', 'Pune'),
(47, 'Bonnie Lee', 'jonesamanda@medina-crawford.com', '638-933-0834x47', 'Navi Mumbai'),
(48, 'Erica Wright', 'cynthia51@kim.com', '+1-909-651-2346', 'Nashik'),
(49, 'Christina Rivera', 'rhonda75@hotmail.com', '001-527-781-226', 'Nashik'),
(50, 'Jennifer Snyder', 'markclark@jackson.com', '362-986-6301x99', 'Nashik'),
(51, 'Mary Wright', 'matthew66@hotmail.com', '846-296-2535', 'Thane'),
(52, 'Lauren Maldonado', 'xfowler@bird-baldwin.com', '090.612.1253x43', 'Mumbai'),
(53, 'Andrew Hunter', 'angela27@hotmail.com', '993.161.7151x27', 'Pune'),
(54, 'Justin Wright', 'christopherwaller@torres.com', '(513)840-1418x8', 'Nashik'),
(55, 'George Owens', 'ewashington@copeland.info', '(388)083-5229x2', 'Pune'),
(56, 'Amy Mays', 'grimesjoshua@hotmail.com', '467-512-7298', 'Nashik'),
(57, 'Lisa Ferguson', 'kchen@yahoo.com', '(337)511-7376', 'Nashik'),
(58, 'James Morris', 'swansondaniel@hotmail.com', '(276)271-4231', 'Pune'),
(59, 'Victor Silva', 'derrick64@gmail.com', '908.656.0434', 'Nashik'),
(60, 'Joshua Bryant', 'monicajackson@turner.biz', '(367)204-8903x7', 'Pune');

select * from riders;
INSERT INTO Drivers (name, email, phone, vehicle_number, city) VALUES
-- Existing 30 records
('Emily Carrillo', 'tiffanystephenson@smith.com', '269-137-2082x12', 'MH-57-9356', 'Mumbai'),
('Sylvia Massey', 'suarezjohn@barnett-arroyo.net', '526.710.9436x95', 'MH-92-3973', 'Mumbai'),
('Carrie Berger', 'ismith@bishop-mueller.net', '421.397.5135x03', 'MH-72-5290', 'Navi Mumbai'),
('Dr. Jason Hubbard DDS', 'ywalker@gmail.com', '001-896-513-303', 'MH-52-6520', 'Nashik'),
('Margaret Lamb', 'jonathanmitchell@burgess.com', '+1-461-056-6959', 'MH-60-2200', 'Pune'),
('John Cannon', 'vhernandez@gmail.com', '615-300-6291', 'MH-59-6506', 'Mumbai'),
('Matthew Lawrence', 'kylejackson@yahoo.com', '+1-044-460-1805', 'MH-34-2444', 'Thane'),
('Terri Meadows', 'patelrachel@watts.com', '586-492-8339x76', 'MH-11-6765', 'Navi Mumbai'),
('Thomas Perry', 'lucerojustin@hotmail.com', '3725555859', 'MH-61-9716', 'Nashik'),
('Amber Bowman', 'jonathan85@gross.net', '001-893-579-565', 'MH-17-5713', 'Pune'),
('Kristen Patel', 'sjones@gmail.com', '275-251-3516', 'MH-90-4823', 'Nashik'),
('Timothy Valdez', 'lkrueger@kent.net', '(200)821-3508', 'MH-71-3909', 'Navi Mumbai'),
('Stephanie Mendoza', 'jack02@yahoo.com', '814.918.1089', 'MH-78-8282', 'Pune'),
('Christian Macias', 'dgibson@gmail.com', '206-338-1490', 'MH-69-1723', 'Mumbai'),
('Richard Shannon', 'tonya26@yahoo.com', '001-319-658-365', 'MH-27-8476', 'Navi Mumbai'),
('Samantha James', 'istone@stewart-henry.org', '850-266-6784', 'MH-12-5200', 'Thane'),
('Randy Herman', 'belindarogers@yahoo.com', '453-313-8596', 'MH-97-5455', 'Pune'),
('Karen Lopez', 'smithbrandon@gmail.com', '(825)242-1291x5', 'MH-91-7887', 'Mumbai'),
('Jamie Holden', 'amandacarter@yahoo.com', '(649)011-3970', 'MH-23-2025', 'Nashik'),
('Crystal Gray', 'ronnie40@middleton.com', '(584)559-5697', 'MH-55-2454', 'Mumbai'),
('Benjamin Harrington', 'harrislaurie@yahoo.com', '(556)222-9543', 'MH-65-1140', 'Nashik'),
('Mrs. Kelsey Velasquez', 'michelle83@gmail.com', '001-502-702-012', 'MH-58-2203', 'Nashik'),
('Nicole Nichols', 'guzmanzachary@jackson.biz', '+1-939-372-0175', 'MH-98-7622', 'Mumbai'),
('Logan Brown', 'anna74@oneal.org', '+1-560-553-7485', 'MH-51-5301', 'Pune'),
('Amanda Mckinney', 'vsmith@bryant.com', '(695)978-5559x4', 'MH-14-6485', 'Pune'),
('Sheena Hopkins', 'brookejohnson@cantu.com', '001-974-145-914', 'MH-54-1389', 'Navi Mumbai'),
('William Arnold', 'mirandamoss@gmail.com', '001-961-894-229', 'MH-63-2052', 'Navi Mumbai'),
('Shelley Kennedy', 'lfuller@yahoo.com', '+1-353-514-9663', 'MH-57-4849', 'Mumbai'),
('Walter Hill', 'louisanderson@hotmail.com', '420-961-7137', 'MH-90-1936', 'Nashik'),
('Benjamin Atkinson', 'richard83@yahoo.com', '001-779-736-567', 'MH-59-9806', 'Thane'),
('Prakash Mehta', 'prakash.mehta@gmail.com', '9819012345', 'MH-01-1234', 'Mumbai'),
('Anjali Deshpande', 'anjali.deshpande@yahoo.com', '9820123456', 'MH-02-5678', 'Thane'),
('Ravi Kumar', 'ravi.kumar@hotmail.com', '9833456789', 'MH-03-8765', 'Navi Mumbai'),
('Sunita Patil', 'sunita.patil@gmail.com', '9845671234', 'MH-04-3456', 'Mumbai'),
('Amit Joshi', 'amit.joshi@outlook.com', '9856789123', 'MH-05-6789', 'Pune'),
('Deepak Sharma', 'deepak.sharma@gmail.com', '9867891234', 'MH-06-2345', 'Nashik'),
('Neha Nair', 'neha.nair@yahoo.com', '9878901234', 'MH-07-4321', 'Mumbai'),
('Suresh Iyer', 'suresh.iyer@gmail.com', '9889012345', 'MH-08-5432', 'Thane'),
('Priya Singh', 'priya.singh@hotmail.com', '9890123456', 'MH-09-9876', 'Navi Mumbai'),
('Rahul Jain', 'rahul.jain@gmail.com', '9901234567', 'MH-10-1357', 'Mumbai'),
('Pooja Shah', 'pooja.shah@gmail.com', '9912345678', 'MH-11-2468', 'Pune'),
('Arjun Reddy', 'arjun.reddy@hotmail.com', '9923456789', 'MH-12-9753', 'Mumbai'),
('Meera Kulkarni', 'meera.kulkarni@gmail.com', '9934567890', 'MH-13-8642', 'Thane'),
('Sanjay Pawar', 'sanjay.pawar@yahoo.com', '9945678901', 'MH-14-7531', 'Navi Mumbai'),
('Kavita Verma', 'kavita.verma@gmail.com', '9956789012', 'MH-15-6420', 'Mumbai'),
('Rajesh Gupta', 'rajesh.gupta@hotmail.com', '9967890123', 'MH-16-5319', 'Pune'),
('Alka Thakur', 'alka.thakur@gmail.com', '9978901234', 'MH-17-4208', 'Nashik'),
('Vikram Bhat', 'vikram.bhat@gmail.com', '9989012345', 'MH-18-3197', 'Mumbai'),
('Sneha Menon', 'sneha.menon@yahoo.com', '9990123456', 'MH-19-2086', 'Navi Mumbai'),
('Rohit Desai', 'rohit.desai@gmail.com', '9001234567', 'MH-20-1075', 'Thane'),
('Ankita Pandey', 'ankita.pandey@hotmail.com', '9012345678', 'MH-21-9064', 'Mumbai'),
('Varun Saxena', 'varun.saxena@gmail.com', '9023456789', 'MH-22-8053', 'Pune'),
('Divya Pillai', 'divya.pillai@gmail.com', '9034567890', 'MH-23-7042', 'Mumbai'),
('Karan Malhotra', 'karan.malhotra@yahoo.com', '9045678901', 'MH-24-6031', 'Thane'),
('Ritika Chavan', 'ritika.chavan@gmail.com', '9056789012', 'MH-25-5020', 'Nashik'),
('Abhishek Patil', 'abhishek.patil@gmail.com', '9067890123', 'MH-26-4019', 'Mumbai'),
('Shreya Ghosh', 'shreya.ghosh@hotmail.com', '9078901234', 'MH-27-3008', 'Navi Mumbai'),
('Nilesh Sawant', 'nilesh.sawant@gmail.com', '9089012345', 'MH-28-2097', 'Mumbai'),
('Tanvi Kulkarni', 'tanvi.kulkarni@gmail.com', '9090123456', 'MH-29-1086', 'Pune'),
('Harshad Shetty', 'harshad.shetty@gmail.com', '9101234567', 'MH-30-9875', 'Thane');

select * from drivers;

-- Trips
INSERT INTO Trips 
(trip_id, rider_id, driver_id, start_location, end_location, trip_date, distance_km, fare, status) 
VALUES
(1, 10, 30, 'Thane', 'Pune', '2025-08-23 07:20:54', 10.48, 213.26, 'Cancelled'),
(2, 34, 4, 'Navi Mumbai', 'Nashik', '2025-07-27 22:47:36', 10.88, 169.95, 'Completed'),
(3, 23, 15, 'Pune', 'Thane', '2025-08-09 07:30:15', 11.87, 269.96, 'Completed'),
(4, 33, 18, 'Navi Mumbai', 'Thane', '2025-06-17 12:54:54', 13.5, 276.14, 'Cancelled'),
(5, 15, 29, 'Nashik', 'Thane', '2025-08-19 18:50:46', 4.14, 100.59, 'Completed'),
(6, 26, 2, 'Nashik', 'Mumbai', '2025-09-12 11:14:30', 23.99, 481.03, 'Completed'),
(7, 15, 3, 'Nashik', 'Thane', '2025-09-02 15:45:36', 3.93, 80.74, 'Completed'),
(8, 32, 24, 'Pune', 'Mumbai', '2025-09-10 13:50:35', 7.91, 184.52, 'Cancelled'),
(9, 22, 13, 'Navi Mumbai', 'Nashik', '2025-08-24 02:21:31', 23.27, 490.94, 'Completed'),
(10, 22, 23, 'Nashik', 'Mumbai', '2025-07-11 08:59:09', 17.9, 333.06, 'Cancelled'),
(11, 24, 22, 'Pune', 'Thane', '2025-09-06 09:50:54', 10.25, 232.7, 'Cancelled'),
(12, 52, 25, 'Navi Mumbai', 'Navi Mumbai', '2025-09-07 07:11:14', 10.79, 248.83, 'Cancelled'),
(13, 25, 17, 'Thane', 'Navi Mumbai', '2025-06-26 14:24:56', 21.7, 407.18, 'Completed'),
(14, 33, 27, 'Nashik', 'Thane', '2025-08-12 18:14:01', 3.26, 61.31, 'Cancelled'),
(15, 20, 4, 'Pune', 'Nashik', '2025-07-17 17:52:05', 19.61, 432.66, 'Completed'),
(16, 54, 15, 'Nashik', 'Nashik', '2025-08-13 13:39:29', 9.91, 242.67, 'Cancelled'),
(17, 33, 19, 'Thane', 'Thane', '2025-07-07 06:34:12', 23.96, 403.06, 'Completed'),
(18, 47, 5, 'Pune', 'Nashik', '2025-09-03 14:52:52', 2.98, 74.44, 'Completed'),
(19, 39, 28, 'Mumbai', 'Pune', '2025-08-29 02:50:07', 13.59, 327.41, 'Cancelled'),
(20, 46, 19, 'Mumbai', 'Thane', '2025-08-02 02:39:52', 18.79, 324.61, 'Completed'),
(21, 27, 12, 'Pune', 'Mumbai', '2025-06-20 19:47:31', 15.96, 318.69, 'Completed'),
(22, 34, 6, 'Nashik', 'Navi Mumbai', '2025-09-12 03:24:07', 8.96, 211.96, 'Cancelled'),
(23, 15, 10, 'Nashik', 'Mumbai', '2025-06-30 22:54:24', 4.37, 92.33, 'Cancelled'),
(24, 52, 7, 'Nashik', 'Mumbai', '2025-07-09 02:32:38', 16.62, 314.51, 'Cancelled'),
(25, 8, 2, 'Nashik', 'Pune', '2025-06-26 14:04:23', 19.52, 377.91, 'Cancelled'),
(26, 10, 16, 'Navi Mumbai', 'Navi Mumbai', '2025-09-06 15:20:07', 23.38, 579.11, 'Completed'),
(27, 26, 30, 'Mumbai', 'Mumbai', '2025-07-10 18:28:28', 11.48, 209.16, 'Completed'),
(28, 57, 29, 'Pune', 'Thane', '2025-06-25 08:54:11', 23.32, 420.74, 'Cancelled'),
(29, 43, 21, 'Thane', 'Navi Mumbai', '2025-07-11 02:46:53', 13.86, 311.66, 'Completed'),
(30, 15, 17, 'Pune', 'Pune', '2025-07-07 13:12:42', 14.89, 281.43, 'Cancelled'),
(31, 27, 10, 'Thane', 'Nashik', '2025-07-28 05:41:30', 17.23, 348.16, 'Completed'),
(32, 14, 9, 'Mumbai', 'Navi Mumbai', '2025-06-18 17:22:15', 22.54, 412.52, 'Completed'),
(33, 19, 5, 'Navi Mumbai', 'Mumbai', '2025-08-05 11:13:59', 11.64, 221.83, 'Cancelled'),
(34, 25, 16, 'Nashik', 'Pune', '2025-09-01 08:44:11', 8.25, 187.44, 'Completed'),
(35, 31, 14, 'Thane', 'Nashik', '2025-09-09 21:32:05', 16.89, 339.12, 'Completed'),
(36, 42, 6, 'Mumbai', 'Pune', '2025-08-20 06:45:38', 12.72, 290.33, 'Completed'),
(37, 21, 22, 'Nashik', 'Navi Mumbai', '2025-08-25 13:21:25', 15.11, 325.52, 'Cancelled'),
(38, 53, 18, 'Thane', 'Thane', '2025-07-04 20:55:19', 14.98, 283.47, 'Completed'),
(39, 38, 11, 'Navi Mumbai', 'Thane', '2025-06-22 18:07:54', 6.75, 154.72, 'Cancelled'),
(40, 29, 8, 'Pune', 'Mumbai', '2025-09-11 16:33:27', 20.44, 420.18, 'Completed'),
(41, 44, 3, 'Mumbai', 'Thane', '2025-09-08 19:47:41', 4.88, 101.22, 'Completed'),
(42, 36, 20, 'Nashik', 'Mumbai', '2025-07-14 07:01:15', 18.74, 357.21, 'Cancelled'),
(43, 11, 1, 'Thane', 'Navi Mumbai', '2025-08-14 12:15:09', 21.54, 436.91, 'Completed'),
(44, 55, 23, 'Navi Mumbai', 'Pune', '2025-07-19 10:50:34', 14.62, 321.25, 'Cancelled'),
(45, 17, 7, 'Mumbai', 'Nashik', '2025-09-05 09:31:26', 19.39, 388.51, 'Completed'),
(46, 28, 27, 'Nashik', 'Mumbai', '2025-06-28 14:29:38', 12.28, 241.94, 'Cancelled'),
(47, 37, 2, 'Pune', 'Navi Mumbai', '2025-09-02 08:22:17', 7.44, 165.38, 'Completed'),
(48, 30, 13, 'Thane', 'Pune', '2025-08-01 15:17:12', 16.88, 332.47, 'Completed'),
(49, 49, 26, 'Mumbai', 'Mumbai', '2025-07-24 04:48:43', 5.32, 119.71, 'Completed'),
(50, 12, 21, 'Navi Mumbai', 'Thane', '2025-07-22 18:09:54', 11.15, 218.36, 'Cancelled'),
(51, 40, 9, 'Pune', 'Nashik', '2025-08-15 22:04:37', 9.68, 210.88, 'Completed'),
(52, 18, 4, 'Thane', 'Mumbai', '2025-06-19 20:22:09', 6.91, 134.21, 'Cancelled'),
(53, 45, 25, 'Mumbai', 'Thane', '2025-08-10 07:41:03', 13.77, 287.64, 'Completed'),
(54, 13, 19, 'Nashik', 'Navi Mumbai', '2025-07-29 16:17:45', 15.36, 328.59, 'Completed'),
(55, 16, 11, 'Pune', 'Mumbai', '2025-09-07 03:33:22', 7.19, 145.87, 'Cancelled'),
(56, 35, 17, 'Nashik', 'Pune', '2025-08-17 09:29:08', 20.77, 399.31, 'Completed'),
(57, 41, 28, 'Thane', 'Nashik', '2025-07-31 14:08:55', 10.83, 228.11, 'Completed'),
(58, 50, 29, 'Mumbai', 'Pune', '2025-06-29 05:52:47', 17.12, 351.46, 'Cancelled'),
(59, 9, 14, 'Navi Mumbai', 'Nashik', '2025-08-26 11:13:32', 12.37, 257.44, 'Completed'),
(60, 20, 12, 'Nashik', 'Pune', '2025-08-30 10:07:47', 18.23, 325.16, 'Completed'),
(61, 25, 42, 'Mumbai', 'Nashik', '2025-08-08 17:00:00', 27.01, 659.03, 'Cancelled'),
(62, 28, 35, 'Nashik', 'Pune', '2025-08-20 13:00:00', 14.37, 305.67, 'Cancelled'),
(63, 1, 55, 'Pune', 'Nashik', '2025-08-18 22:00:00', 3.15, 77.56, 'Completed'),
(64, 46, 55, 'Mumbai', 'Pune', '2025-08-19 01:00:00', 25.52, 600.85, 'Completed'),
(65, 23, 28, 'Thane', 'Pune', '2025-08-12 17:00:00', 14.17, 345.68, 'Completed'),
(66, 16, 5, 'Pune', 'Navi Mumbai', '2025-08-07 05:00:00', 23.79, 557.51, 'Completed'),
(67, 17, 16, 'Navi Mumbai', 'Pune', '2025-08-17 03:00:00', 22.03, 397.17, 'Completed'),
(68, 47, 45, 'Pune', 'Thane', '2025-08-06 09:00:00', 9.7, 241.23, 'Completed'),
(69, 7, 13, 'Navi Mumbai', 'Nashik', '2025-08-07 11:00:00', 23.24, 543.27, 'Completed'),
(70, 33, 52, 'Nashik', 'Pune', '2025-08-12 13:00:00', 25.9, 475.66, 'Cancelled'),
(71, 2, 33, 'Thane', 'Mumbai', '2025-08-22 01:00:00', 28.17, 607.68, 'Cancelled'),
(72, 53, 17, 'Pune', 'Navi Mumbai', '2025-08-14 16:00:00', 8.95, 167.74, 'Cancelled'),
(73, 27, 3, 'Mumbai', 'Thane', '2025-08-20 18:00:00', 27.08, 609.94, 'Cancelled'),
(74, 45, 30, 'Pune', 'Mumbai', '2025-08-13 22:00:00', 23.77, 529.5, 'Completed'),
(75, 51, 35, 'Thane', 'Pune', '2025-08-20 00:00:00', 4.48, 86.74, 'Completed'),
(76, 40, 22, 'Navi Mumbai', 'Thane', '2025-08-09 17:00:00', 22.85, 454.75, 'Completed'),
(77, 50, 45, 'Pune', 'Mumbai', '2025-08-09 03:00:00', 5.8, 122.45, 'Completed'),
(78, 44, 55, 'Navi Mumbai', 'Pune', '2025-08-12 02:00:00', 20.51, 511.74, 'Completed'),
(79, 50, 1, 'Pune', 'Navi Mumbai', '2025-08-17 00:00:00', 11.29, 225.3, 'Completed'),
(80, 46, 6, 'Pune', 'Navi Mumbai', '2025-08-03 07:00:00', 19.39, 434.01, 'Completed'),
(81, 43, 38, 'Mumbai', 'Nashik', '2025-08-14 00:00:00', 21.29, 383.73, 'Completed'),
(82, 23, 51, 'Mumbai', 'Nashik', '2025-08-10 19:00:00', 22.06, 442.54, 'Completed'),
(83, 59, 35, 'Nashik', 'Mumbai', '2025-08-06 06:00:00', 4.95, 122.85, 'Cancelled'),
(84, 8, 53, 'Pune', 'Mumbai', '2025-08-06 03:00:00', 9.75, 241.69, 'Completed'),
(85, 56, 33, 'Pune', 'Nashik', '2025-08-08 19:00:00', 20.09, 479.76, 'Completed'),
(86, 15, 31, 'Pune', 'Mumbai', '2025-08-09 12:00:00', 7.37, 154.2, 'Cancelled'),
(87, 16, 58, 'Mumbai', 'Navi Mumbai', '2025-08-07 04:00:00', 26.2, 512.05, 'Completed'),
(88, 17, 31, 'Thane', 'Navi Mumbai', '2025-08-09 21:00:00', 18.56, 441.06, 'Completed'),
(89, 28, 2, 'Pune', 'Thane', '2025-08-04 02:00:00', 28.97, 700.27, 'Completed'),
(90, 15, 22, 'Nashik', 'Mumbai', '2025-08-20 22:00:00', 14.74, 297.76, 'Completed'),
(91, 16, 28, 'Pune', 'Mumbai', '2025-08-10 14:00:00', 16.89, 395.78, 'Cancelled'),
(92, 31, 52, 'Nashik', 'Thane', '2025-08-13 05:00:00', 11.66, 272.52, 'Completed'),
(93, 17, 30, 'Thane', 'Pune', '2025-08-18 01:00:00', 3.58, 70.21, 'Cancelled'),
(94, 52, 2, 'Nashik', 'Pune', '2025-08-12 15:00:00', 11.79, 242.99, 'Cancelled'),
(95, 17, 51, 'Nashik', 'Mumbai', '2025-08-19 11:00:00', 3.08, 62.89, 'Cancelled'),
(96, 60, 36, 'Thane', 'Pune', '2025-08-11 23:00:00', 26.8, 533.27, 'Cancelled'),
(97, 10, 18, 'Thane', 'Mumbai', '2025-08-01 14:00:00', 22.86, 476.28, 'Cancelled'),
(98, 2, 13, 'Pune', 'Navi Mumbai', '2025-08-05 10:00:00', 12.32, 295.0, 'Cancelled'),
(99, 10, 19, 'Pune', 'Thane', '2025-08-10 05:00:00', 11.12, 218.81, 'Completed'),
(100, 19, 30, 'Pune', 'Thane', '2025-08-21 16:00:00', 7.99, 158.82, 'Cancelled'),
(101, 32, 13, 'Mumbai', 'Nashik', '2025-08-17 14:00:00', 29.71, 572.13, 'Completed'),
(102, 4, 30, 'Navi Mumbai', 'Thane', '2025-08-01 16:00:00', 29.14, 696.82, 'Completed'),
(103, 58, 11, 'Nashik', 'Pune', '2025-08-12 08:00:00', 10.25, 203.61, 'Cancelled'),
(104, 4, 18, 'Mumbai', 'Navi Mumbai', '2025-08-07 02:00:00', 22.26, 469.99, 'Cancelled'),
(105, 47, 46, 'Thane', 'Nashik', '2025-08-06 23:00:00', 3.98, 72.08, 'Completed'),
(106, 36, 52, 'Nashik', 'Pune', '2025-08-04 16:00:00', 22.77, 420.89, 'Cancelled'),
(107, 35, 37, 'Navi Mumbai', 'Thane', '2025-08-11 11:00:00', 7.09, 169.23, 'Cancelled'),
(108, 49, 29, 'Thane', 'Mumbai', '2025-08-21 00:00:00', 26.31, 495.75, 'Cancelled'),
(109, 25, 32, 'Thane', 'Navi Mumbai', '2025-08-19 19:00:00', 7.5, 147.28, 'Completed'),
(110, 43, 25, 'Thane', 'Mumbai', '2025-08-08 18:00:00', 28.34, 600.16, 'Completed'),
(111, 55, 2, 'Nashik', 'Pune', '2025-08-06 21:00:00', 23.51, 568.47, 'Completed'),
(112, 57, 37, 'Navi Mumbai', 'Mumbai', '2025-08-18 21:00:00', 25.79, 591.29, 'Cancelled'),
(113, 20, 9, 'Thane', 'Nashik', '2025-08-11 18:00:00', 15.73, 369.05, 'Completed'),
(114, 11, 27, 'Mumbai', 'Thane', '2025-08-02 13:00:00', 12.43, 278.07, 'Cancelled'),
(115, 47, 13, 'Navi Mumbai', 'Pune', '2025-08-03 18:00:00', 8.96, 211.83, 'Completed'),
(116, 32, 43, 'Thane', 'Navi Mumbai', '2025-08-11 16:00:00', 6.54, 159.26, 'Cancelled'),
(117, 17, 23, 'Thane', 'Pune', '2025-08-21 20:00:00', 9.25, 188.11, 'Cancelled'),
(118, 19, 21, 'Mumbai', 'Pune', '2025-08-18 19:00:00', 11.23, 227.45, 'Cancelled'),
(119, 20, 4, 'Pune', 'Nashik', '2025-08-08 16:00:00', 28.19, 523.93, 'Completed'),
(120, 29, 11, 'Nashik', 'Pune', '2025-08-17 22:00:00', 9.0, 184.51, 'Cancelled'),
(121, 45, 36, 'Mumbai', 'Nashik', '2025-08-06 06:00:00', 18.42, 350.04, 'Cancelled'),
(122, 6, 21, 'Mumbai', 'Nashik', '2025-08-06 14:00:00', 10.89, 253.69, 'Cancelled'),
(123, 37, 40, 'Thane', 'Navi Mumbai', '2025-08-11 07:00:00', 3.79, 91.25, 'Completed'),
(124, 30, 57, 'Nashik', 'Thane', '2025-08-12 16:00:00', 21.36, 431.5, 'Completed'),
(125, 50, 42, 'Pune', 'Navi Mumbai', '2025-08-03 18:00:00', 27.66, 564.37, 'Completed'),
(126, 41, 14, 'Thane', 'Navi Mumbai', '2025-08-08 21:00:00', 18.05, 349.44, 'Completed'),
(127, 24, 19, 'Pune', 'Nashik', '2025-08-15 08:00:00', 14.93, 366.86, 'Completed'),
(128, 15, 16, 'Thane', 'Mumbai', '2025-08-04 01:00:00', 25.22, 507.78, 'Completed'),
(129, 17, 1, 'Thane', 'Nashik', '2025-08-09 08:00:00', 6.3, 120.51, 'Cancelled'),
(130, 40, 53, 'Pune', 'Thane', '2025-08-05 02:00:00', 12.98, 235.9, 'Completed'),
(131, 24, 10, 'Navi Mumbai', 'Pune', '2025-08-13 07:00:00', 16.09, 316.09, 'Cancelled'),
(132, 23, 37, 'Pune', 'Nashik', '2025-08-22 03:00:00', 3.02, 59.93, 'Cancelled'),
(133, 59, 39, 'Mumbai', 'Thane', '2025-08-02 17:00:00', 18.55, 347.5, 'Completed'),
(134, 36, 60, 'Mumbai', 'Pune', '2025-08-03 19:00:00', 20.5, 379.98, 'Cancelled'),
(135, 47, 21, 'Navi Mumbai', 'Thane', '2025-08-13 23:00:00', 7.39, 149.18, 'Completed'),
(136, 33, 55, 'Navi Mumbai', 'Thane', '2025-08-16 05:00:00', 7.1, 168.84, 'Cancelled'),
(137, 20, 23, 'Navi Mumbai', 'Mumbai', '2025-08-05 22:00:00', 20.33, 496.21, 'Cancelled'),
(138, 60, 56, 'Nashik', 'Pune', '2025-08-09 08:00:00', 8.25, 186.88, 'Completed'),
(139, 38, 4, 'Nashik', 'Thane', '2025-08-08 14:00:00', 12.25, 257.21, 'Completed'),
(140, 24, 1, 'Nashik', 'Thane', '2025-08-05 13:00:00', 11.71, 265.13, 'Cancelled'),
(141, 35, 27, 'Mumbai', 'Pune', '2025-08-10 20:00:00', 23.83, 565.83, 'Cancelled'),
(142, 20, 50, 'Mumbai', 'Nashik', '2025-08-10 18:00:00', 6.07, 126.09, 'Completed'),
(143, 55, 57, 'Nashik', 'Mumbai', '2025-08-03 01:00:00', 25.28, 498.01, 'Cancelled'),
(144, 24, 55, 'Pune', 'Thane', '2025-08-10 02:00:00', 23.77, 593.46, 'Completed'),
(145, 51, 49, 'Thane', 'Navi Mumbai', '2025-08-08 08:00:00', 22.96, 418.6, 'Completed'),
(146, 53, 22, 'Pune', 'Mumbai', '2025-08-18 01:00:00', 10.91, 204.64, 'Cancelled'),
(147, 17, 28, 'Navi Mumbai', 'Mumbai', '2025-08-03 08:00:00', 23.69, 445.84, 'Cancelled'),
(148, 3, 59, 'Thane', 'Nashik', '2025-08-07 08:00:00', 13.87, 335.4, 'Cancelled'),
(149, 10, 59, 'Mumbai', 'Navi Mumbai', '2025-08-07 11:00:00', 4.99, 120.55, 'Completed'),
(150, 50, 47, 'Thane', 'Navi Mumbai', '2025-08-01 17:00:00', 19.58, 429.03, 'Cancelled');

SELECT * FROM Trips;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE Ratings;
TRUNCATE TABLE Payments;
TRUNCATE TABLE Trips;
TRUNCATE TABLE Drivers;
TRUNCATE TABLE Riders;
SET FOREIGN_KEY_CHECKS = 1;


SELECT COUNT(*) FROM Riders;
SELECT MIN(rider_id), MAX(rider_id) FROM Riders;

SELECT * FROM ride.Riders WHERE rider_id = 43;



-- Payments
INSERT INTO Payments (payment_id, trip_id, payment_method, amount, payment_date) VALUES
(2, 2, 'Card', 169.95, '2025-07-27 22:47:36'),
(3, 3, 'Wallet', 269.96, '2025-08-09 07:30:15'),
(5, 5, 'Cash', 100.59, '2025-08-19 18:50:46'),
(6, 6, 'Cash', 481.03, '2025-09-12 11:14:30'),
(7, 7, 'Wallet', 80.74, '2025-09-02 15:45:36'),
(9, 9, 'Wallet', 490.94, '2025-08-24 02:21:31'),
(13, 13, 'Card', 407.18, '2025-06-26 14:24:56'),
(15, 15, 'Wallet', 432.66, '2025-07-17 17:52:05'),
(17, 17, 'Card', 403.06, '2025-07-07 06:34:12'),
(18, 18, 'Card', 74.44, '2025-09-03 14:52:52'),
(20, 20, 'Card', 324.61, '2025-08-02 02:39:52'),
(21, 21, 'Cash', 318.69, '2025-06-20 19:47:31'),
(26, 26, 'Cash', 579.11, '2025-09-06 15:20:07'),
(27, 27, 'Cash', 209.16, '2025-07-10 18:28:28'),
(29, 29, 'Card', 311.66, '2025-07-11 02:46:53'),
(31, 31, 'Cash', 287.33, '2025-08-24 00:55:14'),
(33, 33, 'Wallet', 377.99, '2025-07-16 23:51:27'),
(35, 35, 'Cash', 319.48, '2025-07-09 00:57:19'),
(37, 37, 'Cash', 251.99, '2025-09-05 16:13:37'),
(39, 39, 'Card', 52.10, '2025-08-16 21:31:13'),
(42, 42, 'Card', 220.12, '2025-08-16 22:09:02'),
(44, 44, 'Cash', 140.26, '2025-09-04 20:57:21'),
(45, 45, 'Card', 349.60, '2025-08-27 11:34:42'),
(46, 46, 'Card', 166.64, '2025-07-09 02:32:06'),
(49, 49, 'Wallet', 361.43, '2025-08-29 11:51:56'),
(50, 50, 'Card', 340.66, '2025-06-30 21:23:38'),
(54, 54, 'Card', 312.98, '2025-08-17 17:20:03'),
(55, 55, 'Cash', 91.45, '2025-09-03 15:16:49'),
(56, 56, 'Cash', 447.79, '2025-08-22 23:00:26'),
(57, 57, 'Wallet', 104.27, '2025-08-23 21:30:29'),
(59, 59, 'Wallet', 49.57, '2025-07-06 16:34:30'),
(60, 60, 'Wallet', 325.16, '2025-08-30 10:07:47'),
(61, 61, 'Wallet', 472.96, '2025-07-30 05:38:24'),
(65, 65, 'Wallet', 518.29, '2025-08-05 04:54:58'),
(68, 68, 'Wallet', 165.15, '2025-08-04 04:16:02'),
(69, 69, 'Wallet', 120.67, '2025-09-09 20:29:47'),
(70, 70, 'Card', 447.12, '2025-07-06 04:47:03'),
(73, 73, 'Wallet', 184.77, '2025-09-09 11:31:26'),
(75, 75, 'Wallet', 265.30, '2025-08-31 17:18:08'),
(76, 76, 'Card', 253.03, '2025-08-04 06:16:40'),
(77, 77, 'Wallet', 104.11, '2025-07-07 22:29:35'),
(78, 78, 'Cash', 284.67, '2025-07-13 19:06:34'),
(80, 80, 'Cash', 334.97, '2025-06-27 22:35:16'),
(85, 85, 'Wallet', 296.04, '2025-08-07 01:23:15'),
(86, 86, 'Cash', 348.56, '2025-06-27 06:21:29'),
(88, 88, 'Wallet', 401.81, '2025-07-31 04:18:31'),
(89, 89, 'Wallet', 113.03, '2025-07-06 21:51:50'),
(90, 90, 'Wallet', 363.65, '2025-07-02 06:56:16'),
(92, 92, 'Card', 207.12, '2025-08-03 00:53:51'),
(94, 94, 'Wallet', 348.25, '2025-09-12 05:21:45'),
(95, 95, 'Cash', 287.57, '2025-08-02 13:29:53'),
(96, 96, 'Wallet', 444.89, '2025-08-07 03:57:22'),
(98, 98, 'Wallet', 199.10, '2025-07-21 14:49:42'),
(99, 99, 'Card', 378.55, '2025-07-23 17:16:38'),
(100, 100, 'Cash', 516.88, '2025-07-16 18:10:38'),
(101, 101, 'Card', 150.28, '2025-08-05 03:04:46'),
(103, 103, 'Cash', 139.81, '2025-07-30 20:48:36'),
(104, 104, 'Cash', 341.84, '2025-08-02 07:21:25'),
(105, 105, 'Cash', 206.40, '2025-08-19 18:30:49'),
(109, 109, 'Wallet', 183.11, '2025-08-28 00:42:53'),
(110, 110, 'Wallet', 451.80, '2025-09-04 10:49:00'),
(122, 122, 'Wallet', 60.50, '2025-08-16 01:39:04'),
(124, 124, 'Wallet', 379.46, '2025-07-31 13:51:31'),
(126, 126, 'Card', 70.58, '2025-06-29 17:21:19'),
(127, 127, 'Wallet', 237.30, '2025-07-15 11:14:00'),
(131, 131, 'Wallet', 112.63, '2025-06-26 16:21:13'),
(132, 132, 'Cash', 220.23, '2025-07-20 15:22:07'),
(133, 133, 'Card', 359.07, '2025-06-28 19:18:07'),
(134, 134, 'Wallet', 362.66, '2025-07-28 14:58:17'),
(137, 137, 'Cash', 103.87, '2025-08-20 06:26:01'),
(138, 138, 'Card', 36.75, '2025-07-07 00:13:54'),
(139, 139, 'Cash', 402.06, '2025-07-28 02:35:45'),
(140, 140, 'Wallet', 128.07, '2025-08-29 11:01:11'),
(141, 141, 'Card', 523.93, '2025-06-27 11:41:24'),
(142, 142, 'Wallet', 103.02, '2025-08-18 15:00:02'),
(145, 145, 'Wallet', 349.61, '2025-07-05 13:52:54'),
(147, 147, 'Cash', 293.46, '2025-08-10 14:04:42'),
(148, 148, 'Wallet', 308.79, '2025-07-27 07:28:34'),
(149, 149, 'Wallet', 564.07, '2025-09-09 16:02:15'),
(150, 150, 'Cash', 554.08, '2025-06-16 18:55:42'),
(151, 151, 'Wallet', 159.22, '2025-07-04 04:03:28'),
(153, 153, 'Card', 147.25, '2025-07-08 05:49:16'),
(155, 155, 'Card', 222.30, '2025-07-25 07:19:42'),
(156, 156, 'Card', 602.33, '2025-07-01 05:56:04'),
(158, 158, 'Wallet', 92.26, '2025-07-07 18:16:12'),
(160, 160, 'Wallet', 62.53, '2025-08-22 06:15:00');

select * from payments;
-- Ratings
INSERT INTO Ratings (rating_id, trip_id, rider_rating, driver_rating, comments) VALUES
(2, 2, 5, 3, 'Light many through learn parent explain south.'),
(3, 3, 4, 5, 'Four audience or already.'),
(5, 5, 4, 4, 'Final dark such chair.'),
(6, 6, 4, 5, 'Approach single sell safe plan leave that.'),
(7, 7, 3, 4, 'Understand key community away.'),
(9, 9, 5, 4, 'Say sea see.'),
(13, 13, 3, 4, 'Finish fall wrong behavior Democrat.'),
(15, 15, 4, 4, 'Leg job understand small fast stuff.'),
(17, 17, 5, 4, 'Avoid player among heart sing.'),
(18, 18, 4, 3, 'Itself head order one.'),
(20, 20, 4, 3, 'Least else several word.'),
(21, 21, 3, 4, 'Tell provide or your however weight.'),
(26, 26, 3, 3, 'The catch eat long opportunity lot.'),
(27, 27, 3, 5, 'Everything top large structure list once political.'),
(29, 29, 3, 4, 'Style building of difficult other any service very.'),
(31, 31, 3, 4, 'Avoid successful lose nothing much late.'),
(33, 33, 5, 4, 'Project either vote responsibility.'),
(35, 35, 3, 3, 'Region include piece heart market officer.'),
(37, 37, 3, 4, 'Reason central bring international reduce teacher nearly somebody.'),
(39, 39, 3, 3, 'None direction together listen shake.'),
(42, 42, 5, 3, 'Weight will quite.'),
(44, 44, 3, 5, 'International get child away federal night prove young.'),
(45, 45, 3, 4, 'In sister individual sort service way.'),
(46, 46, 3, 3, 'Play social billion act most.'),
(49, 49, 3, 4, 'Tend parent run perhaps political product huge.'),
(50, 50, 3, 3, 'Especially control move art respond exist.'),
(54, 54, 3, 4, 'He activity investment detail.'),
(55, 55, 4, 5, 'Candidate study great order something.'),
(56, 56, 3, 4, 'Might past himself short station almost note from.'),
(57, 57, 3, 4, 'Investment wide majority.'),
(59, 59, 5, 5, 'Result never believe exactly exactly stand.'),
(60, 60, 5, 5, 'Effect for ever class paper discussion several tend.'),
(61, 61, 5, 5, 'Treatment true list believe.'),
(65, 65, 4, 3, 'Issue control animal care determine reveal.'),
(68, 68, 5, 5, 'Daughter candidate foreign east.'),
(69, 69, 5, 4, 'These wait power anything.'),
(70, 70, 5, 5, 'Recently right both fall agree chance wide.'),
(73, 73, 4, 4, 'Instead defense rate all recent since his.'),
(75, 75, 4, 3, 'Education relate take.'),
(76, 76, 4, 5, 'You important consider.'),
(77, 77, 3, 5, 'Oil budget chance value or.'),
(78, 78, 4, 3, 'Back occur lawyer degree explain so.'),
(80, 80, 3, 4, 'Want some prove sing use school involve age.'),
(85, 85, 4, 3, 'Lose southern attack less last visit.'),
(86, 86, 4, 4, 'Arm war enter dream color resource.'),
(88, 88, 4, 4, 'Nor mind pressure decide.'),
(89, 89, 4, 5, 'You down member father occur case.'),
(90, 90, 3, 5, 'Daughter charge baby language.'),
(92, 92, 4, 3, 'Impact pattern create Mrs.'),
(94, 94, 4, 3, 'Answer away write teacher.'),
(95, 95, 3, 3, 'City site stuff his.'),
(96, 96, 5, 3, 'Course new wall identify view general.'),
(98, 98, 4, 4, 'The between me near nation draw father film.'),
(99, 99, 5, 5, 'Thank type where deep structure feel.'),
(100, 100, 5, 3, 'Machine rather also side anyone power remember.'),
(101, 101, 5, 5, 'Base often mind certainly treatment anyone.'),
(103, 103, 5, 3, 'Ok subject just pull wish.'),
(104, 104, 4, 4, 'As cell big nothing choose.'),
(105, 105, 4, 4, 'Good month various quality in.'),
(109, 109, 5, 4, 'Three idea continue list site.'),
(110, 110, 4, 4, 'Always whatever than major.'),
(122, 122, 5, 5, 'Agent artist write customer true.'),
(124, 124, 5, 5, 'Improve hair human modern film page.'),
(126, 126, 3, 5, 'Cold number nice system allow stop fight human.'),
(127, 127, 5, 4, 'Add door staff may.'),
(131, 131, 3, 3, 'Sit include indeed mention middle base write.'),
(132, 132, 4, 3, 'West answer reach all attorney.'),
(133, 133, 3, 5, 'Upon these future by.'),
(134, 134, 3, 3, 'Professor administration least management put.'),
(137, 137, 4, 5, 'These college plan agree wife guy fill.'),
(138, 138, 3, 3, 'War best kind born view.'),
(139, 139, 3, 4, 'Clearly media choice between him.'),
(140, 140, 3, 5, 'Recent thing speak bag responsibility while also.'),
(141, 141, 3, 4, 'The protect despite traditional my name trade far.'),
(142, 142, 3, 3, 'Under message question there.'),
(145, 145, 5, 5, 'Indeed let financial newspaper race.'),
(147, 147, 3, 3, 'Economy trouble hold reflect attention production.'),
(148, 148, 5, 5, 'Suffer purpose you people.'),
(149, 149, 5, 5, 'Yard many establish.'),
(150, 150, 4, 5, 'Affect listen star us small address process.'),
(151, 151, 5, 5, 'Study executive child five.'),
(153, 153, 4, 3, 'Free smile hotel red system and.'),
(155, 155, 5, 3, 'Nothing add reason human improve.'),
(156, 156, 3, 3, 'Those argue box sea seat again break.'),
(158, 158, 4, 4, 'Enough positive free letter type.'),
(160, 160, 5, 4, 'Month red instead heart probably.');

select * from ratings;

-- querys 
--  1. Show all riders from Mumbai.
SELECT * 
FROM Riders
WHERE city = 'Mumbai';

-- 2. Show the total number of drivers in Navi Mumbai

SELECT COUNT(*) AS total_drivers
FROM Drivers
WHERE city = 'Navi Mumbai';

-- 3. List all completed trips with fare above 500.

SELECT trip_id, rider_id, driver_id, fare
FROM Trips
WHERE status = 'Completed' AND fare > 500;

-- 4. Find the average fare per city (based on trip start location).

SELECT start_location, AVG(fare) AS avg_fare
FROM Trips
GROUP BY start_location;

-- 5. Show cities where the average fare is greater than 300.

SELECT start_location, AVG(fare) AS avg_fare
FROM Trips
GROUP BY start_location
HAVING AVG(fare) > 300;

-- 6. Show all payments done using Wallet.

SELECT * 
FROM Payments
WHERE payment_method = 'Wallet';

-- 7. Find top 5 trips with the highest fare.
SELECT trip_id, rider_id, driver_id, fare
FROM Trips
ORDER BY fare DESC
LIMIT 5;

-- 8. Show the rider names with their total number of trips.
SELECT r.name, COUNT(t.trip_id) AS total_trips
FROM Riders r
JOIN Trips t ON r.rider_id = t.rider_id
GROUP BY r.name;

-- 9. List drivers who have completed more than 10 trips. -----
SELECT d.name, COUNT(t.trip_id) AS total_trips
FROM Drivers d
JOIN Trips t ON d.driver_id = t.driver_id
WHERE t.status = 'Completed'
GROUP BY d.name
HAVING COUNT(t.trip_id) > 10;

-- 10. Show the total payment amount received by each driver.
SELECT d.name, SUM(p.amount) AS total_earnings
FROM Drivers d
JOIN Trips t ON d.driver_id = t.driver_id
JOIN Payments p ON t.trip_id = p.trip_id
GROUP BY d.name;

-- 11. Show the average rider rating for each driver.
SELECT d.name, AVG(r.driver_rating) AS avg_rating
FROM Drivers d
JOIN Trips t ON d.driver_id = t.driver_id
JOIN Ratings r ON t.trip_id = r.trip_id
GROUP BY d.name;

 -- 12. Show trips along with rider and driver names. (3-table join)
SELECT t.trip_id, r.name AS rider_name, d.name AS driver_name, t.fare
FROM Trips t
JOIN Riders r ON t.rider_id = r.rider_id
JOIN Drivers d ON t.driver_id = d.driver_id;

-- 13. Find drivers who have never received a rating below 3.
SELECT d.name
FROM Drivers d
WHERE d.driver_id NOT IN (
    SELECT t.driver_id
    FROM Trips t
    JOIN Ratings r ON t.trip_id = r.trip_id
    WHERE r.driver_rating < 3
);

-- 14. Find riders who have spent more than 2000 in total fares.---- 
SELECT r.name, SUM(p.amount) AS total_spent
FROM Riders r
JOIN Trips t ON r.rider_id = t.rider_id
JOIN Payments p ON t.trip_id = p.trip_id
GROUP BY r.name
HAVING SUM(p.amount) > 2000;

-- 15. Show the trip with the maximum fare using a subquery.
SELECT * 
FROM Trips
WHERE fare = (SELECT MAX(fare) FROM Trips);

-- 16. Show all driver names in uppercase.
SELECT UPPER(name) AS driver_name
FROM Drivers;

-- 17. Show rider names along with the length of their names.
SELECT name, LENGTH(name) AS name_length
FROM Riders;

-- 18. Find all drivers whose name starts with ‘A’.
SELECT * 
FROM Drivers
WHERE name LIKE 'A%';

-- 19. Show all comments from Ratings that contain the word “good”.
SELECT *
FROM Ratings
WHERE comments LIKE '%good%';

-- 20. Rank drivers based on their average rider rating. (Window function)
SELECT d.name, AVG(r.rider_rating) AS avg_rider_rating,
       RANK() OVER (ORDER BY AVG(r.rider_rating) DESC) AS rating_rank
FROM Drivers d
JOIN Trips t ON d.driver_id = t.driver_id
JOIN Ratings r ON t.trip_id = r.trip_id
GROUP BY d.name;

-- 21. Show the cumulative fare earned by each driver. (Window function)
SELECT d.name, t.trip_id, t.fare,
       SUM(t.fare) OVER (PARTITION BY d.driver_id ORDER BY t.trip_date) AS cumulative_fare
FROM Trips t
JOIN Drivers d ON t.driver_id = d.driver_id;

-- 22. Show the difference between each trip fare and the average fare of all trips. (Window function)
SELECT trip_id, fare,
       fare - AVG(fare) OVER () AS fare_difference
FROM Trips;

-- 24. Modify the data type of phone number in Drivers table (DDL/ALTER).
ALTER TABLE Drivers
MODIFY phone VARCHAR(15);

-- 24. Show foreign key relationship in Trips table (DDL).
SHOW CREATE TABLE Trips;






