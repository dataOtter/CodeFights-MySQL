-- 3-1
CREATE PROCEDURE suspectsInvestigation()
BEGIN
	SELECT id, name, surname
    FROM Suspect 
    WHERE height <= 170
    AND LOWER(name) LIKE 'b%'
    AND LOWER(surname) RLIKE 'gre.n'
    ORDER BY id ASC;
END

-- 3-2
CREATE PROCEDURE suspectsInvestigation2()
BEGIN
	SELECT id, name, surname
    FROM Suspect 
    WHERE height <= 170
    OR LOWER(name) NOT LIKE 'b%'
    OR LOWER(surname) NOT RLIKE 'gre.n'
    ORDER BY id ASC;
END

-- 3-3
CREATE PROCEDURE securityBreach()
BEGIN
	SELECT *
    FROM users
    WHERE CAST(attribute AS BINARY) 
    RLIKE CONCAT('.+\%', first_name, '_', second_name, '\%.*');
END

-- 3-4
CREATE PROCEDURE testCheck()
    SELECT id, 
	IF (given_answer IS NULL, "no answer", 
	(IF (given_answer = correct_answer, "correct", "incorrect"))) 
	AS checks
    FROM answers
    ORDER BY id;
	
-- 3-5
CREATE PROCEDURE expressionsVerification()
BEGIN
    SELECT *
    FROM expressions
    WHERE a + b = c and operation = "+"
    OR a - b = c and operation = "-"
    OR a * b = c and operation = "*"
    OR a / b = c and operation = "/";
END

-- 3-6
CREATE PROCEDURE newsSubscribers()
BEGIN
    SELECT DISTINCT subscriber
    FROM full_year
    WHERE newspaper LIKE '%Daily%'
    UNION 
    SELECT DISTINCT subscriber
    FROM half_year
    WHERE newspaper LIKE '%Daily%'
    ORDER BY subscriber ASC;
END

----------------------------------------------------------------------------

-- 4-1
CREATE PROCEDURE countriesInfo()
BEGIN
    SELECT COUNT(*) AS number, 
        AVG(population) AS average, 
        SUM(population) AS total
    FROM countries;
END

-- 4-2
CREATE PROCEDURE itemCounts()
BEGIN
	SELECT item_name, item_type, COUNT(item_type) AS item_count
    FROM availableItems
    GROUP BY item_type, item_name
    ORDER BY item_type ASC;
END

-- 4-3
CREATE PROCEDURE usersByContinent()
BEGIN
	SELECT continent, SUM(users) as users  
    FROM countries
    GROUP BY continent
    ORDER BY users DESC;
END

-- 4-4
CREATE PROCEDURE movieDirectors()
BEGIN
	SELECT director 
    FROM moviesInfo
    WHERE year > 2000
    GROUP BY director 
    HAVING SUM(oscars) > 2
    ORDER BY director ASC;
END

-- 4-5
CREATE PROCEDURE travelDiary()
BEGIN
    SELECT group_concat(DISTINCT country 
                        ORDER BY country ASC 
                        SEPARATOR ';') 
    AS countries
    FROM diary;
END

-- 4-6
CREATE PROCEDURE soccerPlayers()
BEGIN
	SELECT GROUP_CONCAT(first_name, 
                        ' ', surname, 
                        ' #', player_number 
                        ORDER BY player_number 
                        SEPARATOR '; ')
    AS players 
    FROM soccer_team;
END

-- 4-7
CREATE PROCEDURE marketReport()
BEGIN
	SELECT country, COUNT(*) 
        AS competitors
    FROM foreignCompetitors
    GROUP BY country
    UNION
    SELECT 'Total:' AS country, 
        COUNT(*) AS competitors
    FROM foreignCompetitors;
END
