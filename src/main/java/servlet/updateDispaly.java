package servlet;

import service.VehicleService;
import model.Vehicle;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/updat")
public class updateDispaly extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // GET method to fetch vehicle details
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String vehicleIdStr = request.getParameter("vehicleid");

        if (vehicleIdStr != null && !vehicleIdStr.isEmpty()) {
            try {
                int vehicleId = Integer.parseInt(vehicleIdStr);

                // Set the vehicleId in the session (this can be useful for later updates or bookings)
                HttpSession session = request.getSession();
                session.setAttribute("vehicleid", vehicleId); // Store vehicle ID in session

                VehicleService vehicleService = new VehicleService();
                Vehicle vehicle = vehicleService.getVehicleById(vehicleId);

                if (vehicle != null) {
                    // If vehicle is found, forward to update page with vehicle data
                    request.setAttribute("vehicle", vehicle);
                    request.getRequestDispatcher("/update.jsp").forward(request, response);
                } else {
                    // If vehicle is not found
                    request.setAttribute("error", "Vehicle not found.");
                    request.getRequestDispatcher("/update.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                // Handle invalid vehicleId format
                request.setAttribute("error", "Invalid vehicle ID format.");
                request.getRequestDispatcher("/update.jsp").forward(request, response);
            }
        } else {
            // If vehicle ID is missing
            request.setAttribute("error", "Vehicle ID is missing.");
            request.getRequestDispatcher("/update.jsp").forward(request, response);
        }
    }
}
