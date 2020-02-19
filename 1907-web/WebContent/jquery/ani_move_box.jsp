<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ani_move_box</title>
<script src='../lib/jquery-3.4.1.js'></script>
<script>
$(document).ready(function(){
	$('div').hover(function(){
		$(this).animate({
			'left':500, 'background-color':'red'			
		}, 3000);
	}, function(){
		$(this).animate({
			'left' :0
		}, 1500)
	});
})
</script>
<style>
div{
	width : 50px;
	height : 50px;
	background-color : orange;
	position:relative;
}
</style>
</head>
<body>
<h3>box에 마우스를 올리면 box가 오른쪽으로 이동</h3>
<div></div><div></div><div></div><div></div>
<div></div><div></div><div></div><div></div>


</body>
</html>