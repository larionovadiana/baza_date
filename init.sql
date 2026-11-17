CREATE TABLE author (
    id_author SERIAL PRIMARY KEY,
    fio_author VARCHAR(200) NOT NULL
);

CREATE TABLE reader (
    card_number SERIAL PRIMARY KEY,
    fio VARCHAR(200) NOT NULL,
    telephone VARCHAR(11)
);

CREATE TABLE books (
    isbn VARCHAR(20) PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    year INT
);

CREATE TABLE authorship (
    book_isbn VARCHAR(20),
    id_author INT,
    PRIMARY KEY (book_isbn, id_author),
    FOREIGN KEY (book_isbn) REFERENCES books(isbn) ON DELETE CASCADE,
    FOREIGN KEY (id_author) REFERENCES author(id_author) ON DELETE CASCADE
);

CREATE TABLE loan (
    id_loan SERIAL PRIMARY KEY,
    id_reader INT NOT NULL,
    books_isbn VARCHAR(20) NOT NULL,
    issue_date DATE NOT NULL,
    planed_return_date DATE NOT NULL,
    actual_return_date DATE,
    FOREIGN KEY (id_reader) REFERENCES reader(card_number),
    FOREIGN KEY (books_isbn) REFERENCES books(isbn)
);