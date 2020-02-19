<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>effect_colorbox</title>
<link rel='stylesheet' type='text/css' href='colorbox.css' />
<script src='../lib/jquery-3.4.1.js'></script>
<script src='../lib/jquery.colorbox-min.js'></script>

</head>
<body>
<h3>colorbox plug-in</h3>
<a rel='abc' href='../images/semple1.gif'>semple1</a>
<a rel='abc' href='../images/semple2.gif'>semple2</a>
<a rel='abc' href='../images/semple3.gif'>semple3</a>
<a rel='abc' href='../images/semple4.gif'>semple4</a>
<a rel='abc' href='../images/semple5.gif'>semple5</a>
<script>
$('a').colorbox({
	opacity : 0.5
});
</script>

</body>
</html>