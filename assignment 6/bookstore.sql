/* Drop tables if they exist. Add more DROP TABLE statements as you create more
tables*/
DROP TABLE IF EXISTS trans CASCADE;
DROP TABLE IF EXISTS customer CASCADE;
DROP TABLE IF EXISTS book CASCADE;
DROP TABLE IF EXISTS publisher CASCADE;
/* Create all tables. Order matters due to foreign keys. */
CREATE TABLE customer (
id INT auto_increment,
name VARCHAR(30) NOT NULL,
address VARCHAR(50),
phone VARCHAR(15),
PRIMARY KEY (id)
) ENGINE = innodb;
CREATE TABLE publisher (
id INT auto_increment,
name VARCHAR(50) NOT NULL,
city VARCHAR(50),
PRIMARY KEY (id)
) ENGINE = innodb;
CREATE TABLE book (
id INT auto_increment,
title VARCHAR(50) NOT NULL,
price DECIMAL(5,2),
pubid INT,
PRIMARY KEY (id),
FOREIGN KEY (pubid) REFERENCES publisher(id)
) ENGINE = innodb;
CREATE TABLE trans(
custid INT NOT NULL,
bookid INT NOT NULL,
tdate DATE,
FOREIGN KEY (custid) REFERENCES customer(id),
FOREIGN KEY (bookid) REFERENCES book(id)
) ENGINE = innodb;
/* Inserting data into tables. Order matters because of foreign keys. */
INSERT INTO publisher (id, name, city) VALUES
(300, 'Penguin', 'NYC'),
(301, 'Richert, Inc','Madison'),
(302, 'Instructure','Orlando');
INSERT INTO customer(id,name,address,phone) VALUES
(500,'Matt','420 Baker Street','800-555-4242'),
(501,'Jenny','12 Tutone Ave','555-867-5309'),
(502,'Sean','1600 N Penn Dr','555-555-1550');
INSERT INTO book (id, title, price, pubid) VALUES
(1001,'The Code Book',14.00, 300),
(1002,'Core Web Programming',49.95, NULL),
(1003,'The Hacker Ethic',19.95, 301);
INSERT INTO trans VALUES
(500,1001,'2017-09-13'),
(501,1002,'2017-09-17'),
(501,1002,'2017-09-26'),
(502,1003,'2017-10-03'),
(501,1001,'2017-10-12'),
(502,1002,'2017-10-25');
/* Insert your own queries to modify the tables, create new tables, insert data,
and SELECT data below */
CREATE TABLE bookcase(
bcid INT,
location VARCHAR(50),
num_shelf INT,
capacity INT,
PRIMARY KEY (bcid)
); ENGINE = innodb;
CREATE TABLE book_bookcase(
bookid INT,
bcid INT,
quantity INT,
FOREIGN KEY (bookid) REFERENCES book(id),
FOREIGN KEY (bcid) REFERENCES bookcase(bcid)
); ENGINE = innodb;
INSERT INTO book_bookcase (bookid,bcid, quantity)
VALUES (1001, 100, 277),
(1001,101, 200),
(1002,101, 22),
(1003,102, 141),
(1002, 103, 74);
INSERT INTO bookcase (bcid,location,num_shelf,capacity)
VALUES (100, 'UL 303', 6, 50),
(101, 'UL 201', 6, 40),
(102, 'UL 201', 5, 45),
(103, 'UL 303', 5, 25);
UPDATE customer SET phone = '432-765-1234' WHERE name = 'Sean';
ALTER TABLE book ADD pages INT;
UPDATE book SET pages = 300 WHERE id = 1001;
UPDATE book SET pages = 301 WHERE id = 1003;
SELECT location FROM bookcase WHERE capacity < 40;
SELECT book.title, book_bookcase.bcid FROM book INNER JOIN book_bookcase ON
book.id=book_bookcase.bookid;
SELECT book.title, book.price, publisher.name, book.pages FROM book INNER JOIN
publisher ON publisher.id=book.pubid;
