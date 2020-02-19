<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>effect_dialog2</title>
<link rel='stylesheet' type='text/css' href='colorbox.css' />
<script src='../lib/jquery-3.4.1.js'></script>
<script src='../lib/jquery.colorbox-min.js'></script>
</head>
<body>
	<h1>jQuery Colorbox2</h1>
	<a href='#dialog' id='colorbox'>Dialog box</a>
<script>
$('#colorbox').colorbox({
	href : 'test.html',
	width : 450,
	height : 400,
	opacity : 0.3
});
</script>
</body>
</html>