-- 7-1
CREATE PROCEDURE orderOfSuccession()
BEGIN
	SELECT CONCAT(IF(gender = 'F', "Queen ", "King "), name) AS name 
    FROM Successors
    ORDER BY birthday ASC;
END

-- 7-2
CREATE PROCEDURE orderingEmails()
BEGIN
    SET @oneMb = POWER(2,20);
    SET @oneKb = POWER(2,10);
	SELECT id, email_title, 
        IF(size >= @oneMb, 
           CONCAT(FLOOR(size / @oneMb), ' Mb'), 
           CONCAT(FLOOR(size / @oneKb), ' Kb'))
        AS short_size
    FROM emails
    ORDER BY size DESC;
END

-- 7-3
