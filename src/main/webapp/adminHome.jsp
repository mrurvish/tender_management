<%-- 
    Document   : adminHome
    Created on : 15 Sep, 2023, 9:12:09 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
	String uname = (String) session.getAttribute("username");
	String pword = (String) session.getAttribute("password");

	if ( uname==null || pword==null) {

        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
            }
	
	%>
       
        <jsp:include page="adminheader.jsp"></jsp:include>
      <div id="top_section" class=" banner_main">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div id="myCarousel" class="carousel slide" data-ride="carousel">
        <h1>Hello World!</h1>
                  <%out.println(session.getAttribute("username"));%>
                  </div>
               </div>
            </div>
         </div>
      </div>
      
    </body>
</html>
