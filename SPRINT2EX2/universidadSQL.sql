SELECT apellido1, apellido2, nombre FROM universidad.persona ORDER BY apellido1, apellido2, nombre;
SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE telefono IS NULL;
SELECT * FROM universidad.persona WHERE YEAR(fecha_nacimiento) = 1999;

SELECT * FROM universidad.persona 
WHERE tipo = "Profesor" AND telefono IS NULL AND RIGHT(NIF, 1) = "K";

SELECT * FROM universidad.asignatura
WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

SELECT persona.apellido1, persona.apellido2, persona.nombre, departamento.nombre FROM persona
INNER JOIN profesor ON persona.id = profesor.id_profesor 
INNER JOIN departamento ON profesor.id_departamento = departamento.id WHERE tipo = "profesor"
ORDER BY apellido1 , apellido2 , persona.nombre, departamento.nombre;

SELECT asignatura.nombre, curso_escolar.anyo_inicio, curso_escolar.anyo_fin FROM persona
INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno
INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
INNER JOIN asignatura ON alumno_se_matricula_asignatura.id_asignatura = asignatura.id
WHERE persona.nif = '26902806M';

SELECT departamento.nombre FROM departamento
INNER JOIN profesor ON departamento.id_departamento = profesor.id_departamento
INNER JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor
INNER JOIN grado ON asignatura.id_grado = grado.id
WHERE grado.nombre = 'Enginyeria Informàtica' AND grado.pla_estudis = '2015';

SELECT * FROM persona
INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno 
INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id 
WHERE curso_escolar.anyo_inicio = 2018 AND curso_escolar.anyo_fin = 2019;

SELECT departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre FROM persona
LEFT JOIN profesor ON persona.id = profesor.id_profesor
LEFT JOIN departamento ON profesor.id_departamento = departamento.id
ORDER BY departamento.nombre, persona.apellido1, persona.apellido2, persona.nombre;

SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona 
LEFT JOIN profesor ON persona.id = profesor.id_profesor
WHERE profesor.id_departamento IS NULL;

SELECT departamento.nombre FROM departamento
LEFT JOIN profesor ON departamento.id = profesor.id_departamento
WHERE profesor.id_profesor IS NULL;

SELECT persona.apellido1, persona.apellido2, persona.nombre FROM persona 
LEFT JOIN asignatura ON persona.id = asignatura.id_profesor
WHERE asignatura.id_profesor IS NULL AND persona.tipo = 'profesor';

SELECT asignatura.nombre, asignatura.id_profesor FROM asignatura
LEFT JOIN profesor ON asignatura.id_profesor = profesor.id_profesor
WHERE asignatura.id_profesor IS NULL;

SELECT DISTINCT departamento.nombre FROM departamento
LEFT JOIN profesor ON departamento.id = profesor.id_departamento
LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor
WHERE asignatura.id IS NULL;

SELECT COUNT(*) FROM persona WHERE tipo = 'alumno';
SELECT COUNT(*) FROM persona WHERE YEAR(fecha_nacimiento) = 1999 AND tipo = 'alumno';

SELECT departamento.nombre, COUNT(profesor.id_profesor) AS nombre_profes FROM departamento
INNER JOIN profesor ON departamento.id = profesor.id_departamento
GROUP BY departamento.nombre ORDER BY nombre_profes DESC;

SELECT departamento.nombre, COUNT(profesor.id_profesor) AS nombre_profes FROM departamento
LEFT JOIN profesor ON departamento.id = profesor.id_departamento
GROUP BY departamento.nombre;

SELECT grado.nombre, COUNT(asignatura.id) AS nombre_d_assignatures FROM grado
LEFT JOIN asignatura ON grado.id = asignatura.id_grado
GROUP BY grado.nombre ORDER BY nombre_d_assignatures DESC;

SELECT grado.nombre, COUNT(asignatura.id) AS nombre_d_assignatures FROM grado
LEFT JOIN asignatura ON grado.id = asignatura.id_grado
GROUP BY grado.nombre HAVING COUNT(asignatura.id) > 40 ORDER BY nombre_d_assignatures DESC;

SELECT grado.nombre, asignatura.tipo, SUM(asignatura.creditos) FROM grado
LEFT JOIN asignatura ON grado.id = asignatura.id_grado
GROUP BY grado.nombre, asignatura.tipo ORDER BY SUM(asignatura.creditos) DESC;

SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(asignatura.id) AS nombre_asig FROM persona p
LEFT JOIN asignatura ON p.id = asignatura.id_profesor
WHERE p.tipo = 'profesor'
GROUP BY p.id, p.nombre, p.apellido1, p.apellido2 ORDER BY nombre_asig DESC;

SELECT * FROM persona  WHERE fecha_nacimiento = (SELECT MIN(fecha_nacimiento) FROM persona);

SELECT persona.nombre, persona.apellido1, persona.apellido2 FROM persona
JOIN profesor ON persona.id = profesor.id_profesor 
LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor 
WHERE asignatura.id IS NULL AND profesor.id_departamento IS NOT NULL;



