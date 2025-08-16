
DELIMITER //

CREATE PROCEDURE SendWatchTimeReport()
BEGIN
    DECLARE finished INT DEFAULT FALSE;
    DECLARE sub_id INT;

    -- Cursor to get all subscriber IDs who have watched something
    DECLARE watch_cursor CURSOR FOR
        SELECT DISTINCT SubscriberID FROM WatchHistory;

    -- When no more data, stop the loop
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = TRUE;

    OPEN watch_cursor;

    loop_watchers: LOOP
        FETCH watch_cursor INTO sub_id;
        IF finished THEN
            LEAVE loop_watchers;
        END IF;

        -- Call the watch history procedure for that subscriber
        CALL GetWatchHistoryBySubscriber(sub_id);
    END LOOP;

    CLOSE watch_cursor;
END //

DELIMITER ;

-- CALL GetWatchHistoryBySubscriber(1);
