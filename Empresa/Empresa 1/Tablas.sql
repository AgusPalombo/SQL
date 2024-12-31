-- Crear base de datos
create database if not exists empresa;
use empresa;

-- Crear tablas

create table if not exists areas (
	Id_area int auto_increment primary key unique,
    Nombre_area VARCHAR(50) not null unique,
    Presupuesto int not null
);

create table if not exists empleados(
	Id_empleado int auto_increment primary key unique,
    Nombre varchar(100) not null,
    Area Varchar(50) not null unique,
    Edad int not null,
	Salario double not null,
    Fecha_Contratacion date not null unique,
    FOREIGN KEY (Area) references areas(Nombre_area)
);

create table if not exists productos(
	Id_Producto int auto_increment primary key unique,
    Producto varchar(100) not null,
    Categoria varchar(50) not null,
    Stock int not null,
    Precio double not null    
);

create table if not exists ventas(
	Id_Venta int auto_increment primary key unique,
	Empleado varchar(100) not null,
    Fecha date not null,
    Producto varchar(100) not null,
    Cantidad int not null,
    Monto double not null,
    FOREIGN KEY (Empleado) references empleados(Nombre),
    FOREIGN KEY (Producto) references productos(Producto)
);
