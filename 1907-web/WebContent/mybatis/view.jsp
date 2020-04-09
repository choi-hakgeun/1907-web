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
  <h2>자유게시판 상세보기</h2>  
  
  <form name='frm' method='post' >
  <label>작성자</label>
  <input type='text' name='id' value='hong'><br/>
  
  <label>제목</label>
  <input type='text' name='subject' value='방가루~~' /><br/>
  <textarea rows="10" cols="70" name="content">방가~~</textarea><br/>
  
  <label>암호</label>
  <input type='hidden' name='pwd' value='1' /><br/>
  <label>파일 첨부</label>
  <div id='attList'>
  	<ul>
  		<li><a href='abc.png' download='abc.png'>abc.png</a></li>
  		<li><a href='abc.png' download='abc.png'>abc.png</a></li>
  		<li><a href='abc.png' download='abc.png'>abc.png</a></li>
  		<li><a href='abc.png' download='abc.png'>abc.png</a></li>
  		<li><a href='abc.png' download='abc.png'>abc.png</a></li>
  	</ul>
  </div>
  
  <input type='button' value='수정' id='btnModify'>
  <input type='button' value='삭제' id='btnDelete'>
  <input type='button' value='댓글' id='btnRepl'>  
  <input type='button' value='취소' id='btnList'>
  <br/>
  <input type='text' name='nowPage' value='${param.nowPage }'> <!-- 텍스트는 히든으로 바꿀것 -->
  <input type='text' name='findStr' value='${param.findStr }'>
  <input type='text' name='serial' value='1'>
  
  </form>

  
</div>

</body>
</html>