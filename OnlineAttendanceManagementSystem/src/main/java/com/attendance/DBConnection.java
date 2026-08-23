package com.attendance;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {

        try {
            Class.forName("org.postgresql.Driver");

            String url = System.getenv("DB_URL");
            String username = System.getenv("DB_USERNAME");
            String password = System.getenv("DB_PASSWORD");

            if (url == null || url.isEmpty()) {
                throw new RuntimeException("DB_URL is missing");
            }

            if (username == null || username.isEmpty()) {
                throw new RuntimeException("DB_USERNAME is missing");
            }

            if (password == null || password.isEmpty()) {
                throw new RuntimeException("DB_PASSWORD is missing");
            }

            Connection con = DriverManager.getConnection(
                    url,
                    username,
                    password
            );

            System.out.println("DATABASE CONNECTED SUCCESSFULLY!");

            return con;

        } catch (Exception e) {
            throw new RuntimeException(
                "DATABASE CONNECTION FAILED: " + e.getMessage(), e
            );
        }
    }
}
