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
<title>Student Management</title>

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
    margin: 35px auto;
}

/* Form Box */
.form-box {
    background: white;
    width: 450px;
    max-width: 90%;
    margin: 0 auto 40px auto;
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

/* Input Fields */
input[type="text"] {
    width: 100%;
    padding: 11px;
    margin-bottom: 18px;
    border: 1px solid #ccc;
    border-radius: 6px;
    box-sizing: border-box;
    font-size: 15px;
}

input[type="text"]:focus {
    border-color: #3498db;
    outline: none;
}

/* Add Button */
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

/* Message */
.success {
    color: green;
    text-align: center;
    font-weight: bold;
}

.error {
    color: red;
    text-align: center;
    font-weight: bold;
}

/* Student List */
.list-box {
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 5px 18px rgba(0,0,0,0.12);
}

.list-box h2 {
    color: #2c3e50;
    text-align: center;
    margin-bottom: 20px;
}

/* Table */
table {
    width: 100%;
    border-collapse: collapse;
}

th {
    background-color: #3498db;
    color: white;
    padding: 12px;
}

td {
    padding: 12px;
    text-align: center;
    border-bottom: 1px solid #ddd;
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

</style>

</head>

<body>

<!-- Header -->
<div class="header">
    <h1>Online Attendance Management System</h1>
</div>

<div class="container">

    <!-- Student Form -->
    <div class="form-box">

        <h2>Student Management</h2>

        <form method="post">

            <label>Student Name</label>
            <input type="text" name="name" required>

            <label>Roll Number</label>
            <input type="text" name="rollno" required>

            <label>Course</label>
            <input type="text" name="course" required>

            <input type="submit" value="Add Student">

        </form>

<%
String name = request.getParameter("name");
String rollno = request.getParameter("rollno");
String course = request.getParameter("course");

if (name != null && rollno != null && course != null) {

    try {

        Connection con = DBConnection.getConnection();

        String sql = "INSERT INTO Students (Student_name, roll_no, course) VALUES (?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, name);
        ps.setString(2, rollno);
        ps.setString(3, course);

        ps.executeUpdate();

        out.println("<p class='success'>Student Added Successfully!</p>");

        ps.close();
        con.close();

    } catch (Exception e) {

        out.println("<p class='error'>Error: " + e.getMessage() + "</p>");

    }
}
%>

    </div>

    <!-- Student List -->
    <div class="list-box">

        <h2>Student List</h2>

        <table>

            <tr>
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Roll Number</th>
                <th>Course</th>
            </tr>

<%
try {

    Connection con = DBConnection.getConnection();

    String sql = "SELECT Student_id, Student_name, roll_no, course FROM Students";

    PreparedStatement ps = con.prepareStatement(sql);

    ResultSet rs = ps.executeQuery();

    while (rs.next()) {
%>

            <tr>
                <td><%= rs.getInt("Student_id") %></td>
                <td><%= rs.getString("Student_name") %></td>
                <td><%= rs.getString("roll_no") %></td>
                <td><%= rs.getString("course") %></td>
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

    <!-- Back Button -->
    <a class="back" href="dashboard.jsp">Back to Dashboard</a>

</div>

</body>
</html>