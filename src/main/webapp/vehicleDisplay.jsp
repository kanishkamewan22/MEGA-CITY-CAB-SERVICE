<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Vehicle Display</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding-top: 80px;
        }

        .navbar {
            background-color: #070442;
            color: white;
        }

        .navbar .company-name {
            font-size: 20px;
            font-weight: bold;
        }

        .navbar-links a {
            color: white;
            margin: 0 10px;
            text-decoration: none;
        }

        .navbar-links a:hover {
            color: yellow;
            text-decoration: underline;
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
        }

        .vehicle-card img {
            width: 100%;
            height: 250px; /* You can set a fixed height for images */
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
            background-color: #e66500;
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
    <div class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">TechFix Computer</a>
            <div class="navbar-links ml-auto">
                <a class="nav-link" href="#">Home</a>
                <a class="nav-link" href="login.jsp">Login</a>
                <a class="nav-link" href="register.jsp">Register</a>
            </div>
        </div>
    </div>

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
                    <a href="http://localhost:8090/sanomi/booking?vehicleId=${vehicle.id}" class="btn btn-book-now">Book Now</a>


                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- Footer Section -->
    <div class="footer">
        <p>&copy; 2024 TechFix Computer. All rights reserved.</p>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>
</body>
</html>
