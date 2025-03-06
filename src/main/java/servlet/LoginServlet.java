package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.LoginService;

@WebServlet("/loginnServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String position = request.getParameter("position");

        // Instantiate LoginService to validate user
        LoginService loginService = new LoginService();

        // Validate user credentials
        if (loginService.validateUser(username, password, position)) {
            // If valid, redirect to the appropriate page
            if ("Administrator".equals(position)) {
                response.sendRedirect("Adminpage.jsp");  // Redirect to admin page if the user is an admin
            } else if ("Client".equals(position)) {
                response.sendRedirect("Clientpage.jsp");  // Redirect to client page if the user is a client
            }
        } else {
            // If invalid, set error message and forward back to login page
            request.setAttribute("error", "Invalid username, password, or position.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }
}
