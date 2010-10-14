﻿CREATE DATABASE IF NOT EXISTS administracionedificios;
USE administracionedificios;

CREATE TABLE EDIFICIO
(
  ID INTEGER NOT NULL AUTO_INCREMENT,
  NOMBRE VARCHAR(45) NOT NULL ,
  FONDO_ORDINARIO DOUBLE NOT NULL ,
  FONDO_EXTRAORDINARIO DOUBLE NOT NULL ,
  FORMA_LIQ_EXP VARCHAR(45) NOT NULL ,
  APTO_PROFESIONAL BIT NOT NULL ,
  TASA_ANUAL DOUBLE NOT NULL ,
  AMORTIZACION VARCHAR(45) NOT NULL ,
  CALLE VARCHAR(45) NOT NULL ,
  NUMERO INTEGER NOT NULL ,
  LOCALIDAD VARCHAR(45) NOT NULL ,
  ENCARGADO_NOMBRE VARCHAR(45) NOT NULL ,
  ENCARGADO_TELEFONO VARCHAR(45) NOT NULL ,
  ENCARGADO_DEPTO VARCHAR(10) NOT NULL ,
  ENCARGADO_PISO VARCHAR(10) NOT NULL ,
  DIA_PRIMER_VTO INTEGER  NOT NULL ,
  DIA_SEGUNDO_VTO INTEGER  NULL ,
  MORA VARCHAR(45) NOT NULL ,
  PRIMARY KEY (ID)
) ENGINE=InnoDB;
CREATE UNIQUE INDEX EDIFICIO_UQ1 ON EDIFICIO (NOMBRE ASC);
-- -----------------------------------------------------
-- Table TIPO_GASTO
-- -----------------------------------------------------
CREATE  TABLE  TIPO_GASTO 
(
  ID INTEGER NOT NULL AUTO_INCREMENT,
  CODIGO VARCHAR(45) NOT NULL ,
  DESCRIPCION VARCHAR(45) NOT NULL ,
  TIPO VARCHAR(20) NOT NULL ,
  PRIMARY KEY (ID)
)ENGINE=InnoDB;
CREATE UNIQUE INDEX TIPO_GASTO_UQ1 ON TIPO_GASTO (CODIGO ASC);

-- -----------------------------------------------------
-- Table GASTO
-- -----------------------------------------------------
CREATE  TABLE  GASTO
(
  ID INTEGER NOT NULL AUTO_INCREMENT,
  NRO_FOLIO INTEGER NOT NULL ,
  MONTO DOUBLE NOT NULL ,
  DETALLE VARCHAR(45) NOT NULL ,
  ID_TIPO_GASTO INTEGER NOT NULL ,
  ID_EDIFICIO INTEGER NOT NULL ,
  PRIMARY KEY (ID),
  CONSTRAINT GASTO_TIPO_GASTO_FK1 FOREIGN KEY (ID_TIPO_GASTO) REFERENCES TIPO_GASTO (ID),
  CONSTRAINT GASTO_EDIFICIO_FK2 FOREIGN KEY (ID_EDIFICIO) REFERENCES EDIFICIO (ID)
) ENGINE=InnoDB;
CREATE INDEX GASTO_TIPO_GASTO_FK1 ON GASTO (ID_TIPO_GASTO ASC);
CREATE INDEX GASTO_EDIFICIO_FK2 ON GASTO (ID_EDIFICIO ASC);
CREATE UNIQUE INDEX GASTO_UQ1 ON GASTO (NRO_FOLIO ASC, ID_EDIFICIO ASC);

-- -----------------------------------------------------
-- Table GASTO_REAL
-- -----------------------------------------------------
CREATE  TABLE  GASTO_REAL 
(
  ID INTEGER NOT NULL AUTO_INCREMENT,
  GASTO_ID INTEGER NOT NULL,
  RAZON_SOCIAL VARCHAR(45) NOT NULL ,
  FECHA_PAGO DATETIME NOT NULL ,
  NRO_FACTURA_PAGO INTEGER NOT NULL ,
  FORMA_PAGO VARCHAR(45) NOT NULL ,
  ESTADO VARCHAR(1) NOT NULL,
  PRIMARY KEY (ID) ,
  CONSTRAINT GASTO_REAL_FK1 FOREIGN KEY (GASTO_ID)  REFERENCES GASTO (ID)
) ENGINE=InnoDB;
CREATE UNIQUE INDEX GASTO_REAL_UQ1 ON GASTO_REAL (FECHA_PAGO ASC, NRO_FACTURA_PAGO ASC, FORMA_PAGO ASC);
CREATE INDEX GASTO_REAL_FK1 ON GASTO_REAL (GASTO_ID ASC);


-- -----------------------------------------------------
-- Table GASTO_PREVISION
-- -----------------------------------------------------
CREATE  TABLE  GASTO_PREVISION
(
  ID INTEGER NOT NULL AUTO_INCREMENT,
  GASTO_ID INTEGER NOT NULL,
  ANIO INTEGER NOT NULL ,
  MES INTEGER NOT NULL ,
  PRIMARY KEY (ID) ,
  CONSTRAINT GASTO_PREVISION_FK1  FOREIGN KEY (GASTO_ID)  REFERENCES GASTO (ID)
) ENGINE=InnoDB;
CREATE INDEX GASTO_PREVISION_FK1 ON GASTO_PREVISION (GASTO_ID ASC);

-- -----------------------------------------------------
-- Table TIPO_GASTO_ORDINARIO
-- -----------------------------------------------------
CREATE  TABLE  TIPO_GASTO_ORDINARIO
(
  ID INTEGER NOT NULL AUTO_INCREMENT,
  TIPO_GASTO_ID INTEGER NOT NULL,
  PRIMARY KEY (ID) ,
  CONSTRAINT TIPO_GASTO_ORDINARIO_FK1  FOREIGN KEY (TIPO_GASTO_ID)  REFERENCES TIPO_GASTO (ID)
) ENGINE=InnoDB;
CREATE INDEX TIPO_GASTO_ORDINARIO_FK1 ON TIPO_GASTO_ORDINARIO (TIPO_GASTO_ID ASC);

-- -----------------------------------------------------
-- Table TIPO_GASTO_EXTRAORDINARIO
-- -----------------------------------------------------
CREATE  TABLE  TIPO_GASTO_EXTRAORDINARIO
(
  ID INTEGER NOT NULL AUTO_INCREMENT,
  TIPO_GASTO_ID INTEGER NOT NULL,
  PRIMARY KEY (ID) ,
  CONSTRAINT TIPO_GASTO_EXTRAORDINARIO_FK1  FOREIGN KEY (TIPO_GASTO_ID)  REFERENCES TIPO_GASTO (ID)
) ENGINE=InnoDB;
CREATE INDEX TIPO_GASTO_EXTRAORDINARIO_FK1 ON TIPO_GASTO_EXTRAORDINARIO (TIPO_GASTO_ID ASC);

-- -----------------------------------------------------
-- Table TIPO_GASTO_PERIODICO
-- -----------------------------------------------------
CREATE  TABLE  TIPO_GASTO_PERIODICO
(
  ID INTEGER NOT NULL AUTO_INCREMENT,
  TIPO_GASTO_ID INTEGER NOT NULL,
  PERIODO VARCHAR(45) NOT NULL ,
  ID_EDIFICIO INTEGER NOT NULL ,
  PRIMARY KEY (ID) ,
  CONSTRAINT TIPO_GASTO_PERIODICO_FK1  FOREIGN KEY (TIPO_GASTO_ID)  REFERENCES TIPO_GASTO(ID),
  CONSTRAINT TIPO_GASTO_PERIODICO_EDIFICIO_FK2  FOREIGN KEY (ID_EDIFICIO)  REFERENCES EDIFICIO(ID)
) ENGINE=InnoDB;
CREATE INDEX TIPO_GASTO_PERIODICO_FK1 ON TIPO_GASTO_PERIODICO (TIPO_GASTO_ID ASC) ;
CREATE INDEX TIPO_GASTO_PERIODICO_EDIFICIO_FK2 ON TIPO_GASTO_PERIODICO (ID_EDIFICIO ASC) ;

-- -----------------------------------------------------
-- Table TIPO_GASTO_EVENTUAL
-- -----------------------------------------------------
CREATE  TABLE  TIPO_GASTO_EVENTUAL
(
  ID INTEGER NOT NULL AUTO_INCREMENT,
  TIPO_GASTO_ID INTEGER NOT NULL,
  PRIMARY KEY (ID) ,
  CONSTRAINT TIPO_GASTO_EVENTUAL_FK1  FOREIGN KEY (TIPO_GASTO_ID)  REFERENCES TIPO_GASTO(ID)
) ENGINE=InnoDB;
CREATE INDEX TIPO_GASTO_EVENTUAL_FK1 ON TIPO_GASTO_EVENTUAL (TIPO_GASTO_ID ASC) ;

-- -----------------------------------------------------
-- Table TIPO_GASTO_MONTO_FIJO
-- -----------------------------------------------------
CREATE  TABLE  TIPO_GASTO_MONTO_FIJO
(
  ID INTEGER NOT NULL AUTO_INCREMENT,
  TIPO_GASTO_ID INTEGER NOT NULL,
  DIA_LIMITE INTEGER NOT NULL ,
  MONTO_ACTUAL DOUBLE NOT NULL ,
  PRIMARY KEY (ID) ,
  CONSTRAINT TIPO_GASTO_MONTO_FIJO_FK1  FOREIGN KEY (TIPO_GASTO_ID)  REFERENCES TIPO_GASTO(ID)
) ENGINE=InnoDB;
CREATE INDEX TIPO_GASTO_MONTO_FIJO_FK1 ON TIPO_GASTO_MONTO_FIJO (TIPO_GASTO_ID ASC);

-- -----------------------------------------------------
-- Table TIPO_GASTO_MONTO_VARIABLE
-- ----------------------------------------------------
CREATE  TABLE  TIPO_GASTO_MONTO_VARIABLE 
(
  ID INTEGER NOT NULL AUTO_INCREMENT,
  TIPO_GASTO_ID INTEGER NOT NULL,
  MONTO_PREV DOUBLE NOT NULL ,
  PROXIMO_VENCIMIENTO DATETIME NOT NULL ,
  PRIMARY KEY (ID) ,
  CONSTRAINT TIPO_GASTO_MONTO_VARIABLE_FK1  FOREIGN KEY (TIPO_GASTO_ID)  REFERENCES TIPO_GASTO(ID)
) ENGINE=InnoDB;
CREATE INDEX TIPO_GASTO_MONTO_VARIABLE_FK1 ON TIPO_GASTO_MONTO_VARIABLE (TIPO_GASTO_ID ASC);

-- -----------------------------------------------------
-- Table TIPO_PROPIEDAD
-- -----------------------------------------------------
CREATE  TABLE  TIPO_PROPIEDAD
(
  ID INTEGER NOT NULL AUTO_INCREMENT,
  NOMBRE_TIPO VARCHAR(45) NOT NULL ,
  ID_EDIFICIO INTEGER NOT NULL ,
  PRIMARY KEY (ID) ,
  CONSTRAINT TIPO_PROPIEDAD_EDIFICIO_FK1  FOREIGN KEY (ID_EDIFICIO)  REFERENCES EDIFICIO (ID)
) ENGINE=InnoDB;
CREATE INDEX TIPO_PROPIEDAD_EDIFICIO_FK1 ON TIPO_PROPIEDAD (ID_EDIFICIO ASC);
CREATE UNIQUE INDEX TIPO_PROPIEDAD_UQ1 ON TIPO_PROPIEDAD (NOMBRE_TIPO ASC, ID_EDIFICIO ASC);

-- -----------------------------------------------------
-- Table TIPO_PROPIEDAD_TIPO_GASTO
-- -----------------------------------------------------
CREATE  TABLE  TIPO_PROPIEDAD_TIPO_GASTO
(
  ID INTEGER NOT NULL AUTO_INCREMENT,
  ID_TIPO_PROPIEDAD INTEGER NOT NULL ,
  ID_TIPO_GASTO INTEGER NOT NULL ,
  COEFICIENTE_DISTRIBUCION DOUBLE NULL ,
  PRIMARY KEY (ID),
  CONSTRAINT TIPO_PROPIEDAD_TIPO_GASTO_FK1  FOREIGN KEY (ID_TIPO_PROPIEDAD)  REFERENCES TIPO_PROPIEDAD (ID),
  CONSTRAINT TIPO_PROPIEDAD_TIPO_GASTO_FK2  FOREIGN KEY (ID_TIPO_GASTO)  REFERENCES TIPO_GASTO (ID)
) ENGINE=InnoDB;
CREATE UNIQUE INDEX TIPO_PROPIEDAD_TIPO_GASTO_UQ1 ON TIPO_PROPIEDAD_TIPO_GASTO (ID_TIPO_PROPIEDAD ASC, ID_TIPO_GASTO ASC);
CREATE INDEX TIPO_PROPIEDAD_TIPO_GASTO_FK1 ON TIPO_PROPIEDAD_TIPO_GASTO (ID_TIPO_PROPIEDAD ASC);
CREATE INDEX TIPO_PROPIEDAD_TIPO_GASTO_FK2 ON TIPO_PROPIEDAD_TIPO_GASTO (ID_TIPO_GASTO ASC);

-- -----------------------------------------------------
-- Table PROPIEDAD
-- -----------------------------------------------------
    create table PROPIEDAD (
        ID integer not null auto_increment unique,
        CTA_EXT_SALDO_EXP double precision not null,
        CTA_EXT_SALDO_INT double precision not null,
        CTA_ORD_SALDO_EXP double precision not null,
        CTA_ORD_SALDO_INT double precision not null,
        NIVEL integer not null,
        ORDEN integer not null,
        version integer not null,
        inquilino_dni integer,
        poderInquilino_dni integer,
        poderPropietario_dni integer,
        propietario_dni integer not null,
        tipoPropiedad_ID integer not null,
        primary key (ID),
	unique (NIVEL, ORDEN)
    ) type=InnoDB;

-- -----------------------------------------------------
-- Table RESPONSABLE
-- -----------------------------------------------------
    create table Responsable (
        dni integer not null,
        autoridad bit,
        calle varchar(255),
        email varchar(255),
        localidad varchar(255),
        telefono varchar(255),
        ubicacion varchar(255),
        version integer,
        primary key (dni)
    ) type=InnoDB;

    alter table PROPIEDAD 
        add index FK7B38234821FB2DA0 (poderPropietario_dni), 
        add constraint FK7B38234821FB2DA0 
        foreign key (poderPropietario_dni) 
        references Responsable (dni);

    alter table PROPIEDAD 
        add index FK7B38234852D21872 (poderInquilino_dni), 
        add constraint FK7B38234852D21872 
        foreign key (poderInquilino_dni) 
        references Responsable (dni);

    alter table PROPIEDAD 
        add index PROPIEDAD_TIPO_PROPIEDAD_FK1 (tipoPropiedad_ID), 
        add constraint FK7B38234894A43229 
        foreign key (tipoPropiedad_ID) 
        references TIPO_PROPIEDAD (ID);

    alter table PROPIEDAD 
        add index FK7B382348340888E4 (inquilino_dni), 
        add constraint FK7B382348340888E4 
        foreign key (inquilino_dni) 
        references Responsable (dni);

    alter table PROPIEDAD 
        add index FK7B3823488F574992 (propietario_dni), 
        add constraint FK7B3823488F574992 
        foreign key (propietario_dni) 
        references Responsable (dni);

-- -----------------------------------------------------
-- Table EXPENSA
-- -----------------------------------------------------
CREATE  TABLE  EXPENSA
(
  ID INTEGER NOT NULL AUTO_INCREMENT,
  NRO_OP INTEGER NOT NULL ,
  ORD_EXT CHAR NOT NULL ,
  ID_PROPIEDAD INTEGER NOT NULL ,
  MONTO DOUBLE NOT NULL ,
  INTERESES DOUBLE NULL ,
  PRIMARY KEY (ID) ,
  CONSTRAINT EXPENSA_PROPIEDAD_FK1  FOREIGN KEY (ID_PROPIEDAD)  REFERENCES PROPIEDAD (ID)
) ENGINE=InnoDB;
CREATE UNIQUE INDEX EXPENSA_UQ1 ON EXPENSA (NRO_OP ASC, ORD_EXT ASC, ID_PROPIEDAD ASC);
CREATE INDEX EXPENSA_PROPIEDAD_FK1 ON EXPENSA (ID_PROPIEDAD ASC);

-- -----------------------------------------------------
-- Table EXPENSA_LIQUIDACION
-- -----------------------------------------------------
CREATE  TABLE  EXPENSA_LIQUIDACION
(
  ID INTEGER NOT NULL AUTO_INCREMENT,
  DEUDA_PREVIA DOUBLE NULL ,
  INT_SEGUNDO_VTO DOUBLE NULL ,
  EXPENSA_ID INTEGER NOT NULL ,
  PRIMARY KEY (ID) ,
  CONSTRAINT EXPENSA_LIQUIDACION_FK1  FOREIGN KEY (EXPENSA_ID)  REFERENCES EXPENSA (ID)
) ENGINE=InnoDB;
CREATE INDEX EXPENSA_LIQUIDACION_FK1 ON EXPENSA_LIQUIDACION (EXPENSA_ID ASC);

-- -----------------------------------------------------
-- Table EXPENSA_COBRO
-- -----------------------------------------------------
CREATE  TABLE  EXPENSA_COBRO
(
  ID INTEGER NOT NULL AUTO_INCREMENT,
  FECHA DATETIME NOT NULL ,
  COMPROBANTE VARCHAR(45) NOT NULL ,
  EXPENSA_ID INTEGER NOT NULL ,
  PRIMARY KEY (ID) ,
  CONSTRAINT EXPENSA_COBRO_FK1  FOREIGN KEY (EXPENSA_ID)  REFERENCES EXPENSA (ID)
) ENGINE=InnoDB;
CREATE INDEX EXPENSA_COBRO_FK1 ON EXPENSA_COBRO (EXPENSA_ID ASC);

-- -----------------------------------------------------
-- Table PERFIL
-- -----------------------------------------------------
CREATE TABLE PERFIL (
   DESCRIPCION VARCHAR(45) NOT NULL,
   ID INTEGER NOT NULL AUTO_INCREMENT,
   PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table USUARIO
-- -----------------------------------------------------
CREATE TABLE USUARIO (
   NOMBRE VARCHAR(45) NOT NULL,
   APELLIDO VARCHAR(45) NOT NULL,
   PASSWORD VARCHAR(45) NOT NULL,
   DNI INTEGER NOT NULL,
   USUARIO VARCHAR(45) NOT NULL,
   ID INTEGER NOT NULL AUTO_INCREMENT,
   PRIMARY KEY (ID)
) ENGINE=InnoDB;
CREATE UNIQUE INDEX USUARIO_UQ1 ON USUARIO (DNI ASC);
CREATE UNIQUE INDEX USUARIO_UQ2 ON USUARIO (USUARIO ASC);

-- -----------------------------------------------------
-- Table USUARIO_PERFIL
-- -----------------------------------------------------
CREATE TABLE USUARIO_PERFIL (
  ID_USUARIO INTEGER NOT NULL,
  ID_PERFIL INTEGER NOT NULL,
  ID INTEGER NOT NULL AUTO_INCREMENT,
  CONSTRAINT USUARIO_PERFIL_FK1 FOREIGN KEY (ID_USUARIO) REFERENCES USUARIO (ID),
  CONSTRAINT USUARIO_PERFIL_FK2 FOREIGN KEY (ID_PERFIL) REFERENCES PERFIL(ID),
  PRIMARY KEY (ID)
) ENGINE = InnoDB;
CREATE UNIQUE INDEX USUARIO_PERFIL_UQ1 ON USUARIO_PERFIL (ID_USUARIO ASC, ID_PERFIL ASC);

-- -----------------------------------------------------
-- Table USUARIO_PERFIL_EDIFICIO
-- -----------------------------------------------------
CREATE TABLE USUARIO_PERFIL_EDIFICIO (
  ID_USUARIO_PERFIL INTEGER NOT NULL,
  ID_EDIFICIO INTEGER NULL,
  ID INTEGER NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (ID),
  CONSTRAINT USUARIO_PERFIL_EDIFICIO_FK1 FOREIGN KEY (ID_USUARIO_PERFIL) REFERENCES USUARIO_PERFIL (ID),
  CONSTRAINT USUARIO_PERFIL_EDIFICIO_FK2 FOREIGN KEY (ID_EDIFICIO) REFERENCES EDIFICIO(ID)
) ENGINE = InnoDB;
CREATE UNIQUE INDEX USUARIO_PERFIL_EDIFICIO_UQ1 ON USUARIO_PERFIL_EDIFICIO (ID_USUARIO_PERFIL ASC, ID_EDIFICIO ASC);