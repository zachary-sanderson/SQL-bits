/* A */
Select Hotel.Name, Address.Line1, Address.Line2, Address.Town, Address.Postcode, Hotel.PhoneNo, Hotel.PublicRating, Hotel.BreakfastCost, Hotel.Facilities 
from Hotel 
inner join Address on Hotel.Address = Address.AddressID and Address.Town = 'Bristol' and Hotel.PublicRating > 8.5 and Hotel.Facilities like '%Free Parking%';

/* B 
to add: date availabilty */neNo,
Select Hotel.name, Room.Price, Hotel.Pho Hotel.Facilities
From Hotel
Inner join Room on Room.InsideHotel = Hotel.HotelID and Room.RoomType = 'Double'
order by Room.Price ASC;

/* C 
 add breakfast charge?*/
select Hotel.Name, Room.RoomName, Room.RoomType, Booking.DateMade, Booking.Checkin, Booking.Checkout, Booking.paymentOpt, Booking.Instructions, Customer.Forename, Customer.Surname, Booking.AdultsNo, Booking.ChildNo, datediff(Booking.Checkout,Booking.Checkin)*Room.Price
from Booking
inner join Hotel on Booking.HotelID = Hotel.HotelID
inner join Room on Booking.RoomID = Room.RoomNo
inner join Customer on Booking.LeadGuest = Customer.CustomerID
where Customer.Surname = 'Cooper';

/* D 
 Must add checking on specific date*/
Select Hotel.Name, Room.RoomName,Room.RoomType,Room.Price
From Hotel
inner join Room on Room.Price > (select AVG(Price) from Room where RoomType='Double') and Room.RoomType='Double' and Room.InsideHotel=HotelID;

/* E */

/* F */
Select 
	Count(case when RoomType='Single' and InsideHotel=1 then 1 End) as SingleRooms,
	Count(case when RoomType='Double' and InsideHotel=1 then 1 End) as DoubleRooms,
	Count(case when RoomType='Deluxe' and InsideHotel=1 then 1 End) as DeluxeRooms,
	Count(case when RoomType='Family' and InsideHotel=1 then 1 End) as FamilyRooms
From Room;

/* G */
Select Sum(AdultsNo)
from Booking
where Booking.HotelID= 1 and '2018-12-26' between Booking.Checkin and Booking.Checkout;

/* H */

/* I */
Select Sum(AdultsNo) + sum(ChildNo) as TotalBreakfast
From Booking
Where Booking.HotelID=1 and Booking.Checkin < '2018-12-26'
