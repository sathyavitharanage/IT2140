-- Movie
CREATE TABLE Movie (
    title        CHAR(30),
    year         INT,
    length       FLOAT,
    language     CHAR(15),
    filmtype     CHAR(1),
    DirectorName VARCHAR(15),
    PRIMARY KEY (title, year)
);

INSERT INTO Movie VALUES
('Spider-man',2018,2.5,'English','F','Jon Watts'),
('Black Panther',2018,3,'English','F','Ryan Coogler'),
('Avengers',2018,3,'English','F','Anthony Russo'),
('Ghost in Shell',2017,2.5,'English','D','Rupert Sanders'),
('Jurrasic World',2018,2.75,'English','D','Colin Trevorrow'),
('Passengers',2016,2.75,'English','F','Morten Tyldum');

-- MovieStar
CREATE TABLE MovieStar (
    name      CHAR(25) PRIMARY KEY,
    country   VARCHAR(40),
    gender    CHAR(1),
    birthdate DATE
);

INSERT INTO MovieStar VALUES
('Tom Holland','England','M','1996-06-01'),
('Robert Downey','America','M','1963-04-04'),
('Chadwick Boseman','America','M','1977-11-29'),
('Scarlett Johansson','America','F','1984-11-22'),
('Chris Pratt','England','M','1979-06-21'),
('Bryce Howard','America','F','1981-03-02'),
('Jennifer Lawrence','America','F','1990-08-15');

-- StarsIn
CREATE TABLE StarsIn (
    movieTitle  CHAR(30),
    movieYear   INT,
    starname    CHAR(25),
    role        VARCHAR(15),
    PRIMARY KEY (movieTitle, movieYear, starname),
    FOREIGN KEY (movieTitle, movieYear) REFERENCES Movie(title, year),
    FOREIGN KEY (starname) REFERENCES MovieStar(name)
);

INSERT INTO StarsIn VALUES
('Spider-man',2018,'Tom Holland','lead'),
('Spider-man',2018,'Robert Downey','support'),
('Black Panther',2018,'Chadwick Boseman','lead'),
('Black Panther',2018,'Robert Downey','support'),
('Avengers',2018,'Robert Downey','lead'),
('Avengers',2018,'Chadwick Boseman','lead'),
('Avengers',2018,'Scarlett Johansson','lead'),
('Ghost in Shell',2017,'Scarlett Johansson','lead'),
('Jurrasic World',2018,'Chris Pratt','lead'),
('Jurrasic World',2018,'Bryce Howard','lead'),
('Passengers',2016,'Chris Pratt','lead'),
('Passengers',2016,'Jennifer Lawrence','lead');

-- Theater
CREATE TABLE Theater (
    theaterName VARCHAR(20) PRIMARY KEY,
    country     VARCHAR(40),
    city        VARCHAR(20),
    capacity    INT
);

INSERT INTO Theater VALUES
('Beverly','America','LA',300),
('Electric','England','London',275),
('Grand Rex','France','Paris',300),
('Nitehawk','America','New York',200),
('Cinnemaworld','Australia','Melbourne',250);

-- Show
CREATE TABLE Show (
    showId      INT PRIMARY KEY,
    movieTitle  CHAR(30),
    theaterName VARCHAR(20),
    datetime    DATETIME,
    ticketPrice REAL,
    spectators  INT,
    FOREIGN KEY (movieTitle) REFERENCES Movie(title),
    FOREIGN KEY (theaterName) REFERENCES Theater(theaterName)
);

INSERT INTO Show VALUES
(1,'Spider-man','Electric','2018-01-01',200,275),
(2,'Spider-man','Grand Rex','2018-01-01',200,200),
(3,'Avengers','Grand Rex','2018-04-01',200,98),
(4,'Black Panther','Beverly','2018-01-01',200,205),
(5,'Black Panther','Grand Rex','2018-01-01',300,300),
(6,'Passengers','Nitehawk','2018-01-01',200,176),
(7,'Jurrasic World','Nitehawk','2018-01-01',200,176),
(8,'Black Panther','Nitehawk','2018-01-01',200,219),
(9,'Ghost in Shell','Cinnemaworld','2018-01-01',200,101),
(10,'Black Panther','Grand Rex','2018-01-01',200,200),
(11,'Jurrasic World','Cinnemaworld','2018-01-01',200,188);

-- Booking
CREATE TABLE Booking (
    showId     INT,
    custName   VARCHAR(25),
    numTickets INT,
    PRIMARY KEY (showId, custName),
    FOREIGN KEY (showId) REFERENCES Show(showId)
);

INSERT INTO Booking VALUES
(1,'Alice',2),
(1,'Bob',3),
(2,'Charlie',4),
(3,'Alice',1),
(4,'Daniel',5),
(5,'Eve',2),
(6,'Frank',3),
(7,'Grace',2),
(8,'Alice',2),
(9,'Bob',1),
(10,'Eve',4),
(11,'Charlie',2);
