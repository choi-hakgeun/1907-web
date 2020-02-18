<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>set_thema</title>
<script src='../lib/jquery-3.4.1.js'></script>
<style>
#main{
  width : 600px;
  height: 400px;
  border: 2px solid #0000ff ;
}
#subject{
    margin : 10px;
    width : 500px;
    height: 150px;
    border: 2px solid #0000ff ;    
    background-color : solid #00ff00;
}
#content{
    margin : 10px;
    width : 500px;
    height: 150px;
    border: 2px solid #0000ff ;    
    background-color : solid #00ff00;
}
</style>

</head>
<body>
<h3>set_thema</h3>
<div id='main'>
    <div id='subject'>
        제목
        <p id='content'></p>        
    </div>
</div>
<button id ='btn1'>흑백테마</button>
<button id ='btn2'>하늘테마</button>
<button id ='btn3'>땅테마</button>
<script>
$('#btn1').click(function(){
	$('#main').attr('class','main');
	$('#subject').attr('class','subject');
	$('#content').attr('class', 'content');
	$('#content').html('난 흑백 테마다~');
})
$('#btn2').click(function(){
	$('#main').attr('class','main_sky');
	$('#subject').attr('class','subject_sky');
	$('#content').attr('class', 'content_sky');
	$('#content').html('난 하늘 테마다~');
})
$('#btn3').click(function(){
	$('#main').attr('class','main_land');
	$('#subject').attr('class','subject_land');
	$('#content').attr('class', 'content_land');
	$('#content').html('난 땅 테마다~');
})
</script>

</body>
</html>