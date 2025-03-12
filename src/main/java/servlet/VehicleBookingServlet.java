package servlet;

import service.VehicleBookingService;
import model.VehicleBooking;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDType1Font;
import java.io.OutputStream;
import org.apache.pdfbox.pdmodel.font.PDType1Font;



import java.io.IOException;
import java.sql.Date;
import java.util.List;




import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDTrueTypeFont;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
@WebServlet("/submitBooking")
public class VehicleBookingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // Handle POST request for submitting the booking
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            // Get form parameters from the request
            int vehicleId = Integer.parseInt(request.getParameter("vehicleid"));
            String vehicleName = request.getParameter("vehicleName");
            String vehicleModel = request.getParameter("vehicleModel");
            String customerName = request.getParameter("customerName");
            String email = request.getParameter("email");
            String contactNumber = request.getParameter("contact");
            Date pickupDate = Date.valueOf(request.getParameter("pickupDate"));
            Date returnDate = Date.valueOf(request.getParameter("returnDate"));
            double bookingPrice = Double.parseDouble(request.getParameter("Bookingprice"));

            // Create a VehicleBooking object with the data
            VehicleBooking booking = new VehicleBooking();
            booking.setVehicleId(vehicleId);
            booking.setVehicleName(vehicleName);
            booking.setVehicleModel(vehicleModel);
            booking.setCustomerName(customerName);
            booking.setEmail(email);
            booking.setContactNumber(contactNumber);
            booking.setPickupDate(pickupDate);
            booking.setReturnDate(returnDate);
            booking.setBookingPrice(bookingPrice);

            // Call the service to add the booking to the database
            VehicleBookingService bookingService = new VehicleBookingService();
            boolean isBookingSuccess = bookingService.addBooking(booking);

            // Check if the booking was successful
            if (isBookingSuccess) {
                // Redirect to a confirmation page
                request.setAttribute("message", "Booking Successful!");
                request.getRequestDispatcher("/booking.jsp").forward(request, response);
                generateBookingBill(customerName, contactNumber, email, vehicleName, vehicleModel, pickupDate.toString(), returnDate.toString(), bookingPrice);
                
            } else {
                // If there was an error, show an error message
                request.setAttribute("error", "Booking Failed. Please try again.");
                request.getRequestDispatcher("/booking.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exception (e.g., invalid input)
            request.setAttribute("error", "There was an error processing your booking.");
            request.getRequestDispatcher("/booking.jsp").forward(request, response);
        }
    }
    
    public void generateBookingBill(String customerName, String contactNumber, String email, String vehicleName, String vehicleModel, String pickupDate, String returnDate, double totalPrice) {
        // Set the file name and path
        String fileName = "BookingDetails.txt";
        File file = new File(fileName);

        // Try to write booking details to the text file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
            // Write the booking details
            writer.write("Booking Confirmation\n");
            writer.write("=====================\n\n");
            writer.write("Customer Name: " + customerName + "\n");
            writer.write("Contact Number: " + contactNumber + "\n");
            writer.write("Email: " + email + "\n");
            writer.write("Vehicle Name: " + vehicleName + "\n");
            writer.write("Vehicle Model: " + vehicleModel + "\n");
            writer.write("Pickup Date: " + pickupDate + "\n");
            writer.write("Return Date: " + returnDate + "\n");
            writer.write("Total Price: $" + totalPrice + "\n");

            // Indicating that the bill has been generated
            System.out.println("Booking bill has been generated successfully!");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }}