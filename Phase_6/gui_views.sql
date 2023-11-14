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
	c.Fname, c.Lname, c.CellPhone, c.WorkPhone, c.FaxNum, c.Email, c.Gender, c.Birthday, c.ContactID,
    a.AddressID, a.StreetAddress, a.City , a.State, a.Country, a.ZipCode,
    j.*,
    d.Dname, d.Dlocation, d.Demployees, d.Dmanagername,
    co.*
from contacts c
	left join contact_has_address ca on c.ContactID = ca.ContactID
    left join address a on ca.AddressID = a.AddressID
    left join job j on c.jobID = j.jobID
    left join department d on j.departmentID = d.departmentID
    left join company co on d.companyID = co.companyID
    group by c.ContactID;

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
	*
from contacts;
    
create view see_interactions
as select
	i.*,
    n.noteID, n.ntype, n.note
from interactions i
	left join notes n on i.interactionID = n.interactionID; 

create view add_notice
as select
	*
from addnotice;

create view ad_registration
as select
	*
from registration;

create view ad_notes
as select
	*
from adminnote;
