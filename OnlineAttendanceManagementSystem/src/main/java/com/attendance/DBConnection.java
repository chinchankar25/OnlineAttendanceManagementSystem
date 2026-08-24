package com.attendance;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {

        Connection con = null;

        try {
            // Load PostgreSQL JDBC Driver
            Class.forName("org.postgresql.Driver");

            // Read Render Environment Variables
            String url = System.getenv("DB_URL");
            String username = System.getenv("DB_USERNAME");
            String password = System.getenv("DB_PASSWORD");

            // Check environment variables
            if (url == null || url.isBlank()) {
                throw new Exception("DB_URL is missing");
            }

            if (username == null || username.isBlank()) {
                throw new Exception("DB_USERNAME is missing");
            }

            if (password == null || password.isBlank()) {
                throw new Exception("DB_PASSWORD is missing");
            }

            // Make sure URL uses JDBC format
            if (url.startsWith("postgresql://")) {
                url = "jdbc:" + url;
            }

            // Connect to PostgreSQL
            con = DriverManager.getConnection(url, username, password);

            System.out.println("Database Connected Successfully!");

        } catch (Exception e) {

            System.out.println("DATABASE CONNECTION FAILED:");
            e.printStackTrace();
        }

        return con;
    }
}
