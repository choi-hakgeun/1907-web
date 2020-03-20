<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify_result</title>
</head>
<body>
<link rel='stylesheet' type='text/css' href='./jsp_member/member.css'>
<script src='./lib/jquery-3.4.1.js'></script>
<script src='./jsp_member/member.js'></script></head>
<body>
	<div id='member_main'>
		
		<h3>${msg }</h3>
		<form name='frm' id='frm' method='post'>
			<input type='button' value='목록' id='btnList'>
			<input type='text' name='findStr' value='${findStr }'> 
			<input type='text' name='nowPage' value='${nowPage }'>
		</form>
		<script>btnFunc();</script>
</body>
</html>