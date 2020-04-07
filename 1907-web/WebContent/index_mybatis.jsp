<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index_mybatis</title>
<link rel='stylesheet' type='text/css' href='./css/mybatis.css'>
<script src='./js/mybatis.js'></script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String inc="select.myba";  //./mybatis/select.jsp
if(request.getParameter("inc") != null){
	inc = request.getParameter("inc");
}
%>

<div id='mybatis'>
  <div id='header'>
    <h3>mybatis + servlet + jstl</h3>
  </div>
  
  <div id='center'>
    <jsp:include page="<%=inc %>"/>
  </div>
  
  <div id='footer'>
  1907<font size='2'><sup>TM</sup></font>
  </div>
</div>
<script>btnFunc()</script>
</body>
</html>