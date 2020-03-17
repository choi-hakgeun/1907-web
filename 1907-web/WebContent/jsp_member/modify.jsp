<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
<link rel='stylesheet' type='text/css' href='./jsp_member/member.css'>
<script src='./lib/jquery-3.4.1.js'></script>
<script src='./jsp_member/member.js'></script></head>
<body>
	<div id='member_main'>
		<h3>회원수정</h3>
		<form name='frm' method='post' id='frm'>
			<label>아이디</label> <input type='text' name='mId'
				value='aaa' /> <br /> <label>회원명</label> <input
				type='text' name='mName' value='bbb' /> <br /> <label>등록일</label>
			<input type='date' name='rDate' value='ccc' /> <br />
			<label>학년</label> <select name='grade'>
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
			<input type='file' name='photo'/><br/>
			<input type='button' id='btnUpdate' value='저장' /> <input
				type='button' id='btnList' value='목록' /> <input type='hidden'
				name='findStr' value=''>
		</form>

	</div>
	<script>
	btnFunc();
	frm.grade.selectedIndex = 0;

</script>
</body>
</body>
</html>