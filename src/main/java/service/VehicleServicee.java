package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import contoller.database;
import model.Vehiclee;

public class VehicleServicee {
	
	

    public boolean registerVehicle(Vehiclee vehicle) {
        String query = "INSERT INTO vehicles (vehicleName, vehicleModel, vehicleType, fuelType, modelYear, engineSize, price, vehiclePhoto, vehiclePhototwo) "
                     + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = database.getcon(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, vehicle.getVehicleName());
            ps.setString(2, vehicle.getVehicleModel());
            ps.setString(3, vehicle.getVehicleType());
            ps.setString(4, vehicle.getFuelType());
            ps.setInt(5, vehicle.getModelYear());
            ps.setString(6, vehicle.getEngineSize());
            ps.setDouble(7, vehicle.getPrice());
            ps.setBytes(8, vehicle.getVehiclePhoto()); 
            ps.setBytes(9, vehicle.getVehiclePhototwo());

            int rowsAffected = ps.executeUpdate();

            // Check if any rows were affected (i.e., the insert was successful)
            return rowsAffected > 0;

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();  // Print the exception to the console for debugging
            return false;  // Return false if any exception occurs
        }
    }
}
