create or replace PACKAGE BODY PKG_ADD_CLIENT AS

    FUNCTION f_client_exist ( v_pesel_in NUMBER,v_id_user_in INTEGER ) RETURN BOOLEAN 
    IS
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
    END f_client_exist;
    
    PROCEDURE insert_client IS 
	BEGIN 
		NULL;
	END insert_client;
    
    PROCEDURE insert_client_contact IS 
	BEGIN 
		NULL;
	END insert_client_contact;

    PROCEDURE insert_client_address IS 
	BEGIN 
		NULL;
	END insert_client_address;

    PROCEDURE insert_client_firm IS 
	BEGIN 
		NULL;
	END insert_client_firm;

    PROCEDURE update_client IS 
	BEGIN 
		NULL;
	END update_client;

    PROCEDURE delete_client IS 
	BEGIN 
		NULL;
	END delete_client; 

	FUNCTION f_validate_client(v_fname_client clients.fname%type, v_lname_client clients.lname%type ) RETURN BOOLEAN IS
		v_flag BOOLEAN := TRUE;
		v_show_bool VARCHAR2(10);
		v_alphabet VARCHAR2(35) := 'aąbcćdeęfghijklłmnńoópqrsśtuvwxyzźż-';
	BEGIN 
		--VALIDATE FNAME
		IF  LENGTH(TRIM(TRANSLATE(upper(v_fname_client), upper(v_alphabet),' '))) > 0 THEN
			DBMS_OUTPUT.PUT_LINE('ERROR FIRST NAME! IN THIS FIELD YOU CAN USE ONLY LETTERS. ');
			v_flag := FALSE;
			--tutaj zwracam blad, a jesli jest git to lece do elsa 
		ELSE 
			--VALIDATE LNAME
			IF LENGTH(TRIM(TRANSLATE(upper(v_lname_client), upper(v_alphabet),' '))) > 0 THEN
				DBMS_OUTPUT.PUT_LINE('ERROR LAST NAME! IN THIS FIELD YOU CAN USE ONLY LETTERS. ');
				v_flag := FALSE;
			ELSE 
				--VALIDATE PESEL
				/*Przyjmuje na ta chwile ze peselu nie trzeba walidowac
				Pole jest typu INTEGER wiec i tak sie wywali, nalezaloby jednak przechwywcic ten wyjatek i sprawic zeby komunikat byl czytelniejszy
				PRZYSZLOSCIOWO <- zrobic walidacje peselu tak aby zgadzala sie suma kontrolna itd
				*/
				--VALIDATE DATE_ADD
				NULL;
			END IF;
		END IF;   
		--sprawdzenie co jest w v_flag
		v_show_bool:=CASE WHEN (sys.diutil.bool_to_int(v_flag)) = 1 THEN 'TRUE'
						WHEN (sys.diutil.bool_to_int(v_flag)) = 0 THEN  'FALSE'
		END;  
		dbms_output.put_line(v_show_bool);
    END f_validate_client;

	FUNCTION validate_client_contact RETURN BOOLEAN IS
        v_flag BOOLEAN := TRUE;
    BEGIN 
        NULL;
        RETURN v_flag;
    END validate_client_contact;

	FUNCTION validate_client_address RETURN BOOLEAN IS
        v_flag BOOLEAN := TRUE;
    BEGIN 
        NULL;
        RETURN v_flag;
    END validate_client_address;

	FUNCTION validate_client_firm RETURN BOOLEAN IS
        v_flag BOOLEAN := TRUE;
    BEGIN 
        NULL;
        RETURN v_flag;
    END validate_client_firm;

        PROCEDURE make_insert IS 
	BEGIN 
		NULL;
	END make_insert;

END PKG_ADD_CLIENT;