package servlet;

import service.VehicleService;
import model.Vehicle;
import java.io.IOException;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

@WebServlet("/adminp")
public class adminSercalet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public adminSercalet() {
        super();
    }

    // The doGet method retrieves vehicles from the database and forwards them to the JSP
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Create an instance of VehicleService to fetch all vehicles
        VehicleService vehicleService = new VehicleService();
        
        // Get the list of all vehicles
        List<Vehicle> vehicles = vehicleService.getAllVehicles();
        
        // Set the vehicles list as a request attribute
        request.setAttribute("adminp", vehicles);  // <-- This line should use "adminp" (JSP variable)

        // Forward the request to the JSP page to display the vehicles
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin.jsp");
        dispatcher.forward(request, response);
    }
}

