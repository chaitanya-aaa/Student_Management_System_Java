<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Student Management</title>
    <!-- Font Awesome CDN for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #007bff;
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .user {
            font-weight: bold;
            font-size: 18px;
        }

        .logout-btn {
            background-color: red;
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        .dashboard {
            max-width: 800px;
            margin: 50px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        .dashboard h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #333;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 20px;
        }

        .btn-card {
            background-color: #28a745;
            color: white;
            padding: 20px;
            text-align: center;
            border-radius: 10px;
            text-decoration: none;
            font-size: 16px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn-card i {
            font-size: 24px;
            margin-bottom: 10px;
            display: block;
        }

        .btn-card:hover {
            background-color: #218838;
        }

        @media (max-width: 500px) {
            .dashboard {
                padding: 20px;
            }

            .btn-card {
                padding: 15px;
                font-size: 14px;
            }

            .btn-card i {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>

<%
//This is very very important..,
    String username = request.getParameter("username");
    if (username == null || username.trim().isEmpty()) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<div class="navbar">
    <div class="user">Welcome, <%= username %></div>
    <a href="index.jsp" class="logout-btn">Logout</a>
</div>

<div class="dashboard">
    <h2>Dashboard</h2>
    <div class="grid">
        <a href="mainFolderFiles/addStudent.jsp?username=<%= username %>" class="btn-card">
            <i class="fas fa-user-plus"></i>
            Add Student Details
        </a>
        <a href="mainFolderFiles/fetchStudent.jsp?username=<%= username %>" class="btn-card">
            <i class="fas fa-search"></i>
            Fetch Student Details
        </a>
        <a href="mainFolderFiles/updateStudent.jsp?username=<%= username %>" class="btn-card">
            <i class="fas fa-user-edit"></i>
            Update Student Details
        </a>
        <a href="mainFolderFiles/deleteStudent.jsp?username=<%= username %>" class="btn-card">
            <i class="fas fa-user-minus"></i>
            Delete Student Details
        </a>
    </div>
</div>

</body>
</html>
