<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>abc</title>
</head>
<body>
<span>폼 태그의 값들을 전달받음...</span>
<% //스클립들릿(java code)
  String mId = request.getParameter("mId");
  out.print(mId);
%>

</body>
</html>