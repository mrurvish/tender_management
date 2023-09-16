/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.srv;

import com.dao.NoticeDao;
import com.dao.NoticeDaoImpl;
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
 * @author Admin
 */
@WebServlet(name = "Addnoticesrv", urlPatterns = {"/Addnoticesrv"})
public class Addnoticesrv extends HttpServlet {

    
    

   
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
		
		if(!user.equalsIgnoreCase("admin") || uname.equals("") || pword.equals("")){
			
			response.sendRedirect("login.jsp");
			
		}
		
		
		
		String noticeTitle = request.getParameter("title");
		String noticeDesc = request.getParameter("info");
		
		NoticeDao dao = new NoticeDaoImpl();
		
		String status = dao.addNotice(noticeTitle, noticeDesc);
		
		PrintWriter pw = response.getWriter();
		
		
		
		RequestDispatcher rd = request.getRequestDispatcher("addnotice.jsp");
		
		
		
		rd.include(request, response);
		
		pw.print("<script>document.getElementById('show').innerHTML='"+status+"'</script>");
	}

    }

    
   


