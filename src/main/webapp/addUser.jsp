<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Form</title>
</head>
<body>
<h2><%= request.getAttribute("std_id")== null ? "Add new Student" : "Edit Student"  %></h2>
<form action="UserServlet" method="post">
<input type="hidden" name="std_id" value="<%= request.getAttribute("std_id")!= null ? request.getAttribute("std_id") : ""  %>"/> 
Name: <input type="text" name="std_name" value="<%= request.getAttribute("std_name")!= null ? request.getAttribute("std_name"): ""  %>"/> <br/>
Class: <input type="text" name="std_class" value="<%= request.getAttribute("std_class")!= null ? request.getAttribute("std_class") : ""  %>"/> <br/>
<input type="submit" value="Save"/> <br/>
<a href="UserServlet">Back to Listing User</a>


</form>

</body>
</html>