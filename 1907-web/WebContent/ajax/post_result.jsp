<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>post_result</title>
</head>
<body>
<%
String mid = request.getParameter("mid");
String pwd = request.getParameter("pwd");
String hobby = request.getParameter("hobby");

out.print("<li>mid :" +mid);
out.print("<li>pwd :" +pwd);
out.print("<li>hobby :" +hobby);

String[] mnt = request.getParameterValues("mnt");
for(int i=0; i<mnt.length ;i++){
	out.print("<li>mnt : " + mnt[i]);
}

String[] sel = request.getParameterValues("sel");
for(int i=0; i<sel.length; i++){
	out.print("<li>sel : " +sel[i]);
}
%>


</body>
</html>