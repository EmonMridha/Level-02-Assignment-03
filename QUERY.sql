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
INSERT INTO Matches (fixture, tournament_category, base_ticket_price, match_status) VALUES
('Real Madrid vs Barcelona', 'Champions League', 150.00, 'Available'),
('Manchester City vs Liverpool', 'Premier League', 120.00, 'Selling Fast'),
('Bayern Munich vs PSG', 'Champions League', 130.00, 'Available'),
('AC Milan vs Inter Milan', 'Serie A', 90.00, 'Sold Out'),
('Juventus vs Roma', 'Serie A', 80.00, 'Available'),
('Chelsea vs Arsenal', 'Premier League', 110.00, 'Available'),
('Tottenham Hotspur vs Manchester United', 'Premier League', 125.00, 'Selling Fast'),
('Borussia Dortmund vs RB Leipzig', 'Bundesliga', 95.00, 'Available'),
('Atletico Madrid vs Sevilla', 'La Liga', 100.00, 'Available'),
('Napoli vs Lazio', 'Serie A', 85.00, 'Available'),
('Ajax vs PSV Eindhoven', 'Eredivisie', 75.00, 'Selling Fast'),
('Benfica vs Porto', 'Primeira Liga', 90.00, 'Sold Out'),
('Celtic vs Rangers', 'Scottish Premiership', 80.00, 'Available'),
('Galatasaray vs Fenerbahce', 'Turkish Super Lig', 95.00, 'Selling Fast'),
('Flamengo vs Palmeiras', 'Brasileirão', 70.00, 'Available'),
('Boca Juniors vs River Plate', 'Argentine Primera División', 110.00, 'Sold Out'),
('Al Nassr vs Al Hilal', 'Saudi Pro League', 140.00, 'Selling Fast'),
('Inter Miami vs LA Galaxy', 'Major League Soccer', 105.00, 'Available'),
('Paris FC vs Marseille', 'Ligue 1', 85.00, 'Available'),
('Lyon vs Monaco', 'Ligue 1', 88.00, 'Postponed'),
('Sporting CP vs Braga', 'Primeira Liga', 78.00, 'Available'),
('Leicester City vs Aston Villa', 'Premier League', 92.00, 'Available'),
('Everton vs Newcastle United', 'Premier League', 98.00, 'Selling Fast'),
('Valencia vs Villarreal', 'La Liga', 87.00, 'Available'),
('Real Sociedad vs Athletic Bilbao', 'La Liga', 93.00, 'Sold Out'),
('Eintracht Frankfurt vs Bayer Leverkusen', 'Bundesliga', 102.00, 'Available'),
('Fiorentina vs Atalanta', 'Serie A', 89.00, 'Available'),
('Club Brugge vs Anderlecht', 'Belgian Pro League', 72.00, 'Available'),
('FC Copenhagen vs Midtjylland', 'Danish Superliga', 68.00, 'Selling Fast'),
('Shakhtar Donetsk vs Dynamo Kyiv', 'Ukrainian Premier League', 76.00, 'Postponed');

-- =========================================================================
-- DATA SEEDING: INSERT SAMPLE DATA INTO BOOKINGS
-- =========================================================================
INSERT INTO Bookings (user_id, match_id, seat_number, payment_status, total_cost) VALUES
(1, 1, 'A-12', 'Confirmed', 150.00),
(1, 2, 'B-04', 'Confirmed', 120.00),
(2, 1, 'A-13', 'Confirmed', 150.00),
(2, 5, NULL, 'Pending', 80.00),
(3, 2, 'C-20', 'Pending', 120.00),
(4, 3, 'D-05', 'Confirmed', 130.00),
(5, 4, 'A-22', 'Confirmed', 90.00),
(6, 6, 'B-18', 'Refunded', 110.00),
(7, 7, 'C-11', 'Confirmed', 125.00),
(8, 8, 'A-09', 'Cancelled', 95.00),
(9, 9, 'D-16', 'Confirmed', 100.00),
(10, 10, 'B-25', 'Pending', 85.00),
(11, 11, 'C-08', 'Confirmed', 75.00),
(12, 12, 'A-15', 'Confirmed', 90.00),
(13, 13, 'D-03', 'Confirmed', 80.00),
(14, 14, 'B-12', 'Pending', 95.00),
(15, 15, 'C-19', 'Confirmed', 70.00),
(16, 16, 'A-30', 'Confirmed', 110.00),
(17, 17, 'B-09', 'Confirmed', 140.00),
(18, 18, 'D-14', 'Confirmed', 105.00),
(19, 19, 'C-06', 'Refunded', 85.00),
(20, 20, 'A-02', 'Pending', 88.00),
(21, 21, 'B-10', 'Confirmed', 78.00),
(22, 22, 'C-17', 'Confirmed', 92.00),
(23, 23, 'D-21', 'Cancelled', 98.00),
(24, 24, 'A-08', 'Confirmed', 87.00),
(25, 25, 'B-26', 'Confirmed', 93.00),
(26, 26, 'C-13', 'Pending', 102.00),
(27, 27, 'D-07', 'Confirmed', 89.00),
(28, 28, 'A-19', 'Confirmed', 72.00);


--  Answers

-- Query 1: Retrieve all upcoming football matches belonging to the 'Champions League' where the match status is 'Available'.

select match_id,fixture,base_ticket_price from matches where tournament_category = 'Champions League' and 
match_status = 'Available'

-- Query 2: Search for all users whose full names start with 'Tanvir' or contain the phrase 'Haque' (case-insensitive)

select user_id,full_name,email from users 
  where full_name ilike 'Tanvir%' or full_name ilike '%haque%'

  -- Query 3: Retrieve all booking records where the payment status is missing (NULL), replacing the empty result with 'Action Required'

  select booking_id, user_id, match_id, 
  coalesce(payment_status, 'Action Required') as systematic_status
from bookings where payment_status is null

-- Query 4: Retrieve match booking details along with the User's full name and the scheduled Match fixture teams.

