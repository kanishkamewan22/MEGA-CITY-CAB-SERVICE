package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import contoller.database;  

public class LoginService {

    // This method validates the user based on their username, password, and position
    public boolean validateUser(String username, String password, String position) {
        String table = position.equals("Administrator") ? "administrators" : "clients";
        
        // SQL query to check for matching username and password
        String query = "SELECT * FROM " + table + " WHERE username = ? AND password_hash = ?";

        try (Connection con = database.getcon();  // Using the database class to get the connection
             PreparedStatement ps = con.prepareStatement(query)) {

            // Setting the parameters for the SQL query
            ps.setString(1, username);
            ps.setString(2, password);  // Normally, you should hash the password before storing it

            // Execute the query and check if a matching record exists
            ResultSet rs = ps.executeQuery();
            return rs.next();  // Returns true if a matching record is found

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
