<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.db.DBConnection" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Student</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #cceeff, #b3d9ff);
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 600px;
            margin: 50px auto;
            background-color: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #0066cc;
        }

        .form-group label {
            font-weight: bold;
        }

        .btn-primary {
            width: 100%;
        }

        .message {
            text-align: center;
            font-size: 16px;
            margin-bottom: 20px;
        }

        .success {
            color: green;
        }

        .error {
            color: red;
        }
    </style>
</head>
<body>

<%
   String roll_no = request.getParameter("roll_no");
   String email = request.getParameter("email");
   
   if (request.getParameter("update") != null) {
	   int id = Integer.parseInt(request.getParameter("id"));
	   
	   //String roll_no = request.getParameter("roll_no");
	  
	   String name = request.getParameter("name");
	   
	   String usr = request.getParameter("ussname");
	   
	   
	   int age = Integer.parseInt(request.getParameter("age"));
	   	
	   String dept = request.getParameter("department");
	   
	   String section = request.getParameter("section");
	   
	   String gender = request.getParameter("gender");
	   
	   Long mobile = Long.parseLong(request.getParameter("mobile"));
   		
	   String address = request.getParameter("address");
		
	   try {
		   Connection conn = DBConnection.getConnection();
		   
		   PreparedStatement pst = conn.prepareStatement("UPDATE Students set roll_no = ?, name1 = ?, username = ?, email = ?, age = ?, branch = ?, section = ?, gender = ?, mobile = ?, address = ? where id = ?");
		   pst.setString(1, roll_no);
		   pst.setString(2, name);
		   pst.setString(3, usr);
		   pst.setString(4, email);
		   pst.setInt(5, age);
		   pst.setString(6, dept);
		   pst.setString(7, section);
		   pst.setString(8, gender);
		   pst.setLong(9, mobile);
		   pst.setString(10, address);
		   pst.setInt(11, id);
		   out.println("ID to be updated: " + id);
		   out.println(usr);
		   int i = pst.executeUpdate();
		   
		   if (i > 0) {
			   out.println("<p style = 'color : green;'>Student Details updated successfully!</p>"+ i);
		   } else {
				   out.println("<p style = 'color : green;'>Error!</p>");  
			   }
	   } catch(Exception e) {
		   e.printStackTrace();
		   out.println("<p style = 'color : red;'>Error: "+ e.getMessage()+ "</p>" );
	   }
   } else if (roll_no != null && email != null) {
	   try {
		   Connection conn = DBConnection.getConnection();
		   PreparedStatement pst = conn.prepareStatement("SELECT * from Students where roll_no = ? AND email = ?");
		   pst.setString(1, roll_no);
		   pst.setString(2, email);
		   
		   ResultSet rs = pst.executeQuery();
		   
		   if (rs.next()) {
			   
%>

			<div class="container">
   			<h2>Update Student Details</h2>
    
      		  <form method="post">
           		 <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
				
            	<div class="form-group">
                	<label>Roll No</label>
                	<input type="text" name="roll_no" class="form-control" value="<%= rs.getString("roll_no") %>" readonly required>
            	</div>

            	<div class="form-group">
              	  <label>Name</label>
                	<input type="text" name="name" class="form-control" value="<%= rs.getString("name1") %>" required>
            	</div>

            	<div class="form-group">
                	<label>Username</label>
                	<input type="text" name="ussname" class="form-control" value="<%= rs.getString("username") %>" required>
            	</div>

           		<div class="form-group">
                	<label>Email</label>
                	<input type="email" name="email" class="form-control" value="<%= rs.getString("email") %>" required>
            	</div>

            	<div class="form-group">
                	<label>Age</label>
                	<input type="number" name="age" class="form-control" value="<%= rs.getInt("age") %>" min="18" max="44" required>
            	</div>

            	<div class="form-group">
                	<label>Department</label>
                	<select name="department" class="form-control" required>
                    	<option value="">-- Select Department --</option>
                    	<option value="Computer Science" <%= "Computer Science".equals(rs.getString("branch")) ? "selected" : "" %>>Computer Science</option>
                    	<option value="Mechanical" <%= "Mechanical".equals(rs.getString("branch")) ? "selected" : "" %>>Mechanical</option>
                    	<option value="Electrical" <%= "Electrical".equals(rs.getString("branch")) ? "selected" : "" %>>Electrical</option>
                    	<option value="Civil" <%= "Civil".equals(rs.getString("branch")) ? "selected" : "" %>>Civil</option>
                    	<option value="Electronics" <%= "Electronics".equals(rs.getString("branch")) ? "selected" : "" %>>Electronics</option>
                	</select>
            	</div>

            	<div class="form-group">
                	<label>Section</label>
                	<select name="section" class="form-control" required>
                    	<option value="">-- Select Section --</option>
                    	<option value="A" <%= "A".equals(rs.getString("section")) ? "selected" : "" %>>A</option>
                    	<option value="B" <%= "B".equals(rs.getString("section")) ? "selected" : "" %>>B</option>
                	</select>
            	</div>

            	<div class="form-group">
                	<label>Gender</label>
                	<select name="gender" class="form-control" required>
                    	<option value="">-- Select Gender --</option>
                    	<option value="Male" <%= "Male".equals(rs.getString("gender")) ? "selected" : "" %>>Male</option>
                    	<option value="Female" <%= "Female".equals(rs.getString("gender")) ? "selected" : "" %>>Female</option>
                	</select>
            	</div>

            	<div class="form-group">
                	<label>Mobile</label>
                	<input type="text" name="mobile" class="form-control" value="<%= rs.getLong("mobile") %>" required>
            	</div>

            	<div class="form-group">
                	<label>Address</label>
                	<textarea name="address" class="form-control" required><%= rs.getString("address") %></textarea>
            	</div>

            	<input type ="submit" name="update" value="Update">
        </form>
</div>
<%
		   } else {
			   out.println("<p style='color:red;'>Invalid Roll Number or Email</p>");
			   
		   }
		   conn.close();
	   } catch(Exception e) {
		   e.printStackTrace();
		   out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
	   }
   } else {
%>
	<div class="container">
    <h2>Update Student Record</h2>
    <form method="post">
        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="roll_no">Roll Number</label>
                <input type="text" name="roll_no" class="form-control" placeholder="Enter Roll Number" required>
            </div>
            <div class="form-group col-md-6">
                <label for="email">Email</label>
                <input type="text" name="email" class="form-control" placeholder="Enter Email" required>
            </div>
        </div>
        <div class="d-grid mt-3">
            <button type="submit" class="btn btn-primary btn-block">Search Student</button>
        </div>
    </form>
  
</div>
	
	
	
<% } %> 

</body>
</html>
