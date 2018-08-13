window.addEventListener('load',()=>{
	var	v=document.querySelector('.locales');
	for(var i=0;i<locales.length;i++){
		v.innerHTML+='<a href="?id_'+locales[i].tabla+'='+locales[i].id+'" ><div><div><h2>'+locales[i].titulo+'</h2><p>'+locales[i].subtitulo+'</p></div></div></a>';
	}

	
});