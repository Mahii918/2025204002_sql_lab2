
ALTER TABLE Subscribers
MODIFY SubscriberID INT AUTO_INCREMENT;


DELIMITER //

CREATE PROCEDURE AddSubscriberIfNotExists(IN newSubName VARCHAR(100))
BEGIN
    DECLARE existingSub INT;

    -- Check if subscriber is already in the table
    SELECT SubscriberID INTO existingSub
    FROM Subscribers
    WHERE SubscriberName = newSubName
    LIMIT 1;

    -- If not found, add the new subscriber
    IF existingSub IS NULL THEN
        INSERT INTO Subscribers (SubscriberName, SubscriptionDate)
        VALUES (newSubName, CURDATE());
    END IF;
END //

DELIMITER ;

CALL AddSubscriberIfNotExists('Emily Clark');

