<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Signup</title>
    <style>
        /* General Styles */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
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
            margin: 100px auto;
            width: 100%;
            height: 100%;
        }

        .signup-container {
            flex: 1;
            max-width: 400px;
            background-color: #831936;
            padding: 30px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            text-align: center;
            margin-top: 10px;
        }

        h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #fff;
        }

        /* Image Styles */
        .image-container {
            flex: 1;
            background-image: url('image/s4.jpg'); /* Replace with your image URL */
            background-size: cover;
            background-position: center;
            border-radius: 10px 0 0 10px;
            margin-top: 10px;
        }

        /* Form Styles */
        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 10px;
            text-align: left;
            font-size: 14px;
            color: #fff;
            font-weight: bold;
        }

        input[type="text"], input[type="password"], input[type="email"], select {
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            width: 100%;
        }

        button, input[type="submit"] {
            padding: 10px;
            background-color: #1e90ff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
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

        /* Small Screen Adjustments */
        @media (max-width: 480px) {
            .signup-container {
                padding: 20px;
            }
            .container {
                flex-direction: column;
            }
            .image-container {
                height: 200px; /* Adjust as needed */
                border-radius: 10px 10px 0 0;
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
            <a href=""><i class="fas fa-home"></i> Home</a>
        </div>
    </div>  
     
   
      
       
        
       <div class="container">
        <div class="image-container"></div> <!-- Image Section -->
        <div class="signup-container">
            <h2>Create an Account</h2>

            <form method="post" action="mewan">
            
                <p class="error-message">
                <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
                </p>
                <p class="success-message">
                    <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
                </p> 
                
                
                
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter your username" required />

                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter your email" required />

                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required />

                <label for="confirm-password">Confirm Password</label>
                <input type="password" id="confirm-password" name="confirm-password" placeholder="Confirm your password" required />

                <label for="position">Select Position</label>
                <select id="position" name="position">
                    <option value="">Select Position</option>
                    <option value="Client">Client</option>
                    <option value="Administrator">Administrator</option>
                </select>

                <input type="submit" value="Sign Up" />

                <p>Already have an account? <a href="http://localhost:7750/myasiment/login.jsp">Login here</a></p>
                


                <p>Already have an account? <a href="login.jsp">Login here</a></p>
            </form>
        </div>
    </div>
</body>
</html>
