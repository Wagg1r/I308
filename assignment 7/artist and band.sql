CREATE TABLE artist (
id INT auto_increment,
fname VARCHAR(30),
lname VARCHAR(30),
dob DATE,
hometown VARCHAR(50),
gender VARCHAR(10),
PRIMARY KEY (id)
) ENGINE = innodb;
CREATE TABLE band (
id INT auto_increment,
title VARCHAR(50),
year_formed INT,
PRIMARY KEY (id)
) ENGINE = innodb;
CREATE TABLE member (
artist_id INT NOT NULL,
band_id INT NOT NULL,
joined_date DATE,
leave_date DATE,
FOREIGN KEY (artist_id) REFERENCES artist(id),
FOREIGN KEY (band_id) REFERENCES band(id)
) ENGINE = innodb;
CREATE TABLE album (
id INT auto_increment,
pub_year INT,
title VARCHAR(50),
publisher VARCHAR(50),
format VARCHAR(50),
band_id INT,
PRIMARY KEY (id),
FOREIGN KEY (band_id) REFERENCES band(id)
) ENGINE = innodb;
CREATE TABLE song (
album_id INT,
name VARCHAR(50),
length VARCHAR(50),
FOREIGN KEY (album_id) REFERENCES album(id)
) ENGINE = innodb;
INSERT INTO artist (fname, lname, dob, hometown, gender)
VALUES
('Harry', 'Styles', '1998-01-01', 'Manchester', 'male'),
('John', 'Lennon', '1940-04-09', 'Liverpool', 'male'),
('Paul', 'McCartney', '1942-06-18', 'Liverpool', 'male'),
('Mac', 'Miller', '1990-07-09', 'Pittsburgh', 'male'),
('Wesley', 'Shultz', '1999-03-04', 'Charleston', 'male'),
('Neyla', 'Pekarak', '1997-07-03', 'Fishers', 'female'),
('Justin', 'Beiber', '2001-08-02', 'Indianapolis', 'male'),
('Taylor', 'Swift', '1998-12-24', 'Knoxville', 'female'),
('Selena', 'Gomez', '1999-11-24', 'Chicago', 'female');
INSERT INTO band (id, title, year_formed)
VALUES
(100,'Beatles', '1967'),
(101,'Coldplay', '2002'),
(102, 'Nirvana', '1988'),
(103, 'One Direction', '2012'),
(104,'Train', '2003'),
(105,'Van Halen', '1978'),
(106,'Dixie Chicks', '1999');
INSERT INTO member (artist_id, band_id, joined_date, leave_date)
VALUES
(1,103,'2012-09-15','2018-09-15'),
(2,101,'1970-03-06','2000-03-04'),
(3,100,'1970-08-15','1980-04-15'),
(3,100,'2007-09-15','2022-09-15'),
(4,100,'2012-06-15-','2020-09-15'),
(5,100,'2012-07-30','2020-10-18-'),
(6,100,'2012-06-15','2020-09-15'),
(7,101,'2012-12-15','2022-09-15'),
(7,102,'2012-01-15','2022-09-15'),
(8,104,'2008-06-15','2010-09-15'),
(8,105,'2010-10-15','2012-09-15'),
(8,106,'2013-06-15','2015-09-15');
INSERT INTO album (id, pub_year, title, publisher, format, band_id)
VALUES
(201,2012, 'Viva La Vida', 'Air Deluxe Music Group', 'LP', '100'),
(202,2008, 'Fine Line', 'Air Deluxe Music Group', 'EP', '100'),
(203,2006, 'Full Circle', 'Air Deluxe Music Group', 'LP', '100'),
(204,2013, 'Rewind', 'Alea Publishing', 'EP', '101'),
(205,2019, 'Coffee', 'Alea Publishing', 'LP', '101'),
(206,2016, 'Circles', 'Alea Publishing', 'EP', '101'),
(207,1998, 'Take Care', 'Alexscar Music', 'EP', '102'),
(208,2000, 'Skyfall', 'Alexscar Music', 'LP', '102'),
(209,2005, 'Cleopatra', 'Alexscar Music', 'EP', '102'),
(210,2013, 'Northern Attitude', 'Alfred Publishing', 'LP', '103'),
(211,2011, 'Blow the Roof', 'Alfred Publishing', 'EP', '103'),
(212,2008, 'Waves of Blue', 'Alfred Publishing', 'EP', '104'),
(213,2012, 'Parachutes', 'Alfred Publishing', 'LP', '104'),
(214,2010, 'Starting Over', 'Alpha Major', 'LP', '105'),
(215,2007, 'House of Wax', 'Alpha Major', 'LP', '105'),
(216,2011, 'On Air', 'BJ Records', 'EP', '106'),
(217,2009, 'Folklore', 'BJ Records', 'LP', '106');
INSERT INTO song (album_id, name, length)
VALUES
(201, 'Life in Technicolor', '2:29'),
(201, 'Cemeteries of London', '3:21'),
(201, 'Lost!', '3:56'),
(201, 'Lovers in Japan', '6:51'),
(202, 'Golden',' 3:28'),
(202, 'Watermelon Sugar', '2:54'),
(202, 'Adore You', '3:27'),
(202, 'Cherry', '4:19'),
(202, 'She', '6:00'),
(203, 'Distracted Youth', '3:00'),
(203, 'SOS', '3:23'),
(203, 'Mexico City', '3:12'),
(204, 'Payback', '3:00'),
(204, 'DJ Tonight', '3:47'),
(204, 'Riot', '3:39'),
(204, 'Lifes a Song', '5:27'),
(205, 'Coffee', '3:00'),
(205, 'Stacy', '2:48'),
(205, 'Two 10s', '3:36'),
(206, 'Good News', '5:42'),
(206, 'Surf', '5:30'),
(206, 'Woods', '4:46'),
(206, 'Circles', '2:50'),
(207, 'Marvins Room', '5:47'),
(207, 'Headlines', '3:55'),
(207, 'Make Me Proud', '3:39'),
(207, 'Doing it Wrong', '4:25'),
(208, 'Skyfall', '4:46'),
(208, 'Easy On Me', '3:45'),
(208, 'Remedy', '4:05'),
(208, 'Set Fire to the Rain', '4:02'),
(209, 'Sleep On The Floor', '3:31'),
(209, 'Ophelia', '2:40'),
(209, 'Angela', '3:21'),
(210, 'Northern Attitude', '4:27'),
(210, 'Stick Season', '3:02'),
(210, 'False Confidence', '3:43'),
(210, 'Anyway', '5:12'),
(211, 'Blow the Roof', '3:05'),
(211, 'Better Not', '3:42'),
(211, 'Hole in My Heart', '2:51'),
(212, 'Waves of Blue', '3:28'),
(212, 'Breakaway', '2:12'),
(212, 'Carry On', '4:38'),
(213, 'Everythings Not Lost', '7:16'),
(213, 'Sparks', '3:47'),
(213, 'Yellow', '4:27'),
(213, 'Spies', '5:18'),
(214, 'Starting Over', '4:00'),
(214, 'Old Friends', '4:01'),
(214, 'You Should Probably Leave', '3:33'),
(215, 'Thank You', '3:37'),
(215, 'Thrills', '3:22'),
(215, 'Waiting', '2:33'),
(216, 'On Air', '3:57'),
(216, 'As One', '3:58'),
(216, 'The Change', '4:37'),
(216, 'Mr Regular', '2:54'),
(217, 'August', '4:21'),
(217, 'Illicit Affairs', '3:10'),
(217, 'Cardigan', '3:59')
;
SELECT title FROM album as a WHERE a.pub_year=1999;
SELECT b.title, a.title, s.name FROM song as s JOIN album as a ON a.id=album_id
JOIN band as b ON b.id = a.band_id WHERE length > '5:00';
SELECT s.name, a.pub_year FROM band as b JOIN album as a ON a.band_id = b.id JOIN
song as s ON s.album_id = a.id WHERE b.title = 'Beatles';
