/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.srv;

import com.beans.VendorBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.util.DBUtil;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class Loginsrv extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uname = request.getParameter("username").trim();
        String pword = request.getParameter("password").trim();
        if(uname.equals("Admin") && pword.equals("Admin")){
				//login successful
				HttpSession session = request.getSession();
				session.setAttribute("user","admin");
				session.setAttribute("username", uname);
				session.setAttribute("password", pword);
				RequestDispatcher rd = request.getRequestDispatcher("adminHome.jsp");
				rd.forward(request, response);
			}else{
        Connection conn = DBUtil.provideConnection();
        PreparedStatement ps = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        try {
            pst = conn.prepareStatement("select * from vendor where vemail=? and password=?");
            pst.setString(1, uname);
            pst.setString(2, pword);
            rs = pst.executeQuery();
            if (rs.next()) {

                
                HttpSession session = request.getSession();
					session.setAttribute("user","user");
					session.setAttribute("username", uname);
					session.setAttribute("password", pword);
					
					
					
					
					String vid = rs.getString("vid");
					String pass = pword;
					
					String vname = rs.getString("vname");
					String vemail= rs.getString("vemail");
					String vaddr = rs.getString("address");
					String cname = rs.getString("company");
					String mob = rs.getString("vmob");
					VendorBean vendor = new VendorBean(vid,vname,mob,vemail,vaddr,cname,pass);
					
					session.setAttribute("vendordata", vendor);
                RequestDispatcher rd = request.getRequestDispatcher("index.jsp");

                rd.forward(request, response);

            } else {

                PrintWriter pw = response.getWriter();
                RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
                rd.include(request, response);
                pw.print("<script>document.getElementById('show').innerHTML = 'Invalid Username or Password<br>Please Try Again!'</script>");

            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {

            DBUtil.closeConnection(ps);

            DBUtil.closeConnection(pst);

            DBUtil.closeConnection(rs);

            DBUtil.closeConnection(rs1);
        }
        }
    }

}
