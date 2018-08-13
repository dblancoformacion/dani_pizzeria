<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Sibarita's  <?=$_GET['id_servicio']?> </title>
	<?php
		include_once "libreria.php"; 
		if(isset($_GET['id_servicio'])==0){
			sql2js('datos','dani_pizzeria',"
			SELECT id_servicio id,servicio titulo,
				'?id_servicio' enlace, '' subtitulo
			   FROM (
				SELECT DISTINCT id_servicio FROM venden
			  ) c1 JOIN servicios USING(id_servicio)
			  ORDER BY id_servicio;
			");
		}
		else{
			if(!isset($_GET['id_local'])&&$_GET['id_servicio']!=1){
				sql2js('datos','dani_pizzeria',"
				SELECT id_local id,
					   establecimiento titulo,
					   localidad subtitulo,
					   '?id_servicio=".$_GET['id_servicio']."&id_local' enlace
				  FROM (
					SELECT DISTINCT id_local
					  FROM venden WHERE id_servicio=".$_GET['id_servicio']."  
				  ) c1 JOIN locales USING(id_local);				
				");
			}
			else{
				sql2js('datos','dani_pizzeria',"
				SELECT id_articulo id,
					   articulo titulo,
					   CONCAT(grupo,': ',
						  descripcion,' ',precio,'€') subtitulo        
						FROM (
					SELECT id_articulo,precio FROM venden
					  WHERE id_servicio=".$_GET['id_servicio']." 
					  AND id_local=".$_GET['id_local']."  
				  ) c1 JOIN articulos USING(id_articulo)
				  ORDER BY grupo DESC,articulo;				
				");
				
			}
		}
	?>
	<link rel="stylesheet" style="text/css" href="1.css">
	<script type="text/javascript" src="1.js"></script>
</head>
<body>

	<div class="container">
		<div class="datos"></div>
	</div>

</body>
</html>