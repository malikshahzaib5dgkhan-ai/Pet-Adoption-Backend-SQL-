
create database petAdoption; 
 use petAdoption;

 -- 1. Pet Table
CREATE TABLE Pet (
    PetID INT PRIMARY KEY,
    PetName VARCHAR(100),
    Species VARCHAR(50),
    Breed VARCHAR(100),
    Age INT,
    Gender VARCHAR(10),
    HealthStatus VARCHAR(200),
    ArrivalDate DATE,
    ShelterID INT FOREIGN KEY REFERENCES Shelter(ShelterID)
);
 
-- 2. Shelter Table
CREATE TABLE Shelter (
    ShelterID INT PRIMARY KEY,
    ShelterName VARCHAR(100),
    Locations VARCHAR(200),
    ContactNumber VARCHAR(20),
    Capacity INT
);
drop table Shelter;

-- 3. Adopter Table
CREATE TABLE Adopter (
    AdopterID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    AdopterAddress VARCHAR(200),
    AdoptionHistoryCount INT
);

-- 4. Adoption Table
CREATE TABLE Adoption (
    AdoptionID INT PRIMARY KEY,
    PetID INT FOREIGN KEY REFERENCES Pet(PetID),
    AdopterID INT FOREIGN KEY REFERENCES Adopter(AdopterID),
    AdoptionDate DATE,
    AdoptionStatus VARCHAR(20)
);

-- 5. MedicalHistory Table
CREATE TABLE MedicalHistory (
    RecordID INT PRIMARY KEY,
    PetID INT FOREIGN KEY REFERENCES Pet(PetID),
    CheckupDate DATE,
    VetName VARCHAR(100),
    Diagnosis VARCHAR(200),
    Treatment VARCHAR(200)
);

-- 6. Volunteer Table
CREATE TABLE Volunteer (
    VolunteerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Phone VARCHAR(20),
    Email VARCHAR(100),
    ShelterID INT FOREIGN KEY REFERENCES Shelter(ShelterID)
);

-- 7. PetActivityLog Table
CREATE TABLE PetActivityLog (
    LogID INT PRIMARY KEY,
    PetID INT FOREIGN KEY REFERENCES Pet(PetID),
    ActivityDate DATE,
    ActivityType VARCHAR(50),
    Notes VARCHAR(500)
);

-- 8. Donation Table
CREATE TABLE Donation (
    DonationID INT PRIMARY KEY,
    DonorName VARCHAR(100),
    Amount int,
    DateOfDonation  DATE,
    ShelterID INT FOREIGN KEY REFERENCES Shelter(ShelterID)
);


--                  inserting data
INSERT INTO Shelter (ShelterID, ShelterName, Locations, ContactNumber, Capacity)
VALUES
(1, 'Happy Paws Lahore', ' Lahore', '042-35789012', 50),
(2, 'Safe Haven Karachi', ' Karachi', '021-35812345', 40),
(3, 'Animal Friends Islamabad', ' Islamabad', '051-2213344', 60),
(4, 'Rescue Me Multan', ' Multan', '061-4501234', 30),
(5, 'Purrfect Companions Faisalabad', ' Faisalabad', '041-2645567', 70);



INSERT INTO Pet (PetID, PetName, Species, Breed, Age, Gender, HealthStatus, ArrivalDate, ShelterID)
VALUES
(1, 'Sheru', 'Dog', 'German Shepherd', 3, 'Male', 'Vaccinated', '2025-01-05', 1),
(2, 'Mimi', 'Cat', 'Persian', 2, 'Female', 'Vaccinated', '2025-02-10', 1),
(3, 'Tiger', 'Dog', 'Bulldog', 4, 'Male', 'Vaccinated', '2025-03-12', 2),
(4, 'Laila', 'Cat', 'Maine Coon', 1, 'Female', 'Vaccinated', '2025-01-25', 3),
(5, 'Bruno', 'Dog', 'Golden Retriever', 5, 'Male', 'Vaccinated', '2025-03-20', 4),
(6, 'Simba', 'Cat', 'Siamese', 3, 'Male', 'Vaccinated', '2025-02-18', 5),
(7, 'Tommy', 'Dog', 'Pug', 2, 'Male', 'Vaccinated', '2025-01-30', 2),
(8, 'Lucy', 'Cat', 'Ragdoll', 2, 'Female', 'Vaccinated', '2025-03-05', 3),
(9, 'Bobby', 'Dog', 'Labrador', 1, 'Male', 'Vaccinated', '2025-04-01', 4),
(10, 'Fluffy', 'Cat', 'Himalayan', 2, 'Female', 'Vaccinated', '2025-04-03', 5);

INSERT INTO Adopter (AdopterID, FullName, Email, Phone, AdopterAddress, AdoptionHistoryCount)
VALUES
(1, 'Ali Raza', 'ali.raza@gmail.com', '0300-1234567', 'Model Town, Lahore', 1),
(2, 'Fatima Khan', 'fatima.khan@yahoo.com', '0312-2345678', 'DHA, Karachi', 0),
(3, 'Usman Tariq', 'usman.tariq@hotmail.com', '0321-3456789', 'G-11, Islamabad', 2),
(4, 'Ayesha Ahmed', 'ayesha.ahmed@gmail.com', '0333-4567890', 'New Multan, Multan', 1),
(5, 'Bilal Aslam', 'bilal.aslam@gmail.com', '0345-5678901', 'Samanabad, Faisalabad', 3),
(6, 'Zara Sheikh', 'zara.sheikh@yahoo.com', '0301-6789012', 'Johar Town, Lahore', 0),
(7, 'Hamza Butt', 'hamza.butt@hotmail.com', '0311-7890123', 'Nazimabad, Karachi', 1),
(8, 'Mehak Ali', 'mehak.ali@gmail.com', '0322-8901234', 'F-8, Islamabad', 0),
(9, 'Salman Shah', 'salman.shah@yahoo.com', '0331-9012345', 'Cantt, Multan', 2),
(10, 'Hina Malik', 'hina.malik@gmail.com', '0346-0123456', 'Jinnah Colony, Faisalabad', 0);

INSERT INTO Adoption (AdoptionID, PetID, AdopterID, AdoptionDate, AdoptionStatus)
VALUES
(1, 1, 1, '2025-04-10', 'Completed'),
(2, 2, 2, '2025-04-12', 'Pending'),
(3, 3, 3, '2025-04-14', 'Completed'),
(4, 4, 4, '2025-04-16', 'Cancelled'),
(5, 5, 5, '2025-04-18', 'Completed'),
(6, 6, 6, '2025-04-20', 'Pending'),
(7, 7, 7, '2025-04-22', 'Completed'),
(8, 8, 8, '2025-04-24', 'Completed'),
(9, 9, 9, '2025-04-26', 'Pending'),
(10, 10, 10, '2025-04-28', 'Completed');

INSERT INTO MedicalHistory (RecordID, PetID, CheckupDate, VetName, Diagnosis, Treatment)
VALUES
(1, 1, '2025-01-12', 'Dr. Yasir Nawaz', 'Healthy', 'None'),
(2, 2, '2025-02-17', 'Dr. Amna Saeed', 'Minor Flu', 'Antibiotics'),
(3, 3, '2025-03-22', 'Dr. Salman Qureshi', 'Injury', 'Wound Dressing'),
(4, 4, '2025-01-28', 'Dr. Nida Malik', 'Allergy', 'Anti-Allergy Injection'),
(5, 5, '2025-03-25', 'Dr. Asim Raza', 'Healthy', 'None'),
(6, 6, '2025-02-20', 'Dr. Sara Javed', 'Eye Infection', 'Eye Drops'),
(7, 7, '2025-01-31', 'Dr. Kamran Butt', 'Healthy', 'None'),
(8, 8, '2025-03-07', 'Dr. Ayesha Ahmed', 'Minor Injury', 'Bandage'),
(9, 9, '2025-04-02', 'Dr. Hassan Ali', 'Dental Issue', 'Dental Cleaning'),
(10, 10, '2025-04-04', 'Dr. Hina Tariq', 'Healthy', 'None');

INSERT INTO Volunteer (VolunteerID, FullName, Phone, Email, ShelterID)
VALUES
(1, 'Ahmed Siddiqui', '0301-1122334', 'ahmed.siddiqui@gmail.com', 1),
(2, 'Sana Javed', '0322-2233445', 'sana.javed@yahoo.com', 1),
(3, 'Fahad Mustafa', '0333-3344556', 'fahad.mustafa@hotmail.com', 2),
(4, 'Mariam Akhtar', '0344-4455667', 'mariam.akhtar@gmail.com', 2),
(5, 'Tariq Mahmood', '0305-5566778', 'tariq.mahmood@yahoo.com', 3),
(6, 'Iqra Bano', '0316-6677889', 'iqra.bano@hotmail.com', 3),
(7, 'Kashif Riaz', '0327-7788990', 'kashif.riaz@gmail.com', 4),
(8, 'Nida Anwar', '0338-8899001', 'nida.anwar@yahoo.com', 4),
(9, 'Farhan Aziz', '0349-9900112', 'farhan.aziz@hotmail.com', 5),
(10, 'Aiman Khan', '0302-0011223', 'aiman.khan@gmail.com', 5);

INSERT INTO PetActivityLog (LogID, PetID, ActivityDate, ActivityType, Notes)
VALUES
(1, 1, '2025-04-11', 'Training', 'Sit and Stay commands being taught.'),
(2, 2, '2025-04-12', 'Socialization', 'Meeting other cats without fear.'),
(3, 3, '2025-04-13', 'Exercise', 'Daily walk in park.'),
(4, 4, '2025-04-14', 'Training', 'Potty training ongoing.'),
(5, 5, '2025-04-15', 'Exercise', 'Playing fetch games.'),
(6, 6, '2025-04-16', 'Socialization', 'Meeting new people.'),
(7, 7, '2025-04-17', 'Training', 'Leash walking lessons.'),
(8, 8, '2025-04-18', 'Exercise', 'Morning jog sessions.'),
(9, 9, '2025-04-19', 'Training', 'Advanced obedience training.'),
(10, 10, '2025-04-20', 'Socialization', 'Friendly interaction with kids.');

INSERT INTO Donation (DonationID, DonorName, Amount, DateOfDonation, ShelterID)
VALUES
(1, 'Muhammad Bilal', 5000, '2025-04-01', 1),
(2, 'Fatima Noor', 3000, '2025-04-02', 2),
(3, 'Ali Zafar', 7000, '2025-04-03', 3),
(4, 'Sara Anwar', 2500, '2025-04-04', 4),
(5, 'Hassan Malik', 10000, '2025-04-05', 5),
(6, 'Mariam Siddiqui', 4000, '2025-04-06', 1),
(7, 'Umair Sheikh', 3500, '2025-04-07', 2),
(8, 'Nashit Javed', 6000, '2025-04-08', 3),
(9, 'Hina Rasheed', 2000, '2025-04-09', 4),
(10, 'Faisal Ahmed', 8000, '2025-04-10', 5);

									
