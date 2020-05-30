create or replace PACKAGE BODY PKG_ADD_CLIENT AS

    FUNCTION f_client_exist(v_pesel_in NUMBER) RETURN BOOLEAN 
    IS
        CURSOR c_client_search 
        IS
            SELECT *
              FROM clients
             WHERE pesel = v_pesel_in
               AND status = 1;
        v_flag_out boolean := FALSE;
        v_temp_client   clients%rowtype; --TO ZMIENIC NA VAARAY
    BEGIN
        OPEN c_client_search;
        FETCH c_client_search INTO v_temp_client;
    		IF c_client_search%found THEN
                --DBMS_OUTPUT.PUT_LINE('FALSE! Client with pesel: ' || v_pesel_in || ' already exist.');
                DBMS_OUTPUT.PUT_LINE('Client not exist: FALSE');
    			RETURN v_flag_out;
    		ELSE
    			v_flag_out := TRUE;
                DBMS_OUTPUT.PUT_LINE('Client not exist: TRUE');
                --DBMS_OUTPUT.PUT_LINE('TRUE! Client with pesel: ' || v_pesel_in || ' not exist.');
    			RETURN v_flag_out;
    		END IF;
        CLOSE c_client_search;
    END f_client_exist;

    PROCEDURE r_insert_client(v_fname clients.fname%type, v_lname clients.lname%type, v_pesel clients.pesel%type) IS
    	inserts_count    INTEGER := 0;
        validate_return  BOOLEAN;
        exist_return     BOOLEAN;
	BEGIN
        validate_return := f_validate_client(v_fname, v_lname, v_pesel);
        exist_return := f_client_exist(v_pesel);
        IF validate_return = TRUE AND exist_return = TRUE THEN
            INSERT INTO CLIENTS(fname, lname, pesel) VALUES(v_fname, v_lname, v_pesel);
            inserts_count := inserts_count + SQL%ROWCOUNT;
            DBMS_OUTPUT.PUT_LINE('Inserted ' || inserts_count || ' rows into CLIENTS table.');
        ELSE 
            DBMS_OUTPUT.PUT_LINE('INSERT NOT EXECUTED! VALIDATE CLIENT RETURN FALSE. ');
        END IF;
	END r_insert_client;

    PROCEDURE r_insert_client_contact (v_email contacts.email%type, v_tel_1 contacts.tel_1%type, v_tel_2 contacts.tel_2%type DEFAULT NULL, v_id_client contacts.id_contact%type) IS 
        inserts_count    INTEGER := 0;
        validate_return  BOOLEAN;
	BEGIN 
        validate_return := f_validate_client_contact(v_email, v_tel_1, v_tel_2);
        IF validate_return = TRUE THEN
            INSERT INTO CONTACTS(email, tel_1, tel_2, id_client) VALUES(v_email, v_tel_1, v_tel_2, v_id_client);
            inserts_count := inserts_count + SQL%ROWCOUNT;
            DBMS_OUTPUT.PUT_LINE('Inserted ' || inserts_count || ' rows into CONTACTS table.');
        ELSE 
            DBMS_OUTPUT.PUT_LINE('INSERT NOT EXECUTED! VALIDATE CLIENT RETURN FALSE. ');
        END IF;
	END r_insert_client_contact;

    PROCEDURE r_insert_client_address IS 
	BEGIN 
		NULL;
	END r_insert_client_address;

    PROCEDURE r_insert_client_firm IS 
	BEGIN 
		NULL;
	END r_insert_client_firm;

    PROCEDURE r_update_client IS 
	BEGIN 
		NULL;
	END r_update_client;

    PROCEDURE r_delete_client IS 
	BEGIN 
		NULL;
	END r_delete_client; 

	FUNCTION f_validate_client(v_fname_client clients.fname%type, v_lname_client clients.lname%type, v_pesel_client clients.pesel%type) RETURN BOOLEAN IS
		v_flag BOOLEAN := TRUE;
		v_show_bool VARCHAR2(10);
		v_alphabet VARCHAR2(100) := 'aąbcćdeęfghijklłmnńoópqrsśtuvwxyzźż-';
	BEGIN 
		--VALIDATE FNAME
		IF  LENGTH(TRIM(TRANSLATE(upper(v_fname_client), upper(v_alphabet),' '))) > 0 THEN
			v_flag := FALSE;
            DBMS_OUTPUT.PUT_LINE('ERROR FIRST NAME! IN THIS FIELD YOU CAN USE ONLY LETTERS. ');
		ELSE 
			--VALIDATE LNAME
			IF LENGTH(TRIM(TRANSLATE(upper(v_lname_client), upper(v_alphabet),' '))) > 0 THEN
				DBMS_OUTPUT.PUT_LINE('ERROR LAST NAME! IN THIS FIELD YOU CAN USE ONLY LETTERS. ');
				v_flag := FALSE;
			ELSE 
				--VALIDATE PESEL
				IF LENGTH(v_pesel_client) != 11 THEN
                	v_flag := FALSE;
                	DBMS_OUTPUT.PUT_LINE('ERROR PESEL! YOUR PESEL MUST HAVE 11 DIGITS.'); 
                ELSE
                    DBMS_OUTPUT.PUT_LINE('VALIDATION SUCCESFUL.'); 
                END IF;
				/*Przyjmuje na ta chwile ze peselu nie trzeba walidowac
				Pole jest typu INTEGER wiec i tak sie wywali, nalezaloby jednak przechwywcic ten wyjatek i sprawic zeby komunikat byl czytelniejszy
				PRZYSZLOSCIOWO <- zrobic walidacje peselu tak aby zgadzala sie suma kontrolna itd
				*/
				--VALIDATE DATE_ADD
			END IF;
		END IF;   
		--sprawdzenie co jest w v_flag
		v_show_bool:=CASE WHEN (sys.diutil.bool_to_int(v_flag)) = 1 THEN 'TRUE'
						  WHEN (sys.diutil.bool_to_int(v_flag)) = 0 THEN  'FALSE'
		END;  
        dbms_output.put_line('Validate return: ' || v_show_bool);
        RETURN v_flag;
    END f_validate_client;

    FUNCTION f_validate_client_contact(v_email contacts.email%type, v_tel_1 contacts.tel_1%type, v_tel_2 contacts.tel_2%type DEFAULT NULL) RETURN BOOLEAN IS
        v_flag BOOLEAN := TRUE;
        v_tel_length   INTEGER;
        v_email_length INTEGER;
    BEGIN 
        /*zmienic pole telefon na varchar2*/
        v_tel_length := LENGTH(v_tel_1);
        IF 9 > v_tel_length OR v_tel_length > 12  THEN
            DBMS_OUTPUT.PUT_LINE('TELEFON ZLY.');
            v_flag := FALSE;
        ELSE 
            DBMS_OUTPUT.PUT_LINE('TELEFON OK.');
        END IF;
        IF v_tel_2 IS NOT NULL THEN 
            v_tel_length := LENGTH(v_tel_2);
            IF 9 > v_tel_length OR v_tel_length > 12  THEN
                DBMS_OUTPUT.PUT_LINE('TELEFON ZLY.');
                v_flag := FALSE;
            ELSE 
                DBMS_OUTPUT.PUT_LINE('TELEFON OK.');
            END IF;
        END IF;        
        IF  REGEXP_LIKE (v_email,'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$') THEN
            DBMS_OUTPUT.PUT_LINE('EMAIL DOBRY.');
        ELSE 
            DBMS_OUTPUT.PUT_LINE('Email ZŁY.');
            v_flag := FALSE;
        END IF;
        RETURN v_flag;
    END f_validate_client_contact;

	FUNCTION f_validate_client_address RETURN BOOLEAN IS
        v_flag BOOLEAN := TRUE;
    BEGIN 
        NULL;
        RETURN v_flag;
    END f_validate_client_address;

	FUNCTION f_validate_client_firm RETURN BOOLEAN IS
        v_flag BOOLEAN := TRUE;
    BEGIN 
        NULL;
        RETURN v_flag;
    END f_validate_client_firm;
    
  FUNCTION f_get_id_client(v_pesel clients.pesel%type) RETURN INTEGER IS
        v_id_client NUMBER;
    BEGIN
        SELECT id_client 
          INTO v_id_client
          FROM clients 
         WHERE pesel = v_pesel;
        EXCEPTION 
            /*mozna zakodowac bledy kazdemu podac inna wartosc i sprawdzac co zwraca przy zworceniu
              musialby byc to liczby ujemne zeby nie kolidowac z idkami
              mozna tez wykorzystac SQLCODE
             */
            WHEN NO_DATA_FOUND THEN
                DBMS_OUTPUT.PUT_LINE('Client for pesel '||v_pesel||' not found. CODE ERROR: '|| SQLERRM);
                RETURN 0;
            WHEN TOO_MANY_ROWS THEN
                DBMS_OUTPUT.PUT_LINE('Numbers of clients for pesel '||v_pesel||' is too big. CODE ERROR: '|| SQLERRM);
                RETURN 0;
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Other error happened. CODE ERROR: '|| SQLERRM);
                RETURN 0;
    END f_get_id_client;
    
    PROCEDURE r_make_insert IS 
	BEGIN 
		NULL;
	END r_make_insert;

END PKG_ADD_CLIENT;
