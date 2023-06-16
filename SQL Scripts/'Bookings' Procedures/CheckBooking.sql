DELIMITER //

CREATE PROCEDURE `CheckBooking`(IN bookdate DATE,
IN tableno INT)
BEGIN
	DECLARE results INT;

	SELECT BookingID INTO results
	FROM Bookings
	WHERE EXISTS
		(SELECT BookingDate,TableNumber FROM Bookings WHERE BookingDate = bookdate AND TableNumber = tableno)
    ORDER BY BookingID     
	LIMIT 1; 

IF results IS NOT NULL THEN
	SELECT CONCAT("Table ",TableNumber," is already booked!") AS "Status"
    FROM Bookings
    WHERE TableNumber = tableno
    LIMIT 1;
ELSE IF results IS NULL THEN
	SELECT CONCAT("Table ",TableNumber," is available.") AS "Status"
    FROM Bookings
    WHERE TableNumber = tableno
    LIMIT 1;
END IF;
END IF;
END//

DELIMITER ;