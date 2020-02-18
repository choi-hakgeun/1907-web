<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event_toggle</title>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
<h3>event toggle</h3>
<button id='btnToggle'>Toggle</button>
<button id='btnSlide'>Slide</button>
<button id='btnFade'>Fade</button>
<p/>
<div id='result'>
    <img src='../images/semple1.gif' width='200px' height='250px'>
    <img src='../images/semple2.gif' width='200px' height='250px'>
</div>
<script>
$('#btnToggle').on('click', function(){
	$('#result').toggle(3000);
});
$('#btnSlide').on('click', function(){
	$('#result').slideToggle(3000);
})
$('#btnFade').on('click', function(){
	$('#result').fadeToggle(2000);
})
</script>

</body>
</html>