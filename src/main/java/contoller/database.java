package contoller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class database {

    public static Connection getcon() throws ClassNotFoundException, SQLException {
        String username = "root";
        String password = "admin";
        
        // Load MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");
        
        // Establish a connection
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/user?characterEncoding=utf8", username, password);
    }

	



}

