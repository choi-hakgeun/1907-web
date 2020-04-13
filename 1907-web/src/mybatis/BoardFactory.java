package mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardFactory {
	private static SqlSessionFactory factory; //맨처음실행 초기화- 동시에 다른사람이 사용시 초기화 안됨
	
	static {
		try {
			Reader r = Resources.getResourceAsReader("config.xml");
			System.out.println("factory good.....");
			factory = new SqlSessionFactoryBuilder().build(r);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() {
		return factory;
	}
	
	public static void main(String[] args) {
		BoardFactory.getFactory();
		
	}

}
