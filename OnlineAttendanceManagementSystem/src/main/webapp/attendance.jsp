<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="com.attendance.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mark Attendance</title>

<style>

body {
    font-family: Arial, sans-serif;
    margin: 0;
    background: linear-gradient(135deg, #eef5ff, #f8fbff);
    min-height: 100vh;
}

/* Header */
.header {
    background: linear-gradient(135deg, #2c3e50, #3498db);
    color: white;
    padding: 22px;
    text-align: center;
    box-shadow: 0 3px 10px rgba(0,0,0,0.2);
}

.header h1 {
    margin: 0;
    font-size: 28px;
}

/* Form Container */
.container {
    width: 450px;
    max-width: 90%;
    margin: 45px auto;
}

/* Form Box */
.form-box {
    background-color: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 5px 18px rgba(0,0,0,0.12);
}

.form-box h2 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 25px;
}

/* Labels */
label {
    display: block;
    margin-bottom: 7px;
    font-weight: bold;
    color: #333;
}

/* Inputs and Select */
input[type="date"],
input[type="text"],
select {
    width: 100%;
    padding: 11px;
    margin-bottom: 18px;
    border: 1px solid #ccc;
    border-radius: 6px;
    box-sizing: border-box;
    font-size: 15px;
}

input[type="date"]:focus,
input[type="text"]:focus,
select:focus {
    border-color: #3498db;
    outline: none;
}

/* Save Button */
input[type="submit"] {
    width: 100%;
    padding: 12px;
    background-color: #3498db;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
}

input[type="submit"]:hover {
    background-color: #2980b9;
}

/* Success Message */
.success {
    color: green;
    text-align: center;
    font-weight: bold;
    margin-top: 20px;
}

/* Error Message */
.error {
    color: red;
    text-align: center;
    font-weight: bold;
    margin-top: 20px;
}

/* Back Button */
.back {
    display: block;
    width: 180px;
    margin: 25px auto 0 auto;
    padding: 11px;
    background-color: #2c3e50;
    color: white;
    text-align: center;
    text-decoration: none;
    border-radius: 6px;
    font-weight: bold;
}

.back:hover {
    background-color: #1a252f;
}

</style>

</head>

<body>

<!-- Header -->
<div class="header">
    <h1>Online Attendance Management System</h1>
</div>

<!-- Main Container -->
<div class="container">

    <div class="form-box">

        <h2>Mark Attendance</h2>

        <form method="post">

            <label>Date</label>
            <input type="date" name="date" required>

            <label>Student Name</label>
            <input type="text" name="studentName" required>

            <label>Subject</label>
            <input type="text" name="subject" required>

            <label>Attendance</label>

            <select name="status">
                <option value="Present">Present</option>
                <option value="Absent">Absent</option>
            </select>

            <input type="submit" value="Save Attendance">

        </form>

<%
String date = request.getParameter("date");
String studentName = request.getParameter("studentName");
String subject = request.getParameter("subject");
String status = request.getParameter("status");

if (date != null && studentName != null && subject != null && status != null) {

    try {

        Connection con = DBConnection.getConnection();

        String sql = "INSERT INTO Attendance "
                   + "(attendance_date, student_name, subject, status) "
                   + "VALUES (?, ?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, date);
        ps.setString(2, studentName);
        ps.setString(3, subject);
        ps.setString(4, status);

        ps.executeUpdate();

        out.println("<p class='success'>Attendance Saved Successfully!</p>");

        ps.close();
        con.close();

    } catch (Exception e) {

        out.println("<p class='error'>Error: " + e.getMessage() + "</p>");

    }
}
%>

    </div>

    <!-- Back to Dashboard -->
    <a class="back" href="dashboard.jsp">Back to Dashboard</a>

</div>

</body>
</html>