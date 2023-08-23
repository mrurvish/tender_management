/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.dao;

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
        Connection conn = DBUtil.provideConnection();
        PreparedStatement ps = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        try {
            pst = conn.prepareStatement("select * from vendor where name=? and password=?");
            pst.setString(1, uname);
            pst.setString(2, pword);
            rs = pst.executeQuery();
            if (rs.next()) {

                
                
                RequestDispatcher rd = request.getRequestDispatcher("header.jsp");

                rd.forward(request, response);
                

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
