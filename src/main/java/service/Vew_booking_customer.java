package service;
import model.VehicleBooking;
import java.sql.*;
import contoller.database;
import java.util.ArrayList;
import java.util.List;


public class Vew_booking_customer {


	    // Method to fetch vehicle bookings based on a specific email
	    public List<VehicleBooking> getBookingsByEmail(String email) {
	        List<VehicleBooking> bookings = new ArrayList<>();
	        String query = "SELECT * FROM vehicle_booking WHERE email = ?"; // Query to fetch bookings based on email

	        try (Connection con = database.getcon(); 
	             PreparedStatement ps = con.prepareStatement(query)) {
	            // Set the email parameter in the query
	            ps.setString(1, email);
	            
	            // Execute the query and process the result
	            try (ResultSet rs = ps.executeQuery()) {
	                while (rs.next()) {
	                    VehicleBooking booking = new VehicleBooking();
	                    booking.setBookingId(rs.getInt("booking_id"));
	                    booking.setVehicleId(rs.getInt("vehicle_id"));
	                    booking.setVehicleName(rs.getString("vehicle_name"));
	                    booking.setVehicleModel(rs.getString("vehicle_model"));
	                    booking.setCustomerName(rs.getString("customer_name"));
	                    booking.setEmail(rs.getString("email"));
	                    booking.setContactNumber(rs.getString("contact_number"));
	                    booking.setPickupDate(rs.getDate("pickup_date"));
	                    booking.setReturnDate(rs.getDate("return_date"));
	                    booking.setBookingPrice(rs.getDouble("booking_price"));
	                    bookings.add(booking);
	                }
	            }

	        } catch (SQLException | ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	        return bookings;
	    }
	    
	    public boolean cancelBooking(int bookingId) {
	        String query = "DELETE FROM vehicle_booking WHERE booking_id = ?"; // SQL query to delete booking based on booking ID

	        try (Connection con = database.getcon(); 
	             PreparedStatement ps = con.prepareStatement(query)) {

	            ps.setInt(1, bookingId); // Set the booking ID parameter

	            int rowsAffected = ps.executeUpdate(); // Execute the query to delete the booking

	            return rowsAffected > 0; // If rows are deleted, return true (successful cancellation)
	        } catch (SQLException | ClassNotFoundException e) {
	            e.printStackTrace();
	            return false; // If an error occurs, return false
	        }
	    }
	}

