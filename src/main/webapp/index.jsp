<%@page import="com.axelor.RestDemo.db.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Home</title>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/mystyle.css">
<script type="text/javascript">
	var count = 1;
	function validateForm() {
		var x = document.forms["myForm"]["name"].value;
		if (x == "") {
			alert("Name must be filled out");
			return false;

		}
		var y = document.forms["myForm"]["phoneNo[0]"].value;
		var n = y.length;
		if (n != 10) {
			alert("Phone number must be of 10 digits !");
			return false;
		}
	}
	function add(divName) {

		var newDiv = document.createElement('div');
		var selectHTML = '<br>Phone no : <INPUT TYPE="TEXT" NAME="phoneNo['+count+']" size="20" />';
		selectHTML += '<SELECT name="phoneType['+count+']"> <OPTION value="Work">Work</OPTION><OPTION value="Home">Home</OPTION> <OPTION value="Others">Others</OPTION></SELECT> ';
		newDiv.innerHTML = selectHTML;
		document.getElementById(divName).appendChild(newDiv);
		count++;
		var setCount = document.getElementById("count");
		setCount.setAttribute("value", count);

	}
</script>
</head>
<body>
	<%-- 	<center> --%>
	<h2>Rest-Easy Demo Project</h2>
	<br>
	<FORM ACTION="<%=request.getContextPath()%>/contact/create"
		METHOD="POST" name="c" onsubmit="return validateForm()">
		<fieldset>
			<legend> Insert Contact </legend>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Name :&nbsp;<INPUT TYPE="TEXT"
				NAME="name" size="20"> <br> <br> Phone no : <INPUT
				TYPE="TEXT" NAME="phoneNo[0]" size="20" /> <SELECT
				name="phoneType[0]">
				<OPTION value="Work">Work</OPTION>
				<OPTION value="Home">Home</OPTION>
				<OPTION value="Others">Others</OPTION>
			</SELECT> <INPUT type="button" value="Add" onclick="add('dynamicInput')" /> <br>

			<div id="dynamicInput"></div>
			<INPUT type="submit" value="submit" /> <br>
		</fieldset>
		<input type="hidden" id="count" name="count" value="1">
	</form>
	<br>
	<br>
	<br>
	

	<%-- 	</center> --%>
	<br>
	<center>
	<FORM ACTION="<%=request.getContextPath()%>/contact/get/name"
		METHOD="GET">
		<b>Search :</b><br> Name:<INPUT TYPE="text" NAME="searchText">
		<input type="submit" value="Search">

	</form>
	<br><br>
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
					<td> <c:forEach items="${contact.phone}" var="Phone"> ${Phone.phoneNo}  ( ${Phone.phoneType} )
					<a href="<%=request.getContextPath()%>/phone/get/${Phone.id}"> &nbsp; Edit </a>
					<a href="<%=request.getContextPath()%>/phone/delete/${Phone.id}"> &nbsp;Delete </a>
					<br>
			</c:forEach>
			</td>

			<td><a
				href="<%=request.getContextPath()%>/contact/get/${contact.id}">Edit</a></td>
			<td><a
				href="<%=request.getContextPath()%>/contact/delete/${contact.id}"
				onclick="return window.confirm('Are you sure ?')">Delete</a></td>

			</tr>
			</c:forEach>
		</table>
		<br>
		<a href="<%=request.getContextPath()%>/contact/get">List All
			Contacts</a>
	</center>

</body>
</html>