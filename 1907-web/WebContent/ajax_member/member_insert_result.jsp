<%@page import="bean.MemberVo"%>
<%@page import="bean.MemberDao"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
out.print(request.getParameter("mId"));

int g = Integer.parseInt(request.getParameter("grade"));
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
Date date = sdf.parse(request.getParameter("rDate"));

MemberDao dao = new MemberDao();
MemberVo vo = new MemberVo();
vo.setmId(request.getParameter("mId"));
vo.setmName(request.getParameter("mName"));
vo.setrDate(date);
vo.setGrade(g);

String r = dao.insert(vo);
out.print(r);
%>