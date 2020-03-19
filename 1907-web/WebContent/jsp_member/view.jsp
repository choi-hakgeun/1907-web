<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
<title>view</title>
<link rel='stylesheet' type='text/css' href='./jsp_member/member.css'>
<script src='./lib/jquery-3.4.1.js'></script>
<script src='./jsp_member/member.js'></script></head>
<body>
	<div id='member_main'>
		<h3>회원상세보기</h3>
		
		<form name='frm' id='frm' method='post' >
		<input type='hidden' name='mId' 'value='${param.mId }'>
			<label>아이디</label>
			<input type='text' name='mId' value='${vo.mId }' /> <br /> 
			<label>회원명</label>
			<input type='text' name='mName' value='${vo.mName }' /> <br /> 
			<label>등록일</label>
			<input type='date' name='rDate' value='${vo.rDate }' /> <br />
			<label>학년</label> 
			<select name='grade' value='${vo.grade }'>
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
			</select>
			<p />
			<label>증명사진</label>
			<input type='file' name='photo' id='btnPhoto'/><br/><!-- 디폴트값으로 파일선택 버튼이 생성됨 -->
			<label></label>
			<input type='button' id='btnModify' value='수정' /> 
			<input type='button' id='btnDelete' value='삭제' />
			<input type='button' id='btnList' value='목록' /> 
			<input type='hidden' name='findStr'	value='${param.findStr }' />
			<input type='text' name='nowPage' value='${param.nowPage }'>			
		</form>
	<img src='http://placehold.it/150x180' id='photo' width='150px' height='180px'/>
	</div>
<script>
btnFunc();

var upload = "./upload/${vo.sysFile }" ;
$('#photo').attr('src', upload);
frm.grade.selectedIndex = Number(${vo.grade})-1;
</script>
</body>
</body>
</html>