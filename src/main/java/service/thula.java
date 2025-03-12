package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import contoller.database;
import model.user;

public class thula {
	
	
	 public boolean checkEmailExists(String email) {
	        String query = "SELECT COUNT(*) FROM user.clients WHERE email = ?";
	        
	        try (Connection con = database.getcon(); 
	             PreparedStatement ps = con.prepareStatement(query)) {
	            ps.setString(1, email);
	            
	            ResultSet rs = ps.executeQuery();
	            
	            if (rs.next()) {
	                return rs.getInt(1) > 0;  // If count is greater than 0, email exists
	            }
	        } catch (SQLException | ClassNotFoundException e) {
	            e.printStackTrace();
	        }
	        
	        return false;  // Return false if no exception and email does not exist
	    }

    
    public boolean reg_user(user app1) {
        String query = "";
        if (app1.getPosition().equals("Client")) {
            query = "INSERT INTO clients (username, email, password_hash) VALUES (?, ?, ?)";
        } else if (app1.getPosition().equals("Administrator")) {
            query = "INSERT INTO administrators (username, email, password_hash) VALUES (?, ?, ?)";
        }

        try (Connection con = database.getcon(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, app1.getUsername());
            ps.setString(2, app1.getEmail());
            ps.setString(3, app1.getPasswordHash());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
    }
}
