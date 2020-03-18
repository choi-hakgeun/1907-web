package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;

public class MemberDao2 {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Connection conn;	
	
	public MemberDao2() {
		conn = DBConn.getConn("hr", "hr");
	}	
	public String insert(MemberVo2 vo) {
		String msg = "회원정보가 정상적으로 저장되었습니다.";
		
		try {
			String sql = "insert into member(mId, pwd, mName, rDate, grade)"
					+ " values(?,?,?,?,?) ";
			
			conn.setAutoCommit(false);			
			PreparedStatement ps = conn.prepareStatement(sql);					
			ps.setString(1,  vo.getmId());
			ps.setString(2,  vo.getPwd());
			ps.setString(3,  vo.getmName());
			ps.setString(4,  vo.getrDate());
			ps.setInt(5,  vo.getGrade());
			
			int cnt = ps.executeUpdate();
			
			if(cnt>0) {
				List<MemberPhoto> list = vo.getPhotos();
				MemberPhoto p = list.get(0);
				if(p.oriFile != null) {
					sql = "insert into member_photo(serial, oriFile, sysFile)"
							+ "	values(seq_member_photo.nextval, ? , ? )";
					ps = conn.prepareStatement(sql);
					ps.setString(1, p.getOriFile());
					ps.setString(2, p.getSysFile());
					cnt = ps.executeUpdate();
					if(cnt>0) {
						conn.commit();
					}else {
						conn.rollback();
					}
				}
			}
			
		}catch(Exception ex){
			conn.rollback();
			msg = ex.toString();
		}finally {
			try {
				conn.commit();
			}catch(SQLException e) {
				e.printStackTrace();
			}
			return msg;
		}
	}
	
	public String modify(MemberVo vo) {
		String msg = "자료가 수정되었습니다.";
		String sql = "update member set mName=?, rDate=?, grade=? where mId=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getmName());
			ps.setString(2, sdf.format(vo.getrDate()));
			ps.setInt(3, vo.getGrade());
			ps.setString(4, vo.getmId());
			
			int r = ps.executeUpdate();
			if(r<1) {
				throw new Exception();
			}
		}catch(Exception e) {
			msg = e.toString();			
		}finally {
			return msg;
		}
	}
	public String delete(String mid) {
		String msg = "자료가 삭제되었습니다.";
		String sql = "delete from member where mId=?";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, mid);
			
			int cnt = ps.executeUpdate();
			if(cnt<1) {
				throw new Exception("자료 삭제중 예외 발생...");				
			}
		}catch(Exception ex) {
			msg = ex.getMessage();
		}finally {
			return msg;
		}
	}
	public List<MemberVo> select(String findStr) {
		MemberVo json = null;
		MemberVo vo = new MemberVo();
		String sql = " select mid, mName, to_char(rDate, 'rrrr-mm-dd') rDate, grade "
				   + " from member "
				   + " where mId = ? or mName like ? "
				   + " order by mName ";
		try {
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, findStr );
			ps.setString(2, "%" + findStr + "%");
			
			StringBuilder sd = new StringBuilder();
			sd.append("[");
			
			ResultSet rs = ps.executeQuery();					
			while(rs.next()) {
				String mId   =  rs.getString("mId")      ;
				String mName =  rs.getString("mName")    ;
				String rDate =  rs.getString("rDate")    ;
				String grade =  rs.getString("grade")+"" ;				
				}		    
			
			rs.close();
			ps.close();
			conn.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {						
			return (List<MemberVo>) json;
		}
	}
	public MemberVo view(String mId) {
		System.out.println("Mid=" +mId);
		MemberVo vo = new MemberVo();
		try {
			String sql = "select * from member where mId=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				vo.setmId(rs.getString("mId"));
				vo.setmName(rs.getString("mName"));
				vo.setrDate(rs.getDate("rDate"));
				vo.setGrade(rs.getInt("grade"));
			}
		}catch(Exception ex) {
			
		}finally {
			return vo;
		}		
	}
	
	
	public String insert2(MemberVo2 vo) {
		String msg = "회원이 등록되었습니다.";
		
		try {
			String sql = "insert into member values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1,  vo.getmId());
			ps.setString(2,  vo.getmName());;
			ps.setString(3,  vo.getrDate());
			ps.setInt(4,  vo.getGrade());
			
			int r = ps.executeUpdate();
			
			if(r<1) {
				throw new Exception();
			}
			
		}catch(Exception ex){
			msg = ex.toString();
		}finally {
			return msg;
		}
	}
		
	public boolean login(MemberVo vo) {
		boolean result = false;
		String id= vo.getmId();
		String pwd = vo.getPwd();
		
		try {
			String sql = "select  mId from member "
					+ " where mId=? and pwd=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pwd);
			
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {			
				result = true;			
			}
		}catch(Exception ex){
			ex.printStackTrace();
		}finally {
			return result;			
		}
	}
}