--=========================================CREATE TABLE====================
CREATE TABLE AMOUNT_TYPES
(
  ID_AMOUNT_TYPE INTEGER DEFAULT AMOUNT_TYPE_SEQ.NEXTVAL CONSTRAINT id_amount_type_pk PRIMARY KEY NOT NULL
, AMOUNT_TYPE_NAME VARCHAR2(20)  NOT NULL
, VERSION NUMBER(2,0) DEFAULT 1
, UPDATE_DATE TIMESTAMP default sysdate
, INSERT_DATE TIMESTAMP default sysdate
, STATUS NUMBER(1,0) DEFAULT 1
);

CREATE TABLE VALUE_TYPES
(
  ID_VALUE_TYPE INTEGER DEFAULT VALUE_TYPE_SEQ.NEXTVAL CONSTRAINT id_value_type_pk PRIMARY KEY NOT NULL
, VALUE_TYPE_NAME VARCHAR2(5) NOT NULL
, VERSION NUMBER(2,0) DEFAULT 1
, UPDATE_DATE TIMESTAMP default sysdate
, INSERT_DATE TIMESTAMP default sysdate
, STATUS NUMBER(1,0) DEFAULT 1
);

CREATE TABLE PRODUCT_TYPES
(
  ID_PRODUCT_TYPE INTEGER DEFAULT PRODUCT_TYPE_SEQ.NEXTVAL CONSTRAINT id_product_type_pk PRIMARY KEY NOT NULL
, PRODUCT_TYPE VARCHAR2(30) NOT NULL
, DESCRIPTION VARCHAR(100)
, VERSION NUMBER(2,0) DEFAULT 1
, UPDATE_DATE TIMESTAMP default sysdate
, INSERT_DATE TIMESTAMP default sysdate
, STATUS NUMBER(1,0) DEFAULT 1
);

CREATE TABLE PRODUCTS  
(
  ID_PRODUCT INTEGER DEFAULT PRODUCT_SEQ.NEXTVAL CONSTRAINT id_product_pk PRIMARY KEY NOT NULL
, PRODUCT_NAME VARCHAR2(30) NOT NULL
, DESCRIPTION VARCHAR2(100) 
, ID_PRODUCT_TYPE INTEGER
, VERSION NUMBER(2,0) DEFAULT 1
, UPDATE_DATE TIMESTAMP default sysdate
, INSERT_DATE TIMESTAMP default sysdate
, STATUS NUMBER(1,0) DEFAULT 1
, CONSTRAINT id_product_type_fk FOREIGN KEY (ID_PRODUCT_TYPE) REFERENCES PRODUCT_TYPES(ID_PRODUCT_TYPE)
);

CREATE TABLE CLIENTS
(
  ID_CLIENT INTEGER DEFAULT CLIENT_SEQ.NEXTVAL CONSTRAINT id_client_pk PRIMARY KEY NOT NULL
, FNAME VARCHAR2(30) NOT NULL
, LNAME VARCHAR2(30) NOT NULL
, PESEL VARCHAR2(11)
, DATE_ADD varchar(10) 
, VERSION NUMBER(2,0) DEFAULT 1
, UPDATE_DATE TIMESTAMP default sysdate
, INSERT_DATE TIMESTAMP default sysdate
, STATUS NUMBER(1,0) DEFAULT 1
);

CREATE TABLE FACTURES
(
  ID_FACTURE INTEGER DEFAULT FACTURE_SEQ.NEXTVAL CONSTRAINT id_facture_pk PRIMARY KEY NOT NULL
, FACTURE_NAME VARCHAR2(20) NOT NULL
, ID_CLIENT INTEGER NOT NULL
, DATE_ADD VARCHAR2(10) 
, VALUE NUMBER(11,2)
, ID_VALUE_TYPE NUMBER DEFAULT 1
, VERSION NUMBER(2,0) DEFAULT 1
, UPDATE_DATE TIMESTAMP default sysdate
, INSERT_DATE TIMESTAMP default sysdate
, STATUS NUMBER(1,0) DEFAULT 1
, CONSTRAINT id_value_type_f_fk FOREIGN KEY (ID_VALUE_TYPE) REFERENCES VALUE_TYPES(ID_VALUE_TYPE)
, CONSTRAINT id_client_facture_fk FOREIGN KEY (ID_CLIENT) REFERENCES CLIENTS(ID_CLIENT)
);

CREATE TABLE POSITIONS
(
  ID_POSITION INTEGER DEFAULT POSITION_SEQ.NEXTVAL CONSTRAINT id_position_pk PRIMARY KEY NOT NULL
, ID_FACTURE INTEGER NOT NULL
, ID_PRODUCT INTEGER NOT NULL
, PRICE NUMBER(10,2) NOT NULL
, AMOUNT NUMBER(10,2) NOT NULL
, ID_AMOUNT_TYPE NUMBER NOT NULL
, VALUE_COST NUMBER(10,2)
, ID_VALUE_TYPE NUMBER DEFAULT 1 
, VERSION NUMBER(2,0) DEFAULT 1
, UPDATE_DATE TIMESTAMP default sysdate
, INSERT_DATE TIMESTAMP default sysdate
, STATUS NUMBER(1,0) DEFAULT 1
, CONSTRAINT id_value_type_p_fk FOREIGN KEY (ID_VALUE_TYPE) REFERENCES VALUE_TYPES(ID_VALUE_TYPE)
, CONSTRAINT id_amount_type_p_fk FOREIGN KEY (ID_AMOUNT_TYPE) REFERENCES AMOUNT_TYPES(ID_AMOUNT_TYPE)
, CONSTRAINT id_position_facture_fk FOREIGN KEY (ID_FACTURE) REFERENCES FACTURES(ID_FACTURE)
, CONSTRAINT id_position_product_fk FOREIGN KEY (ID_PRODUCT) REFERENCES PRODUCTS(ID_PRODUCT)
);

CREATE TABLE WORKERS
(
  ID_WORKER INTEGER DEFAULT WORKER_SEQ.NEXTVAL CONSTRAINT id_worker_pk PRIMARY KEY NOT NULL
, FNAME VARCHAR2(30) NOT NULL
, LNAME VARCHAR2(30) NOT NULL
, PESEL NUMBER(11,0)
, DATE_ADD varchar(10) 
, VERSION NUMBER(2,0) DEFAULT 1
, UPDATE_DATE TIMESTAMP default sysdate
, INSERT_DATE TIMESTAMP default sysdate
, STATUS NUMBER(1,0) DEFAULT 1
);

CREATE TABLE CONTRACT_TYPES
(
  ID_CONTRACT_TYPE INTEGER DEFAULT CONTRACT_TYPE_SEQ.NEXTVAL CONSTRAINT id_contract_type_pk PRIMARY KEY NOT NULL
, CONTRACT_NAME VARCHAR2(50)  NOT NULL
, VERSION NUMBER(2,0) DEFAULT 1
, UPDATE_DATE TIMESTAMP default sysdate
, INSERT_DATE TIMESTAMP default sysdate
, STATUS NUMBER(1,0) DEFAULT 1
);

CREATE TABLE CONTRACTS
(
  ID_CONTRACT INTEGER DEFAULT CONTRACT_SEQ.NEXTVAL CONSTRAINT id_contract_pk PRIMARY KEY NOT NULL
, ID_WORKER INTEGER NOT NULL
, ID_CONTRACT_TYPE INTEGER NOT NULL
, START_DATE varchar(10) NOT NULL
, END_DATE varchar(10) default '12/12/2100'
, SALARY NUMBER(8,2) NOT NULL
, ID_VALUE_TYPE INTEGER DEFAULT 1
, VERSION NUMBER(2,0) DEFAULT 1
, UPDATE_DATE TIMESTAMP default sysdate
, INSERT_DATE TIMESTAMP default sysdate
, STATUS NUMBER(1,0) DEFAULT 1
, CONSTRAINT id_value_type_c_fk FOREIGN KEY (ID_VALUE_TYPE) REFERENCES VALUE_TYPES(ID_VALUE_TYPE)
, CONSTRAINT id_contract_type_fk FOREIGN KEY (ID_CONTRACT_TYPE) REFERENCES CONTRACT_TYPES(ID_CONTRACT_TYPE)
, CONSTRAINT id_contract_worker_fk FOREIGN KEY (ID_WORKER) REFERENCES WORKERS(ID_WORKER)
);

CREATE TABLE ORDERS_STATUS
(
  ID_ORDER_STATUS INTEGER DEFAULT ORDER_STATUS_SEQ.NEXTVAL CONSTRAINT id_order_status_pk PRIMARY KEY NOT NULL
, ORDER_STATUS_NAME VARCHAR2(15) NOT NULL
, VERSION NUMBER(2,0) DEFAULT 1
, UPDATE_DATE TIMESTAMP default sysdate
, INSERT_DATE TIMESTAMP default sysdate
, STATUS NUMBER(1,0) DEFAULT 1
);

CREATE TABLE ORDERS_USER
(
  ID_ORDER INTEGER DEFAULT ORDER_USER_SEQ.NEXTVAL CONSTRAINT id_order_pk PRIMARY KEY NOT NULL
, ORDER_NUMBER VARCHAR2(10) NOT NULL
, ID_CLIENT NUMBER 
, ID_PRODUCT NUMBER NOT NULL
, AMOUNT_PRODUCT VARCHAR2(30) NOT NULL 
, ID_AMOUNT_TYPE INTEGER 
, ORDER_DATE VARCHAR2(10) 
, ID_ORDER_STATUS INTEGER
, VERSION NUMBER(2,0) DEFAULT 1
, UPDATE_DATE TIMESTAMP default sysdate
, INSERT_DATE TIMESTAMP default sysdate
, STATUS NUMBER(1,0) DEFAULT 1
, CONSTRAINT id_amount_type_o_fk FOREIGN KEY (ID_AMOUNT_TYPE) REFERENCES AMOUNT_TYPES(ID_AMOUNT_TYPE)
, CONSTRAINT id_status_order_fk FOREIGN KEY (ID_ORDER_STATUS) REFERENCES ORDERS_STATUS(ID_ORDER_STATUS)
);

CREATE TABLE WAREHOUSE
(
  ID_WAREHOUSE INTEGER DEFAULT WAREHOUSE_SEQ.NEXTVAL CONSTRAINT id_warehouse_pk PRIMARY KEY NOT NULL
, ID_PRODUCT NUMBER NOT NULL
, PRODUCT_AMOUNT NUMBER(8,2) NOT NULL
, ID_AMOUNT_TYPE INTEGER NOT NULL
, DATE_ADD varchar(10) 
, VERSION NUMBER(2,0) DEFAULT 1
, UPDATE_DATE TIMESTAMP default sysdate
, INSERT_DATE TIMESTAMP default sysdate
, STATUS NUMBER(1,0) DEFAULT 1
, CONSTRAINT id_amount_type_w_fk FOREIGN KEY (ID_AMOUNT_TYPE) REFERENCES AMOUNT_TYPES(ID_AMOUNT_TYPE)
, CONSTRAINT id_product_n_fk FOREIGN KEY (ID_PRODUCT) REFERENCES PRODUCTS(ID_PRODUCT)
);

CREATE TABLE CONTACTS 
(
  ID_CONTACT INTEGER DEFAULT CONTACT_SEQ.NEXTVAL CONSTRAINT id_contact_pk PRIMARY KEY NOT NULL
, email VARCHAR2(40) 
, tel_1 NUMBER(12) 
, tel_2 NUMBER(12)
, ID_WORKER INTEGER default null 
, ID_CLIENT INTEGER default null 
, VERSION NUMBER(2,0) DEFAULT 1
, UPDATE_DATE TIMESTAMP default sysdate
, INSERT_DATE TIMESTAMP default sysdate
, STATUS NUMBER(1,0) DEFAULT 1
, CONSTRAINT id_contact_client_fk FOREIGN KEY (ID_CLIENT) REFERENCES CLIENTS(ID_CLIENT)
, CONSTRAINT id_contact_worker_fk FOREIGN KEY (ID_WORKER) REFERENCES WORKERS(ID_WORKER)
);

CREATE TABLE ADDRESS_TYPES
(
  ID_ADDRESS_TYPE INTEGER DEFAULT ADDRESS_TYPE_SEQ.NEXTVAL CONSTRAINT id_address_type_pk PRIMARY KEY NOT NULL
, ADDRESS_TYPE VARCHAR2(20)  NOT NULL
, VERSION NUMBER(2,0) DEFAULT 1
, UPDATE_DATE TIMESTAMP default sysdate
, INSERT_DATE TIMESTAMP default sysdate
, STATUS NUMBER(1,0) DEFAULT 1
);

CREATE TABLE ADDRESSES
(
  ID_ADDRESS INTEGER DEFAULT ADDRESS_SEQ.NEXTVAL CONSTRAINT id_address_pk PRIMARY KEY NOT NULL
, CITY VARCHAR2(40) NOT NULL
, STREET VARCHAR2(40) NOT NULL 
, POSTAL_CODE VARCHAR2(6)
, HNUMBER VARCHAR2(5)
, COUNTRY VARCHAR2(20) DEFAULT 'PL'
, ID_ADDRESS_TYPE INTEGER NOT NULL
, ID_WORKER INTEGER default null 
, ID_CLIENT INTEGER default null 
, VERSION NUMBER(2,0) DEFAULT 1
, UPDATE_DATE TIMESTAMP default sysdate
, INSERT_DATE TIMESTAMP default sysdate
, STATUS NUMBER(1,0) DEFAULT 1
, CONSTRAINT id_address_client_fk FOREIGN KEY (ID_CLIENT) REFERENCES CLIENTS(ID_CLIENT)
, CONSTRAINT id_address_worker_fk FOREIGN KEY (ID_WORKER) REFERENCES WORKERS(ID_WORKER)
, CONSTRAINT id_address_type_addres_fk FOREIGN KEY (ID_ADDRESS_TYPE) REFERENCES ADDRESS_TYPES(ID_ADDRESS_TYPE)
);

CREATE TABLE CLIENTS_FIRM
(
  ID_CLIENT_FIRM INTEGER DEFAULT CLIENT_FIRM_SEQ.NEXTVAL CONSTRAINT id_client_firm_pk PRIMARY KEY NOT NULL
, FIRM_NAME VARCHAR2(50) NOT NULL
, NIP NUMBER(10) NOT NULL
, REGON VARCHAR2(15)
, ADDRESS VARCHAR2(100)
, ID_CLIENT INTEGER NOT NULL
, VERSION NUMBER(2,0) DEFAULT 1
, UPDATE_DATE TIMESTAMP default sysdate
, INSERT_DATE TIMESTAMP default sysdate
, STATUS NUMBER(1,0) DEFAULT 1
, CONSTRAINT id_client_firm_fk FOREIGN KEY (ID_CLIENT) REFERENCES CLIENTS(ID_CLIENT)
);

CREATE TABLE LOGS
(
  ID_LOG INTEGER DEFAULT LOG_SEQ.NEXTVAL PRIMARY KEY NOT NULL
, TABLE_NAME VARCHAR2(20) NOT NULL
, OPERATION VARCHAR2(60)
, OLD_VALUE VARCHAR2(300)
, NEW_VALUE VARCHAR2(300)
, EVENT_DATE TIMESTAMP default sysdate 
, INSERT_DATE TIMESTAMP default sysdate 
);