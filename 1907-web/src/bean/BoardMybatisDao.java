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
	
	//insert, modify에서 sql 오류가 발생할때, 삭제의 공통 사용
	public void delFile(List<AttVo> delList) {
		for(AttVo attVo : delList) {
			File f = new File(FileUpload.upload + attVo.getSysFile());
			if(f.exists())f.delete();
			
		}
	}
}
