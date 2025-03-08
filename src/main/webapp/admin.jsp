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

        .footer {
            background-color: #070442;
            color: white;
            padding: 20px 0;
            text-align: center;
            margin-top: 40px;
        }

        .footer a {
            color: white;
            text-decoration: none;
        }

        .footer a:hover {
            color: yellow;
        }
    </style>
</head>
<body>

    <!-- Navigation Bar -->
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
                    <li class="nav-item"><a class="nav-link" href="http://localhost:8090/assiment/VehicleService"><i class="fas fa-home"></i> Adimin Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="http://localhost:8090/assiment/vehicalregister.jsp"><i class="fas fa-car"></i> Add Vehicle</a></li>
                    <li class="nav-item"><a class="nav-link" href="http://localhost:8090/assiment/viewBookings"><i class="fas fa-book"></i> View Bookings</a></li>
                    <li class="nav-item"><a class="nav-link" href="my.jsp"><i class="fas fa-sign-in-alt"></i> Logout</a></li>
                   
                </ul>
            </div>
        </div>
    </nav>

    <!-- Vehicle Display Section -->
    <div class="container mt-5 pt-5">
        <h2>Available Vehicles</h2>
        <div class="row">
            <!-- Loop through the vehicles list -->
          <c:forEach var="vehicle" items="${adminp}">

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
                    <a href="http://localhost:8090/mega_city_cab_service/delete?vehicleid=${vehicle.id}" class="btn btn-book-now">Delete</a>
                    <a href="http://localhost:8090/packtis/updateVehicle?vehicleid=${vehicle.id}" class="btn btn-book-now">Update</a>
                    


                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    
    <footer class="footer mt-5">
    <div class="container">
        <div class="row">
            <!-- Contact Section -->
            <div class="col-md-4">
                <h5><i class="fas fa-envelope"></i> Contact Us</h5>
                <p><i class="fas fa-map-marker-alt"></i> 123 Tech Street, City, Country</p>
                <p><i class="fas fa-phone"></i> +123 456 7890</p>
                <p><i class="fas fa-envelope"></i> support@techfix.com</p>

                <!-- Social Media -->
                <div class="social-icons mt-3">
                    <a href="#" class="text-light"><i class="fab fa-facebook"></i></a>
                    <a href="#" class="text-light"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="text-light"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="text-light"><i class="fab fa-linkedin"></i></a>
                </div>
            </div>
        </div>
    </div>
</footer>

    <!-- Footer Section -->
  

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
     
</body>
</html>