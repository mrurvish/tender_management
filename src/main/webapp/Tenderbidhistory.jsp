<%-- 
    Document   : Tenderbidhistory
    Created on : 31 Aug, 2023, 8:19:39 AM
    Author     : Admin
--%>

<%@page import="com.beans.BidderBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BidderDaoImpl"%>
<%@page import="com.beans.VendorBean"%>
<%@page import="com.dao.BidderDao"%>
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
                <div class="container-fluid row">

                    <div class="col-md-2">


                    <jsp:include page="notice.jsp"></jsp:include><br>

                        <!-- Next marquee starting-->


                    </div>
                    <div class="col-md-8">
                        <table class="table table-striped table-hover bg-gray">
                            <tr style="color: white; font-size: 16px; font-weight: bold; background-color:black;opacity: 0.7">
                                <td>Application Id</td>
                                <td>Tender Id</td>
                                <td>Bid Amount</td>
                                <td>Deadline</td>
                                <td>Status</td>
                            </tr>
<%
				BidderDao dao = new BidderDaoImpl();
                                
				VendorBean vendor = (VendorBean)session.getAttribute("vendordata");
				List<BidderBean> bidderList = dao.getAllBidsOfaVendor(vendor.getId());

				for (BidderBean bidder : bidderList) {
				%>


				<tr>
					<td><%=bidder.getBidId()%></td>
					<td><%=bidder.getTenderId()%></td>
					<td>&#8377; <%=bidder.getBidAmount()%></td>
					<td><%=bidder.getBidDeadline()%></td>
					<td style="font-weight:bold;"><%=bidder.getBidStatus()%></td>
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

