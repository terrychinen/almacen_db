CREATE DATABASE sorpresa_db;
use sorpresa_db;



/*PERSONA*/
CREATE TABLE person(
    person_id                BIGINT             NOT NULL AUTO_INCREMENT PRIMARY KEY,		 /*persona_id*/
    first_name               VARCHAR(200)       NOT NULL,									 /*nombres*/
    last_name                VARCHAR(200)       NOT NULL,									 /*apellidos*/
    dni                      VARCHAR(15)        NULL DEFAULT '',		 					 /*dni*/
    ruc                      VARCHAR(15)        NULL DEFAULT '',		 					 /*ruc*/
    passport				 VARCHAR(15) 		NULL DEFAULT '',		 					 /*pasaporte*/
    photo                    VARCHAR(200)       NULL DEFAULT '',		 					 /*foto*/
    state                    TINYINT       	    NOT NULL DEFAULT 1		 					 /*estado*/
);
