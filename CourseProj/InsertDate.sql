 --3) db13 ADMINCORE-12345 - ������� ���� ������

INSERT ALL
    INTO Author (ID_Author, FullName, BirthYear, BirthCountry) VALUES (NULL, '������ ����������� ��������', 1891, '����')
    INTO Author (ID_Author, FullName, BirthYear, BirthCountry) VALUES (NULL, '������ ������', 1903, '��������������')
    INTO Author (ID_Author, FullName, BirthYear, BirthCountry) VALUES (NULL, '����� ���������� �����������', 1821, '������')
    INTO Author (ID_Author, FullName, BirthYear, BirthCountry) VALUES (NULL, '����� �����', 1775, '��������������')
    INTO Author (ID_Author, FullName, BirthYear, BirthCountry) VALUES (NULL, '���� ����� ������', 1898, '��������')
    INTO Author (ID_Author, FullName, BirthYear, BirthCountry) VALUES (NULL, '������ ���� ����', 1802, '�������')
    INTO Author (ID_Author, FullName, BirthYear, BirthCountry) VALUES (NULL, '������ ����', 1947, '���')
    INTO Author (ID_Author, FullName, BirthYear, BirthCountry) VALUES (NULL, '����� ������', 1943, '������������')
    INTO Author (ID_Author, FullName, BirthYear, BirthCountry) VALUES (NULL, '���� ��������', 1959, '������')
    INTO Author (ID_Author, FullName, BirthYear, BirthCountry) VALUES (NULL, '����� ������', 1950, '������')
SELECT * FROM DUAL;    
commit;       
SELECT * FROM Author;  
select * from Genre;
    
INSERT ALL
    INTO Genre (GenreCode, NameGenre) values (NULL, '������������ �����')
    INTO Genre (GenreCode, NameGenre) values (NULL, '��������')
    INTO Genre (GenreCode, NameGenre) values (NULL, '�����')
    INTO Genre (GenreCode, NameGenre) values (NULL, '�������� �����')
    INTO Genre (GenreCode, NameGenre) values (NULL, '������')
    INTO Genre (GenreCode, NameGenre) values (NULL, '����� � ��������')
    INTO Genre (GenreCode, NameGenre) values (NULL, '�������')
    INTO Genre (GenreCode, NameGenre) values (NULL, '�������')
    INTO Genre (GenreCode, NameGenre) values (NULL, '�������') 
    INTO Genre (GenreCode, NameGenre) values (NULL, '��������')
    INTO Genre (GenreCode, NameGenre) values (NULL, '�����')
    INTO Genre (GenreCode, NameGenre) values (NULL, '�������')
SELECT * FROM DUAL;
commit;
select * from Genre;
select * from 

INSERT ALL
    INTO PublisherHouse (ID_PublishingHouse, PublishingHouse_Name) VALUES (NULL, '���')
    INTO PublisherHouse (ID_PublishingHouse, PublishingHouse_Name) VALUES (NULL, '������')
    INTO PublisherHouse (ID_PublishingHouse, PublishingHouse_Name) VALUES (NULL, '�����')
select * from dual;   
commit;
select * from PublisherHouse;       
      

INSERT ALL
    INTO UserInf (ID_User, User_Name, User_Email, User_Numer, User_Sex, User_BirthYear )
        VALUES (NULL,'�������� ������� ����������', 'Palazzzz@yandex.ru', '292388534', '�', DATE'2004-04-14')
    
   INTO UserInf (ID_User, User_Name, User_Email, User_Numer, User_Sex, User_BirthYear )
     VALUES (NULL,'���������� ��������� ���������', 'VladislaVVV@yandex.ru ', '294466548', '�', DATE'2003-06-13')
     
     INTO UserInf (ID_User, User_Name, User_Email, User_Numer, User_Sex, User_BirthYear )
   VALUES (NULL,'admin', 'adminBD@yandex.ru', '----', '�', DATE'2002-10-27') 
   INTO UserInf (ID_User, User_Name, User_Email, User_Numer, User_Sex, User_BirthYear)
       VALUES (NULL,'���������� ������ ����������', 'Halwaaaa@yandex.ru', '297900210', '�', DATE'2003-09-16')
 INSERT ALL  INTO UserInf (ID_User, User_Name, User_Email, User_Numer, User_Sex, User_BirthYear)
    VALUES (NULL,'������ ������� ��������', 'LEXA@yandex.ru', '298834241', '�', DATE'2004-07-13')
    
select * from dual;
commit;
select * from UserInf;

INSERT ALL
   INTO UserAccount (ID_Account, ID_UserAc, Login, Password) values (NULL, NULL,'senja','123')
   
  INTO UserAccount (ID_Account, ID_UserAc, Login, Password) values (NULL, NULL,'vlad','123')
  INTO UserAccount (ID_Account, ID_UserAc, Login, Password) values (NULL, NULL,'halwa','123')
 INTO UserAccount (ID_Account, ID_UserAc, Login, Password) values (NULL, NULL,'lexa','123')
   INTO UserAccount (ID_Account, ID_UserAc, Login, Password) values (NULL, NULL,'admin','123')
  
  select * from dual;
commit;
select * from UserAccount;


INSERT ALL
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, '�������, ������� �������', 704, '978-5-17-091569-9', '������ �������', 2016,
                1, '�������',
                '"�������, ������� �������" � ���� �� �������� ��������� ������� ������� ����. � ������ ������������ ��������, � ������ ������� ��������� ���������, �� �������������� ��������������� ��� ����. ������ ����������� ��� ������ ���������, �� ���� �� ���������� � ��������� ������� ���� �� ����������� ����� �� ����� � ����� ����������, �� ���� �������� ������� � ����������� ���������... ',
                '/Imgs/Gugo_LaughtPerson.jpg', 15 , 12.26)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, '����������� ',704, '978-5-389-06787-5', '������� ��������', 2013,
                2, '�������', 
                '�����-������ ������� ���� "�����������" (1862) � �������� �����, ��� �������� ���������� ����������� ���� �������� ������� XIX ����. � ��������, ��� "����� � ���" �������� ������������ ��������, ������ ����� ������� ��������� �� �������������� ��������� �����, �� �����, ������� ����� ����� ����� ����� � ��� � ������������ ���� � � ��������. ��� �������� "�����������" ������, �� ��� ������, ������ ����� ��������� ��� ����: "��������� �������... ������� ������� �� ������� ������, �������� ������� ���������� ����� ����������", ��� ���������� � �������� ������� ����������� ���: ���������� ���� ��������, ������� � �������. ������������� ����������� ���������� ������ ���������� ������� � ���������� ��������� �� ���������, ������� ��������������� �� ������ ������� ������, � �������� � �� ����������. �� �������� � XX ���� ������������� ������� ����������� "�����������" � �� ����� ����� "�� ����������" (1907) �� ���������� ������ ���� ������.',
                '/Imgs/otverjenii.jpg ', 8 , 8.21)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, '������������ ���� ', 640, '978-5-17-105398-7', '������ �������', 2017,
                1, '������� ', 
                '"������������ ����" � ������������� ������� ����� ����� ���������, �����, ���������� ����, �� � �������� ����������� �������. ����� �������� � ����� �������� ������ ������� �����. ����� � ������� �� ��������, ��� ����������, ������������ � �� ���������, � �� ��������, ������, ��������� ������������ �����. ������� � ����������� �������, ���������� ������������, �����������, ��� ��� �������, ���������� � �����������. � �����, ����� ���������� �������� �����������, � �����, ����������� ��������� ������������� ����������, ���������� ������� ����� ������. "������������ ����" ���� ������ �������������� � ��-�������� �������� ��������� ����� ����.',
                '/Imgs/Triumarka.jpg ', 22 , 15.38)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, '���� � ��������� ', 320, '978-5-17-100857-4', '	������ �������', 2019,
                1, '�������', 
                '"���� � ���������" (1962) � �����������, �������������� ����� ����� ����� ������� � ������ ������� �����. ��� �� ������ ���� ���� � ���������, � ������� � ��������� ���� ���� �������. ��� �� ������ ��������� ������ ���� ����������� �����, ���� �� ������� ������ �������� ����� ��� ������ �� ������� �� �������, � ������ � ���� �����������, ����� ������ ��� ����. ��� �������� �������� ���������, ������� ��������, �� ���� �������� ������ ���������� �� ������� ���������. ��� ������� ������ ��������� �����, ������������� � ������, �������� � ����� �������. ��� ��� � ������� �����, ����� ������� ��������� ���� ������.',
                '/Imgs/Lissabon.jpg ', 43 , 13.11)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, '�������� � ������������� ', 416, '978-5-04-105469-4', '������� ��������', 2022,
                3, '�������', 
                '�� ���� ���� ����������� ��������������� ��������, ����� �������� ����� ��������� � ������ ������� � ������������ �����������������, ��������������� ������������ ���� ����� ������ �������� ����� � ���������� �������� ������. ��������� �������� ����� ������������ �������� �� ��������� � ������� ������� ������ ���������� ����������� � �������� ������, �� ������� ������� �������.',
                '/Imgs/Gordost.jpg ', 25 , 17.34)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, '����', 512, '978-5-17-105077-1', '������ �������', 2018,
                1, '�������', 
                '� ���� ������� ���� ��� � ������� ����, ���������, ������������ � ��������, ������� � ������ ��, � ��� ������ ����. �� ��� � �� ��������� ��������� ���� ����� �����, ����������� ���������� ������������ ������ ����� ������ � �����������, ��������� ���� � �������� ��������� � ����� ����������� � �������� ��������...',
                '/Imgs/Emma.jpg ', 2 , 11.86)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, '������������ � ���������',608, '978-5-389-04926-0', '������� ��������', 2019,
                2, '�������', 
                '���� �� "������������" ������������ ������� � ������� ����������, ���������� �� ��� �������� � ��������������� ���������, ������������ ���������������� ����� ������������ "������������ � ���������" ������ ����� ��������� ��������� �����������-����������������� ������� � � ����, �������, ����� � �� ���������� ����� ���������. ������������ ���������� "����-�������", "����������� �����", ����������� ���� ������� ������������� � ����� "����������" � "��������������" ������ �� �����, ���������� �������� ���������� ���� ����������, ����������� � ���� ��������� ��������� ������ �����. ���������� ��� "��������������� ����� ������ ������������", ����� ������������ �������� ����� ��������� ����������� �������������-����������� ������������� ������������ �������, ������������ ��������� � ������ � ����������� ����.',
                '/Imgs/PrestuplNakaz.jpg ', 10 , 8.21)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, '�����', 640, '978-5-389-04730-3', '������� ��������', 2012,
                2, '�������', 
                '"������� ���� � ����� �. �. ����������� � ����� ������ "�����", � ���������� ������������-����������� ��������. ������� ����� ��� ������ �� �����..." �� ��� ���� �� �������� ���� ���� "�����-������", ����� �� �� ��������: "��������� ���� ���������� �, ����� ����, ������������ ����� ����� ����� ������������". ������ ����� ��������� ��-������ ������������ �������� � �������� ���� ����������� ������ �� ������ ������� �����. �� ���� ��������������� � ��������� ����������� ������, ��� ����������� ������. � ������ �������������� ������ ����� ������� ������� �. �������, �. �������������, �. �������.',
                '/Imgs/Idiot.jpg ', 10 , 8.21)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, '�����', 540, '978-5-17-103090-2', '������ �������', 2022,
                1, '�������', 
                '������ "�����" ������� ������� ������������������ ������, ���� �������� ������� ��� ��� �����������. ������� �������� ���� ����� ����� ���������: ������������� �� ���������� ����� � ���������, �������� ����������� � ������� �������� �������� � ������������� ��������, �������� �������� ������ ��� �������� �����... �� 26 ����. ��� ���������� ���������������� ����� �������� ������������, ������� � �����, ��������������� �������� ���������-��������������, ������� �� ������������ �����. ��� � ����� ����� ����� ������� ���� �������� � �������, ������� ������� ���� ����� ��� ����� � �����...',
                '/Imgs/Gamer.jpg ', 18 , 8.84)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, '������� ����. ����',210, '978-5-04-122320-5', '������� ��������', 2021,
                3, '�������', 
                '�������-������ "������� ����" ����� ������� �������� � ������������ ������. ��������� ����� ������������ ����� ������� ������� ������, � ���� ����� ���������� �������� ������������� ��������. ��� ����� ������������ � ����� �������� ��� ��������� � ��������, ������� ������� �� �����?',
                '/Imgs/SkotnDvor.jpg ', 21 , 9.21)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, '1984', 320, '978-5-17-148844-4', '������ �������', 2022,
                1, '�������', 
                '������������ ������� ������ ������� ���������� XX ���� "� ������ ����� ���" ������ ������. ���, � ��������, ��������: ���������� �� ������� "�������� ���������" ��� ���������� �� �������� "�������� ����"?',
                '/Imgs/1984.jpg ',3 , 11.86)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, '������', 320, '978-5-04-119085-9', '������� ��������', 2023,
                3, '�������', 
                '������� ����, ���������������� � ����� �������, ������������ � ��������. ��������� ������� ������� �������� ������� �������� ����������, ��� ������� �������� � ����������� ������� �� ������������ �� ����������� �����������. �������� �� ������ �������� �� ����� ������ ��������� ������ � �������� ��������, ��� ������� ��������, ������� ���������� ��������, ������� ��������� ���� ��������� ��������������. "������" � ���������� ������� ��������� ������� ���������, ������� ���������� ������, �� �� ���� ��������� ������� ����� ������.',
                '/Imgs/Morphy.jpg ', 45 , 13.66)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, '������� ������', 384, '978-5-389-06294-8', '������� ��������', 2013,
                3, '�������', 
                '������� ������� ��������� �������� ������, ���������� � 1925 ���� � ������, �������� ����������� �������� ������ ������������ ���������� ���� �������. � ��� ����� ������� ���� ���� � ��������� �� ������ ����, ����� �� �������� ����������� � ������ �������� � � ���� ��� ����� ��������. ���������� ���������� ����, �������� ���������� � � ����������� �������� ����� � ������� �� ���������� ��������� ��� ����� �������������� ������������.',
                '/Imgs/DogHeart.jpg ', 10 , 8.21)
                 INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, '��������', 344, '5-17-027102-6', '������� ��������', 2022,
                1, '�������', 
                'J�������� ����� ����� ����������� �������� � �������� ������������ �����, � � ��������� ���������� ��������� ���������� �������, ����������� ������ - ��������, � ���������� ������� ���������� ��������, ���� �� ����������� � ���� ����� � ����. � �����, ��������, ������ ��� ������� ������... � ������ ���������������� ������� ������������ �������� � �������� ��� � ��������� ���...',
                '/Imgs/talisman.jpg ', 10 , 20.21)
 
 INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, '����� ���������� ���������', 150, '5-17-657342-6', '������� ��������', 2013,
                3, '�������', 
                '����� � ���� �������� ����������� ����������� ����������� ������� ������������. ���� ����������� ������ ����� ���� �� ���� ����������� ��������� �����������. ����� ��������������� �������������, ������ �������� ��������� ����� �������������: � ��������� ����� ���� �������� ����� ��������� �������.',
                '/Imgs/Akademic.jpeg ', 1 , 6)                
        
select * from dual;
commit;

     
SELECT * FROM Author;  
select * from Genre;
select * from Book;
---------------
INSERT ALL
   INTO Authors (ID_Author, ID_Book) values (7, 14)
   INTO Authors (ID_Author, ID_Book) values (8, 14)
   INTO Authors (ID_Author, ID_Book) values (9, 15)
   INTO Authors (ID_Author, ID_Book) values (10,15)
   
    INTO Authors (ID_Author, ID_Book) values (6, 1)
   INTO Authors (ID_Author, ID_Book) values (6, 2)
   INTO Authors (ID_Author, ID_Book) values (5, 3)
   INTO Authors (ID_Author, ID_Book) values (5, 4)
   INTO Authors (ID_Author, ID_Book) values (4, 5)
   INTO Authors (ID_Author, ID_Book) values (4, 6)
   INTO Authors (ID_Author, ID_Book) values (3, 7)
   INTO Authors (ID_Author, ID_Book) values (3, 8)
   INTO Authors (ID_Author, ID_Book) values (3, 9)
   INTO Authors (ID_Author, ID_Book) values (2, 10)
   INTO Authors (ID_Author, ID_Book) values (2, 11)
   INTO Authors (ID_Author, ID_Book) values (1, 12)
   INTO Authors (ID_Author, ID_Book) values (1, 13)
  select * from dual;
commit;
select * from Authors ORDER BY ID_Author asc;
  
       
INSERT ALL
    INTO Genres (GenresCode, ID_Book) values (1, 1)
    INTO Genres (GenresCode, ID_Book) values (2, 1)
   INTO Genres (GenresCode, ID_Book) values (2, 2)
   INTO Genres (GenresCode, ID_Book) values (3, 3)
   INTO Genres (GenresCode, ID_Book) values (3, 4)
   INTO Genres (GenresCode, ID_Book) values (4, 5)
   INTO Genres (GenresCode, ID_Book) values (4, 6)
   INTO Genres (GenresCode, ID_Book) values (3, 7)
   INTO Genres (GenresCode, ID_Book) values (3, 8)
   INTO Genres (GenresCode, ID_Book) values (3, 9)
   INTO Genres (GenresCode, ID_Book) values (5, 10)
   INTO Genres (GenresCode, ID_Book) values (6, 11)
   INTO Genres (GenresCode, ID_Book) values (7, 12)
   INTO Genres (GenresCode, ID_Book) values (8, 13)
   
      INTO Genres (GenresCode, ID_Book) values (11, 14)
   INTO Genres (GenresCode, ID_Book) values (12, 14)
   INTO Genres (GenresCode, ID_Book) values (10, 15)
   INTO Genres (GenresCode, ID_Book) values (9, 15)
   
  select * from dual;
commit;
select * from Genres;


   ---������ � 100 000 �����   
create or replace procedure insertHugeData(
    i int,
    text nvarchar2
)
is
begin
    insert into hugeRows (id, content) values (i, text);
end;

select * from hugeRows order by id desc;
truncate table hugeRows
declare
    i number := 1;
begin
    while i <= 100000 loop
        insertHugeData(i, 'content');
        i := i + 1;
    end loop;
end;



EXPLAIN PLAN FOR
SELECT *
    FROM Book bk
    JOIN Genres gs ON bk.ID_Book = gs.ID_Book
    JOIN Genre g ON gs.GenresCode = g.GenreCode;
    SELECT * FROM TABLE (DBMS_XPLAN.DISPLAY);
    
    
    
create index idx_book_isDeleted on Book (Book_Name) tablespace TS_USER;
create index idx_genre_genreName on genre (NameGenre) tablespace TS_USER;  




