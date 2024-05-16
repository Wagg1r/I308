--QUERY 1: Select the first and last names and property addresses of all tenants
whos lease ends in May 2023--
SELECT t.f_name,t.l_name, p.address_str,p.address_zip
FROM tenant AS t
JOIN lease AS l ON l.id=t.id
JOIN property AS p ON p.id = t.propertyID
WHERE l.end_date BETWEEN '2023-05-01'
AND '2023-05-31';
--Find the total damages charges of all tenants who DO NOT own pets--
SELECT SUM(c.damages)
FROM charges AS c
WHERE NOT EXISTS (
SELECT *
FROM tenant AS t
JOIN pet as pe ON pe.tenantid = t.id)
WHERE c.tenantid=t.id;
--Returns owners first and last name who own more than 1
property--
SELECT o.f_name, o.l_name, COUNT(*)
FROM property AS p
JOIN owner AS o
ON o.id=p.ownerid
GROUP BY o.id
HAVING COUNT (*) > 1;
--Select the tenant name and most recent date of payment for each
tenant--
SELECT t.f_name, t.l_name, MAX(r.date_paid)
FROM rent AS r
JOIN tenant AS t ON t.id=r.tenant.id
GROUP BY t.id;
--Returns all properties who have more than 2 tenants --
SELECT p.address_str, p.address_zip, COUNT(*)
FROM tenant AS t
JOIN property AS p
ON p.id=t.propertyid
GROUP BY p.id
HAVING COUNT(*) > 2;
