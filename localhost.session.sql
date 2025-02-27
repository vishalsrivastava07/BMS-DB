CREATE TABLE Author (
    AuthorID SERIAL PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL
);

CREATE TABLE Category (
    CategoryID SERIAL PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL
);

CREATE TABLE Book (
    BookID SERIAL PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    AuthorID INT NOT NULL,
    CategoryID INT NOT NULL,
    ISBN VARCHAR(255) NOT NULL,
    PublishDate DATE NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
);

INSERT INTO Author (FirstName, LastName) VALUES 
('R', 'Narayan'),
('Chetan', 'Bhagat'),
('Ruskin', 'Bond'),
('Amish', 'Tripathi'),
('Arundhati', 'Roy');

SELECT * FROM Author;

INSERT INTO Category (CategoryName) VALUES
('Fiction'),
('Mystery'),
('Romance'),
('Thriller'),
('Mythology'),
('Biography'),
('Self-Help'),
('Historical Fiction');


SELECT * FROM Category;


INSERT INTO Book (Title, AuthorID, CategoryID, ISBN, PublishDate, Price) VALUES
('Malgudi Days', 1, 1, '978-8185986178', '1943-01-01', 12),
('Five Point Someone', 2, 3, '978-8129115300', '2004-05-01', 10),
('The Blue Umbrella', 3, 1, '978-8129124548', '1974-01-01', 8),
('The Immortals of Meluha', 4, 5, '978-9380658742', '2010-02-01', 14),
('The God of Small Things', 5, 1, '978-0679457312', '1997-04-01', 15),
('Half Girlfriend', 2, 3, '978-8129135728', '2014-10-01', 9),
('The Secret of the Nagas', 4, 5, '978-9380658797', '2011-08-12', 13),
('The White Tiger', 5, 1, '978-1416562603', '2008-01-01', 11),
('I Too Had a Love Story', 2, 3, '978-8188575703', '2008-11-01', 9),
('Train to Pakistan', 1, 8, '978-0143065883', '1956-01-01', 14),
('The Monk Who Sold His Ferrari', 3, 7, '978-8179921623', '1997-01-01', 16),
('Wings of Fire', 5, 6, '978-8173711466', '1999-01-01', 18),
('The 3 Mistakes of My Life', 2, 3, '978-8129113726', '2008-05-01', 10),
('Revolution 2020', 2, 3, '978-8129118806', '2011-10-07', 12),
('The Palace of Illusions', 4, 8, '978-1400096206', '2008-02-01', 15);


SELECT * FROM Book;
