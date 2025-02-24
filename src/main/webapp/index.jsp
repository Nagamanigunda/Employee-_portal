<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Registration</title>
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
            max-width: 600px;
            padding: 40px;
            border-radius: 15px;
            background: white;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.3);
        }
        .form-control:focus {
            box-shadow: none;
            border-color: #17a2b8;
        }
        label {
            font-size: 12px;
            color: red;
        }
        .btn-primary {
            background-color: #17a2b8;
            border-color: #17a2b8;
        }
        .btn-primary:hover {
            background-color: #117a8b;
            border-color: #117a8b;
        }
        .btn-success {
            background-color: #6c757d;
            border-color: #6c757d;
        }
        .btn-success:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }
    </style>
</head>
<body>
    <div class="registration-container">
        <h2 class="text-center mb-3">Welcome to Employee Portal</h2>
        <h4 class="text-center mb-4">Register Here</h4>
        <form action="register" method="post">
            <div class="mb-3">
                <label for="eid" class="form-label">Employee ID<span class="text-danger">*</span></label>
                <input type="text" name="eid" id="eid" class="form-control" placeholder="Enter Employee ID" required>
            </div>
            <div class="mb-3">
                <label for="ename" class="form-label">Full Name<span class="text-danger">*</span></label>
                <input type="text" name="ename" id="ename" class="form-control" placeholder="Enter Full Name" required>
            </div>
            <div class="mb-3">
                <label for="mail" class="form-label">Email Address<span class="text-danger">*</span></label>
                <input type="email" name="mail" id="mail" class="form-control" placeholder="Enter Email Address" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password<span class="text-danger">*</span></label>
                <input type="password" name="password" id="password" class="form-control" placeholder="Enter Password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100 mb-2">Register</button>
            
            <div class="text-center">
                <b>Already have an account?</b> 
                <a href="login.jsp">
                    <button type="button" class="btn btn-success">Login</button>
                </a>
            </div>
        </form>
    </div>
</body>
</html>