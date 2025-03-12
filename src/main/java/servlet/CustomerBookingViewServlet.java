package servlet;

import service.Vew_booking_customer;
import model.VehicleBooking;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/viewBookingsByEmail") // Map this servlet to a specific URL
public class CustomerBookingViewServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Handle GET request to view bookings based on customer email
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve email from the session
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");

        // Check if the email exists in session
        if (email == null || email.isEmpty()) {
          
            request.getRequestDispatcher("/customerBookingView.jsp").forward(request, response);
            return;
        }

        // Fetch vehicle bookings based on the email
        Vew_booking_customer bookingService = new Vew_booking_customer();
        List<VehicleBooking> bookings = bookingService.getBookingsByEmail(email);

        // Set the bookings list and email as an attribute in the request
        request.setAttribute("bookings", bookings);
        request.setAttribute("email", email); // Email stored in session to be displayed

        // Forward the request to the JSP page to display the bookings
        request.getRequestDispatcher("/customerBookingView.jsp").forward(request, response);
    }
}
