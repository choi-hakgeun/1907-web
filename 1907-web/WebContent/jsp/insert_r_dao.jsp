<%@page import="bean.MemberDao"%>
<%@page import="bean.MemberVo"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>inert_r_dao</title>
</head>
<body>
<h3>dao로 요청처리</h3>
<%
request.setCharacterEncoding("utf-8");
String mId = request.getParameter("mId");
String mName = request.getParameter("mName");
String rDate = request.getParameter("rDate");
String grade = request.getParameter("grade");

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

MemberVo vo = new MemberVo();
vo.setmId(mId);
vo.setmName(mName);
vo.setrDate(sdf.parse(rDate));
vo.setGrade(Integer.parseInt(grade));

MemberDao dao = new MemberDao();
String msg = dao.insert(vo);
%>

</body>
</html>