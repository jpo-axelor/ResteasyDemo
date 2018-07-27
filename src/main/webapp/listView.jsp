<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/mystyle.css">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ALL Contacts</title>
</head>
<body>
	<center>
		<FORM ACTION="<%=request.getContextPath()%>/contact/get/name"
			METHOD="GET">
			<fieldset>
				<b>Search :</b><br>
				Name:<INPUT TYPE="text" NAME="searchText"> <br> <br>
				<input type="submit" value="Submit">
			</fieldset>

		</form>
		<br> <br>
		<table border="1">
			<tr>
				<th>ContactID</th>
				<th>Contact Name</th>
				<th>Contact Number</th>
				<th>Action Edit</th>
				<th>Action Delete</th>
			</tr>
			<c:forEach items="${contactList}" var="contact">
				<tr>
					<td>${contact.id}</td>
					<td>${contact.name}</td>
					<td>${contact.phoneNo}</td>
					<td><a
						href="<%=request.getContextPath()%>/contact/get/${contact.id}">Edit</a></td>
					<td><a
						href="<%=request.getContextPath()%>/contact/delete/${contact.id}"
						onclick="return window.confirm('Are you sure ?')">Delete</a></td>

				</tr>
			</c:forEach>
		</table>
	</center>
	<center>
		<a href="<%=request.getContextPath()%>/index.jsp">Insert Contact</a>
		<a href="<%=request.getContextPath()%>/contact/get">List All Contacts</a>
	</center>
</body>
</html>