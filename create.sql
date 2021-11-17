create database Customers;
go

use Customers;

create table Customer(
	CustomerId int identity(1,1) not null primary key clustered,
	FirstName nvarchar(50),
	LastName nvarchar(50) not null,
	PhoneNumber nvarchar(15) constraint phone_num_e_164 CHECK(PhoneNumber like concat(replicate('[0-9]', 11), '%')),
	Email nvarchar(50) constraint email_address CHECK(Email like '%@%'),
	Notes nvarchar(max) not null,
	TotalPurchasesAmount decimal
);

create table [Address](
	AddressId int identity(1,1) not null primary key clustered,
	CustomerId int not null,
	AddressLine nvarchar(100) not null,
	AddressLine2 nvarchar(100),
	AddressType nvarchar(8) not null constraint address_type_cc check ([AddressType] in ('Shipping', 'Billing')),
	City nvarchar(50) not null,
	PostalCode nvarchar(6) not null constraint postal_code check(PostalCode like replicate('[0-9]', 6)),
	[State] nvarchar(20) not null constraint country_name_cc check ([State] in ('United States', 'Canada')),
	CONSTRAINT FK_Address_Customer FOREIGN KEY (CustomerId) references Customer (CustomerId)
);

