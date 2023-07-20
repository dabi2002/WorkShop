CREATE database Makaia_Jardineria;

use Makaia_Jardineria;

create table oficinas(
	codigo_oficina int primary key auto_increment,
	ciudad varchar(50),
	pais varchar (50),
	region varchar (50),
	codigo_postal varchar (50), 
	telefono varchar (30), 
    direccion varchar (150)
);

create table jefes(
codigo_jefe varchar (50) primary key,
codigo_oficina int,
foreign key (codigo_oficina) references oficinas(codigo_oficina)
);

create table empleados(
	codigo_empleado varchar (50) primary key,
	nombre varchar(50),
	apellido_1 varchar(50),
	apellido_2 varchar(50),
	extension int, 
	email varchar(80),
	codigo_oficina int,
	codigo_jefe varchar (50),
    puesto varchar (50),
	foreign key (codigo_oficina) references oficinas(codigo_oficina),
	foreign key  (codigo_jefe) references jefes(codigo_jefe)
);

-- Crear tabla de clientes
CREATE TABLE clientes (
  codigo_cliente INT PRIMARY KEY,
  nombre_cliente VARCHAR(255),
  nombre_contacto VARCHAR(255),
  apellido_contacto VARCHAR(255),
  telefono VARCHAR(20),
  fax VARCHAR(20),
  direccion1 VARCHAR(255),
  direccion2 VARCHAR(255),
  ciudad VARCHAR(100),
  region VARCHAR(100),
  pais VARCHAR(100),
  codigo_postal VARCHAR(20),
  codigo_empleado varchar (50) not null,
  FOREIGN KEY (codigo_empleado) REFERENCES empleados(codigo_empleado),
  limite_credito DECIMAL(10, 2)
);

-- Crear tabla de pedidos
CREATE TABLE pedidos (
  codigo_pedido INT PRIMARY KEY,
  fecha_pedido DATE,
  fecha_esperada DATE,
  fecha_entrega DATE,
  estado VARCHAR(100),
  comentarios TEXT,
  codigo_cliente INT,
  FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo_cliente)
);

-- Crear tabla de pagos
CREATE TABLE pagos(
  codigo_pago int primary key,
  codigo_cliente INT,
  forma_pago VARCHAR(100),
  id_transaccion VARCHAR(100),
  fecha_pago DATE,
  total DECIMAL(10, 2),
  codigo_pedido int not null,
  FOREIGN KEY (codigo_cliente) REFERENCES clientes(codigo_cliente),
  FOREIGN KEY (codigo_pedido) REFERENCES pedidos(codigo_pedido)
);

-- Table gama
Create Table gama(
codigo_gama int primary key,
gama_producto int,
descripcion varchar (50),
imagen longblob);

Create Table inventario(
codigo_producto int primary key,
nombre_producto varchar(50),
codigo_gama int not null,
foreign key (codigo_gama) references gama(codigo_gama),
dimensiones_producto varchar (50),
proveedor varchar (50),
descripcion varchar (50),
precio_unitario int,
imagen longblob);

Create Table informacion_pedido(
estado_pedido varchar (50),
codigo_pedido int not null,
codigo_producto int not null,
foreign key (codigo_pedido) references pedidos(codigo_pedido),
foreign key (codigo_producto) references inventario(codigo_producto),
cantidad int,
nombre_producto varchar(50),
precio_unitario decimal(10,2)
);

-- Datos tabla oficinas
insert into oficinas (ciudad, pais, region, codigo_postal, telefono, direccion) values ('Toledo', 'Spain', 'Castilla - La Mancha', '45071', '(907) 4692005', '779 American Ash Street');
insert into oficinas (ciudad, pais, region, codigo_postal, telefono, direccion) values ('Medellin', 'Colombia', 'Andina', '056468', '(702) 5393958', '18572 Moose Parkway');
insert into oficinas (ciudad, pais, region, codigo_postal, telefono, direccion) values ('Murcia', 'Spain', 'Murcia', '30005', '(965) 8412078', '0092 Anhalt Plaza');

-- Datos tabla jefes
insert into jefes (codigo_jefe, codigo_oficina) values ('J-001', 1);
insert into jefes (codigo_jefe, codigo_oficina) values ('J-002', 2);
insert into jefes (codigo_jefe, codigo_oficina) values ('J-007', 3);

-- Datos tabla empleados
insert into empleados (codigo_empleado, nombre, apellido_1, apellido_2, extension, email, codigo_oficina, codigo_jefe, puesto) values ('J-001', 'Gabriel', 'Brychan', 'Armsby', 96, 'garmsby0@comcast.net', 1, null, 'Supervisor');
insert into empleados (codigo_empleado, nombre, apellido_1, apellido_2, extension, email, codigo_oficina, codigo_jefe, puesto) values ('J-002', 'Ellene', 'Nelm', 'Grzegorczyk', 42, 'egrzegorczyk1@oaic.gov.au', 2, null, 'Supervisor');
insert into empleados (codigo_empleado, nombre, apellido_1, apellido_2, extension, email, codigo_oficina, codigo_jefe, puesto) values ('J-007', 'Spense', 'Dottrell', 'Baistow', 73, 'sbaistow2@adobe.com', 3, null, 'Supervisor');
insert into empleados (codigo_empleado, nombre, apellido_1, apellido_2, extension, email, codigo_oficina, codigo_jefe, puesto) values ('V-001', 'Christi', 'Kells', 'Weddell', 79, 'cweddell3@google.ca', 1, 'J-001', 'Vendedor');
insert into empleados (codigo_empleado, nombre, apellido_1, apellido_2, extension, email, codigo_oficina, codigo_jefe, puesto) values ('V-002', 'Margarette', 'Rush', 'Mugleston', 84, 'mmugleston4@delicious.com', 2, 'J-002', 'Vendedor');
insert into empleados (codigo_empleado, nombre, apellido_1, apellido_2, extension, email, codigo_oficina, codigo_jefe, puesto) values ('V-003', 'Regan', 'Peach', 'Denyer', 86, 'rdenyer5@fotki.com', 2, 'J-002', 'Vendedor');
insert into empleados (codigo_empleado, nombre, apellido_1, apellido_2, extension, email, codigo_oficina, codigo_jefe, puesto) values ('V-004', 'Elladine', 'Fookes', 'Leadbeatter', 79, 'eleadbeatter6@cnet.com', 3, 'J-007', 'Vendedor');
insert into empleados (codigo_empleado, nombre, apellido_1, apellido_2, extension, email, codigo_oficina, codigo_jefe, puesto) values ('V-005', 'Ebonee', 'Smedley', 'Panchen', 10, 'epanchen7@earthlink.net', 3, 'J-007', 'Vendedor');
insert into empleados (codigo_empleado, nombre, apellido_1, apellido_2, extension, email, codigo_oficina, codigo_jefe, puesto) values ('V-006', 'Lucy', 'Benes', 'Pear', 99, 'lpear8@businessinsider.com', 1, 'J-001', 'Vendedor');

-- Datos tabla clientes
insert into clientes (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, direccion1, direccion2, ciudad, region, pais, codigo_postal, codigo_empleado, limite_credito) values (1, 'Miboo', 'Bevvy', 'Camell', '(378) 8915918', '(119) 5173388', '59 Kensington Center', '991 Thierer Pass', 'Ditsaan', null, 'Philippines', '9714', 'V-001', 3155284.81);
insert into clientes (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, direccion1, direccion2, ciudad, region, pais, codigo_postal, codigo_empleado, limite_credito) values (2, 'Kazu', 'Rolfe', 'Yitzhakov', '(566) 9675730', '(618) 6391036', '59 Kinsman Point', '3 Bay Parkway', 'Taishanmiao', null, 'China', null, 'V-002', 1265792.47);
insert into clientes (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, direccion1, direccion2, ciudad, region, pais, codigo_postal, codigo_empleado, limite_credito) values (3, 'Minyx', 'Victor', 'Iacovelli', '(380) 7846755', '(663) 6282053', '07958 Valley Edge Terrace', '2 Mesta Pass', 'Včelná', null, 'Czech Republic', '373 82', 'V-003', 1837458.01);
insert into clientes (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, direccion1, direccion2, ciudad, region, pais, codigo_postal, codigo_empleado, limite_credito) values (4, 'Geba', 'Phaedra', 'Ellesworth', '(734) 1214525', '(506) 8965830', '702 Lake View Court', '8145 Darwin Junction', 'Bukbatang', null, 'Indonesia', null, 'V-002', 1766751.38);
insert into clientes (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, direccion1, direccion2, ciudad, region, pais, codigo_postal, codigo_empleado, limite_credito) values (5, 'Zoovu', 'Saunders', 'Giuron', '(988) 7470919', '(570) 9269765', '87 Blue Bill Park Circle', '9792 Everett Junction', 'Kukur', null, 'Albania', null, 'V-004', 2471710.92);
insert into clientes (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, direccion1, direccion2, ciudad, region, pais, codigo_postal, codigo_empleado, limite_credito) values (6, 'Feedspan', 'Gilli', 'McBratney', '(723) 9372765', '(122) 9966859', '928 Towne Junction', '93526 Loomis Trail', 'Jiangqiao', null, 'China', null, 'V-005', 3743324.65);
insert into clientes (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, direccion1, direccion2, ciudad, region, pais, codigo_postal, codigo_empleado, limite_credito) values (7, 'Flashpoint', 'Silvester', 'Lismer', '(241) 8683400', '(297) 2006707', '0427 Fair Oaks Trail', '350 Barby Court', 'Quebrada Canoa', null, 'Panama', null, 'V-001', 3712721.62);
insert into clientes (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, direccion1, direccion2, ciudad, region, pais, codigo_postal, codigo_empleado, limite_credito) values (8, 'Yadel', 'Alethea', 'Beynon', '(570) 3619496', '(798) 1683807', '81527 Alpine Parkway', '715 Continental Crossing', 'Tobatí', null, 'Paraguay', null, 'V-003', 3982005.69);
insert into clientes (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, direccion1, direccion2, ciudad, region, pais, codigo_postal, codigo_empleado, limite_credito) values (9, 'Layo', 'Cathrin', 'Beharrell', '(318) 9585965', '(305) 6303368', '5107 Hudson Way', '6 Canary Trail', 'Águas de Lindóia', null, 'Brazil', '13940-000', 'V-004', 2751851.62);
insert into clientes (codigo_cliente, nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, direccion1, direccion2, ciudad, region, pais, codigo_postal, codigo_empleado, limite_credito) values (10, 'Eadel', 'Esra', 'Trulock', '(846) 2680541', '(407) 8321133', '69 Vahlen Center', '05797 Stang Point', 'Shengping', null, 'China', null, 'V-005', 1583109.8);

-- Datos tabla pedidos
insert into pedidos (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente) values (1, '2008-06-03', '2008-06-11', '2008-06-11', 'Entregado', null, 4);
insert into pedidos (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente) values (2, '2007-12-26', '2005-10-28', '2006-01-06', 'Entregado', null, 5);
insert into pedidos (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente) values (3, '2009-01-07', '2009-01-09', '2009-01-10', 'Entregado', null, 4);
insert into pedidos (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente) values (4, '2006-07-23', '2006-07-29', '2006-07-30', 'Entregado', null, 2);
insert into pedidos (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente) values (5, '2008-12-23', '2008-12-29', '2008-12-31', 'Entregado', null, 1);
insert into pedidos (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente) values (6, '2005-06-10', '2005-06-15', '2005-06-20', 'Entregado', null, 6);
insert into pedidos (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente) values (7, '2008-12-23', '2008-12-29', '2008-12-31', 'enviado', null, 1);
insert into pedidos (codigo_pedido, fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, codigo_cliente) values (8, '2005-06-10', '2005-06-15', '2005-06-20', 'enviado', null, 6);

-- Datos tabla pagos
insert into pagos (codigo_pago,codigo_cliente,forma_pago,id_transaccion,fecha_pago,total,codigo_pedido) values (1,4,"efectivo","1213121","2008-06-03",300000,1);
insert into pagos (codigo_pago,codigo_cliente,forma_pago,id_transaccion,fecha_pago,total,codigo_pedido) values (2,5,"transferencia","4444544","2012-07-04",1050000,2);
insert into pagos (codigo_pago,codigo_cliente,forma_pago,id_transaccion,fecha_pago,total,codigo_pedido) values (3,4,"tarjeta","646564","2010-08-03",400000,3);
insert into pagos (codigo_pago,codigo_cliente,forma_pago,id_transaccion,fecha_pago,total,codigo_pedido) values (4,5,"efectivo","45645645","2009-08-03",12,2);
insert into pagos (codigo_pago,codigo_cliente,forma_pago,id_transaccion,fecha_pago,total,codigo_pedido) values (5,2,"transferencia","6564","2009-08-03",10.2,2);
insert into pagos (codigo_pago,codigo_cliente,forma_pago,id_transaccion,fecha_pago,total,codigo_pedido) values (6,6,"tarjeta","646564","2009-08-03",7.2,2);
-- Datos tabla gama
insert into gama (codigo_gama,gama_producto,descripcion,imagen) values (1,1,"articulo hermoso","imagen1");
insert into gama (codigo_gama,gama_producto,descripcion,imagen) values (2,2,"articulo de color azul que resalta","imagen2");
insert into gama (codigo_gama,gama_producto,descripcion,imagen) values (3,3,"articulo de color rosado con un gran olor","imagen2");

-- Datos tabla inventario 
insert into inventario (codigo_producto,nombre_producto,codigo_gama,dimensiones_producto,proveedor,descripcion,precio_unitario,imagen) values (1,"rosa",1,"2x3","rosa el sol","articulo de color rosado con un gran olor",5000,"imagen1");
insert into inventario (codigo_producto,nombre_producto,codigo_gama,dimensiones_producto,proveedor,descripcion,precio_unitario,imagen) values (2,"petalos",2,"2x3","petalos perez","articulo de color azul que resalta",6000,"imagen2");
insert into inventario (codigo_producto,nombre_producto,codigo_gama,dimensiones_producto,proveedor,descripcion,precio_unitario,imagen) values (3,"semillas de limones",1,"6x6","el limon de tino","articulo con gran aroma ",4000,"imagen3");

-- Datos tabla informacion_pedido
 insert into informacion_pedido (estado_pedido,codigo_pedido,codigo_producto,nombre_producto,cantidad,precio_unitario) values ("enviado",1,1,"rosa",25,12000);
 insert into informacion_pedido (estado_pedido,codigo_pedido,codigo_producto,nombre_producto,cantidad,precio_unitario) values ("recibido",2,2,"petalos",30,35000);
 insert into informacion_pedido (estado_pedido,codigo_pedido,codigo_producto,nombre_producto,cantidad,precio_unitario) values ("esta por llegar",3,3,"rosa",50,8000);
 insert into informacion_pedido (estado_pedido,codigo_pedido,codigo_producto,nombre_producto,cantidad,precio_unitario) values ("recibido",3,3,"petalos",50,8000);
 insert into informacion_pedido (estado_pedido,codigo_pedido,codigo_producto,nombre_producto,cantidad,precio_unitario) values ("enviado",3,3,"semillas de limon",50,8000);
 
 
-- Consultas
-- 1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.
SELECT codigo_oficina, ciudad FROM oficinas;

-- 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.
SELECT ciudad, telefono FROM oficinas where pais = 'Spain';

-- 3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.
select nombre, apellido_1, apellido_2, email FROM empleados where codigo_jefe = 'J-007';

-- 4. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:

-- • Utilizando la función YEAR de MySQL.
select codigo_cliente from pagos where year(fecha_pago) = 2008;

-- • Utilizando la función DATE_FORMAT de MySQL.
select codigo_cliente from pagos where date_format(fecha_pago,"%Y") = 2008;

-- 5. ¿Cuántos empleados hay en la compañía?
select count(codigo_empleado) as 'cantidad empleados' from empleados;

-- 6. ¿Cuántos clientes tiene cada país?
select pais, count(*) as 'Empleados por país' from clientes group by pais;

--  7. ¿Cuál fue el pago medio en 2009? 
 
SELECT AVG(total) AS pago_medio
FROM pagos
WHERE fecha_pago BETWEEN '2009-01-01' AND '2009-12-31';
 
 
-- 8. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.

SELECT estado, COUNT(*) AS numero_pedidos
FROM pedidos
GROUP BY estado
ORDER BY numero_pedidos DESC;

 
-- 9. Calcula el precio de venta del producto más caro y barato en una misma consulta. 

SELECT MAX(precio_unitario) AS precio_mayor,
       MIN(precio_unitario) AS precio_menor,
       ((MAX(precio_unitario) - MIN(precio_unitario)) / MIN(precio_unitario)) * 100 AS porcentaje
FROM informacion_pedido;


-- 10. Devuelve el nombre del cliente con mayor límite de crédito. 

SELECT *
FROM clientes
WHERE limite_credito = (SELECT MAX(limite_credito) FROM clientes);



-- 11. Devuelve el nombre del producto que tenga el precio de venta más caro. 

SELECT *
FROM inventario
WHERE precio_unitario = (SELECT MAX(precio_unitario) FROM inventario);



-- 12. Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que calcular cuál es el número total de 
-- unidades que se han vendido de cada producto a partir de los datos de la tabla detalle_pedido) 

SELECT *
FROM informacion_pedido
ORDER BY cantidad DESC
LIMIT 1;

-- 13. Los clientes cuyo límite de crédito sea mayor que los pagos que hayan realizado 
-- (sin utilizar INNER JOIN):

SELECT c.nombre_cliente, c.limite_credito, SUM(p.total) AS total_pagado
FROM clientes c, pagos p
WHERE c.codigo_cliente = p.codigo_cliente
GROUP BY c.codigo_cliente, c.nombre_cliente, c.limite_credito
HAVING c.limite_credito > SUM(p.total);


-- 14. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. 
-- Tenga en cuenta que pueden existir clientes que no hayan realizado ningún pedido:

SELECT c.nombre_cliente, COUNT(p.codigo_pedido) AS total_pedidos
FROM clientes c
LEFT JOIN pedidos p ON c.codigo_cliente = p.codigo_cliente
GROUP BY c.codigo_cliente, c.nombre_cliente;

-- 15 Devuelve el nombre, apellidos, puesto y la oficina de aquellos empleados que no sean representantes 
-- de ventas de ningún cliente:

SELECT e.nombre, e.apellido_1, e.apellido_2, e.puesto, o.telefono
FROM empleados e
JOIN oficinas o ON e.codigo_oficina = o.codigo_oficina
WHERE e.codigo_empleado NOT IN (SELECT codigo_jefe FROM jefes WHERE codigo_jefe IS NOT NULL);

-- 16 Devuelve las oficinas donde no trabajen ninguno de los empleados que hayan sido los representantes 
-- de ventas de algún cliente que haya realizado la compra de algún producto de la gama "Frutales":

SELECT o.*
FROM oficinas o
WHERE o.codigo_oficina NOT IN (
    SELECT DISTINCT e.codigo_oficina
    FROM empleados e
    JOIN clientes c ON e.codigo_empleado = c.codigo_empleado
    JOIN pedidos p ON c.codigo_cliente = p.codigo_cliente
    JOIN informacion_pedido ip ON p.codigo_pedido = ip.codigo_pedido
    JOIN inventario i ON ip.codigo_producto = i.codigo_producto
    JOIN gama g ON i.codigo_gama = g.codigo_gama
    WHERE g.descripcion = 'Frutales'
      AND e.puesto = 'Vendedor'
);

-- 17. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. 
-- Tenga en cuenta que pueden existir clientes que no hayan realizado ningún pago.

SELECT c.nombre_cliente, COALESCE(SUM(p.total), 0) AS total_pagado
FROM clientes c
LEFT JOIN pagos p ON c.codigo_cliente = p.codigo_cliente
GROUP BY c.nombre_cliente;
