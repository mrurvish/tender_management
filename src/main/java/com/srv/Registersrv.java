/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.srv;

import com.beans.VendorBean;
import com.dao.VendorDao;
import com.dao.VendorDaoImpl;
import com.util.IDUtil;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author urvish
 */
public class Registersrv extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String vname = request.getParameter("vname").trim();
        String vemail = request.getParameter("vemail").trim().toLowerCase();
        String vmob = request.getParameter("vmob").trim();
        //int vmob = Integer.parseInt(mob);
        String vaddr = request.getParameter("vaddr").trim();
        String cname = request.getParameter("cname").trim();
        String vpass = request.getParameter("vpass").trim();
        String vid = IDUtil.generateVendorId();
        VendorBean vendor = new VendorBean(vid,vname, vmob, vemail, vaddr, cname, vpass);

        VendorDao dao = new VendorDaoImpl();

        String status = dao.registerVendor(vendor);

        PrintWriter pw = response.getWriter();

       RequestDispatcher rd = request.getRequestDispatcher("index.jsp");

        rd.include(request, response);

        pw.print("<script>document.getElementById('show').innerHTML = '" + status + "'</script>");
    }

}
