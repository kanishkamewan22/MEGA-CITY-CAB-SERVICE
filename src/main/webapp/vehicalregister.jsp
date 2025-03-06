<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vehicle Registration</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #f0f0f0, #d9e2ec);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            display: flex;
            max-width: 900px;
            width: 100%;
            height: 105%;
        }

        .form-container {
            flex: 1;
            max-width: 400px;
            background-color: #831936;
            padding: 40px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
            text-align: center;
            height: 140vh;
        }

        h2 {
            margin-bottom: 25px;
            font-size: 26px;
            font-weight: 500;
            color: #fff;
        }

        .image-container {
            flex: 1;
            background-image: url('image/s4.jpg');
            background-size: cover;
            background-position: center;
            border-radius: 12px 0 0 12px;
            height: 140vh;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-bottom: 8px;
            text-align: left;
            font-size: 14px;
            color: #fff;
            font-weight: bold;
        }

        input[type="text"], input[type="number"], input[type="file"], select {
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 16px;
            width: 100%;
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        .btn-custom {
            padding: 12px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            font-size: 16px;
        }

        .btn-custom:hover {
            background-color: #218838;
            color: white;
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

        @media (max-width: 480px) {
            .form-container {
                padding: 30px 20px;
                height: 250px;
            }
            .container {
                flex-direction: column;
            }
            .image-container {
                height: 250px;
                border-radius: 12px 12px 0 0;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <div class="image-container"></div>
    <div class="form-container">
        <h2>Register New Vehicle</h2>
      <form method="post" action="vehicleRegistration" enctype="multipart/form-data">
       
       
           <p class="error-message" style="color: red;">
                    <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
                </p>

                <!-- Display success message if any -->
                <p class="success-message" style="color: green;">
                    <%= request.getAttribute("message") != null ? request.getAttribute("message") : "" %>
                </p>  

            <div id="message" class="message"></div>

            <label for="vehicleName">Vehicle Name:</label>
            <input type="text" id="vehicleName" name="vehicleName" class="form-control" required />

            <label for="vehiclemodel">Vehicle Model:</label>
            <input type="text" id="vehiclemodel" name="vehiclemodel" class="form-control" required />

            <label for="vehicleType">Vehicle Type:</label>
            <select id="vehicleType" name="vehicleType" class="form-control" required>
                <option value="Car">Car</option>
                <option value="Truck">Truck</option>
                <option value="Motorcycle">Motorcycle</option>
                <option value="Bus">Bus</option>
            </select>

            <label for="Fueltype">Fuel Type:</label>
            <select id="Fueltype" name="Fueltype" class="form-control" required>
                <option value="petrol">Petrol</option>
                <option value="diesel">Diesel</option>
                <option value="Hybrid">Hybrid</option>
                <option value="Other">Other</option>
            </select>

            <label for="modelYear">Model Year:</label>
            <input type="text" id="modelYear" name="modelYear" class="form-control" min="1900" max="2100" required />

            <label for="engineSize">Engine Size:</label>
            <input type="text" id="engineSize" name="engineSize" class="form-control" required />

            <label for="price">Price:</label>
            <input type="text" id="price" name="price" class="form-control" min="0" required />

     <label for="vehiclePhoto">Vehicle Photo:</label>
     <input type="file" id="vehiclePhoto" name="vehiclePhoto" class="form-control" required />


            <label for="vehiclePhototwo">Vehicle Photo Two:</label>
            <input type="file" id="vehiclePhototwo" name="vehiclePhototwo" class="form-control" required />

            <button type="submit" class="btn-custom">Register Vehicle</button>
        </form>
    </div>
</div>

<script>
    document.getElementById("vehicleForm").addEventListener("submit", function(event) {
        event.preventDefault(); // Prevent the default form submission

        // Get form values
        const vehicleName = document.getElementById("vehicleName").value;
        const vehicleType = document.getElementById("vehicleType").value;
        const modelYear = document.getElementById("modelYear").value;
        const engineSize = document.getElementById("engineSize").value;
        const price = document.getElementById("price").value;

        // Validate the form fields
        if (!vehicleName || !vehicleType || !modelYear || !engineSize || !price) {
            document.getElementById("message").textContent = "Please fill in all fields.";
            return; // Stop submission if validation fails
        }

        // Validate that Model Year and Price are numbers
        if (isNaN(modelYear) || isNaN(price)) {
            document.getElementById("message").textContent = "Invalid input for Model Year or Price. Please provide valid numbers.";
            document.getElementById("message").style.color = "red";
            return; // Stop submission if invalid numbers
        }

        // If form is valid, submit the form and clear any previous error messages
        document.getElementById("message").textContent = "";  // Clear the error message
        this.submit();  // Submit the form programmatically
    });
</script>

</body>
</html>
