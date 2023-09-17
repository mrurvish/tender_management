<%-- 
    Document   : viewnotice
    Created on : 16 Sep, 2023, 9:11:09 AM
    Author     : Admin
--%>

<%@page import="com.util.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.beans.NoticeBean"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.NoticeDaoImpl"%>
<%@page import="com.dao.NoticeDao"%>
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
		String user = (String)session.getAttribute("user");
		String uname = (String)session.getAttribute("username");
		String pword = (String)session.getAttribute("password");
		
		if(!user.equalsIgnoreCase("admin") || uname.equals("") || pword.equals("")){
			
			response.sendRedirect("loginFailed.jsp");
			
		}
	
	%>
        <% Connection con = DBUtil.provideConnection(); %>
                        <table class="table table-striped table-hover bg-gray">
                          <tr>
     		 <td>Notice Id</td> <td>Title </td> <td> Description</td> </tr>
     		<%
     			NoticeDao dao = new NoticeDaoImpl();
     			List<NoticeBean> noticeList = dao.viewAllNotice();
     			
     			for(NoticeBean notice : noticeList){
     				
     				int noticeId = notice.getNoticeId();
     				
     				String noticeTitle = notice.getNoticeTitle();
     				
     				String noticeDesc = notice.getNoticeInfo();
     				
     				%>
     				
     
     		<tr> <td><%=noticeId %></td> <td><%=noticeTitle %></td> <td cols="70"><%=noticeDesc %></td></tr>
     		
     		
     
 <% } %>
                    </table>
                </div>
                <div class="col-md-2">
                    <jsp:include page="approvedtender.jsp"></jsp:include><br>
                </div>

            </div>
        </div>
    </body>
</html>

