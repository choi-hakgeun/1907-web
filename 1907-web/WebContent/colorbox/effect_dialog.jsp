<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>effect_dialog</title>
<link rel='stylesheet' type='text/css' href='colorbox.css' />
<script src='../lib/jquery-3.4.1.js'></script>
<script src='../lib/jquery.colorbox-min.js'></script>
</head>
<body>
	<h1>jQuery Colorbox</h1>
	<a id="colorbox" href="#dialog">Dialog with Colorbox</a>
	
	<!--  다이얼로그  -->
	<div id="dialogs" style="display:none;">
		<div id="dialog">
			<h1>Auto OPEN Colorbox</h1>
			<p>Lorem ipsum dolor sit amet.</p>			
		</div>
<script>
	$(document).ready(function(){
		$('a').colorbox({
			inline : true,
			width:550
		});		
	});
	
</script>
</body>
</html>