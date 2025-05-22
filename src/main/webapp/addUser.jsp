<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><%= request.getAttribute("std_id") == null ? "Add Student" : "Edit Student" %></title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .form-container {
            max-width: 600px;
            margin: 30px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        .form-title {
            border-bottom: 2px solid #0d6efd;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body class="bg-light">
    <div class="container">
        <div class="form-container">
            <h2 class="form-title text-primary">
                <i class="fas fa-user-graduate me-2"></i>
                <%= request.getAttribute("std_id") == null ? "Add New Student" : "Edit Student" %>
            </h2>
            
            <form action="UserServlet" method="post">
                <input type="hidden" name="std_id" 
                       value="<%= request.getAttribute("std_id") != null ? request.getAttribute("std_id") : "" %>"/>
                
                <div class="mb-3">
                    <label for="std_name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="std_name" name="std_name" 
                           value="<%= request.getAttribute("std_name") != null ? request.getAttribute("std_name") : "" %>"
                           required>
                </div>
                
                <div class="mb-3">
                    <label for="std_class" class="form-label">Class</label>
                    <input type="text" class="form-control" id="std_class" name="std_class" 
                           value="<%= request.getAttribute("std_class") != null ? request.getAttribute("std_class") : "" %>"
                           required>
                </div>
                
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <a href="UserServlet" class="btn btn-secondary me-md-2">
                        <i class="fas fa-arrow-left me-1"></i> Back to List
                    </a>
                    <button type="submit" class="btn btn-primary">
                        <i class="fas fa-save me-1"></i> Save
                    </button>
                </div>
            </form>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>