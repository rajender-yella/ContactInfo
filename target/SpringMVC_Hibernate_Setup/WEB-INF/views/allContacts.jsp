<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Contacts</title>
</head>
<body>
	<br>
	<br>
	<br>
	<a href="${pageContext.request.contextPath}/addContact">Add Contact</a>
	<br>
	<h3>List of all contacts</h3>
	${message}
	<br>
	<br>
	<table border="1px" cellpadding="0" cellspacing="0">
		<thead>
			<tr>
				<th>First Name</th>
				<th>Middle Name</th>
				<th>Last Name</th>
				<th>Gender</th>
				<th>Email</th>
				<th>Phone</th>
				<th>Address</th>
				<th>City</th>
				<th>PinCode</th>
				<th>Profile</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="contact" items="${contactList}">
				<tr>
					<td>${contact.firstname}</td>
					<td>${contact.middlename}</td>
					<td>${contact.lastname}</td>
					<td>${contact.gender}</td>
					<td>${contact.email}</td>
					<td>${contact.phone}</td>
					<td>${contact.address}</td>
					<td>${contact.city}</td>
					<td>${contact.pincode}</td>
					<td>${contact.profile}</td>
					<td><a
						href="${pageContext.request.contextPath}/editContact/${contact.id}">Edit</a></td>
					<td><a
						href="${pageContext.request.contextPath}/deleteContact/${contact.id}">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>


	</table>
</body>
</html>