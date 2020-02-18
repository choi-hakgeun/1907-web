<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ani_menu</title>
<script src='../lib/jquery-3.4.1.js'></script>
<style>
#main{
width:1020px;
border:1px solid black;
}
#main>div{
    float:left;
    border:1px solid black;
    width :200px;
    height:50px;
}
#main>div>div{
    display:none;
    border:1px solid black;
    width :200px;
    height:30	0px;
}

</style>
</head>
<body>
<h3>ani_menu</h3>
<div id='main'>
	<div id='sub1'>
		<span id='menu1'>menu1</span>
		<div id='div1'>div1</div>
	</div>
	<div id='sub2'>	
		<span id='menu2'>menu2</span>
		<div id='div2'>div2</div>
	</div>
	<div id='sub3'>
		<span id='menu3'>menu3</span>
		<div id='div3'>div3</div>
	</div>
	<div id='sub4'>	
		<span id='menu4'>menu4</span>
		<div id='div4'>div4</div>
	</div>
	<div id='sub5'>	
		<span id='menu5'>menu5</span>
		<div id='div5'>div5</div>
	</div>
</div>
<p/>

<script>
$('#menu1').on('click', function(){
	$('#div1').toggle(1000);
})
$('#menu2').on('click', function(){
	$('#div2').slideToggle(1000);
})
$('#menu3').on('click', function(){
	$('#div3').fadeToggle(1000);
})
$('#menu4').on('click', function(){
	$('#div4').toggle(1000);
})
$('#menu5').on('click', function(){
	$('#div5').slideToggle(1000);
})
</script>


</body>
</html>