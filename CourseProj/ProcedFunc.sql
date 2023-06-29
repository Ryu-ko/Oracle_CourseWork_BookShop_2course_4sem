                                                --1) Добавить нового пользователя в "регистрации"
drop procedure enterUser

CREATE OR REPLACE PROCEDURE enterUser(
    enteredLogin IN UserAccount.Login%TYPE,
    enteredPassword IN UserAccount.Password%TYPE,
    enterendFIO IN UserInf.User_Name%TYPE,
    enteredEmail IN UserInf.User_Email%TYPE,
    enteredNumber IN UserInf.User_Numer%TYPE,
    enteredSex IN UserInf.User_Sex%TYPE,
    enteredBirthday IN UserInf.User_BirthYear%TYPE
)
IS
BEGIN
    INSERT INTO UserInf(ID_User, User_Name, User_Email, User_Numer, User_Sex, User_BirthYear)
            VALUES (NULL, enterendFIO, enteredEmail, enteredNumber, enteredSex, To_Date(enteredBirthday, 'DD.MM.YYYY'));
    INSERT INTO UserAccount(Id_Account,Id_UserAc, login, password)
            VALUES (NULL, NULL, enteredLogin, enteredPassword);
    COMMIT;
      DBMS_OUTPUT.PUT_LINE('Пользователь добавлен!');
         EXCEPTION
             WHEN OTHERS THEN
                ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('Возникла ошибка при добавлении пользователей' || SQLERRM);
END;
--test01
exec enterUser('12','11','TESTFIO2', 'TESTEmail2','numb','Ж','27.10.1983');
select * from UserInf
        ORDER BY ID_User Asc;
select * from UserAccount 
    ORDER BY ID_Account Asc;


                                                 --2)УПРАВЛЕНИЕ ИНФОРМАЦИЕЙ О КНИГАХ
                                                 --информации о книге (авторе+ жанре+ количесве страниц+ ISBN+ тип переплета+ год публикации+ издательсво+ язык+ описание)

create or replace procedure bookinf (
    books out sys_refcursor
)
IS
BEGIN
    OPEN books FOR 
        SELECT ID_BOOK, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication ,
                 Book_Language, Book_ImageSource,NumbersOfBooks, Book_Prise, Book_Description
    FROM Book
        Order By ID_BOOK asc;
END;
--test02
VAR bookCursor REFCURSOR;
EXEC bookinf(:bookCursor);
PRINT bookCursor;
select * from book order by ID_BOOK;

    ----В наличии
create or replace procedure bookinfAvailability (
    books out sys_refcursor
)
IS
BEGIN
    OPEN books FOR 
        SELECT ID_BOOK, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication ,
                 Book_Language, Book_ImageSource,NumbersOfBooks, Book_Prise, Book_Description
    FROM Book
    WHERE NumbersOfBooks>0
        Order By ID_BOOK asc;
END;
VAR bookCursor REFCURSOR;
EXEC bookinfAvailability(:bookCursor);
PRINT bookCursor;

    ----Нет в наличии
create or replace procedure bookinf_NON_Availability (
    books out sys_refcursor
)
IS
BEGIN
    OPEN books FOR 
        SELECT ID_BOOK, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication ,
                 Book_Language, Book_ImageSource,NumbersOfBooks, Book_Prise, Book_Description
    FROM Book
    WHERE NumbersOfBooks=0
        Order By ID_BOOK asc;
END;
VAR bookCursor REFCURSOR;
EXEC bookinf_NON_Availability(:bookCursor);
PRINT bookCursor;


                                                ---Вся информация о жанрах
create or replace function GetALLGenresInf(func_Book_ID IN Book.ID_Book%TYPE) 
    RETURN SYS_REFCURSOR AS
        gInf SYS_REFCURSOR;
BEGIN
    OPEN gInf FOR           
        SELECT g.NameGenre
        FROM Book
            Join Genres gs on  Book.ID_Book = gs.ID_Book
            Join Genre g on  gs.GenresCode=g.GenreCode
        WHERE Book.ID_Book = func_Book_ID;
    RETURN gInf;
END;

                                                ---Вся информация об авторах
create or replace function GetALLAuthorsInf(func_Book_ID IN Book.ID_Book%TYPE) 
    RETURN SYS_REFCURSOR AS
        gInf SYS_REFCURSOR;
BEGIN
    OPEN gInf FOR 
        SELECT au.FullName
        FROM Book
            Join Authors a on  Book.ID_Book = a.ID_Book
            Join Author au on au.ID_Author = a.ID_Author
        WHERE Book.ID_Book = func_Book_ID;
    RETURN gInf;
END;
       
                                                ---Вся информация об идателе
create or replace function GetPublisherInf(func_Book_ID IN Book.ID_Book%TYPE) 
    RETURN SYS_REFCURSOR AS
        gInf SYS_REFCURSOR;
BEGIN
    OPEN gInf FOR 
        SELECT PH.PublishingHouse_Name
        FROM Book
            Join PublisherHouse PH on  Book.Book_ID_PublishingHouse = PH.ID_PublishingHouse
        WHERE Book.ID_Book = func_Book_ID;
    RETURN gInf;
END;


 -- Select GetPublisherInf(1) from dual;
        
                                                --ПОИСК по НАЗВАНИЮ 
CREATE OR REPLACE FUNCTION find_books_by_title(title IN VARCHAR2)
        RETURN SYS_REFCURSOR IS
                books_cursor SYS_REFCURSOR;
BEGIN
  OPEN books_cursor FOR
    SELECT Book_Name, Year_Of_Publication, Book_Prise
    FROM BOOK
    WHERE Book_Name = title;
  
  RETURN books_cursor;
END;
        
                                                --ФИЛЬТРАЦИЯ по ЦЕНЕ
        
CREATE OR REPLACE PROCEDURE SEARCH_BOOKS_ByPriceRange(
    prc_min_price IN NUMBER,
    prc_max_price IN NUMBER
) IS
    v_books_cursor SYS_REFCURSOR;
    v_book_Name Book.Book_Name%TYPE;
    v_book_NumbersOfBooks Book.NumbersOfBooks%TYPE;
    v_book_price Book.Book_Prise%TYPE;
BEGIN
    IF prc_min_price > prc_max_price THEN
        RAISE_APPLICATION_ERROR(-20001, 'Минимальная цена не может быть больше максимальной');
    END IF;

    OPEN v_books_cursor FOR
        SELECT Book_Name, NumbersOfBooks, Book_Prise
        FROM Book
        WHERE Book_Prise BETWEEN prc_min_price AND prc_max_price;

    LOOP
        FETCH v_books_cursor INTO v_book_Name, v_book_NumbersOfBooks, v_book_price;
        EXIT WHEN v_books_cursor%NOTFOUND;

        IF v_book_NumbersOfBooks > 0 THEN
            DBMS_OUTPUT.PUT_LINE('Название: ' || v_book_Name || ', Количество книг: ' || v_book_NumbersOfBooks || ', Цена: ' || v_book_price);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Название: ' || v_book_Name || ', Количество книг: Нет в наличии' || ', Цена: ' || v_book_price);
        END IF;
    END LOOP;

    CLOSE v_books_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;

EXEC SEARCH_BOOKS_ByPriceRange(prc_min_price => 11, prc_max_price => 50);


                                                --ФИЛЬТРАЦИЯ по количеству страниц
CREATE OR REPLACE PROCEDURE SEARCH_BOOKS_ByPageRange(
    prc_min_pages IN NUMBER,
    prc_max_pages IN NUMBER
) IS
    v_books_cursor SYS_REFCURSOR;
    v_book_Name Book.Book_Name%TYPE;
    v_book_NumbersOfBooks Book.NumbersOfBooks%TYPE;
    v_book_pages Book.Page_Number%TYPE;
BEGIN
    IF prc_min_pages > prc_max_pages THEN
        RAISE_APPLICATION_ERROR(-20001, 'Минимальное количество страниц не может быть больше максимального');
    END IF;

    OPEN v_books_cursor FOR
        SELECT Book_Name, NumbersOfBooks, Page_Number
        FROM Book
        WHERE Page_Number BETWEEN prc_min_pages AND prc_max_pages;

    LOOP
        FETCH v_books_cursor INTO v_book_Name, v_book_NumbersOfBooks, v_book_pages;
        EXIT WHEN v_books_cursor%NOTFOUND;

        IF v_book_NumbersOfBooks > 0 THEN
            DBMS_OUTPUT.PUT_LINE('Название: ' || v_book_Name || ', Количество книг: ' || v_book_NumbersOfBooks || ', Количество страниц: ' || v_book_pages);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Название: ' || v_book_Name || ', Количество книг: Нет в наличии' || ', Количество страниц: ' || v_book_pages);
        END IF;
    END LOOP;

    CLOSE v_books_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;
                                               
EXEC SEARCH_BOOKS_ByPageRange(prc_min_pages => 200, prc_max_pages => 300);


                                                --ФИЛЬТРАЦИЯ по ГОДУ ИЗДАНИЯ
CREATE OR REPLACE PROCEDURE SEARCH_BOOKS_ByYear_Of_Publication(
    prc_min_year IN NUMBER,
    prc_max_year IN NUMBER
) IS
    v_books_cursor SYS_REFCURSOR;
    v_book_Name Book.Book_Name%TYPE;
    v_book_NumbersOfBooks Book.NumbersOfBooks%TYPE;
    v_book_Year_Of_Publication Book.Year_Of_Publication%TYPE;
BEGIN
    IF prc_min_year > prc_max_year THEN
        RAISE_APPLICATION_ERROR(-20001, 'Минимальный год выпуска не может быть больше максимального');
    END IF;

    OPEN v_books_cursor FOR
        SELECT Book_Name, NumbersOfBooks, Year_Of_Publication
        FROM Book
        WHERE Year_Of_Publication BETWEEN prc_min_year AND prc_max_year;

    LOOP
        FETCH v_books_cursor INTO v_book_Name, v_book_NumbersOfBooks, v_book_Year_Of_Publication;
        EXIT WHEN v_books_cursor%NOTFOUND;

        IF v_book_NumbersOfBooks > 0 THEN
            DBMS_OUTPUT.PUT_LINE('Название: ' || v_book_Name || ', Количество книг: ' || v_book_NumbersOfBooks || ', Год выпуска: ' || v_book_Year_Of_Publication);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Название: ' || v_book_Name || ', Количество книг: Нет в наличии' || ', Год выпуска: ' || v_book_Year_Of_Publication);
        END IF;
    END LOOP;

    CLOSE v_books_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Произошла ошибка: ' || SQLERRM);
END;
                                                
                                                
EXEC SEARCH_BOOKS_ByYear_Of_Publication(prc_min_year =>2016, prc_max_year => 2020);                                               
                                                
                                                    --ФИЛЬТРАЦИЯ по ЖАНРУ

CREATE OR REPLACE PROCEDURE Get_Book_ByGenre(
  p_NameGenree IN Genre.NameGenre%TYPE
) AS
    prc_books_cursor SYS_REFCURSOR;
    getBookName Book.Book_Name%TYPE ;
    getBookPages Book.Page_Number%TYPE;
    getBookISBN Book.ISBN%TYPE ;
    getBookBinding Book.BookBindingType%TYPE;
    getBookYearPublic Book.Year_Of_Publication%TYPE;
    getBookIDPublishHous Book.Book_ID_PublishingHouse%TYPE;
    getBookLanguage Book.Book_Language%TYPE;
    getBookDescript Book.Book_Description%TYPE;
    getBookImageSoursce Book.Book_ImageSource%TYPE;
    getBookNumbersOfBooks Book.NumbersOfBooks%TYPE ;
    getBookPrice Book.Book_Prise%TYPE ;
    prc_genre_count NUMBER; -- Declare the variable for genre count
BEGIN 
  -- Проверяем, существует ли указанный жанр
  SELECT COUNT(*)
    INTO prc_genre_count
    FROM Genre
    WHERE NameGenre = p_NameGenree;
    
  IF prc_genre_count = 0 THEN
    -- Если жанр не найден, генерируем исключение
    RAISE_APPLICATION_ERROR(-20001, 'Жанр ' || p_NameGenree || ' не найден.');
  END IF;
    
  OPEN prc_books_cursor FOR
    SELECT b.Book_Name, b.Page_Number, b.ISBN, b.BookBindingType, b.Year_Of_Publication, b.Book_ID_PublishingHouse,
           b.Book_Language, b.Book_Description, b.Book_ImageSource, b.NumbersOfBooks, b.Book_Prise
    FROM Book b
    JOIN Genres gs ON b.ID_Book = gs.ID_Book
    JOIN Genre g ON gs.GenresCode = g.GenreCode
    WHERE g.NameGenre = p_NameGenree;

  -- Очищаем буфер DBMS_OUTPUT
  DBMS_OUTPUT.PUT_LINE('Книги с жанром: ' || p_NameGenree || ' ');

  LOOP
    FETCH prc_books_cursor INTO getBookName, getBookPages, getBookISBN, getBookBinding, getBookYearPublic,
                              getBookIDPublishHous, getBookLanguage, getBookDescript, getBookImageSoursce,
                              getBookNumbersOfBooks, getBookPrice;
    EXIT WHEN prc_books_cursor%NOTFOUND;

    -- Выводим информацию о книге
    DBMS_OUTPUT.PUT_LINE('Название книги: ' || getBookName);
    DBMS_OUTPUT.PUT_LINE('Количество страниц: ' || getBookPages);
    DBMS_OUTPUT.PUT_LINE('ISBN: ' || getBookISBN);
    DBMS_OUTPUT.PUT_LINE('Тип переплета: ' || getBookBinding);
    DBMS_OUTPUT.PUT_LINE('Год публикации: ' || getBookYearPublic);
    DBMS_OUTPUT.PUT_LINE('Идентификатор издательства: ' || getBookIDPublishHous);
    DBMS_OUTPUT.PUT_LINE('Язык книги: ' || getBookLanguage);
    DBMS_OUTPUT.PUT_LINE('Описание книги: ' || getBookDescript);
    DBMS_OUTPUT.PUT_LINE('Источник изображения: ' || getBookImageSoursce);
    DBMS_OUTPUT.PUT_LINE('Количество книг: ' || getBookNumbersOfBooks);
    DBMS_OUTPUT.PUT_LINE('Цена книги: ' || getBookPrice);
    DBMS_OUTPUT.PUT_LINE('--------------------------------------------------------------');
  END LOOP;

  CLOSE prc_books_cursor;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Нету книг с жанром ' || p_NameGenree);
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Возникла ошибка ' || SQLERRM);
END;

exec GET_BOOK_BYGENRE('Детектив');
       ------------------
                                                
                                                    --ФИЛЬТРАЦИЯ по АВТОРУ  
CREATE OR REPLACE PROCEDURE Get_Book_ByAuthor(
  p_AuthorName IN Author.FullName%TYPE
) AS
  prc_books_cursor SYS_REFCURSOR;
  getBookName Book.Book_Name%TYPE ;
  getBookPages Book.Page_Number%TYPE;
  getBookISBN Book.ISBN%TYPE ;
  getBookBinding Book.BookBindingType%TYPE;
  getBookYearPublic Book.Year_Of_Publication%TYPE;
  getBookIDPublishHous Book.Book_ID_PublishingHouse%TYPE;
  getBookLanguage Book.Book_Language%TYPE;
  getBookDescript Book.Book_Description%TYPE;
  getBookImageSoursce Book.Book_ImageSource%TYPE;
  getBookNumbersOfBooks Book.NumbersOfBooks%TYPE ;
  getBookPrice Book.Book_Prise%TYPE ;
BEGIN 
  OPEN prc_books_cursor FOR
    SELECT b.Book_Name, b.Page_Number, b.ISBN, b.BookBindingType, b.Year_Of_Publication, b.Book_ID_PublishingHouse,
           b.Book_Language, b.Book_Description, b.Book_ImageSource, b.NumbersOfBooks, b.Book_Prise
    FROM Book b
    JOIN Authors a ON b.ID_Book = a.ID_Book
    WHERE a.ID_Author IN (SELECT ID_Author FROM Author WHERE FullName = p_AuthorName);

  -- Очищаем буфер DBMS_OUTPUT
  DBMS_OUTPUT.PUT_LINE('Книги автора: ' || p_AuthorName || ' ');

  LOOP
    FETCH prc_books_cursor INTO getBookName, getBookPages, getBookISBN, getBookBinding, getBookYearPublic,
                              getBookIDPublishHous, getBookLanguage, getBookDescript, getBookImageSoursce,
                              getBookNumbersOfBooks, getBookPrice;
    EXIT WHEN prc_books_cursor%NOTFOUND;

    -- Выводим информацию о книге
    DBMS_OUTPUT.PUT_LINE('--------------------------------');
    DBMS_OUTPUT.PUT_LINE('Название книги: ' || getBookName);
    DBMS_OUTPUT.PUT_LINE('Количество страниц: ' || getBookPages);
    DBMS_OUTPUT.PUT_LINE('ISBN: ' || getBookISBN);
    DBMS_OUTPUT.PUT_LINE('Тип переплета: ' || getBookBinding);
    DBMS_OUTPUT.PUT_LINE('Год публикации: ' || getBookYearPublic);
    DBMS_OUTPUT.PUT_LINE('Идентификатор издательства: ' || getBookIDPublishHous);
    DBMS_OUTPUT.PUT_LINE('Язык книги: ' || getBookLanguage);
    DBMS_OUTPUT.PUT_LINE('Описание книги: ' || getBookDescript);
    DBMS_OUTPUT.PUT_LINE('Источник изображения: ' || getBookImageSoursce);
    DBMS_OUTPUT.PUT_LINE('Количество книг: ' || getBookNumbersOfBooks);
    DBMS_OUTPUT.PUT_LINE('Цена книги: ' || getBookPrice);
    DBMS_OUTPUT.PUT_LINE('--------------------------------');
  END LOOP;

  CLOSE prc_books_cursor;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Нету книги с таким автором ' || p_AuthorName);
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Возникла ошибка ' || SQLERRM);
END;
                                                    
EXEC  GET_BOOK_BYAUTHOR ('Джордж Оруэлл');                                                   

                                                     --ФИЛЬТРАЦИЯ по ЯЗЫКУ                                                   
                                                    
CREATE OR REPLACE PROCEDURE Get_Book_ByLanguage(
  p_Language IN Book.Book_Language%TYPE
) AS
  prc_books_cursor SYS_REFCURSOR;
  getBookName Book.Book_Name%TYPE ;
  getBookPages Book.Page_Number%TYPE;
  getBookISBN Book.ISBN%TYPE ;
  getBookBinding Book.BookBindingType%TYPE;
  getBookYearPublic Book.Year_Of_Publication%TYPE;
  getBookDescript Book.Book_Description%TYPE;
  getBookImageSoursce Book.Book_ImageSource%TYPE;
  getBookNumbersOfBooks Book.NumbersOfBooks%TYPE ;
  getBookPrice Book.Book_Prise%TYPE ;
BEGIN 
  OPEN prc_books_cursor FOR
    SELECT b.Book_Name, b.Page_Number, b.ISBN, b.BookBindingType, b.Year_Of_Publication,
           b.Book_Description, b.Book_ImageSource, b.NumbersOfBooks, b.Book_Prise
    FROM Book b
    WHERE b.Book_Language = p_Language;

  -- Очищаем буфер DBMS_OUTPUT
  DBMS_OUTPUT.PUT_LINE('Книги на языке: ' || p_Language || ' ');

  LOOP
    FETCH prc_books_cursor INTO getBookName, getBookPages, getBookISBN, getBookBinding, getBookYearPublic,
                              getBookDescript, getBookImageSoursce,
                              getBookNumbersOfBooks, getBookPrice;
    EXIT WHEN prc_books_cursor%NOTFOUND;

    -- Выводим информацию о книге
    DBMS_OUTPUT.PUT_LINE('Название книги: ' || getBookName);
    DBMS_OUTPUT.PUT_LINE('Количество страниц: ' || getBookPages);
    DBMS_OUTPUT.PUT_LINE('ISBN: ' || getBookISBN);
    DBMS_OUTPUT.PUT_LINE('Тип переплета: ' || getBookBinding);
    DBMS_OUTPUT.PUT_LINE('Год публикации: ' || getBookYearPublic);
    DBMS_OUTPUT.PUT_LINE('Описание книги: ' || getBookDescript);
    DBMS_OUTPUT.PUT_LINE('Источник изображения: ' || getBookImageSoursce);
    DBMS_OUTPUT.PUT_LINE('Количество книг: ' || getBookNumbersOfBooks);
    DBMS_OUTPUT.PUT_LINE('Цена книги: ' || getBookPrice);
    DBMS_OUTPUT.PUT_LINE('--------------------------------');
  END LOOP;

  CLOSE prc_books_cursor;

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Нету книги на таком языку: ' || p_Language);
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Возникла ошибка: ' || SQLERRM);
END;
                                                    
EXEC GET_BOOK_BYLANGUAGE('английский');                                            
                                                                                   
                                                ---ПРОВЕРКА наличия определенной книги  

       -------------------  с курсором ----------------
CREATE OR REPLACE PROCEDURE CheckBookAvailabilityCURS(BookName IN VARCHAR2)
AS
  CURSOR c_book IS
    SELECT ID_Book, Book_Name, NumbersOfBooks
    FROM Book
    WHERE Book_Name = BookName AND NumbersOfBooks > 0;
  
  v_book_id Book.ID_Book%TYPE;
  v_book_name Book.Book_Name%TYPE;
  v_numbers_of_books Book.NumbersOfBooks%TYPE;
BEGIN
  OPEN c_book;
  FETCH c_book INTO v_book_id, v_book_name, v_numbers_of_books;
  
  IF c_book%FOUND THEN
    -- Можно выполнить дополнительные действия с полученными данными
    -- Пример вывода результатов
    DBMS_OUTPUT.PUT_LINE('Book ID: ' || v_book_id);
    DBMS_OUTPUT.PUT_LINE('Book Name: ' || v_book_name);
    DBMS_OUTPUT.PUT_LINE('Numbers of Books: ' || v_numbers_of_books);
  ELSE
    DBMS_OUTPUT.PUT_LINE('Книга отсутствует или недоступна.');
  END IF;
  
  CLOSE c_book;
END;
  EXEC  CheckBookAvailabilityCURS('NO book');  
       
       
       
       
CREATE OR REPLACE PROCEDURE InsertOrderInf(
  p_ID_Order IN OrderInf.ID_Order%TYPE,
  p_ID_User IN OrderInf.ID_User%TYPE,
  p_Order_Date IN OrderInf.Order_Date%TYPE,
  p_Delivery_Time IN OrderInf.Delivery_Time%TYPE,
  p_ID_Orders IN Orders.ID_Orders%TYPE,
  p_ID_Book IN Orders.ID_Book%TYPE,
  p_NumberOrderedBooks IN Orders.NumberOrderedBooks%TYPE
)
IS
  v_error_message VARCHAR2(200); -- Переменная для хранения сообщения об ошибке
  v_Price Book.Book_Prise%TYPE; -- Переменная для хранения цены книги
  v_Amount OrderInf.Amount%TYPE; -- Переменная для хранения значения Amount
BEGIN
  -- Получение цены книги из таблицы Book
  SELECT Book_Prise INTO v_Price FROM Book WHERE ID_Book = p_ID_Book;  
  -- Рассчет Amount на основе цены и количества заказанных книг
  v_Amount := v_Price * p_NumberOrderedBooks;
  
  -- Вставка данных в таблицу OrderInf
  INSERT INTO OrderInf(ID_Order, ID_User, Order_Date, Delivery_Time, Amount)
  VALUES (p_ID_Order, p_ID_User, p_Order_Date, p_Delivery_Time, v_Amount);
  
  -- Вставка данных в таблицу Orders
  INSERT INTO Orders(ID_Orders, ID_Book, NumberOrderedBooks)
  VALUES (p_ID_Orders, p_ID_Book, p_NumberOrderedBooks);
  
  COMMIT; -- Фиксация изменений
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
     v_error_message := SQLERRM; -- Получение сообщения об ошибке
    ROLLBACK; -- Откат транзакции
      ROLLBACK; -- Откат транзакции
  WHEN OTHERS THEN
      DBMS_OUTPUT.PUT_LINE('Ошибка при вставке данных: ' || v_error_message);
    ROLLBACK; -- Откат транзакции
    
END;
                                            
Exec InsertOrderInf(1, 1, SYSDATE, SYSDATE+2, 1, 2, 1);  

       
                                              