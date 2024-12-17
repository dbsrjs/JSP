package DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, "system", "1234");
			
			System.out.println("DB접속 성공");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
}
