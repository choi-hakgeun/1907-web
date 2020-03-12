<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view</title>
<link rel='stylesheet' type='text/css' href='member.css'>
<script src='../lib/jquery-3.4.1.js'></script>
<!-- 점 하나는 같은폴더, 점 두개는 상위폴더 -->
<script src='member.js'></script>
</head>
<body>
<%
	let d = Date.rows[0];
%>
<div id='view'>
	<h3>회원 정보 상세조회</h3>
	<form name='frm' id='frm' method='post'>
		<label>아이디</label>
		<input type='text' name='mId' value='<%=d[0]%>' />
		<br/>
		<label>성명</label>
		<input type='text' name='mName' value='<%d[1]%>' />
		<br/>
		<label>등록일</label>
		
		
	</form>
</div>

</body>
</html>