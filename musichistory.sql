-- 1. Query all of the entries in the Genre table
SELECT Label FROM Genre;

SELECT * FROM Artist;

SELECT * 
FROM Artist
WHERE ArtistName = "Jisie"
or ArtistName LIKE "Jordan%";

-- 2. Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist 
(ArtistName, YearEstablished)
VALUES 
("Jordan's Bluegrass Band", 1990);

-- Select all albums for a given genre

/**
SELECT Album.Title, s.Title
FROM Album 
JOIN Song s ON s.AlbumId = Album.AlbumId;
**/


/**
SELECT a.Title, s.Title 
FROM Song s 
LEFT JOIN Album a ON s.AlbumId = a.AlbumId;
**/

--3. Using the `INSERT` statement, add one, or more, albums by your artist to the `Album` table.
INSERT INTO Album 
VALUES 
(null, "The band is Back", 01/04/23, 95, "Columbia", 59 ,8);

INSERT INTO Album 
VALUES 
(null, "Walkin' Down the Embankment", 03/09/67, 1995, "Columbia", 59 ,8);

--4. Using the `INSERT` statement, add some songs that are on that album to the `Song` table.

INSERT INTO Song
VALUES
("Walking Atound the Bus Depot", 242, "01/04/23", 8, 59, 23);
INSERT INTO Song
VALUES
("Eatin on the Bench", 182, "03/09/95", 8, 59, 23);

-- 5. Write a `SELECT` query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the [`LEFT JOIN`](https://www.tutorialspoint.com/sql/sql-using-joins.htm) keyword sequence to connect the tables, and the `WHERE` keyword to filter the results to the album and artist you added.
-- **Reminder:** Direction of join matters. Try the following statements and see the difference in results.


    SELECT a.Title, s.Title, n.ArtistName
	FROM Album a 
	LEFT JOIN Song s 
	LEFT JOIN Artist n
	ON s.AlbumId = a.AlbumId
	Where n.ArtistId = 59;
    


--  6. Using `SELECT` and `LEFT JOIN`, write a query that displays the song title, the song duration, the album label, and the genre name for every song.

     SELECT  s.Title, s. SongLength, a.Label, g.Label
	 FROM Song s 
	 LEFT JOIN Album a ON s.AlbumId = a.AlbumId
	 Left JOIN Genre g ON s.GenreId = g.GenreId;

--7. Using a `WHERE` clause, modify the previous query to only show the information for songs that have a duration of 250 or greater.

     SELECT  s.Title, s. SongLength, a.Label, g.Label
	 FROM Song s 
	 LEFT JOIN Album a ON s.AlbumId = a.AlbumId
	 Left JOIN Genre g ON s.GenreId = g.GenreId
	 WHERE s.SongLength >= 250;

-- 8. Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT s.AlbumId, a.Title, COUNT(s.SongId)
FROM Song s
JOIN Album a on s.AlbumId = a.AlbumId
GROUP BY s.AlbumId;

--9. Write a `SELECT` statement to display how many songs exist for each artist. You'll need to use the `COUNT()` function and the `GROUP BY` keyword sequence.

 SELECT s.ArtistId, a.ArtistName, COUNT(s.SongId)
 FROM Song s
 JOIN Artist a on a.ArtistId = s.ArtistId
 GROUP BY s.ArtistId;

--10. Write a `SELECT` statement to display how many songs exist for each genre. You'll need to use the `COUNT()` function and the `GROUP BY` keyword sequence.

 SELECT s.GenreId, g.label, COUNT(s.SongId)
 FROM Song s
 JOIN Genre g on g.GenreId = s.GenreId
 GROUP BY s.GenreId;

 --11. Write a `SELECT` statement to display how many artists exist for each genre. 
 --You'll need to use the `COUNT()` function and the `GROUP BY` keyword sequence.
 
 SELECT g.GenreId, g.label, COUNT(a.ArtistId)
 FROM Album a
 JOIN Genre g ON g.GenreId = a.GenreId
 GROUP BY g.GenreId;


-- 12. Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

SELECT a.Title, MAX(a.AlbumLength)
FROM Album a;

--13. Using `MAX()` function, write a select statement to find the song with the longest duration. The result should display the album title and the duration.

SELECT s.Title, MAX(s.SongLength)
FROM Song s;


--14. Modify the previous query to also display the title of the album.

SELECT s.Title, MAX(s.SongLength), a.Title
FROM Song s
 JOIN Album a ON a.AlbumId = s.AlbumId;

  
-- You can limit the results of a query using the LIMIT keyword.



-- Your challenge is to write a query to answer the following questions from the sales team.

-- Which album has the most songs?

SELECT Title, AlbumLength
FROM Album
ORDER BY AlbumLength ASC
LIMIT 1

--Which genre has been assigned to the most songs?

SELECT g.Label, s.GenreId
FROM Song s
JOIN Genre g 
ORDER BY g.GenreId DESC
LIMIT 1

--Which record label has released the most albums?
--To accomplish this, you will need to use the MAX() aggregation function, 
the GROUP BY clause, the ORDER BY clause, and the LIMIT keyword.


