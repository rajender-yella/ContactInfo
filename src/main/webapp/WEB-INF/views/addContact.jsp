<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
</head>
<body>
	<h1>${headerMessage}</h1>
	
        <form:form method="POST" action="addContact" modelAttribute="contact">
             <table>
                <tr>
                    <td><form:label path="firstname">First Name</form:label></td>
                    <td><form:input path="firstname"/></td>
                </tr>
                <tr>
                    <td><form:label path="middlename">Middle Name</form:label></td>
                    <td><form:input path="middlename"/></td>
                </tr>
                <tr>
                    <td><form:label path="lastname">LastName</form:label></td>
                    <td><form:input path="lastname"/></td>
                </tr>
               <tr>
                    <td><form:label path="gender">Gender</form:label></td>
                    <td><form:input path="gender"/></td>
                </tr>
                <tr>
                    <td><form:label path="email">Email</form:label></td>
                    <td><form:input path="email"/></td>
                </tr>
                <tr>
                    <td><form:label path="phone">Phone</form:label></td>
                    <td><form:input path="phone"/></td>
                </tr>
                <tr>
                    <td><form:label path="address">Address</form:label></td>
                    <td><form:input path="address"/></td>
                </tr>
                <tr>
                    <td><form:label path="city">City</form:label></td>
                    <td><form:input path="city"/></td>
                </tr>
                <tr>
                    <td><form:label path="pincode">PinCode</form:label></td>
                    <td><form:input path="pincode"/></td>
                </tr>
                 <tr>
                    <td><form:label path="profile">Profile</form:label></td>
                    <td><form:input path="profile"/></td>
                </tr>
                <tr>
                    <td><input type="submit" value="Submit"/></td>
                </tr>
            </table>
        </form:form>

</body>
</html>