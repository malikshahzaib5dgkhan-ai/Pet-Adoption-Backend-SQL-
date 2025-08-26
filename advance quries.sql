-- 1. Stored Procedure to INSERT a new Pet
CREATE PROCEDURE InsertPet
    @PetID INT,
    @PetName VARCHAR(100),
    @Species VARCHAR(50),
    @Breed VARCHAR(100),
    @Age INT,
    @Gender VARCHAR(10),
    @HealthStatus VARCHAR(200),
    @ArrivalDate DATE,
    @ShelterID INT
AS
BEGIN
    INSERT INTO Pet 
    VALUES (
        @PetID,
        @PetName,
        @Species,
        @Breed,
        @Age,
        @Gender,
        @HealthStatus,
        @ArrivalDate,
        @ShelterID
    );
END;

EXEC InsertPet
    @PetID = 11,
    @PetName = 'Buddy',
    @Species = 'Dog',
    @Breed = 'Beagle',
    @Age = 2,
    @Gender = 'Male',
    @HealthStatus = 'Vaccinated',
    @ArrivalDate = '2025-05-01',
    @ShelterID = 3;


-- 2. Stored Procedure to UPDATE a Pet’s HealthStatus and Shelter assignment
CREATE PROCEDURE UpdatePetInfo
    @PetID INT,
    @NewHealthStatus VARCHAR(200),
    @NewShelterID INT
AS
BEGIN
    UPDATE Pet
    SET
        HealthStatus = @NewHealthStatus,
        ShelterID    = @NewShelterID
    WHERE
        PetID = @PetID;
END;
EXEC UpdatePetInfo
    @PetID = 5,
    @NewHealthStatus = 'Under Treatment',
    @NewShelterID   = 2;


-- 3. Stored Procedure to DELETE a Pet by its PetID
CREATE PROCEDURE DeletePet
    @PetID INT
AS
BEGIN
    DELETE FROM Pet
    WHERE PetID = @PetID;
END;

EXEC DeletePet @PetID = 101;

--stored procedure to updatte the location 

create Procedure UpdateShelterLoaction
@location Varchar(100),
@newId int
as begin
UPDATE Shelter
SET Locations = @location
WHERE ShelterID = @newId;
end;

EXEC UpdateShelterLoaction 'Faisalabad', 4;

CREATE FUNCTION GetPetAgeByPetID (@PetID INT)
RETURNS INT
AS
BEGIN
    DECLARE @Age INT
    SELECT @Age = Age FROM Pet WHERE PetID = @PetID
    RETURN @Age
END;
select dbo.GetPetAgeByPetID(5) as age;


CREATE TRIGGER setAdptDate 
ON Adoption 
AFTER INSERT
AS
BEGIN
    UPDATE Adoption
    SET adoptiondate = '2025-04-05'
    WHERE AdoptionID IN (SELECT AdoptionID FROM inserted);
END;



INSERT INTO Adoption (AdoptionID, PetID, AdopterID, AdoptionDate, AdoptionStatus)
VALUES (11, 1, 1, NULL, 'pending');

SELECT * FROM Adoption 
WHERE AdoptionID = 11;