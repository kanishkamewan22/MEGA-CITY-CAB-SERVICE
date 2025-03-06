package servlet;

import service.VehicleService;
import model.Vehicle;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/updateDisplay")
public class updateServalet extends HttpServlet {
    private static final long serialVersionUID = 1L;
   
    // GET method to fetch vehicle details
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

    // POST method to handle the form submission (update vehicle)
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	
    	
    	
        try {
           
           String vehicleIdStr = request.getParameter("id");

            // Check if vehicleIdStr is null or empty
            if (vehicleIdStr == null || vehicleIdStr.isEmpty()) {
                // If vehicleId is missing, throw an error
                throw new IllegalArgumentException("Vehicle ID is required.");
            }

            // Convert the vehicleId to an integer
            int vehicleId = Integer.parseInt(vehicleIdStr);

            // Retrieve other form data
          
            String vehicleName = request.getParameter("vehicleName");
            String vehicleModel = request.getParameter("vehicleModel");
            String vehicleType = request.getParameter("vehicleType");
            String fuelType = request.getParameter("fuelType");
            String modelYearStr = request.getParameter("modelYear");
            String priceStr = request.getParameter("price");

            if (modelYearStr == null || modelYearStr.isEmpty() || priceStr == null || priceStr.isEmpty()) {
                throw new IllegalArgumentException("Model year and price are required.");
            }
            String engineSize = request.getParameter("engineSize");

            // Convert model year and price to their appropriate types
            int modelYear = Integer.parseInt(modelYearStr);
            double price = Double.parseDouble(priceStr);

            // Handle file uploads for vehicle photos
            InputStream vehiclePhoto = request.getPart("photo") != null ? request.getPart("photo").getInputStream() : null;
            InputStream vehiclePhototwo = request.getPart("phototwo") != null ? request.getPart("phototwo").getInputStream() : null;

            // Create Vehicle object
            Vehicle vehicle = new Vehicle(vehicleId, vehicleName, vehicleModel, vehicleType, fuelType,
                    modelYear, engineSize, price, vehiclePhoto, vehiclePhototwo);

            // Call service to update the vehicle in the database
            VehicleService service = new VehicleService();
            boolean isUpdated = service.updateVehicle(vehicle);

            // Handle the result
            if (isUpdated) {
                request.setAttribute("message", "Vehicle updated successfully!");
                request.getRequestDispatcher("/update.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Failed to update vehicle.");
                request.getRequestDispatcher("/update.jsp").forward(request, response);
            }
        } catch (IllegalArgumentException e) {
            // Handle invalid input, e.g. missing or incorrect vehicle ID
            request.setAttribute("error", "Invalid input: " + e.getMessage());
            request.getRequestDispatcher("/update.jsp").forward(request, response);
        } catch (Exception e) {
            // Handle other unexpected errors
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while updating the vehicle.");
            request.getRequestDispatcher("/update.jsp").forward(request, response);
        }
    }
}
