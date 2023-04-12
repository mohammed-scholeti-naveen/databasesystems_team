--Insert statement for Production Team table:
INSERT INTO Production_Team (PT_Name, PT_Country, PT_Website)
VALUES ('Marvel Studios', 'USA', 'www.marvel.com');

--Insert statement for Sequels table:
INSERT INTO Sequels (S_Name, S_Release_Year, S_Franchise, PT_ID)
VALUES ('Iron Man 2', 2010, 'Iron Man', 1);

--Update statement for Production Team table:
UPDATE Production_Team
SET PT_Website = 'www.marvelstudios.com'
WHERE PT_ID = 1;

--Update statement for Movie table:
UPDATE Movie
SET M_Result_Hit = 1
WHERE M_ID = 1;

--Delete statement for Character table:
DELETE FROM Character
WHERE C_ID = 1;

--Simple select statement for Actor table:
SELECT A_Name, A_Gender
FROM Actor;

--Select statement joining Sequels and Production Team tables:
SELECT S_Name, PT_Name
FROM Sequels
JOIN Production_Team
ON Sequels.PT_ID = Production_Team.PT_ID;

--Select statement joining Movie and Production Team tables:
SELECT M_Name, PT_Name
FROM Movie
JOIN Production_Team
ON Movie.PT_ID = Production_Team.PT_ID;

--Select statement using summary function COUNT for Character table:
SELECT COUNT(*)
FROM Character;

--Select statement using summary function AVG for Box_Office table:
SELECT AVG(BO_Revenue)
FROM Box_Office;

--Multi-table select statement joining Movie, Movie_Character and Character tables:
SELECT M_Name, C_Name
FROM Movie
JOIN Movie_Character
ON Movie.M_ID = Movie_Character.M_ID
JOIN Character
ON Movie_Character.C_ID = Character.C_ID;

--Another select statement of my choice to show movies released after 2010:
SELECT M_Name, M_Release_Year
FROM Movie
WHERE M_Release_Year > 2010;
