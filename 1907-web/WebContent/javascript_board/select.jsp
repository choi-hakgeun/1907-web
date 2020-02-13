<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select title here</title>
</head>
<body>
<div id='brd_select'>
<h4>게시판 목록</h4>
<form name='brd'>
  <input type='button' value='입력' name='btnInsert' />
  <input type='text' name='findStr' id = 'findStr' >
  <input type='button' value='검색' name='btnSearch' id ='btnSearch' />
</form>
<div id='title'>
  <span class='serial'>No</span>
  <span class='subject'>제목</span>
  <span class='mName'>작성자</span>
  <span class='mData'>작성일</span>
  <span class='hit'>조회수</span>
  </div>
  <div id='list'></div>
</div>
<script src='board.js'></script>
<script>
    brd.btnSearch.click(); //클릭이벤트발생
</script>

</body>
</html>