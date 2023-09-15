CREATE TABLE instituciones(
	id 				serial PRIMARY KEY,
	institucion		text NOT NULL,
	tipo			text NOT NULL,
	cpres			text
);

--SELECT * FROM instituciones;

CREATE TABLE nuevos_inscriptos(
	id_institucion		integer NOT NULL REFERENCES instituciones(id),
	anio				integer NOT NULL,
	cantidad_mujeres	numeric,
	cantidad_hombres	numeric,
	PRIMARY KEY(id_institucion, anio)
);

--SELECT * FROM nuevos_inscriptos;

CREATE TABLE reinscriptos(
	id_institucion		integer NOT NULL REFERENCES instituciones(id),
	anio				integer NOT NULL,
	cantidad_mujeres	numeric,
	cantidad_hombres	numeric,
	PRIMARY KEY(id_institucion, anio)
);

--SELECT * FROM reinscriptos;

CREATE TABLE egresados(
	id_institucion		integer NOT NULL REFERENCES instituciones(id),
	anio				integer NOT NULL,
	cantidad_mujeres	numeric,
	cantidad_hombres	numeric,
	PRIMARY KEY(id_institucion, anio)
);

--SELECT * FROM egresados;
