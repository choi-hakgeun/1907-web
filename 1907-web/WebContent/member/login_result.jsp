<%@page import="bean.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="vo" class="bean.MemberVo"/>
<jsp:setProperty property="*" name="vo"/>
<%
MemberDao dao = new MemberDao();
boolean b = dao.login(vo);

out.print("<script>");
if(b){
	session.setAttribute("mId", vo.getmId());		
}else{
	out.print("alert('아이디나 암호를 확인해 주세요');");
}
out.print("location.href='../index.jsp'");
out.print("</script>");

%>

</body>
</html>