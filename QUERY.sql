-- =========================================================================
-- SYSTEM: Football Ticket Booking System Database Setup Template
-- DESCRIPTION: Pseudo-DDL Template for Table Creation & Data Insertion
-- INSTRUCTIONS: Replace 'TYPE' and the constraint placeholders with your own
--               actual data types, relational keys, and check criteria.
-- =========================================================================

-- DROP TABLES IF THEY ALREADY EXIST TO PREVENT CONFLICTS
DROP TABLE IF EXISTS Bookings;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Users;

-- =========================================================================
-- 1. CREATE USERS TABLE
-- =========================================================================
CREATE TABLE Users (
    user_id serial primary key,
    full_name varchar(100),
    email varchar(200) unique not null,
    role varchar(50) check(role in ('Ticket Manager', 'Football Fan')),
    phone_number varchar(50)
);

-- =========================================================================
-- 2. CREATE MATCHES TABLE
-- =========================================================================
CREATE TABLE Matches (
    match_id serial primary key,
    fixture varchar(100) not null,
    tournament_category varchar(100) not null,
    base_ticket_price decimal(10,2) not null 
    check (base_ticket_price >=0),
    match_status varchar(50) not null check(match_status in
    ('Available','Selling Fast','Sold Out','Postponed'))

); 

-- =========================================================================
-- 3. CREATE BOOKINGS TABLE
-- =========================================================================
CREATE TABLE Bookings (
    booking_id serial primary key,
    user_id integer references users(user_id),
    match_id integer references matches(match_id),
    seat_number varchar(10),
    payment_status varchar(50) 
    check (payment_status 
    in ('Pending', 'Confirmed', 'Cancelled', 'Refunded')),
    total_cost numeric(10,2) not null check (total_cost>=0)
);


-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO USERS
-- =========================================================================
INSERT INTO Users (full_name, email, role, phone_number) VALUES
('Tanvir Rahman', 'tanvir@mail.com', 'Football Fan', '+8801711111111'),
('Asif Haque', 'asif@mail.com', 'Football Fan', '+8801722222222'),
('Sajjad Rahman', 'sajjad@mail.com', 'Ticket Manager', '+8801733333333'),
('Jannat Ara', 'jannat@mail.com', 'Football Fan', NULL),
('Nafis Ahmed', 'nafis@mail.com', 'Football Fan', '+8801744444444'),
('Mehedi Hasan', 'mehedi@mail.com', 'Football Fan', '+8801755555555'),
('Farzana Akter', 'farzana@mail.com', 'Football Fan', '+8801766666666'),
('Rifat Islam', 'rifat@mail.com', 'Football Fan', NULL),
('Nusrat Jahan', 'nusrat@mail.com', 'Football Fan', '+8801777777777'),
('Mahmudul Hasan', 'mahmud@mail.com', 'Football Fan', '+8801788888888'),
('Rakib Hossain', 'rakib@mail.com', 'Football Fan', '+8801799999999'),
('Sharmin Sultana', 'sharmin@mail.com', 'Football Fan', '+8801811111111'),
('Imran Kabir', 'imran@mail.com', 'Football Fan', '+8801822222222'),
('Tasnia Ahmed', 'tasnia@mail.com', 'Football Fan', NULL),
('Shakib Chowdhury', 'shakib@mail.com', 'Football Fan', '+8801833333333'),
('Mim Akter', 'mim@mail.com', 'Football Fan', '+8801844444444'),
('Hasib Rahman', 'hasib@mail.com', 'Football Fan', '+8801855555555'),
('Sabbir Ahmed', 'sabbir@mail.com', 'Football Fan', '+8801866666666'),
('Sadia Islam', 'sadia@mail.com', 'Football Fan', NULL),
('Fahim Karim', 'fahim@mail.com', 'Football Fan', '+8801877777777'),
('Raihan Hossain', 'raihan@mail.com', 'Football Fan', '+8801888888888'),
('Ayesha Siddika', 'ayesha@mail.com', 'Football Fan', '+8801899999999'),
('Muntasir Alam', 'muntasir@mail.com', 'Football Fan', '+8801911111111'),
('Priyanka Das', 'priyanka@mail.com', 'Football Fan', '+8801922222222'),
('Zubair Ahmed', 'zubair@mail.com', 'Football Fan', NULL),
('Nayeem Hasan', 'nayeem@mail.com', 'Football Fan', '+8801933333333'),
('Tanjina Akter', 'tanjina@mail.com', 'Football Fan', '+8801944444444'),
('Arif Mahmood', 'arif@mail.com', 'Ticket Manager', '+8801955555555'),
('Lubna Yasmin', 'lubna@mail.com', 'Ticket Manager', '+8801966666666'),
('Kamrul Islam', 'kamrul@mail.com', 'Ticket Manager', '+8801977777777');

-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO MATCHES
-- =========================================================================
INSERT INTO Matches (match_id, fixture, tournament_category, base_ticket_price, match_status) VALUES
(101, 'Real Madrid vs Barcelona', 'Champions League', 150.00, 'Available'),
(102, 'Man City vs Liverpool', 'Premier League', 120.00, 'Selling Fast'),
(103, 'Bayern Munich vs PSG', 'Champions League', 130.00, 'Available'),
(104, 'AC Milan vs Inter Milan', 'Serie A', 90.00, 'Sold Out'),
(105, 'Juventus vs Roma', 'Serie A', 80.00, 'Available');

-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO BOOKINGS
-- =========================================================================
INSERT INTO Bookings (booking_id, user_id, match_id, seat_number, payment_status, total_cost) VALUES
(501, 1, 101, 'A-12', 'Confirmed', 150.00),
(502, 1, 102, 'B-04', 'Confirmed', 120.00),
(503, 2, 101, 'A-13', 'Confirmed', 150.00),
(504, 2, 101, NULL, NULL, 150.00),
(505, 3, 102, 'C-20', 'Pending', 120.00);


--  Answers

-- Query 1: Retrieve all upcoming football matches belonging to the 'Champions League' where the match status is 'Available'.