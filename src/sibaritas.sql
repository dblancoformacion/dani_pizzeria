DROP DATABASE IF EXISTS dani_pizzeria;
CREATE DATABASE dani_pizzeria;
USE dani_pizzeria; 

CREATE TABLE articulos(
  id_articulo int AUTO_INCREMENT,
  articulo varchar(255),
  descripcion varchar(255),
  grupo varchar(255),
  PRIMARY KEY(id_articulo),
  UNIQUE (articulo)  
  );
SELECT * FROM articulos; 


CREATE TABLE ingredientes(
  id_ingrediente int AUTO_INCREMENT,
  ingrediente varchar(255),
  precio float,
  gluten bool,
  PRIMARY KEY(id_ingrediente),
  UNIQUE  (ingrediente)  
  );
SELECT * FROM ingredientes;

CREATE  TABLE agregan(
  id_agrega int AUTO_INCREMENT,
  id_articulo int,
  id_ingrediente int,
  cantidad int DEFAULT 1,
  PRIMARY KEY (id_agrega),
  UNIQUE  (id_articulo,id_ingrediente),
  FOREIGN KEY (id_articulo) REFERENCES articulos(id_articulo),
  FOREIGN KEY (id_ingrediente) REFERENCES ingredientes(id_ingrediente)
  );
SELECT * FROM agregan;

CREATE TABLE locales(
  id_local int AUTO_INCREMENT,
  establecimiento varchar(255),
  localidad varchar(255),
  PRIMARY KEY(id_local),
  UNIQUE  (establecimiento)
  );
CREATE TABLE servicios(
  id_servicio int AUTO_INCREMENT,
  servicio varchar(255),
  PRIMARY KEY (id_servicio),
  UNIQUE (servicio)
  );

CREATE TABLE venden(
  id_vende int AUTO_INCREMENT,
  id_articulo int,
  id_servicio int,
  id_local int,
  precio float,
  PRIMARY KEY (id_vende),
  UNIQUE  (id_articulo,id_servicio,id_local),
  FOREIGN KEY(id_articulo) REFERENCES articulos (id_articulo),
  FOREIGN KEY(id_servicio) REFERENCES servicios (id_servicio),
  FOREIGN KEY(id_local) REFERENCES locales (id_local)  
  );

-- preguntar a david si está correcto
CREATE TABLE metodos_de_pagos(
  id_metodo_pago int AUTO_INCREMENT,
  metodo_de_pago varchar(255),  
  PRIMARY KEY (id_metodo_pago)
  );
 SELECT * FROM metodos_de_pagos;

CREATE TABLE clientes(
  id_cliente int AUTO_INCREMENT,
  cliente varchar(255),
  cp int,
  direccion varchar(255),
  telefono int,
  PRIMARY KEY (id_cliente)  
  );

CREATE TABLE carritos(
  id_carrito int AUTO_INCREMENT,
  id_metodo_pago int,
  id_cliente int,
  PRIMARY KEY (id_carrito),
  -- UNIQUE(id_metodo_pago,id_cliente),
  FOREIGN KEY (id_metodo_pago) REFERENCES metodos_de_pagos(id_metodo_pago),
  FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)    
  );

CREATE TABLE seleccionan(
  id_selecciona int AUTO_INCREMENT,
  id_agrega int,
  uds_ingrediente int,
  PRIMARY KEY(id_selecciona),
  FOREIGN KEY (id_agrega) REFERENCES agregan(id_agrega)
  );



INSERT locales (establecimiento,localidad)
  VALUES 
  ("Sibarita's Guevara","C/Guevara 28, Santander"),
  ("Sibarita's Jiménez Díaz","C/Jiménez Díaz 14, Santander")
  ;

SELECT * FROM locales;
INSERT servicios(servicio)
  VALUES ('Reparto a domicilio'), ('Recogida en local');

SELECT * FROM servicios;
INSERT articulos (articulo,grupo,descripcion)
  VALUES 
  ('Margarita','Pizzas','Tomate,mozarella y orégano'),
  ('Seta','Pizzas','Champiñón al ajillo y orégano'),
  ('York','Pizzas','Jamón york'),
  ('Doggi','Pizzas','Salchichas y salsa picante'),
  ('Crujiente','Pizzas','Beicon y cebolla frita crujiente'),
  ("Sibarita's",'Pizzas','Pimiento rojo, pollo asado y parmesano'),
  ('Ronda','Pizzas','Champiñones, gambas, aceitunas y orégano'),
  ('Frutos de Mar','Pizzas','Gambas, cebolla, bocas de mar y orégano '),
  ('Canaria','Pizzas','Jamón, piña y plátano'),
  ('Cuatro Quesos','Pizzas','Mozzarella, enmental, parmesano y queso azul'),
  ('Capricho','Pizzas','Beicon y jamón york'),
  ('Vegetal','Pizzas','Champiñón, cebolla, pimientos, espárragos y orégano'),
  ('Cuatro Estaciones','Pizzas','Champiñón, jamón york, pimientos y aceitunas'),
  ('Barbacoa','Pizzas','Carne boloñesa, parmesano y salsa barbacoa'),
  ('Mar y Tierra','Pizzas','Gambas, champiñón, aceite al ajillo y orégano'),
  ('Liébana','Pizzas','Jamón york y champiñón'),
  ('Coya','Pizzas','Atún y cebolla'),
  ('Tentación','Pizzas','Beicon, cebolla, champiñón y un toque de queso azul'),
  ('Cántabra','Pizzas','Anchoas, tomate en rodajas, aceitunas y orégano'),
  ('Sol y Luna','Pizzas','Jamón serrano y huevo'),
  ('Chef Calzone(empanadilla grande)','Pizzas','Bonito, pimiento, cebolla, nata y albahaca'),
  ('Cantimpalos','Pizzas','Chorizo y carne boloñesa'),
  ('Carbonara','Pizzas','Beicon, cebolla, nata, un toque de pimienta negra y parmesano'),
  ('Gaudí','Pizzas','Bechamel y carne boloñesa'),
  ('Flamenca','Pizzas','Maíz, tomate natural, berenjena y orégano'),
  ('Lomito','Pizzas','Lomo adobado, beicon y salsa chimichurri'),
  ('Montañesa','Pizzas','Lomo adobado, pimiento de piquillo, cebolla y orégano'),
  ('Camaleño','Pizzas','Cebolla, tomate natural, queso de cabra y orégano'),
  ('Calabacín','Pizzas','Tomate natural, calabacín y orégano '),
  ('Rúcula','Pizzas','Tomate, mozzarella, rúcula, tomate natural, queso parmesano y orégano'),
  ('Nutella y Plátano','Pizzas','Nutella y plátano'),
  ('Stromboli(Pizza Roll)','Pizzas','Jamón york, mozzarella, bechamel, beicon y tomate'),
  ('Peregrino','Pizzas','Base de carne boloñesa con frijoles negros, jalapeños y especias'),
  ('Búfala','Pizzas','Tomate,búfala, cherry y pesto'),
  ('Cesar','Ensaladas','Lechuga, pollo, picatostes, queso parmesano y salsa Cesar'),
  ('Primavera','Ensaladas','Lechuga, lombarda, zanahoria, espárragos, salsa de yogurt y pepinillos'),
  ('Ninfa','Ensaladas','Lechuga, pasta, jamón york, gambas y salsa rosa'),
  ('Mixta','Ensaladas','Lechuga, espárragos, zanahoria, tomate, cebolla, atún, huevo y aceitunas'),
  ('Suprema','Ensaladas','Lechuga, arroz, pimiento rojo, aceitunas verdes, bocas de mar y salsa rosa'),
  ('De la Huerta','Ensaladas','Lechuga, rúcula, tomate natural y queso de cabra'),
  ('Caprese','Ensaladas','Tomate natural, mozzarella fresca, albahaca, olivas negra y pimienta'),
  ('Pan de ajo','Para compartir','Bollos de 10 unidades'),
  ('Patatas fritas','Para compartir','Ración'),
  ('Croquetas','Para compartir','Jamón ibérico o de quesos'), 
  ('Espaguetti Piamontesa','Platos','Tomate frito agridulce, champiñones, gambas, aceitunas, parmesano y especias'),
  ('Espaguetti Napolitana','Platos','Tomate frito, orégano y queso parmesano'),
  ('Espaguetti Boloñesa','Platos','Carne, tomate, queso parmesano y especias'),
  ('Espaguetti Carbonara','Platos','Salsa carbonara, beicon, cebolla y pimienta negra'),
  ('Lasaña de Carne','Platos','Láminas de pasta al huevo, bechamel, carne boloñesa, mozzarella y especias'),
  ('Lasaña de Berenjenas','Platos','Tomate, bechamel, mozzarella y berenjenas'),
  ('Canelones de Atún','Platos','Preparado de salsa bechamel, atún, cebolla, pimiento, cebolla, albahaca y especias'),
  ('Pastel de Patatas','Platos','Carne boloñesa, uvas pasas, huevo, aceitunas, puré de patatas y parmesano gratinado'),
  ('Panzerotto(Empanadilla frita)','Platos','Revuelto de nata, gambas, huevo, bocas de mar, sal y perejil'),
  ('Chili con Carne(incluye pan a la pimienta)','Platos','Frijoles negros, carne boloñesa, jalapeños, condimentos y especias'),
  ('Risotto de Setas','Platos','Setas, nata y especias'),  
  ('Tiramisú','Postres','Postre casero'),
  ('Tarta de Queso','Postres','Postre casero con sirope de fresa '),
  ('Tarta Oreo','Postres','Postre casero con sirope de chocolate'),
  ('Tarta Kinder','Postres','Postre casero'),
  ('Brownie Chocolate','Postres','Sin glúten y sin lactosa'),
  ('Helados Häagen Dazs','Postres','Sabores: tarta de queso, dulce de leche, chocolate'),
  ('Agua','Bebidas','50 cl'),
  ('Coca Cola','Bebidas','33 cl'),
  ('Coca Cola Zero','Bebidas','33 cl'),
  ('Kas naranja','Bebidas','33 cl'),
  ('Kas limón','Bebidas','33 cl'),
  ('Nestea','Bebidas','33 cl'),
  ('Aquarius naranja','Bebidas','33 cl'),
  ('Aquarius limón','Bebidas','33 cl'),
  ('Sprite','Bebidas','33 cl'),
  ('7 up','Bebidas','33 cl'),
  ('Zumo naranja','Bebidas','33 cl'),
  ('Zumo melocotón','Bebidas','33 cl'),
  ('Zumo piña','Bebidas','33 cl'),
  ('Mahou clásica','Bebidas','33 cl'),
  ('Vino de la casa','Bebidas','75 cl'),
  ('Lambrusco','Bebidas','75 cl'),
  ('Moscato','Bebidas','75 cl'),
  ('Empanadillas de Queso','Para compartir','Empanadilla rellena de queso mozzarella'),
  ('Saladitos','Para compartir','Masa de hojaldre horneada de jamón y queso'),
  ('Raviolis','Platos','Masa fresca rellena de queso con salsa a elegir: boloñesa, cuatro quesos o pesto.'),
  ('Ñoquis','Platos','Pasta fresca de patata con salsa a elegir: boloñesa, cuatro quesos o pesto'),
  ('Hamburguesa Vegetariana','Platos',"Hamburguesa de soja, tomate, cebolla, lechuga, pepinillos, mayonesa y el toque Sibarita's");

SELECT * FROM articulos; 

SELECT * FROM ingredientes;  

INSERT ingredientes(ingrediente,precio)
  VALUES ('Pollo',1.5),('Tomate natural',1.5),('Gambas',1.5),('Jamón serrano',1.5),('Atún',1.5),('Anchoas',1.5),('Carne',1.5),('Bechamel',1.5),('Berenjenas',1.5),('Lomo',1.5),('Alcachofas',1.5),
  ('Queso de cabra',1.5),('Jalapeños',1.5),('Rúcula',1.5),('Búfala',1.5),('Queso vegano',1.5),('Queso sin lactosa',1.5),('Champiñón',1),('Jamón york',1),('Salchichas',1),('Beicon',1),
  ('Cebolla frita crujiente',1),('Salsa picante',1),('Pimiento rojo',1),('Pimiento verde',1),('Cebolla',1),('Aceitunas negras',1),('Aceitunas verdes',1),('Bocas de mar',1),('Piña',1),
  ('Plátano',1),('Enmental',1),('Parmesano',1),('Queso azul',1),('Espárragos',1),('Salsa barbacoa',1),('Huevo',1),('Albahaca',1),('Chorizo',1),('Maíz',1),('Salsa chimichurri',1),
  ('Pimiento del piquillo',1),('Calabacín',1),('Pesto',1.5),('Cherry',1.5),('Mayonesa',1),('Base tomate',1),('Queso Mozzarella',1),('Orégano',0),('Pimienta negra',0),('Nata',1),('Frijoles',1.5),
  ('Salsa cesar', 1),('Picatostes',1),('Lombarda',1),('Zanahoria',1),('Salsa de yogurt',1.5),('Pepinillos',1),('Salsa rosa',1),('Arroz',1); 


INSERT venden (id_local, id_servicio, id_articulo, precio)
  VALUES 
  -- reparto a domicilio de jimenes diaz
  (2,1,1,6.9),(2,1,2,7.6),(2,1,3,7.6),(2,1,4,7.6),(2,1,5,8.2),(2,1,6,8.2),(2,1,7,8.2),(2,1,8,8.2),(2,1,9,8.2),(2,1,10,8.2),(2,1,11,8.2),(2,1,12,8.2),(2,1,13,8.2),(2,1,14,8.2),(2,1,15,8.2),
  (2,1,16,8.2),(2,1,17,8.2),(2,1,18,8.2),(2,1,19,8.2),(2,1,20,8.8),(2,1,21,8.8),(2,1,22,8.8),(2,1,23,8.8),(2,1,24,8.8),(2,1,25,8.8),(2,1,26,8.8),(2,1,27,8.8),(2,1,28,8.8),(2,1,29,8.8),
  (2,1,30,9.9),(2,1,31,8.5),(2,1,32,8.8),(2,1,33,8.8),(2,1,34,9.9),(2,1,35,4.8),(2,1,36,4.8),(2,1,37,4.8),(2,1,38,4.8),(2,1,39,4.8),(2,1,40,4.8),(2,1,41,5.2),(2,1,42,3),(2,1,43,3),(2,1,44,5),
  (2,1,45,7.9),(2,1,46,7.9),(2,1,47,8),(2,1,48,8.6),(2,1,49,8),(2,1,50,8),(2,1,51,8),(2,1,52,8),(2,1,53,5),(2,1,54,8),(2,1,55,8.2),(2,1,56,3.9),(2,1,57,3.9),(2,1,58,3.9),(2,1,59,3.9),
  (2,1,60,3.9),(2,1,61,3.2),(2,1,62,1.5),(2,1,63,1.8),(2,1,64,1.8),(2,1,65,1.8),(2,1,66,1.8),(2,1,67,1.8),(2,1,68,1.8),(2,1,69,1.8),(2,1,70,1.8),(2,1,71,1.8),(2,1,72,1.9),(2,1,73,1.9),
  (2,1,74,1.9),(2,1,75,1.8),(2,1,76,6.4),(2,1,77,9.2),(2,1,78,9.2),(2,1,83,5.9),
  
  -- recoger en local jimenez diaz
  (2,2,1,6.7),(2,2,2,7.3),(2,2,3,7.3),(2,2,4,7.3),(2,2,5,7.9),(2,2,6,7.9),(2,2,7,7.9),(2,2,8,7.9),(2,2,9,7.9),(2,2,10,7.9),(2,2,11,7.9),(2,2,12,7.9),(2,2,13,7.9),(2,2,14,7.9),(2,2,15,7.9),
  (2,2,16,7.9),(2,2,17,7.9),(2,2,18,7.9),(2,2,19,7.9),(2,2,20,8.5),(2,2,21,8.5),(2,2,22,8.5),(2,2,23,8.5),(2,2,24,8.5),(2,2,25,8.5),(2,2,26,8.8),(2,2,27,8.8),(2,2,28,8.8),(2,2,29,8.8),
  (2,2,30,9.9),(2,2,31,8.5),(2,2,32,8.8),(2,2,33,8.8),(2,2,34,9.9),(2,2,35,4.8),(2,2,36,4.8),(2,2,37,4.8),(2,2,38,4.8),(2,2,39,4.8),(2,2,40,4.8),(2,2,41,5.2),(2,2,42,3),(2,2,43,3),(2,2,44,5),
  (2,2,45,7.9),(2,2,46,7.9),(2,2,47,8),(2,2,48,8.6),(2,2,49,8),(2,2,50,8),(2,2,51,8),(2,2,52,8),(2,2,53,5),(2,2,54,8),(2,2,55,8.2),(2,2,56,3.9),(2,2,57,3.9),(2,2,58,3.9),(2,2,59,3.9),
  (2,2,60,3.9),(2,2,61,3.2),(2,2,62,1.5),(2,2,63,1.8),(2,2,64,1.8),(2,2,65,1.8),(2,2,66,1.8),(2,2,67,1.8),(2,2,68,1.8),(2,2,69,1.8),(2,2,70,1.8),(2,2,71,1.8),(2,2,72,1.9),(2,2,73,1.9),
  (2,2,74,1.9),(2,2,75,1.8),(2,2,76,6.4),(2,2,77,9.2),(2,2,78,9.2),(2,2,83,5.9),

 -- recoger en local guevara
  (1,2,1,6.7),(1,2,2,7.3),(1,2,3,7.3),(1,2,4,7.3),(1,2,5,7.9),(1,2,6,7.9),(1,2,7,7.9),(1,2,8,7.9),(1,2,9,7.9),(1,2,10,7.9),(1,2,11,7.9),(1,2,12,7.9),(1,2,13,7.9),(1,2,14,7.9),(1,2,15,7.9),
  (1,2,16,7.9),(1,2,17,7.9),(1,2,18,7.9),(1,2,19,7.9),(1,2,20,8.5),(1,2,21,8.5),(1,2,22,8.5),(1,2,23,8.5),(1,2,24,8.5),(1,2,25,8.5),(1,2,26,8.8),(1,2,27,8.8),(1,2,28,8.8),(1,2,29,8.8),
  (1,2,30,9.9),(1,2,31,8.5),(1,2,32,8.8),(1,2,33,8.8),(1,2,34,9.9),(1,2,35,4.8),(1,2,36,4.8),(1,2,37,4.8),(1,2,38,4.8),(1,2,39,4.8),(1,2,40,4.8),(1,2,41,5.2),(1,2,42,3),(1,2,43,3),(1,2,44,5),
  (1,2,45,7.9),(1,2,46,7.9),(1,2,47,8),(1,2,48,8.6),(1,2,49,8),(1,2,50,8),(1,2,51,8),(1,2,52,8),(1,2,53,5),(1,2,54,8),(1,2,55,8.2),(1,2,56,3.9),(1,2,57,3.9),(1,2,58,3.9),(1,2,59,3.9),
  (1,2,60,3.9),(1,2,61,3.2),(1,2,62,1.5),(1,2,63,1.8),(1,2,64,1.8),(1,2,65,1.8),(1,2,66,1.8),(1,2,67,1.8),(1,2,68,1.8),(1,2,69,1.8),(1,2,70,1.8),(1,2,71,1.8),(1,2,72,1.9),(1,2,73,1.9),
  (1,2,74,1.9),(1,2,75,1.8),(1,2,76,6.4),(1,2,77,9.2),(1,2,78,9.2),(1,2,79,6),(1,2,80,4),(1,2,81,8.6),(1,2,82,8.6),(1,2,83,5.9);


SELECT * FROM venden; 
INSERT agregan (id_ingrediente,id_articulo,cantidad)
  VALUES
  -- pizza margarita
  (47,1,1),(48,1,1),(49,1,1),
  -- pizza seta
  (47,2,1),(48,2,1),(18,2,1),(49,2,1),
  -- pizza york
  (47,3,1),(48,3,1),(19,3,1),
  -- pizza doggi
  (47,4,1),(48,4,1),(20,4,1),(23,4,1),
  -- pizza crujiente
  (47,5,1),(48,5,1),(21,5,1),(22,5,1),
  -- pizza sibaritas
  (47,6,1),(48,6,1),(24,6,1),(1,6,1),(33,6,1),
  -- pizza ronda
  (47,7,1),(48,7,1),(18,7,1),(3,7,1),(27,7,1),(49,7,1),
  -- pizza frutos de mar
  (47,8,1),(48,8,1),(3,8,1),(26,8,1),(29,8,1),(49,8,1),
  -- pizza canaria
  (47,9,1),(48,9,1),(19,9,1),(30,9,1),(31,9,1),
  -- pizza cuatro quesos
  (48,10,1),(32,10,1),(33,10,1),(34,10,1),
  -- pizza capricho
  (47,11,1),(48,11,1),(21,11,1),(19,11,1),
  -- pizza vegetal
  (47,12,1),(48,12,1),(18,12,1),(26,12,1),(24,12,1),(35,12,1),(49,12,1),
  -- pizza cuatro estaciones
  (47,13,1),(48,13,1),(18,13,1),(19,13,1),(24,13,1),(27,13,1),
  -- pizza barbacoa
  (7,14,1),(48,14,1),(33,14,1),(36,14,1),
  -- pizza mar y tierra
  (47,15,1),(48,15,1),(3,15,1),(18,15,1),(49,15,1),
  -- pizza liebana
  (47,16,1),(48,16,1),(18,16,1),(19,16,1),
  -- pizza coya
  (47,17,1),(48,17,1),(5,17,1),(26,17,1),
  -- pizza tentacion
  (47,18,1),(48,18,1),(21,18,1),(26,18,1),(18,18,1),(34,18,1),
  -- pizza cantabra
  (47,19,1),(48,19,1),(6,19,1),(2,19,1),(27,19,1),(49,19,1),
  -- pizza sol y luna
  (47,20,1),(48,20,1),(4,20,1),(37,20,1),
  -- pizza cantimpalos
  (47,21,1),(48,21,1),(39,21,1),(7,21,1),
  -- pizza carbonara
  (48,22,1),(21,22,1),(26,22,1),(33,22,1),(51,22,1),
  -- pizza gaudi
  (7,23,1),(48,23,1),(8,23,1),
  -- pizza flamenca
  (47,24,1),(48,24,1),(40,24,1),(2,24,1),(9,24,1),(49,24,1),
  -- pizza lomito
  (47,25,1),(48,25,1),(10,25,1),(21,25,1),(41,25,1),
  -- pizza montañesa
  (47,26,1),(48,26,1),(10,26,1),(42,26,1),(26,26,1),(49,26,1),
  -- pizza camaleño
  (47,27,1),(48,27,1),(26,27,1),(2,27,1),(12,27,1),(49,27,1),
  -- pizza calabacin
  (47,28,1),(48,28,1),(2,28,1),(43,28,1),(49,28,1),
  -- pizza rucula
  (47,29,1),(48,29,1),(14,29,1),(2,29,1),(33,29,1),(49,29,1),
  -- pizza nutella y platano
  (47,30,1),(48,30,1),(31,30,1),
  -- pizza peregrino
  (7,33,1),(48,33,1),(52,33,1),(13,33,1),
  -- pizza bufala
  (47,34,1),(48,34,1),(15,34,1),(45,34,1),(44,34,1),

  -- ensalada cesar
  (1,35,1),(54,35,1),(33,35,1),(53,35,1),
  -- ensalada primavera
  (55,36,1),(56,36,1),(35,36,1),(57,36,1),(58,36,1),
  -- ensalada ninfa
  (19,37,1),(3,37,1),(59,37,1),
  -- ensalada mixta
  (35,38,1),(56,38,1),(2,38,1),(26,38,1),(5,38,1),(37,38,1),(27,38,1),
  -- ensalada suprema
  (60,39,1),(42,39,1),(28,39,1),(29,39,1),(59,39,1),
  -- ensalada de la huerta
  (14,40,1),(2,40,1),(12,40,1),
  -- ensalada caprese
  (2,41,1),(15,41,1),(38,41,1),(27,41,1),(50,41,1),
  
  -- espagueti piamontesa
  (18,45,1),(3,45,1),(27,45,1),(33,45,1),
  -- espagueti napolitana
  (33,46,1),
  -- espagueti boloñesa
  (33,47,1),
  -- espaguetti carbonara
  (21,48,1),(26,48,1),(50,48,1),
  -- pastel de patatas
  (37,52,1),(27,52,1),(33,52,1);

SELECT * FROM venden;

-- tabla de metodos de pago prueba
  INSERT metodos_de_pagos (metodo_de_pago)
  VALUES ('Efectivo'),('Tarjeta de crédito o débito'),('Pay Pal');


-- vamos a añadir dos clientes de prueba
  INSERT clientes (cliente, cp, direccion, telefono)
  VALUES 
    ('Daniel Delgado', '39008', 'Avd. Valdecilla 11 3ºB', '682323318'),
    ('Adriana Rodríguez', '39008', 'Avd. Valdecilla 11 3ºB', '697671487'); 
  
 
  
SELECT articulo FROM articulos WHERE  grupo='pizzas';

CREATE VIEW pizzas AS
  SELECT articulo FROM articulos WHERE  grupo='pizzas';

SELECT articulo FROM articulos WHERE grupo='platos';

CREATE VIEW platos AS
  SELECT articulo FROM articulos WHERE grupo='platos';


