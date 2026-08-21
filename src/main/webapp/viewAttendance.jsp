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
    <title>View Attendance</title>

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

/* Main Container */
.container {
    width: 85%;
    margin: 40px auto;
}

/* Report Box */
.report-box {
    background-color: white;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0 5px 18px rgba(0,0,0,0.12);
}

.report-box h2 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 25px;
}

/* Table */
table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background-color: #3498db;
    color: white;
    padding: 13px;
    text-align: center;
}

td {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid #ddd;
    color: #444;
}

tr:hover {
    background-color: #f2f8ff;
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

/* Error */
.error {
    color: red;
    text-align: center;
    font-weight: bold;
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

    <div class="report-box">

        <h2>Attendance Report</h2>

        <table>

            <tr>
                <th>Date</th>
                <th>Student Name</th>
                <th>Subject</th>
                <th>Status</th>
            </tr>

<%
try {

    Connection con = DBConnection.getConnection();

    String sql = "SELECT attendance_date, student_name, subject, status FROM Attendance";

    PreparedStatement ps = con.prepareStatement(sql);

    ResultSet rs = ps.executeQuery();

    while (rs.next()) {
%>

            <tr>
                <td><%= rs.getDate("attendance_date") %></td>
                <td><%= rs.getString("student_name") %></td>
                <td><%= rs.getString("subject") %></td>
                <td><%= rs.getString("status") %></td>
            </tr>

<%
    }

    rs.close();
    ps.close();
    con.close();

} catch (Exception e) {

    out.println("<p class='error'>Error: " + e.getMessage() + "</p>");

}
%>

        </table>

    </div>

    <a class="back" href="dashboard.jsp">Back to Dashboard</a>

</div>

</body>
</html>