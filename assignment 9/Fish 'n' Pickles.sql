
-- Question 1 --
SELECT m.item_name,m.price, SUM(od.qty) FROM menu as m
JOIN order_detail AS od ON m.id=od.menuid
JOIN order_main AS om ON od.orderid = om.id
WHERE om.odate BETWEEN '2013-01-01' and '2013-12-31'
GROUP BY od.menuid
ORDER BY SUM(od.qty) ASC, m.item_name
LIMIT 10
;
-- Question 2 --
SELECT m.item_name,m.price, SUM(od.qty) FROM menu as m
JOIN order_detail AS od ON m.id=od.menuid
JOIN order_main AS om ON od.orderid = om.id
WHERE om.odate BETWEEN '2013-01-01' and '2013-12-31'
GROUP BY od.menuid
ORDER BY SUM(od.qty) ASC, m.item_name
LIMIT 10
;
--Question 3 --
SELECT DATE_FORMAT(om.odate, '%M')AS month, DATE_FORMAT(om.odate, '%Y')AS year,
SUM(price*od.qty) AS sales
FROM menu as m
JOIN order_detail AS od ON m.id=od.menuid
JOIN order_main AS om ON od.orderid = om.id
WHERE om.odate BETWEEN '2011-01-01' and '2012-12-31'
GROUP BY DATE_FORMAT(om.odate, '%M,%YY')
ORDER BY DATE_FORMAT(om.odate, '%m'),DATE_FORMAT(om.odate, '%YY');
-- Question 4 --
SELECT DATE_FORMAT(es.wdate,'%W')AS day_of_week, count(es.wdate) AS employee
FROM emp_shift as es
WHERE es.wdate NOT IN (SELECT wdate FROM emp_shift
WHERE role = 'manager' AND wdate BETWEEN '2003-01-01' and '2005-12-31'
ORDER BY wdate) and es.wdate BETWEEN '2003-01-01' and '2005-12-31'
GROUP BY DATE_FORMAT(es.wdate,'%W')
ORDER BY employee DESC
;
--QUESTION 5 went to office hours and was told that it was supposed to be between
2010 and 2013 even though question did not state that ---
SELECT concat(e.fname, ' ', e.lname) AS name, es.role as role,
DATE_FORMAT(es.wdate, '%b %D %Y') AS date
FROM emp_shift as es
JOIN employee AS e ON e.id = es.empid
WHERE es.wdate IN
(SELECT es1.wdate AS employees
FROM emp_shift AS es1
WHERE es1.wdate NOT IN
(SELECT wdate FROM emp_shift
WHERE role = 'manager'
AND wdate BETWEEN '2009-12-31' and '2013-01-01')
AND es1.wdate BETWEEN '2009-12-31' and '2013-01-01'
GROUP BY es1.wdate
HAVING count(*)>=2)
ORDER BY es.wdate,e.lname
;
