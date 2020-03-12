<%@page import="mongo.MongoMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css' href='member.css'>
<script src='../lib/jquery-3.4.1.js'></script>
<!-- 점 하나는 같은폴더, 점 두개는 상위폴더 -->
<script src='./member.js'></script>
</head>
<body>
<div id='main'>
	<%
		request.setCharacterEncoding("utf-8");
		String findStr = request.getParameter("findStr");
		String mId = request.getParameter("mId");
		MongoMember mm = new MongoMember();
		String msg = mm.delete(msg);
	%>
</div>
<script>btnFunc();</script>
</body>
</html>