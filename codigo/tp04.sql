-- 1) a) A efectos de ordenar el legajo de la Universidad, es necesario contar con un listado de todos los legajos, apellidos y nombres y carrera de la Universidad. Genere un listado con esa información.
SELECT 	legajo,
		apellido_nombre,
		carrera
FROM estudiantes;

-- 1) b) La Universidad desea implementar una nueva sede en la ciudad de Pilar y va a diseñar una encuesta para los estudiantes que provienen de esa Ciudad. En función del modelo de datos, seleccione la nómina de estudiantes (legajo, apellido y nombre y correo electrónico) que residen en la ciudad de Pilar.
SELECT 	legajo,
		apellido_nombre,
		carrera
FROM estudiantes
WHERE localidad='PILAR';

-- 1) c) Devuelva la nómina (legajo y comisión) de estudiantes que cursaron la actividad académica de código 11401 en el 1/2016.
SELECT 	legajo,
		comision
FROM cursadas
WHERE asignatura=12974
AND cuatrimestre_cursada=1
AND anio_cursada=2016;

-- 1) d) Dado que se ha dispuesto un feriado para el día 14/02/2018, es necesario contar con los datos (legajo, materia) de los inscriptos en las mesas de examen de la Sede de San Marcos. Genere esa información.
SELECT	legajo,
		asignatura
FROM finales
WHERE fecha_examen='14-02-2018' and sede_examen='San Marcos';

-- 2) a) El área de Seguimiento de Estudiantes requiere la información de aquellos estudiantes (apellido y nombre, carrera, año de ingreso) que se encuentren en condición de libres en la Carrera pero que hayan cursado una materia durante el año 2018 a efectos de intentar incluirlos en el programa de reinserción Universitaria. Genere ese listado ordenado por apellido y nombre.

SELECT	e.apellido_nombre,
		e.carrera,
		e.anio_ingreso
FROM estudiantes e
WHERE e.estado LIKE '%LIBRE%'
AND legajo IN ( SELECT legajo
			  	FROM cursadas
			  	WHERE anio_cursada>=2020)
ORDER BY 1;

-- 2) b) La docente de la asignatura COSTOS (20046) desea contactar a una estudiante que tuvo en una cursada de la que no recuerda el año en la Sede Canning y para lo que único recuerda es que su nombre de pila es “Pamela” y que promovió la cursada. Devuelva un listado de las posibles candidatas con legajo, apellido y nombres, correo electrónico y dirección.

SELECT	*
FROM estudiantes e
INNER JOIN cursadas c ON e.legajo=c.legajo
WHERE c.asignatura=20046 and c.condicion='P' and apellido_nombre like '%PAMELA';

-- 4) a) Cree una consulta con los estudiantes (legajo y apellido_nombre) que cursaron una materia en Lima en 1-2016 o que rindieron examen entre 01-01-2016 y 01-07-2016.
SELECT 	e.legajo,
		e.apellido_nombre,
		'CURSARON 1/2016'
FROM estudiantes e
WHERE legajo IN (SELECT legajo 
				 FROM cursadas 
				 WHERE centro_cursada='Lima' AND cuatrimestre_cursada=1 AND anio_cursada=2016)
UNION
SELECT 	e.legajo,
		e.apellido_nombre,
		'RINDIERON EXAMEN 2016'
FROM estudiantes e
WHERE legajo IN (SELECT legajo 
				 FROM finales 
				 WHERE fecha_examen>='01-01-2016' AND fecha_examen<='01-07-2016');

-- 4) b) Ahora, modifique la consulta anterior para obtener los que cursaron, pero no rindieron examen.
SELECT 	e.legajo,
		e.apellido_nombre
FROM estudiantes e
WHERE legajo IN (SELECT legajo 
				 FROM cursadas 
				 WHERE centro_cursada='Lima' AND cuatrimestre_cursada=1 AND anio_cursada=2016)
EXCEPT
SELECT 	e.legajo,
		e.apellido_nombre
FROM estudiantes e
WHERE legajo IN (SELECT legajo 
				 FROM finales 
				 WHERE fecha_examen>='01-01-2016' AND fecha_examen<='01-07-2016');
				 
-- 6) a) Devuelva un listado con la cantidad de estudiantes regulares por Carrera y Sede.

SELECT	carrera,
		sede,
		COUNT(*) as cantidad_estudiantes
FROM estudiantes
GROUP BY 1, 2;

-- 6) b) Realice una consulta con la cantidad de inscriptos por materia y comisión de la Sede Lima en 1-2016.

SELECT	asignatura,
		comision,
		COUNT(*) AS cantidad_inscriptos
FROM cursadas
WHERE centro_cursada='Lima' and cuatrimestre_cursada=1 and anio_cursada=2016
GROUP BY 1, 2
ORDER BY 1, 2;

-- 6) c) Calcule el promedio del estudiante con legajo 314915 (tenga en cuenta que los ausentes se registran con 99).
SELECT	legajo,
		AVG(calificacion)
FROM finales
WHERE legajo=314915 and calificacion<>99 and calificacion IS NOT NULL
GROUP BY legajo;