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
		<input type='hidden' name='mId3' 'value='${param.mId }'> <!-- 리스트를 받아오는데 name이 같으면 다른값이 들어가서 vo.mId에 리스트가 들어가서 보여지지않음. -->
			<label>아이디</label>
			<input type='text' name='mId' value='${vo.mId }' /> <br /> <!-- 서블릿에서 req.setAttribute("vo", vo); 라는 코드를 작성해야 넘겨받겠구나 라고 생각해야함 -->
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
			<input type='hidden' name='nowPage' value='${param.nowPage }'>			
		</form>
		
	<c:choose>
		<c:when test="${empty vo.photos }"> <!-- 포토라고 하는 컬렉션에 사진이 없다면 -->
			<img src='http://placehold.it/150x180' id='photo' width='150px' height='180px'/>
		</c:when>
		<c:otherwise> <!-- 기타의 경우 실행 -->
			<c:forEach var='item' items='${vo.photos }'>
			<img src='./upload/${item.sysFile }' id='photo' width='150px' height='180px'/> <!-- 시리얼번호가 바뀌어 저장된 파일sysFile -->
			<!-- 다운로드시 오리파일로 받아야함 엥커테그에 파일명을 바꿔서 받을수있는 테그가 있음 -->
			</c:forEach>
		</c:otherwise>
	</c:choose>
	</div>
<script>
btnFunc();
frm.grade.selectedIndex = '${vo.grade}'-1;//강사님코드

/* frm.grade.selectedIndex = Number(${vo.grade})-1;

var upload = "./upload/${vo.sysFile }" ;
$('#photo').attr('src', upload); */
</script>
</body>
</body>
</html>