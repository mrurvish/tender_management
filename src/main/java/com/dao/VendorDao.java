/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dao;

import com.beans.VendorBean;
import java.util.List;

/**
 *
 * @author urvish
 */
public interface VendorDao {
   public String registerVendor(VendorBean vendor);
	
	public List<VendorBean> getAllVendors();
	
	public boolean validatePassword(String vendorId,String password);
	
	public String updateProfile(VendorBean vendor);
	
	public String changePassword(String vendorId,String oldPassword,String newPassword);
	
	public VendorBean getVendorDataById(String vendorId);
    
}
