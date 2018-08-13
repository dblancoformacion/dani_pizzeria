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

CREATE TABLE ingredientes(
  id_ingrediente int AUTO_INCREMENT,
  ingrediente varchar(255),
  precio float,
  PRIMARY KEY(id_ingrediente),
  UNIQUE  (ingrediente)  
  );

CREATE  TABLE agregan(
  id_articulo int,
  id_ingrediente int,
  cantidad int DEFAULT 1,
  PRIMARY KEY (id_ingrediente,id_articulo),
  FOREIGN KEY (id_articulo) REFERENCES articulos(id_articulo),
  FOREIGN KEY (id_ingrediente) REFERENCES ingredientes(id_ingrediente)
  );

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
  id_articulo int,
  id_servicio int,
  id_local int,
  precio float,
  PRIMARY KEY (id_articulo,id_servicio,id_local),
  FOREIGN KEY(id_articulo) REFERENCES articulos (id_articulo),
  FOREIGN KEY(id_servicio) REFERENCES servicios (id_servicio),
  FOREIGN KEY(id_local) REFERENCES locales (id_local)  
  );
INSERT locales (establecimiento,localidad)
  VALUES ("Sibarita's Guevara","C/Guevara 28, Santander"),
  ("Sibarita's Jiménez Díaz","C/Jiménez Díaz 14, Santander");
INSERT servicios(servicio)
  VALUES ('Reparto a domicilio'), ('Recogida en local');
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
  ('Empanadillas de Queso','Para compartir','Empanadilla rellena de queso mozzarella'),
  ('Soldaditos','Para compartir','igredientes????'),
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
  ('Raviolis','Platos','Salsa a elegir'),
  ('Ñoquis','Platos','Salsa a elegir'),
  ('Hamburguesa Vegetariana','Platos',"Hamburguesa de soja, tomate, cebolla, lechuga, pepinillos, mayonesa y el toque Sibarita's"),
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
  ('Moscato','Bebidas','75 cl');

INSERT ingredientes(ingrediente,precio)
  VALUES ('Pepinillos',1),('Queso Mozzarella',1),('Gambas',1.5);

INSERT venden (id_local, id_servicio, id_articulo, precio)
  VALUES 
  (1,2,2,5.9),
  (2,2,2,5.9),
  (2,1,3,8.8),
  (2,2,3,7.9),
  (2,1,4,8.2),
  (2,2,4,7.6);

INSERT agregan (id_ingrediente,id_articulo,cantidad)
  VALUES(1,2,2);

/*Que articulos enviamos a domicilio desde J.Diaz*/

 /*SELECT articulo,venden.precio FROM venden
  INNER JOIN locales USING(id_local)
  INNER  JOIN servicios USING (id_servicio)
  INNER  JOIN articulos USING (id_articulo)
  WHERE establecimiento LIKE '%Díaz%'
  AND servicio LIKE '%domicilio%';

/*Calcular el precio de carbonara en j.diaz a domicilio y con doble pepinillo
  */
/*TRUNCATE agregan;
INSERT agregan (id_ingrediente, id_articulo, cantidad)
  VALUES (1,3,2),(3,3,1),(2,3,1);
SELECT * FROM agregan;

SELECT id_articulo,precio FROM venden WHERE  
  id_local=2 AND
  id_servicio=1 AND
  id_articulo=3;

SELECT articulo,
  ROUND(c1.precio+
  SUM(i.precio*cantidad),2) FROM (
  SELECT id_articulo,precio FROM venden WHERE  
  id_local=2 AND
  id_servicio=1 AND
  id_articulo=3
  ) c1 JOIN agregan USING (id_articulo)
  JOIN ingredientes i USING(id_ingrediente)
  JOIN articulos USING(id_articulo); 
  
*/ 
  
