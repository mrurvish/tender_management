/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

import com.beans.NoticeBean;
import java.util.List;

/**
 *
 * @author Admin
 */
public interface NoticeDao {
    public String removeNotice(int noticeId);
	
	public String addNotice(String noticeTitle, String noticeDesc );
	
	public List<NoticeBean> viewAllNotice();
	
	public String updateNotice(NoticeBean notice);
	
	public NoticeBean getNoticeById(int noticeId);
    
}
