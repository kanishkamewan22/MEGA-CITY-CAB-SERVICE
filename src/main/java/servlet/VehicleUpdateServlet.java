package servlet;

import model.Vehicle;
import service.VehicleService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;

@WebServlet("/updateVehicle")
public class VehicleUpdateServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Handle POST request to update vehicle details
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get session and vehicle ID from session
        HttpSession session = request.getSession();
        Integer vehicleId = (Integer) session.getAttribute("vehicleid");

        // Check if vehicleId exists in session
        if (vehicleId == null) {
            request.setAttribute("error", "Vehicle ID is missing.");
            request.getRequestDispatcher("/update.jsp").forward(request, response);
            return;  // Stop further processing if vehicleId is missing
        }

        // Get form data (e.g., vehicle name, model, etc.)
        String vehicleName = request.getParameter("vehicleName");
        String vehicleModel = request.getParameter("vehicleModel");
        String vehicleType = request.getParameter("vehicleType");
        String fuelType = request.getParameter("fuelType");

        // Validate vehicle name and other required fields
        if (vehicleName == null || vehicleName.trim().isEmpty()) {
            request.setAttribute("error", "Vehicle Name cannot be empty.");
            request.getRequestDispatcher("/update.jsp").forward(request, response);
            return;
        }

        if (vehicleModel == null || vehicleModel.trim().isEmpty()) {
            request.setAttribute("error", "Vehicle Model cannot be empty.");
            request.getRequestDispatcher("/update.jsp").forward(request, response);
            return;
        }

        // Handle price and model year with null checks
        String priceStr = request.getParameter("price");
        double price = 0.0;  // Default price value

        // If the price is not null and not empty, parse it
        if (priceStr != null && !priceStr.trim().isEmpty()) {
            try {
                price = Double.parseDouble(priceStr.trim());
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid price format.");
                request.getRequestDispatcher("/update.jsp").forward(request, response);
                return;  // Stop further processing if price is invalid
            }
        }

        // Similarly, handle the model year
        String modelYearStr = request.getParameter("modelYear");
        int modelYear = 0;  // Default value for model year

        if (modelYearStr != null && !modelYearStr.trim().isEmpty()) {
            try {
                modelYear = Integer.parseInt(modelYearStr.trim());
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid model year format.");
                request.getRequestDispatcher("/update.jsp").forward(request, response);
                return;
            }
        }

        String engineSize = request.getParameter("engineSize");

        // Get the image input streams (if any files are uploaded)
        InputStream vehiclePhoto = request.getPart("photo") != null ? request.getPart("photo").getInputStream() : null;
        InputStream vehiclePhototwo = request.getPart("phototwo") != null ? request.getPart("phototwo").getInputStream() : null;

        // Create a new Vehicle object with the constructor that includes the InputStream fields for images
        Vehicle vehicle = new Vehicle(vehicleId, vehicleName, vehicleModel, vehicleType, fuelType, modelYear, engineSize, price, vehiclePhoto, vehiclePhototwo);

        // Create the VehicleService object and call updateVehicle method
        VehicleService vehicleService = new VehicleService();
        boolean isUpdated = vehicleService.updateVehicle(vehicle);

        // If update was successful
        if (isUpdated) {
            request.setAttribute("message", "Vehicle updated successfully!");
        } else {
            // If update fails
            request.setAttribute("error", "Failed to update vehicle.");
        }

        // Forward the request to the same page to show the result
        request.getRequestDispatcher("/update.jsp").forward(request, response);
    }
}
