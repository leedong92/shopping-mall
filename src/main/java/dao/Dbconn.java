package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Dbconn {
	public static Connection conn;
	public Dbconn() throws SQLException {
		// TODO Auto-generated method stub
	

		
		String driver = "com.mysql.cj.jdbc.Driver";
		String user = "root";
		String pass = "1111";
		String dbURL = "jdbc:mysql://localhost:3306/shopping?serverTimezone=Asia/Seoul";
		conn = DriverManager.getConnection(dbURL, user, pass);
		
		
		try {
			Class.forName(driver);
			System.out.println("MySQL 드라이버 검색 성공...");
			System.out.println("MySQL 드라이버 검색 성공...");
		} catch (ClassNotFoundException e) {
			System.out.println("MySQL 드라이버 검색 오류");
			e.printStackTrace();
			return;
		}
	}





}
