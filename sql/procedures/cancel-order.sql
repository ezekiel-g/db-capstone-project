DELIMITER //

CREATE PROCEDURE `cancel_order`(
	IN id INT
)
BEGIN 
	DELETE FROM orders 
	WHERE orders.id = id; 
    
	IF ROW_COUNT() > 0 THEN 
		SELECT CONCAT('Order ', id, ' canceled successfully') AS Message; 
	ELSE 
		SELECT CONCAT('Order not found') AS Message; 
	END IF;
END
//

DELIMITER ;