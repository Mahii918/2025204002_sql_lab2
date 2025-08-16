
DELIMITER //

CREATE PROCEDURE PrintAllWatchHistories()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE currentSubID INT;
    DECLARE subName VARCHAR(100);

    -- Cursor to fetch all subscribers
    DECLARE allSubs CURSOR FOR 
        SELECT SubscriberID, SubscriberName FROM Subscribers;

    -- Handler to exit the loop when there are no more rows
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN allSubs;

    subscriber_loop: LOOP
        FETCH allSubs INTO currentSubID, subName;

        IF done THEN
            LEAVE subscriber_loop;
        END IF;

        -- Print subscriber header
        SELECT CONCAT('Watch history for: ', subName, ' (ID: ', currentSubID, ')') AS Info;

        -- Call the procedure to get their watch history
        CALL GetWatchHistoryBySubscriber(currentSubID);
    END LOOP;

    CLOSE allSubs;
END //

DELIMITER ;

-- CALL PrintAllWatchHistories();
