<%-- 
    Document   : viewprofile
    Created on : 15 Sep, 2023, 8:03:02 AM
    Author     : Admin
--%>


<%@page import="com.beans.VendorBean"%>
<%@page import="com.util.DBUtil"%>
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

                <table class="table table-striped table-hover bg-gray">
                    <%
	
		VendorBean vendor = (VendorBean)session.getAttribute("vendordata");
	
	%>
                    <th colspan="2">User Profile</th>
                    <tr>
                        <td>	Vendor Id  : </td><td><%= vendor.getId()%></td>
                    </tr>
                    <tr>
                        <td>    Vendor Name: </td><td><%= vendor.getName()%></td>
                    
                    </tr>
                    <tr>
                        <td>	Mobile No.    :</td><td> <%= vendor.getMobile()%></td>
                    </tr>
                    <tr>
                        <td> Email Id :</td><td> <%= vendor.getEmail()%></td>
                    </tr>
                    <tr>
                        <td>	Address  : </td>
                        <td><textarea rows="2" cols="40" style="font-size:15px" name="vaddr" readonly><%=vendor.getAddress()%> </textarea></td></tr>
                    <tr><td>	Company Name : </td><td> <%= vendor.getCompany()%></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" value="Launch"><a href="updateprofile.jsp" style="color:green">Click Here To Update Profile</a></td>
                    </tr>

                </table>
                    </div>
                </div>
            </div>
                </body>
                </html>
