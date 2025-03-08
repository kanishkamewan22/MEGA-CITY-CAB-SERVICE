package servlet;

import service.VehicleService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

/**
 * Servlet implementation class DeleteVehicleServlet
 */
@WebServlet("/deleteVehicle")
public class DeleteVehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get vehicleId from the form
        String vehicleIdStr = request.getParameter("vehicleid");

        if (vehicleIdStr != null && !vehicleIdStr.isEmpty()) {
            try {
                int vehicleId = Integer.parseInt(vehicleIdStr);

                // Call the VehicleService to delete the vehicle
                VehicleService vehicleService = new VehicleService();
                boolean success = vehicleService.deleteVehicle(vehicleId);

                // If deletion is successful, redirect to the admin page
                if (success) {
                    response.sendRedirect("http://localhost:8090/city_cabs/admin"); // Redirect to the admin page
                } else {
                    request.setAttribute("error", "Failed to delete vehicle.");
                    request.getRequestDispatcher("/delete.jsp").forward(request, response); // Forward to error page if failure
                }

            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid vehicle ID format.");
                request.getRequestDispatcher("/delete.jsp").forward(request, response); // Forward to error page on invalid ID format
            }
        } else {
            request.setAttribute("error", "Vehicle ID is missing.");
            request.getRequestDispatcher("/delete.jsp").forward(request, response); // Forward to error page if no vehicle ID
        }
    }
}
