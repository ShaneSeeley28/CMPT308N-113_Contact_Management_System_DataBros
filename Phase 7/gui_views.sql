use contact_manager_DB;

show tables;

select * from contacts;
select * from contact_has_address;
select * from address;
select * from job;
select * from department;
select * from company;


create view display_contacts
as select
	c.Fname, c.Lname, c.CellPhone, c.WorkPhone, c.FaxNum, c.Email, c.Gender, c.Birthday, c.ContactID
from contacts c;

select * from display_contacts;

create view remove_contact
as select
	contactID,
	concat(Fname,Lname) as Name,
	Email
from 
	contacts;
    
create view search_contact
as select
	Fname, Lname, Email, Birthday
from contacts;

create view see_interactions
as select
	i.Date, i.Itype, i.AssociatedContact, i.Company
from interactions i;

create view add_notice
as select
	NoticeID, DateTime, Notice, Title, AdminID
from addnotice;

create view ad_registration
as select
	RegID, name, email, username, password
from registration;

create view ad_notes
as select
	AdminID, note, date, NType
from adminnote;
