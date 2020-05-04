CREATE OR REPLACE TRIGGER tr_before_insert_client BEFORE
    INSERT ON clients
    FOR EACH ROW
DECLARE
    /*
    Ten trigger sluzy do zabezpieczenia przed dodaniem dwoch tych samych klientów dla jednego użytkownika.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.14/04    14/04/2020   b.kicior   Utworzenie podstawowych funkcjonalności. 
    1.1.15/04    15/04/2020   b.kicior   Wykorzystanie funkcji check_client_exist. 
    */
    /* VERSION 1.0.14/04 v_count_clients INTEGER;*/
BEGIN
    /* VERSION 1.1.15/04 */
    IF f_check_client_exist(:new.pesel, :new.id_user) = TRUE THEN
        dbms_output.put_line('Podany klient już istnieje.');
        raise_application_error(-20001, 'Client already exists!');
    ELSE 
        dbms_output.put_line('Pomyślnie dodano klienta.');
    END IF;
    /* VERSION 1.0.14/04
    SELECT COUNT(*)
    INTO v_count_clients
    FROM clients
    WHERE pesel = :new.pesel
          AND id_user = :new.id_user
          AND status = 1;
    --sprawdzenie czy zwrocilo jakies osoby
    IF v_count_clients > 0 THEN
    raise_application_error(-20001, 'Client already exists!');
    dbms_output.put_line('Podany klient już istnieje.');
    ELSE
    dbms_output.put_line('Pomyślnie dodano klienta.');
    END IF;
    */
END tr_before_insert_client;
/

CREATE OR REPLACE TRIGGER tr_update_position_value BEFORE
    INSERT OR UPDATE ON positions 
    FOR EACH ROW
    /*
    Ten trigger aktualizuje wartość pozycji po jej wprowadzeniu lub aktualizacji.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.16/04    16/04/2020   b.kicior   Utworzenie triggera. 
    1.1.16/04    16/04/2020   b.kicior   Dodanie funkcjonalnosci.
    ------------------------------------------------------------------------------------------------------
    #TODO
    Update of price or amount
    */
BEGIN
    :new.value_cost := :new.amount * :new.price; /* <- moze to obliczac funkcja*/    
END tr_update_position_value;
/

CREATE OR REPLACE TRIGGER tr_update_facture_value 
    BEFORE INSERT OR UPDATE ON positions
    FOR EACH ROW
DECLARE
    /*
    Ten trigger aktualizuje wartość faktury po dodaniu do niej pozycji.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.16/04    16/04/2020   b.kicior   Utworzenie triggera. 
    ------------------------------------------------------------------------------------------------------
    #TODO
    Trigger dziala tylko raz po jego przekopmpilowaniu.
    */
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN    
    update factures
    set value = f_get_facture_value(:new.id_facture)
    where id_facture = :new.id_facture;
    COMMIT;
END tr_update_facture_value;
/

