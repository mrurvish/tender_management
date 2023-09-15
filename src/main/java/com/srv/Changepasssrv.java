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
public class Changepasssrv extends HttpServlet {

    
   

   
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
		
		
		String fvid = request.getParameter("vid");
		String foldPass = request.getParameter("oldpassword");
		String newPass = request.getParameter("newpassword");
		String verifyPass = request.getParameter("verifynewpassword");
		
		PrintWriter pw = response.getWriter();
		
		RequestDispatcher rd = request.getRequestDispatcher("updatepassword.jsp");
		
		//HttpSession session = request.getSession();
		
		VendorBean vendor = (VendorBean)session.getAttribute("vendordata");
		
		String vpass = vendor.getPassword();
		
		if(!newPass.equals(verifyPass) ){
			
			rd.include(request, response);
			
			pw.print("<script>document.getElementById('show').innerHTML='New Password and verify Password does not match!'</script>");
			
		}
		
		else if(!vpass.equals(foldPass)){
			
			rd.include(request, response);
			
			pw.print("<script>document.getElementById('show').innerHTML='Incorrect Old Password!'</script>");
			
			
		}
		else{
			
			VendorDao dao = new VendorDaoImpl();
			
			String status = dao.changePassword(fvid, foldPass, newPass);
			
			if(status.equalsIgnoreCase("Password Updated Successfully!")){
				vendor.setPassword(newPass);
				session.setAttribute("vendordata", vendor);
				
			}
			
			rd.include(request, response);
			
			pw.print("<script>document.getElementById('show').innerHTML='"+status+"'</script>");
		}
		pw.close();
       
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
