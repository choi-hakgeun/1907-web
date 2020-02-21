package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

public class MemberDao {
	Connection conn;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	public MemberDao() {
		conn = DBConn.getConn();
	}
	
	
	public String select(String findStr) {
		String json = null;
		MemberVo vo = new MemberVo();
		String sql = " select mid, mName, to_char(rDate, 'rrrr-mm-dd') rDate, grade "
				   + " from member "
				   + " where mId like ? or mName like ? "
				   + " order by mName ";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			ResultSet rs = ps.executeQuery();					
			String pattern = "{'mId':'%s','mName':'%s',"
						   + "'rDate':'%s','grade':'%s'},";
			
			StringBuilder sd = new StringBuilder();
			sd.append("[");
			while(rs.next()) {
				String str = String.format(
						     pattern, rs.getString("mId"), rs.getString("mName"),
						     rs.getString("rDate"), rs.getString("grade") 
						);
				sd.append(str);
				}
			json = sd.toString();
			json = json.replaceAll("\'","\""); 
			if(json.length()>-1){
			json = json.substring(0, json.length()-1);			
			}
				 json +="]";
				 rs.close();
				 ps.close();
				 conn.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			//json = "[mid:hong, mname:박원기, rdate:2020-10-10, geade:1]";
			System.out.println(json);
			return json;
			
		}
		
	}

}
