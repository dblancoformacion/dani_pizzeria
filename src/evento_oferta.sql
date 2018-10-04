SELECT id_articulo FROM articulos WHERE grupo='Pizzas'
  AND id_articulo<29;
SELECT * FROM venden WHERE id_servicio=2
  AND id_articulo IN (
    SELECT id_articulo FROM articulos WHERE grupo='Pizzas'
      AND id_articulo<29  
  );
DROP TABLE venden_promo;
CREATE TABLE venden_promo
  SELECT id_vende,id_articulo,precio FROM (
      SELECT id_articulo FROM articulos WHERE grupo='Pizzas'
        AND id_articulo<29  
    ) c1 JOIN venden USING(id_articulo)
    WHERE id_servicio=2;
ALTER TABLE venden_promo ADD precio_oferta float;
UPDATE venden_promo set precio_oferta=4 WHERE id_articulo<15;
UPDATE venden_promo set precio_oferta=5 WHERE precio_oferta IS NULL;
SELECT * FROM venden_promo;
-- los jueves para poner la oferta
UPDATE venden JOIN venden_promo USING(id_vende)
  SET venden.precio=venden_promo.precio_oferta;
-- lo viernes para quitar la oferta
UPDATE venden JOIN venden_promo USING(id_vende)
  SET venden.precio=venden_promo.precio;
SELECT * FROM venden;