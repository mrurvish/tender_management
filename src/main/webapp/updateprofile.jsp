<%-- 
    Document   : updateprofile
    Created on : 15 Sep, 2023, 8:13:22 AM
    Author     : Admin
--%>

<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.beans.VendorBean"%>
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
<form action="Updateprofilesrv" method="post">
                    <table class="table table-striped table-hover bg-gray">
                        <%

                            VendorBean vendor = (VendorBean) session.getAttribute("vendordata");

                        %>
                        <th colspan="2">Update Profile</th>
                        <tr>
                            <td style="color:red">	Vendor Id  : </td><td><input type="hidden" name="vid" value="<%= vendor.getId()%>"><%= vendor.getId()%></td>
                        </tr>
                        <tr>
                            <td style="color:red">    Vendor Name: </td><td><input type="text" name="vname" required="required" value="<%= vendor.getName()%>"></td>
                        </tr>
                        <tr>
                            <td style="color:red">	Mobile No.    :</td><td> <input type="number" name="vmob" required="required" value="<%= vendor.getMobile()%>"></td>
                        </tr>
                        <tr>
                            <td style="color:red"> Email Id :</td><td> <input type="email" name="vemail" required="required" value="<%= vendor.getEmail()%>"></td>
                        </tr>
                        <tr>
                            <td style="color:red">	Address  : </td><td><textarea rows="2" cols="40" style="font-size:15px" name="vaddr" required="required"><%=vendor.getAddress()%> </textarea></td>
                        </tr>
                        <tr>
                            <td style="color:red">	Company Name : </td><td> <input type="text" name="vcompany" required="required" value="<%= vendor.getCompany()%>"></td>
                        </tr>
                        <tr>
                            <td style="color:red">	Verify Password: </td><td> <input type="password" name="vpass" required="required"></td>
                        </tr>					
                        <tr>
                            <td colspan="2" align="center" value="Launch"><input type="submit" value="Update Profile" name="user"></td>
                        </tr>



                    </table>
</form>
                </div>
            </div>
        </div>
    </body>
</html>

