<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import = "java.sql.*" %>
<%@page import = "com.db.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background: linear-gradient(to right, #cceeff, #b3d9ff);">
<%
    Connection con = null;
    PreparedStatement pst = null;
    String message = "";
    String alertClass = "";
    if("POST".equalsIgnoreCase(request.getMethod())) {
        try {
            String roll_no = request.getParameter("roll_no");
            String name = request.getParameter("name");
            String username = request.getParameter("username1");
            String email = request.getParameter("email");
            int age = Integer.parseInt(request.getParameter("age"));
            String branch = request.getParameter("department");
            String sec = request.getParameter("section");
            String gender = request.getParameter("gender");
            long num = Long.parseLong(request.getParameter("mobile"));
            String addr = request.getParameter("address");
			
            out.println("Name: " + name + "<br>");
            out.println("Username: " + username + "<br>");

            con = DBConnection.getConnection();
			
            String qry = "INSERT INTO Students (roll_no, name1, username, email, age, branch, section, gender, mobile, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pst = con.prepareStatement(qry);

            pst.setString(1, roll_no);
            pst.setString(2, name);
            pst.setString(3, username);
            pst.setString(4, email);
            pst.setInt(5, age);
            pst.setString(6, branch);
            pst.setString(7, sec);
            pst.setString(8, gender);
            pst.setLong(9, num);
            pst.setString(10, addr);

            int i = pst.executeUpdate();

            if (i > 0) {
                message = "Student details registered successfully!";
                alertClass = "alert-success";
            } else {
                message = "Registration failed. Please try again.";
                alertClass = "alert-danger";
            }

        } catch (Exception e) {
            e.printStackTrace();
            message = "Error: " + e.getMessage();
            alertClass = "alert-danger";
        } finally {
            if (con != null) con.close();
        }
    }
%>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card shadow-lg">
                <div class="card-body">
                    <h4 class="text-center text-primary mb-4">Student Registration</h4>

                    <% if (!message.isEmpty()) { %>
                        <div class="alert <%= alertClass %> text-center"><%= message %></div>
                    <% } %>

                    <form method="post">
                        <div class="mb-3">
                            <label>Roll No</label>
                            <input type="text" name="roll_no" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label>Name</label>
                            <input type="text" name="name" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label>Username</label>
                            <input type="text" name="username1" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label>Email</label>
                            <input type="email" name="email" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label>Age</label>
                            <input type="number" name="age" class="form-control" min="18" max="44" required>
                        </div>
                        <div class="mb-3">
                            <label>Department</label>
                            <select name="department" class="form-select" required>
                                <option value="">-- Select Department --</option>
                                <option value="Computer Science">Computer Science</option>
                                <option value="Mechanical">Mechanical</option>
                                <option value="Electrical">Electrical</option>
                                <option value="Civil">Civil</option>
                                <option value="Electronics">Electronics</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label>Section</label>
                            <select name="section" class="form-select" required>
                                <option value="">-- Select Section --</option>
                                <option value="A">A</option>
                                <option value="B">B</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label>Gender</label>
                            <select name="gender" class="form-select" required>
                                <option value="">-- Select Gender --</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label>Mobile Number</label>
                            <input type="text" name="mobile" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label>Address</label>
                            <textarea name="address" class="form-control" rows="3" required></textarea>
                        </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-success">Submit</button>
                        </div>
                    </form>
				
					
					
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS (optional for dropdowns, etc.) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
