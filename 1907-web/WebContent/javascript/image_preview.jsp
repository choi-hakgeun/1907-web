<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>image_preview</title>
</head>
<body>
<h3>image preview</h3>
<input type='file' value='사진' id='btnFile' />
<img width='200px' height='300px' id ='target' />
<script>
	let btn = document.querySelector('#btnFile');
	btn.onchange = function(event){
		let ele = event.srcElement;
		console.log('srcElement', ele);
		console.log('name : ', ele.value)
		
		let url = ele.files[0];
		let reader = new FileReader();
		reader.readAsDataURL(url);
		
		reader.onload = function(ev){
			let img = new Image();
			img.src = ev.target.result; //실제로 읽혀진 파일
			document.getElementById('target').src = img.src;
			
		}
		
	}
</script>

</body>
</html>