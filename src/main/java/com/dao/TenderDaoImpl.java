/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.beans.TenderBean;
import com.util.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class TenderDaoImpl implements TenderDao {
    @Override
	public List<TenderBean> getAllTenders() {
		List<TenderBean> tenderList  = new ArrayList<TenderBean>();
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps = con.prepareStatement("select * from tender");
			
			rs=ps.executeQuery();
			while(rs.next())
			{
				TenderBean tender=new TenderBean();
				
				tender.setId(rs.getString("tid"));
				tender.setName(rs.getString("tname"));
				tender.setType(rs.getString("ttype"));
				tender.setPrice(rs.getInt("tprice"));
				tender.setDesc(rs.getString("tdesc"));
				java.util.Date udate = new java.util.Date(rs.getDate(6).getTime());
				tender.setDeadline(udate);
				tender.setLocation(rs.getString("tloc"));
				tenderList.add(tender);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		finally{
			
			DBUtil.closeConnection(ps);
			
			DBUtil.closeConnection(rs);
			
			DBUtil.closeConnection(con);
			
		}
		
		
		return tenderList;
	}

    @Override
    public List<TenderBean> getTenderDetails(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String createTender(TenderBean tender) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean removeTender(String tid) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String updateTender(TenderBean tender) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public TenderBean getTenderDataById(String tenderId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getTenderStatus(String tenderId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String assignTender(String tenderId, String vendorId, String bidderId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
