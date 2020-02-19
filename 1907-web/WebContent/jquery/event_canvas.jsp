<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='../lib/jquery-3.4.1.js'></script>
<style>
#canvas{
	border:2px solid #aaf;
}
</style>
</head>
<body>
<canvas id='canvas' width='600px' height='400px'></canvas>
<p/>
x=<output id='x'></output>, y=<output id='y'></output> 
<script>
let canvas = document.getElementById('canvas');
canvas.width = window.innerWidth-20;
canvas.height = window.innerHeight-90;
let ctx = canvas.getContext('2d');
ctx.strokeStyle = 'rgb(255,0,0)';
let flag=false;//mousedown일때 true, mouseup일때 false
$(canvas).on({
	mousemove:
		function(ev){
			if(flag){
				let pos = $(this).offset();
				let x = ev.pageX-pos.left;
				let y = ev.pageY-pos.top;
				ctx.lineTo(x,y);
				ctx.stroke();
			}
		},
	mousedown : 
		function(ev){
			let x = ev.pageX;
			let y = ev.pageY;
			ctx.beginPath();
			ctx.moveTo(x,y);
			flag=true;
		},
	mouseup:
		function(ev){
			let pos = $(this).offset();
			let x = ev.pageX-pos.left;
			let y = ev.pageY-pos.top;
			ctx.lineTo(x,y);
			ctx.stroke();
			flag=false;
		}
	}	
	
);

</script>
</body>
</html>