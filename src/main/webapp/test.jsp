<%-- 
    Document   : test
    Created on : 12 Sept 2023, 17:51:23
    Author     : urvish
--%>

<%@page import="com.beans.BidderBean"%>
<%@page import="java.util.List"%>
<%@page import="com.beans.VendorBean"%>
<%@page import="com.dao.BidderDaoImpl"%>
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
                            
                    </table>
                </div>
                <div class="col-md-2">
                    <jsp:include page="approvedtender.jsp"></jsp:include><br>
                </div>

            </div>
        </div>
    </body>
</html>