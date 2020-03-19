<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html" charset=UTF-8">
<title>select</title>
<link rel='stylesheet' type='text/css' href='./jsp_member/member.css'> <!-- 인덱스를 기준으로해서 경로를 찾아가기 때문에'./jsp_member/member.css' 로 경로를 설정해야함 -->
<script src='./lib/jquery-3.4.1.js'></script>
<script src='./jsp_member/member.js'></script>
</head>
<body>
	<div id='member_main'>
		<h3>회원조회</h3>
		<form name='frm' id='frm' method='post'>
			<input type='button' value='추가' id='btnInsert'>
			<div>
			<input type='submit' value='검색' name='btnFind' id='btnFind'> 
			<input type='hidden' name='mId' 'value='${param.mId }'>
			<input type='text' name='findStr' value='${param.findStr }'> <!-- 테스트 후 히든테그로 바꿔야함 -->
			<input type='text' name='nowPage' id='nowPage' value='${empty param.nowPage? 1 : param.nowPage }'> <!-- 테스트 후 히든테그로 바꿔야함 -->
			</div>
		</form>
		<div id='title'>
			<span class='mId'>아이디</span> 
			<span class='mName'>회원명</span> 
			<span class='rDate'>등록일</span> 
			<span class='grade'>학년</span>
		</div>
		<div id='result'>
			<div class='item' onclick="view('aaa')">
				<span class='mId'>aaa</span>
				<span class='mName'>bbb</span> 
				<span class='rDate'>2020-03-17</span> 
				<span class='grade'>1</span>
			</div>
			<div class='item' onclick="view('bbb')">
				<span class='mId'>bbb</span> 
				<span class='mName'>bbb</span> 
				<span class='rDate'>2020-03-17</span> 
				<span class='grade'>1</span>
			</div>
			
			<c:forEach var="vo" items="${list }">
			<div class='item' onclick="view('${vo.mId}')">
				<span class='mId'>${vo.mId }</span>
				<span class='mName'>${vo.mName }</span>
				<span class='rDate'>${vo.rDate }</span>
				<span class='grade'>${vo.grade }</span>
			</div>
			</c:forEach>
			
		</div>
		<div id = 'paging'>
			<c:if test="${p.nowPage > p.blockSize }">
			<input type='button' value='처음' onclick='goPage(1)' >
			</c:if>
			<c:forEach var='i' begin='${p.startPage }' end='${p.endPage }'>
				<input type='button' value='${i }' onclick='goPage(${i})' >			
			</c:forEach>			
			<c:if test="${p.nowPage < p.totPage }">
			<input type='button' value='다음' onclick='goPage(${p.endPage+1})' >
			</c:if>
		</div>
	</div>	
	<script>btnFunc();</script>
</body>
</html>