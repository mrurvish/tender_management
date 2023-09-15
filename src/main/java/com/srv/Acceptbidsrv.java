/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.srv;

import com.dao.BidderDao;
import com.dao.BidderDaoImpl;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author urvish
 */
@WebServlet(name = "Acceptbidsrv", urlPatterns = {"/Acceptbidsrv"})
public class Acceptbidsrv extends HttpServlet {

    
    

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
		String user = (String)session.getAttribute("user");
		String uname = (String)session.getAttribute("username");
		String pword = (String)session.getAttribute("password");
		
		if(!user.equalsIgnoreCase("admin") || uname.equals("") || pword.equals("")){
			
			response.sendRedirect("loginFailed.jsp");
			
		}
		
		
		
		
		String bidderId = request.getParameter("bid");
		String tenderId = request.getParameter("tid");
		String vendorId = request.getParameter("vid");
		
		BidderDao dao = new BidderDaoImpl();
		
		String status = dao.acceptBid(bidderId, tenderId, vendorId);
		
		PrintWriter pw = response.getWriter();
		
		RequestDispatcher rd = request.getRequestDispatcher("viewtenderbidsform.jsp");
		
		rd.include(request, response);
		
		pw.print("<script>document.getElementById('show').innerHTML='"+status+"'</script>");
		
		pw.close();
       
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
