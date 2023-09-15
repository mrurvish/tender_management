/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.srv;

import com.beans.TenderBean;
import com.dao.TenderDao;
import com.dao.TenderDaoImpl;
import com.util.IDUtil;
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
 * @author urvish
 */
public class CreateTendersrv extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String user = (String) session.getAttribute("user");
        String uname = (String) session.getAttribute("username");
        String pword = (String) session.getAttribute("password");

        if (!user.equalsIgnoreCase("admin") || uname.equals("") || pword.equals("")) {

            response.sendRedirect("Login.jsp");

        }

        String tid = IDUtil.generateTenderId();
        String tname = request.getParameter("tname").trim();
        String ttype = request.getParameter("ttype").trim();
        String stprice = request.getParameter("tprice").trim();
        String tdesc = request.getParameter("tdesc").trim();
        String stdeadline = request.getParameter("tdeadline").trim();
        String tloc = request.getParameter("tloc").trim();
        int tprice = Integer.parseInt(stprice);
        System.out.print(tid + " " + tname + " " + ttype + " " + tprice + " " + tdesc + " " + stdeadline + " " + tloc + " " + "completed ");

        TenderBean tender = new //TenderBean(id, name, type, price, desc, stdeadline, location)
                TenderBean(tid, tname, ttype, tprice, tdesc, stdeadline, tloc);

        TenderDao dao = new TenderDaoImpl();

        String status = dao.createTender(tender);

        PrintWriter pw = response.getWriter();
        RequestDispatcher rd = request.getRequestDispatcher("createtender.jsp");

        rd.include(request, response);

        pw.print("<script>document.getElementById('show').innerHTML = '" + status + "'</script>");

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
