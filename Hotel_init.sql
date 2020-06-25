/* I used MariaDB to run this code, which I believe runs off MySQL.*/
Create database HotelsCA;
Use HotelsCA;
Create Table Address(
	AddressID integer AUTO_INCREMENT, 
	Line1 Varchar(50),
	Line2 Varchar(50),
	Town varchar(50),
	Postcode varchar(10),
	PRIMARY KEY (AddressID)
);
Create Table Customer(
	CustomerID Integer AUTO_INCREMENT,
	Email varchar(50),
	Title varchar(10),
	Forename varchar(100),
	Surname varchar(100),
	PhoneNo varchar (10),
	Address integer,
	CardNo varchar(16),
	expiryDate varchar(7),
	PRIMARY KEY (CustomerID),
	FOREIGN KEY (Address) REFERENCES Address(AddressID)
);
Create Table Hotel(
	HotelID integer AUTO_INCREMENT,
	Name varchar(50),
	Address integer, 
	phoneNo varchar(15),
	PublicRating float,
	BreakfastCost float,
	Facilities varchar(200),
	PRIMARY KEY (HotelID),
	FOREIGN KEY (Address) REFERENCES Address(AddressID)
);

Create Table Room(
	RoomNo integer AUTO_INCREMENT,
	InsideHotel integer,
	RoomName varchar(3),
	RoomType ENUM ('Single','Double','Deluxe','Family'),
	Price float,
	GracePeriod integer,
	PRIMARY KEY (RoomNo)
);
Create Table Booking(
	RefNo Integer AUTO_INCREMENT,
	HotelID integer,
	DateMade date,
	Checkin date,
	Checkout date,
	paymentOpt varchar(40),
	Instructions varchar(250),
	RoomID integer,
	LeadGuest integer,
	AdultsNo integer,
	ChildNo integer,
	PRIMARY KEY (RefNo),
	FOREIGN KEY (HotelID) REFERENCES Hotel(HotelID),
	FOREIGN KEY (RoomID) REFERENCES Room(RoomNo),
	FOREIGN KEY (LeadGuest) REFERENCES Customer(CustomerID)
);

INSERT INTO Address (Line1, Line2, Town, Postcode)
VALUES ('3 Orbis Wharf','Bridges Court Road','London','SW11 3GW'),
('School House','High Street','Salisbury','SP3 5DB'),
('6 King Cross Street','','Halifax','HX1 2SH'),
('Finzels Reach','','Bristol','BS1 6BX'),
('The Haymarket','','Bristol','BS1 3LP'),
('Llandoger Trow','King Street','Bristol','BS1 4ER'),
('8 Grove Road','','Exeter','EX4 6PN');

INSERT INTO Customer (Email, Title, Forename, Surname, PhoneNo, Address, CardNo, ExpiryDate)
VALUES ('i.cooper@gmail.com','Mr','Ian','Cooper','07454245098',7,'4546098711112340','10/2020'),
('admin1@exeter.ac.uk','Dr','John','Smith','01189993197253',1,'9817263434679812','03/2027'),
('totallyreal@person.com','Mrs','Sarah','Freeman','077092101823',2,'0879207348752983','01/2019');

INSERT INTO Hotel (Name, Address,PhoneNo, PublicRating, BreakfastCost,Facilities)
VALUES ('Finzels Reach',4,'0871 622 2428',7.5,10,'Free Parking, Free Wi-fi, Air Conditioned, Lift access, Breakfast-only Restaurant'),
('HayMarket',5,'0871 527 8156',8.1,8.5,'Chargeable Parking, Free Wi-fi, Air conditioned, restaurant'),
('King Street',6,'0871 527 8158',8.8,0,'Free Wi-fi, Air conditioned, Lift Access, Restaurant, Free Parking');

INSERT INTO Room (InsideHotel,RoomName,RoomType, Price,GracePeriod)
VALUES (1,'101','Double',75,1),
(1,'201','Single',65,1),
(1,'202','Double',75,1),
(1,'203','Family',125,1),
(1,'204','Deluxe',150,1),
(2,'101','Single',30,1),
(2,'102','Single',30,1),
(2,'201','Double',40,1),
(2,'202','Double',40,1),
(2,'301','Deluxe',80,1),
(3,'101','Single',60,1),
(3,'102','Double',60,1),
(3,'201','Deluxe',60,1),
(3,'202','Family',60,1),
(3,'301','Family',60,1);

INSERT INTO Booking (HotelID, DateMade, Checkin, Checkout, PaymentOpt, Instructions,RoomID,LeadGuest,AdultsNo,ChildNo)
VALUES (1,'2018-12-18','2018-12-26','2018-12-28','On arrival, card','Arrive around 10pm',1,1,2,0),
(1,'2018-12-18','2018-12-26','2018-12-28','On arrival, card','Arrive around 10pm',2,3,1,0),
(1,'2018-12-12','2018-12-28','2018-12-30','Cash','Give them everything',5,2,5,0),
(3,'2018-01-01','2018-12-25','2018-12-30','Cheque','They fancy',13,2,1,0);
