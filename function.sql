CREATE OR REPLACE FUNCTION f_check_user_exist(v_email_in IN VARCHAR2)
    /*
    Ta funkcja sprawdza na podstawie email czy w systemie istnieje aktywny uzytkownik.
    Używana podczas rejestracji użytkownika.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.16/04    16/04/2020   b.kicior   Utworzenie funkcji. 
    1.0.16/04    16/04/2020   b.kicior   Utworzenie podstawowych funkcjonalności. 
    ------------------------------------------------------------------------------------------------------
    */
RETURN VARCHAR2 IS
    err_unknown EXCEPTION;
    v_temp_email VARCHAR2(20);
BEGIN
    SELECT count(*) INTO v_temp_email FROM users WHERE upper(email) = upper(v_email_in) and status = 1;
    CASE
    WHEN v_temp_email > 0 THEN RETURN 'EXIST';
    WHEN v_temp_email <= 0 THEN RETURN 'NOTEXIST';
    ELSE raise err_unknown;
    END CASE;
EXCEPTION
    WHEN err_unknown THEN 
        raise_application_error(-20510, 'Wystapil problem z wprowadzonymi danymi! ERROR: '||SQLERRM||' '||SQLCODE);
    WHEN OTHERS THEN
        raise_application_error(-20500, 'Wystapil nieznany wyjatek! ERROR: '||SQLERRM||' '||SQLCODE);
END f_check_user_exist;
/



CREATE OR REPLACE FUNCTION f_check_client_exist ( v_pesel_in NUMBER,v_id_user_in INTEGER ) RETURN BOOLEAN IS 
    /*
    Ta funkcja sprawdza czy dla danego użytkownika isnieja klienci o wskazanym numerze pesel. 
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.15/04    15/04/2020   b.kicior   Utworzenie podstawowych funkcjonalności. 
    ------------------------------------------------------------------------------------------------------
    */
    CURSOR c_client_search 
    IS
        SELECT *
        FROM clients
        WHERE pesel = v_pesel_in
        AND id_user = v_id_user_in
        AND status = 1;
    v_flag_out boolean;
    v_temp_client   clients%rowtype; --TO ZMIENIC NA VAARAY
BEGIN
    OPEN c_client_search;
    FETCH c_client_search INTO v_temp_client;
		IF c_client_search%found THEN
			v_flag_out := TRUE;
			RETURN v_flag_out;
		ELSE
			v_flag_out := FALSE;
			RETURN v_flag_out;
		END IF;
    CLOSE c_client_search;
END f_check_client_exist;
/


CREATE OR REPLACE FUNCTION f_get_id_facture ( v_facture_name_in VARCHAR2, v_id_user_in INTEGER)
/*
    Ta funkcja zwraca id_facture na podstawie nazwy faktury(dla danego uzytkownika).
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.16/04   16/04/2020   b.kicior   Utworzenie funkcji. 
    1.1.16/04   16/04/2020   b.kicior   Dodanie funkcjonalnosci.
    ------------------------------------------------------------------------------------------------------
*/ 
RETURN INTEGER IS
    err_facture_not_exist EXCEPTION; 
    v_id_facture INTEGER;
    CURSOR c_get_facture_id IS
        SELECT id_facture
        FROM factures
        WHERE upper(facture_name) = upper(v_facture_name_in)
        AND id_user = v_id_user_in 
        AND status = 1;
BEGIN
    OPEN c_get_facture_id;
    FETCH c_get_facture_id INTO v_id_facture;
        IF c_get_facture_id%NOTFOUND THEN
            RAISE err_facture_not_exist;
        ELSE 
            RETURN v_id_facture;
            --DBMS_OUTPUT.PUT_LINE(ID_FACTURE);
        END IF;
    CLOSE c_get_facture_id;
EXCEPTION
    WHEN err_facture_not_exist THEN
        raise_application_error(-20001, 'Faktura o tym numerze nie istnieje! ERROR: '||SQLERRM||' '||SQLCODE);
    WHEN OTHERS THEN
        raise_application_error(-20002, 'Wystapil nieznany wyjatek! ERROR: '||SQLERRM||' '||SQLCODE);
END f_get_id_facture;
/


create or replace FUNCTION f_x_get_facture_value ( v_facture_name_in VARCHAR2,v_id_user_in INTEGER ) 
/*
    Ta funkcja zwraca calkowita wartość pozycji faktury na podstawie nazwy faktury(dla danego uzytkownika).
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
    WHERE id_facture = f_get_id_facture(v_facture_name_in,v_id_user_in);
    --DBMS_OUTPUT.PUT_LINE('Value of facture: '||v_facture_name_in||' is: '|| v_value_facture);
    RETURN v_value_facture;
EXCEPTION 
    WHEN OTHERS THEN
    raise_application_error(-20003, 'Wystapil nieznany wyjatek! ERROR: '||SQLERRM||' '||SQLCODE);
END f_x_get_facture_value;
/

create or replace FUNCTION f_get_facture_value (v_id_facture_in INTEGER) 
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
END f_get_facture_value;
/
