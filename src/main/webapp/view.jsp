<%@page import="com.axelor.RestDemo.db.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/mystyle.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View JSP</title>
</head>
<body>
	<center>
		<h3>Edit Form</h3>
		<%
		  Contact c = (Contact) request.getAttribute("ContactObj");
		%>

		<FORM ACTION="<%=request.getContextPath()%>/contact/update"
			METHOD="POST" >
			Contact Id :<%out.print(" "+ c.getId());%><br><br>
			<!-- 			Contact ID  -->
			<INPUT TYPE="hidden" NAME="id" VALUE="<%=c.getId()%>"> Name:<INPUT
				TYPE="TEXT" NAME="name" VALUE="<%=c.getName()%>"> <br>
			<br> Phone No:<INPUT TYPE="TEXT" NAME="phoneNo"
				value="<%=c.getPhoneNo()%>" /> <br> <br> <INPUT
				TYPE="SUBMIT" VALUE="SUBMIT" />


		</FORM>
	</center>

</body>
</html>