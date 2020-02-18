<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event_hover</title>
<script src='../lib/jquery-3.4.1.js'></script>
<style>
    .reverse{
    background:black;
    color:white;
    }
</style>

</head>
<body>
<h3>event_hover</h3>
    <h1>Header-0</h1>
    <h1>Header-1</h1>
    <h1>Header-2</h1>

<script>
    $(document).ready(function(){
    	//이벤트를 연결합니다.
    	$('h1').hover(function (){
    		$(this).addClass('reverse');
    	}, function(){
    		$(this).removeClass('reverse');
    	});
    });
</script>
</body>
</html>