<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='styleSheet' type='text/css' href='../css/index.css' />
<script src='../lib/jquery-3.4.1.js'></script>
</head>
<body>
<h3>로그인</h3>
<div id='header'>1907</div>
<div id='login_form'>
<form name='frm' id='frm' action='login_result.jsp' method='post' >
	<label>아이드</label>
	<input type='text' name='mId' id='mId' ><br/>
	<label>비밀번호</label>
	<input type='password' name='pwd' id='pwd'><p/>
	<input type='submit' value='로그인' >
	<input type="button" value="취소" id="btnCancel">
	</p>
	<p>
		<a href='#'>아이디/암호 찾기</a>
	</p>
</form>
</div>
<%@include file="../bottom.jsp" %>
<script>
$('#btnCancel').click(function(){
	location.href='../index.jsp';
})
</script>

</body>
</html>