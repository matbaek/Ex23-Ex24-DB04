USE C_DB10_2018

DROP TABLE PET
DROP TABLE BREED
DROP TABLE PET_OWNER

CREATE TABLE PET_OWNER(
	OwnerID INT PRIMARY KEY IDENTITY(1,1), 
	OwnerLastName VARCHAR(100), 
	OwnerFirstName VARCHAR(100), 
	OwnerPhone VARCHAR(50), 
	OwnerEmail VARCHAR(100)
)

CREATE TABLE BREED(
	BreedName VARCHAR(100) PRIMARY KEY, 
	MinWeight FLOAT, 
	MaxWeight FLOAT, 
	AverageLifeExpectancy FLOAT
)

CREATE TABLE PET(
	PetID INT PRIMARY KEY IDENTITY(1,1), 
	PetName VARCHAR(100), 
	PetType VARCHAR(100), 
	PetBreed VARCHAR(100), 
	PetDOB DATE, 
	PetWeight FLOAT, 
	OwnerID INT NOT NULL,
	CONSTRAINT Owner_ID_PK FOREIGN KEY (OwnerID) REFERENCES PET_OWNER(OwnerID),
	CONSTRAINT Breed_Name_PK FOREIGN KEY (PetBreed) REFERENCES BREED(BreedName)
)

INSERT INTO PET_OWNER (OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail) VALUES 
	('Downs', 'Marsha',	'555 537 8765', 'Marsha.Downs@somewhere.com')
INSERT INTO PET_OWNER (OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail) VALUES 
	('James', 'Richard', '555 537 7654', 'Richard.James@somewhere.som')
INSERT INTO PET_OWNER (OwnerLastName, OwnerFirstName, OwnerPhone, OwnerEmail) VALUES 
	('Frier', 'Liz', '555 537 6543', 'Liz.Frier@somewhere.com')
INSERT INTO PET_OWNER (OwnerLastName, OwnerFirstName, OwnerEmail) VALUES 
	('Trent', 'Miles', 'Miles.Trent@somewhere.com')


INSERT INTO BREED (BreedName, MinWeight, MaxWeight, AverageLifeExpectancy) VALUES 
	('Border Collie', 15.0, 22.5, 20)
INSERT INTO BREED (BreedName, MinWeight, MaxWeight, AverageLifeExpectancy) VALUES 
	('Cashmere', 10.0, 15.0, 12)
INSERT INTO BREED (BreedName, MinWeight, MaxWeight, AverageLifeExpectancy) VALUES 
	('Collie Mix', 17.5, 25.0, 18)
INSERT INTO BREED (BreedName, MinWeight, MaxWeight, AverageLifeExpectancy) VALUES 
	('Std. Poodle', 22.5, 30.0, 18)
INSERT INTO BREED (BreedName) VALUES 
	('Unknown')

	
INSERT INTO PET (PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerID) VALUES 
	('King', 'Dog',	'Std. Poodle', '21.02.2011', 25.5, 1)
INSERT INTO PET (PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerID) VALUES 
	('Teddy', 'Cat', 'Cashmere', '01.02.2012', 10.5, 2)
INSERT INTO PET (PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerID) VALUES 
	('Fido', 'Dog',	'Std. Poodle', '17.07.2010', 28.5, 1)
INSERT INTO PET (PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerID) VALUES 
	('AJ', 'Dog', 'Collie Mix', '05.05.2011', 20.0, 3)
INSERT INTO PET (PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerID) VALUES 
	('Cedro', 'Cat', 'Unknown', '06.06.2009', 9.5, 2)
INSERT INTO PET (PetName, PetType, PetBreed, PetWeight, OwnerID) VALUES 
	('Wooley', 'Cat', 'Unknown', 9.5, 2)
INSERT INTO PET (PetName, PetType, PetBreed, PetDOB, PetWeight, OwnerID) VALUES 
	('Buster', 'Dog', 'Border Collie', '11.12.2008', 25.0, 4)


SELECT OwnerLastName, OwnerFirstName, PetName, PetType, PetBreed, AverageLifeExpectancy 
FROM PET_OWNER po
JOIN PET p ON po.OwnerID = p.OwnerID
JOIN BREED b ON b.BreedName = p.PetBreed
WHERE p.PetBreed NOT LIKE 'Unknown'

SELECT OwnerLastName, OwnerFirstName, PetName, PetType, PetBreed, AverageLifeExpectancy 
FROM PET, PET_OWNER, BREED 
WHERE PET.OwnerID = PET_OWNER.OwnerID 
AND PET.PetBreed = BREED.BreedName 
AND PET.PetBreed NOT LIKE 'Unknown'
