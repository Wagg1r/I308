-- Question 1 --
SELECT DISTINCT concat(a.fname ," " , a.lname) AS Name, a.gender,
DATE_FORMAT(a.dob,'%Y/%m/%c') AS 'Date Formed', b.title AS 'Band Name',
DATE_FORMAT(m.joined_date,'%b/%c/%Y') AS 'Date Joined' FROM p_member as m
JOIN p_band as b ON m.band_id = b.id
JOIN p_artist as a ON m.artist_id = a.id
WHERE DATEDIFF(CURDATE(),a.dob)/365 < 30
GROUP BY a.fname,a.lname
ORDER BY Name;
-- Question 2 --
SELECT IF (a.lname IS NULL, a.fname , concat(a.fname ," " , a.lname))AS Name,
b.title As 'Band Name', DATEDIFF(CURDATE(),m.joined_date)/365 AS 'Years with the
band'
FROM p_member as m
JOIN p_band AS b ON m.band_id = b.id
JOIN p_artist AS a ON m.artist_id=a.id
WHERE m.leave_date IS NULL
;
-- Question 3--
SELECT a.gender, b.title AS "Band Name", concat(a.fname, ' ', a.lname) AS Name
FROM p_member as m
JOIN p_band AS b ON m.band_id = b.id
JOIN p_artist AS a ON m.artist_id=a.id
WHERE b.id in
(SELECT b1.id FROM p_band as b1
JOIN p_member AS m1 ON m1.band_id = b1.id
JOIN p_artist AS a1 ON m1.artist_id=a1.id and a1.gender = 'F' and m1.leave_date IS
NULL) and m.leave_date IS NULL
ORDER BY "Band Name", Name;
-- Question 4 --
SELECT SEC_TO_TIME(SUM(SEC_TO_TIME(s.length))) AS Length,al.title FROM p_album AS
al
JOIN p_song AS s ON s.album_id = al.id
WHERE al.pub_year > 2000
GROUP BY al.title
ORDER BY Length;
-- Question 5 --
-- linking all the artist and bands together "total members"
CREATE VIEW Total_Members AS
SELECT b.id, a.fname, b.title FROM p_artist AS a
JOIN p_member AS m ON m.artist_id = a.id
JOIN p_band AS b ON m.band_id = b.id;
-- creating the members that are still in the band
CREATE VIEW Members_now AS
SELECT b.id, a.fname, b.title , COUNT(b.id) AS Mem_now FROM p_artist AS a
JOIN p_member AS m ON m.artist_id = a.id
JOIN p_band AS b ON m.band_id = b.id
WHERE m.leave_date IS NULL
GROUP By b.id;
--creating the total number of albums made --
CREATE VIEW all_albums AS
SELECT b.id, al.band_id,count(al.title) AS "Total_Albums" FROM p_band as b
JOIN p_album as al ON b.id = al.band_id
GROUP BY b.id;
-- final combining all selects above it --
SELECT TM.title AS "Band Name", Total_Albums AS "Total Albums", count(TM.title) AS
"total members",MN.Mem_now "current members" FROM Total_Members AS TM
JOIN all_albums AS TA ON TA.id = TM.id
JOIN Members_now AS MN ON MN.id = TM .id
GROUP BY TM.title
ORDER BY TM.title;
