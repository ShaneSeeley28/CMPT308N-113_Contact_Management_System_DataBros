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

INSERT INTO user (Username, Password, IsAdmin, Email, Fname, Lname)
VALUES
    ('garbanzo86', 'password1', 0, 'garbanzo86@example.com', 'John', 'Doe'),
    ('FRATELLY998', 'password2', 0, 'FRATELLY998@example.com', 'Jane', 'Smith'),
    ('ILOVEPORSCHE911', 'adminpass1', 1, 'ILOVEPORSCHE911@example.com', 'Admin', 'One'),
    ('starfields13', 'password3', 0, 'starfields13@example.com', 'Michael', 'Johnson'),
    ('barbara12', 'password4', 0, 'barbara12@example.com', 'Emily', 'Brown'),
    ('stealersFan04', 'password5', 0, 'stealersFan04@example.com', 'David', 'Lee'),
    ('yagga', 'password6', 0, 'yagga@example.com', 'Sophia', 'Wilson'),
    ('goku', 'password7', 0, 'goku@example.com', 'Matthew', 'Davis'),
    ('scrapbrainzone', 'password8', 0, 'scrapbrainzone@example.com', 'Olivia', 'Anderson'),
    ('benandjerry', 'adminpass2', 1, 'benandjerry@example.com', 'Admin', 'Two');

select * from user;

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

INSERT INTO c_group (GroupName, Gmembers, Gcompany, Gtype)
VALUES
    ('Group1', 'John, Jane', 'Ford', 'Type1'),
    ('ShipmentGroup', 'Michael, Emily', 'Raytheon', 'Type2'),
    ('COD Group', 'Emily, David, Sophia', 'Raytheon', 'Type1'),
    ('XBOX Group', 'Daniel, Sophia, Matthew', 'UTC', 'Type3'),
    ('Motor group', 'Olivia', 'IBM', 'Type2'),
    ('Need more', 'Ava, David', 'AUDI', 'Type1'),
    ('Grassroots', 'John, David, Matthew', 'Spotify', 'Type2'),
    ('Pink Panthers', 'Olivia, Ava', 'Astrophysics', 'Type1'),
    ('Group for fun', 'Daniel, John', 'NASA', 'Type3'),
    ('Group10', 'Michael, Ava', 'Bethesda', 'Type2');

select * from c_group;

INSERT INTO relationships (Fname, Lname, Rtype, Fname2, Lname2)
VALUES
    ('John', 'Doe', 'Friend', 'Jane', 'Smith'),
    ('Jane', 'Smith', 'Colleague', 'Michael', 'Johnson'),
    ('Michael', 'Johnson', 'Family', 'Emily', 'Brown'),
    ('Emily', 'Brown', 'Friend', 'David', 'Lee'),
    ('David', 'Lee', 'Family', 'Sophia', 'Wilson'),
    ('Sophia', 'Wilson', 'Friend', 'Matthew', 'Davis'),
    ('Matthew', 'Davis', 'Colleague', 'Olivia', 'Anderson'),
    ('Olivia', 'Anderson', 'Family', 'Daniel', 'Taylor'),
    ('Daniel', 'Taylor', 'Friend', 'Ava', 'Martin'),
    ('Ava', 'Martin', 'Colleague', 'John', 'Doe');

select * from relationships;

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

INSERT INTO department (Dname, Dlocation, Demployees, Dmanagername, CompanyID, ContactID)
VALUES
    ('Sales', 'New York', '50', 'John', 1, 1),
    ('Marketing', 'Los Angeles', '40', 'Jane', 2, 2),
    ('Engineering', 'San Francisco', '60', 'Michael', 3, 3),
    ('Finance', 'Chicago', '30', 'Emily', 4, 4),
    ('HR', 'Boston', '25', 'David', 5, 5),
    ('IT', 'Dallas', '45', 'Sophia', 6, 6),
    ('Operations', 'Miami', '35', 'Matthew', 7, 7),
    ('Customer Support', 'Seattle', '55', 'Olivia', 8, 8),
    ('R&D', 'Austin', '20', 'Daniel', 9, 9),
    ('Legal', 'Denver', '15', 'Ava', 10, 10);

select * from department;

INSERT INTO job (Title, JobLocation, CompanyID, ContactID)
VALUES
    ('Software Engineer', 'San Francisco', 1, 1),
    ('Marketing Manager', 'Los Angeles', 2, 2),
    ('Financial Analyst', 'Chicago', 3, 3),
    ('HR Specialist', 'Boston', 4, 4),
    ('IT Administrator', 'Dallas', 5, 5),
    ('Operations Manager', 'Miami', 6, 6),
    ('Customer Support Representative', 'Seattle', 7, 7),
    ('Research Scientist', 'Austin', 8, 8),
    ('Legal Counsel', 'Denver', 9, 9),
    ('Sales Associate', 'New York', 10, 10);
    
select * from job;

SET FOREIGN_KEY_CHECKS=1;
