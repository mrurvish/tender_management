/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.beans.TenderBean;
import com.beans.TenderStatusBean;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface TenderDao {
    public List<TenderBean> getTenderDetails(String id);
	
	public List<TenderBean> getAllTenders();
	
	public String createTender(TenderBean tender);
	
	public boolean removeTender(String tid);
	
	public String updateTender(TenderBean tender);
	
	public TenderBean getTenderDataById(String tenderId);
	
	public String getTenderStatus(String tenderId);
	
	public String assignTender(String tenderId,String vendorId,String bidderId);
	
	public List<TenderStatusBean> getAllAssignedTenders();
}
