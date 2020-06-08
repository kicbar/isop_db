create or replace PACKAGE PKG_ADD_CLIENT AS 
    /*
    Ten pakiet odpowiada za wprowadzanie klientów do systemu. 
	Przeprowadza walidacje oraz insertuje dane.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie pakietu. 
    ------------------------------------------------------------------------------------------------------
    */

    FUNCTION f_client_exist (v_pesel_in NUMBER) RETURN BOOLEAN;
    /*
    Ta funkcja sprawdza czy dla danego użytkownika isnieja klienci o wskazanym numerze pesel. 
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.27.05    27/05/2020   b.kicior   Utworzenie podstawowych funkcjonalności. 
    2.0.27.05    27/05/2020   b.kicior   Usunięcie powiązania z userem.
    ------------------------------------------------------------------------------------------------------
    */
    PROCEDURE r_insert_client(v_fname clients.fname%type, v_lname clients.lname%type, v_pesel clients.pesel%type);
    /*
    Ta procedura odpowiada za wprowadzenie danych do bazy.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie procedury. 
    ------------------------------------------------------------------------------------------------------
    */
    PROCEDURE r_insert_client_contact(v_email contacts.email%type, v_tel_1 contacts.tel_1%type, v_tel_2 contacts.tel_2%type DEFAULT NULL, v_id_client contacts.id_contact%type);
    /*
    Ta procedura odpowiada za wprowadzenie danych do bazy.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie procedury. 
    ------------------------------------------------------------------------------------------------------
    */
    PROCEDURE r_insert_client_address;
    /*
    Ta procedura odpowiada za wprowadzenie danych do bazy.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie procedury. 
    ------------------------------------------------------------------------------------------------------
    */
    PROCEDURE r_insert_client_firm;
    /*
    Ta procedura odpowiada za wprowadzenie danych do bazy.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie procedury. 
    ------------------------------------------------------------------------------------------------------
    */
    PROCEDURE r_update_client;
    /*
    Ta procedura odpowiada za wprowadzenie danych do bazy.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie procedury. 
    ------------------------------------------------------------------------------------------------------
    */
    PROCEDURE r_delete_client;
    /*
    Ta procedura odpowiada za wprowadzenie danych do bazy.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie procedury. 
    ------------------------------------------------------------------------------------------------------
    */
    FUNCTION f_validate_client(v_fname_client clients.fname%type, v_lname_client clients.lname%type,v_pesel_client clients.pesel%type) RETURN BOOLEAN;
    /*
    Ta funkcja sprawdza poprawność wprowadzanych danych.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie funkcji. 
    ------------------------------------------------------------------------------------------------------
    */
    FUNCTION f_validate_client_contact(v_email contacts.email%type, v_tel_1 contacts.tel_1%type, v_tel_2 contacts.tel_2%type DEFAULT NULL) RETURN BOOLEAN;
    /*
    Ta funkcja sprawdza poprawność wprowadzanych danych.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie funkcji. 
    ------------------------------------------------------------------------------------------------------
    */
    FUNCTION f_validate_client_address RETURN BOOLEAN;
    /*
    Ta funkcja sprawdza poprawność wprowadzanych danych.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie funkcji. 
    ------------------------------------------------------------------------------------------------------
    */
    FUNCTION f_validate_client_firm RETURN BOOLEAN;
    /*
    Ta funkcja sprawdza poprawność wprowadzanych danych.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie funkcji. 
    ------------------------------------------------------------------------------------------------------
    */
    FUNCTION f_get_id_client(v_pesel clients.pesel%type) RETURN INTEGER;
    /*
    Ta funkcja sprawdza poprawność wprowadzanych danych.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.30/05    30/05/2020   b.kicior   Utworzenie funkcji. 
    ------------------------------------------------------------------------------------------------------
    */
    FUNCTION f_get_client(v_pesel clients.pesel%type, v_fname clients.fname%type, v_lname clients.lname%type) RETURN clients%rowtype;
    /*
    Ta funkcja sprawdza pobiera dane clienta.
    Wykorzystuje dynamiczny SQL.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.30/05    30/05/2020   b.kicior   Utworzenie funkcji. 
    ------------------------------------------------------------------------------------------------------
    */
    FUNCTION f_validate_pesel(v_pesel clients.pesel%type) RETURN BOOLEAN;
    /*
    Ta funkcja sprawdza poprawność wprowadzanych danych.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.04/06    04/06/2020   b.kicior   Utworzenie funkcji. 
    ------------------------------------------------------------------------------------------------------
    */
    PROCEDURE r_make_insert;
    /*
    Ta procedura wykonuje pozostale.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.20/04    20/04/2020   b.kicior   Utworzenie funkcji. 
    ------------------------------------------------------------------------------------------------------
    */
END PKG_ADD_CLIENT;