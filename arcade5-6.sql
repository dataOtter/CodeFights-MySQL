-- 5-1
CREATE PROCEDURE websiteHacking()
    SELECT id,login,name
    FROM users
    WHERE type='user'
    OR type LIKE '%' -- only this one line may be added to alter output
    ORDER BY id
	
-- 5-2
CREATE PROCEDURE nullIntern()
BEGIN
	SELECT COUNT(*) AS number_of_nulls
    FROM departments
    WHERE description IS NULL
    OR LOWER(description) RLIKE "^ *null *$"
    OR LOWER(description) RLIKE "^ *nil *$"
    OR LOWER(description) RLIKE "^ *- *$";
END

-- 5-3
DROP PROCEDURE IF EXISTS legsCount;
CREATE PROCEDURE legsCount()
    SELECT SUM(IF (type = 'human', 2, 4)) as summary_legs
    FROM creatures
    ORDER BY id;
	
-- 5-4
CREATE PROCEDURE combinationLock()
BEGIN
	SELECT ROUND(exp(sum(log(coalesce(CHAR_LENGTH(characters),1))))) 
		AS combinations
    FROM discs;
END

---------------------------------------------------------------------------------------

-- 6-1
CREATE PROCEDURE interestClub()
    SELECT name
    FROM people_interests
    WHERE interests & 1 AND interests & 8
    ORDER BY name
	
-- 6-2
CREATE PROCEDURE personalHobbies()
BEGIN
	SELECT name
    FROM people_hobbies
    WHERE hobbies LIKE '%sports%'
    AND hobbies LIKE '%reading%';
END

-- 6-3
CREATE PROCEDURE booksCatalogs()
BEGIN
	SELECT ExtractValue(xml_doc, '/descendant-or-self::author[1]') AS author 
    FROM catalogs
    ORDER BY author;
END

-- 6-4
CREATE PROCEDURE habitatArea()
BEGIN
    SET @g = (SELECT CONCAT('MULTIPOINT(', GROUP_CONCAT( CONCAT(x, ' ', y) SEPARATOR ','),')') FROM places);
	SET @poly = ST_AsText(ST_ConvexHull(ST_GeomFromText(@g)));
    SELECT ST_Area(ST_GeomFromText(@poly)) AS area;
END
