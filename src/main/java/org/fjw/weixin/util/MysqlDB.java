//sql_data.java
package org.fjw.weixin.util;
import java.sql.*;


public class MysqlDB {
	
	String sDBDriver = "com.mysql.jdbc.Driver";
	String url ="jdbc:mysql://127.0.0.1:3306/yqcndata?useUnicode=true&characterEncoding=utf-8";
	   
	String user = "root";
	//String password = "huangdir";
	String password = "fandir";
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	PreparedStatement  prepStmt =null;
	
	public MysqlDB() {
		try {
			Class.forName(sDBDriver);
		} catch (ClassNotFoundException e) {
			System.err.println("sql_data(): " + e.getMessage());
		}
	}
	
	public static void main(String[] args) {
		
	try {
		 
		 MysqlDB db=new MysqlDB();
		 
		 ResultSet rs=db.executeQuery("select * from zq_news limit 100");

		while (rs.next()) {
			
			int id=rs.getInt("id");
			
			String title=rs.getString("title");
			
			System.out.println(id+"  "+title);
			
		}
		
		db.closeStmt();
		db.closeConn();
		
	 }catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	 }
	
   }
	
	
   public PreparedStatement getPrepareStatement(String sql){
		
		try {
			
			conn = DriverManager.getConnection(url, user, password);
			prepStmt = conn.prepareStatement(sql);
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		
		return prepStmt;
		
	}
	
	public Statement getStatement(){
		
		try {
			
			conn = DriverManager.getConnection(url,user,password);
			stmt = conn.createStatement();
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		
		return stmt;
		
	}
	
	
	public void executeInsert(String sql) {
		try {

			conn = DriverManager.getConnection(url,user,password);
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
		} catch (SQLException ex) {
			System.err.println("sql_data.executeInsert:" + ex.getMessage());
		}
	}
	public ResultSet executeQuery(String sql) {
		try {
			conn = DriverManager.getConnection(url,user,password);
			stmt =conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException ex) {
			System.err.println("sql_data.executeQuery:" + ex.getMessage());
		}
		return rs;
	}
	public void executeUpdate(String sql) {
		try {
			conn = DriverManager.getConnection(url,user,password);
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
		} catch (SQLException ex) {
			System.err.println("aq.executeQuery: " + ex.getMessage());
		}
	}
	public void executeDelete(String sql) {
		try {
			conn = DriverManager.getConnection(url,user,password);
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
		} catch (SQLException ex) {
			System.err.println("sql_data.executeDelete:" + ex.getMessage());
		}
	}

	
	public void closeStmt() {
		try {
			stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void closeConn() {
		try {
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}