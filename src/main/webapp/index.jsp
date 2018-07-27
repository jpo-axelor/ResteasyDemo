<%@page import="com.axelor.RestDemo.db.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function validateForm() {
		var x = document.forms["myForm"]["name"].value;
		if (x == "") {
			alert("Name must be filled out");
			return false;

		}
		var y = document.forms["myForm"]["phoneNo"].value;
		var n=y.length;
		if(n!=10){
			alert("Phone number must be of 10 digits !");
			return false;
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<head>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/mystyle.css">

</head>
<body>
	<center>
		<h2>Rest-Easy Demo Project</h2>
		<br>
		<FORM ACTION="<%=request.getContextPath()%>/contact/create" METHOD="POST" name="myForm"
			onsubmit="return validateForm()">
			<fieldset >
				<legend><h4>Insert Contact</h4></legend>
				Name :     <INPUT TYPE="TEXT" NAME="name" size="20"> <br> <br>
				Phone no : <INPUT TYPE="TEXT" NAME="phoneNo" size="20" /> <br>
				<br> <input type="submit" value="Submit">
			</fieldset>

		</form>
		<br>
		<br><br>	
		<FORM ACTION="<%=request.getContextPath()%>/contact/get/name"
			METHOD="GET">
				<b>Search :</b><br>
				Name:<INPUT TYPE="text" NAME="searchText"> 
				<input type="submit" value="Search">

		</form>
		
	</center>
	<br><center>
	<table border="1">
			<tr>
				<th>Contact ID</th>
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
		</table><a href="<%=request.getContextPath()%>/contact/get">List All Contacts</a></center>

</body>
</html>