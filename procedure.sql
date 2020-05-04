create or replace PROCEDURE r_update_facture_value (p_id_facture IN FACTURES.ID_FACTURE%TYPE) 
    /*
    Ta procedura oblicza wartosc faktury.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.01/04    01/04/2020   b.kicior   Utworzenie procedury. 
	1.0.01/04    01/04/2020   b.kicior   Utworzenie podstawowych funkcjonalnosci. 
    */
AS v_temp_value NUMBER;
BEGIN
    SELECT sum(VALUE_COST) INTO v_temp_value
    FROM POSITIONS
    WHERE id_facture = p_id_facture;
    IF v_temp_value > 0 THEN
        UPDATE factures
        SET value = v_temp_value,
        ID_VALUE_TYPE = 1
        WHERE id_facture = p_id_facture;
    ELSE 
        UPDATE factures
        SET value = 'BrakDanych'
        WHERE id_facture = p_id_facture;
    END IF;
    COMMIT;
END r_update_facture_value;
/


CREATE OR REPLACE PROCEDURE R_UPDATE_WAREHOUSE_STATE (OPERATION IN VARCHAR2,
change_amount IN NUMBER,
p_id_warehouse IN warehouse.id_warehouse%TYPE) 
    /*
    Ta procedura sluzy do zmiany stanu magazynowego.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.01/04    01/04/2020   b.kicior   Utworzenie procedury. 
	1.0.01/04    01/04/2020   b.kicior   Utworzenie podstawowych funkcjonalnosci. 
    */
AS v_temp_amount NUMBER;
BEGIN
    CASE 
    WHEN OPERATION='add' THEN           
        UPDATE WAREHOUSE
           SET PRODUCT_AMOUNT = PRODUCT_AMOUNT + CHANGE_AMOUNT
         WHERE ID_WAREHOUSE = P_ID_WAREHOUSE;
         COMMIT;         
    WHEN OPERATION='reduce' THEN
        SELECT PRODUCT_AMOUNT
          INTO v_temp_amount
          FROM warehouse
         WHERE id_warehouse = p_id_warehouse;         
        IF v_temp_amount >= change_amount THEN       
            UPDATE WAREHOUSE
               SET PRODUCT_AMOUNT = PRODUCT_AMOUNT - CHANGE_AMOUNT
             WHERE ID_WAREHOUSE = P_ID_WAREHOUSE; 
             COMMIT;
        ELSE dbms_output.put_line ('Zbyt maly stan magazynowy');
        END IF;       
    ELSE 
        dbms_output.put_line ('Bledne dane wejsciowe'); 
    END CASE;    
END R_UPDATE_WAREHOUSE_STATE;
/

create or replace procedure salary_increase is 
    /*
    Ta procedura zwieksza pensje pracownikow.
    Dla pracownikow zatrudnionych na umowe o prace, aktualizuje pensje do nowej wartosci.
    Zwieksza procentowo wysokosc pensji.
    Potencjal na pakiet.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.16/04    16/04/2020   b.kicior   Utworzenie procedury. 
    */
begin
    null;
end;
/

create or replace procedure update_value_facture ( v_id_facture_in integer ) 
    /*
    Ta procedura aktualizuje wartość faktury. 
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.16/04    16/04/2020   b.kicior   Utworzenie procedury. 
    1.1.16/04    16/04/2020   b.kicior   Utworzenie funkcjonalnosci.
    */
is 
    v_count_updated integer;
BEGIN
    update factures
    set value = f_get_facture_value(v_id_facture_in)
    where id_facture = v_id_facture_in;
    v_count_updated := SQL%rowcount; 
    DBMS_OUTPUT.PUT_LINE('Updated: '|| v_count_updated || ' rows.');    
END;

create or replace FUNCTION get_facture_value (v_id_facture_in INTEGER) 
/*
    Ta funkcja zwraca calkowita wartość faktury na podstawie id_facture(dla danego uzytkownika).
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.16/04   16/04/2020   b.kicior   Utworzenie funkcji. 
    1.1.16/04   16/04/2020   b.kicior   Dodanie funkcjonalnosci.
    ------------------------------------------------------------------------------------------------------
*/ 
RETURN NUMBER IS
    v_value_facture   NUMBER(10,2);
BEGIN
    SELECT SUM(value_cost)
    INTO v_value_facture
    FROM positions
    WHERE id_facture = v_id_facture_in;
    --DBMS_OUTPUT.PUT_LINE('Value of facture: '||v_id_facture_in||' is: '|| v_value_facture);
    RETURN v_value_facture;
EXCEPTION 
    WHEN OTHERS THEN
    raise_application_error(-20004, 'Wystapil nieznany wyjatek! ERROR: '||SQLERRM||' '||SQLCODE);
END get_facture_value;
/


create or replace PROCEDURE add_client 
/*
Ta procedura sluży do dodawania kontrahentów. Przed dodaniem przeprowadza walidacje parametrów.
-----------------------------------------------------------------------------------------------
    VERSION   DATE         AUTHOR     DESCRIPTION
    1.0       13/04/2020   b.kicior   Stworzenie procedury
    TODO 
    Dodanie walidacje
    Sprawdzanie kursorem
    Utworzenie wyjatkow
-----------------------------------------------------------------------------------------------
Example for run procedure: 
exec p_add_client('Kuba', 'Wrzosek', '92081467517', sysdate, 1);
*/
(fname_in IN VARCHAR2,
lname_in IN VARCHAR2, 
pesel_in IN NUMBER,
date_add_in IN DATE,
id_user_in IN NUMBER)
IS
v_count_pesel INTEGER;
BEGIN 
    select count(*) into v_count_pesel from clients where pesel = pesel_in and id_user = id_user_in;
    IF v_count_pesel > 0 THEN 
        dbms_output.put_line('Podany kontrahent istnieje już dla wybranego użytkownika.');
        dbms_output.put_line('Klient nie zostal dodany.');
    ELSE 
        INSERT INTO CLIENTS (fname, lname, pesel, date_add, id_user) VALUES (fname_in, lname_in, pesel_in, date_add_in, id_user_in);
        dbms_output.put_line('Klient poprawnie dodany.');
    END IF;
/*
EXCEPTION
    WHEN OTHER THEN 
    dbms_output.put_line('Problem z wprowadzaniem danych.');
*/
END add_client;
/
create or replace PROCEDURE ADD_USER
(v_email_in VARCHAR2, v_pass_in VARCHAR2 /*add for user_firm*/) 
IS
    /*
    Ta procedura sluzy do dodawania uzytkownikow systemu.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.16/04    16/04/2020   b.kicior   Utworzenie procedury. 
    1.0.16/04    16/04/2020   b.kicior   Utworzenie podstawowych funkcjonalności. 
    ------------------------------------------------------------------------------------------------------
    */
    err_user_exist EXCEPTION;
    err_wrong_data EXCEPTION; 
    v_temp_email VARCHAR2(20);
    insert_count integer;
BEGIN

    IF f_check_user_exist(v_email_in) = 'NOTEXIST' THEN
        INSERT INTO USERS(EMAIL, PASS) VALUES(v_email_in, v_pass_in);
        insert_count := SQL%rowcount;
        DBMS_OUTPUT.PUT_LINE('Do tabeli users zainsertowano '||insert_count||' wiersz.');
    ELSIF f_check_user_exist(v_email_in) = 'EXIST' THEN
        raise err_user_exist;
    ELSE
        raise err_wrong_data;
    END IF;

EXCEPTION
    WHEN err_wrong_data THEN
        raise_application_error(-20501, 'Nieprawidlowe dane! ERROR: '||SQLERRM||' '||SQLCODE);
    WHEN err_user_exist THEN
        raise_application_error(-20502, 'Uzytkownik juz istnieje! ERROR: '||SQLERRM||' '||SQLCODE);
    WHEN OTHERS THEN
        raise_application_error(-20503, 'Wystapil nieznany wyjatek! ERROR: '||SQLERRM||' '||SQLCODE);
/* 
TO RUN PROCEDURE

*/
END ADD_USER;
/

create or replace PROCEDURE ADD_ORDER
IS
    /*
    Ta procedura sluzy do dodawania zamówień.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie procedury. 
    ------------------------------------------------------------------------------------------------------
    */
BEGIN      
    NULL;
END ADD_ORDER;
/



