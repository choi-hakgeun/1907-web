<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>xhr_test</title>
<script src='../lib/jquery-3.4.1.js'></script>
<style>
div{
	display:inline-block;
	width:300px;
	height:200px;
	border:2px solid #00f;
}
</style>
</head>
<body>
<h3>XMLHttpRequest 객체 Test</h3>
<input type='button' value='Ajax 실행1' id='btn1' />
<input type='button' value='Ajax 실행2' id='btn2' />
<p/>
<div id='div1'></div> 
<div id='div2'></div>

<script>
let xhr = new XMLHttpRequest();

$('#btn1').click(function(){
	xhr.onreadystatechange=function(){
		//console.log(xhr.status +' , ' + xhr.readyState);
		if(xhr.status==200 && xhr.readyState==4){
			$('#div1').html(xhr.responseText);
		}
	}
	
	xhr.open('get', 'test1.html', true);
	xhr.send();
	
})

$('#btn2').click(function(){
	xhr.onreadystatechange=function(){
		//console.log(xhr.status +' , ' + xhr.readyState);
		if(xhr.status==200 && xhr.readyState==4){
			$('#div2').html(xhr.responseText);
		}
	}
	
	xhr.open('get', 'test2.jsp', true);
	xhr.send();
})
</script>



</body>
</html>