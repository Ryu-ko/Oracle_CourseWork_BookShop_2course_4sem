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












