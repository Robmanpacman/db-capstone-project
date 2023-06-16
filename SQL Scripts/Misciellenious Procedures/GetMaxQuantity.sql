CREATE PROCEDURE `GetMaxQuantity`()
SELECT MAX(OrderQuantity) AS "Max Quantity in Order"
FROM Orders;