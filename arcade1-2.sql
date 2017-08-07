-- 1-1
CREATE PROCEDURE projectList()
BEGIN
	SELECT project_name, team_lead, income 
    FROM Projects
    ORDER BY internal_id;
END

-- 1-2
CREATE PROCEDURE countriesSelection()
BEGIN
	SELECT * FROM countries WHERE continent = "Africa" ORDER BY name ASC;
END

-- 1-3
CREATE PROCEDURE monthlyScholarships()
BEGIN
	SELECT id, scholarship/12 AS scholarship FROM scholarships ORDER BY id;
END

-- 1-4
CREATE PROCEDURE projectsTeam()
BEGIN
	SELECT DISTINCT name FROM projectLog ORDER BY name ASC;
END

-- 1-5
CREATE PROCEDURE automaticNotifications()
    SELECT email
    FROM users
    WHERE LOWER(role) NOT IN ("admin", "premium")

    ORDER BY email;
	
---------------------------------------------------------------------------------

-- 2-1
CREATE PROCEDURE automaticNotifications()
    SELECT email
    FROM users
    WHERE LOWER(role) NOT IN ("admin", "premium")

    ORDER BY email;

-- 2-2
CREATE PROCEDURE mostExpensive()
BEGIN
	SELECT name 
	FROM Products 
	ORDER BY price*quantity DESC, name ASC 
	LIMIT 1;
END

-- 2-3
CREATE PROCEDURE contestLeaderboard()
BEGIN
	SELECT name FROM leaderboard ORDER BY score DESC LIMIT 5 OFFSET 3;
END

-- 2-4
CREATE PROCEDURE gradeDistribution()
BEGIN
	SELECT Name, ID
	FROM Grades 
	WHERE Final > (Midterm1 / 2 + Midterm2 / 2) 
	AND Final > (Midterm1 * .25 + Midterm2 * .25 + Final * .5)
	ORDER BY LEFT(Name, 3), ID;
END

-- 2-5
CREATE PROCEDURE mischievousNephews()
BEGIN
	SELECT ((DAYOFWEEK(mischief_date) + 5) % 7) as weekday, mischief_date, author, title
    FROM mischief
    ORDER BY weekday ASC, FIELD(author, 'Huey', 'Dewey', 'Louie'), mischief_date, title ASC;
END













