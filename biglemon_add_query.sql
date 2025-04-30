SHOW TABLES;

SELECT fullname, email
FROM Customer c JOIN Orders o ON c.customerid = o.customerid
WHERE totalcost>60;