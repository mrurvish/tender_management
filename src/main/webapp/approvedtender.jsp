<%-- 
    Document   : approvedtender
    Created on : 29 Aug, 2023, 8:17:10 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="marquee"
		style="border: 2px #26b0b0 solid; background-color: white">
		
		<h4
			style="background-color: #26b0b0; margin-top: -1.8px; padding: 5px;">
			<i class="glyphicon glyphicon-volume-up"></i> &nbsp; Recently
			Approved Tenders
		</h4>
		<div class="marquee-content"
			style="padding: 10px; font-weight: bold; font-size: 1.1em">
			<marquee onmouseover="stop()" onmouseout="start()" direction="up"
				scrollamount="6" height="250">
				<!-- Approved Tenders List -->

				
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
