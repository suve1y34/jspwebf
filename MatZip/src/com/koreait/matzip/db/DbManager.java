package com.koreait.matzip.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DbManager {
	public static Connection getCon() throws Exception {
		String url = "jdbc:mysql://localhost:3306/matzip";
		String user = "root";
		String pw = "koreait2020";
		String className = "com.mysql.cj.jdbc.Driver";
		
		Class.forName(className);
		Connection con = DriverManager.getConnection(url, user, pw);
		System.out.println("DB 연결 완료");
		
		return con;
	}
	
	public static void close(Connection con, PreparedStatement ps, ResultSet rs) {
	    if(rs != null) {try {rs.close();} catch (Exception e) {e.printStackTrace();}}
		if(ps != null) {try {ps.close();} catch (Exception e) {e.printStackTrace();}}
		if(con != null) {try {con.close();} catch (Exception e) {e.printStackTrace();}}
	}

	public static void close(Connection c, PreparedStatement p) {
	    	close(c, p, null);
	}
}