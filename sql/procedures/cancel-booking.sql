CREATE DEFINER=`user1`@`%` PROCEDURE `cancel_booking`(
	IN BookingID INT
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
		DELETE FROM bookings 
		WHERE bookings.id = BookingID;
        
        COMMIT;
        SELECT CONCAT('Booking ', BookingID, ' canceled successfully') as BookingStatus;
    ELSE
		ROLLBACK;
        SELECT CONCAT('Booking ', BookingID, ' not found') as BookingStatus;
    END IF;
END
