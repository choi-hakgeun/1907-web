<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id='mybatis'>
  <h3>자유게시판</h3>
  <form name='frm' method='post' id='frm_select' >
  	<input type='button' value='입력' id='btnInsert' />
  	<div>
  	  <input type='text' name='findStr' value='${(empty p.findStr)? param.findStr : p.findStr }'>
  	  <input type='button' value='검색' id='btnFind' />
  	  
  	  <input type='text' name='nowPage' value='${(empty p.nowPage)? "1" : p.nowPage }' />
  	  <input type='text' name='serial' />
  	</div>
  </form>
  
  <div id='title'>
    <span class='no'>순번</span>
    <span class='subject'>제목</span>
    <span class='id'>작성자</span>
    <span class='mDate'>작성일</span>
    <span class='hit'>조회수</span>
  </div>
  
  <div id='table'>
  
  <c:forEach var="i" items="${list }"> <!-- 테그라이브러리를 사용한 반복문  req.setAttribute("list", xxxx) list에 해당한다. var 는 boardVo 타입의 데이타-->
	  <div class='row' onclick="view(${i.serial})"> <!-- BoardVo.getSerial() 을 가저온것 -->  
	    <span class='no'>${i.serial }</span>
	    <span class='subject'>${i.subject } ${(i.attCnt>0) ? [i.attCnt ] : ''}</span>
	    <span class='id'>${i.id }</span>
	    <span class='mDate'>${i.mDate }</span>
	    <span class='hit'>${i.hit }</span>
	  </div>
  </c:forEach>  

</div>

<div id='page'>
	  <c:if test="${p.startPage>p.blockSize }">
	    <input type='button' value='이전' onclick = "go(${p.startPage-1})">
	  </c:if>
	  
	  <c:forEach var="i" begin="${p.startPage }" end="${p.endPage }">
	  	<input type='button' value='${i }' onclick = "go(${i})"
	  	 class="${(param.p.nowPage==i)? 'here':''}"	>
	  </c:forEach>
	  
      <c:if test="${p.totPage>p.endPage }">
        <input type='button' value='다음' onclick = "go(${p.endPage+1})">
      </c:if>
</div>
</div>
</body>
</html>