<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Vehicle</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    
    <style >
    
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
                    <li class="nav-item"><a class="nav-link" href="#"><i class="fas fa-home"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#"><i class="fas fa-car"></i> Add Vehicle</a></li>
                    <li class="nav-item"><a class="nav-link" href="#"><i class="fas fa-book"></i> View Bookings</a></li>
                    <li class="nav-item"><a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="register.jsp"><i class="fas fa-user-plus"></i> Register</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
       <br><br><br> <h2>Update Vehicle Details</h2>

        <!-- Display error or success message -->
        <c:if test="${not empty error}">
            <div class="alert alert-danger">
                ${error}
            </div>
        </c:if>

        <c:if test="${not empty message}">
            <div class="alert alert-success">
                ${message}
            </div>
        </c:if>

       
            <form method="post" action="updateDisplay"  enctype="multipart/form-data"> >
     
           <div class="mb-3">
                <label for="vehicleid" class="form-label">vehicle id</label>
                <input type="text" class="form-control" id="vehicleid" name="vehicleid" value="${vehicle.id}">
            </div>
   
    <input type="hidden" name="vehicleid" value="${vehicle.id}" />
            
            <div class="mb-3">
                <label for="vehicleName" class="form-label">Vehicle Name</label>
                <input type="text" class="form-control" id="vehicleName" name="vehicleName" value="${vehicle.vehicleName}">
            </div>

            <div class="mb-3">
                <label for="vehicleModel" class="form-label">Vehicle Model</label>
                <input type="text" class="form-control" id="vehicleModel" name="vehicleModel" value="${vehicle.vehicleModel}">
            </div>

            <div class="mb-3">
                <label for="vehicleType" class="form-label">Vehicle Type</label>
                <input type="text" class="form-control" id="vehicleType" name="vehicleType" value="${vehicle.vehicleType}">
            </div>

            <div class="mb-3">
                <label for="fuelType" class="form-label">Fuel Type</label>
                <input type="text" class="form-control" id="fuelType" name="fuelType" value="${vehicle.fuelType}">
            </div>

            <div class="mb-3">
                <label for="price" class="form-label">Price</label>
                <input type="text" class="form-control" id="price" name="price" value="${vehicle.price}">
            </div>

            <div class="mb-3">
                <label for="modelYear" class="form-label">Model Year</label>
                <input type="text" class="form-control" id="modelYear" name="modelYear" value="${vehicle.modelYear}">
            </div>

            <div class="mb-3">
                <label for="engineSize" class="form-label">Engine Size</label>
                <input type="text" class="form-control" id="engineSize" name="engineSize" value="${vehicle.engineSize}">
            </div>

            <div class="mb-3">
                <label for="photo" class="form-label">Vehicle Photo</label>
                <input type="file" class="form-control" id="photo" name="photo">
            </div>

            <div class="mb-3">
                <label for="phototwo" class="form-label">Vehicle Photo 2</label>
                <input type="file" class="form-control" id="phototwo" name="phototwo">
            </div>

            <button type="submit" class="btn btn-primary w-100">Confirm Update</button>
        </form>
    </div>

    <footer class="footer bg-dark text-white text-center mt-5 p-4">
        <p>&copy; 2024 Vehicle Booking. All Rights Reserved.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

</body>
</html>
