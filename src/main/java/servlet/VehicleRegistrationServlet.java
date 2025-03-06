package servlet;

import java.io.IOException;
import java.io.InputStream;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.Vehiclee;
import service.VehicleServicee;

@WebServlet("/vehicleRegistration") // URL mapping for vehicle registration servlet
@MultipartConfig // Enabling file upload handling
public class VehicleRegistrationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Default constructor
    public VehicleRegistrationServlet() {
        super();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "GET method is not supported.");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Collect form data
        String vehicleName = request.getParameter("vehicleName");
        String vehicleModel = request.getParameter("vehiclemodel");
        String vehicleType = request.getParameter("vehicleType");
        String fuelType = request.getParameter("Fueltype");
        int modelYear = Integer.parseInt(request.getParameter("modelYear"));
        String engineSize = request.getParameter("engineSize");
        double price = Double.parseDouble(request.getParameter("price"));
        
        // Get vehicle images from the form
        Part vehiclePhotoPart = request.getPart("vehiclePhoto");
        Part vehiclePhototwoPart = request.getPart("vehiclePhototwo");

        // Check if all required fields are filled
        if (vehicleName == null || vehicleName.isEmpty() || 
            vehicleModel == null || vehicleModel.isEmpty() || 
            vehicleType == null || vehicleType.isEmpty() || 
            fuelType == null || fuelType.isEmpty() ||
            engineSize == null || engineSize.isEmpty() ||
            vehiclePhotoPart == null || vehiclePhototwoPart == null) {
            // Set error message if any required field is empty
            request.setAttribute("error", "Please fill in all required fields and upload the images.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("vehicalregister.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Convert the uploaded files to byte arrays
        byte[] vehiclePhoto = getBytesFromInputStream(vehiclePhotoPart.getInputStream());
        byte[] vehiclePhototwo = getBytesFromInputStream(vehiclePhototwoPart.getInputStream());

        // Create the Vehicle object
        Vehiclee vehicle = new Vehiclee(vehicleName, vehicleModel, vehicleType, fuelType, modelYear, engineSize, price, vehiclePhoto, vehiclePhototwo);

        // Create the VehicleService class and register the vehicle
        VehicleServicee vehicleService = new VehicleServicee();
        boolean success = vehicleService.registerVehicle(vehicle);

        // If vehicle registration is successful
        if (success) {
            request.setAttribute("message", "Vehicle registered successfully.");
        } else {
            // If registration fails
            request.setAttribute("error", "Error registering vehicle. Please try again.");
        }

        // Forward to the vehicle registration page with message/error
        RequestDispatcher dispatcher = request.getRequestDispatcher("vehicalregister.jsp");
        dispatcher.forward(request, response);
    }

    // Helper method to convert InputStream to byte[]
    private byte[] getBytesFromInputStream(InputStream inputStream) throws IOException {
        byte[] byteArray = new byte[inputStream.available()];
        inputStream.read(byteArray);
        return byteArray;
    }
}
