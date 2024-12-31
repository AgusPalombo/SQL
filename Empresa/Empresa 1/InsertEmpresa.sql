-- Importamos la BD
use empresa;

-- Insertamos Datos

-- DATOS DE LA TABLA AREAS

INSERT INTO areas (Nombre_area, Presupuesto) VALUES 
('Recursos Humanos', 500000),
('Ventas', 800000),
('Marketing', 700000),
('Tecnología', 1200000),
('Logística', 600000),
('Finanzas', 900000),
('Atención al Cliente', 400000);


-- DATOS DE LA TABLA EMPLEADOS

INSERT INTO empleados (Nombre, Id_Area, Edad, Salario, Fecha_Contratacion) VALUES 
('Juan Pérez', 1, 35, 120000, '2018-05-15'),
('Sofía Ramírez', 1, 30, 130000, '2020-04-10'),
('Luis Torres', 1, 40, 150000, '2017-03-20'),
('María López', 2, 29, 150000, '2020-03-10'),
('Gabriel Castillo', 2, 33, 170000, '2016-10-08'),
('Carla Díaz', 2, 35, 200000, '2018-06-18'),
('Hugo Méndez', 2, 31, 180000, '2021-01-25'),
('Carlos Fernández', 3, 40, 200000, '2015-09-22'),
('Elena Silva', 3, 28, 150000, '2019-03-10'),
('Miguel Soto', 3, 36, 160000, '2016-07-30'),
('Laura Sánchez', 4, 32, 250000, '2017-12-01'),
('Andrés Vera', 4, 28, 300000, '2019-09-10'),
('Diana Rojas', 4, 30, 320000, '2020-06-05'),
('Diego Navarro', 4, 34, 350000, '2015-11-20'),
('Ana Martínez', 5, 45, 110000, '2016-08-19'),
('Ricardo Campos', 5, 42, 150000, '2018-02-22'),
('Valeria Álvarez', 5, 37, 170000, '2020-09-30'),
('Pedro Gómez', 6, 38, 180000, '2019-11-25'),
('Fernanda Rivera', 6, 31, 250000, '2017-05-14'),
('Santiago Núñez', 6, 35, 300000, '2016-03-12'),
('Claudia Ibáñez', 6, 29, 200000, '2021-08-19'),
('Lucía Herrera', 7, 28, 90000, '2021-07-14'),
('Pablo Ortiz', 7, 26, 120000, '2022-02-11'),
('Mónica Delgado', 7, 30, 110000, '2020-12-10');
