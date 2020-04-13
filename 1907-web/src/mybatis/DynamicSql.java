package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class DynamicSql {
	SqlSession session ;
	
	public DynamicSql() {
		
	}

	public void ifTest() {
		session = BoardFactory.getFactory().openSession();
		String findStr="h";
		List<BoardVo> list = session.selectList("dynamic.if_test", findStr);
		
		System.out.println("-----------------------");
		for(BoardVo v :  list) {
			System.out.println(v.getSerial() + " - " + v.getSubject());
		}
		System.out.println("-----------------------");
		
		findStr = null;
		list = session.selectList("dynamic.if_test", findStr);
		for(BoardVo v :  list) {
			System.out.println(v.getSerial() + " - " + v.getSubject());
		}
		
		session.close();
	}
	
	public void chooseTest() {
		session = BoardFactory.getFactory().openSession();
		String findStr = "s";
		
		int cnt = session.selectOne("dynamic.choose_test", findStr);		
		System.out.println("findStr = 's' : " + cnt);		
		
		findStr = "c";
		cnt = session.selectOne("dynamic.choose_test", findStr);		
		System.out.println("findStr = 'c' : " + cnt);		
		
		findStr = "";
		cnt = session.selectOne("dynamic.choose_test", findStr);
		System.out.println("findStr = '' : " + cnt);		
		
		session.close();
	}
	public void whereTest() {
		/*
		 * <where>...</where>
		 * 만약에 만족하는 데이터가 없다면 불필요한 where절을 생략해줌..
		 * 만약에 <where/>안에 시작이 and 나 or일 때 불필요한 and, or 인 경우 생략 
		 */
		session = BoardFactory.getFactory().openSession();
		int cnt = 0;
		
		BoardVo vo = new BoardVo();		
		cnt = session.selectOne("dynamic.where_test", vo);
		System.out.println("cnt 1 = " + cnt);
		
		vo.setSerial(212);
		vo.setId(null);
		cnt = session.selectOne("dynamic.where_test", vo);
		System.out.println("cnt 2 = " + cnt);
		
		
		vo.setSerial(0);
		vo.setId("kim");
		cnt = session.selectOne("dynamic.where_test", vo);
		System.out.println("cnt 3 = " + cnt);
		
		
		vo.setSerial(212);
		vo.setId("hong");
		cnt = session.selectOne("dynamic.where_test", vo);
		System.out.println("cnt 4 = " + cnt);
		
		session.close();
	}
	public void setTest() {
		/*
		 * <set> ... </set>
		 *  - update절의 set절을 동적으로 생성
		 *  - 불필요한 콤마(,) 등을 제거하는 기능
		 */
		session = BoardFactory.getFactory().openSession();
		int cnt = 0;
		BoardVo vo = new BoardVo();
		/*
		vo.setSubject("동적 sql로 바꾼 제목...");
		vo.setContent(null);
		vo.setSerial(214);
		cnt = session.update("dynamic.set_test", vo);
		System.out.println("cnt 1= " + cnt);
		*/
		
		vo.setSubject("동적 sql로 바꾼 내용...2");
		vo.setContent("동적 sql로 바꾼 내용...2");
		vo.setSerial(214);
		cnt = session.update("dynamic.set_test", vo);
		System.out.println("cnt 2 = " + cnt);		
		
		session.commit();		
		session.close();
	}
	public void trimTest() {
		/*
		 * <where/>, <set/>의 요소보다 보다 다양한 특정 요소들을 추가하거나 제거할 수 있다.
		 * <trim prefix="앞에 붙일 단어" 
		 * 		 suffix="뒤에 붙일 단어"
		 * 		 prefixOverrides='제거할 단어1 | 제거할 단어2 ...'
		 *   	 suffixOverrides='뒤에서 제거할 단어1 | 뒤에서 제거할 단어2, ...'
		 * >
		 * 
		 * </trim> 
		 */
		
		session = BoardFactory.getFactory().openSession();
		BoardVo vo = new BoardVo();
		vo.setSubject("h");
		int cnt = session.selectOne("dynamic.trim_test", vo);
		System.out.println("trim cnt = " + cnt);
		session.close();
	}
	public void foreachTest() {
		/*
		 * <foreach collection='collection' item='변수' index='key' 
		 * open='반복하기 전에 붙일 문자'
		 * close='반복 후 붙일 문자'
		 * separator='item 사이에 키울 구분자 기호'
		 * >
		 * 
		 * <foreach>
		 * -- index : collection의 종류가 Map이면 key, collection의 종류가 List이면 index
		 * -- item : collection의 종류가 Map이면 value, collection의 종류가 List 이면 value
		 */
		
	}
	
	public static void main(String[] args) {
		DynamicSql d = new DynamicSql();
		//d.ifTest();
		//d.chooseTest();
		//d.whereTest();
		//d.setTest();
		d.trimTest();

	}

}
