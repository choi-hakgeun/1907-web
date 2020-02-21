<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member_select</title>
</head>
<body>
<h3>회원조회</h3>

<%
String findStr = request.getParameter("findStr");
MemberDao dao = new MemberDao();
String json = dao.select(findStr);
out.print(json);
%>
</body>
</html>