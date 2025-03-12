<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Vehicle Display</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color:white;
            padding-top: 80px;
        }

   .navbar {
            position: fixed;
            width: 100%;
            z-index: 1000;
            background: rgba(0, 0, 0, 0.7) !important;  /* Fully transparent */
            transition: background 0.3s ease-in-out;
        }
        .navbar.scrolled {
            background: rgba(0, 0, 0, 0.7) !important; /* Dark background on scroll */
        }
        .navbar-brand {
            font-size: 24px;
            font-weight: bold;
            color: black !important;
        }
        .navbar-nav .nav-link {
            color: white !important;
            font-weight: bold;
            transition: color 0.3s ease;
        }
        .navbar-nav .nav-link:hover {
            color: #28a745 !important; /* Green hover effect */
        }

        .vehicle-list {
            max-width: 90%;
            margin: auto;
        }

        .vehicle-card {
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: white;
            transition: transform 0.3s ease-in-out;
           
        }

        .vehicle-card:hover {
            transform: translateY(-10px);
              background-color: yellow;
        }

        .vehicle-card img {
            width: 100%;
            height: 150px; /* You can set a fixed height for images */
            object-fit: cover; /* Ensures that the image fills the space without distortion */
        }

        .vehicle-card-body {
            padding: 20px;
            text-align: center;
        }

        .vehicle-card-title {
            font-size: 20px;
            font-weight: bold;
        }

        .vehicle-card-price {
            font-size: 18px;
            font-weight: bold;
            color: #ff7a00;
        }

        .vehicle-card-footer {
            padding-top: 10px;
        }

        .btn-book-now {
            background-color: #ff7a00;
            color: white;
            border: none;
            padding: 10px 20px;
            font-weight: bold;
            border-radius: 5px;
            text-transform: uppercase;
            letter-spacing: 1px;
            transition: background-color 0.3s ease;
        }

        .btn-book-now:hover {
            background-color: #070442;
                  color: yellow;
        }

          /* Footer Styling */
        .footer {
            background-color: #070442;
            color: #fff;
            padding: 30px 0;
            text-align: center;
        }

        .footer-content {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .footer-section {
            margin: 0 15px;
        }

        .footer-section h5 {
            font-size: 24px;
            margin-bottom: 10px;
            border-bottom: 2px solid #444;
            padding-bottom: 5px;
        }

        .footer-section p, .footer-section ul {
            font-size: 16px;
            line-height: 1.6;
            margin: 0;
            padding: 0;
        }

        .footer-section ul {
            list-style: none;
        }

        .footer-section ul li {
            margin-bottom: 10px;
        }

        .footer-section ul li a {
            color: #bbb;
            text-decoration: none;
        }

        .footer-section ul li a:hover {
            color: #f0c040;
            font-weight: bold;
        }

        .social-links {
            margin-top: 10px;
        }

        .social-icon {
            color: #fff;
            font-size: 24px;
            margin: 0 10px;
            transition: color 0.3s ease;
        }

        .social-icon:hover {
            color: #f0c040;
            font-size: 28px; /* Adjusted size for hover effect */
        }

        .footer-bottom {
            border-top: 1px solid #444;
            padding-top: 10px;
        }

        .footer-bottom p {
            margin: 0;
            font-size: 14px;
        }

        @media (max-width: 768px) {
            .footer-content {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
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
                    <li class="nav-item"><a class="nav-link" href="http://localhost:8090/mega_city_cab_service/vehicles"><i class="fas fa-home"></i> Home</a></li>

                    <li class="nav-item"><a class="nav-link" href="my.jsp"><i class="fas fa-sign-in-alt"></i> Logout</a></li>
                    <li class="nav-item"><a class="nav-link" href="signup.jsp"><i class="fas fa-user-plus"></i> Register</a></li>

                      <li class="nav-item"><a class="nav-link" href="http://localhost:8090/mega_city_cab_service/viewBookingsByEmail"><i class="fas fa-book"></i> View Bookings</a></li>
                </ul>
            </div>
        </div>
        
        
        
    </nav><c:if test="${not empty sessionScope.email}">
            <p>Welcome, <strong>${sessionScope.email}</strong></p>  <!-- Display the email -->
        </c:if>
    
    
    

    <!-- Vehicle Display Section -->
    <div class="container mt-5 pt-5">
    
        <h2>Available Vehicles</h2>
        <div class="row">
            <!-- Loop through the vehicles list -->
            <c:forEach var="vehicle" items="${vehicles}">
                <div class="col-md-4 mb-4">
                    <div class="vehicle-card">
                    <img class="card-img-top" src="vehicleImage?id=${vehicle.id}" alt="${vehicle.vehicleName}">

                        <div class="vehicle-card-body">
                           <p class="card-text">ID: ${vehicle.id}</p>
                            <h5 class="vehicle-card-title">${vehicle.vehicleName}</h5>
                            <p class="card-text">Model: ${vehicle.vehicleModel}</p>
                            <p class="card-text">Type: ${vehicle.vehicleType}</p>
                            <p class="card-text">Fuel Type: ${vehicle.fuelType}</p>
                            <p class="vehicle-card-price">Rs. ${vehicle.price} / Day</p>
                            <p class="card-text">Year: ${vehicle.modelYear}</p>
                            <p class="card-text">Engine Size: ${vehicle.engineSize}</p>
                        </div>
                        <div class="vehicle-card-footer text-center">
                      <!-- In the vehicle display section -->
                    <a href="http://localhost:8090/mega_city_cab_service/booking?vehicleId=${vehicle.id}" class="btn btn-book-now">Book Now</a>


                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    
     <footer class="footer">
            <div class="container">
                <div class="footer-content">
                    <!-- About Us Section -->
                    <div class="footer-section about-us">
                        <h5>About Mega city cab service</h5><br>
                        <p>At Mega city cab service, we specialize in providing high-quality car bookings. Our mission is to deliver the best vehicle solutions with excellence.</p>
                    </div><br><br>

                    <!-- Quick Links -->
                  <br><br>  <div class="footer-section quick-links">
                        <br><br> <h5>Quick Links</h5>
                        <ul>
                            <li><a href="http://localhost:52714/Default3.aspx">Home</a></li>
                            <li><a href="http://localhost:52714/Default11.aspx">About Us</a></li>
                            <li><a href="#">Services</a></li>
                            <li><a href="http://localhost:52714/Default10.aspx">Contact</a></li>
                        </ul>
                    </div>

                    <!-- Contact Us -->
                    <div class="footer-section contact-us">
                      <br><br>   <h5>Contact Us</h5>
                        <ul>
                            <li><i class="fas fa-home"></i> No.112/A,Mega city cab service, Kurunegala Rd, Colombo</li>
                            <li><i class="fas fa-envelope"></i> info@megacVity.com</li>
                            <li><i class="fas fa-phone"></i> +94 11 2321255</li>
                            <li><i class="fas fa-print"></i> +94 77 5653542</li>
                        </ul>
                    </div>

                    <!-- Follow Us -->
                    <div class="footer-section follow-us">
                       <br><br>  <h5>Follow Us</h5>
                        <div class="social-links">
                            <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                            <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                            <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                            <a href="#" class="social-icon"><i class="fab fa-youtube"></i></a>
                        </div>
                    </div>
                </div>

                <!-- Copyright Section -->
                <div class="footer-bottom">
                    <p>&copy; 2024 TechFix. All Rights Reserved.</p>
                </div>
            </div>
        </footer>
    
   
    

   



</body>
</html>

   
  

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <!-- Bootstrap & Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <script>
</body>
</html>