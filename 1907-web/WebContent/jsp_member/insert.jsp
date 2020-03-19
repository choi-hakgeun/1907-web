<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>insert</title>
<link rel='stylesheet' type='text/css' href='./jsp_member/member.css'>
<script src='./lib/jquery-3.4.1.js'></script>
<script src='./jsp_member/member.js'></script>
</head>
<body>	
<div id='member_main'>
	<h3>회원등록</h3>
	<form name='frm' id='frm' method='post' enctype="multipart/form-data"> <!-- enctype을 사용하면 request.getParameter()-null이 된다(사용불가)-->
		<label>아이디</label>
		<input type='text' name='mId'><br /> 
		<label>비밀번호</label>
		<input type='password' name='pwd'><br />
		<label>회원명</label>
		<input type='text' name='mName'><br /> 
		<label>등록일</label> 
		<input type='date' name='rDate'><br /> 
		<label>학년</label> 
		<select name='grade'>
			<option value='1'>1 학년</option>
			<option value='2'>2 학년</option>
			<option value='3'>3 학년</option>
			<option value='4'>4 학년</option>
			<option value='5'>5 학년</option>
			<option value='6'>6 학년</option>
			<option value='7'>7 학년</option>
			<option value='8'>8 학년</option>
			<option value='9'>9 학년</option>
			<option value='10'>10 학년</option>
		</select> <br /> 
		<label>증명사진</label>
		<input type='file' name='photo' id='btnPhoto'/><br/>
		<label></label>
		<input type='button' id='btnRegister' value='등록'> 
		<input type='button' id='btnList' value='취소'>
		<input type='hidden' name='findStr' value='${param.findStr }'>
		<input type='text' name='nowPage' value='${param.nowPage }'>
	</form>
	<img src='http://placehold.it/150x180' id='photo' width='150px' height='180px'/>
</div>
<script>insert();</script>
</body>
</html>