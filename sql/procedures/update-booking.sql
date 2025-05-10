DELIMITER //

CREATE PROCEDURE `update_booking`(
	IN BookingID INT,
	IN BookingSlot DATETIME
)
BEGIN
	DECLARE BookingExists INT DEFAULT 0;
    
    START TRANSACTION;
    
    SELECT 1 
    INTO BookingExists 
    FROM bookings 
    WHERE id = BookingID 
    LIMIT 1;
    
    IF BookingExists = 1 THEN
		UPDATE bookings 
        SET date_time = BookingSlot
		WHERE bookings.id = BookingID;
        
        COMMIT;
        SELECT CONCAT('Booking ', BookingID, ' updated successfully') as BookingStatus;
    ELSE
		ROLLBACK;
        SELECT CONCAT('Booking ', BookingID, ' not found') as BookingStatus;
    END IF;
END
//

DELIMITER ;