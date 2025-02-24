<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.model.EmpModel" %>
<% EmpModel emp = (EmpModel) session.getAttribute("emp"); %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    
    <style>
     .navbar {
            width: 100%;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1050;
        }
        .navbar {
            background-color: #007bb5 !important;
        }
        .navbar-brand {
            color: white !important;
            font-size: 1.5rem;
            font-weight: bold;
        }
        .nav-link, .dropdown-item {
            color: white !important;
        }
        .dropdown-menu {
            background-color: #007bb5;
        }
        .dropdown-menu a:hover {
            background-color: #005f87;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <a class="navbar-brand" href="#">Employee Management</a>
        <div class="ml-auto d-flex align-items-center">
            <div class="dropdown mr-3">
                <a href="myprofile?id=<%= emp.getEid() %>" class="btn btn-secondary">
                    <i class="fas fa-user-circle"></i> View Profile
                </a>
            </div>
            <!-- Logout Button -->
            <button class="btn btn-danger" onclick="showLogoutModal()">
                <i class="fas fa-sign-out-alt"></i> Logout
            </button>
        </div>
    </nav>

    <!-- Logout Confirmation Modal -->
    <div class="modal fade" id="logoutModal" tabindex="-1" aria-labelledby="logoutModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="logoutModalLabel">
                        <i class="fas fa-exclamation-triangle text-warning"></i> Confirm Logout
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body text-center">
                    <p class="lead">Are you sure you want to logout?</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">
                        <i class="fas fa-times"></i> Cancel
                    </button>
                    <button type="button" class="btn btn-danger" id="confirmLogout">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script>
        function showLogoutModal() {
            $('#logoutModal').modal('show'); // Show the logout confirmation modal
        }

        document.getElementById("confirmLogout").addEventListener("click", function() {
            window.location.href = "login.jsp"; // Redirect to login page
        });
    </script>
</body>
</html>
