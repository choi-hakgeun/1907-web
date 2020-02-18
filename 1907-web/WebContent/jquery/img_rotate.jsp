<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>img_rotate</title>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
<div>
    <img src = '../images/semple1.gif' />
    <img src = '../images/semple2.gif' />
    <img src = '../images/semple3.gif' />
    <img src = '../images/semple4.gif' />
    <img src = '../images/semple5.gif' />
</div>
<script>
    $(document).ready(function(){
    	// .image의 크기를 조정합니다.
    	$('img').css('width', 250);
    	
    	//함수를 2초마다 실행합니다.
    	setInterval(function(){
    		//첫 번째 이미지를 마지막으로 보냅니다.
    		$('img').first().appendTo('body');
    		
    	}, 2000);
    });

</script>


</body>
</html>