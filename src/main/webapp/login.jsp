<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <!-- Link to Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <style>
        /* General Styles */
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #f0f0f0, #d9e2ec);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
         .navbar {
            position: fixed;
            width: 100%;
            z-index: 1000;
              background: rgba(0, 0, 0, 0.7) !important; 
            transition: background 0.3s ease-in-out;
        }
        .navbar.scrolled {
            background: rgba(0, 0, 0, 0.7) !important; /* Dark background on scroll */
        }
        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
            color: white !important;
        }
        .navbar-nav .nav-link {
            color: white !important;
            font-weight: bold;
            transition: color 0.3s ease;
        }
        .navbar-nav .nav-link:hover {
            color: #28a745 !important; /* Green hover effect */
        }
        .container {
            display: flex;
            max-width: 900px;
            width: 120%;
            height: 120%;
            margin-top: 120px;
        }
        .login-container {
            flex: 1;
            max-width: 400px;
            background-color: #831936;
            padding: 40px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            text-align: center;
            margin-top: 120px;
        }

        h2 {
            margin-bottom: 25px;
            font-size: 26px;
            font-weight: 500;
            color: #fff;
        }

        .image-container {
            flex: 1;
            background-image: url('image/s4.jpg');
            background-size: cover;
            background-position: center;
            border-radius: 12px 0 0 12px;
            margin-top: 120px;
        }

        form {
            display: flex;
            flex-direction: column;
            margin-top: 20px;
        }

        label {
            margin-bottom: 8px;
            text-align: left;
            font-size: 14px;
            color: #fff;
            font-weight: bold;
        }

        input[type="text"], input[type="password"], input[type="email"], select {
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            width: 100%;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus, input[type="password"]:focus, input[type="email"]:focus, select:focus {
            border-color: #1e90ff;
            box-shadow: 0 4px 12px rgba(30, 144, 255, 0.1);
            outline: none;
        }

        button, input[type="submit"] {
            padding: 12px;
            background-color: #1e90ff;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        button:hover, input[type="submit"]:hover {
            background-color: #0a73e7;
        }

        p {
            font-size: 14px;
            color: #fff;
        }

        a {
            color: #1e90ff;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .login-container {
                padding: 30px 20px;
            }
            .container {
                flex-direction: column;
            }
            .image-container {
                height: 200px;
                border-radius: 12px 12px 0 0;
            }
        }
    </style>
</head>
<body>

   <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">
                <i class="fas fa-car"></i> MEGA<span class="text-success">CITY</span> <i class=></i> CABS
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"> 
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="my.jsp"><i class="fas fa-home"></i> Home</a></li>

                    <li class="nav-item"><a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="signup.jsp"><i class="fas fa-user-plus"></i> Register</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="image-container"></div>
        <div class="login-container">
            <h2>Login to Your Account</h2>

            <form method="post" action="loginnServlet">
                <!-- Display error message if any -->
                <p class="error-message" style="color: red;">
                    <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
                </p>

                <!-- Display success message if any -->
                <p class="success-message" style="color: green;">
                    <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
                </p>  
                
               <label for="email">Email</label>
               <input type="email" id="email" name="email" placeholder="Enter your email" required />
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" />

                <label for="position">Select Position</label>
                <select id="position" name="position">
                    <option value="">Select Position</option>
                    <option value="Administrator">Administrator</option>
                    <option value="Client">Client</option>
                </select>

                <input type="submit" value="Login" />

                <p>Don't have an account? <a href="signup.jsp">Sign up here</a></p>
            </form>
        </div>
    </div>
</body>
</html>
