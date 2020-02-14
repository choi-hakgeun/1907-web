<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>image_preview_2</title>
<style>
#file{
    display : none;
}
</style>
</head>
<body>
<h3>이미지 미리보기(II)</h3>
<img id='target1' width='200px' height='250px' />
<img id='target2' width='200px' height='250px' />
<img id='target3' width='200px' height='250px' />
<input type='file' id='btnFile' />

<script>
    let t1 = document.getElementById('target1');
    let t2 = document.getElementById('target2');
    let t3 = document.getElementById('target3');
    let btnFile = document.getElementById('btnFile');
    
    t1.onclick = imagePreView;
    t2.onclick = imagePreView;
    t3.onclick = imagePreView;
    
    function imagePreView(event){
    	
    	btnFile.click();
    	btnFile.onchange = function(){
	    	let url = btnFile.files[0];
 		   	let reader = new FileReader();
    		reader.readAsDataURL(url);
    		
    		reader.onload = function(ev){
    			let target = event.srcElement;
    			let img = new Image();
    			img.src = ev.target.result;
    			target.src = img.src;
    		}
    		
    	}
    	
    }
    
    
</script>

</body>
</html>