package bean;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class Member {	
	Connection conn;
	
	public Member() {
		conn = DBConn.getConn();
	}
	
	public List<MemberPhoto> photos(){
		List<MemberPhoto> photos = new ArrayList<MemberPhoto>();
		String sql = "select * from member_photo "
				+ " where mId like ? "
				+ " order by serial ";
		return photos;
	}
}
