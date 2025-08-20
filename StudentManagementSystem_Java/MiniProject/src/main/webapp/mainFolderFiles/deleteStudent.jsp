<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="com.db.DBConnection"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Student</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="card shadow p-4">
        <h2 class="text-center mb-4 text-danger">Delete Student Record</h2>

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
            <button type="submit" class="btn btn-danger w-100">Delete Student</button>
        </form>
		
        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String roll_no = request.getParameter("roll_no");
                String email = request.getParameter("email");

                Connection con = null;
                PreparedStatement pst = null;

                try {
                    con = DBConnection.getConnection();
                    String qry = "DELETE FROM Students WHERE roll_no = ? AND email = ?";
                    pst = con.prepareStatement(qry);
                    pst.setString(1, roll_no);
                    pst.setString(2, email);

                    int rowsAffected = pst.executeUpdate();

                    if (rowsAffected > 0) {
        %>
            <div class="alert alert-success mt-3 text-center">Student deleted successfully.</div>
        <%
                    } else {
        %>
            <div class="alert alert-warning mt-3 text-center">No student found with given Roll Number and Email.</div>
        <%
                    }
                } catch (Exception e) {
        %>
            <div class="alert alert-danger mt-3">Error: <%= e.getMessage() %></div>
        <%
                    e.printStackTrace();
                } finally {
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
