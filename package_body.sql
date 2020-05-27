create or replace PACKAGE BODY PKG_ADD_CLIENT AS

    FUNCTION f_client_exist ( v_pesel_in NUMBER) RETURN BOOLEAN 
    IS
        CURSOR c_client_search 
        IS
            SELECT *
              FROM clients
             WHERE pesel = v_pesel_in
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
    END f_client_exist;
    
    PROCEDURE r_insert_client(v_fname clients.fname%type, v_lname clients.lname%type, v_pesel clients.pesel%type) IS
    	inserts_count INTEGER := 0;
	BEGIN
    	INSERT INTO CLIENTS(fname, lname, pesel) VALUES(v_fname, v_lname, v_pesel);
    	inserts_count := inserts_count + SQL%ROWCOUNT;
    	DBMS_OUTPUT.PUT_LINE('Inserted ' || inserts_count || ' rows into CLIENTS table.');
	END r_insert_client;
    
    PROCEDURE r_insert_client_contact IS 
	BEGIN 
		NULL;
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
		v_alphabet VARCHAR2(35) := 'aąbcćdeęfghijklłmnńoópqrsśtuvwxyzźż-';
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
                	DBMS_OUTPUT.PUT_LINE('ERROR PESEL! YOUR PESEL IS TOO SHORT, IT MUST HAVE 11 DIGITS.'); 
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
		dbms_output.put_line(v_show_bool);
    END f_validate_client;

	FUNCTION f_validate_client_contact RETURN BOOLEAN IS
        v_flag BOOLEAN := TRUE;
    BEGIN 
        NULL;
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

    PROCEDURE r_make_insert IS 
	BEGIN 
		NULL;
	END r_make_insert;

END PKG_ADD_CLIENT;