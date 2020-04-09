package bean;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.BoardFactory;
import mybatis.BoardVo;

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
}
