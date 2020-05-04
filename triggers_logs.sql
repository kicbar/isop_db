CREATE OR REPLACE TRIGGER log_client
  AFTER INSERT OR UPDATE OR DELETE
  ON clients
  FOR EACH ROW
DECLARE
    /*
    Ten trigger sluzy do zapiywania logów podczas zmian w tabeli clients.
    ------------------------------------------------------------------------------------------------------
    VERSION         DATE         AUTHOR     DESCRIPTION
    1.0.14/04       14/04/2020   b.kicior   Utworzenie triggera.
	1.1.14/04       14/04/2020   b.kicior   Utworzenie funkcjonalności.	
    1.2.15/04       15/04/2020   b.kicior   Uzupelnienie tabeli w logach o id rekordu. 
    1.3.19/04       19/04/2020   b.kicior   Dodanie informacji o konkretnej zmianie w kolumnie.
    1.4.19/04       19/04/2020   b.kicior   Dodanie informacji o ID_USER.
	1.4.20/04 		20/04/2020	 b.kicior	Dodanie informacji o wprowadzonych lub skasowanych wartościach.
    */
  log_action       LOGS.OPERATION%TYPE;
  v_new_value      LOGS.NEW_VALUE%TYPE := 'UNCHANGED';
  v_old_value      LOGS.OLD_VALUE%TYPE := 'UNCHANGED';
  v_id_table       INTEGER  := :new.id_client;
  v_id_user        INTEGER  := :new.id_user;
BEGIN
    --zmienic ifa na case
   IF INSERTING THEN
    log_action := 'Insert';
    v_new_value := 'FNAME: |'||:new.fname||'| LNAME: |'||:new.lname||'| PESEL: |'||:new.pesel||'| STATUS: |'||:new.status||'|.';
  ELSIF UPDATING THEN
    log_action := 'Update';
    v_old_value := 'FNAME: |'||:old.fname||'| LNAME: |'||:old.lname||'| PESEL: |'||:old.pesel||'| STATUS: |'||:new.status||'|.';
    v_new_value := 'FNAME: |'||:new.fname||'| LNAME: |'||:new.lname||'| PESEL: |'||:new.pesel||'| STATUS: |'||:new.status||'|.';
  ELSIF DELETING THEN
    log_action := 'Delete';
    v_id_table := :old.id_client;
    v_id_user := :old.id_user;
    v_old_value := 'FNAME: |'||:old.fname||'| LNAME: |'||:old.lname||'| PESEL: |'||:old.pesel||'| STATUS: |'||:new.status||'|.';
  ELSE
    DBMS_OUTPUT.PUT_LINE('This code is not reachable.');
  END IF;
  log_action := log_action || ' on client with id: ' || v_id_table;
  INSERT INTO LOGS (table_name, operation, old_value, new_value, id_user) VALUES ('CLIENTS', log_action, v_old_value, v_new_value, v_id_user);
END;
/

CREATE OR REPLACE TRIGGER log_client_firm
  AFTER INSERT OR UPDATE OR DELETE
  ON clients_firm
  FOR EACH ROW
DECLARE
    /*
    Ten trigger sluzy do zapiywania logów podczas zmian w tabeli clients_firm.
    ------------------------------------------------------------------------------------------------------
    VERSION         DATE         AUTHOR     DESCRIPTION
    1.0.19/04       19/04/2020   b.kicior   Utworzenie triggera.
	1.1.19/04       19/04/2020   b.kicior   Utworzenie funkcjonalności.	
	1.2.20/04		20/04/2020   b.kicior   Dostosowanie do nowych wymagań tabeli logs.
    */
  log_action       LOGS.OPERATION%TYPE;
  v_new_value      LOGS.NEW_VALUE%TYPE := 'UNCHANGED';
  v_old_value      LOGS.OLD_VALUE%TYPE := 'UNCHANGED';
  v_id_table       INTEGER  := :new.id_client_firm;
BEGIN
   IF INSERTING THEN
    log_action := 'Insert';
    v_new_value := 'FIRM_NAME: |'||:new.firm_name||'| NIP: |'||:new.nip||'| REGON: |'||:new.regon||'| ADDRESS: |'||:new.address||'| STATUS: |'||:new.status||'|.';
  ELSIF UPDATING THEN
    log_action := 'Update';
    v_new_value := 'FIRM_NAME: |'||:new.firm_name||'| NIP: |'||:new.nip||'| REGON: |'||:new.regon||'| ADDRESS: |'||:new.address||'| STATUS: |'||:new.status||'|.';
    v_old_value := 'FIRM_NAME: |'||:old.firm_name||'| NIP: |'||:old.nip||'| REGON: |'||:old.regon||'| ADDRESS: |'||:old.address||'| STATUS: |'||:new.status||'|.';
  ELSIF DELETING THEN
    log_action := 'Delete';
    v_id_table := :old.id_client_firm;
    v_old_value := 'FIRM_NAME: |'||:old.firm_name||'| NIP: |'||:old.nip||'| REGON: |'||:old.regon||'| ADDRESS: |'||:old.address||'| STATUS: |'||:new.status||'|.';
  ELSE
    DBMS_OUTPUT.PUT_LINE('This code is not reachable.');
  END IF;
  log_action := log_action || ' on client_firm with id: ' || v_id_table;
  INSERT INTO LOGS (table_name, operation, old_value, new_value) VALUES ('CLIENTS_FIRM', log_action, v_old_value, v_new_value);
END;
/

CREATE OR REPLACE TRIGGER log_address
  AFTER INSERT OR UPDATE OR DELETE
  ON addresses
  FOR EACH ROW
DECLARE
    /*
    Ten trigger sluzy do zapiywania logów podczas zmian w tabeli addresses.
    ------------------------------------------------------------------------------------------------------
    VERSION         DATE         AUTHOR     DESCRIPTION
    1.0.19/04       19/04/2020   b.kicior   Utworzenie triggera.
	1.1.19/04       19/04/2020   b.kicior   Utworzenie funkcjonalności.	
	1.2.20/04		20/04/2020   b.kicior   Dostosowanie do nowych wymagań tabeli logs.
    */
  log_action       LOGS.OPERATION%TYPE;
  v_new_value      LOGS.NEW_VALUE%TYPE := 'UNCHANGED';
  v_old_value      LOGS.OLD_VALUE%TYPE := 'UNCHANGED';
  v_id_table       INTEGER  := :new.id_address;
BEGIN
   IF INSERTING THEN
    log_action := 'Insert';
    v_new_value := 'CITY: |'||:new.city||'| STREET: |'||:new.street||'| POSTAL_CODE: |'||:new.postal_code||'| HNUMBER: |'||:new.hnumber||'| COUNTRY: |'||:new.country||'| STATUS: |'||:new.status||'|.';
  ELSIF UPDATING THEN
    log_action := 'Update';
    v_new_value := 'CITY: |'||:new.city||'| STREET: |'||:new.street||'| POSTAL_CODE: |'||:new.postal_code||'| HNUMBER: |'||:new.hnumber||'| COUNTRY: |'||:new.country||'| STATUS: |'||:new.status||'|.';
    v_old_value := 'CITY: |'||:old.city||'| STREET: |'||:old.street||'| POSTAL_CODE: |'||:old.postal_code||'| HNUMBER: |'||:old.hnumber||'| COUNTRY: |'||:old.country||'| STATUS: |'||:new.status||'|.';
  ELSIF DELETING THEN
    log_action := 'Delete';
    v_id_table := :old.id_address;        
    v_old_value := 'CITY: |'||:old.city||'| STREET: |'||:old.street||'| POSTAL_CODE: |'||:old.postal_code||'| HNUMBER: |'||:old.hnumber||'| COUNTRY: |'||:old.country||'| STATUS: |'||:new.status||'|.';
  ELSE
    DBMS_OUTPUT.PUT_LINE('This code is not reachable.');
  END IF;
  log_action := log_action || ' on address with id: ' || v_id_table;
  INSERT INTO LOGS (table_name, operation, old_value, new_value) VALUES ('ADDRESSES', log_action, v_old_value, v_new_value);
END;
/

CREATE OR REPLACE TRIGGER log_contact
  AFTER INSERT OR UPDATE OR DELETE
  ON contacts
  FOR EACH ROW
DECLARE
    /*
    Ten trigger sluzy do zapiywania logów podczas zmian w tabeli contacts.
    ------------------------------------------------------------------------------------------------------
    VERSION         DATE         AUTHOR     DESCRIPTION
    1.0.19/04       19/04/2020   b.kicior   Utworzenie triggera.
	1.1.19/04       19/04/2020   b.kicior   Utworzenie funkcjonalności.	
	1.2.20/04		20/04/2020   b.kicior   Dostosowanie do nowych wymagań tabeli logs.
    */
  log_action       LOGS.OPERATION%TYPE;
  v_new_value      LOGS.NEW_VALUE%TYPE := 'UNCHANGED';
  v_old_value      LOGS.OLD_VALUE%TYPE := 'UNCHANGED';
  v_id_table       INTEGER  := :new.id_contact;
BEGIN
   IF INSERTING THEN
    log_action := 'Insert';
    v_new_value := 'EMAIL: |'||:new.email||'| TEL_1: |'||:new.tel_1||'| TEL_2: |'||:new.tel_2||'| STATUS: |'||:new.status||'|.';
  ELSIF UPDATING THEN
    log_action := 'Update';
    v_new_value := 'EMAIL: |'||:new.email||'| TEL_1: |'||:new.tel_1||'| TEL_2: |'||:new.tel_2||'| STATUS: |'||:new.status||'|.';
    v_old_value := 'EMAIL: |'||:old.email||'| TEL_1: |'||:old.tel_1||'| TEL_2: |'||:old.tel_2||'| STATUS: |'||:old.status||'|.';
  ELSIF DELETING THEN
    log_action := 'Delete';
    v_id_table := :old.id_contact;        
    v_old_value := 'EMAIL: |'||:old.email||'| TEL_1: |'||:old.tel_1||'| TEL_2: |'||:old.tel_2||'| STATUS: |'||:old.status||'|.';
  ELSE
    DBMS_OUTPUT.PUT_LINE('This code is not reachable.');
  END IF;
  log_action := log_action || ' on contact with id: ' || v_id_table;
  INSERT INTO LOGS (table_name, operation, old_value, new_value) VALUES ('CONTACTS', log_action, v_old_value, v_new_value);
END;
/


























CREATE OR REPLACE TRIGGER log_address_type
  AFTER INSERT OR UPDATE OR DELETE
  ON address_types
  FOR EACH ROW
DECLARE
    /*
    Ten trigger sluzy do zapiywania logów podczas zmian w tabeli address_types.
    ------------------------------------------------------------------------------------------------------
    VERSION         DATE         AUTHOR     DESCRIPTION
    1.0.19/04       19/04/2020   b.kicior   Utworzenie triggera.
	1.1.19/04       19/04/2020   b.kicior   Utworzenie funkcjonalności.	
    */
  log_action   LOGS.DESCRIPTION%TYPE;
  v_id_address_type  address_types.id_address_type%TYPE;
BEGIN
   IF INSERTING THEN
    log_action := 'Insert';
  ELSIF UPDATING THEN
    log_action := 'Update';
  ELSIF DELETING THEN
    log_action := 'Delete';
  ELSE
    DBMS_OUTPUT.PUT_LINE('This code is not reachable.');
  END IF;
  v_id_address_type := :new.id_address_type;
  log_action := log_action || ' on client with id: ' || v_id_address_type;
  INSERT INTO LOGS (table_name, description)
    VALUES ('ADDRESS_TYPES', log_action);
END;
/


CREATE OR REPLACE TRIGGER log_facture
  AFTER INSERT OR UPDATE OR DELETE
  ON factures
  FOR EACH ROW
DECLARE
    /*
    Ten trigger sluzy do zapiywania logów podczas zmian w tabeli factures.
    ------------------------------------------------------------------------------------------------------
    VERSION         DATE         AUTHOR     DESCRIPTION
    1.0.19/04       19/04/2020   b.kicior   Utworzenie triggera.
	1.1.19/04       19/04/2020   b.kicior   Utworzenie funkcjonalności.	
    */
  log_action   LOGS.DESCRIPTION%TYPE;
  v_id_facture factures.id_facture%TYPE;
BEGIN
   IF INSERTING THEN
    log_action := 'Insert';
  ELSIF UPDATING THEN
    log_action := 'Update';
  ELSIF DELETING THEN
    log_action := 'Delete';
  ELSE
    DBMS_OUTPUT.PUT_LINE('This code is not reachable.');
  END IF;
  v_id_facture := :new.id_facture;
  log_action := log_action || ' on client with id: ' || v_id_facture;
  INSERT INTO LOGS (table_name, description)
    VALUES ('FACTURES', log_action);
END;
/