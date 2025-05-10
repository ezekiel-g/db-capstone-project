DELIMITER //

CREATE PROCEDURE `check_booking`(
	IN BookingSlot DATETIME, 
    IN TableNumber INT
)
BEGIN
	DECLARE IsBooked INT DEFAULT 0;
    
    SELECT 1 
    INTO IsBooked 
    FROM bookings 
    WHERE table_number = TableNumber 
		AND date_time = BookingSlot 
    LIMIT 1;
    
    IF IsBooked = 1 THEN 
		SELECT CONCAT('Table ', TableNumber, ' is already booked') as BookingStatus;
	ELSE 
		SELECT CONCAT('Table ', TableNumber, ' is available') as BookingStatus;
    END IF;
END
//

DELIMITER ;