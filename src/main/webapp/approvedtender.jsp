<%-- 
    Document   : approvedtender
    Created on : 29 Aug, 2023, 8:17:10 AM
    Author     : Admin
--%>

<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Insert title here</title>
    </head>
    <body>
        <div class="marquee" style="border: 2px #26b0b0 solid; background-color: white">

            <h4 style="background-color: black; margin-top: -1.8px; padding: 5px; opacity: 0.7;color: white">
                <i class="glyphicon glyphicon-volume-up"></i> &nbsp; Recently
                Approved Tenders
            </h4>
            <div class="marquee-content"
                 style="padding: 10px; font-weight: bold; font-size: 1.1em">
                <marquee onmouseover="stop()" onmouseout="start()" direction="up"
                         scrollamount="6" height="250">
                    <!-- Approved Tenders List -->
<%
		Connection con = DBUtil.provideConnection();
		%>
				<%
				try {
					PreparedStatement ps = con.prepareStatement("select * from tenderstatus order by sysdate() asc limit 6");
					ResultSet rs = ps.executeQuery();

					while (rs.next()) {
						String bid = rs.getString("bid");
						String tid = rs.getString("tid");
				%>
				<hr>
				<p style="color: red;">
					Application
					Id:&nbsp;
					<%=bid%></p>
				<p style="color: black">
					Assigned To: &nbsp;&nbsp;<%=tid%></p>

				<%
				}
				} catch (SQLException e) {
				e.printStackTrace();
				}
				%>

                    <hr>
                    <p style="color: red;">
                        Application
                        Id:&nbsp;
                    </p>
                    <p style="color: black">
                        Assigned To: &nbsp;&nbsp;</p>



                </marquee>
                <!--End of marquee-->
            </div>
            <!--End of marquee content-->
        </div>
        <!--End of marquee class-->
    </body>
</html>
