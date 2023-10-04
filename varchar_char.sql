create database if not exists phase03;
use phase03;

CREATE TABLE customer (
 customer_id INT PRIMARY KEY,
 first_name VARCHAR(50),
 last_name VARCHAR(50),
 email VARCHAR(100),
 phone CHAR(10)
 );
 
 INSERT INTO customer (customer_id, first_name,last_name, email, phone)
 VALUES
	(1, 'John', 'Smith', 'Johnsmith@gmail.com', '8939976789');
    
select * from customer;