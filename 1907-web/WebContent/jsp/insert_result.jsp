<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert_result</title>
</head>
<body>
<h3>servlet에서 응답한 페이지</h3>
<%
	String msg = (String)request.getAttribute("msg");
	out.print(msg);
%>
</body>
</html>