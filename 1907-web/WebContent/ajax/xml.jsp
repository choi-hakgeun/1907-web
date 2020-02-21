<%@page import="bean.DBConn"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>

<departments>
<%
	Connection conn = DBConn.getConn();
	String sql = "select * from departments";
	PreparedStatement ps = conn.prepareStatement(sql);
	ResultSet rs = ps.executeQuery();
	while(rs.next()){
		StringBuilder sd = new StringBuilder();
		sd.append("<department>");
		sd.append("<id>" + rs.getInt("department_id") + "</id>" );
		sd.append("<dname>" + rs.getString("department_name") + "</dname>" );
		sd.append("<mid>" + rs.getInt("manager_id") + "</mid>");
		sd.append("</department>");
		out.print(sd.toString());
	};	
%>
</departments>