<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-amber.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="style.js"></script>
<title>Insert title here</title>
<style>
select {
    width: 20%;
    height: 50px;
    padding-left: 10px;
    font-size: 18px;
     color: orange; 
    border: 1px solid orange;
    border-radius: 3px;
    margin-left: 1%;
}
.formStyle{
margin:1%;
}
strong{
font-size:1.2em;
margin-left:1%;
}


.result_div{
	position : absolute;
	left:33%;
 	width:50%;
 	max-width:400px;
	top:230px;
 	text-align: center;
}
.image{
	width:100%;
	max-width:600px;
	height:auto;
	position: relative;
}


</style>
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

	<%
int E=0,I=0;
int S=0,N=0;
int T=0,F=0;
int J=0,P=0;

request.setCharacterEncoding("UTF-8");

	for(int i=1;i<=5;i++){
		if(request.getParameter("A"+Integer.toString(i)).equals("a")){
			E++;
		}else{
			//out.println("I<br>");
			I++;
		}
	}
	
	for(int i=6;i<=10;i++){
		if(request.getParameter("A"+Integer.toString(i)).equals("a")){
			S++;
		}else{
			N++;
		}
	}
	
	for(int i=11;i<=15;i++){
		if(request.getParameter("A"+Integer.toString(i)).equals("a")){
			T++;
		}else{
			F++;
		}
	}
	
	for(int i=16;i<=20;i++){
		if(request.getParameter("A"+Integer.toString(i)).equals("a")){
			J++;
		}else{
			P++;
		}
	}
	
	
/* 	int E=0,I=0;
	int S=0,N=0;
	int T=0,F=0;
	int J=0,P=0; */
	
	String your_type ="";
	
	if(E>I){your_type += "E";} else {your_type += "I";}
	if(S>N){your_type += "S";} else {your_type += "N";}
	if(T>F){your_type += "T";} else {your_type += "F";}
	if(J>P){your_type += "J";} else {your_type += "P";}
	
	
	//out.print("당신은 "+your_type+" 유형입니다.");
	
	
	//DB연결

	String USERNAME = "root";
	String PASSWORD = "mirim0316";
	String URL = "jdbc:mysql://localhost:3307/company_db";

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	String SQL = "SELECT * FROM result where type='"+your_type+"'";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);

		stmt = conn.createStatement();
		
		rs = stmt.executeQuery(SQL);
		while (rs.next()) {
			String alias = rs.getString("type_alias");
			String content = rs.getString("content");
			String job = rs.getString("job");
			String high_school = rs.getString("high_school");
			
			%><div>
			<center><img src="image/student_result.png" class="image">
			<div class="result_div">
			결과가 나왔어요 ! 당신은 <b><%=alias%></b>인  <b><%=your_type%></b>유형입니다! &nbsp;
			<b>'<%=content%>'</b>라고 검사지에 적혀있네요 ㅎㅎ &nbsp;&nbsp;<br>
			<b><%=job%></b>관련 직업들이 적성에 맞을 것 같은데 &nbsp;
			관련 학과로 진학을 원한다면 <b><%=high_school%></b>같은 특성화는 어떠신가요?&nbsp;
			</div>
			</center>
			</div>
<%		}
		
		
		
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
</body>
</html>