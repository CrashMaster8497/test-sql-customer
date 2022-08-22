USE [CustomerLib_Batalov]
GO

INSERT INTO [Customer](FirstName, LastName, PhoneNumber, Email)
VALUES
    ('first1', 'last1', '+12002000000', 'a@b.c'),
    ('first2', 'last2', '12002000000', 'abc1@def2.ghi3'),
	('first3', 'last3', '2002000000', 'jkl4@mno5.pqr6'),
	('first4', 'last4', '+12123456789', 'stu7@vwx8.yz90'),
	('', 'last5', null, null),
	(null, 'last6', null, null)
;
GO

UPDATE [Customer] SET TotalPurchasesAmount = 10
WHERE FirstName = 'first1'
GO

INSERT INTO [Customer](FirstName, LastName, PhoneNumber, Email)
VALUES
    (NULL, 'last', '+12002000000', 'a@b.c'),
    ('', 'last', '+12002000000', 'a@b.c'),
	(REPLICATE('a', 51), 'lastname3', '+12002000000', 'a@b.c'),
	('first', NULL, '+12002000000', 'a@b.c'),
	('first', '', '+12002000000', 'a@b.c'),
	('first', REPLICATE('a', 51), '+12002000000', 'a@b.c'),
	('first', 'last', '+11002000000', 'a@b.c'),
	('first', 'last', '+12001000000', 'a@b.c'),
	('first', 'last', '-12002000000', 'a@b.c'),
	('first', 'last', '+12a02000000', 'a@b.c'),
	('first', 'last', '+1200200000', 'a@b.c'),
	('first', 'last', '+120020000000', 'a@b.c'),
	('first', 'last', '+12002000000', '@b.c'),
	('first', 'last', '+12002000000', 'a@.c'),
	('first', 'last', '+12002000000', 'a@b.'),
	('first', 'last', '+12002000000', 'ab.c'),
	('first', 'last', '+12002000000', 'a@bc')
;
GO

UPDATE [Customer] SET CustomerID = 1000
WHERE FirstName = 'first1'
GO

INSERT INTO [Address](CustomerID, AddressLine, AddressLine2, AddressType, City, PostalCode, State, Country)
VALUES
    (1, 'line', 'line2', 'Shipping', 'city', 'postal', 'state', 'United States'),
    (2, 'line', '', 'Shipping', 'city', 'postal', 'state', 'Canada'),
    (1, 'line', null, 'Billing', 'city', 'postal', 'state', 'united states'),
    (3, 'line', 'line2', 'Billing', 'city', 'postal', 'state', 'canada')
;
GO

INSERT INTO [Address](CustomerID, AddressLine, AddressLine2, AddressType, City, PostalCode, State, Country)
VALUES
    (1, 'line', 'line2', 'Shipping', 'city', 'postal', 'state', 'United States'),
    (0, 'line', 'line2', 'Shipping', 'city', 'postal', 'state', 'United States'),
    (10, 'line', 'line2', 'Shipping', 'city', 'postal', 'state', 'United States'),
    (1, null, 'line2', 'Shipping', 'city', 'postal', 'state', 'United States'),
    (1, '', 'line2', 'Shipping', 'city', 'postal', 'state', 'United States'),
    (1, REPLICATE('a', 101), 'line2', 'Shipping', 'city', 'postal', 'state', 'United States'),
    (1, 'line', REPLICATE('a', 101), 'Shipping', 'city', 'postal', 'state', 'United States'),
    (1, 'line', 'line2', 'Unknown', 'city', 'postal', 'state', 'United States'),
    (1, 'line', 'line2', 'Shipping', null, 'postal', 'state', 'United States'),
    (1, 'line', 'line2', 'Shipping', '', 'postal', 'state', 'United States'),
    (1, 'line', 'line2', 'Shipping', REPLICATE('a', 51), 'postal', 'state', 'United States'),
    (1, 'line', 'line2', 'Shipping', 'city', null, 'state', 'United States'),
    (1, 'line', 'line2', 'Shipping', 'city', '', 'state', 'United States'),
    (1, 'line', 'line2', 'Shipping', 'city', REPLICATE('a', 7), 'state', 'United States'),
	(1, 'line', 'line2', 'Shipping', 'city', 'postal', null, 'United States'),
	(1, 'line', 'line2', 'Shipping', 'city', 'postal', '', 'United States'),
	(1, 'line', 'line2', 'Shipping', 'city', 'postal', REPLICATE('a', 21), 'United States'),
	(1, 'line', 'line2', 'Shipping', 'city', 'postal', 'state', 'country')
;
GO

UPDATE [Address] SET AddressID = 1000
WHERE AddressID = 1
GO

INSERT INTO [Note](CustomerID, Text)
VALUES
    (1, null),
	(2, ''),
	(1, 'text')
;
GO

INSERT INTO [Note](CustomerID, Text)
VALUES
    (0, 'text'),
	(10, 'text'),
	(1, REPLICATE('a', 101))
;
GO

UPDATE [Note] SET NoteID = 1000
WHERE NoteID = 1
GO
