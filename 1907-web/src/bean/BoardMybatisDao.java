package bean;

import java.io.File;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.AttVo;
import mybatis.BoardFactory;
import mybatis.BoardVo;
import mybatis.FileUpload;

public class BoardMybatisDao {
	SqlSession sqlSession;
	
	public BoardMybatisDao() {
		sqlSession = BoardFactory.getFactory().openSession();
	}
	
	public List<BoardVo> select(Page p){ //레퍼런스타입, 주소값이 똑같다.
		List<BoardVo> list = null;		
		try {
			
			int totList = sqlSession.selectOne("board.count", p);			
			p.setTotListSize(totList);
			p.pageCompute();
			list = sqlSession.selectList("board.select", p);
			
			System.out.println(totList);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close(); //반드시 닫아줘야함.
			return list;
		}
		
	}
	
	public String insert(BoardVo vo, List<AttVo> attList) {
		String msg = "정상적으로 입력되었습니다.";
		
		try {
			int cnt = sqlSession.insert("board.insert", vo);
			if(cnt<1) {
				throw new Exception("본문저장중 오류 발생");
			}
			for(AttVo attVo : attList) {
				cnt = sqlSession.insert("board.att_insert", attVo);
				if(cnt<1) {
					throw new Exception("첨부 데이터 저장시 오류 발생");
				}
			}		
			sqlSession.commit();
			
		}catch (Exception e) {
			e.printStackTrace(); //테스트후 삭제
			msg = e.getMessage();
			sqlSession.rollback();
			delFile(attList);
		}finally {
			sqlSession.close();
			return msg;
		}
	}
	
	public BoardVo view(int serial, char v) {
		BoardVo vo = null;
		
		try {
			if(v == 'v') { //조회수 증가
				sqlSession.update("board.hit_up", serial);
				sqlSession.commit();
			}
			
			vo = sqlSession.selectOne("board.view", serial);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {			
			return vo;
		}
	}
	public String modify(BoardVo vo, List<AttVo> attList, List<AttVo> delList) {
		String msg = "정상적으로 수정되었습니다.";
		
		try {
			//본문글 수정
			int cnt = sqlSession.update("board.update", vo);
			System.out.println(cnt);
			if(cnt<1) {
				throw new Exception("본문글 수정중 오류 발생");
			}
			
			//boardAtt에 첨부 파일 정보를 추가 -세션이 다르기때문에 보드의 시퀀스값을 가저올 수 없음, 그래서 수정시 vo가 가지고 있는 시퀀스값을 가저와야함.
			for(AttVo attVo : attList) {
				attVo.setSerial(vo.getSerial());
				cnt = sqlSession.insert("board.att_insert2", attVo);
				if(cnt<1) throw new Exception("첨부 데이터 정보 수정중 오류 발생");
			}
			
			//boardAtt에 삭제 파일 정보를 제거
			for(AttVo attVo : delList) {
				cnt = sqlSession.delete("board.att_delete", attVo);
				if(cnt<1) {
					throw new Exception("첨부 데이터 정보 삭제중 오류 발생");
				}
			}
			//파일 삭제
			delFile(delList);
			
			sqlSession.commit();
		} catch (Exception e) {
			
			delFile(attList);
			
			e.printStackTrace();
			msg = e.getMessage();
			sqlSession.rollback();
		}finally {
			sqlSession.close();
			return msg;
		}
		
	}
	
	public String delete(BoardVo vo) {
		String msg = "게시물이 삭제되었습니다.";
		int cnt=  0;
		try {
			//삭제 하기 전 댓글 존재 파악
			cnt = sqlSession.selectOne("board.repl_cnt", vo.getSerial());
			if(cnt>0) throw new Exception("댓글이 있는 자료는 삭제 할 수 없습니다.");
			
			//본문삭제
			cnt = sqlSession.delete("board.delete", vo);
			if(cnt<1) throw new Exception("삭제중 오류 발생");
			
			//첨부된 파일 목록
			List<AttVo> delList = sqlSession.selectList("board.att_list", vo.getSerial());
			
			//첨부 테이블 자료 삭제
			for(AttVo attVo:delList) {
				cnt = sqlSession.delete("board.att_delete", attVo);
				if(cnt<1) throw new Exception("첨부 자료 삭제중 오류 발생");
			}
			//파일삭제
			delFile(delList);
			
			sqlSession.commit();
			
		}catch (Exception e) {
			sqlSession.rollback();
			msg = e.getMessage();
			e.printStackTrace();
		}finally {
			sqlSession.close();
			return msg;
		}
		
	}
	
	public String repl(BoardVo vo, List<AttVo> attList) {
		String msg = "댓글이 저장 되었습니다.";
		int cnt = 0;
		try {
			//댓글 저장
			cnt = sqlSession.insert("board.repl", vo);
			if(cnt<1) throw new Exception("댓글 저장 중 오류 발생");
			
			//첨부 데이터 저장
			for(AttVo attVo : attList) {
				cnt = sqlSession.insert("board.att_insert", attVo);
				if(cnt<1) throw new Exception("첨부데이터 저장중 오류 발생");
			}
			
			sqlSession.commit();
		}catch (Exception e) {
			delFile(attList);
			sqlSession.rollback();
			msg = e.getMessage();
			e.printStackTrace();
		}finally {
			sqlSession.close();
			return msg;
		}
	}
	
	public List<AttVo> getAttList(int pserial){
		List<AttVo> attList = null;
		
		try {
			attList = sqlSession.selectList("board.att_list", pserial);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
			return attList;
		}
	}
	
	
	//insert, modify에서 sql 오류가 발생할때, 삭제의 공통 사용
	public void delFile(List<AttVo> delList) {
		for(AttVo attVo : delList) {
			File f = new File(FileUpload.upload + attVo.getSysFile());
			if(f.exists())f.delete();
			
		}
	}
}
