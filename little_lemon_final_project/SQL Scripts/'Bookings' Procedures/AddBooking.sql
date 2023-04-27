DELIMITER //

CREATE PROCEDURE `AddBooking`(IN bookid INT, IN bookdate DATE, IN tableno INT, IN customer INT)
BEGIN
INSERT INTO Bookings(BookingID, BookingDate, TableNumber, CustomerID) VALUES(bookid,bookdate,tableno,customer);

SELECT "New booking added successfully!" AS "Confirmation";

END//

DELIMITER ;