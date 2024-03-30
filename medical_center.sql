DROP DATABASE IF EXISTS medical_db;

CREATE DATABASE medical_db;

\c medical_db;

CREATE TABLE doctors (
    doctor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    specialty VARCHAR(40)
);

CREATE TABLE patients (
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    date_of_birth DATE
);

CREATE TABLE diseases (
    disease_id SERIAL PRIMARY KEY,
    name VARCHAR(40),
    description VARCHAR(250)
);

CREATE TABLE appointments (
    appointment_id SERIAL PRIMARY KEY,
    doctor_id INT,
    patient_id INT,
    appointment_date DATE,
    FOREIGN KEY (doctor_id) INT REFERENCES doctors (doctor_id),
    FOREIGN KEY (patient_id) INT REFERENCES patients (patient_id)
);

CREATE TABLE diagnoses (
    diagnosis_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES patients (patient_id),
    disease_id INT REFERENCES diseases (disease_id),
    diagnosis_date DATE
);