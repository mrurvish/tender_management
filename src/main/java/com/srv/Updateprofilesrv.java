/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.srv;

import com.beans.VendorBean;
import com.dao.VendorDao;
import com.dao.VendorDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class Updateprofilesrv extends HttpServlet {

   

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       HttpSession session = request.getSession();
		String user = (String)session.getAttribute("user");
		String uname = (String)session.getAttribute("username");
		String pword = (String)session.getAttribute("password");
		
		if(user==null || !user.equalsIgnoreCase("user") || uname.equals("") || pword.equals("")){
			
			response.sendRedirect("loginFailed.jsp");
			
		}
		
		String vid = request.getParameter("vid");
		String vname = request.getParameter("vname");
		String vmob = request.getParameter("vmob");
		String vemail = request.getParameter("vemail");
		String vaddr = request.getParameter("vaddr");
		String vcompany = request.getParameter("vcompany");
		String vpass = request.getParameter("vpass");
		
		VendorBean vendor = new VendorBean(vid, vname, vmob, vemail, vaddr, vcompany, vpass);
		VendorDao dao = new VendorDaoImpl();
		
		String status = dao.updateProfile(vendor);
		
	//	HttpSession session = request.getSession();
		
		if(status.equalsIgnoreCase("Account Updated Successfully!") && (VendorBean)session.getAttribute("vendordata")!=null){
			session.setAttribute("vendordata", vendor);
		}
		
		PrintWriter pw = response.getWriter();
		
		RequestDispatcher rd = request.getRequestDispatcher("updateprofile.jsp");
		
		rd.include(request, response);
		
		pw.print("<script>document.getElementById('show').innerHTML='"+status+"'</script>");
		
		pw.close();
    }
}

   
