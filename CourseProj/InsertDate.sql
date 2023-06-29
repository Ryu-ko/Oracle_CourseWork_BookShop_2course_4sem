 --3) db13 ADMINCORE-12345 - вставка всех данных

INSERT ALL
    INTO Author (ID_Author, FullName, BirthYear, BirthCountry) VALUES (NULL, 'Михаил Афанасьевич Булгаков', 1891, 'Киев')
    INTO Author (ID_Author, FullName, BirthYear, BirthCountry) VALUES (NULL, 'Джордж Оруэлл', 1903, 'Великобритания')
    INTO Author (ID_Author, FullName, BirthYear, BirthCountry) VALUES (NULL, 'Федор Михайлович Достоевский', 1821, 'Москва')
    INTO Author (ID_Author, FullName, BirthYear, BirthCountry) VALUES (NULL, 'Джейн Остен', 1775, 'Великобритания')
    INTO Author (ID_Author, FullName, BirthYear, BirthCountry) VALUES (NULL, 'Эрих Мария Ремарк', 1898, 'Германия')
    INTO Author (ID_Author, FullName, BirthYear, BirthCountry) VALUES (NULL, 'Виктор Мари Гюго', 1802, 'Франция')
    INTO Author (ID_Author, FullName, BirthYear, BirthCountry) VALUES (NULL, 'Стивен Кинг', 1947, 'США')
    INTO Author (ID_Author, FullName, BirthYear, BirthCountry) VALUES (NULL, 'Питер Страуб', 1943, 'Пенсильвания')
    INTO Author (ID_Author, FullName, BirthYear, BirthCountry) VALUES (NULL, 'Анна Устинова', 1959, 'Москва')
    INTO Author (ID_Author, FullName, BirthYear, BirthCountry) VALUES (NULL, 'Антон Иванов', 1950, 'Москва')
SELECT * FROM DUAL;    
commit;       
SELECT * FROM Author;  
select * from Genre;
    
INSERT ALL
    INTO Genre (GenreCode, NameGenre) values (NULL, 'Историческая проза')
    INTO Genre (GenreCode, NameGenre) values (NULL, 'Трагедия')
    INTO Genre (GenreCode, NameGenre) values (NULL, 'Роман')
    INTO Genre (GenreCode, NameGenre) values (NULL, 'Любовный роман')
    INTO Genre (GenreCode, NameGenre) values (NULL, 'Притча')
    INTO Genre (GenreCode, NameGenre) values (NULL, 'Роман о политике')
    INTO Genre (GenreCode, NameGenre) values (NULL, 'Рассказ')
    INTO Genre (GenreCode, NameGenre) values (NULL, 'Повесть')
    INTO Genre (GenreCode, NameGenre) values (NULL, 'Комедия') 
    INTO Genre (GenreCode, NameGenre) values (NULL, 'Детектив')
    INTO Genre (GenreCode, NameGenre) values (NULL, 'Ужасы')
    INTO Genre (GenreCode, NameGenre) values (NULL, 'Триллер')
SELECT * FROM DUAL;
commit;
select * from Genre;
select * from 

INSERT ALL
    INTO PublisherHouse (ID_PublishingHouse, PublishingHouse_Name) VALUES (NULL, 'АСТ')
    INTO PublisherHouse (ID_PublishingHouse, PublishingHouse_Name) VALUES (NULL, 'Азбука')
    INTO PublisherHouse (ID_PublishingHouse, PublishingHouse_Name) VALUES (NULL, 'Эксмо')
select * from dual;   
commit;
select * from PublisherHouse;       
      

INSERT ALL
    INTO UserInf (ID_User, User_Name, User_Email, User_Numer, User_Sex, User_BirthYear )
        VALUES (NULL,'Палазник Арсений Викторович', 'Palazzzz@yandex.ru', '292388534', 'М', DATE'2004-04-14')
    
   INTO UserInf (ID_User, User_Name, User_Email, User_Numer, User_Sex, User_BirthYear )
     VALUES (NULL,'Вакуленчик Владислав Сергеевич', 'VladislaVVV@yandex.ru ', '294466548', 'М', DATE'2003-06-13')
     
     INTO UserInf (ID_User, User_Name, User_Email, User_Numer, User_Sex, User_BirthYear )
   VALUES (NULL,'admin', 'adminBD@yandex.ru', '----', 'Ж', DATE'2002-10-27') 
   INTO UserInf (ID_User, User_Name, User_Email, User_Numer, User_Sex, User_BirthYear)
       VALUES (NULL,'Халалеенко Андрей Николаевич', 'Halwaaaa@yandex.ru', '297900210', 'М', DATE'2003-09-16')
 INSERT ALL  INTO UserInf (ID_User, User_Name, User_Email, User_Numer, User_Sex, User_BirthYear)
    VALUES (NULL,'Леонец Алексей Олегович', 'LEXA@yandex.ru', '298834241', 'М', DATE'2004-07-13')
    
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
                VALUES (NULL, 'Человек, который смеется', 704, '978-5-17-091569-9', 'Мягкая обложка', 2016,
                1, 'Русский',
                '"Человек, который смеется" – один из наиболее известных романов Виктора Гюго. В центре повестования Гуинплен, в раннем детстве похищеный бандитами, до неузнаваемости обезобразившими его лицо. Судьба преподнесла ему немало испытаний, но душу не искалечила – преодолев нелёгкий путь от ярмарочного актёра до лорда и члена парламента, он смог остаться честным и благородным человеком... ',
                '/Imgs/Gugo_LaughtPerson.jpg', 15 , 12.26)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, 'Отверженные ',704, '978-5-389-06787-5', 'Твердый переплет', 2013,
                2, 'Русский', 
                'Роман-эпопея Виктора Гюго "Отверженные" (1862) – огромный текст, без которого невозможно представить себе духовную историю XIX века. В сущности, это "война и мир" великого французского классика, только здесь находит отражение не противостояние вражеских армий, но война, которую ведут между собой добро и зло в человеческой душе и в обществе. При создании "Отверженных" автора, по его словам, прежде всего волновали три темы: "угнетение мужчины... падение женщины по причине голода, увядание ребенка вследствие мрака невежества", что отразилось в историях главных действующих лиц: каторжника Жана Вальжана, Фантины и Козетты. Фантастически закрученная авантюрная фабула заставляет следить с неотрывным вниманием за событиями, которые разворачиваются на улицах старого Парижа, в трущобах и на баррикадах. Не случайно в XX веке насчитывается десятки экранизаций "Отверженных" – от немой ленты "На баррикадах" (1907) до последнего фильма Тома Хупера.',
                '/Imgs/otverjenii.jpg ', 8 , 8.21)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, 'Триумфальная арка ', 640, '978-5-17-105398-7', 'Мягкая обложка', 2017,
                1, 'Русский ', 
                '"Триумфальная арка" – пронзительная история любви всему наперекор, любви, приносящей боль, но и дарующей бесконечную радость. Место действия – Париж накануне Второй мировой войны. Герой – беженец из Германии, без документов, скрывающийся и от французов, и от нацистов, хирург, спасающий человеческие жизни. Героиня – итальянская актриса, окруженная поклонниками, вспыльчивая, как все артисты, прекрасная и неотразимая. И время, когда влюбленным довелось встретиться, и город, пронизанный ощущением надвигающейся катастрофы, становятся героями этого романа. "Триумфальная арка" была дважды экранизирована и по-прежнему покоряет читателей всего мира.',
                '/Imgs/Triumarka.jpg ', 22 , 15.38)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, 'Ночь в Лиссабоне ', 320, '978-5-17-100857-4', '	Мягкая обложка', 2019,
                1, 'Русский', 
                '"Ночь в Лиссабоне" (1962) – трагический, проникновенный роман Эриха Марии Ремарка о Второй мировой войне. Это не только одна ночь в Лиссабоне, в которую и уместился весь этот рассказ. Это не просто случайная встреа двух отчаявшихся людей, один из которых тщетно пытается найти два билета на параход до Америки, а другой – ищет собеседника, чтобы излить ему душу. Это натоящая исповедь отважного, смелого человека, на долю которого выпали немыслимые по тяжести испытания. Это история целого поколения людей, столкнувшихся с войной, попавших в тиски фашизма. Это еще и история любви, перед которой отступает даже смерть.',
                '/Imgs/Lissabon.jpg ', 43 , 13.11)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, 'Гордость и предубеждение ', 416, '978-5-04-105469-4', 'Твердый переплет', 2022,
                3, 'Русский', 
                'На фоне быта английского провинциального общества, нравы которого автор описывает с тонкой иронией и удивительной наблюдательностью, разворачивается великолепный спор между гордым мистером Дарси и предвзятой Элизабет Беннет. Благодаря изящному слогу писательницы страница за страницей в главной героине романа расцветает чувственная и невинная любовь, не знающая никаких преград.',
                '/Imgs/Gordost.jpg ', 25 , 17.34)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, 'Эмма', 512, '978-5-17-105077-1', 'Мягкая обложка', 2018,
                1, 'Русский', 
                'У Эммы Вудхаус есть все – любящий отец, состояние, популярность в обществе, красота и острый ум, – нет только мужа. Но она и не торопится связывать себя узами брака, предпочитая заниматься налаживанием личной жизни подруг и приятельниц, благодаря чему и попадает постоянно в самые неожиданные и забавные ситуации...',
                '/Imgs/Emma.jpg ', 2 , 11.86)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, 'Преступление и наказание',608, '978-5-389-04926-0', 'Твердый переплет', 2019,
                2, 'Русский', 
                'Одно из "краеугольных" произведений русской и мировой литературы, включенный во все школьные и университетские программы, неоднократно экранизированный роман Достоевского "Преступление и наказание" ставит перед читателем важнейшие нравственно-мировоззренческие вопросы – о вере, совести, грехе и об искуплении через страдание. Опровержение преступной "идеи-страсти", "безобразной мечты", завладевшей умом Родиона Раскольникова в самом "умышленном" и "фантастическом" городе на свете, составляет основное содержание этой сложнейшей, соединившей в себе несколько различных жанров книги. Задуманный как "психологический отчет одного преступления", роман Достоевского предстал перед читателем грандиозным художественно-философским исследованием человеческой природы, христианской трагедией о смерти и воскресении души.',
                '/Imgs/PrestuplNakaz.jpg ', 10 , 8.21)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, 'Идиот', 640, '978-5-389-04730-3', 'Твердый переплет', 2012,
                2, 'Русский', 
                '"Главная идея – писал Ф. М. Достоевский о своем романе "Идиот", – изобразить положительно-прекрасного человека. Труднее этого нет ничего на свете..." Не для того ли писатель явил миру "князя-Христа", чтобы мы не забывали: "Страдание есть главнейший и, может быть, единственный закон бытия всего человечества". Каждое новое поколение по-своему воспринимает классику и пытается дать собственные ответы на вечные вопросы бытия. Об этом свидетельствуют и известные экранизации романа, его сценические версии. В России запоминающиеся образы князя Мышкина создали Ю. Яковлев, И. Смоктуновский, Е. Миронов.',
                '/Imgs/Idiot.jpg ', 10 , 8.21)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, 'Игрок', 540, '978-5-17-103090-2', 'Мягкая обложка', 2022,
                1, 'Русский', 
                'Роману "Игрок" присущи сильные автобиографические мотивы, ведь азартным игроком был сам Достоевский. История создания этой книги очень интересна: проигравшийся до последнего гроша в Висбадене, отчаянно нуждающийся в деньгах писатель заключил с издательством контракт, согласно которому должен был написать роман... за 26 дней. Эти совершенно неправдоподобные сроки вынудили Достоевского, впервые в жизни, воспользоваться услугами секретаря-стенографистки, которой он надиктовывал текст. Так в жизнь гения вошла молодая Анна Сниткина – женщина, которой суждено было стать его женой и музой...',
                '/Imgs/Gamer.jpg ', 18 , 8.84)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, 'Скотный Двор. Эссе',210, '978-5-04-122320-5', 'Твердый переплет', 2021,
                3, 'Русский', 
                'Повесть-притча "Скотный двор" полна острого сарказма и политической сатиры. Обитатели фермы олицетворяют самые ужасные людские пороки, а сама ферма становится символом тоталитарного общества. Как будут существовать в таком обществе его обитатели – животные, которых поведут на бойню?',
                '/Imgs/SkotnDvor.jpg ', 21 , 9.21)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, '1984', 320, '978-5-17-148844-4', 'Мягкая обложка', 2022,
                1, 'Русский', 
                'Своеобразный антипод второй великой антиутопии XX века "О дивный новый мир" Олдоса Хаксли. Что, в сущности, страшнее: доведенное до абсурда "общество появления" или доведенное до абсолюта "общество идеи"?',
                '/Imgs/1984.jpg ',3 , 11.86)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, 'Морфий', 320, '978-5-04-119085-9', 'Твердый переплет', 2023,
                3, 'Русский', 
                'Молодой врач, пристрастившийся к дозам морфина, превращается в пациента. Булгакову удалось пугающе подробно описать ощущения морфиниста, всю глубину отчаяния и бесконечную надежду на освобождение от разрушающей зависимости. Рассказы во многом основаны на опыте работы Булгакова врачом в сельской больнице, где будущий писатель, проводя сложнейшие операции, пытался осмыслить свое жизненное предназначение. "Морфий" – уникальный сборник рассказов Михаила Булгакова, который раскрывает важную, но не всем известную сторону жизни автора.',
                '/Imgs/Morphy.jpg ', 45 , 13.66)
    INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, 'Собачье сердце', 384, '978-5-389-06294-8', 'Твердый переплет', 2013,
                3, 'Русский', 
                'Повесть Михаила Булгакова «Собачье Сердце», написанная в 1925 году в Москве, является филигранным образцом острой сатирической фантастики того времени. В нем автор отразил свои идеи и убеждения по поводу того, нужно ли человеку вмешиваться в законы эволюции и к чему это может привести. Затронутая Булгаковым тема, остается актуальной и в современной реальной жизни и никогда не перестанет тревожить умы всего прогрессивного человечества.',
                '/Imgs/DogHeart.jpg ', 10 , 8.21)
                 INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, 'Талисман', 344, '5-17-027102-6', 'Твердый переплет', 2022,
                1, 'Русский', 
                'Jткрылись врата между современной Америкой и жестоким параллельным миром, и в привычную реальность ворвались чудовищные монстры, кровожадные убийцы - существа, в реальность которых невозможно поверить, пока не столкнешься с ними лицом к лицу. А тогда, возможно, станет уже слишком поздно... И только двенадцатилетний мальчик отваживается вступить в неравный бой с исчадиями Зла...',
                '/Imgs/talisman.jpg ', 10 , 20.21)
 
 INTO Book (ID_Book, Book_Name, Page_Number, ISBN, BookBindingType, Year_Of_Publication, 
                        Book_ID_PublishingHouse, Book_Language, Book_Description, Book_ImageSource, NumbersOfBooks, Book_Prise)
                VALUES (NULL, 'Тайна пропавшего академика', 150, '5-17-657342-6', 'Твердый переплет', 2013,
                3, 'Русский', 
                'Димка и Маша случайно оказываются свидетелями загадочного ночного происшествия. Двое неизвестных увозят среди ночи из дома знаменитого академика Положенцева. Начав самостоятельное расследование, Тайное братство кленового листа устанавливает: в похищении могло быть замешано сразу несколько человек.',
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


   ---работа с 100 000 строк   
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




