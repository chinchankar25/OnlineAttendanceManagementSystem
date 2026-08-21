<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.attendance.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - Attendance System</title>

<style>

body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background: linear-gradient(135deg, #4facfe, #00f2fe);
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
}

.login-container {
    background: white;
    width: 400px;
    padding: 35px;
    border-radius: 12px;
    box-shadow: 0 8px 25px rgba(0,0,0,0.2);
    text-align: center;
}

h1 {
    font-size: 24px;
    color: #333;
    margin-bottom: 10px;
}

h2 {
    color: #4facfe;
    margin-bottom: 25px;
}

label {
    display: block;
    text-align: left;
    margin-bottom: 8px;
    font-weight: bold;
    color: #333;
}

input[type="text"],
input[type="password"] {
    width: 100%;
    padding: 12px;
    margin-bottom: 20px;
    border: 1px solid #ccc;
    border-radius: 6px;
    box-sizing: border-box;
    font-size: 15px;
}

input[type="text"]:focus,
input[type="password"]:focus {
    border-color: #4facfe;
    outline: none;
}

input[type="submit"] {
    width: 100%;
    padding: 12px;
    background: #4facfe;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
}

input[type="submit"]:hover {
    background: #2196f3;
}

.error {
    color: red;
    margin-top: 15px;
}

</style>

</head>

<body>

<div class="login-container">

    <h1>Online Attendance Management System</h1>
    <h2>Login</h2>

    <form method="post">

        <label>Username</label>
        <input type="text" name="username" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <input type="submit" value="Login">

    </form>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

if (username != null && password != null) {

    try {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM Users WHERE username=? AND password=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, username);
        ps.setString(2, password);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            response.sendRedirect("dashboard.jsp");
        } else {
            out.println("<p class='error'>Invalid Username or Password!</p>");
        }

        rs.close();
        ps.close();
        con.close();

    } catch (Exception e) {
        out.println("<p class='error'>Database Error: " + e.getMessage() + "</p>");
    }
}
%>

</div>

</body>
</html>