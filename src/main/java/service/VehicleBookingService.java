package service;

import model.VehicleBooking;
import java.sql.*;
import contoller.database;

public class VehicleBookingService {

    // Method to add a booking to the database
    public boolean addBooking(VehicleBooking booking) {
        String query = "INSERT INTO vehicle_booking (vehicle_id, vehicle_name, vehicle_model, customer_name, email, contact_number, pickup_date, return_date, booking_price) "
                     + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = database.getcon(); PreparedStatement ps = con.prepareStatement(query)) {
            // Set the values in the query
            ps.setInt(1, booking.getVehicleId());
            ps.setString(2, booking.getVehicleName());
            ps.setString(3, booking.getVehicleModel());
            ps.setString(4, booking.getCustomerName());
            ps.setString(5, booking.getEmail());
            ps.setString(6, booking.getContactNumber());
            ps.setDate(7, new java.sql.Date(booking.getPickupDate().getTime())); // Convert java.util.Date to java.sql.Date
            ps.setDate(8, new java.sql.Date(booking.getReturnDate().getTime()));  // Convert java.util.Date to java.sql.Date
            ps.setDouble(9, booking.getBookingPrice());

            // Execute the update query
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;  // Return true if booking was successfully added

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Print the exception to the console for debugging
            return false;  // Return false if any exception occurs
        }}
    
    
        public boolean deleteBooking(int bookingId) {
            String query = "DELETE FROM vehicle_booking WHERE booking_id = ?";
            
            try (Connection con = database.getcon(); PreparedStatement ps = con.prepareStatement(query)) {
                ps.setInt(1, bookingId);
                
                // Execute the delete query
                int rowsAffected = ps.executeUpdate();
                return rowsAffected > 0;  // Return true if booking was deleted

            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
                return false;  // Return false if there was an error
            }
        }
    
}
