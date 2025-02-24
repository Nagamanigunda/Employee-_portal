<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.model.EmpModel" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Employee Details</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background: linear-gradient(135deg, #041464, #d4edda, #18a4d5);
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .registration-container {
        width: 500px;
        padding: 30px;
        border-radius: 15px;
        background: white;
        box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
        transition: transform 0.3s ease-in-out;
    }
    .registration-container:hover {
        transform: scale(1.03);
    }
    .form-control:focus {
        box-shadow: none;
        border-color: #ff758c;
    }
    label {
        font-size: 14px;
        color: #444;
    }
    .btn-primary {
        background-color: #ff758c;
        border-color: #ff758c;
        transition: background 0.3s, transform 0.3s;
    }
    .btn-primary:hover {
        background-color: #ff4757;
        border-color: #ff4757;
        transform: scale(1.05);
    }
    .btn-secondary {
        background-color: #6c757d;
        border-color: #6c757d;
        transition: background 0.3s, transform 0.3s;
    }
    .btn-secondary:hover {
        background-color: #545b62;
        border-color: #4e555b;
        transform: scale(1.05);
    }
    .form-control {
        transition: all 0.3s ease-in-out;
    }
    .form-control:hover {
        box-shadow: 0 0 8px rgba(255, 117, 140, 0.6);
    }
</style>
</head>
<body>

<% EmpModel em = (EmpModel) request.getAttribute("getemps"); %>
<div class="registration-container">
    <h2 class="text-center mb-3">🚀 Employee Portal</h2>
    <h4 class="text-center mb-4 text-muted">Update Your Details</h4>
    
    <form action="myprofile" method="post">
        <div class="mb-3">
            <label for="eid" class="form-label">Employee ID<span class="text-danger">*</span></label>
            <input type="text" name="eid" id="eid" class="form-control" value="<%= em.getEid() %>" required readonly>
        </div>
        <div class="mb-3">
            <label for="ename" class="form-label">Full Name<span class="text-danger">*</span></label>
            <input type="text" name="ename" id="ename" class="form-control" value="<%= em.getEname() %>" required>
        </div>
        <div class="mb-3">
            <label for="mail" class="form-label">Email Address<span class="text-danger">*</span></label>
            <input type="email" name="mail" id="mail" class="form-control" value="<%= em.getMail() %>" required>
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password<span class="text-danger">*</span></label>
            <input type="password" name="password" id="password" class="form-control" value="<%= em.getPassword() %>" required>
        </div>
        <button type="submit" class="btn btn-primary w-100 mb-2">Update <i class="fas fa-arrow-right"></i></button>
        
        <!-- Back Button -->
        <a href="myprofile?id=<%=em.getEid() %>" class="btn btn-secondary w-100"><i class="fas fa-arrow-left"></i> Back</a>
    </form>
</div>

</body>
</html>
	