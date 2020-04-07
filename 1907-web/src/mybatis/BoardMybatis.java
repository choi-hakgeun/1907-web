package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class BoardMybatis {
	SqlSession sqlSession; //자바의 Connection 역할을 함.
	
	private BoardMybatis() {
		sqlSession = BoardFactory.getFactory().openSession();
	}
	
	public List<BoardVo> select(Page p){
		List<BoardVo> list = null;
		try {			
			list = sqlSession.selectList("board.select", p);
			
			for(BoardVo vo : list) {
				System.out.println(vo.getmId());
				System.out.println(vo.getmName());
				System.out.println(vo.getrDate());
				System.out.println("---------------------");
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			sqlSession.close(); //반드시 클로즈 시켜줘야함.
			return list;
		}
		
	}
	public static void main(String[] args) {
		BoardMybatis bm = new BoardMybatis();
		Page p = new Page();
		p.setFindStr("t3");
		bm.select(p);
	}

}
