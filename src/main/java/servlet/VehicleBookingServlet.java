package servlet;

import service.VehicleBookingService;
import model.VehicleBooking;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

@WebServlet("/submitBooking")
public class VehicleBookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Handle POST request for submitting the booking
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            // Get form parameters from the request
            int vehicleId = Integer.parseInt(request.getParameter("vehicleid"));
            String vehicleName = request.getParameter("vehicleName");
            String vehicleModel = request.getParameter("vehicleModel");
            String customerName = request.getParameter("customerName");
            String email = request.getParameter("email");
            String contactNumber = request.getParameter("contact");
            Date pickupDate = Date.valueOf(request.getParameter("pickupDate"));
            Date returnDate = Date.valueOf(request.getParameter("returnDate"));
            double bookingPrice = Double.parseDouble(request.getParameter("Bookingprice"));

            // Create a VehicleBooking object with the data
            VehicleBooking booking = new VehicleBooking();
            booking.setVehicleId(vehicleId);
            booking.setVehicleName(vehicleName);
            booking.setVehicleModel(vehicleModel);
            booking.setCustomerName(customerName);
            booking.setEmail(email);
            booking.setContactNumber(contactNumber);
            booking.setPickupDate(pickupDate);
            booking.setReturnDate(returnDate);
            booking.setBookingPrice(bookingPrice);

            // Call the service to add the booking to the database
            VehicleBookingService bookingService = new VehicleBookingService();
            boolean isBookingSuccess = bookingService.addBooking(booking);

            // Check if the booking was successful
            if (isBookingSuccess) {
                // Redirect to a confirmation page
                request.setAttribute("message", "Booking Successful!");
                request.getRequestDispatcher("/booking.jsp").forward(request, response);
            } else {
                // If there was an error, show an error message
                request.setAttribute("error", "Booking Failed. Please try again.");
                request.getRequestDispatcher("/booking.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exception (e.g., invalid input)
            request.setAttribute("error", "There was an error processing your booking.");
            request.getRequestDispatcher("/booking.jsp").forward(request, response);
        }
    }
    
    
    
}
