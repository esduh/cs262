--
-- This SQL script builds an Acme database, deleting any pre-existing version.
--
-- @author kvlinden
-- @version Fall, 2018
--

-- Drop previous versions of the tables if they they exist, in reverse order of foreign keys.
DROP TABLE IF EXISTS PartJob;
DROP TABLE IF EXISTS Job;
DROP TABLE IF EXISTS Part;
DROP TABLE IF EXISTS Supplier;

-- Create the schema.
CREATE TABLE Supplier (
	ID integer PRIMARY KEY,
	name varchar(25),
	loginID varchar(10) NOT NULL,
	password varchar(20)
	);

CREATE TABLE Part (
	ID integer PRIMARY KEY,
	name varchar(25),
	price decimal,
	supplierID integer REFERENCES Supplier(ID)
	);

CREATE TABLE Job (
	ID integer PRIMARY KEY,
	name varchar(25),
	address varchar(30)
	);

CREATE TABLE PartJob (
	partID integer REFERENCES Part(ID),
	jobID integer REFERENCES Job(ID),
	quantity integer,
	date DATE
	);

-- Allow users to select data from the tables.
GRANT SELECT ON Supplier TO PUBLIC;
GRANT SELECT ON Part TO PUBLIC;
GRANT SELECT ON Job TO PUBLIC;
GRANT SELECT ON PartJob TO PUBLIC;

-- Add sample records.
INSERT INTO Supplier VALUES (1, 'Acme', 'acme', 'joshua');
INSERT INTO Supplier VALUES (2, 'Ronco', 'ronc', 'ronc');

INSERT INTO Part VALUES (1, 'birdseed', 5.00, 1);
INSERT INTO Part VALUES (2, 'TNT', 90.00, 1);
INSERT INTO Part VALUES (3, 'lead shot', 20.00, 1);
INSERT INTO Part VALUES (4, 'Popiel pocket fisherman', 19.99, 2);

INSERT INTO Job VALUES (1, 'Student Union', 'Calvin');
INSERT INTO Job VALUES (2, NULL, 'Amway');

INSERT INTO PartJob VALUES (1, 1, 10, '2018-10-20');
INSERT INTO PartJob VALUES (2, 1, 2, '2018-10-21');
INSERT INTO PartJob VALUES (1, 2, 2, '2018-10-21');
