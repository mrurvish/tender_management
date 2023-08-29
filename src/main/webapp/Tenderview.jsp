<%-- 
    Document   : Tenderview
    Created on : 29 Aug, 2023, 8:13:03 AM
    Author     : Admin
--%>

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
                            <td>Tender Name</td>
                            <td>Type</td>
                            <td>Budget</td>
                            <td>Location</td>
                            <td>Deadline</td>
                            <td>Description</td>
                        </tr>

                    </table>
                </div>
                <div class="col-md-2">
                    <jsp:include page="approvedtender.jsp"></jsp:include><br>
                </div>

            </div>
        </div>
    </body>
</html>
