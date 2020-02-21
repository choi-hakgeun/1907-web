<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_main</title>
<link rel='stylesheet' type='text/css' href='member.css' />
<script src='../lib/jquery-3.4.1.js'></script>
<script src='member.js'></script>

</head>
<body>
<h2>회원관리</h2>
<form name='frm' id='frm'>
	<input type='text' name='findStr' id='findStr'>
	<input type='button' value='검색' id='btnFind'>
</form>
<div id='result'></div>
<script>
init();
</script>


</body>
</html>
