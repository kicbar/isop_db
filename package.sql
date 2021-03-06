create or replace PACKAGE PKG_ADD_CLIENT AS 
    /*
    Ten pakiet odpowiada za wprowadzanie klientów do systemu. 
	Przeprowadza walidacje oraz insertuje dane.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie pakietu. 
    ------------------------------------------------------------------------------------------------------
    */
    
    FUNCTION f_client_exist ( v_pesel_in NUMBER,v_id_user_in INTEGER ) RETURN BOOLEAN;
    /*
    Ta funkcja sprawdza czy dla danego użytkownika isnieja klienci o wskazanym numerze pesel. 
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.27.05    27/05/2020   b.kicior   Utworzenie podstawowych funkcjonalności. 
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
    FUNCTION f_validate_client(v_fname_client clients.fname%type, v_lname_client clients.lname%type) RETURN BOOLEAN;
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