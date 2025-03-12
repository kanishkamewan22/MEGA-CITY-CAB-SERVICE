<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Vehicle Bookings</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
                    <li class="nav-item"><a class="nav-link" href="home.jsp"><i class="fas fa-home"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="vehicles"><i class="fas fa-car"></i> Add Vehicle</a></li>
                    <li class="nav-item"><a class="nav-link" href="viewBookings"><i class="fas fa-book"></i> View Bookings</a></li>
                    <li class="nav-item"><a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="register.jsp"><i class="fas fa-user-plus"></i> Register</a></li>
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