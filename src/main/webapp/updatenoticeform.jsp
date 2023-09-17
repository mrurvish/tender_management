<%-- 
    Document   : updatenoticeform
    Created on : 16 Sep, 2023, 9:14:46 AM
    Author     : Admin
--%>

<%@page import="com.beans.NoticeBean"%>
<%@page import="com.dao.NoticeDaoImpl"%>
<%@page import="com.dao.NoticeDao"%>
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
        <%
		String user = (String)session.getAttribute("user");
		String uname = (String)session.getAttribute("username");
		String pword = (String)session.getAttribute("password");
		
		if(!user.equalsIgnoreCase("admin") || uname.equals("") || pword.equals("")){
			
			response.sendRedirect("loginFailed.jsp");
			
		}
	
	%>
        <jsp:include page="adminheader.jsp"></jsp:include>
            <div id="top_section">
                <div class="container-fluid row">

                    <div class="col-md-2">


                    <jsp:include page="notice.jsp"></jsp:include><br>

                        <!-- Next marquee starting-->


                    </div>
                    <div class="col-md-8">
                        <% Connection con = DBUtil.provideConnection(); %>
                        
                        <table class="table table-striped table-hover bg-gray">
			<tr >
				<td id="show" style="min-width:632px;min-height:0px;color:blue">Enter Notice Details Below</td>
			</tr>
		</table>
      <%
      	int noticeId = Integer.parseInt(request.getParameter("nid"));
      	NoticeDao dao = new NoticeDaoImpl();
      	NoticeBean notice = dao.getNoticeById(noticeId);
      %>      
      <form action="Updatenoticesrv" method="post">
                        <table class="table table-striped table-hover bg-gray">
                           <th colspan="2">Update Notice No.<%=noticeId %><input type="hidden" name="nid" value="<%= noticeId%>"></th>
			<tr><td> Notice Title  : </td><td><input type="text" name="title" required="required" value="<%= notice.getNoticeTitle()%>"></td></tr>
		   <tr><td>	Descripton   : </td><td> <textarea rows="4" cols="40" style="font-size:15px" name="info" required="required"><%= notice.getNoticeInfo() %></textarea></td></tr>
					
			<tr><td colspan="2" align="center" value="Launch"><input type="submit" value="Update This Notice"></td></tr>
			
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
