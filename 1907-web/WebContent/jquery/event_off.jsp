<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>event_off</title>
<script src='../lib/jquery-3.4.1.js'></script>

</head>
<body>
<h3>event_off</h3>
    <h1>Header-0</h1>
    <h1>Header-1</h1>
    <h1>Header-2</h1>

<script>
$(document).ready(function(){
	//이벤트를 연결합니다.
	$('h1').click(function(){
		//출력합니다.
		$(this).html('CLICK');
		alert('이벤트가 발생했습니다.');
		
		//이벤트를 제거합니다.
		$(this).off();
	});
});
</script>

</body>
</html>