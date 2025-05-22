<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,java.util.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User List</title>
</head>
<body>
<h2>User Listing</h2>
<a href="addUser.jsp">Add new Student</a>
<%
    ResultSet rs = (ResultSet) request.getAttribute("users");
%>
<table border="2">
<tr>
	<th>ID</th>
	<th>Name</th>
	<th>Class</th>
	<th>Actions</th>
</tr>
<% while(rs.next()) { %>
<tr>
	<td><%= rs.getInt("std_id") %></td>
	<td><%= rs.getString("std_name") %></td>
	<td><%= rs.getString("std_class") %></td>
	<td><a href="UserServlet?action=edit&id=<%= rs.getInt("std_id") %>">Edit</a> |
	<a href="UserServlet?action=delete&id=<%= rs.getInt("std_id") %>">Delete</a></td>
</tr>
<% }
 rs.close();%>
</table>


</body>
</html>