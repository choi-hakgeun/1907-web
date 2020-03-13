<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="vo" class="bean.MemberVo2" scope="page"/> <!-- memberVo vo = new MemberVo 와 같음 -->
<jsp:setProperty name="vo" property="*"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert_r_bean</title>
</head>
<body>
<h3>bean으로 요청처리 하기</h3>
<%
MemberDao dao = new MemberDao();
String msg = dao.insert2(vo);
%>
<%=msg %>

</body>
</html>