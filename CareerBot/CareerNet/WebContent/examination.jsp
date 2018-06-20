<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-amber.css">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
	<script src="style.js"></script>
	
<title>진로심리검사</title>
<style>
input[type="radio"] {
	display: none;
}

input[type="radio"]:checked+label {
	font-size: 1.1em;
	font-weight:bold;
}
input[type="radio"]:label {
	font-size: 1em;
	color:grey;
}

div .question {
	background-image: url("image/img_q.png");
	background-size:100%;
	background-repeat:no-repeat;
	width: 420px;
	height: 130px;
	clear: both;
	vertical-align: middle;
}

.leftmargin {
	margin-left: 30px;
	padding: 20px;
}

.rightmargin {
	margin-right: 40px;
	padding: 20px;
}

div .answer {
	background-image: url("image/img_a.png");
	background-size:100%;
	background-repeat:no-repeat;
	width: 400px;
	height: 120px;
	float: right;
}

/* .btn{
	width: 100px;
	height: 60px;
	background: white;
	border:3px solid MediumOrchid;
	color: MediumOrchid;
	font-weight: bold; 
}

.btn:hover{
	width: 120px;
	background: MediumOrchid;
	color: white;
	font-weight: 300; 
}
 */
</style>


<script>
//
function clickmethod(){
	//alert("aaaa");
}
</script>


</head>
<body>
	<!-- Side Navigation -->
	<nav class="w3-sidebar w3-bar-block w3-card w3-animate-left w3-center"
		style="display:none" id="mySidebar">
	<h1 class="w3-xxxlarge w3-text-theme">Side Menu</h1>
	<button class="w3-bar-item w3-button" onclick="w3_close()">
		Close <i class="fa fa-remove"></i>
	</button>
	<a href="examination.jsp" class="w3-bar-item w3-button">진로심리검사</a> <a
		href="companyInfo.jsp" class="w3-bar-item w3-button">회사정보</a> </nav>

	<!-- Header -->
<header class="w3-container w3-theme w3-padding" id="myHeader">
  <i onclick="w3_open()" class="fa fa-bars w3-large w3-button w3-theme"></i> 
  <div class="w3-center">
  <h4>나의 진로정보가 궁금하다면?</h4>
  <h1 class="w3-xxlarge w3-animate-bottom" style="font-weight: bold;">진로심리검사</h1>
<!-- <div class="w3-padding-32">
      <button class="w3-btn w3-xlarge w3-dark-grey w3-hover-light-grey" onclick="document.getElementById('id01').style.display='block'" style="font-weight:900;">LEARN W3.CSS</button>
    </div> -->
  </div>
</header>


	<!-- Modal -->
	<div id="id01" class="w3-modal">
		<div class="w3-modal-content w3-card-4 w3-animate-top">
			<header class="w3-container w3-theme-l1"> <span
				onclick="document.getElementById('id01').style.display='none'"
				class="w3-button w3-display-topright">×</span>
			<h4>Oh snap! We just showed you a modal..</h4>
			<h5>
				Because we can <i class="fa fa-smile-o"></i>
			</h5>
			</header>
			<div class="w3-padding">
				<p>Cool huh? Ok, enough teasing around..</p>
				<p>
					Go to our <a class="w3-btn" href="/w3css/default.asp">W3.CSS
						Tutorial</a> to learn more!
				</p>
			</div>
			<footer class="w3-container w3-theme-l1">
			<p>Modal footer</p>
			</footer>
		</div>
	</div>
	<%
		String USERNAME = "root";
		String PASSWORD = "mirim0316";
		String URL = "jdbc:mysql://localhost:3307/company_db";

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		String[] SQL = new String[] { "SELECT * FROM energy", "SELECT * FROM information",
				"SELECT * FROM decision_making", "SELECT * FROM life_Style" };

		int cnt = 0;


		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);

			stmt = conn.createStatement();
	%>
	<form action="examinationResult.jsp">



		<%
			for (int i = 0; i < 4; i++) {
					rs = null;
					rs = stmt.executeQuery(SQL[i]);
		%>

		<div class="w3-row-padding w3-center w3-margin-top">
			<%
				while (rs.next()) {
							cnt++;
							String content = rs.getString("content");
							String a = rs.getString("a");
							String b = rs.getString("b");
							
							
			%>
			<div align="left" class="question">
				<div class="leftmargin">
					<h4><%=content%></h4>
				</div>
			</div>

			<div align="right" class="answer" >
				<div class="rightmargin">
				<input type="radio" id="Aa<%=cnt%>" name="A<%=cnt%>" value="a"
					required> <label for="Aa<%=cnt%>" onclick="clickmethod()">a : <%=a%></label> <br>
				<input type="radio" id="Ab<%=cnt%>" name="A<%=cnt%>" value="b">
				<label for="Ab<%=cnt%>">b : <%=b%></label> <br>
			</div>
			</div>
			<%
				//System.out.println(content + " " + a + " / " + b );
						}
			%>
		</div>


		<%
			}
		%>
		<br><br>
		<center>
		<input type="submit" class="btn w3-btn w3-large w3-dark-grey w3-hover-light-grey">
		</center>
	</form>
	<%
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
		} catch (ClassNotFoundException e1) {
			System.out.println("[JDBC Connector Driver 오류 : " + e1.getMessage() + "]");
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	%>
<div class="w3-container">
<hr>


<!-- Footer -->
<footer class="w3-container w3-light-grey w3-padding-16">
  <small>
  Copyright © 2018 Mirim. All rights reserved
  </small>
</footer>
</div>
</body>
</html>