<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert_r_jsp</title>
</head>
<body>
<h3>순수 jsp로 요청 처리</h3>
<%
request.setCharacterEncoding("utf-8");
String mId = request.getParameter("mId");
String mName = request.getParameter("mName");
String rDate = request.getParameter("rDate");
String grade = request.getParameter("grade");

Connection conn = DBConn.getConn();
String sql = "insert into member(mId, mName, rDate, grade) "
			+" values(?,?,?,?)";
PreparedStatement ps = conn.prepareStatement(sql);
ps.setString(1, mId);
ps.setString(2, mName);
ps.setString(3, rDate);
ps.setInt(4, Integer.parseInt(grade));

int cnt = ps.executeUpdate();
String msg = "";
if(cnt>0) msg = "입력됨.";
else msg="오류발생.";

%>
<h4>결과 : <%=msg %></h4>
<ul>
	<li>mId = <%=mId %></li>
	<li>mName = <%=mName %></li>
	<li>rDate = <%=rDate %></li>
	<li>grade = <%=grade %></li>

</ul>


</body>
</html>