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
  <h2>게시물 작성</h2>
  <form name='frm' method='post' id='frm_input' enctype='multipart/form-data'>
  <label>작성자</label>
  <input type='text' name='id' value='hong'><br/>
  
  <label>제목</label>
  <input type='text' name='subject' value='방가루~~' /><br/>
  <textarea rows="10" cols="70" name="content">방가~~</textarea><br/>
  
  <label>암호</label>
  <input type='text' name='pwd' value='1' /><br/>
  <label>파일 첨부</label>
  <input type='file' name='att' multiple id='btnAtt'/> <!-- 파일선택상자의 버튼 아이디가 btnAtt 여러개의 파일을 업로드하기위해multiple(배열값) 을사용 -->
  
  <fieldset id='attList'><legend>첨부된 파일 목록</legend></fieldset> <!-- 그 결과를 문자열로 만들어서 innerHTML(필드셋 안에)안에 넣음 -->
  
  <p/>  
  <input type='button' value='저장' id='btnRegister'>
  <input type='button' value='취소' id='btnList'>
  <br/>
  <input type='text' name='nowPage' value='${param.nowPage }'>
  <input type='text' name='findStr' value='${param.findStr }'>
  
  </form>
</div>


</body>
</html>