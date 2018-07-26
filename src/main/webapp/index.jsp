<%@page import="com.axelor.RestDemo.db.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/view.css"> --%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
	<center><h3>Home/Index</h3>
	<br>
	<FORM ACTION="contact/create" METHOD="POST">
		<fieldset>
			<legend>Insert Contact</legend>
			Name : <INPUT TYPE="TEXT" NAME="name" size="20"> <br><br>
			Phone no : <INPUT TYPE="TEXT" NAME="phoneNo" size="20"/> <br>
			<br> <input type="submit" value="Submit">
		</fieldset>

	</form></center>
	<br>
<%-- <center> --%>
<!-- 	<table border="1"> -->
<!-- 		<tr> -->
<!-- 			<th>ContactID</th> -->
<!-- 			<th>Contact Name</th> -->
<!-- 			<th>Contact Number</th> -->
<!-- 			<th>Action Edit</th> -->
<!-- 			<th>Action Delete</th> -->
<!-- 		</tr> -->
<%-- 		<c:forEach items="<%=request.getAttribute("contactList")%>" var="contact"> --%>
<!-- 			<tr> -->
<%-- 				<td>${contact.id}</td> --%>
<%-- 				<td>${contact.name}</td> --%>
<%-- 				<td>${contact.phoneNo}</td> --%>
<!-- 				<td><a -->
<%-- 					href="<%=request.getContextPath()%>/contact/get/${contact.id}">Edit</a></td> --%>
<!-- 				<td><a -->
<%-- 					href="<%=request.getContextPath()%>/contact/delete/${contact.id}" --%>
<!-- 					onclick="return window.confirm('Are you sure ?')">Delete</a></td> -->

<!-- 			</tr> -->
<%-- 		</c:forEach> --%>
<%-- 	</table></center> --%>
</body>
</html>