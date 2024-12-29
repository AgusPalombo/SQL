-- Auxiliares
-- DROP TABLE Facultades;
-- DROP TABLE Carreras;
-- DROP TABLE Alumnos;


CREATE DATABASE DatosFacultadesAlumnos;
USE DatosFacultadesAlumnos;

-- ESTAS TABLAS Y SUS DATOS SERAN UTILIZADOS PARA POSTERIORMENTE SER ANALIZADAS EN EXCEL

-- Tabla de Facultades
CREATE TABLE IF NOT EXISTS Facultades(
	ID INT PRIMARY KEY,
    NOMBRE VARCHAR(100) NOT NULL UNIQUE,
    CantidadCarreras INT NOT NULL,
    PromedioGeneral DECIMAL(4,2) NOT NULL
);

-- Tabla de Carreras
CREATE TABLE IF NOT EXISTS Carreras(
	ID INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL UNIQUE,
    FacultadID INT NOT NULL,
    CantidadMaterias INT NOT NULL,
    PromedioGeneralCarrera DECIMAL(4, 2) NOT NULL,
    FOREIGN KEY (FacultadID) REFERENCES Facultades(ID)
);


-- Tabla de Alumnos
CREATE TABLE IF NOT EXISTS Alumnos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    NombreFacultad VARCHAR(100) NOT NULL,
    NombreCarrera VARCHAR(100) NOT NULL,
    Promedio DECIMAL(4, 2) NOT NULL,
    FOREIGN KEY (NombreFacultad) REFERENCES Facultades(NOMBRE),
    FOREIGN KEY (NombreCarrera) REFERENCES Carreras(Nombre)
);


-- INSERTS DE DATOS

-- INSERT FACULTADES
INSERT INTO Facultades (ID, Nombre, CantidadCarreras, PromedioGeneral) VALUES
(1, 'Facultad de Ingeniería', 2, 0.00),
(2, 'Facultad de Derecho', 2, 0.00),
(3, 'Facultad de Ciencias Económicas', 2, 0.00),
(4, 'Facultad de Humanidades', 2, 0.00),
(5, 'Facultad de Medicina', 3, 0.00);


-- INSERT CARRERAS
INSERT INTO Carreras (ID, Nombre, FacultadID, CantidadMaterias, PromedioGeneralCarrera) VALUES
(1, 'Ingeniería Civil', 1, 40, 0.00),
(2, 'Ingeniería Informática', 1, 35, 0.00),
(3, 'Abogacía', 2, 30, 0.00),
(4, 'Notariado', 2, 25, 0.00),
(5, 'Contabilidad', 3, 30, 0.00),
(6, 'Economía', 3, 28, 0.00),
(7, 'Historia', 4, 22, 0.00),
(8, 'Sociología', 4, 20, 0.00),
(9, 'Medicina', 5, 50, 0.00),
(10, 'Enfermería', 5, 45, 0.00),
(11, 'Odontología', 5, 42, 0.00);


-- SELECT ALL
SELECT * FROM facultades;
SELECT * FROM carreras;
SELECT * FROM alumnos;


-- ALGORITMO DE MODIFICACION DE PROMEDIOS GENERALES, PREVIO A LA INSERCION DE DATOS DE ALUMNOS

-- PROMEDIO DE FACULTAD
DELIMITER $$

CREATE TRIGGER CalcularPromedioFacultadAfterInsert
AFTER INSERT ON Alumnos
FOR EACH ROW
BEGIN
    -- Declaramos una variable para almacenar el promedio de la facultad
    DECLARE promedioFacultad DECIMAL(4,2);
    
    -- Calculamos el promedio de la facultad sumando los promedios de las carreras
    SELECT AVG(PromedioGeneralCarrera)
    INTO promedioFacultad
    FROM Carreras
    WHERE FacultadID = (SELECT ID FROM Facultades WHERE NOMBRE = NEW.NombreFacultad);
    
    -- Actualizamos el promedio general de la facultad
    UPDATE Facultades
    SET PromedioGeneral = promedioFacultad
    WHERE NOMBRE = NEW.NombreFacultad;
END $$

DELIMITER ;

	
-- PROMEDIO DE CARRERA
DELIMITER $$

CREATE TRIGGER CalcularPromedioCarreraAfterInsert
AFTER INSERT ON Alumnos
FOR EACH ROW
BEGIN
    -- Actualizamos el promedio de la carrera
    UPDATE Carreras
    SET PromedioGeneralCarrera = (
        SELECT AVG(Promedio)
        FROM Alumnos
        WHERE NombreCarrera = NEW.NombreCarrera
    )
    WHERE Nombre = NEW.NombreCarrera;
END $$

DELIMITER ;


-- INSERT ALUMNOS
INSERT INTO Alumnos (Nombre, Apellido, NombreFacultad, NombreCarrera, Promedio) VALUES
('Juan', 'Pérez', 'Facultad de Ingeniería', 'Ingeniería Civil', 7.5),
('Ana', 'López', 'Facultad de Ingeniería', 'Ingeniería Informática', 8.0),
('Carlos', 'Gómez', 'Facultad de Ingeniería', 'Ingeniería Civil', 6.9),
('María', 'Fernández', 'Facultad de Derecho', 'Abogacía', 7.0),
('Luis', 'Martínez', 'Facultad de Derecho', 'Notariado', 6.8),
('Sofía', 'Rodríguez', 'Facultad de Derecho', 'Abogacía', 7.4),
('Pedro', 'González', 'Facultad de Ciencias Económicas', 'Contabilidad', 6.5),
('Lucía', 'Sánchez', 'Facultad de Ciencias Económicas', 'Economía', 7.1),
('David', 'Ramírez', 'Facultad de Humanidades', 'Historia', 5.2),
('Paula', 'Morales', 'Facultad de Humanidades', 'Sociología', 6.9),
('Javier', 'Hernández', 'Facultad de Humanidades', 'Historia', 6.8),
('Isabel', 'Torres', 'Facultad de Medicina', 'Medicina', 8.2),
('Fernando', 'Díaz', 'Facultad de Medicina', 'Odontología', 7.8),
('Gabriela', 'Gutiérrez', 'Facultad de Medicina', 'Enfermería', 6.9),
('Tomás', 'Chavez', 'Facultad de Medicina', 'Medicina', 7.2),
('Elena', 'Suárez', 'Facultad de Medicina', 'Odontología', 8.1),
('Esteban', 'Vega', 'Facultad de Ciencias Económicas', 'Economía', 6.6),
('Raúl', 'Flores', 'Facultad de Ciencias Económicas', 'Contabilidad', 7.4),
('Marta', 'Moreno', 'Facultad de Derecho', 'Notariado', 6.3),
('Víctor', 'Cruz', 'Facultad de Ingeniería', 'Ingeniería Informática', 7.3);


-- Chequear promedios de Medicina EJEMPLO
SELECT Nombre, PromedioGeneralCarrera 
FROM Carreras; 

SELECT Nombre, PromedioGeneral 
FROM Facultades;

SELECT Nombre, Promedio 
FROM Alumnos;




-- Obtener los promedios de un alumno alumnos junto con el promedio de su carrera y de su facultad
SELECT 
    a.Nombre AS Alumno, 
    a.Promedio AS PromedioAlumno, 
    c.Nombre AS Carrera, 
    c.PromedioGeneralCarrera AS PromedioCarrera, 
    f.Nombre AS Facultad, 
    f.PromedioGeneral AS PromedioFacultad
FROM 
    Alumnos a
JOIN 
    Carreras c ON a.NombreCarrera = c.Nombre
JOIN 
    Facultades f ON a.NombreFacultad = f.NOMBRE
WHERE 
    a.ID = 1  -- Modificar el ID segun que alumno querramos ver--
;

-- Obtener todos los alumnos junto con los promedios de sus carreras y facultades

SELECT 
    a.Nombre AS Alumno, 
    a.Promedio AS PromedioAlumno, 
    c.Nombre AS Carrera, 
    c.PromedioGeneralCarrera AS PromedioCarrera, 
    f.Nombre AS Facultad, 
    f.PromedioGeneral AS PromedioFacultad
FROM 
    Alumnos a
JOIN 
    Carreras c ON a.NombreCarrera = c.Nombre
JOIN 
    Facultades f ON a.NombreFacultad = f.NOMBRE;


-- Obtener los alumnos cuya carrera y facultad tengan un promedio superior a 7.5

SELECT 
    a.Nombre AS Alumno,
    a.Promedio AS PromedioAlumno,
    c.Nombre AS Carrera,
    c.PromedioGeneralCarrera AS PromedioCarrera,
    f.Nombre AS Facultad,
    f.PromedioGeneral AS PromedioFacultad
FROM 
    Alumnos a
INNER JOIN 
    Carreras c ON a.NombreCarrera = c.Nombre
INNER JOIN 
    Facultades f ON a.NombreFacultad = f.NOMBRE
WHERE 
    c.PromedioGeneralCarrera > 7.5
    AND f.PromedioGeneral > 7.5;


-- Consulta para obtener alumnos con promedio mayor a 7.0

SELECT 
    Nombre, 
    Apellido, 
    NombreFacultad, 
    NombreCarrera, 
    Promedio
FROM 
    Alumnos
WHERE 
    Promedio > 7;

