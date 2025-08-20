<%@page import = "java.sql.*" %>

<%@page import = "com.db.DBConnection" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - Student Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #cceeff, #b3d9ff);
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 400px;
            margin: 60px auto;
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

        input[type="text"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin: 10px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        button {
            width: 100%;
            background-color: #28a745;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background-color: #218838;
        }

        .link {
            text-align: center;
            margin-top: 15px;
        }

        .link a {
            color: #0066cc;
            text-decoration: none;
        }

        .link a:hover {
            text-decoration: underline;
        }

        .message {
            text-align: center;
            font-size: 14px;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            display: none;
            opacity: 0;
            transition: opacity 0.5s ease-in-out;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }

        .progress-bar {
            width: 0%;
            height: 4px;
            background-color: #28a745;
            position: absolute;
            top: 0;
            left: 0;
            transition: width 0.6s ease-in-out;
        }
    </style>
</head>
<body>

	<%
	String msg = "";
	String status = "";
	if ("POST".equalsIgnoreCase(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

		
		Connection con = null;
		PreparedStatement pst = null;
		try {
			con = DBConnection.getConnection();
			
			/*if (con != null) out.println("Connection Successful!");
			else out.println("Connection Failed!");
			*/
			String qry = "INSERT INTO Stu_Regis (username, password) VALUES(?, ?)";
			
			pst = con.prepareStatement(qry);
			
			pst.setString(1, username);
			
			pst.setString(2, password);
			
			int rows = pst.executeUpdate();
			
			if (rows > 0) {
				msg = "<p class = 'message success'>Registration Successful</p>";
			} else {
				msg ="<p class = 'success'>Registration Failed</p>";
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			msg = "<p class = 'message'>Error: " + e.getMessage()+ "</p>";
			
		} finally {
			if (con != null) con.close();
		}
	}
	%>
<div class="container">
    <h2>Registration</h2>
     <%= msg %>
    <form method="post">
        <input type="text" name="username" placeholder="User Name" required>

        <input type="password" name="password" placeholder="Password" required>
        <button type="submit">Register</button>
    </form>
    <div class="link">
        Already registered? <a href="login.jsp">Login here</a>
    </div>
</div>

</body>

</html>
