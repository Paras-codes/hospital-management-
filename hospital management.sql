create database hospital02;
use hospital02;
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT,
    DepartmentName VARCHAR(50),
    PRIMARY KEY (DepartmentID)
);

INSERT INTO Departments (DepartmentName) VALUES ('Cardiology'), ('Neurology'), ('Orthopedics'), ('Pediatrics');

CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    PhoneNumber VARCHAR(15),
    PRIMARY KEY (DoctorID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Doctors (FirstName, LastName, DepartmentID, PhoneNumber) VALUES ('John', 'Doe', 1, '1234567890'), ('Jane', 'Smith', 2, '0987654321');

CREATE TABLE Nurses (
    NurseID INT AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    PhoneNumber VARCHAR(15),
    PRIMARY KEY (NurseID),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

INSERT INTO Nurses (FirstName, LastName, DepartmentID, PhoneNumber) VALUES ('Alice', 'Johnson', 3, '1122334455'), ('Bob', 'Williams', 4, '5566778899');

CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DOB DATE,
    Gender ENUM('Male', 'Female'),
    Address VARCHAR(100),
    PhoneNumber VARCHAR(15),
    PRIMARY KEY (PatientID)
);

INSERT INTO Patients (FirstName, LastName, DOB, Gender, Address, PhoneNumber) VALUES ('Charlie', 'Brown', '2000-01-01', 'Male', '123 Main St', '2223334444'), ('Lucy', 'Van Pelt', '1999-12-31', 'Female', '456 Elm St', '7778889999');

CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    AppointmentTime TIME,
    PRIMARY KEY (AppointmentID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, AppointmentTime) VALUES (1, 1, '2022-12-01', '10:00:00'), (2, 2, '2022-12-02', '14:00:00');

CREATE TABLE Rooms (
    RoomID INT AUTO_INCREMENT,
    RoomNumber VARCHAR(10),
    RoomType ENUM('Single', 'Double', 'ICU'),
    Capacity INT,
    PRIMARY KEY (RoomID)
);

INSERT INTO Rooms (RoomNumber, RoomType, Capacity) VALUES ('101', 'Single', 1), ('102', 'Double', 2), ('103', 'ICU', 1);

CREATE TABLE RoomAssignments (
    AssignmentID INT AUTO_INCREMENT,
    RoomID INT,
    PatientID INT,
    AssignmentDate DATE,
    PRIMARY KEY (AssignmentID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

INSERT INTO RoomAssignments (RoomID, PatientID, AssignmentDate) VALUES (1, 1, '2022-12-01'), (2, 2, '2022-12-02');