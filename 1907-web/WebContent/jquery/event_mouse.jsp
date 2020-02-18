<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event_mouse</title>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
	<canvas id="canvas" width="700" height="400" style="border: 3px solid black">
	</canvas>
<script>
		//변수를 선언합니다.
		let canvas = document.getElementById('canvas');
		let context = canvas.getContext('2d');
		context.strokeStyle = 'rgb(255,0,0)';
		let fleg=false;//mousedown일때  true, mouseup일때 false	
	$(document).ready(function(){
	//이벤트를 연결합니다.
	$(canvas).on({
		mousedown : function (event){
			//위치를 얻어냅니다.
			var position = $(this).offset();
			var x = event.pageX - position.left;
			var y = event.pageY - position.top;
		},
		mouseup : function (event){
			//위치를 얻어냅니다.
			var position = $(this).offset();
			var x = event.pageX - position.left;
			var y = event.pageY - position.top;
		}
	});
	
	$(canvas).on({
			mousemove : function (event){
				if(flag){
					let pos = $(this).offset();
					let x = event.pageX-pos.left;
					let y = event.pageY-pos.top;
					context.lineTo(x,y);
					context.stroke();
				}
			},
		mousedown : function(event){
			//위치를 얻어냅니다.
			var position = $(this).offset();
			var x = event.pageX - position.left;
			var y = event.pageY - position.top;
			
			//선을 그립니다.
			context.beginPath();
			context.moveTo(x,y);
			flag=true;
		},
		mouseup : function (event){
			//위치를 얻어 냅니다.
			var position = $(this).offset();
			var x = event.pageX - position.left;
			var y = event.pageY - position.top;
			
			//선을 그립니다.
			context.lineTo(x, y);
			context.stroke();
			flag=false;
		}
	})
});
</script>
</body>
</html>