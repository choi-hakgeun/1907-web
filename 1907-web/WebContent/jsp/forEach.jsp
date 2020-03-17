<%@page import="bean.MemberVo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forEach</title>
</head>
<body>
<h3>forEach</h3>
<h4>forEach를 사용한 구구단</h4>
<c:set var='dan' value='5'/> <!-- 스코프영역 -->
<c:forEach var='i' begin='1' end='9' step='1'> <!-- 1부터 9까지 1씩 증가하면서 출력 -->
	${dan }*${i } = ${dan*i }<br/> <!-- 이렇게 사용하려면 스코프영역에 값을 저장해둬야함 -->
</c:forEach>
<h3>1~100까지의 홀수만 출력</h3>
<c:forEach var='i' begin='1' end='100' step='2'>
	${i }
</c:forEach>

<h3>1~100까지의 수중 3 또는 5의배수</h3>
<c:forEach var='i' begin='1' end='100' step='1'>
	<c:if test="${i%3==0or i%5==0 }">
	${i }
	</c:if>
</c:forEach>

<h4>Java Collection을 사용한 forEach</h4>
<%
	List<String> list = new ArrayList<String>();
	list.add("김씨"); list.add("이씨"); list.add("홍씨");
	list.add("최씨"); list.add("박씨"); list.add("남씨");
	
	request.setAttribute("list", list);	
%>
<c:forEach var='item' items='${list }'> <!-- 아이템즈를 사용하면 리스트에 담긴 값을 하나씩 가저옴 -->
	${item }
</c:forEach>
<hr/> <!-- 구분선 -->
<!-- 리스트의 0부터 5까지 안에 1부터 (자신을 포함한)2개단위씩(1개건너뛰고) 건너뛰며 출력 -->
<c:forEach var='item' items='${list }' begin='1' end='4' step='2'>
	${item }
</c:forEach>
<hr/>
<h4>forEach의 상태값</h4>
<c:forEach var='item' items='${list }' varStatus='st'>
	<li>cuurent : ${st.current }
	<li>index : ${st.index }
	<li>count : ${st.count }
	<hr/>
</c:forEach>

<h4>MemberVo 타입의 데이터를 List에 저장한 후 출력</h4>
<%
	Date d =new Date();
	MemberVo vo = new MemberVo("a", "a", d , 1);	
	MemberVo vo2 = new MemberVo("b", "b", d , 2);
	MemberVo vo3 = new MemberVo("c", "c", d , 3);
	MemberVo vo4 = new MemberVo("d", "d", d , 4);
	List<MemberVo> list2 = new ArrayList<MemberVo>();
	list2.add(vo);
	list2.add(vo2);
	list2.add(vo3);
	list2.add(vo4);
	
	request.setAttribute("list2", list2);
%>
<ul>
<c:forEach var='vo' items='${list2 }' >
	<fmt:formatDate var="temp" pattern="yyyy-MM-dd" value="${vo.rDate }"/>	
	<li>${vo.mId } | ${vo.mName } | ${temp } | ${vo.grade }</li>
</c:forEach>
</ul>

</body>
</html>