use contact_manager_DB;

/*	This is from trying to use LOCAL INFILE. gives various errors

		SET GLOBAL local_infile=1;

		SET FOREIGN_KEY_CHECKS=0;

		LOAD DATA local INFILE 'C:\SoftMARIST\DATA_MANAGEMENT\Project\dataINFILEuploads\interactions.txt' 
			INTO TABLE interactions 
		FIELDS TERMINATED BY ',';

		SET FOREIGN_KEY_CHECKS=1;

		select * from interactions;
*/
SET FOREIGN_KEY_CHECKS=0;

INSERT INTO user (Username, Password, IsAdmin, Email, NameID)
VALUES
    ('garbanzo86', 'password1', 0, 'garbanzo86@example.com', 1),
    ('FRATELLY998', 'password2', 0, 'FRATELLY998@example.com', 2),
    ('ILOVEPORSCHE911', 'adminpass1', 1, 'ILOVEPORSCHE911@example.com', 3),
    ('starfields13', 'password3', 0, 'starfields13@example.com', 4),
    ('barbara12', 'password4', 0, 'barbara12@example.com', 5),
    ('stealersFan04', 'password5', 0, 'stealersFan04@example.com', 6),
    ('yagga', 'password6', 0, 'yagga@example.com', 7),
    ('goku', 'password7', 0, 'goku@example.com', 8),
    ('scrapbrainzone', 'password8', 0, 'scrapbrainzone@example.com', 9),
    ('benandjerry', 'adminpass2', 1, 'benandjerry@example.com', 10);

select * from user;

insert into name (NameID, fname, lname)
values
	(1, 'John', 'Doe'),
    (2, 'Jane', 'Smith'),
    (3, 'Admin', 'One'),
    (4, 'Michael', 'Johnson'),
    (5, 'Emily', 'Brown'),
    (6, 'Sophia', 'Wilson'),
    (7, 'Matthew', 'Davis'),
    (8, 'David', 'Lee'),
    (9, 'Olivia', 'Anderson');

INSERT INTO address (StreetAddress, City, State, Country, ZipCode, Fname, Lname)
VALUES
    ('123 Main St', 'New York', 'NY', 'USA', 10001, 'John', 'Doe'),
    ('456 Elm St', 'Los Angeles', 'CA', 'USA', 90001, 'Jane', 'Smith'),
    ('789 Oak St', 'Chicago', 'IL', 'USA', 60601, 'Michael', 'Johnson'),
    ('101 Pine St', 'San Francisco', 'CA', 'USA', 94101, 'Emily', 'Brown'),
    ('202 Maple St', 'Dallas', 'TX', 'USA', 75201, 'David', 'Lee'),
    ('303 Cedar St', 'Miami', 'FL', 'USA', 33101, 'Sophia', 'Wilson'),
    ('404 Birch St', 'Boston', 'MA', 'USA', 02101, 'Matthew', 'Davis'),
    ('505 Redwood St', 'Seattle', 'WA', 'USA', 98101, 'Olivia', 'Anderson'),
    ('606 Spruce St', 'Denver', 'CO', 'USA', 80201, 'Daniel', 'Taylor'),
    ('707 Sequoia St', 'Austin', 'TX', 'USA', 78701, 'Ava', 'Martin');

select * from address;

INSERT INTO company (CompanyName, CompanyLocation, CompanyType, Employees)
VALUES
    ('Ford', 'New York', 'Type1', 100),
    ('UTC', 'Los Angeles', 'Type2', 200),
    ('Raytheon', 'Chicago', 'Type1', 150),
    ('Google', 'San Francisco', 'Type3', 300),
    ('NASA', 'Dallas', 'Type2', 250),
    ('AUDI', 'Miami', 'Type1', 120),
    ('Spotify', 'Boston', 'Type2', 180),
    ('IBM', 'Seattle', 'Type1', 220),
    ('PepsiCO', 'Denver', 'Type3', 280),
    ('Paper Company', 'Austin', 'Type2', 230);

select * from company;

INSERT INTO interactions (Date, Itype, AssociatedContact, Company)
VALUES
    ('2023-01-14', 'Meeting', 'John', 'Paper Company'),
    ('2023-02-10', 'Phone Call', 'Sarah', 'Raytheon'),
    ('2023-02-11', 'Lunch', 'Larry', 'Hardtools'),
    ('2023-04-20', 'Email', 'Bingham', 'UTC'),
    ('2023-04-20', 'Meeting', 'Thomas', 'Google'),
    ('2023-05-06', 'Dinner', 'Derrick', 'Dell'),
    ('2023-05-30', 'Conference Call', 'Lucy', 'IBM'),
    ('2023-06-01', 'Scrum', 'Erin', 'Lenovo'),
    ('2023-08-27', 'Lunch', 'Ryan', 'Ford'),
    ('2023-10-31', 'Meeting', 'John', 'Paper Company');

select * from interactions;

INSERT INTO notes (Ntype, NOTE, Date, InteractionID)
VALUES
    ('Meeting', 'Met with the client to discuss the project.', '2023-01-14', 1),
    ('Phone Call', 'Had a productive phone call with the supplier.', '2023-02-10', 2),
    ('Lunch', 'Lunch meeting with the team to discuss the upcoming launch.', '2023-02-11', 3),
    ('Email', 'Sent follow-up email to the customer regarding their request.', '2023-04-20', 4),
    ('Meeting', 'Team meeting to review project progress.', '2023-04-20', 5),
    ('Dinner', 'Dinner meeting with the investors.', '2023-05-06', 6),
    ('Conference Call', 'Participated in a conference call with partners.', '2023-05-30', 7),
    ('Scrum', 'Daily Scrum meeting with the development team.', '2023-06-01', 8),
    ('Lunch', 'Lunch with a client to discuss future collaborations.', '2023-08-27', 9),
    ('Meeting', 'Meeting with the client to finalize the contract.', '2023-10-31', 10);

select * from notes;

INSERT INTO contacts (Fname, Lname, CellPhone, WorkPhone, FaxNum, Email, Gender, Birthday)
VALUES
    ('John', 'Doe', 1234567890, 9876543210, NULL, 'john.doe@example.com', 'M', '1990-05-15'),
    ('Jane', 'Smith', 2345678901, 8765432109, NULL, 'jane.smith@example.com', 'F', '1985-12-10'),
    ('Michael', 'Johnson', 3456789012, 7654321098, NULL, 'michael.johnson@example.com', 'M', '1980-07-20'),
    ('Emily', 'Brown', 4567890123, 6543210987, NULL, 'emily.brown@example.com', 'F', '1995-03-25'),
    ('David', 'Lee', 5678901234, 5432109876, NULL, 'david.lee@example.com', 'M', '1988-09-18'),
    ('Sophia', 'Wilson', 6789012345, 4321098765, NULL, 'sophia.wilson@example.com', 'F', '1992-11-30'),
    ('Matthew', 'Davis', 7890123456, 3210987654, NULL, 'matthew.davis@example.com', 'M', '1987-06-12'),
    ('Olivia', 'Anderson', 8901234567, 2109876543, NULL, 'olivia.anderson@example.com', 'F', '1984-04-05'),
    ('Daniel', 'Taylor', 9012345678, 1098765432, NULL, 'daniel.taylor@example.com', 'M', '1993-08-15'),
    ('Ava', 'Martin', 1234567890, 9876543210, NULL, 'ava.martin@example.com', 'F', '1986-01-28');

select * from contacts;

INSERT INTO department (Dname, Dlocation, Demployees, Dmanagername, CompanyID)
VALUES
  ('Marketing', 'New York', '50', 'John Smith', 1),
  ('Finance', 'Los Angeles', '45', 'Emily Johnson', 2),
  ('Human Resources', 'Chicago', '30', 'Michael Davis', 3),
  ('Engineering', 'San Francisco', '70', 'Sarah Lee', 1),
  ('Sales', 'Boston', '40', 'David Wilson', 2),
  ('IT', 'Seattle', '60', 'Linda Brown', 3),
  ('Operations', 'Dallas', '35', 'Robert Taylor', 1),
  ('Customer Support', 'Miami', '25', 'Mary Miller', 2),
  ('Research and Development', 'Denver', '55', 'Richard Martinez', 3),
  ('Legal', 'Houston', '20', 'Susan White', 1);

select * from department;

INSERT INTO job (Title1, Title2, Title3, JobLocation, DepartmentID)
VALUES
  ('Software Engineer', 'Web Developer', 'Data Analyst', 'San Francisco', 4),
  ('Marketing Manager', 'Social Media Specialist', 'Marketing Coordinator', 'New York', 1),
  ('Financial Analyst', 'Accountant', 'Investment Analyst', 'Los Angeles', 2),
  ('HR Manager', 'Recruiter', 'HR Assistant', 'Chicago', 3),
  ('Sales Representative', 'Sales Manager', 'Account Executive', 'Boston', 5),
  ('IT Support Specialist', 'Network Administrator', 'Database Administrator', 'Seattle', 6),
  ('Operations Manager', 'Logistics Coordinator', 'Supply Chain Analyst', 'Dallas', 7),
  ('Customer Support Representative', 'Customer Support Manager', 'Technical Support Specialist', 'Miami', 8),
  ('Software Developer', 'Research Scientist', 'Product Manager', 'Denver', 9),
  ('Legal Counsel', 'Paralegal', 'Legal Assistant', 'Houston', 10);
    
select * from job;

insert into admin (username, password, office, email)
values
	('joezzeff', 'pwx', 'datamanage', 'jozef.maselek1@marist.edu'),
	('shannee', 'pwx', 'datamanage', 'shane.seeley1@marist.edu');

select * from admin;

INSERT INTO AdminNote (AdminID, note, date, NType)
VALUES
	(1, 'Reviewed user account', '2023-01-15', 'Review'),
	(2, 'Updated user permissions', '2023-02-20', 'Update'),
	(2, 'Resolved customer complaint', '2023-03-10', 'Resolution'),
	(1, 'Scheduled a meeting', '2023-04-05', 'Meeting'),
	(2, 'Notified of system maintenance', '2023-05-02', 'Notification'),
	(2, 'Created new admin account', '2023-06-15', 'Creation'),
	(1, 'Password reset request', '2023-07-22', 'Request'),
	(1, 'User account deletion', '2023-08-14', 'Deletion'),
	(2, 'Assigned task to user', '2023-09-03', 'Assignment'),
	(2, 'Announced holiday closure', '2023-10-20', 'Announcement');
  
select * from adminnote;

SET FOREIGN_KEY_CHECKS=1;
