-- Archivo: Tablas.sql
CREATE DATABASE IF NOT EXISTS UniversidadesArgentina;
USE UniversidadesArgentina;

-- Tabla de Universidades
CREATE TABLE IF NOT EXISTS Universidades (
    Nombre VARCHAR(100) PRIMARY KEY,
    CantidadAlumnosTotal INT CHECK (CantidadAlumnosTotal BETWEEN 1000 AND 20000),
    FechaCreacion DATE NOT NULL,
    Direccion VARCHAR(200) NOT NULL
);

-- Tabla de Facultades
CREATE TABLE IF NOT EXISTS Facultades (
    Nombre VARCHAR(100) PRIMARY KEY,
    NombreUniversidad VARCHAR(100) NOT NULL,
    FOREIGN KEY (NombreUniversidad) REFERENCES Universidades(Nombre)
);

-- Tabla de Carreras
CREATE TABLE IF NOT EXISTS Carreras (
    Nombre VARCHAR(100) PRIMARY KEY,
    NombreFacultad VARCHAR(100) NOT NULL,
    FOREIGN KEY (NombreFacultad) REFERENCES Facultades(Nombre)
);

-- Tabla de Personal
CREATE TABLE IF NOT EXISTS Personal (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    DNI VARCHAR(15) UNIQUE NOT NULL,
    Edad INT NOT NULL,
    Rol ENUM('Profesor', 'Administrativo', 'Decano', 'Maestranza', 'Rector', 'Director de aulas') NOT NULL,
    Sueldo DECIMAL(10,2) NOT NULL,
    NombreUniversidad VARCHAR(100) NOT NULL,
    NombreFacultad VARCHAR(100),
    FOREIGN KEY (NombreUniversidad) REFERENCES Universidades(Nombre),
    FOREIGN KEY (NombreFacultad) REFERENCES Facultades(Nombre)
);



-- Tabla de Alumnos
CREATE TABLE IF NOT EXISTS Alumnos (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    DNI VARCHAR(15) UNIQUE NOT NULL,
    Edad INT NOT NULL,
    Promedio DECIMAL(4,2) CHECK (Promedio BETWEEN 0 AND 10),
    NombreUniversidad VARCHAR(100) NOT NULL,
    NombreFacultad VARCHAR(100) NOT NULL,
    NombreCarrera VARCHAR(100) NOT NULL,
    FOREIGN KEY (NombreUniversidad) REFERENCES Universidades(Nombre),
    FOREIGN KEY (NombreFacultad) REFERENCES Facultades(Nombre),
    FOREIGN KEY (NombreCarrera) REFERENCES Carreras(Nombre)
);



