<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>canvas</title>
<style>
.can {
border:2px solid #0000ff;
}
</style>
</head>
<body>
<h3>RECT</h3>
<canvas id='can1' class='can' width='300px' height='150px'></canvas>
<script>
    let canvas = document.getElementById('can1');
    let ctx = canvas.getContext('2d');
    ctx.strokeStyle = 'rgb(255,0,0)';//선의 색을 빨강으로 지정
    ctx.strokeRect(50,50,50,70);
    
    ctx.fillStyle='rgb(255,255,0)';
    ctx.fillRect(150,50,70,70);
</script>

<h3>RECT(반투명한 사격형)</h3>
<canvas id='can2' class='can' width='300px' height='150px'></canvas>
<script>
 canvas = document.getElementById('can2');
 ctx = canvas.getContext('2d');
 ctx.fillStyle = 'rgba(255,0,0,0.5)';
 ctx.fillRect(50,20,70,70);
 
 ctx.fillStyle = 'rgba(0,0,255, 0.5)'
 ctx.fillRect(85,55,70,70);
</script>

<h3>RECT(막대그래프)</h3>
<canvas id='can3' class='can' width='300px' height='150px'></canvas>
<script>
 canvas = document.getElementById('can3');
 ctx = canvas.getContext('2d');
 ctx.fillStyle ='rgb(255,255,0)';
 ctx.fillRect(0,0,300,150);
 
 ctx.fillStyle = 'rgba(0,0,255, 0.5)'
 ctx.fillRect(20,20,100,20);
 ctx.font='20px 궁서체';
 ctx.strokeText('150', 55, 38);
 
 ctx.fillStyle = 'rgb(255,0,0)'
 ctx.fillRect(20,50,130,20);
 
 ctx.fillStyle = 'rgb(0,0,255, 0.7)'
 ctx.fillRect(20,80,70,20);
 
</script>

<h3>삼각형</h3>
<canvas id='can4' class='can' width='300px' height='150px'></canvas>
<script>
canvas = document.getElementById('can4');
ctx = canvas.getContext('2d');
ctx.strokeStyle = 'rgb(255,0,0)';
ctx.beginPath();
  ctx.moveTo(150, 10);
  ctx.lineTo(120, 80);
  ctx.lineTo(180, 80);
ctx.closePath();
  ctx.stroke();
</script>

<h4>원(원호) 그리기</h4>
<canvas id='can5' class='can' width='300px' height='400px'></canvas>
<script>
canvas = document.getElementById('can5');
ctx=canvas.getContext('2d');
//type1
ctx.beginPath();
ctx.arc(75, 75, 60, 0, Math.PI*1, true);
ctx.stroke();
ctx.closePath();
ctx.stroke();

ctx.beginPath();
ctx.arc(225, 75, 60, 0, Math.PI*1, false);
ctx.stroke();
ctx.closePath();
ctx.stroke();

//type2
ctx.beginPath();
  ctx.moveTo(75, 270);
  ctx.arc(75,210,60,0,Math.PI*1, true);
ctx.closePath();
ctx.stroke();

ctx.beginPath();
ctx.moveTo(225, 190);
ctx.arc(225,210,60,0,Math.PI*1, true);
ctx.closePath();
ctx.stroke();

//type3
ctx.beginPath();  
ctx.arc(75,330,60, Math.PI*1.5, Math.PI*0.5, true);
ctx.closePath();
ctx.stroke();

ctx.beginPath();
ctx.arc(225,330,60, Math.PI*0.5, Math.PI*1.5, true);
ctx.closePath();
ctx.stroke();

</script>

</body>
</html>