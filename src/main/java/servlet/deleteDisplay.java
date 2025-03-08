package servlet;

import model.Vehicle;
import service.VehicleService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/delete")  // Correct URL mapping for the servlet
public class deleteDisplay extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public deleteDisplay() {
        super();
    }

    // Method to fetch vehicle details and forward to JSP
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve the vehicleId from the URL
        String vehicleIdStr = request.getParameter("vehicleid");

        if (vehicleIdStr != null && !vehicleIdStr.isEmpty()) {
            try {
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

            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid vehicle ID format.");
            }
        } else {
            request.setAttribute("error", "Vehicle ID is missing.");
        }

        // Forward the request to the delete.jsp page
        request.getRequestDispatcher("/delete.jsp").forward(request, response);
    }
}
