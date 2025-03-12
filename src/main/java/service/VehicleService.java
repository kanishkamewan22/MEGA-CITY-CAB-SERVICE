package service;

import java.sql.Connection;
import java.sql.DriverManager;
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
        boolean isUpdated = false;
        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            // Get the connection with correct credentials and database name
            String url = "jdbc:mysql://localhost:3306/user"; // Replace 'user' with your actual database name
            String username = "root"; // Use your MySQL username (root in your case)
            String password = "admin"; // Use your MySQL password (admin in your case)
            
            connection = DriverManager.getConnection(url, username, password);

            // Define the SQL update query
            String query = "UPDATE vehicles SET vehicleName = ?, vehicleModel = ?, vehicleType = ?, fuelType = ?, price = ?, modelYear = ?, engineSize = ?, vehiclePhoto = ?, vehiclePhototwo = ? WHERE id = ?";
            stmt = connection.prepareStatement(query);

            // Set the values in the query using the Vehicle object data
            stmt.setString(1, vehicle.getVehicleName());
            stmt.setString(2, vehicle.getVehicleModel());
            stmt.setString(3, vehicle.getVehicleType());
            stmt.setString(4, vehicle.getFuelType());
            stmt.setDouble(5, vehicle.getPrice());
            stmt.setInt(6, vehicle.getModelYear());
            stmt.setString(7, vehicle.getEngineSize());
            stmt.setBlob(8, vehicle.getVehiclePhoto());
            stmt.setBlob(9, vehicle.getvehiclePhototwo());
            stmt.setInt(10, vehicle.getId());

            // Execute the update query
            int rowsUpdated = stmt.executeUpdate();

            // Check if any rows were updated
            if (rowsUpdated > 0) {
                isUpdated = true;
            } else {
                System.out.println("No rows updated.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Always close resources in finally block
            try {
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return isUpdated;
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