--Insert two new actors into the actor table:
INSERT INTO actor (actor_name, actor_gender, actor_birthdate, actor_nationality)
VALUES ('Emma Watson', 'Female', '1990-04-15', 'British'),
       ('Tom Hardy', 'Male', '1977-09-15', 'British');

--Insert two new movies into the movie table:
INSERT INTO movie (movie_title, movie_release_date, movie_genre)
VALUES ('The Dark Knight', '2008-07-18', 'Action, Crime, Drama'),
       ('Inception', '2010-07-16', 'Action, Adventure, Sci-Fi');

--Update the release date of the movie with id 1
UPDATE movie
SET movie_release_date = '2008-07-14'
WHERE movie_id = 1;

--Update the character name of the character with id 1:
UPDATE character
SET character_name = 'John McClane'
WHERE character_id = 1;

--Delete the actor with id 4:
DELETE FROM actor
WHERE actor_id = 4;

--Select the movie title and release date for all movies released after 2000:
SELECT movie_title, movie_release_date
FROM movie
WHERE movie_release_date > '2000-01-01';

--Select the character name, actor name, and movie title for all characters:
SELECT character_name, actor_name, movie_title
FROM movie_character
JOIN character ON movie_character.character_id = character.character_id
JOIN actor ON movie_character.actor_id = actor.actor_id
JOIN movie ON movie_character.movie_id = movie.movie_id;

--Select the number of characters for each movie:
SELECT movie_title, COUNT(character_id) as num_characters
FROM movie_character
JOIN movie ON movie_character.movie_id = movie.movie_id
GROUP BY movie_title;

--Select the average age of actors for each nationality:
SELECT actor_nationality, AVG(YEAR(CURDATE()) - YEAR(actor_birthdate)) as avg_age
FROM actor
GROUP BY actor_nationality;

--Select the highest grossing movie and its revenue:
SELECT movie_title, MAX(movie_gross) as max_gross
FROM movie
GROUP BY movie_title
ORDER BY max_gross DESC
LIMIT 1;

--Select the characters, actors, and movies for all the sequels:
SELECT character_name, actor_name, movie_title, sequel_number
FROM movie_character
JOIN character ON movie_character.character_id = character.character_id
JOIN actor ON movie_character.actor_id = actor.actor_id
JOIN movie ON movie_character.movie_id = movie.movie_id
JOIN sequels ON movie.sequel_id = sequels.sequel_id;

--Select the movies, actors, and characters for all movies released in the 90s:
SELECT movie_title, actor_name, character_name
FROM movie_character
JOIN character ON movie_character.character_id = character.character_id
JOIN actor ON movie_character.actor_id = actor.actor_id
JOIN movie ON movie_character.movie_id = movie.movie_id
WHERE YEAR(movie_release_date) BETWEEN 1990 AND 1999;
