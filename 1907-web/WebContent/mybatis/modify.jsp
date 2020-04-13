<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div id='mybatis'>
<h2>자유 게시물 수정</h2>
<form name='frm' method='post' enctype='multipart/form-data'>
  <label>작성자</label>
  <input type='text' name='id' value='${vo.id }'><br/>
  
  <label>제목</label>
  <input type='text' name='subject' value='${vo.subject }' /><br/>
  <textarea rows="10" cols="70" name="content">${vo.content }</textarea><br/>
  

  <label>파일 첨부</label>
  <input type='file' name='att' multiple id='btnAtt'/> <!-- 파일선택상자의 버튼 아이디가 btnAtt 여러개의 파일을 업로드하기위해multiple(배열값) 을사용 -->
  
  <fieldset id='attList'><legend>첨부할 파일 목록</legend></fieldset> <!-- 그 결과를 문자열로 만들어서 innerHTML(필드셋 안에)안에 넣음 -->
  <fieldset><legend>첨부된 파일 목록</legend>
    <c:forEach var='i' items='${attList }'>
      <div><!-- 자기자신을 포함하고있는 첫번째 노드[0] 자식노드는 주석도 포함하고 있음.-->
        <span>${i.oriFile }</span><input type='checkbox' name='delFile' value="${i.sysFile }" onclick='delCheck(this)'> <!-- 실제 저장된 파일명을 벨류값을 가지고 delFile에 저장, 자기자신을 나타내는(this) -->
      </div>
    </c:forEach>
  
  </fieldset>  
  <p/>  
  <input type='button' value='저장' id='btnUpdate'>
  <input type='button' value='취소' id='btnList'>
  <br/>
  <input type='text' name='pwd' value='1' /><br/>
  <input type='text' name='nowPage' value='${param.nowPage }'>
  <input type='text' name='findStr' value='${param.findStr }'>
  <input type='text' name='serial' value='${vo.serial }'>
  </form>
</div>