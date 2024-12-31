-- Importar BD
use empresa;

-- SELECTS GENERALES
select * from areas;
select * from empleados;
select * from productos;
select * from ventas;

-- LIMPIAMOS LA TABLA VENTAS DE AQUELLOS EMPLEADOS QUE NO FORMAN PARTE DEL AREA 'VENTAS'
delete v
from ventas v
left join empleados e on v.Empleado = e.Nombre
where (e.Area is null or e.Area <> 'Ventas')
and v.Id_Venta is not null;

-- Calcular el Promedio de Salario por Área
SELECT a.Nombre_Area, AVG(e.Salario) AS Promedio_Salario
FROM Empleados e
JOIN Áreas a ON e.ID_Area = a.ID_Area
GROUP BY a.Nombre_Area;

-- Determinar los Empleados con Más de 5 Años en la Empresa
SELECT e.Nombre, e.Fecha_Contratación
FROM Empleados e
WHERE e.Fecha_Contratación <= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);

-- Obtener el Total de Ventas Realizadas por Cada Empleado
SELECT e.Nombre, SUM(v.Monto) AS Total_Ventas
FROM Empleados e
JOIN Ventas v ON e.Nombre = v.Empleado
GROUP BY e.Nombre
ORDER BY Total_Ventas desc;

-- Calcular el Porcentaje de Presupuesto Usado por Salarios en Cada Área
SELECT a.Nombre_Area, 
       (SUM(e.Salario) / a.Presupuesto_Anual) * 100 AS Porcentaje_Presupuesto
FROM Empleados e
JOIN Áreas a ON e.ID_Area = a.ID_Area
GROUP BY a.Nombre_Area, a.Presupuesto_Anual
ORDER BY a.Presupuesto desc;

-- Productos Más Vendidos por Cantidad
SELECT p.Producto, SUM(v.Cantidad) AS Total_Cantidad
FROM Ventas v
JOIN Productos p ON v.Producto = p.Producto
GROUP BY p.Producto
ORDER BY Total_Cantidad DESC;

-- Categorías con Mayores Ingresos
SELECT p.Categoria, SUM(v.Monto) as Ingresos_Totales
FROM Ventas v
JOIN Productos p ON v.Producto = p.Producto
GROUP BY p.Categoria
ORDER BY Ingresos_Totales DESC;

-- Rendimiento por Empleado (Ventas en Cantidad y Monto Total)
SELECT e.Nombre, SUM(v.Cantidad) as Cantidad_Total_Ventas, SUM(v.Monto) as Total_Ventas
From Empleados e
JOIN Ventas v ON e.Nombre = v.Empleado
GROUP BY e.Nombre
ORDER BY Total_Ventas DESC;

-- Empleados con el Mayor Rendimiento en un Periodo Específico
SELECT e.Nombre, SUM(v.Monto) AS Total_Ventas
FROM Empleados e
JOIN Ventas v ON e.Nombre = v.Empleado
WHERE v.Fecha BETWEEN '2024-01-01' AND '2024-02-11'
GROUP BY e.Nombre
ORDER BY Total_Ventas DESC;