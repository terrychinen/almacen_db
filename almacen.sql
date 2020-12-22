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




/*PERSONA_EMAIL*/
CREATE TABLE person_email(
    person_email_id          INT             NOT NULL AUTO_INCREMENT PRIMARY KEY,		/*persona_correo_electronico_id*/
    person_id                BIGINT          NOT NULL,									/*persona_id*/
    email                    VARCHAR(200)    NOT NULL UNIQUE,							/*correo_electronica*/
    state                    TINYINT       	 NOT NULL DEFAULT 1,						/*estado*/

    FOREIGN KEY     (person_id)     REFERENCES person(person_id)
);




/*PERSONA_TELEFONO*/
CREATE TABLE person_phone(
    person_phone_id          INT             NOT NULL AUTO_INCREMENT PRIMARY KEY,		/*persona_telefono_id*/
    person_id                BIGINT          NOT NULL,									/*persona_id*/
    phone                    VARCHAR(200)    NOT NULL UNIQUE,							/*telefono*/          
    state                    TINYINT       	 NOT NULL DEFAULT 1,						/*estado*/

    FOREIGN KEY     (person_id)     REFERENCES person(person_id)
);




/*PERSONA_DIRECCION*/
CREATE TABLE person_address(
    person_address_id        INT             NOT NULL AUTO_INCREMENT PRIMARY KEY,		/*persona_direccion_id*/
    person_id                BIGINT          NOT NULL,									/*persona_id*/
    address                  VARCHAR(200)    NOT NULL UNIQUE,							/*direccion*/
    state                    TINYINT       	 NOT NULL DEFAULT 1,						/*estado*/

    FOREIGN KEY     (person_id)     REFERENCES person(person_id)
);