
	package servlet;

	
    import service.VehicleBookingViewService;
	import model.VehicleBooking;

	import javax.servlet.*;
	import javax.servlet.annotation.*;
	import javax.servlet.http.*;
	import java.io.IOException;
	import java.util.List;

	@WebServlet("/viewBookings")
	public class VehicleBookingViewServlet extends HttpServlet {

	    private static final long serialVersionUID = 1L;

	    // Handle GET request to view bookings
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        // Fetch all vehicle bookings from the database
	    	VehicleBookingViewService bookingService = new VehicleBookingViewService();
	        List<VehicleBooking> bookings = bookingService.getAllBookings();

	        // Set bookings as a request attribute and forward the request to the JSP page
	        request.setAttribute("bookings", bookings);
	        request.getRequestDispatcher("/viewBookings.jsp").forward(request, response);
	    }
	}
