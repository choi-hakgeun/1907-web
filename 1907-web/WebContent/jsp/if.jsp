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
<h3>if</h3>
<c:set var="kor" value="80" />
<c:if test="${kor>=60}" var="r" > <!-- 펄스일경우 표시되지않음 -->
result : ${r }
</c:if>
</body>
</html>