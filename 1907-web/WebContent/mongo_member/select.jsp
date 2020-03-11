<%@page import="com.mongodb.DBObject"%>
<%@page import="java.util.List"%>
<%@page import="mongo.MongoMember"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id = 'main'>
	<%
		MongoMember mm = new MongoMember();
		String findStr = "";
		List<DBObject> list = mm.select(findStr);
	
	%>

</div>

<div id='title'>
	<span class='mId'>아이디</span>
	<span class='mName'>회원명</span>
	<span class='rDate'>등록일</span>
	<span class='grade'>학년</span>
</div>
<div id = 'result'>
<%
	for(DBObject o :list){
		out.print("<div class='item'>");
		out.print("<span class='mId'>"    +o.get("mId") + "</span>");
		out.print("<span class='mName'>"  +o.get("mName") + "</span>");
		out.print("<span class='rDate'>"  +o.get("rDate") + "</span>");
		out.print("<span class='grade'>"  +o.get("grade") + "</span>");
	}
%>
</div>

</body>
</html>