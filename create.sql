CREATE DATABASE [CustomerLib_Batalov];
GO

USE [CustomerLib_Batalov];
GO

CREATE TABLE [Customer] (
    CustomerID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	FirstName nvarchar(50),
	LastName nvarchar(50) NOT NULL
	CHECK(LEN(TRIM(LastName)) > 0),
	PhoneNumber varchar(12)
	CHECK(
	    (PhoneNumber IS NULL) OR
	    (PhoneNumber LIKE '+1[2-9][0-9][0-9][2-9][0-9][0-9][0-9][0-9][0-9][0-9]') OR
	    (PhoneNumber LIKE '1[2-9][0-9][0-9][2-9][0-9][0-9][0-9][0-9][0-9][0-9]') OR
		(PhoneNumber LIKE '[2-9][0-9][0-9][2-9][0-9][0-9][0-9][0-9][0-9][0-9]')
	),
	Email nvarchar(100)
	CHECK(
	    (Email IS NULL) OR
	    (Email LIKE '%@%.%')
	),
	TotalPurchasesAmount money
);
GO

CREATE TABLE [Address] (
    AddressID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	CustomerID int REFERENCES Customer(CustomerID) NOT NULL,
	AddressLine nvarchar(100) NOT NULL
	CHECK(LEN(TRIM(AddressLine)) > 0),
	AddressLine2 nvarchar(100),
	AddressType varchar(8) NOT NULL
	CHECK(AddressType IN ('Shipping', 'Billing')),
	City varchar(50) NOT NULL
	CHECK(LEN(TRIM(City)) > 0),
	PostalCode varchar(6) NOT NULL
	CHECK(LEN(TRIM(PostalCode)) > 0),
	State varchar(20) NOT NULL
	CHECK(LEN(TRIM(State)) > 0),
	Country varchar(20) NOT NULL
	CHECK(UPPER(Country) IN ('UNITED STATES', 'CANADA'))
);
GO

CREATE TABLE [Note] (
    NoteID int IDENTITY(1,1) PRIMARY KEY NOT NULL,
    CustomerID int REFERENCES Customer(CustomerID) NOT NULL,
    Text nvarchar(100)
);
