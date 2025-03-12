package servlet;

import service.Vew_booking_customer;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/cancelBooking")
public class CancelBookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Handle POST request to cancel a booking
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId")); // Retrieve booking ID from the request

        // Create the CancelBookingService object
        Vew_booking_customer cancelBookingService = new Vew_booking_customer();

        // Call the cancelBooking method with the booking ID
        boolean isCancelled = cancelBookingService.cancelBooking(bookingId);

        // Set the result message based on the cancellation status
        if (isCancelled) {
            request.setAttribute("message", "Booking cancelled successfully!"); // Success message
        } else {
            request.setAttribute("error", "Failed to cancel booking."); // Error message
        }

        // Forward the request to the JSP page to show the result
        request.getRequestDispatcher("/customerBookingView.jsp").forward(request, response);
    }
}
