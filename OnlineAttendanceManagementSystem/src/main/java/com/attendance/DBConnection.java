package com.attendance;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {

        Connection con = null;

        try {
            Class.forName("org.postgresql.Driver");

            String url = System.getenv("DB_URL");
            String username = System.getenv("DB_USERNAME");
            String password = System.getenv("DB_PASSWORD");

            con = DriverManager.getConnection(url, username, password);

            System.out.println("Database Connected Successfully!");

        } catch (Exception e) {
            System.out.println("DATABASE CONNECTION FAILED:");
            e.printStackTrace();
        }

        return con;
    }
}
