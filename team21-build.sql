drop table if exists records;
drop table if exists payment;
drop table if exists lease;
drop table if exists charges;
drop table if exists pet;
drop table if exists Tphone;
drop table if exists tenant;
drop table if exists property;
drop table if exists Ophone;
drop table if exists owner;
CREATE TABLE owner (
id INT auto_increment,
f_name VARCHAR (50) NOT NULL,
l_name VARCHAR (50),
num_properties INT,
funds_collected DECIMAL(5,2),
email VARCHAR(30),
PRIMARY KEY (id)
) ENGINE = innodb;
CREATE TABLE Ophone (
ownerID INT,
phone VARCHAR(15),
FOREIGN KEY (ownerID) REFERENCES owner(id)
) ENGINE=INNODB;
CREATE TABLE property (
id INT auto_increment,
ownerID INT,
type BOOLEAN,
address_str VARCHAR (50),
address_zip VARCHAR(5),
rent INT(4),
capacity INT,
PRIMARY KEY (id),
FOREIGN KEY (ownerID) REFERENCES owner(id)
) ENGINE = innodb;
CREATE TABLE tenant (
id INT auto_increment,
propertyID INT,
f_name VARCHAR (50) NOT NULL,
l_name VARCHAR (50),
background_check BOOLEAN,
email VARCHAR(50),
dob DATE,
PRIMARY KEY (id),
FOREIGN KEY (propertyID) REFERENCES property(id)
) ENGINE = innodb;
CREATE TABLE Tphone (
tenantID INT,
phone VARCHAR(15),
FOREIGN KEY(tenantID) REFERENCES tenant(id)
) ENGINE=INNODB;
CREATE TABLE pet (
id INT auto_increment,
tenantID INT,
type VARCHAR (50) NOT NULL,
size VARCHAR (50),
PRIMARY KEY(id),
FOREIGN KEY(tenantID) REFERENCES tenant(id)
) ENGINE =innodb;
CREATE TABLE charges(
tenantID INT,
f_month_dep INT(4),
l_month_dep INT(4),
pet_charges INT(4),
damages DECIMAL(6,2),
FOREIGN KEY (tenantID) REFERENCES tenant(id)
) ENGINE=innodb;
CREATE TABLE lease(
tenantID INT,
start_date DATE,
end_date DATE,
FOREIGN KEY(tenantID) REFERENCES tenant(id)
) ENGINE=innodb;
CREATE TABLE payment(
tenantID INT,
payment_method VARCHAR (25),
due_date DATE,
date_paid DATE,
FOREIGN KEY (tenantID) REFERENCES tenant(id)
)ENGINE=innodb;
CREATE TABLE records(
tenantID INT,
shots VARCHAR(50),
medications VARCHAR(50),
num_pets INT(10),
FOREIGN KEY (tenantID) REFERENCES tenant(id)
)ENGINE=innodb;
/* Data:*/
/* Owner */
INSERT INTO owner(id, f_name, l_name, num_properties, funds_collected, email)
 VALUES
(1, 'Ania', 'Couthard', 2, '105.26', 'acouthard@gmail.com'),
(2, 'Courtenay', 'Gorling', 1, '906.58', 'courtenay.gorling@yahoo.com' ),
(3, 'Hercules', 'Hullins', 2, '223.65', 'herculesehullins@gmail.com'),
(4, 'Irina', 'Hinkensen', 3, '580.40', 'irinahinkensen@icloud.com'),
(5, 'Brianna', 'Forst', 2, '199.79', 'briannaforst@outlook.com');
INSERT INTO Ophone (ownerID, phone) VALUES
(1, '426-357-0740'),
(2, '144-544-3104'),
(3, '272-222-4532'),
(4, '680-638-8638'),
(5, '379-113-7514');
/* Property (apartment-true house-false) */
INSERT INTO property (id, ownerID, type, address_str, address_zip, capacity, rent)
VALUES
(1, 1, true, '32 Autumn Leaf Drive', 47401, 3, 740),
(2, 3, true, '9054 Maple Circle', 47403, 2, 995),
(3, 3, true, '06136 Mosinee Lane', 47401, 1, 870),
(4, 4, false, '4833 Golf View Pass', 47404, 2, 1320),
(5, 5, false, '1870 Northridge Hill', 47401, 1, 650),
(6, 1, true, '5 Bluestem Point', 47406, 2, 670),
(7, 2, false, '488 Florence Hill', 47406, 3, 820),
(8, 3, false, '031 Arizona Hill', 47403, 4, 930),
(9, 4, false, '0 Loomis Road', 47406, 2, 650),
(10, 2, false, '50 Ohio Parkway', 47403, 2, 1120);
/* Tenant: */
INSERT INTO tenant (id, propertyID, f_name, l_name, background_check,email,dob) 
VALUES
(1,1, 'Gerardo', 'Hubbins', false, 'Gerardo@gmail.com', '2000-04-05'),
(2,2, 'Von', 'Murrigan', true, 'von@gmail.com', '1980-08-16'),
(3,3, 'Maryjo', 'Holby', false, 'Maryjo@gmail.com', '1987-10-18'),
(4,1, 'Rudie', 'MacKenzie', false, 'Rudie@hotmail.com', '1991-01-26'),
(5,4, 'Giustina', 'Wardhough', false, 'giustina@yahoo.com', '1999-08-16'),
(6,6, 'Karie', 'Tivnan', false, 'Karie@gmail.com', '2001-01-01'),
(7,9, 'Tanya', 'Shenley', false, 'Tanya@outlook.com', '1987-07-06'),
(8,1, 'Jerri', 'Grane', false, 'Jerri@hotmail.com', '2002-07-26'),
(9,5, 'Werner', 'Lashford', true, 'Lashford@hotmail.com', '1970-01-06'),
(10,7, 'Deidre', 'Garrigan', true, 'Garrigan@yahoo.com', '1999-07-30'),
(11,8,'Cly', 'Hansie', false, 'Cly@hotmail.com', '1995-07-26'),
(12,8, 'Audry', 'Burchnall', true, 'Burch@Gmail.com', '1990-12-26'),
(13,9,'Justino', 'Kilshaw', true, 'kilshaw@hotmail.com', '2002-07-26'),
(14,7, 'Ambros', 'Dorn', true, 'Jerri@hotmail.com', '2003-11-30'),
(15,10,'Cathy', 'Shearer', true, 'Cathy@Gmail.com', '1983-09-02'),
(16,2, 'Gert', 'Robun', false, 'Robun@hotmail.com', '2002-01-26'),
(17,10, 'Kessia', 'Grendon', false, 'Grendon@hotmail.com', '1997-07-26'),
(18,6, 'Martha', 'Dykins', false, 'dykins@yahoo.com', '1986-04-06'),
(19,8, 'Genni', 'Shepland', true, 'Genni@hotmail.com', '2001-03-16'),
(20,4, 'Sammy', 'Wheatcroft', false, 'Sammy@hotmail.com', '2004-07-15'),
(21,8, 'Taite', 'Willowby', true, 'Willowby@Gmail.com', '1997-12-30'),
(22,7, 'Teodoro', 'Gilphillan', false, 'Teo@yahoo.com', '2001-07-26');
INSERT INTO Tphone (tenantID,phone) VALUES
(1, '767-207-0752'),
(1, '767-207-0757'),
(2, '401-274-2203'),
(3, '704-474-9098'),
(3, '704-484-4094'),
(4, '233-912-9270'),
(5, '577-364-7960'),
(6, '502-145-1502'),
(7, '610-195-4233'),
(8, '297-722-8373'),
(9, '552-386-3679'),
(10, '963-793-3612'),
(11, '623-761-9238'),
(12, '876-397-0815'),
(13, '550-633-3778'),
(13, '550-633-5998'),
(14, '220-673-6628'),
(15, '234-309-3648'),
(16, '817-526-3793'),
(17, '102-120-3249'),
(17, '102-120-5638'),
(18, '924-558-6992'),
(19, '145-472-9175'),
(20, '928-987-9913'),
(20, '928-997-7713'),
(21, '931-362-6111'),
(22, '541-332-4609');
/* Charges: */
INSERT INTO charges(tenantID, f_month_dep, l_month_dep, pet_charges, damages)
VALUES
(1, 930, 930, 0, 50.25), 
(2, 650, 650, 100, 0),
(3, 740, 740, 0, 1236.71),
(4, 1120, 1120, 100, 300.94),
(5, 1120, 1120, 0, 0),
(6, 870, 870, 0, 460.73),
(7, 995, 995, 50, 75.61),
(8, 820, 820, 0, 25.33),
(9, 650, 650, 100, 0),
(10, 740, 740, 0, 11.51),
(11, 1320, 1320, 100, 1471.50),
(12, 650, 650, 0, 0),
(13, 740, 740, 50, 10.44),
(14, 995, 995, 0, 300.71),
(15, 1320, 1320, 0, 46.28),
(16, 820, 820, 0, 178.11),
(17, 670, 670, 50, 5.00),
(18, 930, 930, 0, 800.61),
(19, 670, 670, 0, 0),
(20, 820, 820, 100, 94.88),
(21, 930, 930, 0, 0),
(22, 930, 930, 0, 0);
/* Lease: */
INSERT INTO lease(tenantID, start_date, end_date)
VALUES
(1,'2022-11-15', '2023-04-05'),
(2,'2022-12-21', '2023-06-22'),
(3,'2022-10-09', '2023-04-27'),
(4,'2022-08-27', '2023-06-20'),
(5,'2022-09-05', '2023-02-21'),
(6,'2022-11-17', '2023-04-04'),
(7,'2022-11-26', '2023-05-02'),
(8,'2022-08-15', '2023-02-18'),
(9,'2022-12-22', '2023-03-17'),
(10,'2022-12-28', '2023-06-27'),
(11,'2022-08-21', '2023-04-25'),
(12,'2022-10-25', '2023-02-20'),
(13,'2022-08-21', '2023-06-21'),
(14,'2022-09-16', '2023-02-28'),
(15,'2022-12-30', '2023-04-14'),
(16,'2022-08-13', '2023-04-11'),
(17,'2022-12-31', '2023-03-07'),
(18,'2022-10-22', '2023-07-19'),
(19,'2022-10-13', '2023-03-24'),
(20,'2022-11-07', '2023-04-21'),
(21,'2022-11-22', '2023-03-11'),
(22,'2022-12-29', '2023-05-31');
/* Pet: */
INSERT INTO pet(id,tenantID, type, size)
VALUES
(1,2, 'Snake', 'Medium'),
(2,4, 'Dog', 'Large'),
(3,9, 'Fish', 'Extra Small'),
(4,2, 'Bird', 'Small'),
(5,11, 'Cat', 'Small'),
(6,11, 'Dog', 'Extra Large'),
(7,13, 'Rabbit', 'Small'),
(8,9, 'Bird', 'Small'),
(9,7, 'Dog', 'Medium'),
(10,20, 'Dog', 'Extra Large'),
(11,17, 'Cat', 'Medium'),
(12,20, 'Bird', 'Small'),
(13,4, 'Fish', 'Extra Small');
/* Payment: */
INSERT INTO payment(tenantID, payment_method, due_date, date_paid)
VALUES
(1,'check','2023-02-01','2022-12-27'),
(2,'cash','2022-08-09','2022-08-22'),
(3,'cash','2022-09-03','2022-12-6'),
(4,'check','2023-05-10','2022-08-25'),
(5,'credit card','2023-07-06','2023-02-06'),
(6,'credit card','2023-05-02','2023-06-13'),
(7,'check','2023-04-28','2022-10-06'),
(8,'cash','2023-04-23','2022-09-13'),
(9,'cash','2023-04-20','2023-07-18'),
(10,'cash','2022-12-23','2022-11-22'),
(11,'credit card','2023-05-10','2022-12-16'),
(12,'check','2022-08-26','2023-01-20'),
(13,'credit card','2022-08-12','2023-06-20'),
(14,'cash','2022-09-05','2022-11-17'),
(15,'check','2023-05-19','2023-04-28'),
(16,'cash','2022-10-20','2023-07-20'),
(17,'check','2023-03-10','2022-10-25'),
(18,'cash','2022-10-06','2023-07-03'),
(19,'cash','2022-11-11','2022-11-14'),
(20,'check','2023-05-03','2023-01-10'),
(21,'cash','2023-03-04','2023-03-31'),
(22,'check','2023-05-30','2023-06-28');
/* Records: */
INSERT INTO records(tenantID, shots, medications, num_pets)
VALUES
(2,'Distemper', 'Pain Relievers',2),
(4,'Hepatitis', 'Steroids',2),
(7,'Distemper','Steroids',1),
(9,'Rabies', 'Pain Relievers',2),
(11,'Distemper', 'Steroids',2),
(13,'Rabies','Metronidazole',1),
(17,'Rabies','Metronidazole', 1),
(20, 'Hepatitis', 'N/A', 2);
