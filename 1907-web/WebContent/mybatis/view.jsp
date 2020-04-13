<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id='mybatis'>
  <h2>자유게시판 상세보기</h2>  
  
  <form name='frm' method='post' >
  <label>작성자</label>
  <input type='text' name='id' value='${vo.id }'><br/>
  
  <label>제목</label>
  <input type='text' name='subject' value='${vo.subject }' /><br/>
  <textarea rows="10" cols="70" name="content">${vo.content }</textarea>
  <br/>  
  
  <label>파일 첨부</label>
  <div id='attList'>
  	<ul>
  	<c:forEach var='i' items='${attList }'>
  	    <li><a href='${i.sysFile }' download='${i.oriFile }'>${i.oriFile }</a></li>
  	</c:forEach>
  		
  	</ul>
  </div>
  
  <input type='button' value='수정' id='btnModify'>
  <input type='button' value='삭제' id='btnDelete'>
  <input type='button' value='댓글' id='btnRepl'>  
  <input type='button' value='취소' id='btnList'>
  <br/>
  <input type='text' name='nowPage' value='${param.nowPage }'> <!-- 텍스트는 히든으로 바꿀것 -->
  <input type='text' name='findStr' value='${param.findStr }'>
  <input type='text' name='serial' value='${param.serial }'>
  <input type='text' name='pSerial' value='${vo.serial }'>
  <input type='text' name='pwd' >
  
  </form>

  
</div>