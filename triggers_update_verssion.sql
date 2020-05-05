/*ZESTAW TRIGGERÓW URUCHAMIANYCH PRZY AKTUALIZACJACH TABEL*/

CREATE OR REPLACE TRIGGER version_client BEFORE
    UPDATE ON clients
    FOR EACH ROW
/*
    Ten trigger służy do automatycznego wersjonowania wiersza w tabeli clients podczas jego aktualizacji.
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.19/04   14/04/2020   b.kicior   Utworzenie triggera. 
    1.1.19/04   15/04/2020   b.kicior   Utworzenie podstawowych funkcjonalności. 
    1.2.19/04   15/04/2020   b.kicior   Dodanie funkcji nvl().
	1.3.16/04   17/04/2020   b.kicior   Zablokowanie możliwości aktualizacji kolumny INSERT_DATE.
*/
BEGIN
    IF UPDATING('INSERT_DATE') THEN 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    END IF;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER version_address BEFORE
    UPDATE ON addresses
    FOR EACH ROW
/*
    Ten trigger służy do automatycznego wersjonowania wiersza w tabeli addresses podczas jego aktualizacji.
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.19/04   19/04/2020   b.kicior   Utworzenie triggera. 
    1.1.19/04   19/04/2020   b.kicior   Utworzenie funkcjonalnosci.
*/
BEGIN
    IF UPDATING('INSERT_DATE') THEN 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    END IF;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER version_address_type BEFORE
    UPDATE ON address_types
    FOR EACH ROW
/*
    Ten trigger służy do automatycznego wersjonowania wiersza w tabeli address_types podczas jego aktualizacji.
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.19/04   19/04/2020   b.kicior   Utworzenie triggera. 
    1.1.19/04   19/04/2020   b.kicior   Utworzenie funkcjonalnosci.
*/
BEGIN
    IF UPDATING('INSERT_DATE') THEN 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    END IF;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER version_amonu_type BEFORE
    UPDATE ON amount_types
    FOR EACH ROW
/*
    Ten trigger służy do automatycznego wersjonowania wiersza w tabeli amount_types podczas jego aktualizacji.
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.19/04   19/04/2020   b.kicior   Utworzenie triggera. 
    1.1.19/04   19/04/2020   b.kicior   Utworzenie funkcjonalnosci.
*/
BEGIN
    IF UPDATING('INSERT_DATE') THEN 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    END IF;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER version_client_firm BEFORE
    UPDATE ON clients_firm
    FOR EACH ROW
/*
    Ten trigger służy do automatycznego wersjonowania wiersza w tabeli clients_firm podczas jego aktualizacji.
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.19/04   19/04/2020   b.kicior   Utworzenie triggera. 
    1.1.19/04   19/04/2020   b.kicior   Utworzenie funkcjonalnosci.
*/
BEGIN
    IF UPDATING('INSERT_DATE') THEN 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    END IF;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER version_contact BEFORE
    UPDATE ON contacts
    FOR EACH ROW
/*
    Ten trigger służy do automatycznego wersjonowania wiersza w tabeli contacts podczas jego aktualizacji.
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.19/04   19/04/2020   b.kicior   Utworzenie triggera. 
    1.1.19/04   19/04/2020   b.kicior   Utworzenie funkcjonalnosci.
*/
BEGIN
    IF UPDATING('INSERT_DATE') THEN 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    END IF;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER version_contract_types BEFORE
    UPDATE ON contract_types
    FOR EACH ROW
/*
    Ten trigger służy do automatycznego wersjonowania wiersza w tabeli contract_types podczas jego aktualizacji.
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.19/04   19/04/2020   b.kicior   Utworzenie triggera. 
    1.1.19/04   19/04/2020   b.kicior   Utworzenie funkcjonalnosci.
*/
BEGIN
    IF UPDATING('INSERT_DATE') THEN 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    END IF;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
END;
/


CREATE OR REPLACE TRIGGER version_contract BEFORE
    UPDATE ON contracts
    FOR EACH ROW
/*
    Ten trigger służy do automatycznego wersjonowania wiersza w tabeli contracts podczas jego aktualizacji.
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.19/04   19/04/2020   b.kicior   Utworzenie triggera. 
    1.1.19/04   19/04/2020   b.kicior   Utworzenie funkcjonalnosci.
*/
BEGIN
    IF UPDATING('INSERT_DATE') THEN 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    END IF;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER version_facture BEFORE
    UPDATE ON factures
    FOR EACH ROW
/*
    Ten trigger służy do automatycznego wersjonowania wiersza w tabeli factures podczas jego aktualizacji.
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.19/04   19/04/2020   b.kicior   Utworzenie triggera. 
    1.1.19/04   19/04/2020   b.kicior   Utworzenie funkcjonalnosci.
*/
BEGIN
    IF UPDATING('INSERT_DATE') THEN 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    END IF;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER version_order_status BEFORE
    UPDATE ON orders_status
    FOR EACH ROW
/*
    Ten trigger służy do automatycznego wersjonowania wiersza w tabeli orders_status podczas jego aktualizacji.
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.19/04   19/04/2020   b.kicior   Utworzenie triggera. 
    1.1.19/04   19/04/2020   b.kicior   Utworzenie funkcjonalnosci.
*/
BEGIN
    IF UPDATING('INSERT_DATE') THEN 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    END IF;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER version_order_user BEFORE
    UPDATE ON orders_user
    FOR EACH ROW
/*
    Ten trigger służy do automatycznego wersjonowania wiersza w tabeli orders_user podczas jego aktualizacji.
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.19/04   19/04/2020   b.kicior   Utworzenie triggera. 
    1.1.19/04   19/04/2020   b.kicior   Utworzenie funkcjonalnosci.
*/
BEGIN
    IF UPDATING('INSERT_DATE') THEN 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    END IF;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER version_position BEFORE
    UPDATE ON positions
    FOR EACH ROW
/*
    Ten trigger służy do automatycznego wersjonowania wiersza w tabeli positions podczas jego aktualizacji.
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.19/04   19/04/2020   b.kicior   Utworzenie triggera. 
    1.1.19/04   19/04/2020   b.kicior   Utworzenie funkcjonalnosci.
*/
BEGIN
    IF UPDATING('INSERT_DATE') THEN 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    END IF;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER version_product_type BEFORE
    UPDATE ON product_types
    FOR EACH ROW
/*
    Ten trigger służy do automatycznego wersjonowania wiersza w tabeli product_types podczas jego aktualizacji.
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.19/04   19/04/2020   b.kicior   Utworzenie triggera. 
    1.1.19/04   19/04/2020   b.kicior   Utworzenie funkcjonalnosci.
*/
BEGIN
    IF UPDATING('INSERT_DATE') THEN 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    END IF;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER version_product BEFORE
    UPDATE ON products
    FOR EACH ROW
/*
    Ten trigger służy do automatycznego wersjonowania wiersza w tabeli products podczas jego aktualizacji.
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.19/04   19/04/2020   b.kicior   Utworzenie triggera. 
    1.1.19/04   19/04/2020   b.kicior   Utworzenie funkcjonalnosci.
*/
BEGIN
    IF UPDATING('INSERT_DATE') THEN 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    END IF;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER version_value_type BEFORE
    UPDATE ON value_types
    FOR EACH ROW
/*
    Ten trigger służy do automatycznego wersjonowania wiersza w tabeli value_types podczas jego aktualizacji.
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.19/04   19/04/2020   b.kicior   Utworzenie triggera. 
    1.1.19/04   19/04/2020   b.kicior   Utworzenie funkcjonalnosci.
*/
BEGIN
    IF UPDATING('INSERT_DATE') THEN 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    END IF;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER version_warehouse BEFORE
    UPDATE ON warehouse
    FOR EACH ROW
/*
    Ten trigger służy do automatycznego wersjonowania wiersza w tabeli warehouse podczas jego aktualizacji.
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.19/04   19/04/2020   b.kicior   Utworzenie triggera. 
    1.1.19/04   19/04/2020   b.kicior   Utworzenie funkcjonalnosci.
*/
BEGIN
    IF UPDATING('INSERT_DATE') THEN 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    END IF;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER version_worker BEFORE
    UPDATE ON workers
    FOR EACH ROW
/*
    Ten trigger służy do automatycznego wersjonowania wiersza w tabeli workers podczas jego aktualizacji.
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.19/04   19/04/2020   b.kicior   Utworzenie triggera. 
    1.1.19/04   19/04/2020   b.kicior   Utworzenie funkcjonalnosci.
*/
BEGIN
    IF UPDATING('INSERT_DATE') THEN 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    END IF;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER version_user_firm BEFORE
    UPDATE ON users_firm
    FOR EACH ROW
/*
    Ten trigger służy do automatycznego wersjonowania wiersza w tabeli users_firm podczas jego aktualizacji.
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.19/04   19/04/2020   b.kicior   Utworzenie triggera. 
    1.1.19/04   19/04/2020   b.kicior   Utworzenie funkcjonalnosci.
	1.2.19/04   19/04/2020   b.kicior   Zablokowanie możliwosci aktualizacji pola NIP.
*/
BEGIN
    IF UPDATING('INSERT_DATE') THEN 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    END IF;    
	IF UPDATING('NIP') THEN 
        raise_application_error(-20102, 'Wartości w polu NIP nie można aktualizować! Jeśli wprowadziłeś w tym miejscu nieprawidlowe dane skontaktuj się z administratorem: bk.7@o2.plERROR: '||SQLERRM||' '||SQLCODE);
    END IF;  
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER version_user BEFORE
    UPDATE ON users
    FOR EACH ROW
/*
    Ten trigger służy do automatycznego wersjonowania wiersza w tabeli users podczas jego aktualizacji.
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.19/04   19/04/2020   b.kicior   Utworzenie triggera. 
    1.1.19/04   19/04/2020   b.kicior   Utworzenie funkcjonalnosci.
	1.2.19/04   19/04/2020   b.kicior   Zablokowanie możliwosci aktualizacji pola email będącego loginem do serwisu.
*/
BEGIN
    IF UPDATING('INSERT_DATE') THEN 
        raise_application_error(-20100, 'Kolumny INSERT_DATE nie można aktualizować! ERROR: '||SQLERRM||' '||SQLCODE);
    END IF;    
	 IF UPDATING('EMAIL') THEN 
        raise_application_error(-20101, 'Wartości w polu Login/Email nie można aktualizować! Jeśli wprowadziłeś w tym miejscu nieprawidlowe dane skontaktuj się z administratorem: bk.7@o2.plERROR: '||SQLERRM||' '||SQLCODE);
    END IF;    
    :new.version := nvl(:old.version,1) + 1;
    :new.update_date := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER version_not_log BEFORE
    UPDATE OR DELETE OR INSERT ON logs
    FOR EACH ROW
/*
    Ten trigger służy do blokowania ręcznych zmian danych w tabeli logs.
    ------------------------------------------------------------------------------------------------------
    VERSION     DATE         AUTHOR     DESCRIPTION
    1.0.19/04   19/04/2020   b.kicior   Utworzenie triggera. 
    1.1.19/04   19/04/2020   b.kicior   Utworzenie funkcjonalnosci.
*/
BEGIN
	IF UPDATING THEN 
        raise_application_error(-20105, 'Aktualizacja danych w tej tabeli jest zabroniona! W razie potrzeby skontaktuj się z administratorem: bk.7@o2.plERROR: '||SQLERRM||' '||SQLCODE);
    END IF; 
	IF DELETING THEN 
        raise_application_error(-20105, 'Usuwanie danych z tej tabeli jest zabronione! W razie potrzeby skontaktuj się z administratorem: bk.7@o2.plERROR: '||SQLERRM||' '||SQLCODE);
    END IF; 
	/*
    IF INSERTING THEN 
        raise_application_error(-20105, 'Wprowadzadzanie danych do tej tabeli jest zabronione! W razie potrzeby skontaktuj się z administratorem: bk.7@o2.plERROR: '||SQLERRM||' '||SQLCODE);
    END IF; 
    */
END;
/