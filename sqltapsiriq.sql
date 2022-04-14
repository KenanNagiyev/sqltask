CREATE DATABASE Cinema
USE Cinema

CREATE TABLE Halls(
Id int identity(1,1) PRIMARY KEY,
[Name] nvarchar(50) NOT NULL,
SeatCount int
)
INSERT INTO Halls
VALUES('Alpha',10)

CREATE TABLE Customers(
id int identity(1,1) PRIMARY KEY,
[Name] nvarchar(50) NOT NULL,
Surname nvarchar(60),
Age int
)
INSERT INTO Customers
VALUES('Kenan','Nagiyev',21),('Ibrahim','Huseynov',21),('Perviz','Hesenov',19)

CREATE TABLE Films(
Id int identity(1,1) PRIMARY KEY,
[Name] nvarchar(50) NOT NULL,
ReleaseDate date
)
INSERT INTO Films
VALUES('13-cu doyuscu','2022-04-16')

CREATE TABLE Sessionss(
Id int identity(1,1) PRIMARY KEY,
[Time] time
)
INSERT INTO Sessionss
VALUES('19:00')

CREATE TABLE Tickets(
Id int identity(1,1) PRIMARY KEY,
SoldDate date,
Price decimal,
Place int,
CustomerId int references Customers(Id),
HallId int references Halls(Id),
FilmId int references Films(Id),
SessionId int references Sessionss(Id)
)
INSERT INTO Tickets
VALUES('2022-04-03',5,8,2,1,1,1)

CREATE TABLE Genres(
Id int identity(1,1) PRIMARY KEY,
[Name] nvarchar(50) NOT NULL
)
INSERT INTO Genres
VALUES('Komediya')

CREATE TABLE Actors(
Id int identity(1,1) PRIMARY KEY,
Name nvarchar(50) NOT NULL,
Surname nvarchar(60),
Age int
)
INSERT INTO Actors
VALUES('Agakisi','Kazimov',32),('Aydin','Eliyev',45)

CREATE TABLE FilmGenres(
Id int identity(1,1) PRIMARY KEY,
FilmId int references Films(Id),
GenreId int references Genres(Id)
)
INSERT INTO FilmGenres
VALUES(1,1)

CREATE TABLE fulmActors(
Id int identity(1,1) PRIMARY KEY,
FilmId int references Films(Id),
ActorId int references Actors(Id)
)
INSERT INTO fulmActors
VALUES(1,1)

ALTER FUNCTION GetEmptySeat (@Place int)
RETURNS INT
AS
BEGIN
   DECLARE @Count int
   SELECT @Count = Count(*) FROM Tickets WHERE @Place>Place
   RETURN @Count
END
 
SELECT dbo.GetEmptySeat(10)