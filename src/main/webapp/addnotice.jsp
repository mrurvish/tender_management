<%-- 
    Document   : addnotice
    Created on : 16 Sep, 2023, 8:46:13 AM
    Author     : Admin
--%>

<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBUtil"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%
		String user = (String)session.getAttribute("user");
		String uname = (String)session.getAttribute("username");
		String pword = (String)session.getAttribute("password");
		
		if(!user.equalsIgnoreCase("admin") || uname.equals("") || pword.equals("")){
			
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
                        <form action="Addnoticesrv" method="post">
                            <table class="table table-striped table-hover bg-gray">
                                <th colspan="2">Add Notice</th>
                                <tr><td> Notice Title  : </td><td><input type="text" name="title" required="required"></td></tr>
                                <tr><td>Descripton   : </td><td> <textarea rows="4" cols="40" style="font-size:15px" name="info" required="required"></textarea></td></tr>

                                <tr><td colspan="2" align="center" value="Launch"><input type="submit" value="Add Notice to Notice Board" name="user"></td></tr>

                            </table>
                        </form>
                    </div>
                    <div class="col-md-2">
                    <jsp:include page="approvedtender.jsp"></jsp:include><br>
                </div>

            </div>
        </div>
    </body>
</html>
