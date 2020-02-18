<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mouse_trigger</title>
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
<h3>mouse_trigger</h3>
	<h1>Start :</h1>
	<h1>Start :</h1>

<script>
    $(document).ready(function (){
    	//이벤트를 연결합니다.
    	$('h1').click(function(){
    		$(this).html(function (index, html){
    			return html +'★';
    		});
    	});
    	//1초마다 함수를 실행합니다.
    	setInterval(function(){
    		$('h1').last().trigger('click');
    	}, 1000);
    });
</script>

</body>
</html>