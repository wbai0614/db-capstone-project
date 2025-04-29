CREATE VIEW OrdersView AS SELECT OrderID, Quantity, TotalCost FROM Orders WHERE quantity>2;
SELECT * FROM OrdersView;

SELECT c.customerid,fullname,o.orderid,totalcost, menuname, coursename,startername FROM Customer c JOIN Orders o ON c.customerid = o.customerid JOIN Menus m ON o.menuid = m.menuid JOIN MenuItem mi ON m.menuitemid = mi.menuitemid WHERE totalcost>30;

SELECT menuname FROM Menus WHERE menuid = ANY(SELECT menuid FROM Orders WHERE quantity>2);

