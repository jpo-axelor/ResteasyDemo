<%@page import="com.axelor.RestDemo.db.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
	function SelectElement(selectElementId, valueToSelect)
	{    
	    var element = document.getElementById(selectElementId);
	    element.value = valueToSelect;
	}
	
</script>
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
// 		out.print(c.getPhone().get(0).getPhoneType());
		%>

		<FORM ACTION="<%=request.getContextPath()%>/contact/update"
			METHOD="POST" name="myform">
			Contact Id :<% out.print(" " + c.getId());%><br> <br>
			<!-- Contact ID  -->
			<INPUT TYPE="hidden" NAME="id" VALUE="<%=c.getId()%>"> Name:<INPUT
				TYPE="TEXT" NAME="name" VALUE="<%=c.getName()%>"> <br>
				
			<% for(int i = 0; i <c.getPhone().size(); i++) { %>
		
				<br> 
				
				Phone No:<INPUT TYPE="TEXT" NAME="phoneNo[<%=i%>]"
					value="<%=c.getPhone().get(i).getPhoneNo()%>" />
					<%out.print(c.getPhone().get(i).getPhoneType());%>
				<SELECT name="phoneType[<%=i%>]">
				<OPTION value="Work">Work</OPTION>
				<OPTION value="Home" ${c.getPhone().get(i).getPhoneType() == "Home" ? "selected" : ""}>Home</OPTION>
				<OPTION value="Others" >Others</OPTION>
			</SELECT> 
				
<%-- 				${c.getPhone().get(i).getPhoneType() == Home ? " selected" : ""} --%>
<%-- 				Type:<INPUT TYPE="TEXT" NAME="phoneType[<%=i%>]" --%>
<%-- 					value="<%=c.getPhone().get(i).getPhoneType()%>" /> --%>
					

<a href="<%=request.getContextPath()%>/phone/delete/<%=c.getPhone().get(i).getId()%>">Remove Phone</a>
				<br>
				<br>
		<% } %>
			<input type="hidden" id="count" name="count" value="1">
		<INPUT TYPE="hidden" NAME="size" VALUE="<%=c.getPhone().size()%>">
		<br><div id="dynamicInput"></div>
			<br>
			<input type="button" value="Add More Phone" onclick="add('dynamicInput')"> 
			<INPUT TYPE="SUBMIT" VALUE="SUBMIT" />


		</FORM>
	</center>

</body>
</html>