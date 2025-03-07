
package service;

import model.VehicleBooking;
import java.sql.*;
import contoller.database;
import java.util.ArrayList;
import java.util.List;

public class VehicleBookingViewService {

    // Method to fetch all vehicle bookings from the database
    public List<VehicleBooking> getAllBookings() {
        List<VehicleBooking> bookings = new ArrayList<>();
        String query = "SELECT * FROM vehicle_booking"; // Query to fetch all bookings

        try (Connection con = database.getcon(); 
             PreparedStatement ps = con.prepareStatement(query); 
             ResultSet rs = ps.executeQuery()) {

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

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return bookings;
    }
}
