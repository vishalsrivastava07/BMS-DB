DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS author;
DROP TABLE IF EXISTS category;

CREATE TABLE author (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

CREATE TABLE category (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE book (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    title VARCHAR(255) NOT NULL,
    author_id UUID NOT NULL,
    category_id UUID NOT NULL,
    isbn VARCHAR(255) NOT NULL,
    publish_date DATE NOT NULL,
    price DECIMAL(10,5) NOT NULL,
    FOREIGN KEY (author_id) REFERENCES author(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES category(id) ON DELETE CASCADE
);

INSERT INTO author (first_name, last_name) VALUES 
('R', 'Narayan'),
('Chetan', 'Bhagat'),
('Ruskin', 'Bond'),
('Amish', 'Tripathi'),
('Arundhati', 'Roy');

SELECT * FROM author;

INSERT INTO category (category_name) VALUES
('Fiction'),
('Mystery'),
('Romance'),
('Thriller'),
('Mythology'),
('Biography'),
('Self-Help'),
('Historical Fiction');

SELECT * FROM category;

INSERT INTO book (title, author_id, category_id, isbn, publish_date, price) VALUES
('Malgudi Days', 
  (SELECT id FROM author WHERE first_name = 'R' AND last_name = 'Narayan'), 
  (SELECT id FROM category WHERE category_name = 'Fiction'),
  '978-8185986178', '1943-01-01', 12),
  
('Five Point Someone', 
  (SELECT id FROM author WHERE first_name = 'Chetan' AND last_name = 'Bhagat'), 
  (SELECT id FROM category WHERE category_name = 'Romance'),
  '978-8129115300', '2004-05-01', 10),
  
('The Blue Umbrella', 
  (SELECT id FROM author WHERE first_name = 'Ruskin' AND last_name = 'Bond'), 
  (SELECT id FROM category WHERE category_name = 'Fiction'),
  '978-8129124548', '1974-01-01', 8),
  
('The Immortals of Meluha', 
  (SELECT id FROM author WHERE first_name = 'Amish' AND last_name = 'Tripathi'), 
  (SELECT id FROM category WHERE category_name = 'Mythology'),
  '978-9380658742', '2010-02-01', 14),
  
('The God of Small Things', 
  (SELECT id FROM author WHERE first_name = 'Arundhati' AND last_name = 'Roy'), 
  (SELECT id FROM category WHERE category_name = 'Fiction'),
  '978-0679457312', '1997-04-01', 15),
  
('Half Girlfriend', 
  (SELECT id FROM author WHERE first_name = 'Chetan' AND last_name = 'Bhagat'), 
  (SELECT id FROM category WHERE category_name = 'Romance'),
  '978-8129135728', '2014-10-01', 9),
  
('The Secret of the Nagas', 
  (SELECT id FROM author WHERE first_name = 'Amish' AND last_name = 'Tripathi'), 
  (SELECT id FROM category WHERE category_name = 'Mythology'),
  '978-9380658797', '2011-08-12', 13),
  
('The White Tiger', 
  (SELECT id FROM author WHERE first_name = 'Arundhati' AND last_name = 'Roy'), 
  (SELECT id FROM category WHERE category_name = 'Fiction'),
  '978-1416562603', '2008-01-01', 11);

SELECT * FROM book;