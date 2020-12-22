use almacen_db;



/* ------------------------------------------- INSERT ROLE ------------------------------------------- */
INSERT INTO role (role_name, state) VALUES ('Administrador', 1);
INSERT INTO role (role_name, state) VALUES ('Cajero', 1);
INSERT INTO role (role_name, state) VALUES ('Cocinero', 1);




/* ------------------------------------------- INSERT SUPPLIER ------------------------------------------- */
INSERT INTO supplier (supplier_name, supplier_commercial_name, ruc, photo, state) VALUES ('Gloria', 'Gloria S.A.C.', '109329823', '');
INSERT INTO supplier (supplier_name, supplier_commercial_name, ruc, photo, state) VALUES ('Live', 'Live S.A.', '1927378232', '');




/* ------------------------------------------- INSERT CATEGORY ------------------------------------------- */
INSERT INTO category (category_name, state) VALUES ('Gaseosa', 1);
INSERT INTO category (category_name, state) VALUES ('Envase', 1);
INSERT INTO category (category_name, state) VALUES ('Fruta', 1);