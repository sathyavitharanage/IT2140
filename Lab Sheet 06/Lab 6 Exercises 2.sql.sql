CREATE VIEW MovieTheaterCount AS
SELECT m.title, m.year, m.DirectorName, COUNT(DISTINCT sh.theaterName) AS theater_count
FROM Movie m
JOIN Show sh ON m.title = sh.movieTitle
GROUP BY m.title, m.year, m.DirectorName;

CREATE VIEW TheaterMovieCount AS
SELECT t.theaterName, t.city, COUNT(DISTINCT sh.movieTitle) AS movie_count
FROM Theater t
JOIN Show sh ON t.theaterName = sh.theaterName
GROUP BY t.theaterName, t.city;

CREATE FUNCTION MoviesByStar(@starName CHAR(25))
RETURNS INT
AS
BEGIN
    DECLARE @count INT;
    SELECT @count = COUNT(DISTINCT s.movieTitle)
    FROM StarsIn s
    WHERE s.starname = @starName;
    RETURN @count;
END;

CREATE FUNCTION SpectatorsByTheater(@theaterName VARCHAR(20))
RETURNS INT
AS
BEGIN
    DECLARE @total INT;
    SELECT @total = SUM(sh.spectators)
    FROM Show sh
    WHERE sh.theaterName = @theaterName;
    RETURN @total;
END;
