CREATE DATABASE IF NOT EXISTS Personas;
use Personas;

-- Creación de la tabla departamentos
CREATE TABLE departamentos (
    id_departamento SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Creación de la tabla empleados
CREATE TABLE empleados (
    id_empleado SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    id_departamento INT REFERENCES departamentos(id_departamento),
    salario DOUBLE NOT NULL
);

-- Insertar departamentos
INSERT INTO departamentos (nombre) VALUES ('Ventas');
INSERT INTO departamentos (nombre) VALUES ('Marketing');
INSERT INTO departamentos (nombre) VALUES ('Recursos Humanos');
INSERT INTO departamentos (nombre) VALUES ('IT');
INSERT INTO departamentos (nombre) VALUES ('Finanzas');
INSERT INTO departamentos (nombre) VALUES ('Operaciones');


-- Insertar empleados
INSERT INTO empleados (nombre, id_departamento, salario) VALUES ('Juan', 1, 3000);
INSERT INTO empleados (nombre, id_departamento, salario) VALUES ('Ana', 2, 4000);
INSERT INTO empleados (nombre, id_departamento, salario) VALUES ('Carlos', 1, 3500);
INSERT INTO empleados (nombre, id_departamento, salario) VALUES ('María', 3, 4500);  
INSERT INTO empleados (nombre, id_departamento, salario) VALUES ('Luis', 4, 3200);   
INSERT INTO empleados (nombre, id_departamento, salario) VALUES ('Pedro', 6, 2800);   
INSERT INTO empleados (nombre, id_departamento, salario) VALUES ('Laura', 2, 3900);  
INSERT INTO empleados (nombre, id_departamento, salario) VALUES ('Jorge', 5, 3100);   
INSERT INTO empleados (nombre, id_departamento, salario) VALUES ('Sofía', 4, 4200);    
INSERT INTO empleados (nombre, id_departamento, salario) VALUES ('Ana', 3, 3600);     


-- Consultas
SELECT * FROM empleados;

SELECT * FROM departamentos;

SELECT e.nombre AS empleado, d.nombre AS departamento
FROM empleados e
INNER JOIN departamentos d ON e.id_departamento = d.id_departamento;

SELECT d.nombre AS departamento, COUNT(e.id_empleado) AS total_empleados
FROM departamentos d
LEFT JOIN empleados e ON d.id_departamento = e.id_departamento
GROUP BY d.nombre;

SELECT d.nombre AS departamento, AVG(e.salario) AS salario_promedio
FROM departamentos d
LEFT JOIN empleados e ON d.id_departamento = e.id_departamento
GROUP BY d.nombre;

