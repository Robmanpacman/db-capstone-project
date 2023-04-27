CREATE PROCEDURE `CancelOrder`(number INT)
DELETE FROM Orders
WHERE OrderID = number;