<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Vehicle</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css" />
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        /* Swiper Image Container */
        .swiper {
            width: 100%;
            height: 400px; /* Set fixed height for the swiper container */
        }

        .swiper-slide img {
            width: 100%;
            height: 100%;
            object-fit: cover; /* Ensures that the images fill the space without distortion */
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
    </style>
</head>
<body>

    <!-- Navigation Bar -->
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
                    <li class="nav-item"><a class="nav-link" href="http://localhost:8090/assiment/vehicles"><i class="fas fa-home"></i> Home</a></li>

                    <li class="nav-item"><a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="register.jsp"><i class="fas fa-user-plus"></i> Register</a></li>
                </ul>
            </div>
        </div>
    </nav>

   
                   
    <!-- Booking Form Section -->
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="form-container">
                 <br><br>   <h2>Book Your Vehicle</h2>

                    <!-- Display error message if available -->
                    <c:if test="${not empty error}">
                        <div class="alert alert-danger">
                            ${error}
                        </div>
                    </c:if>

 
    

    <!-- Swiper Image Slider Section (Top of the Page) -->
    <div class="container mt-5">
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
                <!-- Display vehicle images if available -->
<c:if test="${not empty vehicle.vehiclePhoto}">
    <!-- First image (vehiclePhoto) -->
    <div class="swiper-slide">
        <img src="vehicleImage?id=${vehicle.id}" class="d-block w-100" alt="Vehicle Image 1">
    </div>
</c:if>

<c:if test="${not empty vehicle.vehiclePhototwo}">
    <!-- Second image (vehiclePhototwo) -->
    <div class="swiper-slide">
        <img src="vehicleImage?id=${vehicle.id}&imageType=secondary" class="d-block w-100" alt="Secondary Image">
    </div>
</c:if>


            </div>
            <!-- Add navigation buttons if needed -->
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </div>
    
    
     <p class="error-message">
                <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
                </p>
                <p class="success-message">
                    <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
                </p> 
                
                
                
                    <!-- Display vehicle information if vehicle object is passed -->
                    <c:if test="${not empty vehicle}">
                        <form method="post" action="submitBooking">
                            <div class="mb-3">
                            
                             <div class="mb-3">
                <label for="vehicleid" class="form-label">Vehicle ID</label>
                <input type="text" class="form-control" id="vehicleid" name="vehicleid" value="${vehicle.id}" readonly>
                    </div>
                                <label for="vehicleName" class="form-label">Vehicle Name</label>
                                <input type="text" class="form-control" id="vehicleName" name="vehicleName" value="${vehicle.vehicleName}" readonly required>
                            </div>

                            <div class="mb-3">
                                <label for="vehicleModel" class="form-label">Vehicle Model</label>
                                <input type="text" class="form-control" id="vehicleModel" name="vehicleModel" value="${vehicle.vehicleModel}" readonly required>
                            </div>

                            <div class="mb-3">
                                <label for="vehicleType" class="form-label">Vehicle Type</label>
                                <input type="text" class="form-control" id="vehicleType" name="vehicleType" value="${vehicle.vehicleType}" readonly required>
                            </div>

                            <div class="mb-3">
                                <label for="fuelType" class="form-label">Fuel Type</label>
                                <input type="text" class="form-control" id="fuelType" name="fuelType" value="${vehicle.fuelType}" readonly required>
                            </div>

                            <div class="mb-3">
                                <label for="price" class="form-label">Price</label>
                                <input type="text" class="form-control" id="price" name="price" value="${vehicle.price}" readonly required>
                            </div>

                            <!-- Personal Information -->
                            <div class="mb-3">
                                <label for="customerName" class="form-label">Your Name</label>
                                <input type="text" class="form-control" id="customerName" name="customerName" required>
                            </div>

                            <div class="mb-3">
                                <label for="contact" class="form-label">Contact Number</label>
                                <input type="text" class="form-control" id="contact" name="contact" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>

                            <!-- Booking Dates -->
                            <div class="mb-3">
                                <label for="pickupDate" class="form-label">Pickup Date</label>
                                <input type="date" class="form-control" id="pickupDate" name="pickupDate" required>
                            </div>

                            <div class="mb-3">
                                <label for="returnDate" class="form-label">Return Date</label>
                                <input type="date" class="form-control" id="returnDate" name="returnDate" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="Bookingprice" class="form-label">Total Price</label>
                                <input type="text" class="form-control" id="Bookingprice" name="Bookingprice" readonly>
                            </div>

                            <!-- Submit Button -->
                            <button type="submit" class="btn btn-primary w-100">Confirm Booking</button>
                        </form>
                    </c:if>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer Section -->
    <footer class="footer bg-dark text-white text-center mt-5 p-4">
        <p>&copy; 2024 Vehicle Booking. All Rights Reserved.</p>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>

    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>

    <script>
        // Initialize Swiper
        var swiper = new Swiper('.mySwiper', {
            spaceBetween: 10,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });

        // Function to calculate the total booking price
        document.getElementById("returnDate").addEventListener("change", calculateBookingPrice);
        document.getElementById("pickupDate").addEventListener("change", calculateBookingPrice);

        function calculateBookingPrice() {
            var pickupDate = document.getElementById("pickupDate").value;
            var returnDate = document.getElementById("returnDate").value;
            var price = parseFloat(document.getElementById("price").value);
            
            if (pickupDate && returnDate && price) {
                var pickup = new Date(pickupDate);
                var returnDateObj = new Date(returnDate);
                var timeDifference = returnDateObj - pickup;
                var daysDifference = timeDifference / (1000 * 3600 * 24); // Convert time difference to days

                if (daysDifference >= 0) {
                    var totalPrice = daysDifference * price;  // Multiply by daily rental price
                    document.getElementById("Bookingprice").value = totalPrice.toFixed(2);  // Set the total price
                } else {
                    alert("Return date must be after the pickup date.");
                }
            }
        }
    </script>

</body>
</html>
