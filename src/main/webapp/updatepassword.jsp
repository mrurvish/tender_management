<%-- 
    Document   : updatepassword
    Created on : 15 Sep, 2023, 8:41:55 AM
    Author     : Admin
--%>

<%@page import="com.util.DBUtil"%>
<%@page import="com.beans.VendorBean"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String user = (String) session.getAttribute("user");
            String uname = (String) session.getAttribute("username");
            String pword = (String) session.getAttribute("password");

            if (!user.equalsIgnoreCase("user") || uname.equals("") || pword.equals("")) {

                response.sendRedirect("loginFailed.jsp");

            }

        %>
        <jsp:include page="header.jsp"></jsp:include>
            <div id="top_section">
                <div class="container-fluid">
                    <div class="col-5" align="center">
                    <% Connection con = DBUtil.provideConnection();%>
                    <form action="Changepasssrv" method="post">
                        <table class="table table-striped table-hover bg-gray">
                            <%

                                VendorBean vendor = (VendorBean) session.getAttribute("vendordata");

                            %>
                            <th colspan="2">Change Password<input type="hidden" name="vid" value="<%=vendor.getId()%>"></th>
                            <tr><td>	Enter Old Password: </td><td> <input type="password" name="oldpassword" required="required"></td></tr>					

                            <tr><td>	Enter New Password: </td><td> <input type="password" name="newpassword" required="required"></td></tr>					

                            <tr><td>	Re-Enter New Password: </td><td> <input type="password" name="verifynewpassword" required="required"></td></tr>					
                            <tr><td colspan="2" align="center"><input type="submit" value="Change Password"></td></tr>

                        </table>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
