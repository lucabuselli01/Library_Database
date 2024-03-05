Create Database [LB_LIBRARY]
GO
USE LB_LIBRARY
GO
-- Table: User
CREATE TABLE tblUser (
  UserID INT IDENTITY (1,1) PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  HomeAddress VARCHAR(100),
  ZipCode VARCHAR(10),
  Phone VARCHAR(15)
); 
-- Table: Books
CREATE TABLE tblBook (
  BookID INT IDENTITY (1,1) PRIMARY KEY,
  Title VARCHAR(100),
  PublicationDate DATE,
  ISBN VARCHAR(20),
  AvailableCopies INT
);

-- Table: Authors
CREATE TABLE tblAuthor (
  AuthorID INT IDENTITY (1,1) PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  DateOfBirth DATE,
  Nationality VARCHAR(50),
  Biography TEXT
);

-- Table: Categories
CREATE TABLE tblCategory (
  CategoryID INT IDENTITY (1,1) PRIMARY KEY,
  CategoryName VARCHAR(50)
);

-- Table: Borrowings
CREATE TABLE tblBorrowing (
  BorrowingID INT IDENTITY (1,1) PRIMARY KEY,
  UserID INT,
  BookID INT,
  BorrowedDate DATE,
  ReturnDate DATE,
  ReturnedDate DATE,
  FOREIGN KEY (UserID) REFERENCES tblUser(UserID),
  FOREIGN KEY (BookID) REFERENCES tblBook(BookID)
);

-- Table: Reservations
CREATE TABLE tblReservation (
  ReservationID INT IDENTITY (1,1) PRIMARY KEY,
  UserID INT,
  BookID INT,
  ReservationDate DATE,
  FOREIGN KEY (UserID) REFERENCES tblUser(UserID),
  FOREIGN KEY (BookID) REFERENCES tblBook(BookID)
);

-- Table: Fines
CREATE TABLE tblFines (
  FineID INT IDENTITY (1,1) PRIMARY KEY,
  UserID INT,
  BorrowingID INT,
  FineAmount DECIMAL(10, 2),
  PaidDate DATE,
  FOREIGN KEY (UserID) REFERENCES tblUser(UserID),
  FOREIGN KEY (BorrowingID) REFERENCES tblBorrowing(BorrowingID)
);

-- Table: AuthorsBooks (Many-to-Many relationship between Authors and Books)
CREATE TABLE tblAuthorBook (
  AuthorBookID INT IDENTITY (1,1) PRIMARY KEY,
  BookID INT,
  AuthorID INT,
  FOREIGN KEY (AuthorID) REFERENCES tblAuthor(AuthorID),
  FOREIGN KEY (BookID) REFERENCES tblBook(BookID)
);

-- Table: BooksCategories (Many-to-Many relationship between Books and Categories)
CREATE TABLE tblBooksCategory (
  BookCategoryID INT IDENTITY (1,1) PRIMARY KEY,
  BookID INT,
  CategoryID INT,
  FOREIGN KEY (BookID) REFERENCES tblBook(BookID),
  FOREIGN KEY (CategoryID) REFERENCES tblCategory(CategoryID)
);

-- Inserting 50 rows of information into the "Users" table
INSERT INTO tblUser (FirstName, LastName, HomeAddress, ZipCode, Phone) VALUES
  ('John', 'Doe', '123 Main St', '12345', '123-456-7890'),
  ('Jane', 'Smith', '456 Elm St', '23456', '987-654-3210'),
  ('Michael', 'Johnson', '789 Oak Ave', '34567', '555-555-5555'),
  ('Emily', 'Davis', '321 Pine St', '45678', '111-222-3333'),
  ('David', 'Wilson', '567 Maple Ave', '56789', '444-444-4444'),
  ('Stephanie', 'Garcia', '987 Willow Rd', '67891', '999-888-7777'),
  ('Robert', 'Brown', '654 Cedar St', '78901', '333-222-1111'),
  ('Jennifer', 'Taylor', '210 Birch Ave', '89012', '777-888-9999'),
  ('Matthew', 'Harris', '876 Pine St', '90123', '222-333-4444'),
  ('Amanda', 'Lee', '543 Oak Ave', '01234', '666-777-8888'),
  ('Michelle', 'Anderson', '987 Elm St', '34567', '555-555-5555'),
  ('Daniel', 'Lee', '321 Oak Ave', '45678', '111-222-3333'),
  ('Sophia', 'Gonzalez', '567 Pine St', '56789', '444-444-4444'),
  ('Christopher', 'Wang', '765 Maple Ave', '67890', '666-777-8888'),
  ('Olivia', 'Lopez', '543 Cedar St', '78901', '333-222-1111'),
  ('Ethan', 'Hall', '210 Willow Rd', '89012', '777-888-9999'),
  ('Isabella', 'Clark', '876 Birch Ave', '90123', '222-333-4444'),
  ('James', 'Ramirez', '543 Elm St', '01234', '666-777-8888'),
  ('Grace', 'Nguyen', '210 Oak Ave', '12345', '123-456-7890'),
  ('Benjamin', 'Gomez', '987 Cedar St', '23456', '987-654-3210'),
  ('Samantha', 'Baker', '654 Pine St', '56789', '444-444-4444'),
  ('Alexander', 'Garcia', '789 Maple Ave', '67890', '666-777-8888'),
  ('Natalie', 'Sanchez', '432 Cedar St', '78901', '333-222-1111'),
  ('Henry', 'Rivera', '210 Willow Rd', '89012', '777-888-9999'),
  ('Victoria', 'Wright', '876 Birch Ave', '90123', '222-333-4444'),
  ('Andrew', 'Turner', '543 Elm St', '01234', '666-777-8888'),
  ('Gabriella', 'Hernandez', '210 Oak Ave', '12345', '123-456-7890'),
  ('William', 'Perez', '987 Cedar St', '23456', '987-654-3210'),
  ('Chloe', 'Mitchell', '654 Pine St', '34567', '555-555-5555'),
  ('Samuel', 'Robinson', '789 Maple Ave', '45678', '111-222-3333'),
  ('Aiden', 'Rodriguez', '432 Cedar St', '56789', '444-444-4444'),
  ('Mia', 'Lopez', '210 Willow Rd', '67890', '666-777-8888'),
  ('Liam', 'Hall', '876 Birch Ave', '78901', '333-222-1111'),
  ('Sophie', 'Scott', '543 Elm St', '89012', '777-888-9999'),
  ('Jackson', 'Bennett', '210 Oak Ave', '90123', '222-333-4444'),
  ('Avery', 'Price', '987 Cedar St', '01234', '666-777-8888'),
  ('Scarlett', 'Morales', '654 Pine St', '12345', '123-456-7890'),
  ('Logan', 'Coleman', '789 Maple Ave', '23456', '987-654-3210'),
  ('Harper', 'Foster', '432 Cedar St', '34567', '555-555-5555'),
  ('Sebastian', 'Hayes', '210 Willow Rd', '45678', '111-222-3333'),
  ('Emma', 'Ramirez', '543 Elm St', '56789', '444-444-4444'),
  ('Jacob', 'Flores', '210 Oak Ave', '67890', '666-777-8888'),
  ('Abigail', 'Washington', '987 Cedar St', '78901', '333-222-1111'),
  ('Elijah', 'Reed', '654 Pine St', '89012', '777-888-9999'),
  ('Sofia', 'Cruz', '789 Maple Ave', '90123', '222-333-4444'),
  ('Carter', 'Bell', '432 Cedar St', '01234', '666-777-8888'),
  ('Madison', 'Howard', '210 Willow Rd', '12345', '123-456-7890'),
  ('Jayden', 'Ward', '876 Birch Ave', '23456', '987-654-3210'),
  ('Luna', 'Sullivan', '543 Elm St', '34567', '555-555-5555'),
  ('Grayson', 'Parker', '789 Maple Ave', '45678', '111-222-3333');

-- Inserting data into the "Books" table
INSERT INTO tblBook (Title, PublicationDate, ISBN, AvailableCopies) VALUES
  ('To Kill a Mockingbird', '1960-07-11', '9780061120084', 5),
  ('1984', '1949-06-08', '9780451524935', 3),
  ('The Great Gatsby', '1925-04-10', '9780743273565', 7),
  ('Pride and Prejudice', '1813-01-28', '9780486284736', 2),
  ('The Catcher in the Rye', '1951-07-16', '9780316769174', 4),
  ('To the Lighthouse', '1927-05-05', '9780156907392', 6),
  ('Moby-Dick', '1851-11-14', '9780142437247', 1),
  ('Brave New World', '1932-06-18', '9780060850524', 8),
  ('The Lord of the Rings', '1954-07-29', '9780618640157', 3),
  ('Jane Eyre', '1847-10-16', '9780142437209', 5),
  ('The Hobbit', '1937-09-21', '9780618260300', 6),
  ('The Chronicles of Narnia', '1950-10-16', '9780064404990', 4),
  ('To All the Boys Ive Loved Before', '2014-04-15', '9781442426719', 8),
  ('Harry Potter and the Sorcerers Stone', '1997-06-26', '9780590353427', 3),
  ('The Hunger Games', '2008-09-14', '9780439023481', 7),
  ('Dune', '1965-06-01', '9780441013593', 2),
  ('The Alchemist', '1988-06-01', '9780061122415', 5),
  ('The Da Vinci Code', '2003-03-18', '9780307474278', 1),
  ('The Shining', '1977-01-28', '9780307743657', 4),
  ('The Kite Runner', '2003-05-29', '9781594631931', 5),
  ('The Handmaids Tale', '1985-09-01', '9780385490818', 3),
  ('Sapiens: A Brief History of Humankind', '2011-02-10', '9780062316097', 7),
  ('The Girl on the Train', '2015-01-13', '9781594634024', 2),
  ('The Fault in Our Stars', '2012-01-10', '9780525478812', 4),
  ('Gone Girl', '2012-06-05', '9780307588364', 1),
  ('The Book Thief', '2005-09-01', '9780375831003', 8),
  ('The Sun Also Rises', '1926-10-22', '9780743297332', 3),
  ('The Maze Runner', '2009-10-06', '9780385737951', 5),
  ('The Adventures of Tom Sawyer', '1876-12-10', '9780141321100', 6),
  ('The Secret Life of Bees', '2001-11-08', '9780142001745', 4),
  ('The Color Purple', '1982-03-01', '9780156031820', 7),
  ('The Bell Jar', '1963-01-14', '9780061148514', 5),
  ('The Picture of Dorian Gray', '1890-07-01', '9780141439570', 3),
  ('The Lovely Bones', '2002-06-03', '9780316166683', 4),
  ('The Help', '2009-02-10', '9780425232200', 6),
  ('The Giver', '1993-04-26', '9780544336261', 5),
  ('The Road', '2006-09-26', '9780307387899', 3),
  ('The Outsiders', '1967-04-24', '9780140385724', 7),
  ('The Diary of a Young Girl', '1947-06-25', '9780553296983', 1),
  ('Atlas Shrugged', '1957-10-10', '9780451191144', 5),
  ('The Fountainhead', '1943-05-07', '9780451191151', 3),
  ('Anthem', '1938-01-01', '9780141186715', 7),
  ('We the Living', '1936-04-07', '9780451233592', 2),
  ('The Virtue of Selfishness', '1964-12-01', '9780451163936', 4),
  ('Capitalism: The Unknown Ideal', '1966-12-01', '9780451147950', 6),
  ('Dinosaurs Before Dark', '1992-07-28', '9780679824114', 5),
  ('The Knight at Dawn', '1993-05-11', '9780679824121', 3),
  ('Mummies in the Morning', '1993-09-21', '9780679824244', 7),
  ('Pirates Past Noon', '1994-05-24', '9780679863724', 2),
  ('Out from Boneville', '1995-01-01', '9780439706407', 5),
  ('The Great Cow Race', '1996-01-01', '9780439706414', 3),
  ('Eyes of the Storm', '1996-01-01', '9780439706421', 7),
  ('The Dragonslayer', '1997-01-01', '9780439706438', 2),
  ('Rock Jaw: Master of the Eastern Border', '2005-03-01', '9780439706445', 4),
  ('Old Mans Cave', '2007-01-01', '9780439706452', 6),
  ('Ghost Circles', '2008-01-01', '9780439706469', 3),
  ('Treasure Hunters', '2009-01-01', '9780439706476', 5),
  ('Crown of Horns', '2009-01-01', '9780439706483', 9),
  ('Harry Potter and the Goblet of Fire', '2000-07-08', '9780439139595', 5),
  ('Harry Potter and the Order of the Phoenix', '2003-06-21', '9780439358071', 3),
  ('Harry Potter and the Half-Blood Prince', '2005-07-16', '9780439785969', 7),
  ('Harry Potter and the Deathly Hallows', '2007-07-21', '9780545010221', 2),
  ('Becoming', '2018-11-13', '9781524763138', 3),
  ('Educated', '2018-02-20', '9780399590504', 7),
  ('The Immortal Life of Henrietta Lacks', '2010-02-02', '9781400052172', 2),
  ('Thinking, Fast and Slow', '2011-10-25', '9780374533557', 4),
  ('Sapiens: A Graphic History', '2020-10-20', '9780063051331', 6),
  ('The Boys in the Boat', '2013-06-04', '9780143125471', 3),
  ('The Glass Castle', '2005-03-08', '9780743247542', 5),
  ('Hidden Figures', '2016-09-06', '9780062363602', 7),
  ('Quiet: The Power of Introverts in a World That Cant Stop Talking', '2012-01-24', '9780307352156', 4),
  ('Born a Crime: Stories from a South African Childhood', '2016-11-15', '9780399588174', 5),
  ('The Sixth Extinction: An Unnatural History', '2014-02-11', '9781250062185', 2),
  ('Bad Blood: Secrets and Lies in a Silicon Valley Startup', '2018-05-21', '9781524731656', 3),
  ('Just Mercy: A Story of Justice and Redemption', '2014-10-21', '9780812984965', 7),
  ('The Warmth of Other Suns: The Epic Story of Americas Great Migration', '2010-09-07', '9780679763888', 6),
  ('The Code Book: The Science of Secrecy from Ancient Egypt to Quantum Cryptography', '1999-08-31', '9780385495325', 4),
  ('Mans Search for Meaning', '1946-01-01', '9780807014295', 6),
  ('The Emperor of All Maladies: A Biography of Cancer', '2010-11-16', '9781439170915', 3),
  ('Guns, Germs, and Steel: The Fates of Human Societies', '1997-03-01', '9780393317558', 5),
  ('The Gene: An Intimate History', '2016-05-17', '9781476733500', 2),
  ('Unbroken: A World War II Story of Survival, Resilience, and Redemption', '2010-11-16', '9780812974492', 4);

-- Inserting data into the table
INSERT INTO tblAuthor (FirstName, LastName, DateOfBirth, Nationality, Biography)
VALUES
  ('Harper', 'Lee', '1926-04-28', 'American', 'Harper Lee was an American novelist widely known for her novel "To Kill a Mockingbird."'),
  ('George', 'Orwell', '1903-06-25', 'British', 'George Orwell, whose real name was Eric Arthur Blair, was an English writer and journalist known for his works "1984" and "Animal Farm."'),
  ('F. Scott', 'Fitzgerald', '1896-09-24', 'American', 'F. Scott Fitzgerald was an American novelist and short-story writer famous for his novel "The Great Gatsby."'),
  ('Jane', 'Austen', '1775-12-16', 'British', 'Jane Austen was an English novelist known for her works like "Pride and Prejudice" and "Sense and Sensibility."'),
  ('J.D.', 'Salinger', '1919-01-01', 'American', 'J.D. Salinger was an American writer known for his influential novel "The Catcher in the Rye."'),
  ('Virginia', 'Woolf', '1882-01-25', 'British', 'Virginia Woolf was an English writer and one of the foremost modernists of the 20th century.'),
  ('Herman', 'Melville', '1819-08-01', 'American', 'Herman Melville was an American novelist best known for his masterpiece "Moby-Dick."'),
  ('Aldous', 'Huxley', '1894-07-26', 'British', 'Aldous Huxley was an English writer and philosopher, famous for his dystopian novel "Brave New World."'),
  ('J.R.R.', 'Tolkien', '1892-01-03', 'British', 'J.R.R. Tolkien was an English writer, poet, and philologist. He is best known for his high fantasy works, including "The Lord of the Rings."'),
  ('Charlotte', 'Brontë', '1816-04-21', 'British', 'Charlotte Brontë was an English novelist and poet, notable for her novel "Jane Eyre."'),
  ('C.S.', 'Lewis', '1898-11-29', 'British', 'C.S. Lewis was a British writer and theologian, known for his fantasy series "The Chronicles of Narnia."'),
  ('Jenny', 'Han', NULL, NULL, 'Jenny Han is an American author known for her young adult novels, including the "To All the Boys Ive Loved Before" series.'),
  ('J.K.', 'Rowling', '1965-07-31', 'British', 'J.K. Rowling is a British author best known for creating the "Harry Potter" series, one of the most successful book franchises in history.'),
  ('Suzanne', 'Collins', '1962-08-10', 'American', 'Suzanne Collins is an American author known for her dystopian trilogy "The Hunger Games."'),
  ('Frank', 'Herbert', '1920-10-08', 'American', 'Frank Herbert was an American science fiction writer famous for his novel "Dune" and its sequels.'),
  ('Paulo', 'Coelho', '1947-08-24', 'Brazilian', 'Paulo Coelho is a Brazilian author known for his best-selling novel "The Alchemist."'),
  ('Dan', 'Brown', '1964-06-22', 'American', 'Dan Brown is an American author known for his thriller novels, including "The Da Vinci Code."'),
  ('Stephen', 'King', '1947-09-21', 'American', 'Stephen King is an American author known for his horror, supernatural fiction, suspense, and fantasy novels, such as "It" and "The Shining."'),
  ('Khaled', 'Hosseini', '1965-03-04', 'Afghan-American', 'Khaled Hosseini is an Afghan-American author known for his novels "The Kite Runner" and "A Thousand Splendid Suns."'),
  ('Margaret', 'Atwood', '1939-11-18', 'Canadian', 'Margaret Atwood is a Canadian author known for her novels, including "The Handmaid''s Tale" and "Alias Grace."'),
  ('Yuval Noah', 'Harari', '1976-02-24', 'Israeli', 'Yuval Noah Harari is an Israeli historian and author of popular science books, including "Sapiens: A Brief History of Humankind."'),
  ('Paula', 'Hawkins', NULL, NULL, 'Paula Hawkins is a British author known for her psychological thriller novel "The Girl on the Train."'),
  ('John', 'Green', '1977-08-24', 'American', 'John Green is an American author known for his young adult novels, including "The Fault in Our Stars."'),
  ('Gillian', 'Flynn', '1971-02-24', 'American', 'Gillian Flynn is an American author known for her psychological thriller novel "Gone Girl."'),
  ('Markus', 'Zusak', NULL, NULL, 'Markus Zusak is an Australian author known for his novel "The Book Thief."'),
  ('Ernest', 'Hemingway', '1899-07-21', 'American', 'Ernest Hemingway was an American novelist and short-story writer, known for his works such as "The Old Man and the Sea" and "A Farewell to Arms."'),
  ('James', 'Dashner', NULL, NULL, 'James Dashner is an American author known for his young adult dystopian series "The Maze Runner."'),
  ('Mark', 'Twain', '1835-11-30', 'American', 'Mark Twain, born Samuel Clemens, was an American writer and humorist known for his novels "The Adventures of Tom Sawyer" and "Adventures of Huckleberry Finn."'),
  ('Sue Monk', 'Kidd', NULL, NULL, 'Sue Monk Kidd is an American author known for her novel "The Secret Life of Bees."'),
  ('Alice', 'Walker', '1944-02-09', 'American', 'Alice Walker is an American novelist, poet, and activist, best known for her novel "The Color Purple."'),
  ('Sylvia', 'Plath', '1932-10-27', 'American', 'Sylvia Plath was an American poet, novelist, and short-story writer known for her work "The Bell Jar."'),
  ('Oscar', 'Wilde', '1854-10-16', 'Irish', 'Oscar Wilde was an Irish poet, playwright, and novelist known for his wit and plays such as "The Importance of Being Earnest."'),
  ('Alice', 'Sebold', '1963-09-06', 'American', 'Alice Sebold is an American author known for her novel "The Lovely Bones."'),
  ('Kathryn', 'Stockett', NULL, NULL, 'Kathryn Stockett is an American author known for her novel "The Help."'),
  ('Lois', 'Lowry', '1937-03-20', 'American', 'Lois Lowry is an American writer known for her children''s novels, including "The Giver."'),
  ('Cormac', 'McCarthy', '1933-07-20', 'American', 'Cormac McCarthy is an American novelist known for his works such as "Blood Meridian" and "No Country for Old Men."'),
  ('S.E.', 'Hinton', '1948-07-22', 'American', 'S.E. Hinton is an American author known for her young adult novels, including "The Outsiders."'),
  ('Anne', 'Frank', '1929-06-12', 'German', 'Anne Frank was a German-born Jewish diarist known for her diary "The Diary of a Young Girl," documenting her experiences during the Holocaust.'),
  ('Ayn', 'Rand', '1905-02-02', 'Russian-American', 'Ayn Rand was a Russian-American writer and philosopher known for her novels "The Fountainhead" and "Atlas Shrugged."'),
  ('Mary Pope', 'Osborne', NULL, NULL, 'Mary Pope Osborne is an American author known for her children''s book series "Magic Tree House."'),
  ('Jeff', 'Smith', NULL, NULL, 'Jeff Smith is an American cartoonist and writer known for his comic book series "Bone."'),
  ('Michelle', 'Obama', '1964-01-17', 'American', 'Michelle Obama is an American author and former First Lady of the United States. She wrote the memoir "Becoming."'),
  ('Tara', 'Westover', '1986-09-27', 'American', 'Tara Westover is an American memoirist known for her memoir "Educated," which recounts her journey from growing up in a strict rural family to earning a PhD from Cambridge University.'),
  ('Rebecca', 'Skloot', NULL, NULL, 'Rebecca Skloot is an American science writer known for her book "The Immortal Life of Henrietta Lacks," which explores the story behind the HeLa cell line.'),
  ('Daniel', 'Kahneman', '1934-03-05', 'Israeli', 'Daniel Kahneman is an Israeli-American psychologist and Nobel laureate known for his work on behavioral economics and decision-making.'),
  ('Daniel James', 'Brown', NULL, NULL, 'Daniel James Brown is an American author known for his non-fiction book "The Boys in the Boat," which tells the story of the University of Washington rowing team.'),
  ('Jeannette', 'Walls', '1960-04-21', 'American', 'Jeannette Walls is an American author and journalist known for her memoir "The Glass Castle."'),
  ('Margot Lee', 'Shetterly', NULL, NULL, 'Margot Lee Shetterly is an American writer known for her book "Hidden Figures," which tells the story of African-American female mathematicians who worked at NASA during the Space Race.'),
  ('Susan', 'Cain', '1968-03-05', 'American', 'Susan Cain is an American author and speaker known for her book "Quiet: The Power of Introverts in a World That Can''t Stop Talking."'),
  ('Trevor', 'Noah', '1984-02-20', 'South African', 'Trevor Noah is a South African comedian, television host, and author known for his memoir "Born a Crime."'),
  ('Elizabeth', 'Kolbert', '1961-06-01', 'American', 'Elizabeth Kolbert is an American journalist and author known for her book "The Sixth Extinction: An Unnatural History."'),
  ('John', 'Carreyrou', NULL, NULL, NULL),
  ('Bryan', 'Stevenson', '1959-11-14', 'American', 'Bryan Stevenson is an American lawyer, social justice activist, and author known for his book "Just Mercy."'),
  ('Isabel', 'Wilkerson', '1961-05-05', 'American', 'Isabel Wilkerson is an American journalist and author known for her book "The Warmth of Other Suns," which explores the Great Migration of African Americans.'),
  ('Simon', 'Singh', '1964-09-19', 'British', 'Simon Singh is a British author and science journalist known for his books on mathematics and science, including "Fermat''s Enigma" and "The Code Book."'),
  ('Viktor E.', 'Frankl', '1905-03-26', 'Austrian', 'Viktor E. Frankl was an Austrian psychiatrist and Holocaust survivor known for his book "Man''s Search for Meaning."'),
  ('Siddhartha', 'Mukherjee', '1970-07-21', 'Indian-American', 'Siddhartha Mukherjee is an Indian-American physician, oncologist, and author known for his book "The Emperor of All Maladies: A Biography of Cancer."'),
  ('Jared', 'Diamond', '1937-09-10', 'American', 'Jared Diamond is an American scientist and author known for his books on geography, history, and anthropology, including "Guns, Germs, and Steel."'),
  ('Laura', 'Hillenbrand', '1967-05-15', 'American', 'Laura Hillenbrand is an American author known for her books "Seabiscuit: An American Legend" and "Unbroken: A World War II Story of Survival, Resilience, and Redemption."');

INSERT INTO tblCategory (CategoryName) VALUES
  ('Classic Fiction'),
  ('Young Adult Fiction'),
  ('Mystery'),
  ('Romance'),
  ('Adventure'),
  ('Modernist Fiction'),
  ('Dystopian'),
  ('Science Fiction'),
  ('History'),
  ('Fantasy'),
  ('Contemporary Fiction'),
  ('Children''s Literature'),
  ('Comic Books'),
  ('Nonfiction'),
  ('Biography'),
  ('Self-Help'),
  ('Thriller'),
  ('Poetry'),
  ('Business'),
  ('Travel');

INSERT INTO tblBorrowing (UserID, BookID, BorrowedDate, ReturnDate, ReturnedDate) VALUES
  (1, 1, '2023-04-15', '2023-04-30', '2023-04-28'),
  (2, 5, '2023-04-18', '2023-05-03', NULL),
  (3, 10, '2023-04-22', '2023-05-07', NULL),
  (4, 15, '2023-04-25', '2023-05-10', NULL),
  (5, 20, '2023-04-29', '2023-05-14', NULL),
  (6, 25, '2023-05-01', '2023-05-16', NULL),
  (7, 30, '2023-05-04', '2023-05-19', NULL),
  (8, 35, '2023-05-07', '2023-05-22', NULL),
  (9, 40, '2023-05-10', '2023-05-25', NULL),
  (10, 45, '2023-05-13', '2023-05-28', NULL),
  (11, 50, '2023-05-16', '2023-05-31', NULL),
  (12, 55, '2023-05-19', '2023-06-03', NULL),
  (13, 60, '2023-05-22', '2023-06-07', NULL),
  (14, 65, '2023-05-25', '2023-06-10', NULL),
  (15, 70, '2023-05-28', '2023-06-13', NULL),
  (16, 75, '2023-05-31', '2023-06-16', NULL),
  (17, 80, '2023-06-03', '2023-06-18', NULL),
  (18, 76, '2023-06-06', '2023-06-21', NULL),
  (19, 77, '2023-06-09', '2023-06-24', NULL),
  (20, 6, '2023-06-12', '2023-06-27', NULL),
  (21, 7, '2023-06-15', '2023-06-30', NULL),
  (22, 8, '2023-06-18', '2023-07-03', NULL),
  (23, 11, '2023-06-21', '2023-07-06', NULL),
  (24, 17, '2023-06-24', '2023-07-09', NULL),
  (25, 23, '2023-06-27', '2023-07-12', NULL),
  (27, 24, '2023-07-03', '2023-07-18', NULL),
  (28, 26, '2023-07-06', '2023-07-21', NULL),
  (29, 46, '2023-07-09', '2023-07-24', NULL),
  (30, 47, '2023-07-12', '2023-07-27', NULL),
  (31, 48, '2023-07-15', '2023-07-30', NULL),
  (32, 49, '2023-07-18', '2023-08-02', NULL),
  (33, 32, '2023-07-21', '2023-08-06', NULL),
  (34, 33, '2023-07-24', '2023-08-09', NULL),
  (35, 16, '2023-07-27', '2023-08-12', NULL),
  (36, 14, '2023-07-30', '2023-08-15', NULL),
  (37, 13, '2023-08-02', '2023-08-17', NULL),
  (38, 22, '2023-08-05', '2023-08-20', NULL),
  (39, 21, '2023-08-08', '2023-08-23', NULL),
  (40, 62, '2023-08-11', '2023-08-26', NULL),
  (41, 63, '2023-08-14', '2023-08-29', NULL),
  (42, 64, '2023-08-17', '2023-09-01', NULL),
  (43, 66, '2023-08-20', '2023-09-04', NULL),
  (44, 67, '2023-08-23', '2023-09-07', NULL),
  (45, 68, '2023-08-26', '2023-09-10', NULL),
  (46, 69, '2023-08-29', '2023-09-13', NULL);

INSERT INTO tblReservation (UserID, BookID, ReservationDate) VALUES
  (1, 2, '2023-05-10'),
  (3, 4, '2023-05-11'),
  (2, 6, '2023-05-12'),
  (4, 8, '2023-05-13'),
  (5, 10, '2023-05-14'),
  (6, 12, '2023-05-15'),
  (7, 14, '2023-05-16'),
  (8, 16, '2023-05-17'),
  (9, 18, '2023-05-18'),
  (10, 20, '2023-05-19'),
  (1, 22, '2023-05-20'),
  (2, 24, '2023-05-21'),
  (3, 26, '2023-05-22'),
  (4, 28, '2023-05-23'),
  (5, 30, '2023-05-24'),
  (6, 32, '2023-05-25'),
  (7, 34, '2023-05-26'),
  (8, 36, '2023-05-27'),
  (9, 38, '2023-05-28'),
  (10, 40, '2023-05-29'),
  (1, 42, '2023-05-30'),
  (2, 44, '2023-05-31'),
  (3, 46, '2023-06-01'),
  (4, 48, '2023-06-02'),
  (5, 50, '2023-06-03'),
  (6, 52, '2023-06-04'),
  (7, 54, '2023-06-05'),
  (8, 56, '2023-06-06'),
  (9, 58, '2023-06-07'),
  (10, 60, '2023-06-08');

INSERT INTO tblFines (UserID, BorrowingID, FineAmount, PaidDate) VALUES
  (1, 1, 5.00, '2023-05-10'),
  (2, 2, 10.00, '2023-05-11'),
  (3, 3, 7.50, '2023-05-12'),
  (4, 4, 3.50, '2023-05-13'),
  (5, 5, 6.00, '2023-05-14'),
  (6, 6, 2.50, '2023-05-15'),
  (7, 7, 8.75, '2023-05-16'),
  (8, 8, 4.25, '2023-05-17'),
  (9, 9, 9.50, '2023-05-18'),
  (10, 10, 5.75, '2023-05-19'),
  (1, 11, 6.50, '2023-05-20'),
  (2, 12, 3.25, '2023-05-21'),
  (3, 13, 7.00, '2023-05-22'),
  (4, 14, 4.50, '2023-05-23'),
  (5, 15, 9.25, '2023-05-24'),
  (6, 16, 2.75, '2023-05-25'),
  (7, 17, 8.00, '2023-05-26'),
  (8, 18, 5.25, '2023-05-27'),
  (9, 19, 9.75, '2023-05-28'),
  (10, 20, 5.50, '2023-05-29'),
  (1, 21, 6.25, '2023-05-30'),
  (2, 22, 3.75, '2023-05-31'),
  (3, 23, 6.50, '2023-06-01'),
  (4, 24, 4.25, '2023-06-02'),
  (5, 25, 8.75, '2023-06-03'),
  (6, 26, 3.00, '2023-06-04'),
  (7, 27, 7.25, '2023-06-05'),
  (8, 28, 5.00, '2023-06-06'),
  (9, 29, 9.25, '2023-06-07'),
  (10, 30, 6.00, '2023-06-08');

INSERT INTO tblAuthorBook (BookID, AuthorID) VALUES
(1, 1),
(2,	2),
(3,	3),
(4,	4),
(5,	5),
(6,	6),
(7,	7),
(8,	8),
(9,	9),
(10, 10),
(11, 9),
(12, 11),
(13, 12),
(14, 13),
(15, 14),
(16, 15),
(17, 16),
(18, 17),
(19, 18),
(20, 19),
(21, 20),
(22, 21),
(23, 22),
(24, 23),
(25, 24),
(26, 25),
(27, 26),
(28, 27),
(29, 28),
(30, 29),
(31, 30),
(32, 31),
(33, 32),
(34, 33),
(35, 34),
(36, 35),
(37, 36),
(38, 37),
(39, 38),
(40, 39),
(41, 39),
(42, 39),
(43, 39),
(44, 39),
(45, 39),
(46, 40),
(47, 40),
(48, 40),
(49, 40),
(50, 41),
(51, 41),
(52, 41),
(53, 41),
(54, 41),
(55, 41),
(56, 41),
(57, 41),
(58, 41),
(59, 13),
(60, 13),
(61, 13),
(62, 13),
(63, 42),
(64, 43),
(65, 44),
(66, 45),
(67, 21),
(68, 46),
(69, 47),
(70, 48),
(71, 49),
(72, 50),
(73, 51),
(74, 52),
(75, 53),
(76, 54),
(77, 55),
(78, 56),
(79, 57),
(80, 58),
(81, 57),
(82, 59);
-- Inserting records into the BooksCategories table
INSERT INTO tblBooksCategory (BookID, CategoryID) VALUES
  (1, 1),  -- To Kill a Mockingbird - Classic Fiction
  (2, 7),  -- 1984 - Dystopian
  (3, 6),  -- The Great Gatsby - Modernist Fiction
  (4, 4),  -- Pride and Prejudice - Romance
  (5, 11), -- The Catcher in the Rye - Contemporary Fiction
  (6, 6),  -- To the Lighthouse - Modernist Fiction
  (7, 5),  -- Moby-Dick - Adventure
  (8, 7),  -- Brave New World - Dystopian
  (9, 10), -- The Lord of the Rings - Fantasy
  (10, 11),-- Jane Eyre - Contemporary Fiction
  (11, 10),-- The Hobbit - Fantasy
  (12, 12),-- The Chronicles of Narnia - Children's Literature
  (13, 2), -- To All the Boys I've Loved Before - Young Adult Fiction
  (14, 10),-- Harry Potter and the Sorcerer's Stone - Fantasy
  (15, 7), -- The Hunger Games - Dystopian
  (16, 8), -- Dune - Science Fiction
  (17, 14),-- The Alchemist - Nonfiction
  (18, 14),-- The Da Vinci Code - Nonfiction
  (19, 17),-- The Shining - Thriller
  (20, 15),-- The Kite Runner - Biography
  (21, 7), -- The Handmaid's Tale - Dystopian
  (22, 14),-- Sapiens: A Brief History of Humankind - Nonfiction
  (23, 3), -- The Girl on the Train - Mystery
  (24, 16),-- The Fault in Our Stars - Self-Help
  (25, 17),-- Gone Girl - Thriller
  (26, 14),-- The Book Thief - Nonfiction
  (27, 6), -- The Sun Also Rises - Modernist Fiction
  (28, 5), -- The Maze Runner - Adventure
  (29, 12),-- The Adventures of Tom Sawyer - Children's Literature
  (30, 14),-- The Secret Life of Bees - Nonfiction
  (31, 14),-- The Color Purple - Nonfiction
  (32, 12),-- The Bell Jar - Children's Literature
  (33, 18),-- The Picture of Dorian Gray - Poetry
  (34, 15),-- The Lovely Bones - Biography
  (35, 14),-- The Help - Nonfiction
  (36, 12),-- The Giver - Children's Literature
  (37, 14),-- The Road - Nonfiction
  (38, 11),-- The Outsiders - Contemporary Fiction
  (39, 15),-- The Diary of a Young Girl - Biography
  (40, 1),--  Atlas Shrugged - Classic Fiction
  (41, 3),--  The Fountain Head - Mystery
  (42, 7),--  Anthem - Dystopian
  (43, 2),--   We the Living - Young Adult Fiction
  (44, 4),--   The Virtue of Selfishness - Romance
  (45, 6),--   Capitalism: The Unknown Ideal - Modernist Fiction
  (46, 12),-- Dinosaurs Before Dark - Children's Literature --------------------------------
  (47, 12),-- The Knight at Dawn - Children's Literature
  (48, 12),-- Mummies in the Morning - Children's Literature
  (49, 12),-- Pirates Past Noon - Children's Literature
  (50, 12),-- Out from Boneville - Children's Literature
  (51, 12),-- The Great Cow Race - Children's Literature
  (52, 12),-- Eyes of the Storm - Children's Literature
  (53, 12),-- The Dragonslayer - Children's Literature
  (54, 12),-- Rock Jaw: Master of the Eastern Border - Children's Literature
  (55, 12),-- Old Man's Cave - Children's Literature
  (56, 12),-- Ghost Circles - Children's Literature
  (57, 12),-- Treasure Hunters - Children's Literature
  (58, 12),-- Crown of Horns - Children's Literature
  (59, 5),-- Harry Potter and the Goblet of Fire - Adventure
  (60, 3),-- Harry Potter and the Order of the Phoenix - Mystery
  (61, 7),-- Harry Potter and the Half-Blood Prince - Dystopian
  (62, 2),-- Harry Potter and the Deathly Hallows - Young Adult Fiction
  (63, 14),-- Becoming - Nonfiction
  (64, 14),-- Educated - Nonfiction
  (65, 2),-- The Immortal Life of Henrietta Lacks - Young Adult
  (66, 14),-- Thinking, Fast and Slow - Nonfiction
  (67, 6),-- Sapiens: A Graphic History - Modernist Fiction
  (68, 14),-- The Boys in the Boat - Nonfiction
  (69, 14),-- The Glass Castle - Nonfiction
  (70, 14),-- Hidden Figures - Nonfiction
  (71, 14),-- Quiet: The Power of Introverts in a World That Can't Stop Talking - Nonfiction
  (72, 14),-- Born a Crime: Stories from a South African Childhood - Nonfiction
  (73, 14),-- The Sixth Extinction: An Unnatural History - Nonfiction
  (74, 14),-- Bad Blood: Secrets and Lies in a Silicon Valley Startup - Nonfiction
  (75, 14),-- Just Mercy: A Story of Justice and Redemption - Nonfiction
  (76, 14),-- The Warmth of Other Suns: The Epic Story of America's Great Migration - Nonfiction
  (77, 14),-- The Code Book: The Science of Secrecy from Ancient Egypt to Quantum Cryptography - Nonfiction
  (78, 14),-- Man's Search for Meaning - Nonfiction
  (79, 14),-- The Emperor of All Maladies: A Biography of Cancer - Nonfiction
  (80, 14),-- Guns, Germs, and Steel: The Fates of Human Societies - Nonfiction
  (81, 14),-- The Gene: An Intimate History - Nonfiction
  (82, 14);-- Unbroken: A World War II Story of Survival, Resilience, and Redemption - Nonfiction

-----------------------------------------------------------------------------------------------------------------------
--VIEWS
--VIEWS FOR USERS TABLE:

-- Create a view that displays users with their borrowing details
USE LB_LIBRARY
GO
CREATE VIEW UsersWithBorrowings AS
SELECT u.UserID, u.FirstName, u.LastName, b.Title AS BorrowedBook, br.BorrowedDate, br.ReturnDate, f.FineAmount
FROM Users u
LEFT JOIN Borrowings br ON u.UserID = br.UserID
LEFT JOIN Books b ON br.BookID = b.BookID
LEFT JOIN Fines f ON u.UserID = f.UserID AND br.BorrowingID = f.BorrowingID;

-- Create a view that lists books along with their categories
GO
CREATE VIEW BooksByCategory AS
SELECT b.BookID, b.Title, c.CategoryName
FROM Books b
INNER JOIN BooksCategories bc ON b.BookID = bc.BookID
INNER JOIN Categories c ON bc.CategoryID = c.CategoryID;

-- Create a view that displays authors along with the books they have written for the given database 
GO
CREATE VIEW AuthorsByBook AS
SELECT a.AuthorID, a.FirstName, a.LastName, b.BookID, b.Title
FROM Authors a
INNER JOIN AuthorsBooks ab ON a.AuthorID = ab.AuthorID
INNER JOIN Books b ON ab.BookID = b.BookID;

-- Create a view that displays users with their fine details
GO
CREATE VIEW UsersWithFines AS
SELECT u.UserID, u.FirstName, u.LastName, f.FineAmount, f.PaidDate
FROM Users u
LEFT JOIN Fines f ON u.UserID = f.UserID;

-- Create a view that provides a count of books in each category
GO
CREATE VIEW CategoriesWithBookCount AS
SELECT c.CategoryID, c.CategoryName, COUNT(bc.BookID) AS BookCount
FROM Categories c
LEFT JOIN BooksCategories bc ON c.CategoryID = bc.CategoryID
GROUP BY c.CategoryID, c.CategoryName;

-- Create a view that displays the books currently borrowed by each user
GO
CREATE VIEW BorrowedBooksByUser AS
SELECT u.UserID, u.FirstName, u.LastName, b.BookID, b.Title, br.BorrowedDate, br.ReturnDate
FROM Users u
INNER JOIN Borrowings br ON u.UserID = br.UserID
INNER JOIN Books b ON br.BookID = b.BookID
WHERE br.ReturnedDate IS NULL;

-- Create a view that displays books along with their authors
GO
CREATE VIEW BooksByAuthor AS
SELECT b.BookID, b.Title, CONCAT(a.FirstName, ' ', a.LastName) AS AuthorName
FROM Books b
INNER JOIN AuthorsBooks ab ON b.BookID = ab.BookID
INNER JOIN Authors a ON ab.AuthorID = a.AuthorID;

----------------------------------------------------------------------------------------
--Stored Procedure

-- Create a stored procedure for borrowing a book
GO
CREATE PROCEDURE BorrowBook
(
    @UserID INT,
    @BookID INT
)
AS
BEGIN
    -- Check if the book is available for borrowing
    IF EXISTS (
        SELECT 1
        FROM Books
        WHERE BookID = @BookID AND AvailableCopies > 0
    )
    BEGIN
        -- Insert a new borrowing record
        INSERT INTO Borrowings (UserID, BookID, BorrowedDate, ReturnDate, ReturnedDate)
        VALUES (@UserID, @BookID, GETDATE(), DATEADD(DAY, 14, GETDATE()), NULL);
        
        -- Update the number of available copies
        UPDATE Books
        SET AvailableCopies = AvailableCopies - 1
        WHERE BookID = @BookID;
        
        PRINT 'Book borrowed successfully.'
    END
    ELSE
    BEGIN
        PRINT 'Book is not available for borrowing.'
    END
END;
-------------------------------------------------------------------

-- Create a stored procedure for returning a book
GO
CREATE PROCEDURE ReturnBook
(
    @BorrowingID INT
)
AS
BEGIN
    -- Update the borrowing record with the returned date
    UPDATE Borrowings
    SET ReturnedDate = GETDATE()
    WHERE BorrowingID = @BorrowingID;
    
    -- Calculate the fine amount, if any
    DECLARE @FineAmount DECIMAL(10, 2);
    SET @FineAmount = (
        SELECT CASE
                    WHEN ReturnDate < GETDATE() THEN DATEDIFF(DAY, ReturnDate, GETDATE()) * 0.50
                    ELSE 0
                END
        FROM Borrowings
        WHERE BorrowingID = @BorrowingID
    );
    
    -- Insert a new fine record, if applicable
    IF @FineAmount > 0
    BEGIN
        INSERT INTO Fines (UserID, BorrowingID, FineAmount, PaidDate)
        VALUES (
            (SELECT UserID FROM Borrowings WHERE BorrowingID = @BorrowingID),
            @BorrowingID,
            @FineAmount,
            NULL
        );
    END
    
    -- Update the number of available copies
    UPDATE Books
    SET AvailableCopies = AvailableCopies + 1
    WHERE BookID = (
        SELECT BookID
        FROM Borrowings
        WHERE BorrowingID = @BorrowingID
    );
    
    PRINT 'Book returned successfully.'
END;

----------------------------------------------------------------

-- Create a stored procedure for reserving a book
GO
CREATE PROCEDURE ReserveBook
(
    @UserID INT,
    @BookID INT
)
AS
BEGIN
    -- Check if the user has any existing reservations for the book
    IF EXISTS (
        SELECT 1
        FROM Reservations
        WHERE UserID = @UserID AND BookID = @BookID
    )
    BEGIN
        PRINT 'You have already reserved this book.'
        RETURN
    END
    
    -- Check if the book is available for reservation
    IF EXISTS (
        SELECT 1
        FROM Books
        WHERE BookID = @BookID AND AvailableCopies > 0
    )
    BEGIN
        -- Insert a new reservation record
        INSERT INTO Reservations (UserID, BookID, ReservationDate)
        VALUES (@UserID, @BookID, GETDATE())
        
        PRINT 'Book reserved successfully.'
    END
    ELSE
    BEGIN
        PRINT 'Book is not available for reservation.'
    END
END;
-----------------------------------------------------------------

--USER DEFINED FUNCTION

-- Create a function to get book count by category
GO
CREATE FUNCTION GetBookCountByCategory
(
    @CategoryID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;
    
    SELECT @Count = COUNT(*)
    FROM Books b
    JOIN BooksCategories bc ON b.BookID = bc.BookID
    WHERE bc.CategoryID = @CategoryID;
    
    RETURN @Count;
END;

-- Create a function to get author full name
GO
CREATE FUNCTION GetAuthorFullName
(
    @AuthorID INT
)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @FullName VARCHAR(100);
    
    SELECT @FullName = CONCAT(FirstName, ' ', LastName)
    FROM Authors
    WHERE AuthorID = @AuthorID;
    
    RETURN @FullName;
END;

-- Create a function to get borrowed books by user
GO
CREATE FUNCTION GetBorrowedBooksByUser
(
    @UserID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Count INT;
    
    SELECT @Count = COUNT(*)
    FROM Borrowings
    WHERE UserID = @UserID AND ReturnedDate IS NULL;
    
    RETURN @Count;
END;

-- Create a function to calculate total fine amount for a user
GO
CREATE FUNCTION CalculateTotalFineAmount
(
    @UserID INT
)
RETURNS DECIMAL(10, 2)
AS
BEGIN
    DECLARE @TotalFine DECIMAL(10, 2);
    
    SELECT @TotalFine = SUM(FineAmount)
    FROM Fines
    WHERE UserID = @UserID AND PaidDate IS NULL;
    
    RETURN @TotalFine;
END;
