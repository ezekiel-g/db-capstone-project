PREPARE get_order_details FROM 
	'SELECT
		orders.id AS OrderID, 
		orders.quantity AS Quantity, 
		orders.total_cost AS TotalCost
	FROM orders 
	JOIN bookings ON orders.booking_id = bookings.id 
	JOIN customers ON bookings.customer_id = customers.id
	WHERE customers.id = ?';
    
SET @id = 1;
EXECUTE get_order_details USING @id;
