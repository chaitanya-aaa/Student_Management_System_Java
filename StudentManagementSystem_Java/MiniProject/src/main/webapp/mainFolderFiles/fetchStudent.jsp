<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.db.DBConnection"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fetch | Retrieve Student</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="card shadow p-4">
        <h2 class="text-center mb-4 text-primary">Fetch Student Details</h2>

        <form method="post">
            <div class="row mb-3">
                <div class="col">
                    <label for="roll_no" class="form-label">Roll Number</label>
                    <input type="text" class="form-control" name="roll_no" required>
                </div>
                <div class="col">
                    <label for="email" class="form-label">Email</label>
                    <input type="text" class="form-control" name="email" required>
                </div>
            </div>
            <button type="submit" class="btn btn-success w-100">Fetch</button>
        </form>
       

        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String roll_no = request.getParameter("roll_no");
                String email = request.getParameter("email");

                Connection con = null;
                PreparedStatement pst = null;
                ResultSet rs = null;

                try {
                    con = DBConnection.getConnection();
                    String qry = "SELECT * FROM Students WHERE roll_no = ? AND email = ?";
                    pst = con.prepareStatement(qry);
                    pst.setString(1, roll_no);
                    pst.setString(2, email);

                    rs = pst.executeQuery();

                    if (rs.next()) {
        %>

        <div class="table-responsive mt-4">
            <table class="table table-bordered table-hover">
                <thead class="table-light">
                    <tr>
                        <th>Roll No</th>
                        <th>Name</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Age</th>
                        <th>Branch</th>
                        <th>Section</th>
                        <th>Gender</th>
                        <th>Mobile</th>
                        <th>Address</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%= rs.getString("roll_no") %></td>
                        <td><%= rs.getString("name1") %></td>
                        <td><%= rs.getString("username") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getInt("age") %></td>
                        <td><%= rs.getString("branch") %></td>
                        <td><%= rs.getString("section") %></td>
                        <td><%= rs.getString("gender") %></td>
                        <td><%= rs.getLong("mobile") %></td>
                        <td><%= rs.getString("address") %></td>
                        <td><a href="main.jsp">Home</a>
                    </tr>
                </tbody>
            </table>
        </div>

        <%
                    } else {
        %>
            <div class="alert alert-danger mt-3 text-center">No student found with given Roll Number and Email.</div>
        <%
                    }
                } catch (Exception e) {
        %>
            <div class="alert alert-danger mt-3">Error: <%= e.getMessage() %></div>
        <%
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (pst != null) pst.close();
                    if (con != null) con.close();
                }
            }
        %>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
