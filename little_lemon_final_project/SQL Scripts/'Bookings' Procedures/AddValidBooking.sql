DELIMITER //

CREATE PROCEDURE `AddValidBooking`(IN bookdate DATE, IN tableno INT)
BEGIN
	DECLARE results INT;
START TRANSACTION;
	-- select statement to see if the booking exists already, if it does, bookingID will be stored
	-- into results, if not, results will be null
	SELECT BookingID INTO results
	FROM Bookings
	WHERE EXISTS
		(SELECT BookingDate,TableNumber FROM Bookings WHERE BookingDate = bookdate AND TableNumber = tableno)
    ORDER BY BookingID     
	LIMIT 1;
    
	    -- insert statement is here, will either be committed or rolledback depending on the next part
	INSERT INTO Bookings(BookingDate, TableNumber) VALUES(bookdate,tableno);

	-- determining whether the table will be booked or not
IF results IS NOT NULL THEN
	SELECT CONCAT("Table ",TableNumber," is already booked! - booking cancelled.") AS "Status"
    FROM Bookings
    WHERE TableNumber = tableno
    LIMIT 1;
ELSE IF results IS NULL THEN
	SELECT CONCAT("Table ",TableNumber," is available. - booking created!") AS "Status"
    FROM Bookings
    WHERE TableNumber = tableno
    LIMIT 1;
END IF;
END IF;

	-- commit or rollback 
	IF results IS NULL THEN
	COMMIT;
	ELSE IF results IS NOT NULL THEN
		ROLLBACK;
	END IF;
    END IF;
END//

DELIMITER ;