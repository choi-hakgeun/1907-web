<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>set</title>
</head>
<body>
<h3>set</h3>
<fieldset><legend>기본 set</legend>
<c:set var='kor' value='90' />
<c:set var='eng'>88</c:set>
<c:set var='tot' value='${kor+eng}' />
<c:set var='avg'>${tot/2 }</c:set>
<ul>
	<li>kor : ${kor }</li>
	<li>eng : ${eng }</li>
	<li>tot : ${tot }</li>
	<li>avg : ${avg }</li>
</ul>
</fieldset>
<fieldset><legend>[ html ]</legend>
<%
	String html = "<font color='red' size='6'>홍길동</font>";
	pageContext.setAttribute("abc", html);	
%>
html : ${abc }
<c:remove var="abc"/> <!-- 삭제 / 안하면 빨간색 홍길동 글씨가 표시됨.-->
remove : ${abc }
</fieldset>

<fieldset><legend>[ java bean ]</legend>
<jsp:useBean id="vo" class="bean.MemberVo" scope="page" />
<c:set target='${vo }' property='mId' value='hong gil dong' /> <!-- 세터실행 -->
<c:set target='${vo }' property='pwd' value='1234' />
<li>mId = ${vo.mId }</li> <!-- 게터 실행 -->
<li>pwd = ${vo.pwd }</li>

</fieldset>

</body>
</html>