package servlet;

import model.Vehicle;
import service.VehicleService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/booking")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public BookingServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve the vehicleId from the URL
        String vehicleIdStr = request.getParameter("vehicleId");
        
        if (vehicleIdStr != null) {
            int vehicleId = Integer.parseInt(vehicleIdStr);
            
            // Fetch the vehicle details from the database
            VehicleService vehicleService = new VehicleService();
            Vehicle vehicle = vehicleService.getVehicleById(vehicleId);
            
            // If vehicle is found, set it as a request attribute
            if (vehicle != null) {
                request.setAttribute("vehicle", vehicle);
            } else {
                request.setAttribute("error", "Vehicle not found.");
            }
        }

        // Forward the request to the booking.jsp page
        request.getRequestDispatcher("/booking.jsp").forward(request, response);
    }
}
