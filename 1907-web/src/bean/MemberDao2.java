package bean;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class MemberDao2 {
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Connection conn;
	
	String upload = "C:\\Users\\choi\\git\\1907-web\\1907-web\\WebContent\\upload\\"; // 파일을 저장할 경로
	
	public MemberDao2() {
		conn = DBConn.getConn("hr", "hr");
	}	
	public String insert(MemberVo2 vo) {
		String msg = "회원정보가 정상적으로 저장되었습니다.";
		MemberPhoto p =null;
		
		List<MemberPhoto> list = vo.getPhotos();
		if(list.size()>0) {
			p = list.get(0);
		}		
		
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
				if(p != null) {
					sql = "insert into member_photo(serial, oriFile, sysFile, mid, rDate) "
							+ "	values(seq_member_photo.nextval, ? , ? , ? , ? )";
					
					ps = conn.prepareStatement(sql);
					ps.setString(1, p.getOriFile());
					ps.setString(2, p.getSysFile());
					ps.setString(3, vo.getmId());
					ps.setString(4, vo.getrDate());
					cnt = ps.executeUpdate();
						
					if(cnt>0) {
						conn.commit();
					}else {
						conn.rollback();//입력값이 없을시 롤백
					}//else end						
				}//if p.ori end
			}//if cnt end 
			
		}catch(Exception ex){
			msg = ex.toString();			
			//에러가 발생했을때 파일이 업로드 된 파일삭제.
			File delFile = new File(upload + p.getSysFile());
			if(delFile.exists()) {
				delFile.delete();		
			}			
			conn.rollback();
		}finally {
			try {
				conn.commit();
			}catch(SQLException e) {
				e.printStackTrace();
			}
			return msg;
		}
	}
	public List<MemberVo2> select(Page p) {
		
		List<MemberVo2> list = new ArrayList<MemberVo2>();		
		String sql = null;
		PreparedStatement ps = null;			
		ResultSet rs = null;
		int totList = 0;
		try {
			//전체건수
			sql = "select count(mId) cnt from member "
					+ " where mId like ? or mName like ? ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+p.getFindStr() +"%");
			ps.setString(2, "%"+p.getFindStr() +"%");
			
			rs = ps.executeQuery();
			if(rs.next()) totList = rs.getInt("cnt");
			p.setTotListSize(totList);
			p.pageCompute();
			
			sql = " select * from( "
				+ " 	select rownum rn , A.* from ("
				+ " 		select mId, pwd, mName, to_char(rDate, 'rrrr-MM-dd') rDate, grade "
				+ "			from member "
				+ "			where mId like ? or mName like ? "
				+ "			order by mName)A "
				+ " )where rn between ? and ? ";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + p.getFindStr() + "%");
			ps.setString(2, "%" + p.getFindStr() + "%");
			ps.setInt(3, p.getStartNo());
			ps.setInt(4, p.getEndNo());
			
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberVo2 vo = new MemberVo2();				
				vo.setmId(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setmName(rs.getString("mName"));
				vo.setrDate(rs.getString("rDate"));
				vo.setGrade(rs.getInt("grade"));
				
				list.add(vo);
						
			}
					
			System.out.println(p.getFindStr());
			System.out.println("totSize : " + p.getTotListSize());
			System.out.println("startPage : " + p.getStartPage());
			System.out.println("endPage : " + p.getEndPage());
			System.out.println("startNo : " + p.getStartNo());
			System.out.println("endNo : " + p.getEndNo());
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {						
			return list;
		}
	}
	public void delFile(String fileName) {
		File file = new File(upload + fileName);
		if(file.exists()) file.delete();
	}
	public String deleletP(String s) {
		String sql = null;
		PreparedStatement ps = null;			
		ResultSet rs = null;
		String sysFile = null;
		
		try {
			sql = " select sysfile from member_photo where mId=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, s);
			rs = ps.executeQuery();
			if(rs.next()) {
				sysFile = rs.getString("sysFile");				
			}
			conn.setAutoCommit(false);
			sql = " delete from member_photo where mId=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			int r = ps.executeUpdate();
			if(r>0){
				delFile(sysFile);				
			}
			conn.commit();			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			
		}
		
		
		return s;
	}
	public String modify(MemberVo2 vo) {
		String msg = "데이터가 정상적으로 수정 되었습니다.";
		MemberPhoto mp = null;
		String deleteFile = null; //이미지를 수정한 경우 이전파일 삭제
		int serial =0;
		List<MemberPhoto> list = vo.getPhotos();
		if(list.size()>0) {
			mp = list.get(0);
		}
		String sql = null;
		PreparedStatement ps = null;			
		ResultSet rs = null;		
				
		
		try {			
			conn.setAutoCommit(false);
			//수정전 파일명(삭제될 파일)
			System.out.println("conn : "+ conn);
			if(mp != null) {
				sql = " select serial, sysFile from member_photo "
					+ " where mId=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, vo.getmId());
				rs = ps.executeQuery();
				
				if(rs.next()) {
					deleteFile = rs.getString("sysFile");
					serial = rs.getInt("serial");
				}
			}
			
			//기본정보 수정
			sql = " update member set mName=?, rDate=?, grade=?"
				+ " where mId=?";
			ps = conn.prepareStatement(sql);			
			ps.setString(1, vo.getmName());
			ps.setString(2, vo.getrDate());
			ps.setInt(3, vo.getGrade());
			ps.setString(4, vo.getmId());			
			
			int cnt = ps.executeUpdate();
			if(cnt<1) {
				throw new Exception("기본정보 수정중 오류발생");
				
			}
			//기존 사진 정보에 따른 분기
			if(mp != null) {
				if(deleteFile == null) { //이미지를 등록하지 않고 나중에 등록하는 경우
					sql = " insert into member_photo(serial, mId, rDate, oriFile, sysFile) "
						+ " values(seq_member_photo.nextval, ?, ?, ?, ?) ";
					ps = conn.prepareStatement(sql);
					ps.setString(1, vo.getmId());
					ps.setString(2, vo.getrDate());
					ps.setString(3, mp.getOriFile());
					ps.setString(4, mp.getSysFile());
					
					cnt = ps.executeUpdate();
					if(cnt<1) {
						throw new Exception("첨부파일 추가시 오류 발생");
					}
				}else { // 등록된 이미지를 수정하는 경우
					sql = " update member_photo set rDate=?, oriFile=?, sysFile=? "
						+ " where serial=? ";
					ps = conn.prepareStatement(sql);
					ps.setString(1, vo.getrDate());
					ps.setString(2, mp.getOriFile());
					ps.setString(3, mp.getSysFile());					
					ps.setInt(4, serial);					
					cnt = ps.executeUpdate();
					if(cnt<1) {
						throw new Exception("첨부파일 수정시 오류 발생");
					}
				}				
			}			
			conn.commit();
		}catch(Exception ex) {
			conn.rollback();			
			msg = ex.getMessage();
		}finally {
			if(deleteFile != null) {
				delFile(deleteFile);				
			}
			return msg;
		}
	}

	
	public String delete(String mid, String pwd) {
		MemberVo2 vo = new MemberVo2();
		String msg = "자료가 삭제되었습니다.";
		MemberPhoto mp = null;
		String deleteFile = null; //이미지를 수정한 경우 이전파일 삭제
		int serial =0;
		List<MemberPhoto> list = vo.getPhotos();
		if(list.size()>0) {
			mp = list.get(0);
		}
		String sql = null;
		PreparedStatement ps = null;			
		ResultSet rs = null;
		
		sql = "delete from member where mId=? and pwd = ?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, mid);
			ps.setString(2, pwd);
			
			int cnt = ps.executeUpdate();
			if(cnt<1) {
				msg="아이디 혹은 패스워드가 잘못되었습니다.";		
			}
		}catch(Exception ex) {
			msg = ex.getMessage();
		}finally {
			return msg;
		}
	}

	public MemberVo2 view(String mId) {
		System.out.println("view mId=" +mId);
		MemberVo2 vo = new MemberVo2();
		String sql = null;
		PreparedStatement ps = null;
		ResultSet rs = null;		
		
		try {
			sql = " select mid, mName, to_char(rDate, 'rrrr-MM-dd') rDate, grade  "
				+ " from member"
				+ " where mId=?";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);			
			rs = ps.executeQuery();
			
			System.out.println("view rs" + rs);
			if(rs.next()) {				
				System.out.println("view if" + rs.getString("mId"));
				vo.setmId(rs.getString("mId"));
				vo.setmName(rs.getString("mName"));
				vo.setrDate(rs.getString("rDate"));
				vo.setGrade(rs.getInt("grade"));				
			}
			sql = " select serial, sysFile, oriFile"
				+ " from member_photo"
				+ " where mId=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			rs = ps.executeQuery();
			List<MemberPhoto> list = new ArrayList<MemberPhoto>();
			
			if(rs.next()) {
				MemberPhoto mp = new MemberPhoto();
				mp.setSerial(rs.getInt("serial"));
				mp.setOriFile(rs.getString("oriFile"));
				mp.setSysFile(rs.getString("sysFile"));
				list.add(mp);
				
			}			
			vo.setPhotos(list);
			
		}catch(Exception ex) {
			ex.printStackTrace();
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