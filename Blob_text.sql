create database if not exists phase03;
use phase03;

CREATE TABLE documents (
 documents_id INT PRIMARY KEY,
 document_name VARCHAR(50),
 pdf_content BLOB,
 description TEXT,
);
 
INSERT INTO documents (document_id, document_name, pdf_content, description)
VALUES
	(1, 'Document 1', LOAD_FILE('/path/to/pdf'), 'This is a desciption of the document');
    
select * from documents;