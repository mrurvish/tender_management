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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
         <%
	String uname = (String) session.getAttribute("username");
	String pword = (String) session.getAttribute("password");
String s="";
	if ( uname.equals("") || pword.equals("")) {
                 s ="notstarted" ;
             }
             else
             {
             s="started";
             }

	
	%>
        <%
            BidderDao dao = new BidderDaoImpl();

            VendorBean vendor = (VendorBean) session.getAttribute("vendordata");
            String id = null;
            String test=null;
            
            if (vendor != null) {
                id = "continue";
                test=vendor.getMobile();
            }
            else
            {
            id="nooooo";
            }
        %>
        <h1><%out.println(id+test+"    "+s);%></h1>
    </body>
</html>
