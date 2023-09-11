/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Admin
 */

    public class IDUtil {
	public static String generateTenderId(){
		String tid = null;
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");
		tid=sdf.format(new Date());
		tid = "T"+tid;
		
		return tid;
	}
	
	
	public static String generateVendorId(){
		String vid = null;
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");
		vid=sdf.format(new Date());
		vid = "V"+vid;
		
		return vid;
	}
	
	public static String generateApplicationId(){
		return generateBidderId();
	}
	
	public static String generateBidderId(){
		String bidderId = null;
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddhhmmss");
		bidderId =sdf.format(new Date());
		bidderId = "B"+bidderId;
		
		return bidderId;
	}
}


