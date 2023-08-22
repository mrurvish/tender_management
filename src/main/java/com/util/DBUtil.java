/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import java.sql.*;
import java.util.ResourceBundle;

/**
 *
 * @author Admin
 */

public class DBUtil {

    private static Connection conn = null;
	
	
	public static Connection provideConnection(){
		
		ResourceBundle rb = ResourceBundle.getBundle("dbdetails");
		
		String cs = rb.getString("connectionString");
		String username = rb.getString("username");
		String password = rb.getString("password");
		String dbDriver = rb.getString("driverName");
		try {
			if(conn == null || conn.isClosed()){
				
				
				try {
					Class.forName(dbDriver);
					
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				conn = DriverManager.getConnection(cs,username,password);
				
			}
		}
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		return conn;
	}
	
	public static void closeConnection(PreparedStatement ps){
		
		try {
			if(ps != null)
				ps.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
	}
	
	public static void closeConnection(ResultSet rs){
		
		try {
			if(rs != null)
				rs.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
	}
	
	public static void closeConnection(Connection con){
		
		try {
			if(con != null)
				con.close();
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
	}
}
