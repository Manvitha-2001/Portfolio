CREATE DATABASE hospital_db;
USE hospital_db;


-- Step 1: Create and select the database
DROP DATABASE IF EXISTS hospital_db;
CREATE DATABASE hospital_db;
USE hospital_db;

-- Step 2: Drop all tables if they exist (in the right order to avoid FK issues)
DROP TABLE IF EXISTS Medications;
DROP TABLE IF EXISTS MedicalRecords;
DROP TABLE IF EXISTS Appointments;
DROP TABLE IF EXISTS DoctorSchedules;
DROP TABLE IF EXISTS Doctors;
DROP TABLE IF EXISTS Patients;
DROP TABLE IF EXISTS Departments;
DROP TABLE IF EXISTS Users;

-- Step 3: Create all tables

CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE Patients (
    patient_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    contact VARCHAR(20),
    address TEXT
);

CREATE TABLE Doctors (
    doctor_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    specialization VARCHAR(100),
    contact VARCHAR(20),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE DoctorSchedules (
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT,
    day_of_week VARCHAR(20),
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
    schedule_id INT PRIMARY KEY AUTO_INCREMENT,
    doctor_id INT,
    day_of_week VARCHAR(20),
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);
CREATE TABLE Appointments (
    appointment_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    appointment_time TIME,
    status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE MedicalRecords (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    visit_date DATE,
    diagnosis TEXT,
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

CREATE TABLE Medications (
    medication_id INT PRIMARY KEY AUTO_INCREMENT,
    record_id INT,
    medication_name VARCHAR(100),
    dosage VARCHAR(50),
    duration VARCHAR(50),
    FOREIGN KEY (record_id) REFERENCES MedicalRecords(record_id)
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50),
    password VARCHAR(50),
    role VARCHAR(20)
);

-- Step 4: Insert sample data

-- Departments
INSERT INTO Departments (name) VALUES 
('Cardiology'), ('Neurology'), ('Orthopedics'), ('General Medicine'), ('Pediatrics');

-- Doctors
INSERT INTO Doctors (name, specialization, contact, department_id) VALUES
('Dr. John Smith', 'Cardiologist', '1234567890', 1),
('Dr. Jane Doe', 'Neurologist', '2345678901', 2),
('Dr. Sam Patel', 'Orthopedic', '3456789012', 3),
('Dr. Lily Green', 'General Physician', '4567890123', 4),
('Dr. Rick James', 'Pediatrician', '5678901234', 5),
('Dr. Amanda Ray', 'Cardiologist', '6789012345', 1),
('Dr. Steve Lee', 'Neurologist', '7890123456', 2),
('Dr. Nora Bell', 'Orthopedic', '8901234567', 3),
('Dr. Mike Hall', 'General Physician', '9012345678', 4),
('Dr. Elsa White', 'Pediatrician', '0123456789', 5);

-- Patients
INSERT INTO Patients (name, age, gender, contact, address) VALUES
('Alice Walker', 30, 'Female', '9876543210', '123 Maple St'),
('Bob Stone', 45, 'Male', '8765432109', '456 Pine Ave'),
('Cathy Brown', 29, 'Female', '7654321098', '789 Oak Blvd'),
('David Black', 52, 'Male', '6543210987', '321 Birch Ln'),
('Emma King', 60, 'Female', '5432109876', '654 Cedar Ct'),
('Frank Long', 33, 'Male', '4321098765', '987 Ash Dr'),
('Grace Lin', 40, 'Female', '3210987654', '321 Fir Way'),
('Henry Ford', 25, 'Male', '2109876543', '432 Palm Rd'),
('Ivy Turner', 38, 'Female', '1098765432', '543 Spruce Pl'),
('Jackie Chan', 50, 'Male', '0987654321', '654 Elm St'),
('Kelly Ray', 42, 'Female', '0876543210', '100 Apple Rd'),
('Leo Wayne', 35, 'Male', '0765432109', '200 Peach Blvd'),
('Mona Gale', 27, 'Female', '0654321098', '300 Pear Ln'),
('Nick Frost', 49, 'Male', '0543210987', '400 Grape Ct'),
('Olive Dean', 55, 'Female', '0432109876', '500 Banana Dr'),
('Peter Yen', 60, 'Male', '0321098765', '600 Cherry Pl'),
('Queen Hill', 44, 'Female', '0210987654', '700 Lime St'),
('Ray Kay', 39, 'Male', '0109876543', '800 Lemon Rd'),
('Sophie Bloom', 29, 'Female', '9991234567', '900 Berry Blvd'),
('Tom Jett', 33, 'Male', '8882345678', '1000 Mango Way');

-- Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, status) VALUES
(1, 1, '2025-05-10', '09:00:00', 'Completed'),
(2, 2, '2025-05-11', '10:00:00', 'Scheduled'),
(3, 3, '2025-05-11', '11:00:00', 'Completed'),
(4, 4, '2025-05-12', '12:00:00', 'Cancelled'),
(5, 5, '2025-05-12', '14:00:00', 'Scheduled'),
(6, 6, '2025-05-13', '09:30:00', 'Scheduled'),
(7, 7, '2025-05-13', '10:30:00', 'Scheduled'),
(8, 8, '2025-05-13', '11:30:00', 'Completed'),
(9, 9, '2025-05-14', '13:00:00', 'Scheduled'),
(10, 10, '2025-05-14', '15:00:00', 'Scheduled');

-- Medical Records
INSERT INTO MedicalRecords (patient_id, doctor_id, visit_date, diagnosis, notes) VALUES
(1, 1, '2025-05-10', 'Hypertension', 'Monitor BP daily'),
(3, 3, '2025-05-11', 'Knee Pain', 'Physiotherapy recommended'),
(5, 5, '2025-05-12', 'Flu', 'Take rest and fluids'),
(8, 8, '2025-05-13', 'Fracture', 'Surgery scheduled'),
(10, 10, '2025-05-14', 'Asthma', 'Prescribed inhaler');

-- Medications
INSERT INTO Medications (record_id, medication_name, dosage, duration) VALUES
(1, 'Amlodipine', '5mg', '30 days'),
(2, 'Ibuprofen', '400mg', '7 days'),
(3, 'Paracetamol', '500mg', '5 days'),
(4, 'Calcium', '500mg', '14 days'),
(5, 'Salbutamol', '100mcg', 'As needed');

-- Users
INSERT INTO Users (username, password, role) VALUES
('admin1', 'adminpass', 'admin'),
('reception1', 'receppass', 'receptionist'),
('drjohn', 'doc123', 'doctor'),
('drjane', 'neuropass', 'doctor'),
('nurse1', 'nursepass', 'nurse');


-- Insert Departments
INSERT INTO Departments (name) VALUES 
('Cardiology'), ('Neurology'), ('Orthopedics'), ('General Medicine'), ('Pediatrics');

-- Insert Doctors (10)
INSERT INTO Doctors (name, specialization, contact, department_id) VALUES
('Dr. John Smith', 'Cardiologist', '1234567890', 1),
('Dr. Jane Doe', 'Neurologist', '2345678901', 2),
('Dr. Sam Patel', 'Orthopedic', '3456789012', 3),
('Dr. Lily Green', 'General Physician', '4567890123', 4),
('Dr. Rick James', 'Pediatrician', '5678901234', 5),
('Dr. Amanda Ray', 'Cardiologist', '6789012345', 1),
('Dr. Steve Lee', 'Neurologist', '7890123456', 2),
('Dr. Nora Bell', 'Orthopedic', '8901234567', 3),
('Dr. Mike Hall', 'General Physician', '9012345678', 4),
('Dr. Elsa White', 'Pediatrician', '0123456789', 5);

-- Insert Patients (20)
INSERT INTO Patients (name, age, gender, contact, address) VALUES
('Alice Walker', 30, 'Female', '9876543210', '123 Maple St'),
('Bob Stone', 45, 'Male', '8765432109', '456 Pine Ave'),
('Cathy Brown', 29, 'Female', '7654321098', '789 Oak Blvd'),
('David Black', 52, 'Male', '6543210987', '321 Birch Ln'),
('Emma King', 60, 'Female', '5432109876', '654 Cedar Ct'),
('Frank Long', 33, 'Male', '4321098765', '987 Ash Dr'),
('Grace Lin', 40, 'Female', '3210987654', '321 Fir Way'),
('Henry Ford', 25, 'Male', '2109876543', '432 Palm Rd'),
('Ivy Turner', 38, 'Female', '1098765432', '543 Spruce Pl'),
('Jackie Chan', 50, 'Male', '0987654321', '654 Elm St'),
('Kelly Ray', 42, 'Female', '0876543210', '100 Apple Rd'),
('Leo Wayne', 35, 'Male', '0765432109', '200 Peach Blvd'),
('Mona Gale', 27, 'Female', '0654321098', '300 Pear Ln'),
('Nick Frost', 49, 'Male', '0543210987', '400 Grape Ct'),
('Olive Dean', 55, 'Female', '0432109876', '500 Banana Dr'),
('Peter Yen', 60, 'Male', '0321098765', '600 Cherry Pl'),
('Queen Hill', 44, 'Female', '0210987654', '700 Lime St'),
('Ray Kay', 39, 'Male', '0109876543', '800 Lemon Rd'),
('Sophie Bloom', 29, 'Female', '9991234567', '900 Berry Blvd'),
('Tom Jett', 33, 'Male', '8882345678', '1000 Mango Way');

-- Insert Appointments (10)
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, status) VALUES
(1, 1, '2025-05-10', '09:00:00', 'Completed'),
(2, 2, '2025-05-11', '10:00:00', 'Scheduled'),
(3, 3, '2025-05-11', '11:00:00', 'Completed'),
(4, 4, '2025-05-12', '12:00:00', 'Cancelled'),
(5, 5, '2025-05-12', '14:00:00', 'Scheduled'),
(6, 6, '2025-05-13', '09:30:00', 'Scheduled'),
(7, 7, '2025-05-13', '10:30:00', 'Scheduled'),
(8, 8, '2025-05-13', '11:30:00', 'Completed'),
(9, 9, '2025-05-14', '13:00:00', 'Scheduled'),
(10, 10, '2025-05-14', '15:00:00', 'Scheduled');

-- Insert MedicalRecords (5)
INSERT INTO MedicalRecords (patient_id, doctor_id, visit_date, diagnosis, notes) VALUES
(1, 1, '2025-05-10', 'Hypertension', 'Monitor BP daily'),
(3, 3, '2025-05-11', 'Knee Pain', 'Physiotherapy recommended'),
(5, 5, '2025-05-12', 'Flu', 'Take rest and fluids'),
(8, 8, '2025-05-13', 'Fracture', 'Surgery scheduled'),
(10, 10, '2025-05-14', 'Asthma', 'Prescribed inhaler');

-- Insert Medications (5)
INSERT INTO Medications (record_id, medication_name, dosage, duration) VALUES
(1, 'Amlodipine', '5mg', '30 days'),
(2, 'Ibuprofen', '400mg', '7 days'),
(3, 'Paracetamol', '500mg', '5 days'),
(4, 'Calcium', '500mg', '14 days'),
(5, 'Salbutamol', '100mcg', 'As needed');

-- Insert Users (5)
INSERT INTO Users (username, password, role) VALUES
('admin1', 'adminpass', 'admin'),
('reception1', 'receppass', 'receptionist'),
('drjohn', 'doc123', 'doctor'),
('drjane', 'neuropass', 'doctor'),
('nurse1', 'nursepass', 'nurse');


SELECT * FROM Patients;

SELECT d.name AS Doctor, ds.day_of_week, ds.start_time, ds.end_time
FROM Doctors d
JOIN DoctorSchedules ds ON d.doctor_id = ds.doctor_id;

SELECT a.appointment_id, p.name AS Patient, d.name AS Doctor, a.appointment_date, a.status
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id
WHERE a.appointment_date >= CURDATE();

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, status)
VALUES (2, 3, '2025-05-15', '10:30:00', 'Scheduled');

SELECT mr.visit_date, d.name AS doctor, mr.diagnosis, mr.notes
FROM MedicalRecords mr
JOIN Doctors d ON mr.doctor_id = d.doctor_id
WHERE mr.patient_id = 1;

SELECT name FROM Doctors WHERE department_id = 1;

UPDATE Appointments SET status = 'Completed' WHERE appointment_id = 1;

SELECT doctor_id, COUNT(*) AS total_appointments
FROM Appointments
GROUP BY doctor_id;

INSERT INTO Patients (name, age, gender, contact, address)
VALUES ('Aria Blake', 28, 'Female', '9876543210', '12 River Street');

INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_time, status)
VALUES (21, 2, '2025-05-15', '10:00:00', 'Scheduled');

INSERT INTO MedicalRecords (patient_id, doctor_id, visit_date, diagnosis, notes)
VALUES (21, 2, '2025-05-15', 'Fever', 'Prescribed medication and advised rest');

INSERT INTO Medications (record_id, medication_name, dosage, duration)
VALUES (6, 'Paracetamol', '500mg', '5 days');

SELECT p.name AS Patient, d.name AS Doctor, mr.visit_date, mr.diagnosis, m.medication_name
FROM MedicalRecords mr
JOIN Patients p ON mr.patient_id = p.patient_id
JOIN Doctors d ON mr.doctor_id = d.doctor_id
JOIN Medications m ON mr.record_id = m.record_id
WHERE p.name = 'Aria Blake';

SELECT p.name FROM Appointments a JOIN Patients p ON a.patient_id = p.patient_id WHERE a.doctor_id = 1;


SELECT * FROM Appointments WHERE appointment_date = CURDATE();

