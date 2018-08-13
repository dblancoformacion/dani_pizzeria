<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Sibarita's</title>
	<?php
		include_once "libreria.php"; 
		sql2js('locales','dani_pizzeria',"
		SELECT id_servicio id,servicio titulo,
			'servicio' tabla, '' subtitulo
		   FROM (
			SELECT DISTINCT id_servicio FROM venden
		  ) c1 JOIN servicios USING(id_servicio)
		");
	?>
	<link rel="stylesheet" style="text/css" href="1.css">
	<script type="text/javascript" src="1.js"></script>
</head>
<body>

	<div class="container">
		<div class="servicios"></div>
		<div class="locales"></div>
	</div>

</body>
</html>