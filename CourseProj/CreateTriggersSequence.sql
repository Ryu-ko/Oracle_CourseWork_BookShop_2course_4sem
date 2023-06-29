  -----------------—Œ«ƒ¿Õ»≈ œŒ—À≈ƒŒ¬¿“≈À‹ÕŒ—“≈… » “–»√√≈–Œ¬   Õ»Ã---------------------
----triggers ans sequence
   create sequence author_sequence
            start with 1
            increment by 1;

Create or replace trigger AuthSequence
    before insert on Author
        FOR EACH ROW
        begin
            SELECT author_sequence.nextval into :new.ID_Author from DUAL;
        end;
        
                  ---------------------
  create sequence genre_sequence
            start with 1
            increment by 1;

Create or replace trigger GentSeq
    before insert on Genre
        FOR EACH ROW
        begin
            SELECT genre_sequence.nextval into :new.GenreCode from DUAL;
        end;

                        ---------------------
        create sequence PublisherHouse_sequence
            start with 1
            increment by 1;

Create or replace trigger PublisherHouseSeq
    before insert on PublisherHouse
        FOR EACH ROW
        begin
            SELECT PublisherHouse_sequence.nextval into :new.ID_PublishingHouse from DUAL;
        end;

                        ----------!!!-----------
        create sequence UserInf_sequence
            start with 1
            increment by 1;

Create or replace trigger UserInfSeq
    before insert on UserInf
        FOR EACH ROW
        begin
            SELECT UserInf_sequence.nextval into :new.ID_User from DUAL;
        end;

                        ---------------------
        create sequence UserAccount_sequence
            start with 1
            increment by 1;

Create or replace trigger UserAcount
    before insert on UserAccount
        FOR EACH ROW
        begin
            SELECT UserAccount_sequence.nextval into :new.ID_Account from DUAL;
        end;

                        --------------------- 
        create sequence UserAccountID_sequence
            start with 1
            increment by 1;

Create or replace trigger UserAcountUserID
    before insert on UserAccount
        FOR EACH ROW
        begin
            SELECT UserAccountID_sequence.nextval into :new.ID_UserAc from DUAL;
        end;
        
                         ---------------------                        
        create sequence Book_sequence
            start with 1
            increment by 1;

Create or replace trigger BookSeq
    before insert on Book
        FOR EACH ROW
        begin
            SELECT Book_sequence.nextval into :new.ID_Book from DUAL;
        end;

                        ---------------------   
/*
Drop sequence UserAccountID_sequence;
Drop sequence UserAccount_sequence;
Drop sequence UserInf_sequence;
      
       drop sequence Book_sequence;
      drop sequence PublisherHouse_sequence;
       drop sequence genre_sequence;
     drop sequence author_sequence;
       */
       -------------------------