DELIMITER //

CREATE PROCEDURE `add_booking`(
	IN CustomerID INT,
    IN EmployeeID INT,
	IN BookingSlot DATETIME, 
    IN TableNumber INT
)
BEGIN
	DECLARE IsBooked INT DEFAULT 0;
    
    START TRANSACTION;
    
    SELECT 1 
    INTO IsBooked 
    FROM bookings 
    WHERE table_number = TableNumber 
		AND date_time = BookingSlot 
    LIMIT 1;
    
    IF IsBooked = 0 THEN 
		INSERT INTO bookings (
			customer_id,
            employee_id,
            date_time,
            table_number
        ) VALUES (
			CustomerID,
            EmployeeID,
            BookingSlot,
            TableNumber
        );
        
		COMMIT;
        SELECT CONCAT('Table ', TableNumber, ' booked successfully') as BookingStatus;
	ELSE
		ROLLBACK;
        SELECT CONCAT('Table ', TableNumber, ' is already booked') as BookingStatus;
	END IF;
END
//

DELIMITER ;

