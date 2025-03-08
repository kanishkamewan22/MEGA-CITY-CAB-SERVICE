package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;

import contoller.database;
import model.Vehicle;

public class VehicleService {

    // Method to get all vehicles
    public List<Vehicle> getAllVehicles() {
        List<Vehicle> vehicles = new ArrayList<>();
        String query = "SELECT * FROM vehicles";  // SQL query to fetch all vehicles

        try (Connection con = database.getcon();
             PreparedStatement pstmt = con.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {
            
            // Loop through the result set and create Vehicle objects
            while (rs.next()) {
                // Retrieve image as InputStream (for BLOB data)
                InputStream vehiclePhoto = rs.getBinaryStream("vehiclePhoto");
                InputStream vehiclePhototwo = rs.getBinaryStream("vehiclePhototwo");

                // Create Vehicle object with the retrieved data
                Vehicle vehicle = new Vehicle(
                    rs.getInt("id"),
                    rs.getString("vehicleName"),
                    rs.getString("vehicleModel"),
                    rs.getString("vehicleType"),
                    rs.getString("fuelType"),
                    rs.getInt("modelYear"),
                    rs.getString("engineSize"),
                    rs.getDouble("price"),
                    vehiclePhoto,
                    vehiclePhototwo
                    
                );
                vehicles.add(vehicle);
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return vehicles;
    }

    // Method to get a single vehicle by ID
    public Vehicle getVehicleById(int vehicleId) {
        Vehicle vehicle = null;
        String query = "SELECT * FROM vehicles WHERE id = ?";  // SQL query to fetch a specific vehicle by ID

        try (Connection con = database.getcon();
             PreparedStatement pstmt = con.prepareStatement(query)) {
            
            pstmt.setInt(1, vehicleId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                System.out.println("Vehicle found: " + rs.getString("vehicleName"));  // Log to check if vehicle data is fetched

                InputStream vehiclePhoto = rs.getBinaryStream("vehiclePhoto");
                InputStream vehiclePhototwo = rs.getBinaryStream("vehiclePhototwo");

                vehicle = new Vehicle(
                    rs.getInt("id"),
                    rs.getString("vehicleName"),
                    rs.getString("vehicleModel"),
                    rs.getString("vehicleType"),
                    rs.getString("fuelType"),
                    rs.getInt("modelYear"),
                    rs.getString("engineSize"),
                    rs.getDouble("price"),
                    vehiclePhoto,
                    vehiclePhototwo
                    
                );
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return vehicle;
    }

public boolean updateVehicle(Vehicle vehicle) {
    String query = "UPDATE vehicles SET vehicleName = ?, vehicleModel = ?, vehicleType = ?, fuelType = ?, "
                 + "modelYear = ?, engineSize = ?, price = ?, vehiclePhoto = ?, vehiclePhototwo = ? WHERE id = ?";

    try (Connection con = database.getcon(); PreparedStatement ps = con.prepareStatement(query)) {
        // Set the updated values for the vehicle details
        ps.setString(1, vehicle.getVehicleName());
        ps.setString(2, vehicle.getVehicleModel());
        ps.setString(3, vehicle.getVehicleType());
        ps.setString(4, vehicle.getFuelType());
        ps.setInt(5, vehicle.getModelYear());
        ps.setString(6, vehicle.getEngineSize());
        ps.setDouble(7, vehicle.getPrice());

        // Handle image upload as InputStream (Main image)
        if (vehicle.getVehiclePhoto() != null) {
            ps.setBytes(8, convertInputStreamToBytes(vehicle.getVehiclePhoto())); // vehicle photo
        } else {
            ps.setNull(8, java.sql.Types.BLOB); // Set NULL if no photo
        }

        // Handle second vehicle photo (secondary image)
        if (vehicle.getvehiclePhototwo() != null) {
            ps.setBytes(9, convertInputStreamToBytes(vehicle.getvehiclePhototwo())); // second vehicle photo
        } else {
            ps.setNull(9, java.sql.Types.BLOB); // Set NULL if no second image
        }

        // Set the vehicle ID to update the right record (last parameter)
        ps.setInt(10, vehicle.getId()); // Correct index for vehicle ID

        // Debugging: Log the query execution
        System.out.println("Executing update query: " + ps.toString());

        int rowsAffected = ps.executeUpdate(); // Execute the update query
        return rowsAffected > 0; // Return true if the update is successful

    } catch (SQLException | IOException e) {
        e.printStackTrace(); // Print full stack trace for debugging
        return false; // Return false if there was an error
    } catch (ClassNotFoundException e) {
        e.printStackTrace(); // Print full stack trace for debugging
        return false;
    }
}

// Helper method to convert InputStream to byte[]
private byte[] convertInputStreamToBytes(InputStream inputStream) throws IOException {
    if (inputStream == null) {
        return null; // Return null if InputStream is null
    }

    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
    byte[] buffer = new byte[1024];
    int length;

    while ((length = inputStream.read(buffer)) != -1) {
        byteArrayOutputStream.write(buffer, 0, length);
    }
    return byteArrayOutputStream.toByteArray(); // Return the byte array
}

public boolean deleteVehicle(int vehicleId) {
    String query = "DELETE FROM vehicles WHERE id = ?";
    
    try (Connection con = database.getcon();
         PreparedStatement pstmt = con.prepareStatement(query)) {
        pstmt.setInt(1, vehicleId);

        // Execute the delete query
        int result = pstmt.executeUpdate();
        return result > 0;
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        return false;
    }
}
}