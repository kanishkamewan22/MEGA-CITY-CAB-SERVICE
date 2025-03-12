<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <!-- Link to Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
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
            background-color: #070442;
            color: white;
            padding: 10px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: fixed;
            width: 100%;
            height: 80px;
            top: 0;
            z-index: 1000;
        }
        .navbar .company-icon img {
            height: 60px;
            margin-right: 15px;
        }
        .navbar-links {
            display: flex;
            gap: 20px;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            font-weight: bold;
        }
        .navbar a:hover {
            background-color: #575757;
            color: yellow;
            font-weight: bold;
            font-size: 30px;
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

    <div class="navbar">
        <div class="company-icon">
            <img src="image/logo.JPG" alt="Logo">
            <div class="company-name">TechFix Computer</div>
        </div>
        <div class="navbar-links">
            <a href="http://localhost:7750/myasiment/home.jsp"><i class="fas fa-home"></i> Home</a>
        </div>
    </div>

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

                <p>Don't have an account? <a href="http://localhost:7750/myasiment/my.jsp">Sign up here</a></p>
            </form>
        </div>
    </div>
</body>
</html>
