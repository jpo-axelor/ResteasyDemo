<%@page import="com.axelor.RestDemo.db.Phone"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<center>
		<h3>Edit Form</h3>
		<%
		Phone phone = (Phone) request.getAttribute("phoneObj");
		%>

		<FORM ACTION="<%=request.getContextPath()%>/phone/update"
			METHOD="POST">
			Phone Id :<%out.print(" " + phone.getId());%><br> <br>
			<INPUT TYPE="hidden" NAME="id" VALUE="<%=phone.getId()%>"> 
			
			PhoneType:<INPUT TYPE="TEXT" NAME="phoneType" VALUE="<%=phone.getPhoneType()%>"> <br>
			<br> 
			
			Phone No:<INPUT TYPE="TEXT" NAME="phoneNo" value="<%=phone.getPhoneNo()%>" /> <br> <br> 
			<INPUT
			TYPE="SUBMIT" VALUE="SUBMIT" />


		</FORM>
	</center>

</body>
</html>