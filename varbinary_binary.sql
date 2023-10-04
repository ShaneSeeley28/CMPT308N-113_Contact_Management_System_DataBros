create database if not exists phase03;
use phase03;

CREATE TABLE documents (
 documents_id INT PRIMARY KEY,
 document_name VARCHAR(50),
 pdf_data VARBINARY(50),
 image_data BINARY(100),
 );
 
INSERT INTO documents (document_id, document_name, pdf_data, image_data)
VALUES
	(1, 'Document 1', 0x2464263842872, 0x4359649528736);
    
select * from documents;