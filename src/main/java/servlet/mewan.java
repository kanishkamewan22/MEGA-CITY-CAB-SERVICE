package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.user;
import service.thula;

@WebServlet("/mewan") // URL mapping for this servlet
public class mewan extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Default constructor
    public mewan() {
        super();
    }

    // Handles the POST request from the signup form
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Collect form data
        user app1 = new user();
        app1.setUsername(request.getParameter("username"));
        app1.setEmail(request.getParameter("email"));
        app1.setPasswordHash(request.getParameter("password"));  // You should hash the password before saving it
        app1.setPosition(request.getParameter("position"));

        // Check if passwords match
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm-password");

        if (!password.equals(confirmPassword)) {
            // Set error message if passwords do not match
            request.setAttribute("error", "Passwords do not match.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
            dispatcher.forward(request, response);
            return;
        }

        // Create the service class and register the user
        thula th = new thula();
        boolean success = th.reg_user(app1);

        // If registration is successful
        if (success) {
            request.setAttribute("message", "User registered successfully.");
        } else {
            // If registration fails
            request.setAttribute("error", "Error registering user.");
        }

        // Forward to the signup page with message/error
        RequestDispatcher dispatcher = request.getRequestDispatcher("signup.jsp");
        dispatcher.forward(request, response);
    }
}
