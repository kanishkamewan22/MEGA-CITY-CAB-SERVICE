<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Vehicle Bookings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</script>
    
    <style>
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
        
        
        
    </nav>

    <div class="container mt-5">
        <br><br><br>
        <h2>Your Vehicle Bookings</h2>

        <!-- Display success or error messages using SweetAlert -->
        <c:if test="${not empty message}">
            <script>
                Swal.fire({
                    icon: 'success',
                    title: 'Success',
                    text: '${message}',
                    confirmButtonText: 'OK'
                }).then(function() {
                    // Redirect after clicking OK
                    window.location.href = "http://localhost:8090/mega_city_cab_service/viewBookingsByEmail";
                });
            </script>
        </c:if>

        <c:if test="${not empty error}">
            <script>
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: '${error}',
                    confirmButtonText: 'OK'
                });
            </script>
        </c:if>

        <!-- Display booking details -->
        <table class="table table-bordered">
            <thead class="table-dark">
                <tr>
                    <th>Booking ID</th>
                    <th>Vehicle Name</th>
                    <th>Model</th>
                    <th>Pickup Date</th>
                    <th>Return Date</th>
                    <th>Total Price</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="booking" items="${bookings}">
                    <tr>
                        <td>${booking.bookingId}</td>
                        <td>${booking.vehicleName}</td>
                        <td>${booking.vehicleModel}</td>
                        <td>${booking.pickupDate}</td>
                        <td>${booking.returnDate}</td>
                        <td>${booking.bookingPrice}</td>
                        <td>
                            <form action="cancelBooking" method="post">
                                <input type="hidden" name="bookingId" value="${booking.bookingId}">
                                <button type="submit" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to cancel this booking?');">
                                    Cancel
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <footer class="footer bg-dark text-white text-center mt-5 p-3">
        <p>&copy; 2024 Vehicle Booking System. All Rights Reserved.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>