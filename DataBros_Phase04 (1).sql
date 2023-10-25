-- Data Bros Project Phase 04

create database if not exists contact_manager_DB;
use contact_manager_DB;

-- adding tables based on each existing entity in the EER diagram

create table if not exists user (
	Username VARCHAR(45) NOT NULL,
	Password VARCHAR(45) NOT NULL,
	UserID INT PRIMARY KEY AUTO_INCREMENT,
	IsAdmin TINYINT(1),
	Email VARCHAR(45),
	Fname VARCHAR(45),
	Lname VARCHAR(45) 
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

create table if not exists c_group (
	GroupID INT PRIMARY KEY AUTO_INCREMENT,
	GroupName VARCHAR(45),
	Gmembers VARCHAR(100),
	Gcompany VARCHAR(45),
	Gtype VARCHAR(45)
);

create table if not exists relationships (
	RelationshipID INT PRIMARY KEY AUTO_INCREMENT,
	Fname VARCHAR(45) NOT NULL,
	Lname VARCHAR(45) NOT NULL,
	Rtype VARCHAR(45),
	Fname2 VARCHAR(45) NOT NULL,
	Lname2 VARCHAR(45) NOT NULL
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
	Foreign Key (CompanyID) REFERENCES Company(companyID),
    ContactID int,
	Foreign Key (ContactID) REFERENCES contacts(contactID)
);


create table if not exists job (
	JobID INT PRIMARY KEY AUTO_INCREMENT,
	Title VARCHAR(45),
	JobLocation VARCHAR(45),
	CompanyID int,
	Foreign Key (CompanyID) REFERENCES Company(companyID),
    ContactID int,
	Foreign Key (ContactID) REFERENCES contacts(contactID)
);

create table if not exists contacts (
	Fname VARCHAR(45) NOT NULL,
	Lname VARCHAR(45) NOT NULL,
	CellPhone INT,
	WorkPhone INT,
	FaxNum INT,
	Email VARCHAR(45),
	Gender VARCHAR(1),
	Birthday DATE,
	ContactID INT PRIMARY KEY AUTO_INCREMENT
);

-- adding the many to many tables

create table if not exists Contacts_in_Group (
	ContactID int,
	Foreign Key (ContactID) REFERENCES contacts(contactID),
    GroupID int,
	Foreign Key (GroupID) REFERENCES c_group(GroupID)
);

create table if not exists Contact_has_Address (
	ContactID int,
	Foreign Key (ContactID) REFERENCES contacts(contactID),
	AddressID int,
	Foreign Key (AddressID) REFERENCES address(AddressID)
);


-- explain all tables
show tables;

explain address;
explain c_group;
explain company;
explain contact_has_address;
explain contacts;
explain contacts_in_group;
explain department;
explain interactions;
explain job;
explain notes;
explain relationships;
explain user;



