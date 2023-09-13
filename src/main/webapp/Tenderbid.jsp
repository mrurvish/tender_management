<%-- 
    Document   : Tenderbid
    Created on : 31 Aug, 2023, 8:07:58 AM
    Author     : Admin
--%>

<%@page import="com.dao.BidderDaoImpl"%>
<%@page import="com.dao.TenderDaoImpl"%>
<%@page import="com.beans.VendorBean"%>
<%@page import="java.util.List"%>
<%@page import="com.beans.TenderBean"%>
<%@page import="com.dao.BidderDao"%>
<%@page import="com.dao.TenderDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div id="top_section">
                <div class="container-fluid">
                   
                    
                
                    <table class="table table-striped table-hover bg-gray">
                        <tr style="color: white; font-size: 16px; font-weight: bold; background-color:black;opacity: 0.7">
                            <td>Tender Id</td>
				<td>Tender Name</td>
				<td>Type</td>
				<td>Budget</td>
				<td>Location</td>
				<td>Deadline</td>
				<td>Description</td>
				<td>Status</td>
				<td>Action</td>
                        </tr>
                        
                        
                        <%
                        TenderDao tdao = new TenderDaoImpl();
                        BidderDao bdao = new BidderDaoImpl();
                        List<TenderBean> tenderList = tdao.getAllTenders();
                        VendorBean vendor = (VendorBean) session.getAttribute("vendordata");
                        String vid = vendor.getId();
                        for (TenderBean tender : tenderList) {
                            String tid = tender.getId();
                            String tname = tender.getName();
                            String ttype = tender.getType();
                            int tprice = tender.getPrice();
                            String tloc = tender.getLocation();
                            java.util.Date udeadline = tender.getDeadline();
                            java.sql.Date tdeadline = new java.sql.Date(udeadline.getTime());
                            String tdesc = tender.getDesc();

                            String assignStatus = tdao.getTenderStatus(tid);
                            boolean isAssigned = false;
                            if (assignStatus.equalsIgnoreCase("assigned")) {
                                isAssigned = true;
                            }
                            //TODO next
%>


                    <tr>
                        <td><%=tid%></td>
                        <td><%=tname%></td>
                        <td><%=ttype%></td>
                        <td><%=tprice%></td>
                        <td><%=tloc%></td>
                        <td><%=tdeadline%></td>
                        <td><textarea readonly cols="35" rows="2"><%=tdesc%></textarea></td>
                        <td style="font-weight:bold;"><%=assignStatus%></td>
                        <%
                            if (!isAssigned) {
                        %>
                        <td><a href="TenderBidForm.jsp?tid=<%=tid%>&&vid=<%=vid%>"><button class="btn btn-success">BID
                                    NOW</button></a></td>
                                    <%
                                    } else {
                                    %>

                        <td><button class="btn btn-danger" disabled>Expired</button></td>

                        <%
                                }
                            }
                        %>
                    </tr>

                    </table>
                
               

            </div>
        </div>
    </body>
</html>

