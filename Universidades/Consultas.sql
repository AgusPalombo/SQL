-- Consultar todos los registros de la tabla Universidades 
SELECT * FROM Universidades;
-- Consultar todos los registros de la tabla Facultades
SELECT * FROM Facultades;
-- Consultar todos los registros de la tabla Carreras
SELECT * FROM Carreras;
-- Consultar todos los registros de la tabla Personal
SELECT * FROM Personal;
-- Consultar todos los registros de la tabla Alumnos
SELECT * FROM Alumnos;


-- Facultades por universidad
SELECT u.Nombre AS Universidad, GROUP_CONCAT(f.Nombre SEPARATOR ', ') AS Facultades
FROM Universidades u
JOIN Facultades f ON f.NombreUniversidad = u.Nombre
GROUP BY u.Nombre;


-- Carreras por universidad
SELECT u.Nombre AS Universidad, GROUP_CONCAT(c.Nombre SEPARATOR ', ') AS Carreras
FROM Universidades u
JOIN Facultades f ON f.NombreUniversidad = u.Nombre
JOIN Carreras c ON c.NombreFacultad = f.Nombre
GROUP BY u.Nombre;

-- Alumnos por universidad
SELECT u.Nombre AS Universidad, COUNT(DISTINCT a.Nombre) AS CantidadAlumnos
FROM Universidades u
JOIN Facultades f ON f.NombreUniversidad = u.Nombre
JOIN Alumnos a ON a.NombreFacultad = f.Nombre
GROUP BY u.Nombre;

-- Promedio de la universidad
SELECT u.Nombre AS Universidad, AVG(a.Promedio) AS PromedioGeneral
FROM Universidades u
JOIN Facultades f ON f.NombreUniversidad = u.Nombre
JOIN Alumnos a ON a.NombreUniversidad = u.Nombre
GROUP BY u.Nombre;

-- Promedio por facultad
SELECT f.Nombre AS Facultad, AVG(a.Promedio) AS PromedioFacultad
FROM Facultades f
JOIN Alumnos a ON a.NombreFacultad = f.Nombre
GROUP BY f.Nombre;

-- Promedio por carrera
SELECT c.Nombre AS Carrera, AVG(a.Promedio) AS PromedioCarrera
FROM Carreras c
JOIN Alumnos a ON a.NombreCarrera = c.Nombre
GROUP BY c.Nombre;

-- Alumnos mayores de 20 años con promedio mayor a 7.5
SELECT Nombre, Apellido, Edad, Promedio
FROM Alumnos
WHERE Edad > 20 AND Promedio > 7.5;

-- Alumnos con mayor y menor promedio

-- Alumno con el mayor promedio
SELECT Nombre, Apellido, Promedio, NombreUniversidad, NombreFacultad, NombreCarrera
FROM Alumnos
ORDER BY Promedio DESC
LIMIT 1;

-- Alumno con el menor promedio
SELECT Nombre, Apellido, Promedio
FROM Alumnos
ORDER BY Promedio ASC
LIMIT 1;

-- Alumnos más grandes (mayores de edad)
SELECT Nombre, Apellido, Edad
FROM Alumnos
ORDER BY Edad DESC
LIMIT 1;