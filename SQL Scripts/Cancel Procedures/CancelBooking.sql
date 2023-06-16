DELIMITER //

CREATE PROCEDURE `CancelBooking`(IN bookid INT)
BEGIN
    
SELECT CONCAT("Booking ",BookingID," has been cancelled.") AS "Confirmation"
FROM Bookings
WHERE BookingID = bookid
LIMIT 1;

DELETE FROM Bookings WHERE BookingID = bookid;

END//

DELIMITER ;