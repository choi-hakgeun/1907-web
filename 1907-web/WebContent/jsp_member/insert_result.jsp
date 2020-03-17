<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert_result</title>
<link rel='stylesheet' type='text/css' href='./jsp_member/member.css'>
<script src='./lib/jquery-3.4.1.js'></script>
<script src='./jsp_member/member.js'></script></head>
<body>
	<div id='member_main'>
		
		어서와!!!

		<form name='frm' id='frm' method='post'>
			<input type='hidden' name='findStr' value=''> <input
				type='button' value='목록' id='btnList'>
		</form>
	</div>
	<script>btnFunc()</script>
</body>
</html>