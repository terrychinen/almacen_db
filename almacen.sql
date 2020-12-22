CREATE DATABASE almacen_db;
use almacen_db;



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




/*TOKEN*/
CREATE TABLE token(
	token_id     INT			NOT NULL AUTO_INCREMENT PRIMARY KEY,		/*token_id*/
    token_key    LONGTEXT   	NOT NULL,									/*llave_token*/
    created_at   DATETIME       NOT NULL,									/*creado_a_las*/ 
    expires_in   BIGINT    		NOT NULL,									/*expira_en*/
	state        TINYINT	    NOT NULL DEFAULT 1							/*estado*/
);




/*ROL*/
CREATE TABLE role(
    role_id     INT       		NOT NULL AUTO_INCREMENT PRIMARY KEY,		/*rol_id*/
    role_name   VARCHAR(100)    NOT NULL,									/*nombre_rol*/
    state       TINYINT 	    NOT NULL DEFAULT 1							/*estado*/
);




/*USUARIO*/
CREATE TABLE user(
    user_id         BIGINT      	 NOT NULL PRIMARY KEY,		/*usuario_id*/
    role_id         INT      	 	 NOT NULL,					/*rol_id*/
    token_id        INT	  	 		 NULL,						/*token_id*/
    username        VARCHAR(100)  	 NOT NULL,					/*nombre_usuario*/
    password        VARCHAR(255)   	 NOT NULL,					/*clave*/
    state           TINYINT       	 NOT NULL DEFAULT 1,		/*estado*/

    FOREIGN KEY     (user_id)       REFERENCES      person(person_id),
    FOREIGN KEY     (role_id)       REFERENCES      role(role_id),
    FOREIGN KEY     (token_id)      REFERENCES      token(token_id)
);




/*CATEGORIA*/
CREATE TABLE category(
    category_id         INT      		NOT NULL AUTO_INCREMENT PRIMARY KEY,		/*categoria_id*/
    category_name       VARCHAR(100)   	NOT NULL,   								/*nombre_categoria*/
    state               TINYINT     	NOT NULL DEFAULT 1							/*estado*/
);




/*MARCA*/
CREATE TABLE BRAND(
    brand_id                 INT                NOT NULL AUTO_INCREMENT PRIMARY KEY,		/*marca_id*/
    brand_name               VARCHAR(100)       NOT NULL,		 							/*nombre_marca*/
    state                    TINYINT            NOT NULL DEFAULT 1		 					/*estado*/
);




/*UNIDAD*/
CREATE TABLE unit(
    unit_id             INT       		NOT NULL AUTO_INCREMENT PRIMARY KEY,		/*unidad_id*/
    unit_name           VARCHAR(50)     NOT NULL,									/*nombre_unidad*/
    symbol              VARCHAR(10)     NULL DEFAULT '',	 						/*simbolo*/
    state               TINYINT      	NOT NULL DEFAULT 1		 					/*estado*/
);




/*CANTIDAD*/
CREATE TABLE quantity(
     quantity_id              INT       	   NOT NULL AUTO_INCREMENT PRIMARY KEY,		/*nombre_cantidad*/
     quantity_name            VARCHAR(50)      NOT NULL,								/*nombre_cantidad*/
     short_name               VARCHAR(10)      NULL DEFAULT '',		 					/*nombre_corto*/
     state                    TINYINT      	   NOT NULL DEFAULT 1		 				/*estado*/
);




/*ALMACEN*/
CREATE TABLE store(
    store_id           INT		       NOT NULL AUTO_INCREMENT PRIMARY KEY,		/*almacen_id*/
    store_name         VARCHAR(100)    NOT NULL,								/*nombre_almacen*/
	state              TINYINT		   NOT NULL DEFAULT 1 					    /*estado*/
);




/*usuario_almacen*/
CREATE TABLE user_store(
		user_store_id		INT		NOT NULL AUTO_INCREMENT PRIMARY KEY,		/*usuario_almacen_id*/
        user_id				INT		NOT NULL,               				    /*usuario_id*/
        store_id			INT		NOT NULL,                                   /*almacen_id*/
        
        FOREIGN KEY (user_id) 	REFERENCES user(user_id),
        FOREIGN KEY (store_id)	REFERENCES store(store_id)
);




/*ALMACEN_CATEGORIA*/
CREATE TABLE store_category(
    store_category_id         INT		     NOT NULL AUTO_INCREMENT PRIMARY KEY,		/*almacen_categoria_id*/ 
    store_id                  INT	 	     NOT NULL,									/*almacen_id*/
    category_id               INT       	 NOT NULL,									/*categoria_id*/
    favorite                  TINYINT	     NULL DEFAULT 0,                            /*favorito*/
    state                     TINYINT	     NOT NULL DEFAULT 1,						/*estado*/

    FOREIGN KEY (store_id)     REFERENCES store(store_id),
    FOREIGN KEY (category_id)  REFERENCES category(category_id)
);




/*MERCANCIA*/
CREATE TABLE commodity(
    commodity_id            INT		        NOT NULL AUTO_INCREMENT PRIMARY KEY,		/*mercancia_id*/
    brand_id                INT             NOT NULL,									/*marca_id*/
    commodity_name          VARCHAR(200)    NOT NULL,									/*nombre_mercancia*/

    FOREIGN KEY (brand_id)          REFERENCES      brand(brand_id)
);




/*MERCANCIA_CATEGORIA*/
CREATE TABLE commodity_category(
	commodity_category_id		INT		NOT NULL AUTO_INCREMENT PRIMARY KEY,		/*mercancia_categoria_id*/
    commodity_id				INT		NOT NULL,									/*mercancia_id*/
    category_id					INT		NOT NULL,									/*category_id*/
    state						INT     NOT NULL DEFAULT 1,							/*estado*/
    
    FOREIGN KEY (commodity_id)	REFERENCES	commodity(commodity_id),
    FOREIGN KEY (category_id)	REFERENCES	category(category_id)
);




/*MERCANCIA_UNIDAD_CANTIDAD*/
CREATE TABLE commodity_unit_quantity(
    commodity_unit_quantity_id          INT                 NOT NULL AUTO_INCREMENT PRIMARY KEY,		/*mercancia_unidad_cantidad_id*/
    commodity_id            	        INT		        	NOT NULL,									/*mercancia_id*/
    unit_id						        INT       			NOT NULL,									/*unidad_id*/
    unit_value                          DOUBLE              NOT NULL DEFAULT 0.0,						/*unidad_valor*/
    quantity_id                         INT       	        NOT NULL,									/*cantidad_id*/
    quantity_value                      DOUBLE              NOT NULL DEFAULT 0.0,						/*cantidad_valor*/
    barcode                             VARCHAR(200)        NULL DEFAULT '',							/*codigo_barra*/
    photo                               VARCHAR(200)        NULL DEFAULT '',							/*foto*/
    state						        TINYINT				NOT NULL DEFAULT 1,							/*estado*/
    
    FOREIGN KEY (commodity_id) 	    REFERENCES 		commodity(commodity_id),
    FOREIGN KEY (unit_id) 			REFERENCES 		unit(unit_id),
    FOREIGN KEY (quantity_id) 	    REFERENCES 		quantity(quantity_id)
);




/*ALMACEN_MERCANCIA_UNIDAD_CANTIDAD*/
CREATE TABLE store_commodity_unit_quantity(
    store_commodity_unit_quantity_id                INT		         NOT NULL AUTO_INCREMENT PRIMARY KEY,       /*almacen_mercancia_unidad_cantidad_id*/
    commodity_unit_quantity_id                      INT		         NOT NULL,                                  /*mercancia_unidad_cantidad_id*/
    store_id                                        INT		         NOT NULL,                                  /*almacen_id*/
    stock_min                                       DOUBLE           NULL DEFAULT 0.0,                          /*abastecimiento_min*/
    stock_max                                       DOUBLE           NULL DEFAULT 0.0,                          /*abastecimiento_max*/
    current_stock                                   DOUBLE           NULL DEFAULT 0.0,                          /*actual_abastecimiento*/
	last_update                                     DATETIME         NOT NULL DEFAULT '1998-10-10',             /*ultima_actualizacion*/
    favorite 					                    INT 			 NULL DEFAULT 0,                            /*favorito*/
    user_id                                         BIGINT           NOT NULL,                                  /*usuario_id*/
    state                                           TINYINT       	 NOT NULL DEFAULT 1,                        /*estado*/

     FOREIGN KEY (commodity_unit_quantity_id) REFERENCES commodity_unit_quantity(commodity_unit_quantity_id),
     FOREIGN KEY (store_id) REFERENCES store(store_id)
);




/*ABASTECIMIENTO_HISTORIAL*/
CREATE TABLE stock_history(
	stock_history_id 			            BIGINT		    NOT NULL AUTO_INCREMENT PRIMARY KEY,        /*abastecimiento_historial_id*/
    store_commodity_unit_quantity_id	    INT 			NOT NULL,                                   /*almacen_mercancia_unidad_cantidad_id*/
    user_id						            BIGINT 			NOT NULL,                                   /*usuario_id*/
    quantity_stock_min		            	DOUBLE 			NULL DEFAULT 0.0,                           /*cantidad_abastecimiento_min*/
    quantity_stock_max			            DOUBLE 		    NULL DEFAULT 0.0,                           /*cantidad_abastecimiento_max*/
    quantity_current_stock	                DOUBLE 			NULL DEFAULT 0.0,                           /*cantidad_actual_abastecimiento*/
    quantity_addition_subtraction           DOUBLE 			NULL DEFAULT 0.0,                           /*cantidad_adicion_sustraccion*/
    date						            DATETIME		NULL DEFAULT '1998-10-10',                  /*fecha*/
    
    FOREIGN KEY (store_commodity_unit_quantity_id) REFERENCES store_commodity_unit_quantity(store_commodity_unit_quantity_id),
	FOREIGN KEY (user_id) REFERENCES user(user_id)
);




/*TIPO DE DOCUMENTO*/
CREATE TABLE document_type(
    document_type_id            INT                NOT NULL AUTO_INCREMENT PRIMARY KEY,     /*documento_tipo_id*/
    type_name                   VARCHAR(200)       NOT NULL                                 /*documento_nombre*/
);




/*DOCUMENTO*/
CREATE TABLE document(
    document_id             INT             NOT NULL AUTO_INCREMENT PRIMARY KEY,        /*documento_id*/
    document_type_id        INT             NOT NULL,                                   /*documento_tipo_id*/
    supplier_id             INT             NOT NULL,                                   /*proveedor_id*/
    user_id                 BIGINT          NOT NULL,                                   /*usuario_id*/
    document_code           VARCHAR(100)    NOT NULL,                                   /*documento_codigo*/
    discount_price          DOUBLE          NOT NULL,                                   /*descuento_precio*/
    igv                     DOUBLE          NOT NULL,                                   /*igv*/
    igv_price               DOUBLE          NOT NULL,                                   /*igv_precio*/
    total_price             DOUBLE          NOT NULL DEFAULT 0.0,                       /*total_precio*/
    date				    DATE		    NOT NULL DEFAULT '1998-10-10',              /*fecha*/ 

    FOREIGN KEY (document_type_id)       REFERENCES             document_type(document_type_id),
    FOREIGN KEY (supplier_id)            REFERENCES             supplier(supplier_id),
    FOREIGN KEY (user_id)                REFERENCES             user(user_id)
);




/*DETALLE DEL DOCUMENTO*/
CREATE TABLE document_details(
    document_details_id                   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,      /*documento_detalle_id*/
    document_id                           INT         NOT NULL,                                 /*documento_id*/
    commodity_unit_quantity_id            INT         NOT NULL,                                 /*mercancia_unidad_cantidad_id*/
    quantity                              DOUBLE      NOT NULL DEFAULT 0.0,                     /*cantidad*/
    price_unit                            DOUBLE      NOT NULL DEFAULT 0.0,                     /*precio_unitario*/

    FOREIGN KEY (document_id)                       REFERENCES      document(document_id),
    FOREIGN KEY (commodity_unit_quantity_id)        REFERENCES      commodity_unit_quantity(commodity_unit_quantity_id)

);