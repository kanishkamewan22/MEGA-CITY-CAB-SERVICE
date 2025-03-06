package servlet;

import service.VehicleService;
import service.vehicleee;
import model.Vehicle;
import model.Vehicleupdate;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/updateVehicle")
public class UpdateVehicleServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Collect form data
        String vehicleIdStr = request.getParameter("vehicleid");
        if (vehicleIdStr == null || vehicleIdStr.isEmpty()) {
            request.setAttribute("error", "Vehicle ID is required.");
            request.getRequestDispatcher("/updateVehicle.jsp").forward(request, response);
            return;
        }
        
        int vehicleId = Integer.parseInt(vehicleIdStr);
        String vehicleName = request.getParameter("vehicleName");
        String vehicleModel = request.getParameter("vehicleModel");
        String vehicleType = request.getParameter("vehicleType");
        String fuelType = request.getParameter("fuelType");
        int modelYear = Integer.parseInt(request.getParameter("modelYear"));
        String engineSize = request.getParameter("engineSize");
        double price = Double.parseDouble(request.getParameter("price"));

        // Get vehicle photos (if available)
        InputStream vehiclePhoto = request.getPart("photo") != null ? request.getPart("photo").getInputStream() : null;
        InputStream vehiclePhototwo = request.getPart("phototwo") != null ? request.getPart("phototwo").getInputStream() : null;

        // Create the Vehicle object
        Vehicleupdate vehicle = new Vehicleupdate(vehicleId, vehicleName, vehicleModel, vehicleType, fuelType,
                                      modelYear, engineSize, price, vehiclePhoto, vehiclePhototwo);

        // Call service to update the vehicle in the database
        vehicleee  service = new vehicleee ();
        boolean isUpdated = service.updateVehicle(vehicle);

        if (isUpdated) {
            request.setAttribute("message", "Vehicle updated successfully!");
        } else {
            request.setAttribute("error", "Failed to update vehicle.");
        }
        
        request.getRequestDispatcher("/updateVehicle.jsp").forward(request, response);
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String vehicleIdStr = request.getParameter("vehicleid");

        if (vehicleIdStr != null && !vehicleIdStr.isEmpty()) {
            try {
                int vehicleId = Integer.parseInt(vehicleIdStr);

                VehicleService vehicleService = new VehicleService();
                Vehicle vehicle = vehicleService.getVehicleById(vehicleId);

                if (vehicle != null) {
                    request.setAttribute("vehicle", vehicle);
                    request.getRequestDispatcher("/update.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Vehicle not found.");
                    request.getRequestDispatcher("/update.jsp").forward(request, response);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid vehicle ID format.");
                request.getRequestDispatcher("/update.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("error", "Vehicle ID is missing.");
            request.getRequestDispatcher("/update.jsp").forward(request, response);
        }
    }

}
