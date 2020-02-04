<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>canvas(shadow)</title>
<style>
.can{ border:1px dashed #ff0000}
</style>
</head>
<body>
<h3>Shadow</h3>
<canvas id='can1' class='can' width='300px' height='150px'></canvas>
<br/>
<form name='frm'>
<label>바탕색</label>
<input type='color' name='bgcolor'/>
<label> 그림자색</label>
<input type='color' name='sdcolor' />
<input type='button' value='확인' id='btnRun' />
</form>
<script>
let btn = document.getElementById('btnRun');
//저장된 색상값을 태그에 적용(크롬, 파이어폭스, 오페라, IE)
frm.bgcolor.value = localStorage.getItem('bc');
frm.sdcolor.value = localStorage.getItem('sd');

btn.onclick=function(){
	let bc = frm.bgcolor.value;
	let sd = frm.sdcolor.value;
	//alert(bc +","+ sd);
	//현재 색상을 storage에 저장
	localStorage.setItem('bc', bc);
	localStorage.setItem('sd', sd);
	
	let canvas = document.getElementById('can1');
	let ctx = canvas.getContext('2d');
	ctx.fillStyle = bc;
	ctx.shadowColor=sd;
	ctx.shadowOffsetX='3';
	ctx.shadowOffsetY='3';
	ctx.shadowBlur='3';
	ctx.fillRect(30,30, 230,80);
}
</script>

</body>
</html>