package bean;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
	public static Connection getConn() {
		return getConn("hr","hr");
	}
	public static Connection getConn(String id, String pwd) {		
		
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String dbUser = id;
		String dbPwd = pwd;
		Connection conn = null;
		try {
			Class.forName(driver).newInstance();
			conn = DriverManager.getConnection(url, dbUser, dbPwd);
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return conn;
	}
	public static void maid(String[] args) {
		DBConn.getConn();
	}
}
