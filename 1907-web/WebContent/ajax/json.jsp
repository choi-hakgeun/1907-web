<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="bean.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection conn = DBConn.getConn();
String sql="select * from employees";
PreparedStatement ps = conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();
/*
	[
	 {'id' : '100' , 'fn' : 'Luis' , 'mid' : '200' },
	 {'id' : '100' , 'fn' : 'Luis' , 'mid' : '200' },
	 {'id' : '100' , 'fn' : 'Luis' , 'mid' : '200' }
	]
*/
StringBuilder sd = new StringBuilder();
sd.append("[");
while(rs.next()){
	String str = String.format("{'id':'%s', 'fn':'%s', 'mid':'%s'},",
				 rs.getInt("employee_id"), rs.getString("first_name"), rs.getInt("manager_id")
				 );
			sd.append(str);
}

String data = sd.toString();
data = data.replaceAll("\'", "\"");
data = data.substring(0, data.length()-1); //마지막 콤마 제거
data += "]";
out.print(data);
%>