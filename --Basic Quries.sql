--Basic Quries
--1
select PetName
from pet;

--2
select *
from shelter
where locations=' Lahore';

--Alter Quries
ALTER TABLE Pet
ALTER COLUMN PetName VARCHAR(100) NOT NULL;

ALTER TABLE Adopter 
ADD CNIC VARCHAR(16) NOT NULL DEFAULT '00000-0000000-0';

select distinct age
from pet where PetName in ('bruno');

SELECT PetName ,age
FROM Pet 
WHERE PetName LIKE 's%' AND Age BETWEEN 1 AND 5;
 
EXEC sp_rename 'pet.name', 'petname', 'COLUMN';

EXEC sp_rename 'Adopter', 'AdopterInfo';

ALTER TABLE Adopter
ALTER COLUMN Phone VARCHAR(30);


SELECT FullName
FROM Adopter
WHERE AdopterID IN (
    SELECT AdopterID
    FROM Adoption
    WHERE PetID IN (
        SELECT PetID 
        FROM Pet
        WHERE Age > 3
    )
);
--inline table-valued
CREATE FUNCTION GetPetsBySpecies (@Species VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
    SELECT PetID, PetName, Age, Breed
    FROM Pet
    WHERE Species = @Species
);

SELECT * 
FROM dbo.GetPetsBySpecies('Dog');


--information of the adopter who have addopted more than onepet

SELECT Adopter.*
FROM Adopter 
JOIN Adoption  ON Adopter.AdopterID = Adoption.AdopterID
GROUP BY Adopter.AdopterID, Adopter.FullName, Adopter.Email, Adopter.Phone, Adopter.AdopterAddress, Adopter.AdoptionHistoryCount,Adopter.cnic
HAVING COUNT(Adoption.PetID) > 0;

-- 3. 
SELECT COUNT(*) AS TotalPetsInShelter 
FROM Pet
WHERE ShelterID IS NOT NULL;

-- 4. 
SELECT Adopter.FullName, Pet.PetName
FROM Adoption
JOIN Adopter ON Adoption.AdopterID = Adopter.AdopterID
JOIN Pet ON Adoption.PetID = Pet.PetID;

-- 5. 
SELECT MedicalHistory.Diagnosis, MedicalHistory.Treatment, MedicalHistory.CheckupDate
FROM MedicalHistory
WHERE MedicalHistory.PetID = 1;

-- 6.
SELECT Amount, DateOfDonation
FROM Donation
WHERE DonationID = 1;



--7
SELECT 
    Pet.PetName, 
    Shelter.ShelterName
FROM Pet
JOIN Shelter ON Pet.ShelterID = Shelter.ShelterID;


-- 8. 
SELECT 
     FullName
FROM Volunteer
JOIN Shelter ON Volunteer.ShelterID = Shelter.ShelterID
WHERE ShelterName = 'Safe Haven Karachi';

-- 9. 
SELECT 
    Shelter.ShelterName, 
    COUNT(Pet.PetID) AS TotalPets
FROM Shelter
 JOIN Pet ON Shelter.ShelterID = Pet.ShelterID
GROUP BY Shelter.ShelterName;

-- 10
SELECT 
    AVG(Pet.Age) AS AverageAge
FROM Pet
WHERE Pet.Species = 'Dog';

-- 11
SELECT 
    Pet.PetID, 
    Pet.PetName, 
    Pet.Species, 
    Pet.Breed
FROM Pet
 left JOIN MedicalHistory ON Pet.PetID = MedicalHistory.PetID
WHERE MedicalHistory.RecordID IS not  NULL;

-- 12
SELECT 
   donation.*
FROM Donation
JOIN Shelter ON Donation.ShelterID = Shelter.ShelterID
WHERE Shelter.ShelterName = 'Animal Friends Islamabad';

-- 13
SELECT 
    Shelter.ShelterID,
   
    SUM(Donation.Amount) AS TotalDonations
FROM Donation
JOIN Shelter ON Donation.ShelterID = Shelter.ShelterID
GROUP BY Shelter.ShelterID
ORDER BY TotalDonations DESC;

-- 14
SELECT 
    Adopter.*
FROM Adopter
JOIN Adoption ON Adopter.AdopterID = Adoption.AdopterID
WHERE Adoption.AdoptionDate =GETDATE()
  AND Adoption.AdoptionStatus = 'Completed';

-- 15
SELECT 
    Pet.PetName, 
    COUNT(PetActivityLog.LogID) AS ActivityCount
FROM Pet
 left JOIN PetActivityLog ON Pet.PetID = PetActivityLog.PetID
GROUP BY Pet.PetName;
-- 16
SELECT 
    Volunteer.FullName AS VolunteerName, 
    Shelter.ShelterName
FROM Volunteer
JOIN Shelter ON Volunteer.ShelterID = Shelter.ShelterID;

-- 17.
SELECT 
    ShelterName
FROM Shelter
WHERE Capacity > 50;

-- 18.
select Adopter.FullName,pet.PetName
from adoption
join Adopter on Adoption.AdopterID=Adopter.AdopterID
join pet on Adoption.PetID=pet.PetID
where AdoptionStatus='pending';

-- 19.
SELECT 
    MedicalHistory.Treatment,Pet.PetName
FROM MedicalHistory
JOIN Pet ON MedicalHistory.PetID = Pet.PetID
WHERE MedicalHistory.Diagnosis = 'Injury';

--20
update Shelter
set ShelterName='Multan'
where ShelterName like '%Multan%';

select*
from Shelter;

--search by 1st letter 

select Pet.PetName
from pet 
where PetName like 'p%';