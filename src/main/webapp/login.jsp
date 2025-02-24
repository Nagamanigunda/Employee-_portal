<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
background: linear-gradient(135deg, #041464, #d4edda, #18a4d5);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-container {
            width: 500px;
            padding: 35px;
            border-radius: 20px;
            background: white;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        .form-control {
            border-radius: 10px;
            transition: all 0.3s ease-in-out;
        }
        .form-control:focus {
            box-shadow: 0 0 8px rgba(111, 66, 193, 0.5);
            border-color: #6f42c1;
        }
        .btn-primary {
            background-color: #6f42c1;
            border-color: #6f42c1;
            border-radius: 50px;
            transition: all 0.3s ease-in-out;
        }
        .btn-primary:hover {
            background-color: #5a32a3;
            border-color: #5a32a3;
            transform: scale(1.05);
        }
        .btn-secondary {
            background-color: #ffc107;
            border-color: #ffc107;
            border-radius: 50px;
            transition: all 0.3s ease-in-out;
            margin-top: 10px;
        }
        .btn-secondary:hover {
            background-color: #ff9800;
            border-color: #ff9800;
            transform: scale(1.05);
        }
        .text-muted {
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h4 class="mb-3"> Welcome Back! </h4>
        <p class="text-muted">Please login to continue</p>
        
        <form action="login" method="post">
            <div class="mb-3">
                <input type="email" name="mail" id="mail" class="form-control" placeholder="📧 Enter Email Address" required>
            </div>
            <div class="mb-3">
                <input type="password" name="password" id="password" class="form-control" placeholder="🔒 Enter Password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">✨ Login ✨</button>
            
            <div class="text-center mt-3">
                <p class="text-muted">Don't have an account?</p> 
                <a href="index.jsp">
                    <button type="button" class="btn btn-secondary w-100">🌟 Register 🌟</button>
                </a>
            </div>
        </form>
    </div>
</body>
</html>
