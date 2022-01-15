CREATE DATABASE HolidayTour
GO
USE HolidayTour
GO
CREATE TABLE MsCustomer(
	CustomerID CHAR(5) PRIMARY KEY CHECK (CustomerID LIKE 'CU[0-9][0-9][0-9]'),
	CustomerName VARCHAR(100) NOT NULL,
	CustomerEmail VARCHAR(100) NOT NULL,
	CusomerDOB DATE NOT NULL,
	CustomerPhone VARCHAR(20) NOT NULL
)
CREATE TABLE MsStaff(
	StaffID CHAR(5) PRIMARY KEY CHECK (StaffID LIKE 'ST[0-9][0-9][0-9]'),
	StaffName VARCHAR(100) NOT NULL,
	StaffEmail VARCHAR(100) NOT NULL,
	StaffPhone VARCHAR(20) NOT NULL,
	StaffSalary INT NOT NULL
)
CREATE TABLE MsDestinationType(
	DestinationTypeID CHAR(5) PRIMARY KEY CHECK (DestinationTypeID LIKE 'DT[0-9][0-9][0-9]'), 
	DestinationTypeName VARCHAR(100) NOT NULL
)
CREATE TABLE MsDestination(
	DestinationID CHAR(5) PRIMARY KEY CHECK (DestinationID LIKE 'DS[0-9][0-9][0-9]'),
	DestinationTypeID CHAR(5) FOREIGN KEY REFERENCES MsDestinationType(DestinationTypeID) ON UPDATE CASCADE ON DELETE CASCADE,
	DestinationName VARCHAR(100) NOT NULL,
	DestinationPrice INT NOT NULL,
	DestinationLocation VARCHAR(200) NOT NULL,
	DestinationDescription VARCHAR(200) NOT NULL
)
CREATE TABLE Ticket(
	TicketID CHAR(5) PRIMARY KEY CHECK (TicketID LIKE 'TX[0-9][0-9][0-9]'),
	CustomerID CHAR(5) FOREIGN KEY REFERENCES MsCustomer(CustomerID) ON UPDATE CASCADE ON DELETE CASCADE,
	StaffID CHAR(5) FOREIGN KEY REFERENCES MsStaff(StaffID) ON UPDATE CASCADE ON DELETE CASCADE,
	PurchaseDate DATE NOT NULL
)
CREATE TABLE TicketDetail(
	TicketID CHAR(5) FOREIGN KEY REFERENCES Ticket(TicketID) ON UPDATE CASCADE ON DELETE CASCADE,
	DestinationID CHAR(5) FOREIGN KEY REFERENCES MsDestination(DestinationID) ON UPDATE CASCADE ON DELETE CASCADE,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL
)
INSERT INTO MsCustomer VALUES
('CU001','Richard Davinson','RDson@gmail.com','1983-08-26','+62183726636574'),
('CU002','Andre Oktavianus','AndreeOkta@yahoo.com','1997-02-01','+62258365111878'),
('CU003','David','david001@gmail.com','1990-04-16','+62872005905460'),
('CU004','Kelvin Setiawan Lim','setiawanKelvin@yahoo.com','1990-05-13','+62173162303159'),
('CU005','Thomas Tanu','tanuThomas@gmail.com','1995-07-14','+62741739591757'),
('CU006','Adrian Tan','adrianTan@gmail.com','1999-09-10','+62408454030477'),
('CU007','Miranda Gustavina','miranda@yahoo.com','2000-01-29','+62294488632856')
INSERT INTO MsStaff VALUES
('ST001','Ferdinand','ferdinand@gmail.com','+62511807756338',5800000),
('ST002','Kevin Wahyudi','kevinWahyudi@gmail.com','+62268572830461',6200000),
('ST003','Johanes Peter','johanesPeter@yahoo.com','+62143054932598',5250000),
('ST004','Gabriella Prasetyo','gabriellaP@yahoo.com','+62356838055586',5900000),
('ST005','Ahmad Yusuf','ahmadYusuf@gmail.com','+62069648102869',5000000),
('ST006','Michael Anderson','michaelA@yahoo.com','+62903855177990',5300000),
('ST007','Lusiana Zhao','lusiZhao@gmail.com','+62946732302624',7500000)
INSERT INTO MsDestinationType VALUES
('DT001','Culinary'),
('DT002','Adrenaline'),
('DT003','Culture'),
('DT004','Panorama'),
('DT005','Family Tour')
INSERT INTO MsDestination VALUES
('DS001','DT001','Bali Food street',250000,'Bali Island, Bali, Indonesia','Enjoy the famous beaches in bali and some fantastic culinary'),
('DS002','DT004','Lombok Beach',200000,'Lesser Sunda Islands, West Nusa Tenggara, Indonesia','The beaches and culture in lombok will astonish you'),
('DS003','DT002','National Park Mount Merapi',180000,'Mid Java & Yogyakarta, Indonesia','Get yourself one time experience of visiting historical mount Merapi'),
('DS004','DT003','Mid Java Historical Visit',185000,'Mid Java, Indonesia','See the historical Borobudur Temple, Prambanan Temple, and many other historical destination in mid java'),
('DS005','DT003','Yogyakarta visit',165000,'Yogyakarta, Indonesia','Enjoy your visit on Malioboro street, Kraton Yogyakarta, Alun - Alun, and many other destination, in Yogyakarta'),
('DS006','DT005','Bandung Holiday Tour',150000,'Bandung, West Java, Indonesia','Get yourself some experiences in bandung by visiting DDieuland, Lembang Wonderland, Farm House, Trans Studio and many other destination'),
('DS007','DT004','Belitung Island Trip',210000,'Belitung Island, Bangka Belitung Archipelago, Indonesia','Feel the experience of the second bali of Indonesia'),
('DS008','DT005','Riau Archipelago Visit Trip',125000,'Riau Archipelago, Indonesia','Enjoy destinations, beaches, culinary, and economic products there')
INSERT INTO Ticket VALUES
('TX001','CU001','ST002','2021-03-01'),
('TX002','CU002','ST001','2021-03-15'),
('TX003','CU003','ST007','2021-03-30'),
('TX004','CU004','ST005','2021-04-15'),
('TX005','CU005','ST002','2021-04-20'),
('TX006','CU006','ST001','2021-04-28'),
('TX007','CU007','ST003','2021-05-15'),
('TX008','CU001','ST004','2021-05-25'),
('TX009','CU002','ST006','2021-06-01'),
('TX010','CU003','ST001','2021-06-15')
INSERT INTO TicketDetail VALUES
('TX001','DS005','2021-04-03','2021-04-05'),
('TX001','DS001','2021-04-06','2021-04-07'),
('TX001','DS002','2021-04-08','2021-04-09'),
('TX002','DS007','2021-04-17','2021-04-19'),
('TX002','DS008','2021-04-20','2021-04-23'),
('TX003','DS004','2021-04-28','2021-05-01'),
('TX003','DS005','2021-05-02','2021-05-05'),
('TX004','DS001','2021-05-14','2021-05-15'),
('TX005','DS006','2021-05-08','2021-05-11'),
('TX005','DS004','2021-05-12','2021-05-14'),
('TX005','DS003','2021-05-15','2021-05-17'),
('TX005','DS002','2021-05-18','2021-05-21'),
('TX006','DS004','2021-06-05','2021-06-07'),
('TX006','DS005','2021-06-08','2021-06-11'),
('TX007','DS006','2021-06-05','2021-06-08'),
('TX007','DS004','2021-06-09','2021-06-11'),
('TX007','DS005','2021-06-12','2021-06-14'),
('TX007','DS003','2021-06-15','2021-06-18'),
('TX007','DS002','2021-06-19','2021-06-22'),
('TX008','DS002','2021-06-19','2021-06-21'),
('TX008','DS001','2021-06-22','2021-06-25'),
('TX009','DS006','2021-07-01','2021-07-03'),
('TX009','DS004','2021-07-04','2021-07-06'),
('TX009','DS005','2021-07-07','2021-07-09'),
('TX009','DS003','2021-07-10','2021-07-12'),
('TX009','DS002','2021-07-13','2021-07-14'),
('TX009','DS001','2021-07-15','2021-07-17'),
('TX010','DS006','2021-07-15','2021-07-17'),
('TX010','DS007','2021-07-18','2021-07-21'),
('TX010','DS008','2021-07-22','2021-07-24')
exec sp_MSforeachtable 'select * from ?'

-- Jawaban Nomor 1
SELECT * FROM MsStaff
WHERE StaffEmail like '%@gmail%'

-- Jawaban Nomor 2
SELECT mc.CustomerID, mc.CustomerName, mc.CustomerEmail, mc.CustomerPhone, t.PurchaseDate FROM MsCustomer mc 
JOIN Ticket t ON t.CustomerID = mc.CustomerID
WHERE DATENAME(MONTH,t.PurchaseDate)='April'

-- Jawaban Nomor 3
SELECT md.DestinationID, md.DestinationName, md.DestinationLocation, CAST(COUNT(td.DestinationID) AS varchar) + ' Times' as [Total Visit] FROM MsDestination  md 
JOIN TicketDetail td ON td.DestinationID = md.DestinationID
GROUP BY md.DestinationID, md.DestinationName, md.DestinationLocation
HAVING COUNT(td.DestinationID)>=3
ORDER BY COUNT(td.DestinationID) DESC

-- Jawaban Nomor 4
SELECT t.TicketID, mc.CustomerID, mc.CustomerName, ms.StaffID, ms.StaffName, t.PurchaseDate, COUNT(td.DestinationID) as [Total Destination] , SUM(DATEDIFF(DAY,td.StartDate,td.EndDate))+1 as [Total Days] FROM Ticket t 
JOIN MsCustomer mc ON mc.CustomerID=t.CustomerID 
JOIN MsStaff ms ON ms.StaffID=t.StaffID 
JOIN TicketDetail td ON td.TicketID=t.TicketID
WHERE DATEPART(MONTH,t.PurchaseDate)= 4
GROUP BY t.TicketID, mc.CustomerID, mc.CustomerName, ms.StaffID, ms.StaffName, t.PurchaseDate
UNION
SELECT t.TicketID, mc.CustomerID, mc.CustomerName, ms.StaffID, ms.StaffName, t.PurchaseDate, COUNT(td.DestinationID) as [Total Destination] , SUM(DATEDIFF(DAY,td.StartDate,td.EndDate))+1 as [Total Days] FROM Ticket t 
JOIN MsCustomer mc ON mc.CustomerID=t.CustomerID 
JOIN MsStaff ms ON ms.StaffID=t.StaffID 
JOIN TicketDetail td ON td.TicketID=t.TicketID
WHERE DATEPART(MONTH,t.PurchaseDate)= 6
GROUP BY t.TicketID, mc.CustomerID, mc.CustomerName, ms.StaffID, ms.StaffName, t.PurchaseDate

-- Jawaban Nomor 5
SELECT a.CustomerID,a.CustomerName,a.CustomerEmail,STUFF(a.CustomerPhone, 1, 3, '0') as CustomerPhone,d.DestinationID,d.DestinationName FROM MsCustomer a
JOIN MsDestination d ON NOT EXISTS(
    SELECT f.DestinationID FROM Ticket b
    JOIN TicketDetail c ON c.TicketID=b.TicketID
    JOIN MsDestination f ON c.DestinationID = f.DestinationID
    WHERE a.CustomerID = b.CustomerID AND f.DestinationID = d.DestinationID
)
WHERE a.CustomerEmail like '%yahoo%'

-- Jawaban Nomor 6
SELECT mc.CustomerID, mc.CustomerName, mc.CustomerEmail, mc.CusomerDOB, mc.CustomerPhone, sub.sum AS [Total Spending] FROM MsCustomer mc 
JOIN (
   SELECT t.CustomerID,
   SUM(DestinationPrice*(DATEDIFF(DAY,td.StartDate,td.EndDate))) AS [sum] FROM MsDestination md 
   JOIN TicketDetail td ON td.DestinationID = md.DestinationID 
   JOIN Ticket t ON t.TicketID = td.TicketID
   GROUP BY t.CustomerID
) AS sub ON sub.CustomerID = mc.CustomerID
WHERE (RIGHT(mc.CustomerID,3) % 2 = 1) AND (sub.sum BETWEEN 1500000 AND 5000000)

-- Jawaban Nomor 7
CREATE VIEW [Yogyakarta_Vacation_List] AS
SELECT LOWER(mdt.DestinationTypeName) as DestinationTypeName, md.DestinationName, md.DestinationPrice, md.DestinationLocation, md.DestinationDescription FROM MsDestination md 
JOIN MsDestinationType mdt ON mdt.DestinationTypeID = md.DestinationTypeID
WHERE md.DestinationLocation LIKE '%yogyakarta%'

SELECT *FROM Yogyakarta_Vacation_List

-- Jawaban Nomor 8
CREATE VIEW  [economic_customer] as
SELECT DISTINCT mc.CustomerID, mc.CustomerPhone, mc.CustomerEmail, mc.CustomerName FROM  MsCustomer MC 
JOIN Ticket t ON t.CustomerID = mc.CustomerID 
JOIN TicketDetail td ON td.TicketID = t.TicketID 
JOIN MsDestination md ON md.DestinationID  =td.DestinationID
WHERE MONTH(t.PurchaseDate)%2=0 AND md.DestinationPrice > (
	SELECT AVG(DestinationPrice) FROM MsDestination
)

SELECT * FROM economic_customer

-- Jawaban Nomor 9
ALTER TABLE Ticket
ADD TicketStatus VARCHAR(15)

ALTER TABLE Ticket
ADD CONSTRAINT chk_ticket CHECK(TicketStatus LIKE 'Completed' OR TicketStatus LIKE 'Canceled')

SELECT * FROM Ticket

-- Jawaban Nomor 10
SELECT * FROM MsDestination

UPDATE MsDestination
SET DestinationPrice = (DestinationPrice * 0.1) + DestinationPrice FROM  MsDestination md 
JOIN TicketDetail td ON td.DestinationID = md.DestinationID 
JOIN MsDestinationType mdt ON mdt.DestinationTypeID = md.DestinationTypeID
WHERE (DATEPART(DAY,td.StartDate) < 7) AND (mdt.DestinationTypeName IN('Panorama') OR mdt.DestinationTypeName IN('Family Tour'))

SELECT * FROM MsDestination