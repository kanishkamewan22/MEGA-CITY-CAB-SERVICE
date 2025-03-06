package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import contoller.database;

@WebServlet("/vehicleImage")
public class VehicleImageServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public VehicleImageServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String vehicleId = request.getParameter("id");

        // Default to primary image (vehiclePhoto)
        String imageType = request.getParameter("imageType"); // Optional param to specify photo type
        String query = "SELECT vehiclePhoto FROM vehicles WHERE id = ?"; // Default to primary image

        // Adjust the query based on the imageType
        if (imageType != null && imageType.equals("secondary")) {
            query = "SELECT vehiclePhototwo FROM vehicles WHERE id = ?";
        }

        try (Connection con = database.getcon();
             PreparedStatement pstmt = con.prepareStatement(query)) {

            pstmt.setInt(1, Integer.parseInt(vehicleId));
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                // Set response content type for image
                response.setContentType("image/jpeg");

                // Retrieve the photo as InputStream
                InputStream inputStream = rs.getBinaryStream(1);  // Getting the first column (vehiclePhoto or vehiclePhototwo)

                if (inputStream != null) {
                    // Output the image to response
                    OutputStream outputStream = response.getOutputStream();
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }

                    inputStream.close();
                    outputStream.close();
                } else {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND, "Image not found.");
                }
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Vehicle not found.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while retrieving the image.");
        }
    }
}
