      --ДЛЯ АДМИНА
                                                   -- Получить информацию о Юзере
create or replace procedure GetUsersAccount (
     accusers OUT SYS_REFCURSOR
)
is
begin
     OPEN accusers FOR 
        SELECT ID_Account, Login, Password
        FROM UserAccount;
end;

VAR ACCCursor REFCURSOR;
EXEC GetUsersAccount(:ACCCursor);
PRINT ACCCursor;  
                         
                                                ---ДОБАВЛЕНИЕ  книг   
               
-- INSERT NEW BOOK

CREATE OR REPLACE PROCEDURE ADD_NEW_BOOK(     
    addBookName IN Book.Book_Name%TYPE ,
    addBookPages IN Book.Page_Number%TYPE ,
    addBookISBN IN Book.ISBN%TYPE ,
    addBookBinding IN Book.BookBindingType%TYPE ,
    addBookYearPublic IN Book.Year_Of_Publication%TYPE,
    addBookIDPublishHous IN Book.Book_ID_PublishingHouse%TYPE,
    addBookLanguage IN Book.Book_Language%TYPE ,
    addBookDescript IN Book.Book_Description%TYPE ,
    addBookImageSoursce IN Book.Book_ImageSource%TYPE ,
    addBookNumbersOfBooks IN Book.NumbersOfBooks%TYPE ,
    addBookPrice IN Book.Book_Prise%TYPE 
) 
IS 
    pr_book_id INTEGER; 
BEGIN 
        -- получаем новый уникальный идентификатор записи 
    INSERT INTO BOOK(ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise) VALUES (NULL, addBookName, addBookPages, addBookISBN, addBookBinding, addBookYearPublic, addBookIDPublishHous, addBookLanguage, addBookDescript, addBookImageSoursce, addBookNumbersOfBooks, addBookPrice); 
COMMIT; 
END;

    
  EXEC ADD_NEW_BOOK('NO count book', 200, '978-5-17-100857-4', 'Твердый переплет', 2020, 2 , 'английский', 'описанииеее', 'image.jpg', 0, 25);
      
                                                
                                                --ДОБАВЛЕНИЕ АВТОРОВ Разбиение строки для авторов
        CREATE OR REPLACE PROCEDURE ADD_AUTHORS(
            prc_author IN VARCHAR2, 
            prc_FullName in Author.FullName%type,
            prc_BirthYear in Author.BirthYear%type,
            prc_BirthCountry in Author.BirthCountry%type           
            )
        IS
          v_author VARCHAR2(2000) := prc_author; -- создаем новую переменную для разбиения строки
          v_i INTEGER := 1; -- счетчик для цикла WHILE
          v_pos INTEGER; -- позиция разделителя авторов
        BEGIN
          -- Разбиваем строку авторов на отдельные
          WHILE v_i <= LENGTH(v_author)
          LOOP
            v_pos := INSTR(v_author, ';', v_i); -- ищем позицию разделителя
            IF v_pos = 0 -- если разделитель не найден, то вставляем последнего автора и выходим из цикла
            THEN
            INSERT INTO Author(ID_Author, FullName, BirthYear, BirthCountry) VALUES (null, TRIM(SUBSTR(v_author, v_i)), prc_BirthYear, prc_BirthCountry);
           INSERT INTO Authors(ID_Author, ID_Book) VALUES ((SELECT MAX(ID_Author) FROM Author), (SELECT MAX(ID_Book) FROM Authors)); 
            EXIT;
            
            ELSE 
              INSERT INTO Author(ID_Author, FullName, BirthYear, BirthCountry) VALUES (null, TRIM(SUBSTR(v_author, v_i, v_pos - v_i)), prc_BirthYear, prc_BirthCountry);
               INSERT INTO Authors(ID_Author, ID_Book)VALUES ((SELECT MAX(ID_Author) FROM Author), (SELECT MAX(ID_Book) FROM Authors));
              v_i := v_pos + 1;
            END IF;
          END LOOP;
          COMMIT;
        END;
        

 Exec ADD_AUTHORS('Жук;Косминов', 'Full Name', 1980, 'Country');

select * from Author;

------------------------------------------------------------



                                                 --Разбиение строки для жанров
        CREATE OR REPLACE PROCEDURE ADD_GENRES(
            prc_genres IN VARCHAR2
        )
        IS
          v_genres VARCHAR2(2000) := prc_genres; -- создаем новую переменную для разбиения строки
          v_i INTEGER := 1; -- счетчик для цикла WHILE
          v_pos INTEGER; -- позиция разделителя жанров
        BEGIN
          -- Разбиваем строку жанров на отдельные жанры
          WHILE v_i <= LENGTH(v_genres)
          LOOP
            v_pos := INSTR(v_genres, ';', v_i); -- ищем позицию разделителя
            IF v_pos = 0 -- если разделитель не найден, то вставляем последний жанр и выходим из цикла
            THEN
                INSERT INTO Genre(GenreCode, NameGenre) VALUES (null, TRIM(SUBSTR(v_genres, v_i)));
              INSERT INTO Genres(ID_Book, GenresCode) VALUES ((SELECT MAX(ID_Book) FROM Book), (SELECT MAX(GenreCode) FROM Genre)); 
            EXIT;
            ELSE -- иначе вставляем жанр и продолжаем цикл
                INSERT INTO Genre(GenreCode, NameGenre) VALUES (null, TRIM(SUBSTR(v_genres, v_i, v_pos - v_i)));
               INSERT INTO Genres (ID_Book, GenresCode) VALUES ((SELECT MAX(ID_Book) FROM Book), (SELECT MAX(GenreCode) FROM Genre));
              v_i := v_pos + 1;
            END IF;
          END LOOP;
          COMMIT;
        END;
    
    EXEC ADD_GENRES('Genre1;Genre2;Genre3');
    Select * from Genre;
    
    

                                                 --ОБНОВЛЕНИЕ книг
CREATE OR REPLACE PROCEDURE UPDATE_BOOKINF( 
    proc_book_id IN Book.ID_Book%TYPE ,
    updateBookName IN Book.Book_Name%TYPE ,
    updateBookPages IN Book.Page_Number%TYPE ,
    updateBookISBN IN Book.ISBN%TYPE ,
    updateBookBinding IN Book.BookBindingType%TYPE ,
    updateBookYearPublic IN Book.Year_Of_Publication%TYPE,
    updateBookIDPublishHous IN Book.Book_ID_PublishingHouse%TYPE,
    updateBookLanguage IN Book.Book_Language%TYPE ,
    updateBookDescript IN Book.Book_Description%TYPE ,
    updateBookImageSoursce IN Book.Book_ImageSource%TYPE ,
    updateBookNumbersOfBooks IN Book.NumbersOfBooks%TYPE ,
    updateBookPrice IN Book.Book_Prise%TYPE 
) 
IS   
  book_exists NUMBER;
BEGIN 
  -- Проверяем наличие книги
  SELECT COUNT(*) INTO book_exists FROM Book WHERE ID_Book = proc_book_id;
  IF book_exists = 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Книга не найдена');
  ELSE
    UPDATE Book 
    SET Book_Name = updateBookName,
        Page_Number = updateBookPages,
        ISBN = updateBookISBN,
        BookBindingType = updateBookBinding,
        Year_Of_Publication = updateBookYearPublic,
        Book_ID_PublishingHouse = updateBookIDPublishHous,
        Book_Language = updateBookLanguage,
        Book_Description = updateBookDescript,
        Book_ImageSource = updateBookImageSoursce,
        NumbersOfBooks = updateBookNumbersOfBooks,
        Book_Prise = updateBookPrice
    WHERE ID_Book = proc_book_id;
        
    COMMIT;
        
    DBMS_OUTPUT.PUT_LINE('Информация о книге успешно обнавлена.');
  END IF;
  
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Ошибка! Книга не найдена');
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Ошибка: ' || SQLERRM);
END;

Select * from Book;
EXEC UPDATE_BOOKINF(22, 'Update Book2', 211,'5-17-657342-6', 'Мягкая обложка', 2018,3, 'русский', 'descr', 'img',2, 20);
                 
                  
                                                 --ОБНОВЛЕНИЕ  авторов 
            
CREATE OR REPLACE PROCEDURE UPDATE_Author(
    prc_BookId IN Book.ID_Book%type,
    prc_author IN VARCHAR2, 
    prc_FullName in Author.FullName%type,
    prc_BirthYear in Author.BirthYear%type,
    prc_BirthCountry in Author.BirthCountry%type       
    )
IS
  v_author VARCHAR2(2000) := prc_author; -- создаем новую переменную для разбиения строки
  v_i INTEGER := 1; -- счетчик для цикла WHILE
  v_pos INTEGER; -- позиция разделителя песен

BEGIN

DELETE (SELECT *
            FROM Authors aus
                INNER JOIN Author aur
                ON aus.ID_AUTHOR = aur.ID_AUTHOR
                    WHERE aus.ID_AUTHOR = prc_BookId);

  -- Разбиваем строку авторов на отдельных
  WHILE v_i <= LENGTH(v_author)
  LOOP
    v_pos := INSTR(v_author, ';', v_i); -- ищем позицию разделителя
    IF v_pos = 0 -- если разделитель не найден, то вставляем последнего автора и выходим из цикла
    THEN
    update Author set  FullName =  TRIM(SUBSTR(v_author, v_i)), BirthYear = prc_BirthYear, BirthCountry = prc_BirthCountry;
    update Authors set ID_Author = (SELECT MAX(ID_Author) FROM Author), ID_AUTHOR = prc_BookId;
    ELSE -- иначе вставляем автора и продолжаем цикл
        INSERT INTO Author(ID_Author, FullName, BirthYear, BirthCountry) VALUES (null, TRIM(SUBSTR(v_author, v_i, v_pos - v_i)), prc_BirthYear, prc_BirthCountry);
               INSERT INTO Authors(ID_Author, ID_Book)VALUES ((SELECT MAX(ID_Author) FROM Author), (SELECT MAX(ID_Book) FROM Authors));
        v_i := v_pos + 1;
    END IF;
  END LOOP;
  COMMIT;
END;

    EXEC  UPDATE_Author(22, 'Новый автор 1', 'Новое имя',1990,'Новая страна'); 
Select * from Author;
        
                        
                                                            --ДЛЯ АДМИНА     
                                                --Вывод всей инфы о КЛИЕНТАХ и их АККАУНТАХ
CREATE OR REPLACE PROCEDURE getUsersInf(
    usersi OUT SYS_REFCURSOR
)
IS
BEGIN
    OPEN usersi FOR 
        SELECT uAcc.ID_Account,uAcc.ID_UserAc, uAcc.Login ,uAcc.Password, uInf.User_Name, uInf.User_Email, uInf.User_Numer, uInf.User_Sex, uInf.User_BirthYear
        FROM UserAccount uAcc
             JOIN UserInf uInf ON uAcc.ID_UserAc = uInf.ID_User;
END;

--test
VAR userCurs REFCURSOR;
EXEC getUsersInf(:userCurs);
PRINT userCurs;




                            
                                                --Вывод всей инфы о ЗАКАЗАХ              
 CREATE OR REPLACE PROCEDURE AddOrder(
  p_ID_Order IN OrderInf.ID_Order%TYPE,
  p_ID_User IN OrderInf.ID_User%TYPE,
  p_Order_Date IN OrderInf.Order_Date%TYPE,
  p_Delivery_Time IN OrderInf.Delivery_Time%TYPE,
  p_Amount IN OrderInf.Amount%TYPE,
  p_ID_Book IN Book.ID_Book%TYPE,
  p_NumberOrderedBooks IN Orders.NumberOrderedBooks%TYPE
) AS
BEGIN
  -- Вставка информации о заказе в таблицу OrderInf
  INSERT INTO OrderInf (ID_Order, ID_User, Order_Date, Delivery_Time, Amount)
  VALUES (p_ID_Order, p_ID_User, p_Order_Date, p_Delivery_Time, p_Amount);
  
  -- Вставка информации о заказе и книге в таблицу Orders
  INSERT INTO Orders (ID_Orders, ID_Book, NumberOrderedBooks)
  VALUES (p_ID_Order, p_ID_Book, p_NumberOrderedBooks);
  
  COMMIT; -- Фиксация изменений в транзакции
  
  DBMS_OUTPUT.PUT_LINE('Order has been added. Order ID: '  p_ID_Order);
EXCEPTION
  WHEN OTHERS THEN
    -- Обработка ошибок
    ROLLBACK;
    DBMS_OUTPUT.PUT_LINE('Error: '  SQLERRM);
END;

CREATE OR REPLACE PROCEDURE GetPopularRecords (
  p_start_date IN TIMESTAMP,
  p_end_date IN TIMESTAMP
) AS
  v_records SYS_REFCURSOR;
  v_record_id Book.record_id%TYPE;
  v_artist_name Book.artist_name%TYPE;
  v_order_count NUMBER;
BEGIN
  OPEN v_records FOR
    SELECT r.record_id, r.artist_name,  COUNT(od.order_id) AS order_count
    FROM Record r
        JOIN Orders od ON r.record_id = od.record_id
        JOIN OrderInf o ON od.order_id = o.order_id
        WHERE o.order_date >= p_start_date AND o.order_date <= p_end_date
    GROUP BY r.record_id, r.artist_name, r.album_name
    ORDER BY order_count DESC;

  LOOP
    FETCH v_records INTO v_record_id, v_artist_name, v_album_name, v_order_count;
    EXIT WHEN v_records%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Record ID: '  v_record_id  ', Artist: '  v_artist_name  ', Album: '  v_album_name  ', Order Count: ' || v_order_count);
  END LOOP;

  CLOSE v_records;
END;



DECLARE
  v_current_date TIMESTAMP;
  v_past_date TIMESTAMP;
BEGIN
  -- Получение текущей даты и времени
  v_current_date := SYSTIMESTAMP;

  -- Вычитание 3 месяцев из текущей даты
  v_past_date := ADD_MONTHS(v_current_date, -2);

  -- Вызов процедуры с параметрами
  GetPopularRecords(v_past_date, v_current_date);

  -- Вывод завершенного сообщения
  DBMS_OUTPUT.PUT_LINE('Procedure has successfully completed.');
END;

CREATE OR REPLACE PROCEDURE GetPopularBooks (
  p_start_date IN TIMESTAMP,
  p_end_date IN TIMESTAMP
) AS
  v_books SYS_REFCURSOR;
  v_book_id Book.ID_Book%TYPE;
  v_book_name Book.Book_Name%TYPE;
  v_order_count NUMBER;
  v_total_order_cost NUMBER := 0;
  v_previous_order_cost NUMBER := 0;
BEGIN
  OPEN v_books FOR
    SELECT b.ID_Book, b.Book_Name, COUNT(o.ID_Orders) AS order_count, SUM(b.Book_Prise * o.NumberOrderedBooks) AS order_cost
    FROM Book b
    JOIN Orders o ON b.ID_Book = o.ID_Book
    JOIN OrderInf oi ON o.ID_Orders = oi.ID_Order
    WHERE oi.Order_Date >= p_start_date AND oi.Order_Date <= p_end_date
    GROUP BY b.ID_Book, b.Book_Name
    ORDER BY order_cost DESC;

  LOOP
    FETCH v_books INTO v_book_id, v_book_name, v_order_count, v_total_order_cost;
    EXIT WHEN v_books%NOTFOUND;

    DBMS_OUTPUT.PUT_LINE('Book ID: ' || v_book_id  ||', Book Name: ' ||v_book_name ||
                         ', Order Count: ' || v_order_count  ||', Order Cost: ' || v_total_order_cost);

    IF v_total_order_cost > v_previous_order_cost THEN
      DBMS_OUTPUT.PUT_LINE('Эта книга боелее популярна, тк сумма её заказов больше других');
    END IF;

    v_previous_order_cost := v_total_order_cost;
  END LOOP;

  CLOSE v_books;
END;

DECLARE
  v_start_date TIMESTAMP := TO_TIMESTAMP('2023-01-01 00:00:00', 'YYYY-MM-DD HH24:MI:SS');
  v_end_date TIMESTAMP := TO_TIMESTAMP('2023-12-31 23:59:59', 'YYYY-MM-DD HH24:MI:SS');
BEGIN
  GetPopularBooks(v_start_date, v_end_date);
END;












