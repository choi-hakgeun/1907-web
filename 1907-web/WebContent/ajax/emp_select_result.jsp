<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="bean.DBConn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

String findStr = request.getParameter("findStr");
Connection conn = DBConn.getConn();
String sql= " select e.employee_id eid, e.first_name fn, to_char(e.salary, '999,999') sal, "
		  + " e.department_id did, nvl(d.department_name, ' ') dname " 
          + " from employees e left outer join departments d "
          + " on e.department_id = d.department_id "
          + " where e.employee_id = ? or lower(first_name) like lower(?)"
		  + " order by first_name ";
PreparedStatement ps = conn.prepareStatement(sql);

int id = 0; //문자와 숫자
try{
	id=Integer.parseInt(findStr);
}catch(Exception ex){}

ps.setInt(1, id);
ps.setString(2, "%" + findStr + "%");
ResultSet rs = ps.executeQuery();
int no = 0;

String pattern = " {'no' : '%s', 'eid'   : '%s', "
			   + "  'fn' : '%s', 'sal'   : '%s', "
			   + " 'did' : '%s', 'dname' : '%s'},";

StringBuilder sd = new StringBuilder();
sd.append("[");
String tempDid="";
while(rs.next()){
	no++;
	
	if(rs.getInt("did")==0){
		tempDid="";
	}else{
		tempDid = rs.getInt("did")+"";
	}
	String str = String.format( pattern, no, rs.getInt("eId"), rs.getString("fn"), 
								rs.getString("sal"), tempDid, rs.getString("dname"));	 
			sd.append(str);
}
			 String data = sd.toString();
			 data = data.replaceAll("\'", "\"");
		if(data.length()>1){
			 data = data.substring(0, data.length()-1);			
		}
			 data +="]";
			 out.print(data);
%>