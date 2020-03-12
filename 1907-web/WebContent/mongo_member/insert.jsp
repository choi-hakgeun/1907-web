<%@page import="java.util.Date"%>
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
<script src='member.js'></script>
</head>
<body>
<%
request.setCharacterEncoding("utf-8");
String findStr = request.getParameter("findStr");//select페이지에서 넘겨받은 검색어
System.out.println(findStr);
%>
<div id='main'>
<h3>회원가입</h3>
	<form name='frm' id='frm' method='post'>
		<label>아이디</label>
		<input type='text' name='mId'>
		<br/>
		<label>이름</label>
		<input type='text' name='mName'>
		<br/>
		<label>등록일</label>
		<input type='date' name='rDate'>
		<br/>
		<label>학년</label>
		<select name='grade' id='grade' >
			<option value='1'>1학년</option>
			<option value='2'>2학년</option>
			<option value='3'>3학년</option>
			<option value='4'>4학년</option>
			<option value='5'>5학년</option>
			<option value='6'>6학년</option>
		</select>
		<p/>
		<label></label>
		<input type='submit' value='등록' name='btnRegister' id='btnRegister'>
		<input type='submit' value='취소' name='btnList' id='btnList'>
		<input type='hidden' name='findStr' value='<%=findStr %>'/><!-- select페이지에서 넘겨받은 검색어를 안보이게 저장 -->
	</form>
</div>
<script>insert();</script>
</body>
</html>