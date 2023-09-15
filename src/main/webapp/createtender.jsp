<%-- 
    Document   : createtender
    Created on : 15 Sept 2023, 21:57:46
    Author     : urvish
--%>

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
        <jsp:include page="adminheader.jsp"></jsp:include>
            <div id="top_section">
                <div class="container-fluid row">

                    <div class="col-md-2">


                    <jsp:include page="notice.jsp"></jsp:include><br>

                        <!-- Next marquee starting-->
                    <%
                        String user = (String) session.getAttribute("user");
                        String uname = (String) session.getAttribute("username");
                        String pword = (String) session.getAttribute("password");

                        if (!user.equalsIgnoreCase("admin") || uname.equals("") || pword.equals("")) {

                            response.sendRedirect("Login.jsp");

                        }

                    %>

                </div>
                <div class="col-md-8">
                    <% Connection con = DBUtil.provideConnection();%>
                    
                        <form action="CreateTendersrv" method="post">
                            <table class="table table-striped table-hover bg-gray">
                                <th colspan="2">Add New Tendors</th>
                                <tr>
                                    <td>	Tender Name  : </td><td><input type="text" name="tname" required="required"></td>
                                </tr>
                                <tr>
                                    <td>    Tender type  : </td><td><select name="ttype" required="required" >
                                            <!-- <option value="none" selected disabled hidden> 
                                            Select an Option 
                                            </option>  -->
                                            <option  value="construction">Construction</option>
                                            <option value="research">Research</option>
                                            <option  value="maintainence">Maintainence</option>
                                            <option value="buisness">Buisness-implementation</option>
                                            <option value="software">Software</option>
                                            <option  value="others">Others</option>

                                        </select></td>
                                </tr>
                                <tr>
                                    <td>	Base Price    :</td><td> <input type="number" name="tprice" required="required"></td>
                                </tr>
                                <tr>
                                    <td> Strict Deadline :</td><td> <input type="date" name="tdeadline" required="required"></td>
                                </tr>
                                <tr>
                                    <td>	Location     : </td><td> <input type="text" name="tloc" required="required"></td>
                                </tr>
                                <tr>
                                    <td>	Descripton   : </td><td> <textarea rows="4" cols="40" style="font-size:15px" name="tdesc" required="required"></textarea></td>
                                </tr>

                                <tr>
                                    <td colspan="2" align="center" value="Launch"><input type="submit" value="Launch This Tender" name="user"></td>
                                </tr>

                        

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
