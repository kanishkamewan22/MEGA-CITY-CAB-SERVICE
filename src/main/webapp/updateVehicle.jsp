<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Vehicle</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

    <div class="container mt-5">
        <h2>Update Vehicle Details</h2>

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

        <!-- Form to update vehicle details -->
        <form method="post" action="updateVehicle">
            <div class="mb-3">
                <label for="vehicleid" class="form-label">Vehicle ID</label>
                <input type="text" class="form-control" id="vehicleid" name="vehicleid" value="${vehicle.id}" readonly>
            </div>

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

</body>
</html>
