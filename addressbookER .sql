CREATE DATABASE address_book_erdiagram;
use address_book_erdiagram;
select database();


CREATE TABLE contact_persons (
	person_id	 INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	name		 VARCHAR(255) NOT NULL,
    address		 VARCHAR(255) NOT NULL,
    gender		 CHAR(6)
);

INSERT INTO contact_persons (name, address, gender) VALUES
('Krati', 'Kanpur', 'Female'),
	('Nishu', 'Ghaziabad', 'Female'),
	('Shreya', 'Lucknow', 'Female'),
	('Akshat', 'Noida', 'Male'),
	('Virat', 'Varanasi', 'Male'),
	('Prags', 'Kanpur', 'Female');
select * from contact_persons;



CREATE TABLE relation (
	id	       INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	person_id      INTEGER,
    type	       VARCHAR(255) NOT NULL
);

INSERT INTO relation (person_id, type) VALUES
	(1, 'Family'),
	(2, 'Friend'),
	(2, 'Profession'),
	(3, 'Family'),
	(3, 'Friend'),
	(4, 'Friend'),
	(5, 'Family'),
	(6, 'Friend'),
	(7, 'Friend');
select * from relation;

CREATE TABLE phone_numbers (
	id		  INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	person_id	  INTEGER,
    phone_number	  VARCHAR(10)
);

INSERT INTO phone_numbers (person_id, phone_number) VALUES
	(1, '9865466877'),
	(1, '8866876877'),
	(2, '8776488887'),
	(2, '7654668776'),
	(3, '9886557787'),
	(4, '688977e558'),
	(5, '9885587656'),
	(6, '7754360887'),
	(7, '9864336154'),
	(7, '8764698889');
select * from phone_numbers;

select contact_persons.name, phone_numbers.phone_number from contact_persons join phone_numbers on phone_numbers.person_id = contact_persons.person_id;

SELECT * FROM contact_persons WHERE address = 'Kanpur';
SELECT address, Count(*) FROM contact_persons WHERE address = 'Kanpur';
SELECT * FROM contact_persons a WHERE address = 'Kanpur' ORDER BY a.name;
select type, COUNT(name) from contact_persons join relation on contact_persons.person_id = relation.person_id group by type;
