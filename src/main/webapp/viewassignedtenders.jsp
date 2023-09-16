<%-- 
    Document   : viewassignedtenders
    Created on : 16 Sep, 2023, 8:33:52 AM
    Author     : Admin
--%>

<%@page import="com.dao.TenderDaoImpl"%>
<%@page import="com.dao.TenderDao"%>
<%@page import="java.util.List"%>
<%@page import="com.beans.TenderStatusBean"%>
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

            if (user == null || !user.equalsIgnoreCase("admin") || uname.equals("") || pword.equals("")) {

                response.sendRedirect("loginFailed.jsp");

            }

        %>
        <% Connection con = DBUtil.provideConnection(); %>
        <jsp:include page="adminheader.jsp"></jsp:include>
            <div id="top_section">
                <div class="container-fluid row">

                    <div class="col-md-2">


                    <jsp:include page="notice.jsp"></jsp:include><br>

                        <!-- Next marquee starting-->


                    </div>



                    <div class="col-md-8">
                        <table class="table table-striped table-hover bg-gray">
                            <h1>Assigned Tenders</h1>
                            <tr> <td>Tender Id</td> <td>Vendor Id </td> 
                                <td> Application Id </td> <td>Status</td> </tr>
                            <%
                                TenderDao dao = new TenderDaoImpl();
                                List<TenderStatusBean> statusList = dao.getAllAssignedTenders();

                                for (TenderStatusBean status : statusList) {

                            %>


                        <tr> <td><a href="viewTenderBidsForm.jsp?tid=<%=status.getTendorId()%>"><%=status.getTendorId()%></a></td> 
                            <td><a href="adminViewVendorDetail.jsp?vid=<%= status.getVendorId()%>"><%=status.getVendorId()%></a></td> <td><%=status.getBidderId()%></td> 
                            <td><%=status.getStatus()%></td> </tr>



                        <% }%>
                    </table>
                </div>
                <div class="col-md-2">
                    <jsp:include page="approvedtender.jsp"></jsp:include><br>
                </div>

            </div>
        </div>
    </body>
</html>
