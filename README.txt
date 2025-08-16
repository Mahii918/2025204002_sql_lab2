Lab 2 - MySQL Activity


Sanapathi Kishore Naidu
2025204002




Git Repo link: https://github.com/Mahii918/2025204002_sql_lab2.git






Steps to Execute the Scripts:


1. Open your MySQL MySQL Workbench.
2. Load the database with the given tables:
   - Shows
   - Subscribers
   - WatchHistory
3. Insert sample data as provided in the assignment.
4. Run each script in the following order:
   - q1.sql → List all subscribers using a cursor.
   - q2.sql → Get watch history for a specific subscriber.
   - q3.sql → Add subscriber if not exists.
   - q4.sql → Generate watch time report (for active viewers).
   - q5.sql → Print all watch histories (for all subscribers).
5. To test:
   - Use `CALL ProcedureName();` to run each one.
   - For example: `CALL GetWatchHistoryBySubscriber(2);`