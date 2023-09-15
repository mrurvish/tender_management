<%-- 
    Document   : viewtenderbids
    Created on : 15 Sept 2023, 22:40:01
    Author     : urvish
--%>

<%@page import="com.beans.TenderBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.TenderDaoImpl"%>
<%@page import="com.dao.TenderDao"%>
<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
            String user = (String) session.getAttribute("user");
            String uname = (String) session.getAttribute("username");
            String pword = (String) session.getAttribute("password");

            if (!user.equalsIgnoreCase("admin") || uname.equals("") || pword.equals("")) {

                response.sendRedirect("loginFailed.jsp");

            }
        %>

        <jsp:include page="adminheader.jsp"></jsp:include>
            <div id="top_section">
                <div class="container-fluid row">
                <%
                    Connection con = DBUtil.provideConnection();
                %>


                <table class="table table-striped table-hover bg-gray">
                    <tr
                        style="color: white; font-size: 22px; font-weight: bold; background-color: brown">
                        <td>Tender Id</td>
                        <td>Tender Name</td>
                        <td>Tender Type</td>
                        <td>Tender Price</td>
                        <td>Location</td>
                        <td>Deadline</td>
                        <td>Description</td>
                        <td>View Bids</td>
                    </tr>
                    <%
                        TenderDao dao = new TenderDaoImpl();
                        List<TenderBean> tenderList = dao.getAllTenders();
                        for (TenderBean tender : tenderList) {
                            String tid = tender.getId();
                            String tname = tender.getName();
                            String ttype = tender.getType();
                            int tprice = tender.getPrice();
                            String tloc = tender.getLocation();
                            java.util.Date udeadline = tender.getDeadline();
                            java.sql.Date tdeadline = new java.sql.Date(udeadline.getTime());
                            String tdesc = tender.getDesc();
                    %>


                    <tr>
                        <td><a href="viewTenderBidsForm.jsp?tid=<%=tid%>"><%=tid%></a></td>
                        <td><%=tname%></td>
                        <td><%=ttype%></td>
                        <td><%=tprice%></td>
                        <td><%=tloc%></td>
                        <td><%=tdeadline%></td>
                        <td><textarea rows="2" cols="40" readonly><%=tdesc%></textarea></td>
                        <td><a href="viewtenderbidsform.jsp?tid=<%=tid%>"><button
                                    class="btn btn-success">View Bids</button></a></td>
                    </tr>



                    <%
                        }
                    %>
                </table>


            </div>
        </div>
    </body>
</html>
