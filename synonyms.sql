    /*
	Synonimy do tabel.
    ------------------------------------------------------------------------------------------------------
    VERSION      DATE         AUTHOR     DESCRIPTION
    1.0.21/05    21/05/2020   b.kicior   Utworzenie synonimów. 
    ------------------------------------------------------------------------------------------------------
    */
	
CREATE SYNONYM klienci FOR isop.clients;
CREATE SYNONYM adresy FOR isop.addresses;
CREATE SYNONYM adres_typ FOR isop.address_types;
CREATE SYNONYM ilosc_typ FOR isop.amount_types;
CREATE SYNONYM klienci_firma FOR isop.clients_firm;
CREATE SYNONYM kontakty FOR isop.contacts;
CREATE SYNONYM umowa_typ FOR isop.contract_types;
CREATE SYNONYM umowy FOR isop.contracts;
CREATE SYNONYM faktury FOR isop.factures;
CREATE SYNONYM statusy_zamowien FOR isop.orders_status;
CREATE SYNONYM zamowienia FOR isop.orders;
CREATE SYNONYM pozycja_faktury FOR isop.positions;
CREATE SYNONYM produkt_typ FOR isop.product_types;
CREATE SYNONYM produkty FOR isop.products;
CREATE SYNONYM uzytkownicy FOR isop.users;
CREATE SYNONYM uzytkownicy_firma FOR isop.users_firm;
CREATE SYNONYM waluta_typ FOR isop.value_types;
CREATE SYNONYM magazyn FOR isop.warehouse;
CREATE SYNONYM pracownicy FOR isop.workers;
