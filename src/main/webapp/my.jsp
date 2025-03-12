<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CarBook - Rent A Car</title>

    <!-- Bootstrap & Swiper CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background: rgba(0, 0, 0, 0.4); 
        }

        /* Fully Transparent Navbar */
        .navbar {
            position: fixed;
            width: 100%;
            z-index: 1000;
            background: transparent !important; /* Fully transparent */
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

        /* Hero Section with Full-Screen Swiper */
        .hero-section {
            position: relative;
            height: 100vh;
            width: 100%;
        }
        .swiper {
            width: 100%;
            height: 100vh;
        }
        .swiper-slide {
            background-position: center;
            background-size: cover;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
            position: relative;
        }
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);/* Dark overlay */
        }
        .hero-content {
            position: relative;
            z-index: 2;
        }
        .hero-content h1 {
            font-size: 48px;
            font-weight: bold;
        }
        .hero-content p {
            font-size: 18px;
        }
        
        .testimonial img {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            margin-bottom: 20px;
        }
        
        .checked {
                   color: orange;
                  }
                  
                  
                  
        .services-section {
            background-color: #f9f9f9;
            padding: 60px 0;
        }

        .service-card {
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 30px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.3s ease;
        }

        .service-card:hover {
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .service-icon {
            font-size: 40px;
            color: #0d6efd;
        }

        .service-card h3 {
            font-size: 24px;
            font-weight: bold;
            margin-top: 20px;
        }

        .service-card p {
            font-size: 18px;
            margin-top: 10px;
        }
        
         .about-us-section {
            background: url('image/s11.jpg') no-repeat center center/cover; /* Replace with your image path */
            background-size: cover;
    
            height: 100vh;
            position: relative;
            color: white;
        }

        /* Overlay for text visibility */
        .overlay {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.4); /* Dark transparent overlay */
        }

        .about-text {
            font-size: 18px;
            line-height: 1.8;
            color: #ffffff;
            font-weight: bold;
        }

        .team-member {
            text-align: center;
            margin-top: 40px;
        }

        .team-member img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
            margin-bottom: 20px;
        }

        .team-member h4 {
            margin-top: 10px;
            font-size: 20px;
            font-weight: bold;
        }

        .team-member p {
            font-size: 16px;
            color: #000000;
        }

        .card {
            border: none;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .card:hover {
            transform: translateY(-10px);
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
                    <li class="nav-item"><a class="nav-link" href="my.jsp"><i class="fas fa-home"></i> Home</a></li>

                    <li class="nav-item"><a class="nav-link" href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                    <li class="nav-item"><a class="nav-link" href="signup.jsp"><i class="fas fa-user-plus"></i> Register</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section with Swiper -->
    <div class="hero-section">
        <div class="swiper mySwiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide" style="background-image: url('image/s4.jpg');">
                    <div class="overlay"></div>
                    <div class="hero-content">
                        <h1 class="fw-bold">Fast & Easy Way To Rent A Car</h1>
                        <p>Drive your dream car today with hassle-free booking.</p>
                        
                        
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                         <span class="fa fa-star checked"></span>
                         <span class="fa fa-star"></span>
                          <span class="fa fa-star"></span>
                    </div>
                </div>
                <div class="swiper-slide" style="background-image: url('image/s9.jpg');">
                    <div class="overlay"></div>
                    <div class="hero-content">
                        <h1 class="fw-bold">Find the Best Deals</h1>
                        <p>Affordable rental prices with premium quality service.</p>
                        
                        
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        
                    </div>
                </div>
                <div class="swiper-slide" style="background-image: url('image/s6.jpg');">
                    <div class="overlay"></div>
                    <div class="hero-content">
                        <h1 class="fw-bold">Luxury & Comfort</h1>
                        <p>Choose from a wide range of top-brand vehicles.</p>
                        
                        
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                    </div>
                </div>
            </div>
            <!-- Navigation buttons -->
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div>
    </div>

    <!-- Happy Clients Testimonial Section -->
    <div class="container">
        <div class="testimonial"><br><br><br><br><br>
            <h2 class="text-center mb-5">Happy Clients</h2>
            <div class="swiper testimonialSwiper">
                <div class="swiper-wrapper">
                    <!-- Testimonial 1 -->
                    <div class="swiper-slide">
                        <div class="card">
                            <div class="card-body">
                                <img src='image/s4.jpg' alt="Client" class="rounded-circle">
                                <p class="card-text">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                <h5 class="card-title">Roger Scott</h5>
                                <p class="card-text">System Analyst</p>
                                                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                         <span class="fa fa-star checked"></span>
                         <span class="fa fa-star"></span>
                          <span class="fa fa-star"></span>
                            </div>
                        </div>
                    </div>
                    <!-- Testimonial 2 -->
                    <div class="swiper-slide">
                        <div class="card">
                            <div class="card-body">
                                <img src='image/s1.jpg' alt="Client" class="rounded-circle">
                                <p class="card-text">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                <h5 class="card-title">Roger Scott</h5>
                                <p class="card-text">Marketing Manager</p>
                                                        <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                         <span class="fa fa-star checked"></span>
                         <span class="fa fa-star"></span>
                          <span class="fa fa-star"></span>
                            </div>
                        </div>
                    </div>
                    <!-- Testimonial 3 -->
                    <div class="swiper-slide">
                        <div class="card">
                            <div class="card-body">
                                <img src='image/s8.jpg' alt="Client" class="rounded-circle">
                                <p class="card-text">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                                <h5 class="card-title">Roger Scott</h5>
                                <p class="card-text">Interface Designer</p>
                         <span class="fa fa-star checked"></span>
                        <span class="fa fa-star checked"></span>
                         <span class="fa fa-star checked"></span>
                         <span class="fa fa-star"></span>
                          <span class="fa fa-star"></span>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Add Pagination -->
                <div class="swiper-pagination"></div>
                <!-- Add Navigation -->
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div>
        </div>
    </div>
    
        <!-- About Us Section -->
    <div class="about-us-section">
        <!-- Overlay to darken background -->
        <div class="overlay"></div>

        <div class="container"><br><br><br><br><br><br>
            <h2 class="text-center mb-5">About Us</h2>

            <div class="row">
                <!-- About Text -->
                <div class="col-md-6">
                    <h3 class="fw-bold">Welcome to CarBook</h3>
                    <p class="about-text">A small river named Duden flows by their place and supplies it with necessary regalia. It is a paradisiac country, in which roasted parts of sentences fly into your mouth. On her way, she met a copy. The copy warned the Little Blind Text, that where it came from, it would have been rewritten a thousand times and everything that was left from its origin would be the word "and" and the Little Blind Text should turn around and return to its own, safe country. A small river named Duden flows by their place and supplies it with the necessary regalia. It is a paradisiac country, in which roasted parts of sentences fly into your mouth.</p>
                </div>

                <!-- Team Members -->
                <div class="col-md-6">
                    <h3 class="fw-bold">Our Team</h3>
                    <div class="row">
                        <!-- Team Member 1 -->
                        <div class="col-md-4 team-member">
                            <div class="card">
                                <img src="image/s4.jpg" alt="Team Member">
                                <div class="card-body">
                                    <h4>John Doe</h4>
                                    <p>CEO & Founder</p>
                                </div>
                            </div>
                        </div>
                        <!-- Team Member 2 -->
                        <div class="col-md-4 team-member">
                            <div class="card">
                                <img src="image/s4.jpg" alt="Team Member">
                                <div class="card-body">
                                    <h4>Jane Smith</h4>
                                    <p>Co-Founder & CTO</p>
                                </div>
                            </div>
                        </div>
                        <!-- Team Member 3 -->
                        <div class="col-md-4 team-member">
                            <div class="card">
                                <img src="image/s4.jpg" alt="Team Member">
                                <div class="card-body">
                                    <h4>Mark Wilson</h4>
                                    <p>Operations Manager</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    

    
      <div class="services-section">
        <div class="container">
            <h2 class="text-center mb-5">Our Services</h2>
            <div class="row">
                <!-- Service 1 -->
                <div class="col-md-4">
                    <div class="service-card">
                        <div class="service-icon text-center">
                            <i class="fas fa-car"></i>
                        </div>
                        <h3 class="text-center">Car Rentals</h3>
                        <p class="text-center">Rent cars of all models and brands. Affordable prices and easy booking process for your convenience.</p>
                    </div>
                </div>
                <!-- Service 2 -->
                <div class="col-md-4">
                    <div class="service-card">
                        <div class="service-icon text-center">
                            <i class="fas fa-tools"></i>
                        </div>
                        <h3 class="text-center">Car Maintenance</h3>
                        <p class="text-center">We provide regular car maintenance services including oil change, tire replacement, and much more.</p>
                    </div>
                </div>
                <!-- Service 3 -->
                <div class="col-md-4">
                    <div class="service-card">
                        <div class="service-icon text-center">
                            <i class="fas fa-map-signs"></i>
                        </div>
                        <h3 class="text-center">Travel Assistance</h3>
                        <p class="text-center">We provide travel assistance services, including routes, parking information, and helpful tips for a smooth trip.</p>
                    </div>
                </div>
            </div>
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
    
   
    

    <!-- Bootstrap & Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

    <script>
        // Initialize Swiper for Hero Section
        var swiperHero = new Swiper('.mySwiper', {
            spaceBetween: 0,
            centeredSlides: true,
            loop: true,
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });

        // Initialize Swiper for Testimonials
        var swiperTestimonial = new Swiper('.testimonialSwiper', {
            spaceBetween: 0,
            centeredSlides: true,
            loop: true,
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            },
            
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
        });

        // Change navbar background on scroll
        window.addEventListener("scroll", function () {
            var navbar = document.querySelector(".navbar");
            if (window.scrollY > 50) {
                navbar.classList.add("scrolled");
            } else {
                navbar.classList.remove("scrolled");
            }
        });
    </script>

</body>
</html>
