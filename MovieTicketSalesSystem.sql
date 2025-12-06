create database MTSS

create table Users(
Id int identity primary key,
UserName nvarchar(60) not null unique,
[Password] nvarchar(100) not null,
Email nvarchar(60) not null unique,
[Role] nvarchar(60) not null default 'Customer',
CreatedAt datetime2 not null default Getdate()
)

create table Movies(
Id int identity primary key,
Title nvarchar(60) not null,
[Description] nvarchar(250) not null,
DurationMinute int not null,
Genre nvarchar(60) not null,
ReleaseDate Datetime
)

create table Theaters (
Id int identity primary key,
[Name] nvarchar(60) not null,
[Location] nvarchar(100) 
)

create table Halls(
Id int identity primary key,
[Name] nvarchar(60) not null,
SeatCount int not null,
TheaterId int foreign key references Theaters(Id)
)

create table Seats(
Id int identity primary key,
[Row] nvarchar(5) not null,
SeatType nvarchar(60) not null default 'Normal',
Number int not null,
HallId int foreign key references Halls(Id),
Constraint UQ_Seat unique (HallId, [Row], Number)
)

create table ShowTime(
Id int identity primary key,
StartTime Datetime not null,
EndTime Datetime not null,
MovieId int foreign key references Movies(Id),
HallId int foreign key references Halls(Id)
)

create table Tickets(
Id int identity primary key,
Price decimal(10,2) not null,
PurchaseDate Datetime2 not null default GetDate(),
[Status] nvarchar(60) not null default 'Sold',
ShowTimeId int foreign key references ShowTime(Id),
UserId int foreign key references Users(Id),
SeatId int foreign key references Seats(Id)
)

create table Payments(
Id int identity primary key,
Amount decimal(10,2) not null,
PaymentDate Datetime2 not null default GetDate(),
PaymentMethod nvarchar(50) not null,
TicketId int foreign key references Tickets(Id)
)


INSERT INTO Users (UserName, [Password], Email, [Role])
VALUES
('fatima2004', '12345', 'fatima@example.com', 'Customer'),
('admin1', 'admin123', 'admin@example.com', 'Admin'),
('ziver77', 'pass777', 'ziver@example.com', 'Customer')


INSERT INTO Movies (Title, [Description], DurationMinute, Genre, ReleaseDate)
VALUES
('Inception', 'A dream inside a dream', 148, 'Sci-Fi', '2010-07-16'),
('The Conjuring', 'Supernatural horror film', 112, 'Horror', '2013-07-19'),
('Interstellar', 'Space and time journey', 169, 'Sci-Fi', '2014-11-07')


INSERT INTO Theaters ([Name], [Location])
VALUES
('Nizami Cinema', 'Bakı, Nizami küçəsi'),
('Park Cinema', 'Gənclik Mall, Bakı')


INSERT INTO Halls ([Name], SeatCount, TheaterId)
VALUES
('Salon 1', 50, 1),
('Salon 2', 70, 1),
('VIP Hall', 40, 2),
('IMAX', 120, 2)


INSERT INTO Seats ([Row], SeatType, Number, HallId)
VALUES
('A', 'Normal', 1, 1), ('A', 'Normal', 2, 1), ('A', 'Normal', 3, 1),
('B', 'Normal', 1, 1), ('B', 'Normal', 2, 1), ('B', 'Normal', 3, 1),
('A', 'Normal', 1, 2), ('A', 'Normal', 2, 2), ('A', 'Normal', 3, 2),
('B', 'Normal', 1, 2), ('B', 'Normal', 2, 2), ('B', 'Normal', 3, 2),
('A', 'VIP', 1, 3), ('A', 'VIP', 2, 3), ('A', 'VIP', 3, 3),
('B', 'VIP', 1, 3), ('B', 'VIP', 2, 3), ('B', 'VIP', 3, 3),
('A', 'Normal', 1, 4), ('A', 'Normal', 2, 4), ('A', 'Normal', 3, 4),
('B', 'Normal', 1, 4), ('B', 'Normal', 2, 4), ('B', 'Normal', 3, 4)


INSERT INTO ShowTime (StartTime, EndTime, MovieId, HallId)
VALUES
('2025-01-01 14:00', '2025-01-01 16:30', 1, 1),
('2025-01-01 18:00', '2025-01-01 19:50', 2, 2),
('2025-01-02 20:00', '2025-01-02 23:00', 3, 4)


INSERT INTO Tickets (Price, ShowTimeId, UserId, SeatId)
VALUES
(12.50, 1, 1, 1),
(15.00, 2, 3, 10),
(20.00, 3, 1, 20)


INSERT INTO Payments (Amount, PaymentMethod, TicketId)
VALUES
(12.50, 'Card', 1),
(15.00, 'Cash', 2),
(20.00, 'Online', 3)


