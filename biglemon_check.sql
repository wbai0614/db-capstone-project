CREATE TABLE Bookings(BookingID INT PRIMARY KEY, BookingDate DATE, TableNumber INT, CustomerID INT, FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID));
INSERT INTO Bookings(bookingid, bookingdate,tablenumber,customerid) VALUES(1,'2022-10-10',5,1);
SELECT * FROM Bookings;
INSERT INTO Bookings(bookingid,bookingdate,tablenumber,customerid) VALUES(2,'2022-11-12',3,3),(3,'2022-10-11',2,2),(4,'2022-10-13',2,1);

DELIMITER //
CREATE PROCEDURE CheckBooking(IN booking_date DATE, IN table_number INT) 
BEGIN
IF EXISTS(SELECT 1 FROM Bookings WHERE bookingdate = booking_date AND tablenumber = table_number)
THEN 
SELECT CONCAT("Table ",table_number," is already booked.") AS `Booking Status`;
ELSE
SELECT CONCAT("Table ", table_number," is not yet booked.") AS `Booking status`;
END IF;
END //
DELIMITER ;

CALL CheckBooking('2022-11-12',3);

DELIMITER //
CREATE PROCEDURE Checkb(IN booking_d DATE, IN table_no INT)
BEGIN
IF EXISTS(SELECT 1 FROM Booking WHERE bookingdate = booking_d AND tablenumber = table_no)
THEN
SELECT CONCAT('Table ',table_no,' is already booked.') AS `Booking status`;
ELSE 
SELECT CONCAT('Table ', table_no,' is not yet booked.') AS `Booking status`;
END IF;
END //

DELIMITER ;

CALL Checkb('2022-11-12',3);
DROP PROCEDURE Checkb;

CALL CheckBooking('2022-11-12',3);


