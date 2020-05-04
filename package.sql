CREATE OR REPLACE PACKAGE PKG_ADD_USER AS 
    /*
    Ten pakiet odpowiada za wprowadzanie użytkowników systemu. 
	Przeprowadza walidacje oraz insertuje dane.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.19/04    19/04/2020   b.kicior   Utworzenie pakietu. 
    ------------------------------------------------------------------------------------------------------
    */
    PROCEDURE insert_user;
    /*
    Ta procedura odpowiada za wprowadzenie danych do bazy.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.19/04    19/04/2020   b.kicior   Utworzenie procedury. 
    ------------------------------------------------------------------------------------------------------
    */
    FUNCTION validate_user RETURN BOOLEAN;
    /*
    Ta funkcja sprawdza poprawność wprowadzanych danych.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.19/04    19/04/2020   b.kicior   Utworzenie funkcji. 
    ------------------------------------------------------------------------------------------------------
    */
END PKG_ADD_USER;
/

CREATE OR REPLACE PACKAGE BODY PKG_ADD_USER AS

    PROCEDURE insert_user IS
    BEGIN 
        /*
        INSERT INTO USERS () VALUES ();
        INSERT INTO USERS_FIRM () VALUES ();
        */
        NULL;
    END insert_user;

    FUNCTION validate_user RETURN BOOLEAN IS
        v_flag BOOLEAN := TRUE;
    BEGIN 
        NULL;
        RETURN v_flag;
    END validate_user;
  
END PKG_ADD_USER;
/
------------------------------------------------------------------------------------------------------------
'**********************************************************************************************************'
------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE PKG_ADD_CLIENT AS 
    /*
    Ten pakiet odpowiada za wprowadzanie klientów do systemu. 
	Przeprowadza walidacje oraz insertuje dane.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie pakietu. 
    ------------------------------------------------------------------------------------------------------
    */
    PROCEDURE insert_client;
    /*
    Ta procedura odpowiada za wprowadzenie danych do bazy.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie procedury. 
    ------------------------------------------------------------------------------------------------------
    */
    PROCEDURE insert_client_contact;
    /*
    Ta procedura odpowiada za wprowadzenie danych do bazy.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie procedury. 
    ------------------------------------------------------------------------------------------------------
    */
    PROCEDURE insert_client_address;
    /*
    Ta procedura odpowiada za wprowadzenie danych do bazy.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie procedury. 
    ------------------------------------------------------------------------------------------------------
    */
    PROCEDURE insert_client_firm;
    /*
    Ta procedura odpowiada za wprowadzenie danych do bazy.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie procedury. 
    ------------------------------------------------------------------------------------------------------
    */
    PROCEDURE update_client;
    /*
    Ta procedura odpowiada za wprowadzenie danych do bazy.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie procedury. 
    ------------------------------------------------------------------------------------------------------
    */
    PROCEDURE delete_client;
    /*
    Ta procedura odpowiada za wprowadzenie danych do bazy.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie procedury. 
    ------------------------------------------------------------------------------------------------------
    */
    FUNCTION validate_client RETURN BOOLEAN;
    /*
    Ta funkcja sprawdza poprawność wprowadzanych danych.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie funkcji. 
    ------------------------------------------------------------------------------------------------------
    */
    FUNCTION validate_client_contact RETURN BOOLEAN;
    /*
    Ta funkcja sprawdza poprawność wprowadzanych danych.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie funkcji. 
    ------------------------------------------------------------------------------------------------------
    */
    FUNCTION validate_client_address RETURN BOOLEAN;
    /*
    Ta funkcja sprawdza poprawność wprowadzanych danych.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie funkcji. 
    ------------------------------------------------------------------------------------------------------
    */
    FUNCTION validate_client_firm RETURN BOOLEAN;
    /*
    Ta funkcja sprawdza poprawność wprowadzanych danych.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie funkcji. 
    ------------------------------------------------------------------------------------------------------
    */
	PROCEDURE make_insert;
    /*
    Ta funkcja wykonuje pozostale.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie funkcji. 
    ------------------------------------------------------------------------------------------------------
    */
END PKG_ADD_CLIENT;
/

CREATE OR REPLACE PACKAGE BODY PKG_ADD_CLIENT AS

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
	
	FUNCTION validate_client RETURN BOOLEAN IS
        v_flag BOOLEAN := TRUE;
    BEGIN 
        NULL;
        RETURN v_flag;
    END validate_client;

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
/