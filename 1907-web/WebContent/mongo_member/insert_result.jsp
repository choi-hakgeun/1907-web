<%@page import="com.mongodb.BasicDBObject"%>
<%@page import="mongo.MongoMember"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	String msg="";
	String findStr = request.getParameter("findStr");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	MongoMember mm = new MongoMember();
	BasicDBObject obj = new BasicDBObject();	
	
	obj.put("mId", request.getParameter("mId"));
	obj.put("mName",  request.getParameter("mName"));
	obj.put("rDate",  request.getParameter("rDate"));
	obj.put("grade",  request.getParameter("grade"));
	msg = mm.insert(obj);
%>
<%= msg %>

<form name='frm' id='frm' method='post'>
	<input type='hidden' name='findStr' value='<%=findStr %>'>
	<input type='button' value='목록' id='btnList'>
</form>
</div>
<script>btnFunc()</script>

</body>
</html>