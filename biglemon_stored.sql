SELECT * FROM bookings;
DELIMITER //
CREATE PROCEDURE AddBooking(IN booking_id INT,IN customer_id INT,IN booking_date DATE,IN table_number INT)
BEGIN
INSERT INTO Bookings(bookingid,customerid,bookingdate,tablenumber) VALUES(booking_id,customer_id,booking_date,table_number);
SELECT CONCAT('New booking added') AS Confirmation;
END //
DELIMITER ;

CALL AddBooking(9,3,'2022-12-30',4);

DELIMITER //
CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_date DATE)
BEGIN
START TRANSACTION;
IF NOT EXISTS(SELECT 1 FROM Bookings WHERE (bookingid = booking_id))
THEN 
SELECT CONCAT("Booking ",booking_id,' does not exists') AS Message;
ROLLBACK;
ELSE
UPDATE Bookings SET bookingdate= booking_date WHERE bookingid = booking_id;
COMMIT;
SELECT CONCAT('booking ', booking_id,' updated.') AS Confirmation;
END IF;
END//
DELIMITER ;

CALL UpdateBooking(9,'2022-12-17');
SELECT * FROM Bookings;
CALL UpdateBooking(10,'2025-12-22');

DELIMITER //
CREATE PROCEDURE CancelBooking(IN booking_id INT)
BEGIN
START TRANSACTION;
IF NOT EXISTS (SELECT 1 FROM Bookings WHERE (bookingid = booking_id))
THEN 
SELECT CONCAT('Booking ',booking_id,' does not exists.');
ROLLBACK;
ELSE 
DELETE FROM Bookings WHERE bookingid = booking_id;
COMMIT;
SELECT CONCAT('Booking ',booking_id,' cancelled.');
END IF;
END //
DELIMITER ;

CALL CancelBooking(9);
