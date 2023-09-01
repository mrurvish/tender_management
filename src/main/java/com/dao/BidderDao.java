/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.beans.BidderBean;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface BidderDao {
    public String acceptBid(String applicationId,String tenderId,String vendorId);
	
	public String rejectBid(String applicationId);
	
	public String bidTender(String tenderId, String vendorId,String bidAmount,String deadline);
	
	public List<BidderBean> getAllBidsOfaTender(String tenderId);
	
	public List<BidderBean> getAllBidsOfaVendor(String vendorId);
}
