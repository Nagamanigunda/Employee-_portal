<!DOCTYPE html>
<%@ page import="com.model.EmpModel" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Profile</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            background: linear-gradient(135deg, #041464, #d4edda, #18a4d5);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding-top: 80px; /* Ensure content doesn't overlap with navbar */
        }
       
        .card {
            width: 500px;
            padding: 30px;
            border-radius: 20px;
            background: white;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
            text-align: center;
            border: none;
            position: relative;
            overflow: hidden;
            transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }
        .card h2 {
            color: #4169E1;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .info-box {
            background: #f0f8ff;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease-in-out;
        }
        .info-box:hover {
            transform: scale(1.05);
            background: #e0f7ff;
        }
        .info-box strong {
            color: #1E90FF;
        }
        .btn-custom {
            display: block;
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border-radius: 10px;
            font-weight: bold;
            transition: background 0.3s ease-in-out, transform 0.3s ease-in-out;
            text-align: center;
        }
        .btn-custom i {
            margin-right: 8px;
        }
        .btn-custom:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <jsp:include page="navbar.jsp"></jsp:include>
    
    <% EmpModel em = (EmpModel) request.getAttribute("getemps"); %>
    <div class="card mt-5">
        <h2>Employee Profile</h2>
        <div class="info-box"><strong>Employee ID:</strong> <%= em.getEid() %></div>
        <div class="info-box"><strong>Full Name:</strong> <%= em.getEname() %></div>
        <div class="info-box"><strong>Email Address:</strong> <%= em.getMail() %></div>
        <div class="info-box"><strong>Password:</strong> <%= em.getPassword() %></div>
        
        <!-- Edit Profile Button -->
        <a href="update?id=<%= em.getEid() %>" class="btn btn-primary btn-custom mt-3">
            <i class="fas fa-user-edit"></i> Edit Profile
        </a>        
        
        <form action="EmpListController" method="post">
            <!-- Back Button -->
            <button class="btn btn-secondary btn-custom mt-2" type="submit">
                <i class="fas fa-arrow-left"></i> Back
            </button>
        </form>
    </div>
    
    <script>
        function showDeleteModal(deleteUrl) {
            $('#deleteModal').modal('show');  // Show the Delete modal
            $('#confirmDeleteButton').attr('onclick', 'deleteItem("' + deleteUrl + '")');  // Set delete URL dynamically
        }

        function deleteItem(deleteUrl) {
            window.location.href = deleteUrl;  // Redirect to delete URL
        }
    </script>
</body>
</html>
