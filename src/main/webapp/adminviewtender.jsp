<%-- 
    Document   : adminviewtender
    Created on : 15 Sept 2023, 22:08:14
    Author     : urvish
--%>

<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.beans.TenderBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.TenderDaoImpl"%>
<%@page import="com.dao.TenderDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <jsp:include page="adminheader.jsp"></jsp:include>
            <div id="top_section">
                <div class="container-fluid row">

                    <div class="col-md-2">

                    <%
                        Connection con = DBUtil.provideConnection();
                    %>
                    
                    
                    <%
	String user = (String) session.getAttribute("user");
	String uname = (String) session.getAttribute("username");
	String pword = (String) session.getAttribute("password");

	if (!user.equalsIgnoreCase("admin") || uname.equals("") || pword.equals("")) {

		response.sendRedirect("loginFailed.jsp");

	}
	%>
                    <jsp:include page="notice.jsp"></jsp:include><br>

                        <!-- Next marquee starting-->


                    </div>
                    <div class="col-md-8">
                        <table class="table table-striped table-hover bg-gray">
                            <tr style="color: white; font-size: 14px; font-weight: bold; background-color:black;opacity: 0.7">
                                <td>Tender Name</td>
                                <td>Type</td>
                                <td>Budget</td>
                                <td>Location</td>
                                <td>Deadline</td>
                                <td>Description</td>
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
                            <td><%=tname%></td>
                            <td><%=ttype%></td>
                            <td>&#8377; <%=tprice%></td>
                            <td><%=tloc%></td>
                            <td><%=tdeadline%></td>
                            <td><textarea rows="3" cols="45" disabled><%=tdesc%></textarea></td>
                        </tr>



                        <%
                            }
                        %>

                    </table>
                </div>
                <div class="col-md-2">
                    <jsp:include page="approvedtender.jsp"></jsp:include><br>
                </div>

            </div>
        </div>
    </body>
</html>
