<%-- 
    Document   : TenderBidForm
    Created on : 13 Sep, 2023, 8:08:07 AM
    Author     : Admin
--%>

<%@page import="com.dao.VendorDaoImpl"%>
<%@page import="com.dao.TenderDaoImpl"%>
<%@page import="com.dao.TenderDao"%>
<%@page import="com.dao.TenderDao"%>
<%@page import="com.dao.VendorDao"%>
<%@page import="com.beans.TenderBean"%>
<%@page import="com.beans.VendorBean"%>
<%@page import="com.util.DBUtil"%>
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
        <jsp:include page="header.jsp"></jsp:include>
            <div id="top_section">
                <div class="container-fluid row">

                    <div class="col-md-2">

                    <%
                        Connection con = DBUtil.provideConnection();
                    %>
                    <jsp:include page="notice.jsp"></jsp:include><br>

                        <!-- Next marquee starting-->


                    </div>
                    <div class="col-md-8">
                        <h1>Enter Your Bid Amount And Deadline</h1>
                        <%

                    String vendorId = request.getParameter("vid");
                    String tenderId = request.getParameter("tid");

                    TenderDao dao = new TenderDaoImpl();
                    VendorDao daov = new VendorDaoImpl();

                    TenderBean tender = dao.getTenderDataById(tenderId);

                    VendorBean vendor = daov.getVendorDataById(vendorId);

                %>
                      <form action="BidTendersrv" method="post">
                    <table class="table table-striped table-hover bg-gray">
                        <tr>
                        <th colspan="2">Bid For The Tender<input type="hidden" name="vid" value="<%= vendorId%>"></th>
                        </tr>
                        <tr style="color: white; font-size: 16px; font-weight: bold; background-color:black;opacity: 0.7>
                            
                            <td style="color:red">Tender Id : </td><td><input type="hidden" name="tid" value="<%= tender.getId()%>"><%= tender.getId()%></td>
                        </tr>
                        <tr>
                            <td>    Tender Name: </td><td><%= tender.getName()%></td>
                        </tr>
                        <tr>
                            <td> Tender Type:</td><td> <%= tender.getType()%></td>
                        </tr>
                        <tr>
                            <td>	Deadline Reqd:</td><td><%= tender.getDeadline()%></td>
                        </tr>
                        <tr>
                            <td> Base Price :</td><td> <%= tender.getPrice()%></td>
                        </tr>
                        <tr>
                            <td> Location :</td><td> <%= tender.getLocation()%></td>
                        </tr>
                        <tr>
                            <td> Description: </td><td><textarea rows="2" cols="40" readonly><%=tender.getDesc()%> </textarea></td>
                        </tr>
                        <tr>
                            <td>	Bid Amount : </td><td> <input type="number" name="bidamount" required="required" min="<%= tender.getPrice()%>" value="<%=tender.getPrice()%>"></td>
                        </tr>
                        <input type="hidden" name="biddeadline" required="required" value="<%= tender.getDeadline()%>">				
                        <tr>
                            <td colspan="2" align="center" value="Launch"><input type="submit" value="Bid Now" style="background-color:green;color:white;"></td>
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
