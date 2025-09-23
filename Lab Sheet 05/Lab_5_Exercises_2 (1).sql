SELECT DISTINCT s.starname
FROM StarsIn s
JOIN Movie m ON s.movieTitle = m.title AND s.movieYear = m.year
WHERE m.DirectorName = 'Jon Watts';

SELECT sh.movieTitle, SUM(sh.spectators) AS total_spectators
FROM Show sh
JOIN Theater t ON sh.theaterName = t.theaterName
WHERE t.city = 'LA'
GROUP BY sh.movieTitle;

SELECT b.custName
FROM Booking b
JOIN Show sh ON b.showId = sh.showId
GROUP BY b.custName
HAVING COUNT(DISTINCT sh.movieTitle) > 1;

SELECT t.theaterName
FROM Show sh
JOIN Theater t ON sh.theaterName = t.theaterName
GROUP BY t.theaterName
HAVING SUM(sh.ticketPrice * sh.spectators) > 50000;

SELECT b.custName
FROM Booking b
JOIN Show sh ON b.showId = sh.showId
JOIN Theater t ON sh.theaterName = t.theaterName
GROUP BY b.custName
HAVING COUNT(DISTINCT t.theaterName) > 1;