<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.model.EmpModel"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <style>
        body {
            background: linear-gradient(135deg, #cacbce, #48afb3, #dcdede);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .container {
            background: linear-gradient(135deg, #041464, #d4edda, #18a4d5);
            padding: 20px;
            border-radius: 50px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }
        h1, h2 {
            text-align: center;
        }
        .table {
            background-color: #e6f7ff;
        }
        .thead {
            background-color: #040543;
            color: #f7f7f7;
        }
        .list{
        margin-top:100px;
        }
    </style>
    
    <script>
        function showDeleteModal(deleteUrl) {
            $('#deleteModal').modal('show');  // Show the Delete modal
            $('#confirmDeleteButton').attr('onclick', 'deleteItem("' + deleteUrl + '")');  // Set delete URL dynamically
        }

        function deleteItem(deleteUrl) {
            window.location.href = deleteUrl;  // Redirect to delete URL
        }
    </script>
</head>
<body>

    <%-- Include Navbar --%>
    <jsp:include page="navbar.jsp"></jsp:include>
    <%
        EmpModel emp = (EmpModel) session.getAttribute("emp");
    %>

    <div class="container mt-8 list">
        <h1 class="mb-4">Employee Management</h1>
        <h2>Welcome <%=emp.getEname()%></h2>

        <div class="table-responsive">
            <%
                List<EmpModel> employees = (List<EmpModel>) request.getAttribute("allemps");
            %>
            <%
                if (employees == null || employees.isEmpty()) {
            %>
            <div class='alert alert-warning text-center'>No employees found!</div>
            <%
                } else {
            %>
            <table class="table table-bordered table-hover">
                <thead class="thead">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Password</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (EmpModel employee : employees) {
                    %>
                    <tr>
                        <td><%=employee.getEid()%></td>
                        <td><%=employee.getEname()%></td>
                        <td><%=employee.getMail()%></td>
                        <td><%=employee.getPassword()%></td>
                        <td>
                            <a href="update?id=<%=employee.getEid()%>" class="btn btn-warning btn-sm">Update</a> 
                            <button class="btn btn-danger btn-sm" onclick="showDeleteModal('delete?id=<%=employee.getEid()%>')">
                                Delete
                            </button>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%
                }
            %>
        </div>
    </div>

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Confirm Deletion</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete this employee?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                    <button type="button" id="confirmDeleteButton" class="btn btn-danger">Delete</button>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
