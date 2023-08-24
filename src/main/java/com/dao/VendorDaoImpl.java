/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.beans.VendorBean;
import com.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author urvish
 */
public class VendorDaoImpl implements VendorDao {

    @Override
    public String registerVendor(VendorBean vendor) {
        
        
        
        String status = "Registration Failed!!";
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement pst = null;
		
		PreparedStatement ps = null;
		
		try {
			
			pst = con.prepareStatement("select * from vendor where email=?");
		
			pst.setString(1, vendor.getEmail());
			ResultSet rs = pst.executeQuery();
		
		if(rs.next()){
			
			status = "Registration Declined!<br>Email Id already Registered";
		}
		else{
		
			try {
			
				ps = con.prepareStatement("insert into vendor values(?,?,?,?,?,?,?)");
				
				ps.setString(1, null);
				ps.setString(2, vendor.getPassword());
				ps.setString(3, vendor.getName());
				ps.setString(4, vendor.getMobile());
				ps.setString(5, vendor.getEmail());
				ps.setString(6, vendor.getCompany());
				ps.setString(7, vendor.getAddress());
				
				int k = ps.executeUpdate();
				
				if(k>0) //update successful
					status = "Registration Successful.<br> Your Vendor id: "+vendor.getId()+"<br>Thanks For Registration";
			}
				
			catch(SQLException e){
				e.printStackTrace();
				status = "Error: "+e.getMessage();
			}
			finally{
				
				DBUtil.closeConnection(ps);
				
			}
		}
	}
	catch(SQLException e){
		e.printStackTrace();
		status = "Error: "+ e.getErrorCode()+" : "+e.getMessage();
	}

	finally{
		
		DBUtil.closeConnection(pst);
		
		DBUtil.closeConnection(con);
	}
	return status;
    }
    
}
