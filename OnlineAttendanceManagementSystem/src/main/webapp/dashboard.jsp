<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard - Attendance Management System</title>

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
    padding: 25px;
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
    margin: 45px auto;
    text-align: center;
}

/* Dashboard Heading */
h2 {
    color: #2c3e50;
    font-size: 30px;
    margin-bottom: 8px;
}

.container > p {
    color: #666;
    font-size: 16px;
}

/* Cards */
.cards {
    display: flex;
    justify-content: center;
    gap: 25px;
    flex-wrap: wrap;
    margin-top: 35px;
}

/* Individual Card */
.card {
    background-color: white;
    width: 220px;
    padding: 30px 20px;
    border-radius: 12px;
    box-shadow: 0 5px 18px rgba(0,0,0,0.12);
    transition: 0.3s;
}

/* Card Hover Effect */
.card:hover {
    transform: translateY(-8px);
    box-shadow: 0 8px 22px rgba(0,0,0,0.18);
}

.card h3 {
    color: #2c3e50;
    font-size: 19px;
}

.card p {
    color: #777;
    min-height: 40px;
}

/* Buttons */
.card a {
    display: inline-block;
    margin-top: 15px;
    padding: 11px 25px;
    background-color: #3498db;
    color: white;
    text-decoration: none;
    border-radius: 6px;
    font-weight: bold;
}

.card a:hover {
    background-color: #2980b9;
}

/* Logout Button */
.logout {
    background-color: #e74c3c !important;
}

.logout:hover {
    background-color: #c0392b !important;
}

</style>

</head>

<body>

<!-- Header -->
<div class="header">
    <h1>Online Attendance Management System</h1>
</div>

<!-- Main Content -->
<div class="container">

    <h2>Dashboard</h2>

    <p>Welcome to Attendance Management System</p>

    <!-- Cards -->
    <div class="cards">

        <!-- Student Management -->
        <div class="card">
            <h3>Student Management</h3>
            <p>Add and view students</p>
            <a href="student.jsp">Open</a>
        </div>

        <!-- Mark Attendance -->
        <div class="card">
            <h3>Mark Attendance</h3>
            <p>Mark student attendance</p>
            <a href="attendance.jsp">Open</a>
        </div>

        <!-- View Attendance -->
        <div class="card">
            <h3>View Attendance</h3>
            <p>View attendance report</p>
            <a href="viewAttendance.jsp">Open</a>
        </div>

        <!-- Logout -->
        <div class="card">
            <h3>Logout</h3>
            <p>Exit from the system</p>
            <a class="logout" href="index.jsp">Logout</a>
        </div>

    </div>

</div>

</body>
</html>