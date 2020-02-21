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
		String sql = " select mid, mName, to_char(rDate, 'rrr-mm-dd') rDate, grade "
				   + " from member "
				   + " where mId = ? or mName like ? "
				   + " order by mName ";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			ps.setString(2, "%" + findStr + "%");
			ResultSet rs = ps.executeQuery();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		json = "[mid:hong, mname:박원기, rdate:2020-10-10, geade:1]";
		return json;
	}

}
