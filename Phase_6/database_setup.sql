-- Data Bros Project Phase 04

drop database contact_manager_db;

create database if not exists contact_manager_DB;
use contact_manager_DB;

-- adding tables based on each existing entity in the EER diagram

create table if not exists user (
	Username VARCHAR(45) NOT NULL,
	Password VARCHAR(45) NOT NULL,
	UserID INT PRIMARY KEY AUTO_INCREMENT,
	IsAdmin TINYINT(1),
	Email VARCHAR(45),
	NameID int
);

create table if not exists address (
	AddressID INT PRIMARY KEY AUTO_INCREMENT,
	StreetAddress VARCHAR(45),
	City VARCHAR(45),
	State VARCHAR(45),
	Country VARCHAR(45),
	ZipCode INT(5),
	Fname VARCHAR(45) NOT NULL,
	Lname VARCHAR(45) NOT NULL
);

create table if not exists company (
	CompanyID INT Primary key AUTO_INCREMENT,
	CompanyName VARCHAR(45),
	CompanyLocation VARCHAR(45),
	CompanyType VARCHAR(45),
	Employees INT
);

create table if not exists interactions (
	InteractionID INT PRIMARY KEY AUTO_INCREMENT,
	Date DATE,
	Itype VARCHAR(45),
	AssociatedContact VARCHAR(45),
	Company VARCHAR(45)
);

create table if not exists notes (
	noteID INT PRIMARY KEY AUTO_INCREMENT,
	Ntype VARCHAR(45),
	NOTE VARCHAR(200),
	Date DATE,
    interactionID int,
	Foreign key (InteractionID) REFERENCES interactions(InteractionID)
);

create table if not exists department (
	DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
	Dname VARCHAR(45),
	Dlocation VARCHAR(45),
	Demployees VARCHAR(45),
	Dmanagername VARCHAR(45),
    CompanyID int,
	Foreign Key (CompanyID) REFERENCES Company(companyID)
);


create table if not exists job (
	JobID INT PRIMARY KEY AUTO_INCREMENT,
	Title1 VARCHAR(45),
    Title2 VARCHAR(45),
    Title3 VARCHAR(45),
	JobLocation VARCHAR(45),
	DepartmentID int,
	Foreign Key (DepartmentID) REFERENCES Department(DepartmentID)
);

create table if not exists contacts (
	Fname VARCHAR(45) NOT NULL,
	Lname VARCHAR(45) NOT NULL,
	CellPhone varchar(10),
	WorkPhone varchar(10),
	FaxNum INT,
	Email VARCHAR(45),
	Gender VARCHAR(1),
	Birthday DATE,
	ContactID INT PRIMARY KEY AUTO_INCREMENT,
    JobID int
);

create table if not exists admin (
	AdminID int,
    username varchar(45),
    password varchar(45),
    office varchar(45),
    email varchar(45)
);

create table if not exists AdminNote (
	AdminNoteID int,
    AdminID int,
    note varchar(100),
    date DATE,
    NType varchar(45)
);

create table if not exists registration (
	RegID int,
    name varchar(45),
    email varchar(45),
    username varchar(45),
    password varchar(45)
);

create table if not exists addnotice (
	NoticeID int,
    DateTime datetime,
    Notice varchar(200),
    Title varchar(45),
    AdminID int
);

-- adding the many to many tables and multivalued tables

create table if not exists Contact_has_Address (
	ContactID int,
	Foreign Key (ContactID) REFERENCES contacts(contactID),
	AddressID int,
	Foreign Key (AddressID) REFERENCES address(AddressID)
);

create table if not exists name (
	NameID int primary key,
	Fname varchar(45),
    Lname varchar(45)
);

-- explain all tables
show tables;

explain address;
explain company;
explain contact_has_address;
explain contacts;
explain department;
explain interactions;
explain job;
explain notes;
explain user;
explain name;



