CREATE TABLE año(
	id 			INTEGER NOT NULL,
	descripcion CHARACTER VARYING(100),
	PRIMARY KEY (id)
);

CREATE TABLE mes(
	id				INTEGER NOT NULL,
	descripcion		CHARACTER VARYING(50),
	nro_referencia	INTEGER NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE generacion(
	id				INTEGER NOT NULL,
	descripcion		CHARACTER VARYING(50),
	fecha_inicio	DATE NOT NULL,
	fecha_fin		DATE NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE genero(
	id 			INTEGER NOT NULL,
	descripcion CHARACTER VARYING(100),
	PRIMARY KEY (id)
);

CREATE TABLE tipo_documento(
	id 			INTEGER NOT NULL,
	descripcion CHARACTER VARYING(100),
	PRIMARY KEY (id)
);

CREATE TABLE area(
	id 			INTEGER NOT NULL,
	descripcion CHARACTER VARYING(100),
	PRIMARY KEY (id)
);

CREATE TABLE cargo(
	id 			INTEGER NOT NULL,
	descripcion CHARACTER VARYING(100),
	PRIMARY KEY (id)
);

CREATE TABLE tipo_contrato(
	id 			INTEGER NOT NULL,
	descripcion CHARACTER VARYING(100),
	PRIMARY KEY (id)
);

CREATE TABLE tipo_renuncia(
	id 			INTEGER NOT NULL,
	descripcion CHARACTER VARYING(100),
	PRIMARY KEY (id)
);

CREATE TABLE estado_contrato(
	id 			INTEGER NOT NULL,
	descripcion CHARACTER VARYING(100),
	PRIMARY KEY (id)
);

CREATE TABLE estado_renuncia(
	id 			INTEGER NOT NULL,
	descripcion CHARACTER VARYING(100),
	PRIMARY KEY (id)
);

CREATE TABLE persona(
	id 				 INTEGER NOT NULL,
	nombre 			 CHARACTER VARYING(150),
	ape_paterno	 	 CHARACTER VARYING(150),
	ape_materno		 CHARACTER VARYING(150),
	fecha_nacimiento DATE,
	nro_documento	 CHARACTER VARYING(15),
	direccion	 	 CHARACTER VARYING(100),
	telefono	 	 CHARACTER VARYING(100),
	correo	 	 	 CHARACTER VARYING(100),
	idTipoDocumento  INTEGER NOT NULL,
	idGenero		 INTEGER,
	idGeneracion	 INTEGER,
	PRIMARY KEY (id),
	FOREIGN KEY (idTipoDocumento) REFERENCES tipo_documento (id),
	FOREIGN KEY (idGenero) 		  REFERENCES generacion 	(id),
	FOREIGN KEY (idGeneracion) 	  REFERENCES genero 		(id)
);

CREATE TABLE contrato(
	id INTEGER NOT NULL,
	fecha_inicio DATE,
	fecha_fin DATE,
	id_estado INTEGER,
	id_persona INTEGER,
	id_area		INTEGER,
	id_cargo	INTEGER,
	id_tipo_contrato	INTEGER,
	PRIMARY KEY (id),
	FOREIGN KEY (id_estado) REFERENCES estado_contrato (id),
	FOREIGN KEY (id_persona) REFERENCES persona (id),
	FOREIGN KEY (id_area) REFERENCES area (id),
	FOREIGN KEY (id_cargo) REFERENCES cargo (id),
	FOREIGN KEY (id_tipo_contrato) REFERENCES tipo_contrato (id)
);

CREATE TABLE renuncia(
	id INTEGER NOT NULL,
	descripcion CHARACTER VARYING(100),
	fecha_renuncia DATE,
	id_estado INTEGER,
	id_tipo_renuncia INTEGER,
	id_contrato	INTEGER,
	PRIMARY KEY (id),
	FOREIGN KEY (id_estado) REFERENCES estado_renuncia (id),
	FOREIGN KEY (id_tipo_renuncia) REFERENCES tipo_renuncia (id),
	FOREIGN KEY (id_contrato) REFERENCES contrato (id)
);