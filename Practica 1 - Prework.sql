/*
|_   __  |   |_   _||_   __  ||_   __ \   .' ___  ||_   _|.' ___  ||_   _|.'   `.   /  |   
  | |_ \_|     | |    | |_ \_|  | |__) | / .'   \_|  | | / .'   \_|  | | /  .-.  \  `| |   
  |  _| _  _   | |    |  _| _   |  __ /  | |         | | | |         | | | |   | |   | |   
 _| |__/ || |__' |   _| |__/ | _| |  \ \_\ `.___.'\ _| |_\ `.___.'\ _| |_\  `-'  /  _| |_  
|________|`.____.'  |________||____| |___|`.____ .'|_____|`.____ .'|_____|`.___.'  |_____| 
                                                                                           

 */
/*1. Crear una tabla llamada "Clientes" con las columnas: id (entero, clave primaria),
nombre (texto) y email (texto). */

CREATE TABLE IF NOT EXISTS "Clientes"(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255),
	email VARCHAR(255)
	
)

/*. Insertar un nuevo cliente en la tabla "Clientes" con id=1, nombre="Juan" y
email="juan@example.com". */

INSERT INTO public."Clientes" (name, email)
VALUES ('Juan', 'juan@exaples.com' )

/*3. Actualizar el email del cliente con id=1 a "juan@gmail.com".*/

UPDATE public."Clientes"
SET email = 'juan@gmail.com'
WHERE ID = 1

/*4. Eliminar el cliente con id=1 de la tabla "Clientes".*/

DELETE FROM public."Clientes"
WHERE ID = 1

/*5. Crear una tabla llamada "Pedidos" con las columnas: id (entero, clave primaria),
cliente_id (entero, clave externa referenciando a la tabla "Clientes"), producto
(texto) y cantidad (entero).*/

CREATE TABLE Pedidos (
	id SERIAL PRIMARY KEY,
	producto VARCHAR(255),
	cantidad INT,
	cliente_id INT,
	CONSTRAINT FK_cliente_id FOREIGN KEY (cliente_id) REFERENCES public."Clientes" (id)
	
	)
	

/*6. Insertar un nuevo pedido en la tabla "Pedidos" con id=1, cliente_id=1,producto="Camiseta" y cantidad=2
Para crear este pedido he tenido que crear un registro en clientes porque sino me aprecia el falllo de estar violnado la Foreing Key porque no exisita en la tabla primaria .*/

/*Creación de cliente*/
INSERT INTO public."Clientes" (name, email)
VALUES ('Fernando','prueba@gmail.com')
/*Respuesta de la pregunta numero 6*/
INSERT INTO public."pedidos" (producto, cantidad, cliente_id)
VALUES ('Camiseta', 2, 1)

/*7. Actualizar la cantidad del pedido con id=1 a 3.*/

UPDATE public."pedidos"
SET cantidad = 3
WHERE ID = 1

/*8. Eliminar el pedido con id=1 de la tabla "Pedidos".*/

DELETE FROM public."pedidos"
WHERE ID = 1

/*9. Crear una tabla llamada "Productos" con las columnas: id (entero, clave
primaria), nombre (texto) y precio (decimal).*/

CREATE TABLE IF NOT EXISTS productos (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	precio INT
)

/*10. Insertar varios productos en la tabla "Productos" con diferentes valores.*/

INSERT INTO public.productos (nombre, precio)
VALUES ('Altavoz', 10)

INSERT INTO public.productos (nombre, precio)
VALUES ('Raton', 20)

INSERT INTO public.productos (nombre, precio)
VALUES ('Cartera', 40)

INSERT INTO public.productos (nombre, precio)
VALUES ('Papel', 5)


/*11. Consultar todos los clientes de la tabla "Clientes".*/

SELECT * FROM public."Clientes"

/*12. Consultar todos los pedidos de la tabla "Pedidos" junto con los nombres de los
clientes correspondientes.*/

SELECT * FROM public."Clientes" s
LEFT JOIN public.pedidos w
ON s = w

/*13. Consultar los productos de la tabla "Productos" cuyo precio sea mayor a $50.*/

SELECT * FROM public.productos
WHERE precio > 50

/*14. Consultar los pedidos de la tabla "Pedidos" que tengan una cantidad mayor o
igual a 5.*/

SELECT * FROM public.pedidos
WHERE cantidad <= 50

/*15. Consultar los clientes de la tabla "Clientes" cuyo nombre empiece con la letra
"A".*/

SELECT * FROM public."Clientes"
WHERE name LIKE 'A'

/*16. Realizar una consulta que muestre el nombre del cliente y el total de pedidos
realizados por cada cliente*/

SELECT s.name, w.producto
FROM public."Clientes" s 
LEFT JOIN public.pedidos w
ON s = w

/*18. Agregar una columna llamada "fecha" a la tabla "Pedidos" de tipo fecha.*/

ALTER TABLE public.pedidos
ADD COLUMN fecha date

/*  
________     _____  ________  _______      ______  _____   ______  _____   ___             _____   
|_   __  |   |_   _||_   __  ||_   __ \   .' ___  ||_   _|.' ___  ||_   _|.'   `.          / ___ `. 
  | |_ \_|     | |    | |_ \_|  | |__) | / .'   \_|  | | / .'   \_|  | | /  .-.  \        |_/___) | 
  |  _| _  _   | |    |  _| _   |  __ /  | |         | | | |         | | | |   | |         .'____.' 
 _| |__/ || |__' |   _| |__/ | _| |  \ \_\ `.___.'\ _| |_\ `.___.'\ _| |_\  `-'  /        / /_____  
|________|`.____.'  |________||____| |___|`.____ .'|_____|`.____ .'|_____|`.___.'         |_______| 
                                                                                                    
*/

/* 1. Crea una base de datos llamada "MiBaseDeDatos".*/

CREATE DATABASE MiBaseDeDatos

/* 2. Crea una tabla llamada "Usuarios" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "edad" (entero). */

/*AVISO DE QUE TIENES QUE CONECTAR LA NUEVA BASE DE DATOS CREADA EN EL MENÚ*/

CREATE TABLE IF NOT EXISTS usuarios (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	edad INT
)

/* 3. Inserta dos registros en la tabla "Usuarios". */

INSERT INTO public.usuarios (nombre, edad)
VALUES ('Max', 65)

INSERT INTO public.usuarios (nombre, edad)
VALUES ('Marta', 32)

/* 4. Actualiza la edad de un usuario en la tabla "Usuarios". */

UPDATE public.usuarios
SET edad = 32
WHERE nombre = 'max'

/* 5. Elimina un usuario de la tabla "Usuarios". */

DELETE FROM public.usuarios
WHERE id = 2

/* 1. Crea una tabla llamada "Ciudades" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "pais" (texto). */

CREATE TABLE IF NOT EXISTS ciudades (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	pais VARCHAR(255)
)

/* 2. Inserta al menos tres registros en la tabla "Ciudades". */

INSERT INTO public.ciudades (nombre, pais)
VALUES ('Montevideo', 'uruguay')

INSERT INTO public.ciudades (nombre, pais)
VALUES ('Barcelona', 'españa')

INSERT INTO public.ciudades (nombre, pais)
VALUES ('Paris', 'Francia')

/* 3. Crea una foreign key en la tabla "Usuarios" que se relacione con la columna "id"
de la tabla "Ciudades". */

ALTER TABLE ciudades 
	ADD CONSTRAINT FK_ciudades
	FOREIGN KEY (id)
	REFERENCES ciudades (id);

/* 4. Realiza una consulta que muestre los nombres de los usuarios junto con el
nombre de su ciudad y país (utiliza un LEFT JOIN). */

SELECT u.nombre, w.nombre, w.pais
FROM public.usuarios u 
LEFT JOIN public.ciudades w
ON u = w

/* 5. Realiza una consulta que muestre solo los usuarios que tienen una ciudad
asociada (utiliza un INNER JOIN). */

SELECT u.nombre, w.nombre
FROM public.usuarios u 
INNER JOIN public.ciudades w
ON u = w

/*
 ________     _____  ________  _______      ______  _____   ______  _____   ___             ______   
|_   __  |   |_   _||_   __  ||_   __ \   .' ___  ||_   _|.' ___  ||_   _|.'   `.          / ____ `. 
  | |_ \_|     | |    | |_ \_|  | |__) | / .'   \_|  | | / .'   \_|  | | /  .-.  \         `'  __) | 
  |  _| _  _   | |    |  _| _   |  __ /  | |         | | | |         | | | |   | |         _  |__ '. 
 _| |__/ || |__' |   _| |__/ | _| |  \ \_\ `.___.'\ _| |_\ `.___.'\ _| |_\  `-'  /        | \____) | 
|________|`.____.'  |________||____| |___|`.____ .'|_____|`.____ .'|_____|`.___.'          \______.'
*/

/* 1. Crea una tabla llamada "Productos" con las columnas: "id" (entero, clave
primaria), "nombre" (texto) y "precio" (numérico)*/

CREATE TABLE IF NOT EXISTS productos (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255),
	precio INT
)

/* 2. Inserta al menos cinco registros en la tabla "Productos"*/

INSERT INTO public.productos (nombre, precio)
VALUES 
('Almacenamiento SSD', 31), 
('Tarjeta grafica', 225),
('Placa base', 145),
('Memoria RAM', 63),
('CPU', 348)

/* 3. Actualiza el precio de un producto en la tabla "Productos"*/

UPDATE public.productos 
SET precio = 23
WHERE id = 4

/* 4. Elimina un producto de la tabla "Productos".*/

DELETE FROM public.productos
WHERE id = 2

/* 5. Realiza una consulta que muestre los nombres de los usuarios junto con los
nombres de los productos que han comprado (utiliza un INNER JOIN con la
tabla "Productos"). */

/* CREAR TABLA DE USUARIOS ANTES Y CREAR LA FORGEIN KEY*/

SELECT u.nombre, w.nombre
FROM public.productos u 
INNER JOIN public.usuarios w
ON u = w


/*  ________     _____  ________  _______      ______  _____   ______  _____   ___            _    _    
|_   __  |   |_   _||_   __  ||_   __ \   .' ___  ||_   _|.' ___  ||_   _|.'   `.         | |  | |   
  | |_ \_|     | |    | |_ \_|  | |__) | / .'   \_|  | | / .'   \_|  | | /  .-.  \        | |__| |_  
  |  _| _  _   | |    |  _| _   |  __ /  | |         | | | |         | | | |   | |        |____   _| 
 _| |__/ || |__' |   _| |__/ | _| |  \ \_\ `.___.'\ _| |_\ `.___.'\ _| |_\  `-'  /            _| |_  
|________|`.____.'  |________||____| |___|`.____ .'|_____|`.____ .'|_____|`.___.'            |_____| */



/*1. Crea una tabla llamada "Pedidos" con las columnas: "id" (entero, clave
primaria), "id_usuario" (entero, clave foránea de la tabla "Usuarios") y
"id_producto" (entero, clave foránea de la tabla "Productos").*/

CREATE TABLE IF NOT EXISTS pedidos (
	id SERIAL PRIMARY KEY,
	producto_id INT NOT NULL,
	usuario_id INT NOT NULL,
	CONSTRAINT FK_pedidos_id FOREIGN KEY (productos_id) REFERENCES productos (id)
)

/*2. Inserta al menos tres registros en la tabla "Pedidos" que relacionen usuarios con
productos*/

INSERT INTO public.productos (producto_id, usuario_id)
VALUES 
(1,3 ), 
(3,1 ), 
(4,2 )

/*3. Realiza una consulta que muestre los nombres de los usuarios y los nombres de
los productos que han comprado, incluidos aquellos que no han realizado
ningún pedido (utiliza LEFT JOIN y COALESCE).*/



/*4. Realiza una consulta que muestre los nombres de los usuarios que han
realizado un pedido, pero también los que no han realizado ningún pedido
(utiliza LEFT JOIN).*/

SELECT w.pedidos, u.productos, w.nombre
FROM public.productos u 
LEFT JOIN public.usuarios w
ON u = w

/*5. Agrega una nueva columna llamada "cantidad" a la tabla "Pedidos" y actualiza
los registros existentes con un valor (utiliza ALTER TABLE y UPDATE)*/

ALTER TABLE public.pedidos
ADD COLUMN cantidad INT


UPDATE public.pedidos
SET cantidad = 4
WHERE id = 2


/*  ________     _____  ________  _______      ______  _____   ______  _____   ___            _______   
|_   __  |   |_   _||_   __  ||_   __ \   .' ___  ||_   _|.' ___  ||_   _|.'   `.         |  _____|  
  | |_ \_|     | |    | |_ \_|  | |__) | / .'   \_|  | | / .'   \_|  | | /  .-.  \        | |____    
  |  _| _  _   | |    |  _| _   |  __ /  | |         | | | |         | | | |   | |        '_.____''. 
 _| |__/ || |__' |   _| |__/ | _| |  \ \_\ `.___.'\ _| |_\ `.___.'\ _| |_\  `-'  /        | \____) | 
|________|`.____.'  |________||____| |___|`.____ .'|_____|`.____ .'|_____|`.___.'          \______.'
*/



/* 1. Crea una tabla llamada "Clientes" con las columnas id (entero) y nombre
(cadena de texto).*/

CREATE TABLE IF NOT EXISTS clientes (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255)
)

/* 2. Inserta un cliente con id=1 y nombre='John' en la tabla "Clientes"*/

INSERT INTO public.clientes (nombre)
VALUES ('Jhon')

/*3. Actualiza el nombre del cliente con id=1 a 'John Doe' en la tabla "Clientes". */

UPDATE public.clientes
SET nombre = 'Jhon Doe'
WHERE id = 1

/* 4. Elimina el cliente con id=1 de la tabla "Clientes".*/

DELETE FROM public.clientes
WHERE id = 1

/* 5. Lee todos los clientes de la tabla "Clientes".*/

SELECT * FROM public.clientes

/* 6. Crea una tabla llamada "Pedidos" con las columnas id (entero) y cliente_id
(entero).*/

CREATE TABLE IF NOT EXISTS pedidos (
	id SERIAL PRIMARY KEY,
	clientes_id INT
)

/* 7. Inserta un pedido con id=1 y cliente_id=1 en la tabla "Pedidos"*/

INSERT INTO public.pedidos (clientes_id)
VALUES (1) 

/* 8. Actualiza el cliente_id del pedido con id=1 a 2 en la tabla "Pedidos"*/

UPDATE public.pedidos 
SET clientes_id = 2
WHERE id = 1

/*9. Elimina el pedido con id=1 de la tabla "Pedidos" */

DELETE FROM public.pedidos
WHERE id = 1

/*10. Lee todos los pedidos de la tabla "Pedidos".*/

SELECT * FROM public.pedidos


/*11. Crea una tabla llamada "Productos" con las columnas id (entero) y nombre
(cadena de texto). */

CREATE TABLE IF NOT EXISTS productos (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(255)
)

/* 12. Inserta un producto con id=1 y nombre='Camisa' en la tabla "Productos".*/

INSERT INTO public.productos (nombre)
VALUES ('camisa') 

/*13. Actualiza el nombre del producto con id=1 a 'Pantalón' en la tabla "Productos".*/

UPDATE public.productos
SET nombre = 'Pantalón'
WHERE id = 1

/*14. Elimina el producto con id=1 de la tabla "Productos".*/

DELETE FROM public.productos
WHERE id = 1

/*15. Lee todos los productos de la tabla "Productos". */

SELECT * FROM public.productos


/*16. Crea una tabla llamada "DetallesPedido" con las columnas pedido_id (entero) y
producto_id (entero).*/

CREATE TABLE IF NOT EXISTS DetallesPedido (
	id SERIAL PRIMARY KEY,
	pedido_id INT,
	producto_id INT
)


/* 17. Inserta un detalle de pedido con pedido_id=1 y producto_id=1 en la tabla
"DetallesPedido".*/

INSERT INTO public.detallespedido (pedido_id,producto_id)
VALUES (1,1) 


/* 18. Actualiza el producto_id del detalle de pedido con pedido_id=1 a 2 en la tabla
"DetallesPedido"*/

UPDATE public.detallespedido 
SET pedido_id = 2
WHERE id = 1

/* 19. Elimina el detalle de pedido con pedido_id=1 de la tabla "DetallesPedido".*/

DELETE FROM public.detallespedido
WHERE pedido_id = 1

/*20. Lee todos los detalles de pedido de la tabla "DetallesPedido".*/

SELECT * FROM public.detallespedido

/*21. Realiza una consulta para obtener todos los clientes y sus pedidos
correspondientes utilizando un inner join.*/

SELECT * FROM public.clientes s
INNER JOIN public.pedidos w
ON s = w

/*22. Realiza una consulta para obtener todos los clientes y sus pedidos
correspondientes utilizando un left join.*/

SELECT * FROM public.clientes s
LEFT JOIN public.pedidos w
ON s = w

/*23. Realiza una consulta para obtener todos los productos y los detalles de pedido
correspondientes utilizando un inner join.*/

SELECT * FROM public.productos s
INNER JOIN public.detallespedido w
ON s = w

/*24. Realiza una consulta para obtener todos los productos y los detalles de pedido
correspondientes utilizando un left join. */

SELECT * FROM public.productos s
LEFT JOIN public.detallespedido w
ON s = w

/*25. Crea una nueva columna llamada "telefono" de tipo cadena de texto en la tabla
"Clientes" */

ALTER TABLE public.clientes
ADD COLUMN telefono VARCHAR(255)

/*26. Modifica la columna "telefono" en la tabla "Clientes" para cambiar su tipo de
datos a entero.*/

ALTER TABLE public.clientes
ALTER COLUMN telefono TYPE INT

/* 27. Elimina la columna "telefono" de la tabla "Clientes"*/

ALTER TABLE public.clientes
DROP COLUMN telefono

/* 28. Cambia el nombre de la tabla "Clientes" a "Usuarios".*/

ALTER TABLE public.clientes
RENAME TO usuarios

/* 29. Cambia el nombre de la columna "nombre" en la tabla "Usuarios" a
"nombre_completo".*/

ALTER TABLE public.usuarios
RENAME COLUMN nombre TO usuarios 

/* 30. Agrega una restricción de clave primaria a la columna "id" en la tabla "Usuarios".*/

alter table public.usuarios
  add constraint C_P
  primary key (id)


