<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Vehicle Bookings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
  
  <style>
  
  
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
        <br><br><h2 class="mb-4 text-center">Vehicle Bookings</h2>

        

        <!-- Table to Display Bookings -->
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Booking ID</th>
                    <th>Vehicle Name</th>
                    <th>Vehicle Model</th>
                    <th>Customer Name</th>
                    <th>Email</th>
                    <th>Contact Number</th>
                    <th>Pickup Date</th>
                    <th>Return Date</th>
                    <th>Booking Price</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="booking" items="${bookings}">
                    <tr>
                        <td>${booking.bookingId}</td>
                        <td>${booking.vehicleName}</td>
                        <td>${booking.vehicleModel}</td>
                        <td>${booking.customerName}</td>
                        <td>${booking.email}</td>
                        <td>${booking.contactNumber}</td>
                        <td>${booking.pickupDate}</td>
                        <td>${booking.returnDate}</td>
                        <td>${booking.bookingPrice}</td>
                        <td>
                            <form action="deleteBooking" method="post">
                                <input type="hidden" name="bookingId" value="${booking.bookingId}">
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete this booking?');">
                                    Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Footer -->
    <footer class="footer bg-dark text-white text-center mt-5 p-3">
        <p>&copy; 2024 Vehicle Booking System. All Rights Reserved.</p>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
