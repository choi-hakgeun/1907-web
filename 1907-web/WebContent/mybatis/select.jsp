<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  	  <input type='text' name='findStr' value='${param.findStr }'>
  	  <input type='button' value='검색' id='btnFind' />
  	  
  	  <input type='hidden' name='nowPage' value='${param.nowPage }' />
  	  <input type='hidden' name='serial' value='100' />
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
  <div class='row' onclick="view(100)">  
    <span class='no'>순번1</span>
    <span class='subject'>제목1</span>
    <span class='id'>작성자1</span>
    <span class='mDate'>작성일1</span>
    <span class='hit'>조회수1</span>
  </div>

  <div class='row' onclick="view(200)">
    <span class='no'>순번2</span>
    <span class='subject'>제목2</span>
    <span class='id'>작성자2</span>
    <span class='mDate'>작성일2</span>
    <span class='hit'>조회수2</span>
  </div> 

  <div class='row' onclick="view(300)">
    <span class='no'>순번3</span>
    <span class='subject'>제목3</span>
    <span class='id'>작성자3</span>
    <span class='mDate'>작성일3</span>
    <span class='hit'>조회수3</span>
  </div>

</div>

<div id='page'>
  <input type='button' value='이전' onclick = "go(1)">
  
  <input type='button' value='1' onclick = "go(1)">
  <input type='button' value='2' onclick = "go(2)">
  <input type='button' value='3' onclick = "go(3)">
  <input type='button' value='4' onclick = "go(4)">
  <input type='button' value='5' onclick = "go(5)">
  
  <input type='button' value='다음' onclick = "go(6)">
</div>
</div>
</body>
</html>