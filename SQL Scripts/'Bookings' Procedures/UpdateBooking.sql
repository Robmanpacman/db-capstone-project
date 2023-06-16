DELIMITER //

CREATE DEFINER=`database_user_1`@`%` PROCEDURE `UpdateBooking`(IN bookid INT, IN bookdate DATE)
BEGIN
	UPDATE Bookings SET BookingDate = bookdate WHERE BookingID = bookid;
    
SELECT CONCAT("Booking ",BookingID," has been updated.") AS "Confirmation"
FROM Bookings
WHERE BookingID = bookid
LIMIT 1;

END//

DELIMITER ;