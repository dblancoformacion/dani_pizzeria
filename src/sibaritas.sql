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
  ("Sibarita's Jim�nez D�az","C/Jim�nez D�az 14, Santander");
INSERT servicios(servicio)
  VALUES ('Reparto a domicilio'), ('Recogida en local');
INSERT articulos (articulo,grupo,descripcion)
  VALUES 
  ('Margarita','Pizzas','Tomate,mozarella y or�gano'),
  ('Seta','Pizzas','Champi��n al ajillo y or�gano'),
  ('York','Pizzas','Jam�n york'),
  ('Doggi','Pizzas','Salchichas y salsa picante'),
  ('Crujiente','Pizzas','Beicon y cebolla frita crujiente'),
  ("Sibarita's",'Pizzas','Pimiento rojo, pollo asado y parmesano'),
  ('Ronda','Pizzas','Champi�ones, gambas, aceitunas y or�gano'),
  ('Frutos de Mar','Pizzas','Gambas, cebolla, bocas de mar y or�gano '),
  ('Canaria','Pizzas','Jam�n, pi�a y pl�tano'),
  ('Cuatro Quesos','Pizzas','Mozzarella, enmental, parmesano y queso azul'),
  ('Capricho','Pizzas','Beicon y jam�n york'),
  ('Vegetal','Pizzas','Champi��n, cebolla, pimientos, esp�rragos y or�gano'),
  ('Cuatro Estaciones','Pizzas','Champi��n, jam�n york, pimientos y aceitunas'),
  ('Barbacoa','Pizzas','Carne bolo�esa, parmesano y salsa barbacoa'),
  ('Mar y Tierra','Pizzas','Gambas, champi��n, aceite al ajillo y or�gano'),
  ('Li�bana','Pizzas','Jam�n york y champi��n'),
  ('Coya','Pizzas','At�n y cebolla'),
  ('Tentaci�n','Pizzas','Beicon, cebolla, champi��n y un toque de queso azul'),
  ('C�ntabra','Pizzas','Anchoas, tomate en rodajas, aceitunas y or�gano'),
  ('Sol y Luna','Pizzas','Jam�n serrano y huevo'),
  ('Chef Calzone(empanadilla grande)','Pizzas','Bonito, pimiento, cebolla, nata y albahaca'),
  ('Cantimpalos','Pizzas','Chorizo y carne bolo�esa'),
  ('Carbonara','Pizzas','Beicon, cebolla, nata, un toque de pimienta negra y parmesano'),
  ('Gaud�','Pizzas','Bechamel y carne bolo�esa'),
  ('Flamenca','Pizzas','Ma�z, tomate natural, berenjena y or�gano'),
  ('Lomito','Pizzas','Lomo adobado, beicon y salsa chimichurri'),
  ('Monta�esa','Pizzas','Lomo adobado, pimiento de piquillo, cebolla y or�gano'),
  ('Camale�o','Pizzas','Cebolla, tomate natural, queso de cabra y or�gano'),
  ('Calabac�n','Pizzas','Tomate natural, calabac�n y or�gano '),
  ('R�cula','Pizzas','Tomate, mozzarella, r�cula, tomate natural, queso parmesano y or�gano'),
  ('Nutella y Pl�tano','Pizzas','Nutella y pl�tano'),
  ('Stromboli(Pizza Roll)','Pizzas','Jam�n york, mozzarella, bechamel, beicon y tomate'),
  ('Peregrino','Pizzas','Base de carne bolo�esa con frijoles negros, jalape�os y especias'),
  ('B�fala','Pizzas','Tomate,b�fala, cherry y pesto'),
  ('Cesar','Ensaladas','Lechuga, pollo, picatostes, queso parmesano y salsa Cesar'),
  ('Primavera','Ensaladas','Lechuga, lombarda, zanahoria, esp�rragos, salsa de yogurt y pepinillos'),
  ('Ninfa','Ensaladas','Lechuga, pasta, jam�n york, gambas y salsa rosa'),
  ('Mixta','Ensaladas','Lechuga, esp�rragos, zanahoria, tomate, cebolla, at�n, huevo y aceitunas'),
  ('Suprema','Ensaladas','Lechuga, arroz, pimiento rojo, aceitunas verdes, bocas de mar y salsa rosa'),
  ('De la Huerta','Ensaladas','Lechuga, r�cula, tomate natural y queso de cabra'),
  ('Caprese','Ensaladas','Tomate natural, mozzarella fresca, albahaca, olivas negra y pimienta'),
  ('Pan de ajo','Para compartir','Bollos de 10 unidades'),
  ('Patatas fritas','Para compartir','Raci�n'),
  ('Croquetas','Para compartir','Jam�n ib�rico o de quesos'),
  ('Empanadillas de Queso','Para compartir','Empanadilla rellena de queso mozzarella'),
  ('Soldaditos','Para compartir','igredientes????'),
  ('Espaguetti Piamontesa','Platos','Tomate frito agridulce, champi�ones, gambas, aceitunas, parmesano y especias'),
  ('Espaguetti Napolitana','Platos','Tomate frito, or�gano y queso parmesano'),
  ('Espaguetti Bolo�esa','Platos','Carne, tomate, queso parmesano y especias'),
  ('Espaguetti Carbonara','Platos','Salsa carbonara, beicon, cebolla y pimienta negra'),
  ('Lasa�a de Carne','Platos','L�minas de pasta al huevo, bechamel, carne bolo�esa, mozzarella y especias'),
  ('Lasa�a de Berenjenas','Platos','Tomate, bechamel, mozzarella y berenjenas'),
  ('Canelones de At�n','Platos','Preparado de salsa bechamel, at�n, cebolla, pimiento, cebolla, albahaca y especias'),
  ('Pastel de Patatas','Platos','Carne bolo�esa, uvas pasas, huevo, aceitunas, pur� de patatas y parmesano gratinado'),
  ('Panzerotto(Empanadilla frita)','Platos','Revuelto de nata, gambas, huevo, bocas de mar, sal y perejil'),
  ('Chili con Carne(incluye pan a la pimienta)','Platos','Frijoles negros, carne bolo�esa, jalape�os, condimentos y especias'),
  ('Risotto de Setas','Platos','Setas, nata y especias'),
  ('Raviolis','Platos','Salsa a elegir'),
  ('�oquis','Platos','Salsa a elegir'),
  ('Hamburguesa Vegetariana','Platos',"Hamburguesa de soja, tomate, cebolla, lechuga, pepinillos, mayonesa y el toque Sibarita's"),
  ('Tiramis�','Postres','Postre casero'),
  ('Tarta de Queso','Postres','Postre casero con sirope de fresa '),
  ('Tarta Oreo','Postres','Postre casero con sirope de chocolate'),
  ('Tarta Kinder','Postres','Postre casero'),
  ('Brownie Chocolate','Postres','Sin gl�ten y sin lactosa'),
  ('Helados H�agen Dazs','Postres','Sabores: tarta de queso, dulce de leche, chocolate'),
  ('Agua','Bebidas','50 cl'),
  ('Coca Cola','Bebidas','33 cl'),
  ('Coca Cola Zero','Bebidas','33 cl'),
  ('Kas naranja','Bebidas','33 cl'),
  ('Kas lim�n','Bebidas','33 cl'),
  ('Nestea','Bebidas','33 cl'),
  ('Aquarius naranja','Bebidas','33 cl'),
  ('Aquarius lim�n','Bebidas','33 cl'),
  ('Sprite','Bebidas','33 cl'),
  ('7 up','Bebidas','33 cl'),
  ('Zumo naranja','Bebidas','33 cl'),
  ('Zumo melocot�n','Bebidas','33 cl'),
  ('Zumo pi�a','Bebidas','33 cl'),
  ('Mahou cl�sica','Bebidas','33 cl'),
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
  WHERE establecimiento LIKE '%D�az%'
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
  
