window.addEventListener('load',()=>{
	var	v=document.querySelector('.datos');
	for(var i=0;i<datos.length;i++){
		v.innerHTML+='<a href="'+datos[i].enlace+'='+datos[i].id+'" ><div><div><h2>'+datos[i].titulo+'</h2><p>'+datos[i].subtitulo+'</p></div></div></a>';
	}

	
});