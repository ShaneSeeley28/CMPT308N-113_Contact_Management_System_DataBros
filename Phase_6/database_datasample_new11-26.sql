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

UPDATE user
SET fname = 'John', lname = 'Doe'
WHERE userid = 1;

UPDATE user
SET fname = 'Jane', lname = 'Smith'
WHERE userid = 2;

UPDATE user
SET fname = 'Admin', lname = 'One'
WHERE userid = 3;

UPDATE user
SET fname = 'Michael', lname = 'Johnson'
WHERE userid = 4;

UPDATE user
SET fname = 'Emily', lname = 'Brown'
WHERE userid = 5;

UPDATE user
SET fname = 'Sophia', lname = 'Wilson'
WHERE userid = 6;

UPDATE user
SET fname = 'Matthew', lname = 'Davis'
WHERE userid = 7;

UPDATE user
SET fname = 'David', lname = 'Lee'
WHERE userid = 8;

UPDATE user
SET fname = 'Olivia', lname = 'Anderson'
WHERE userid = 9;

UPDATE user
SET fname = 'Jozef', lname = 'Maselek'
WHERE userid = 10;

ALTER TABLE user MODIFY COLUMN password varchar(64);

UPDATE user SET Password = SHA2('password1', 256) WHERE UserID = 1;
UPDATE user SET Password = SHA2('password2', 256) WHERE UserID = 2;
UPDATE user SET Password = SHA2('adminpass1', 256) WHERE UserID = 3;
UPDATE user SET Password = SHA2('password3', 256) WHERE UserID = 4;
UPDATE user SET Password = SHA2('password4', 256) WHERE UserID = 5;
UPDATE user SET Password = SHA2('password5', 256) WHERE UserID = 6;
UPDATE user SET Password = SHA2('password6', 256) WHERE UserID = 7;
UPDATE user SET Password = SHA2('password7', 256) WHERE UserID = 8;
UPDATE user SET Password = SHA2('password8', 256) WHERE UserID = 9;
UPDATE user SET Password = SHA2('adminpass2', 256) WHERE UserID = 10;

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

INSERT INTO job (jobID, jobLocation, jobinfo, hiredate, DepartmentID)
VALUES
  (1, 'San Francisco', 'Software Engineer', '2023-01-15', 4),
  (2, 'New York', 'Marketing Manager', '2023-02-20', 1),
  (3, 'Los Angeles', 'Financial Analyst', '2023-03-10', 2),
  (4, 'Chicago', 'HR Manager', '2023-04-05', 3),
  (5, 'Boston', 'Sales Representative', '2023-05-12', 5),
  (6, 'Seattle', 'IT Support Specialist', '2023-06-18', 6),
  (7, 'Dallas', 'Operations Manager', '2023-07-22', 7),
  (8, 'Miami', 'Customer Support Representative', '2023-08-30', 8),
  (9, 'Denver', 'Software Developer', '2023-09-14', 9),
  (10, 'Unknown', 'Legal Counsel', '2023-10-01', 10);
    
select * from job;

INSERT INTO title (jobID, title)
VALUES
  (4, 'Software Engineer'),
  (1, 'Marketing Manager'),
  (2, 'Financial Analyst'),
  (3, 'HR Manager'),
  (5, 'Sales Representative'),
  (6, 'IT Support Specialist'),
  (7, 'Operations Manager'),
  (8, 'Customer Support Representative'),
  (9, 'Software Developer'),
  (10, 'Legal Counsel');
  
select * from title;

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

INSERT INTO addnotice (NoticeID, DateTime, Notice, Title, AdminID)
VALUES
	(1, '2023-01-15 10:30:00', 'Important notice about upcoming changes', 'Upcoming Changes', 101),
	(2, '2023-02-05 14:45:00', 'Reminder: Team meeting tomorrow at 9 AM', 'Team Meeting Reminder', 102),
	(3, '2023-03-20 08:00:00', 'Policy update: Please review the new policies', 'Policy Update', 103),
	(4, '2023-04-10 16:00:00', 'Congratulations to Employee of the Month', 'Employee of the Month', 104),
	(5, '2023-05-18 12:30:00', 'System maintenance scheduled for this weekend', 'System Maintenance', 105),
	(6, '2023-06-22 11:15:00', 'Welcome to our new team members!', 'New Team Members', 106),
	(7, '2023-07-30 09:45:00', 'Reminder: Submit your expense reports by end of the month', 'Expense Reports Reminder', 107),
	(8, '2023-08-12 13:00:00', 'Holiday office closure on Monday', 'Office Closure', 108),
	(9, '2023-09-25 15:30:00', 'Training session for new software next week', 'Software Training', 109),
	(10, '2023-10-05 17:00:00', 'Farewell party for departing colleagues', 'Farewell Party', 110);
  
  select * from addnotice;

SET FOREIGN_KEY_CHECKS=1;
