<%-- 
    Document   : viewtenderbidsform
    Created on : 15 Sept 2023, 22:44:05
    Author     : urvish
--%>

<%@page import="com.beans.BidderBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.BidderDaoImpl"%>
<%@page import="com.dao.BidderDao"%>
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


                    </div>
                    <div class="col-md-8">
                    <%
                        Connection con = DBUtil.provideConnection();
                    %>
                    <div class="col-md-2">
                        Tender Bids For TendorId:
                        <%=request.getParameter("tid")%></div>
                    <table class="table table-striped table-hover bg-gray">
                        <tr
                            style="color: white; font-size: 18px; font-weight: bold; background-color: #660033">
                            <td>Bidder Id</td>
                            <td>Vendor Id</td>
                            <td>Bid Amount</td>
                            <td>Deadline</td>
                            <td>Status</td>
                            <td>Accept</td>
                            <td>Reject</td>
                        </tr>
                        <%
                            BidderDao dao = new BidderDaoImpl();

                            List<BidderBean> bidderList = dao.getAllBidsOfaTender(request.getParameter("tid"));
                            boolean isPending = false;
                            for (BidderBean bidder : bidderList) {

                                isPending = false;

                                String status = bidder.getBidStatus();

                                if (status.equalsIgnoreCase("pending"))
                                    isPending = true;
                        %>


                        <tr>
                            <td><%=bidder.getBidId()%></td>
                            <td><a
                                    href="adminViewVendorDetail.jsp?vid=<%=bidder.getVendorId()%>"><%=bidder.getVendorId()%></a></td>
                            <td><%=bidder.getBidAmount()%></td>
                            <td><%=bidder.getBidDeadline()%></td>
                            <td><%=bidder.getBidStatus()%></td>

                            <%
                                if (isPending) {
                            %>

                            <td><a
                                    href="Acceptbidsrv?bid=<%=bidder.getBidId()%>&tid=<%=bidder.getTenderId()%>&vid=<%=bidder.getVendorId()%>"><button
                                        class="btn btn-success">Accept</button></a></td>
                            <td><a
                                    href="Rejectbidsrv?bid=<%=bidder.getBidId()%>&tid=<%=bidder.getTenderId()%>&vid=<%=bidder.getVendorId()%>"><button class="btn btn-danger">Reject</button></a></td>

                            <%
                            } else {
                            %>

                            <td><button class="btn btn-success" disabled><%=status%></button></td>
                            <td><button class="btn btn-danger" disabled><%=status%></button></td>
                            <%
                                }
                            %>
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
