CREATE DEFINER=`user1`@`%` PROCEDURE `get_max_quantity`()
BEGIN 
	SELECT MAX(quantity) 
	AS 'Max Quantity in Orders' 
	FROM orders;
END
