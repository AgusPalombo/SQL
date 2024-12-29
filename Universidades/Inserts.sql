-- Archivo: Insert.sql
USE UniversidadesArgentina;

-- Insert de Universidades
INSERT INTO Universidades (Nombre, CantidadAlumnosTotal, FechaCreacion, Direccion)
VALUES
('Universidad de Buenos Aires', 15000, '1821-08-12', 'Av. Córdoba 2100, CABA'),
('Universidad Nacional de Córdoba', 12000, '1613-06-19', 'Haya de la Torre s/n, Córdoba'),
('Universidad Nacional de La Plata', 14000, '1905-08-12', 'Calle 7 n° 776, La Plata'),
('Universidad Nacional del Litoral', 11000, '1919-10-17', 'Bv. Pellegrini 2750, Santa Fe'),
('Universidad Nacional de Rosario', 13000, '1968-11-29', 'Córdoba 1814, Rosario');

-- Insert de Facultades
INSERT INTO Facultades (Nombre, NombreUniversidad)
VALUES
('Facultad de Ingeniería', 'Universidad de Buenos Aires'),
('Facultad de Derecho', 'Universidad de Buenos Aires'),
('Facultad de Ciencias Económicas', 'Universidad de Buenos Aires'),
('Facultad de Medicina', 'Universidad Nacional de Córdoba'),
('Facultad de Ciencias Sociales', 'Universidad Nacional de Córdoba'),
('Facultad de Arquitectura', 'Universidad Nacional de La Plata'),
('Facultad de Humanidades', 'Universidad Nacional de La Plata'),
('Facultad de Ciencias Exactas', 'Universidad Nacional del Litoral'),
('Facultad de Agronomía', 'Universidad Nacional del Litoral'),
('Facultad de Psicología', 'Universidad Nacional de Rosario');

-- Insert de Carreras
INSERT INTO Carreras (Nombre, NombreFacultad)
VALUES
('Ingeniería Civil', 'Facultad de Ingeniería'),
('Ingeniería Informática', 'Facultad de Ingeniería'),
('Derecho', 'Facultad de Derecho'),
('Notariado', 'Facultad de Derecho'),
('Contabilidad', 'Facultad de Ciencias Económicas'),
('Economía', 'Facultad de Ciencias Económicas'),
('Medicina', 'Facultad de Medicina'),
('Enfermería', 'Facultad de Medicina'),
('Sociología', 'Facultad de Ciencias Sociales'),
('Historia', 'Facultad de Ciencias Sociales'),
('Arquitectura', 'Facultad de Arquitectura'),
('Diseño de Interiores', 'Facultad de Arquitectura'),
('Filosofía', 'Facultad de Humanidades'),
('Literatura', 'Facultad de Humanidades'),
('Matemática', 'Facultad de Ciencias Exactas'),
('Física', 'Facultad de Ciencias Exactas'),
('Agronomía', 'Facultad de Agronomía'),
('Veterinaria', 'Facultad de Agronomía'),
('Psicología General', 'Facultad de Psicología'),
('Psicopedagogía', 'Facultad de Psicología');

-- Insert de Personal
INSERT INTO Personal (Nombre, Apellido, DNI, Edad, Rol, Sueldo, NombreUniversidad, NombreFacultad)
VALUES

-- Rectores (uno por universidad)
('Jesus', 'Pérez', '20127456', 55, 'Rector', 2500000, 'Universidad de Buenos Aires', NULL),
('Carlos', 'López', '22126456', 52, 'Rector', 2400000, 'Universidad Nacional de Córdoba', NULL),
('Juana', 'Gómez', '23123436', 58, 'Rector', 2450000, 'Universidad Nacional de La Plata', NULL),
('Maria', 'Fernández', '24153456', 54, 'Rector', 2300000, 'Universidad Nacional del Litoral', NULL),
('Carla', 'Martínez', '25123656', 53, 'Rector', 2350000, 'Universidad Nacional de Rosario', NULL),


-- Decanos (uno por universidad)
('Juan', 'Pérez', '20123456', 55, 'Decano', 2500000, 'Universidad de Buenos Aires', NULL),
('María', 'López', '22123456', 52, 'Decano', 2400000, 'Universidad Nacional de Córdoba', NULL),
('Carlos', 'Gómez', '23123456', 58, 'Decano', 2450000, 'Universidad Nacional de La Plata', NULL),
('Ana', 'Fernández', '24123456', 54, 'Decano', 2300000, 'Universidad Nacional del Litoral', NULL),
('Luis', 'Martínez', '25123456', 53, 'Decano', 2350000, 'Universidad Nacional de Rosario', NULL),

-- Directores de Aulas (uno por universidad)
('Pedro', 'Sánchez', '26123456', 48, 'Director de aulas', 1800000, 'Universidad de Buenos Aires', NULL),
('Sofía', 'Ramírez', '27123456', 46, 'Director de aulas', 1705000, 'Universidad Nacional de Córdoba', NULL),
('David', 'Torres', '28123456', 50, 'Director de aulas', 1700000, 'Universidad Nacional de La Plata', NULL),
('Isabel', 'Hernández', '29123456', 47, 'Director de aulas', 1605000, 'Universidad Nacional del Litoral', NULL),
('Tomás', 'Suárez', '30123456', 49, 'Director de aulas', 1600000, 'Universidad Nacional de Rosario', NULL),

-- Profesores (distribuidos en varias facultades)
('Elena', 'Gutiérrez', '31123456', 40, 'Profesor', 1200000, 'Universidad de Buenos Aires', 'Facultad de Ingeniería'),
('Fernando', 'Chávez', '32123456', 42, 'Profesor', 1180000, 'Universidad de Buenos Aires', 'Facultad de Derecho'),
('Marta', 'Moreno', '33123456', 39, 'Profesor', 1150000, 'Universidad Nacional de Córdoba', 'Facultad de Ciencias Sociales'),
('Esteban', 'Vega', '34123456', 44, 'Profesor', 1170000, 'Universidad Nacional de Córdoba', 'Facultad de Medicina'),
('Raúl', 'Flores', '35123456', 41, 'Profesor', 1160000, 'Universidad Nacional de La Plata', 'Facultad de Humanidades'),
('Lucía', 'Cruz', '36123456', 45, 'Profesor', 1140000, 'Universidad Nacional de La Plata', 'Facultad de Arquitectura'),
('Gabriela', 'Díaz', '37123456', 38, 'Profesor', 1130000, 'Universidad Nacional del Litoral', 'Facultad de Ciencias Exactas'),
('Paula', 'Ramírez', '38123456', 43, 'Profesor', 1120000, 'Universidad Nacional del Litoral', 'Facultad de Agronomía'),
('Javier', 'Torres', '39123456', 36, 'Profesor', 1100000, 'Universidad Nacional de Rosario', 'Facultad de Psicología'),
('Víctor', 'Gómez', '40123456', 37, 'Profesor', 1080000, 'Universidad Nacional de Rosario', 'Facultad de Ciencias Económicas'),

-- Administrativos
('Clara', 'Alonso', '41123456', 34, 'Administrativo', 900000, 'Universidad de Buenos Aires', 'Facultad de Ciencias Económicas'),
('Diego', 'Luna', '42123456', 35, 'Administrativo', 920000, 'Universidad Nacional de Córdoba', 'Facultad de Medicina'),
('Valeria', 'Molina', '43123456', 33, 'Administrativo', 880000, 'Universidad Nacional de La Plata', 'Facultad de Humanidades'),
('Santiago', 'Peralta', '44123456', 32, 'Administrativo', 890000, 'Universidad Nacional del Litoral', 'Facultad de Ciencias Exactas'),
('Carolina', 'Ramos', '45123456', 30, 'Administrativo', 870000, 'Universidad Nacional de Rosario', 'Facultad de Psicología'),

-- Maestranza (solo universidad)
('Pablo', 'Fernández', '46123456', 50, 'Maestranza', 750000, 'Universidad de Buenos Aires', NULL),
('Rosa', 'García', '47123456', 48, 'Maestranza', 740000, 'Universidad Nacional de Córdoba', NULL),
('Marcos', 'López', '48123456', 52, 'Maestranza', 760000, 'Universidad Nacional de La Plata', NULL),
('Julia', 'Núñez', '49123456', 49, 'Maestranza', 730000, 'Universidad Nacional del Litoral', NULL),
('Andrea', 'Castro', '50123456', 51, 'Maestranza', 720000, 'Universidad Nacional de Rosario', NULL);


-- Insert Alumnos
INSERT INTO Alumnos (Nombre, Apellido, DNI, Edad, NombreUniversidad, NombreFacultad, NombreCarrera, Promedio)
VALUES
('Juan', 'Pérez', '10123456', 20, 'Universidad de Buenos Aires', 'Facultad de Ingeniería', 'Ingeniería Civil', 7.5),
('Ana', 'López', '12123456', 22, 'Universidad de Buenos Aires', 'Facultad de Ingeniería', 'Ingeniería Informática', 8.0),
('Carlos', 'Gómez', '13123456', 21, 'Universidad de Buenos Aires', 'Facultad de Derecho', 'Derecho', 6.9),
('María', 'Fernández', '14123456', 23, 'Universidad de Buenos Aires', 'Facultad de Ciencias Económicas', 'Contabilidad', 7.0),
('Luis', 'Martínez', '15123456', 24, 'Universidad Nacional de Córdoba', 'Facultad de Medicina', 'Medicina', 7.8),
('Sofía', 'Rodríguez', '16123456', 19, 'Universidad Nacional de Córdoba', 'Facultad de Medicina', 'Enfermería', 6.9),
('Pedro', 'González', '17123456', 25, 'Universidad Nacional de Córdoba', 'Facultad de Ciencias Sociales', 'Sociología', 7.1),
('Lucía', 'Sánchez', '18123456', 22, 'Universidad Nacional de Córdoba', 'Facultad de Ciencias Sociales', 'Historia', 6.8),
('David', 'Ramírez', '19123456', 20, 'Universidad Nacional de La Plata', 'Facultad de Humanidades', 'Literatura', 5.2),
('Paula', 'Morales', '20123456', 21, 'Universidad Nacional de La Plata', 'Facultad de Humanidades', 'Filosofía', 6.9),
('Javier', 'Hernández', '21123456', 23, 'Universidad Nacional de La Plata', 'Facultad de Arquitectura', 'Diseño de Interiores', 7.4),
('Isabel', 'Torres', '22123456', 26, 'Universidad Nacional de La Plata', 'Facultad de Arquitectura', 'Arquitectura', 7.2),
('Fernando', 'Díaz', '23123456', 22, 'Universidad Nacional del Litoral', 'Facultad de Ciencias Exactas', 'Matemática', 8.2),
('Gabriela', 'Gutiérrez', '24123456', 24, 'Universidad Nacional del Litoral', 'Facultad de Ciencias Exactas', 'Física', 6.9),
('Tomás', 'Chavez', '25123456', 27, 'Universidad Nacional del Litoral', 'Facultad de Agronomía', 'Agronomía', 8.1),
('Elena', 'Suárez', '26123456', 23, 'Universidad Nacional del Litoral', 'Facultad de Agronomía', 'Veterinaria', 7.3),
('Esteban', 'Vega', '27123456', 21, 'Universidad Nacional de Rosario', 'Facultad de Psicología', 'Psicología General', 7.8),
('Raúl', 'Flores', '28123456', 22, 'Universidad Nacional de Rosario', 'Facultad de Ciencias Económicas', 'Economía', 7.4),
('Marta', 'Moreno', '29123456', 20, 'Universidad Nacional de Rosario', 'Facultad de Ciencias Económicas', 'Contabilidad', 6.3),
('Víctor', 'Cruz', '30123456', 24, 'Universidad Nacional de Rosario', 'Facultad de Ciencias Económicas', 'Economía', 6.9),
('Julieta', 'Alonso', '31123456', 25, 'Universidad de Buenos Aires', 'Facultad de Derecho', 'Notariado', 8.0),
('Diego', 'Molina', '32123456', 22, 'Universidad Nacional de Córdoba', 'Facultad de Medicina', 'Medicina', 7.2),
('Valeria', 'Peralta', '33123456', 23, 'Universidad Nacional de La Plata', 'Facultad de Humanidades', 'Historia', 7.9),
('Santiago', 'Ramos', '34123456', 24, 'Universidad Nacional del Litoral', 'Facultad de Ciencias Exactas', 'Física', 7.1),
('Carolina', 'Fernández', '35123456', 21, 'Universidad Nacional de Rosario', 'Facultad de Ciencias Económicas', 'Economía', 6.7),
('Pablo', 'García', '36123456', 23, 'Universidad Nacional de Rosario', 'Facultad de Psicología', 'Psicología General', 7.5),
('Rosa', 'López', '37123456', 20, 'Universidad Nacional del Litoral', 'Facultad de Agronomía', 'Agronomía', 8.3),
('Marcos', 'Suárez', '38123456', 21, 'Universidad Nacional de Córdoba', 'Facultad de Medicina', 'Medicina', 7.6),
('Julia', 'Castro', '39123456', 22, 'Universidad Nacional de La Plata', 'Facultad de Arquitectura', 'Diseño de Interiores', 7.8),
('Andrea', 'Núñez', '40123456', 24, 'Universidad de Buenos Aires', 'Facultad de Ingeniería', 'Ingeniería Informática', 7.9),
('Lucas', 'Díaz', '41123456', 25, 'Universidad Nacional de Córdoba', 'Facultad de Ciencias Sociales', 'Historia', 6.4),
('Camila', 'Chávez', '42123456', 21, 'Universidad Nacional de La Plata', 'Facultad de Humanidades', 'Filosofía', 6.8),
('Agustina', 'Vega', '43123456', 20, 'Universidad Nacional del Litoral', 'Facultad de Agronomía', 'Veterinaria', 7.4),
('Emilio', 'Torres', '44123456', 23, 'Universidad Nacional de Rosario', 'Facultad de Psicología', 'Psicología General', 6.9),
('Sofía', 'Ramírez', '45123456', 22, 'Universidad Nacional del Litoral', 'Facultad de Ciencias Exactas', 'Matemática', 8.0),
('Martín', 'Flores', '46123456', 25, 'Universidad de Buenos Aires', 'Facultad de Ciencias Económicas', 'Contabilidad', 7.6),
('Clara', 'Hernández', '47123456', 24, 'Universidad Nacional de Córdoba', 'Facultad de Medicina', 'Medicina', 7.9),
('Diego', 'Morales', '48123456', 26, 'Universidad Nacional de La Plata', 'Facultad de Arquitectura', 'Arquitectura', 8.2),
('Mónica', 'Peralta', '49123456', 23, 'Universidad Nacional del Litoral', 'Facultad de Agronomía', 'Veterinaria', 7.5),
('Gustavo', 'Cruz', '50123456', 22, 'Universidad Nacional de Rosario', 'Facultad de Ciencias Económicas', 'Economía', 6.6);

