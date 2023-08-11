-- Drop tables if they exist
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Author;
DROP TABLE IF EXISTS Publisher;
DROP TABLE IF EXISTS Category;

-- Create tables
CREATE TABLE Publisher (
    PID INT PRIMARY KEY,
    PublisherName VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Category (
    CID INT PRIMARY KEY,
    CategoryName VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Author (
    AID INT PRIMARY KEY,
    AuthorName VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE Book (
    BID INT PRIMARY KEY NOT NULL,
    BName VARCHAR(255) NOT NULL,
    BPrice DECIMAL(10, 2),
    AuthorID INT,
    PublisherID INT,
    CategoryID INT,
    FOREIGN KEY (AuthorID) REFERENCES Author(AID),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CID)
);

-- Insert data into Category
INSERT INTO Category (CID, CategoryName) VALUES
(1, 'Fiction'),
(2, 'Non-Fiction'),
(3, 'Mystery');

-- Insert data into Author
INSERT INTO Author (AID, AuthorName) VALUES
(1, 'John Doe'),
(2, 'Jane Smith'),
(3, 'Robert Johnson');

-- Insert data into Publisher
INSERT INTO Publisher (PID, PublisherName) VALUES
(1, 'Publisher A'),
(2, 'Publisher B'),
(3, 'Publisher C');

-- Insert data into Book
INSERT INTO Book (BID, BName, BPrice, AuthorID, PublisherID, CategoryID) VALUES
(1, 'Book A', 19.99, 1, 1, 1),
(2, 'Book B', 24.99, 2, 2, 2),
(3, 'Book C', 14.95, 1, 3, 1),
(4, 'Book D', 29.99, 3, 1, 2),
(5, 'Book E', 9.99, 2, 3, 1),
(6, 'Book F', 12.50, 3, 2, 3);

-- Retrieve book details
SELECT BID, BName, BPrice, AuthorName, PublisherName, CategoryName
FROM Book
INNER JOIN Author ON Book.AuthorID = Author.AID
INNER JOIN Publisher ON Book.PublisherID = Publisher.PID
INNER JOIN Category ON Book.CategoryID = Category.CID;