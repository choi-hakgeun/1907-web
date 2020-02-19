<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ani_slide</title>
<script src='../lib/jquery-3.4.1.js'></script>
<script
  src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
  integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
  crossorigin="anonymous"></script>
<style>
	*{margin: 0px; padding:0px;}
	#canvas{
		background-color :gray;
		width : 600px;
		height : 400px;
		position : relative;
		overflow : hidden;
	}
	.inner-box{
		background-color : orange;
		
		width : 100px;
		height : 100px;
		
		position : absolute;
	}
	
</style>
</head>
<body>
	<h1>Test Header</h1>
	<div id="canvas">
		<div class="inner-box"></div>
		<div class="inner-box"></div>
		<div class="inner-box"></div>
		<div class="inner-box"></div>
		<div class="inner-box"></div>	
	</div>
	<h1>Test Header</h1>
<script>
	$(document).ready(function(){
		$('.inner-box').each(function (index){
			$(this).css({
				left:index*90,
				top : index*90
			});
		});
	});
</script>


</body>
</html>