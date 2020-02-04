<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>gradient</title>
<style>
.can{border :2px solid #8888ff}
</style>
</head>
<body>
<h3>선형 그라데이션</h3>
<canvas id='can1' class='can' width='300px' height='150px'></canvas>
<br/>
<form name='frm'>
    <input type='color' name='fc' value='#ff0000'/>
    <input type='color' name='sc' value='#00ff00'/>
    <input type='color' name='tc' value='#0000ff'/>
    <input type='button' value='선형' name='btnLinear'/>
</form>
<script>
frm.btnLinear.onclick=function(){	
	let fc = frm.fc.value;
	let sc = frm.sc.value;
	let tc = frm.tc.value;
	let ctx = document.getElementById('can1').getContext('2d');
	let gra = ctx.createLinearGradient(30,30,250,110);
	gra.addColorStop(0, fc);
	gra.addColorStop(0.5, sc);
	gra.addColorStop(1, tc);
	ctx.fillStyle = gra;
	ctx.fillRect(30,30,220,90);
}
</script>

<h3>원형 그라데이션</h3>
<canvas id='can2' class='can' width='300px' height='300px'></canvas>
<form name='frm2'>
    <input type='color' name='fc' value='#ff0000'/>
    <input type='color' name='sc' value='#00ff00'/>
    <input type='color' name='tc' value='#0000ff'/>
    <input type='button' value='원형' name='btnRadial'/>
</form>
<script>
frm2.btnRadial.onclick =function(){
	let fc = frm2.fc.value;
	let sc = frm2.sc.value;
	let tc = frm2.tc.value;
	let ctx = document.getElementById('can2').getContext('2d');
	let gra = ctx.createRadialGradient(150,75,30, 150,75,180);
	gra.addColorStop(0, fc);
	gra.addColorStop(0.5, sc);
	gra.addColorStop(1, tc);
	ctx.fillStyle = gra;
	ctx.fillRect(10,10, 280,280);
}
</script>


</body>
</html>