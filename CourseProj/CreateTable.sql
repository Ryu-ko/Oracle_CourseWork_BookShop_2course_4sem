            --1. db13 ADMINCORE-12345 - создание таблиц БД

-- Создание таблицы Author
CREATE TABLE Author (
  ID_Author int PRIMARY KEY,
  FullName VARCHAR(60)NOT NULL,
  BirthYear number,
  BirthCountry VARCHAR(30) NOT NULL
) TABLESPACE TS_USER;

-- Создание таблицы Genre
CREATE TABLE Genre (
  GenreCode int PRIMARY KEY,
  NameGenre varchar(60)NOT NULL
) TABLESPACE TS_USER;

-- Создание таблицы PublisherHouse
CREATE TABLE PublisherHouse (
  ID_PublishingHouse int PRIMARY KEY,
  PublishingHouse_Name VARCHAR(30) NOT NULL
) TABLESPACE TS_USER;

-- Создание таблицы UserInf
CREATE TABLE UserInf(
  ID_User int PRIMARY KEY,
  User_Name VARCHAR(100) NOT NULL,
  User_Email VARCHAR(40) NOT NULL,
  User_Numer VARCHAR(10) NOT NULL,
  User_Sex VARCHAR(2) NOT NULL ,
  User_BirthYear date NOT NULL,
  CHECK (User_Sex = 'М' or User_Sex = 'Ж')
) TABLESPACE TS_USER;

-- Создание таблицы UserAccount
CREATE TABLE UserAccount (
  ID_Account INT PRIMARY KEY,
  ID_UserAc INT ,
  Login VARCHAR(40)  NOT NULL, ---upd
  Password VARCHAR(40) NOT NULL,
  FOREIGN KEY (ID_UserAc) REFERENCES UserInf(ID_User)
) TABLESPACE TS_USER;

-- Создание таблицы Order
CREATE TABLE OrderInf (
  ID_Order int PRIMARY KEY,
  ID_User int,
  Order_Date date  NOT NULL,
  Delivery_Time date  NOT NULL,
  Amount number(5,2)  NOT NULL, 
  FOREIGN KEY (ID_User) REFERENCES UserInf(ID_User)
) TABLESPACE TS_USER;

-- Создание таблицы Book
CREATE TABLE Book (
  ID_Book int PRIMARY KEY,
  Book_Name varchar(200)  NOT NULL,
  Page_Number number  NOT NULL,
  ISBN varchar(20)  NOT NULL,
  BookBindingType varchar(40)  NOT NULL,
  Year_Of_Publication number  NOT NULL,
  Book_ID_PublishingHouse int,
  Book_Language varchar(30)  NOT NULL,
  Book_Description varchar(3000)  NOT NULL,
  Book_ImageSource varchar(40)  NOT NULL,
  NumbersOfBooks number,
  Book_Prise number(5,2) NOT NULL,
  FOREIGN KEY (Book_ID_PublishingHouse) REFERENCES PublisherHouse (ID_PublishingHouse)
) TABLESPACE TS_USER;


-- Создание таблицы Authorss
CREATE TABLE Authors(
  ID_Author int,
  ID_Book int,
  FOREIGN KEY (ID_Author) REFERENCES Author(ID_Author), 
  FOREIGN KEY (ID_Book) REFERENCES Book(ID_Book)
) TABLESPACE TS_USER;

-- Создание таблицы Genres
CREATE TABLE Genres (
  GenresCode int,
  ID_Book int, 
  FOREIGN KEY (ID_Book) REFERENCES Book(ID_Book),
  FOREIGN KEY (GenresCode) REFERENCES Genre(GenreCode)
) TABLESPACE TS_USER;


-- Создание таблицы Orders
CREATE TABLE Orders (
  ID_Orders int,
  ID_Book int,
  NumberOrderedBooks number  NOT NULL,
  FOREIGN KEY (ID_Orders) REFERENCES OrderInf(ID_Order),
  FOREIGN KEY (ID_Book) REFERENCES Book(ID_Book)
) TABLESPACE TS_USER;


select * from OrderInf;

delete from OrderInf Where ID_Order =2;

create table hugeRows(
    id int primary key,
    content nvarchar2(10)
);

CREATE INDEX idx_idAuthors ON Authors(ID_Author) TABLESPACE TS_USER;
CREATE INDEX idx_idGenres ON Genres(GenresCode) TABLESPACE TS_USER;
CREATE INDEX idx_idBook ON Book(Book_ID_PublishingHouse) TABLESPACE TS_USER;
CREATE INDEX idx_idAOrders ON Orders(ID_Orders) TABLESPACE TS_USER;
CREATE INDEX idx_idUserAccount ON UserAccount(ID_UserAc) TABLESPACE TS_USER;
CREATE INDEX idx_idAOrdersBook ON Orders(ID_Book) TABLESPACE TS_USER;
CREATE INDEX idx_idAAuthorsBook ON Authors(ID_Book) TABLESPACE TS_USER;
CREATE INDEX idx_idGenresBook ON Genres(ID_Book) TABLESPACE TS_USER;

/*
    drop table Authors;
    drop table Genres;
    drop table Author;
    drop table Genre;
    drop table Orders;
    drop table OrderInf;
    drop table Book;
    drop table PublisherHouse;


    drop table UserAccount;
    drop table UserInf;
  */