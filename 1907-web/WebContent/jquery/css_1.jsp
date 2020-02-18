<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css_1</title>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
<h3>css_1</h3>
    <h1 style = "color : red; ">Header-0</h1>
    <h1 style = "color : white; ">Header-1</h1>
    <h1 style = "color : purple; ">Header-2</h1>
<script>
    $(document).ready(function(){
    	//변수를 선언합니다.
    	var color = ['red', 'white', 'purple'];
    	
    	//문서 객체의 스타일을 변경합니다.
    	$('h1').css('color', function (index){
    		return color[index];
    	});
    });


</script>


</body>
</html>