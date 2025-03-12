<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Signup</title>
    
     <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    
    <style>
        /* General Styles */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
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
    <!-- SweetAlert2 CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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
        <div class="image-container"></div> <!-- Image Section -->
        <div class="signup-container">
            <h2>Create an Account</h2>

            <form method="post" action="mewan">
                <!-- Display error message if any -->
                <p class="error-message" style="color: red;">
                    <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
                </p>
                <p class="success-message" style="color: green;">
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

                <p>Already have an account? <a href="login.jsp">Login here</a></p>
            </form>
        </div>
    </div>

   

</body>
</html>
