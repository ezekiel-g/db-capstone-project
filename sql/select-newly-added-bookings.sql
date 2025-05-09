SELECT 
	bookings.id AS BookingID, 
    bookings.date_time AS BookingSlot, 
    bookings.table_number AS TableNumber,
    customers.id AS CustomerID
FROM bookings
JOIN customers ON bookings.customer_id = customers.id 
WHERE bookings.id IN (10, 11, 12, 13)
ORDER BY bookings.id ASC;
