<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.Statement"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 640d1d87ebd03d100c62c3e2d29b8d9e -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-amber.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="style.js"></script>

<title>회사정보</title>
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

.content{
margin:0;
text-align:left;
padding:1% 5%;
}
</style>
</head>
<body>

<!-- Side Navigation -->
<nav class="w3-sidebar w3-bar-block w3-card w3-animate-left w3-center" style="display:none" id="mySidebar">
  <h1 class="w3-xxxlarge w3-text-theme">Side Menu</h1>
  <button class="w3-bar-item w3-button" onclick="w3_close()">Close <i class="fa fa-remove"></i></button>
  <a href="examination.jsp" class="w3-bar-item w3-button">진로심리검사</a>
  <a href="companyInfo.jsp" class="w3-bar-item w3-button">회사정보</a>
</nav>

<!-- Header -->
<header class="w3-container w3-theme w3-padding" id="myHeader">
<i onclick="w3_open()" class="fa fa-bars w3-xlarge w3-button w3-theme"></i>
<div class="w3-center">
	<h4>회사정보가 궁금하다면?</h4>
  <h1 class="w3-xxlarge w3-animate-bottom" style="font-weight: bold;">회사정보</h1>
	<!-- <div class="w3-padding-32">
     <button class="w3-btn w3-xlarge w3-dark-grey w3-hover-light-grey" onclick="document.getElementById('id01').style.display='block'" style="font-weight:900;">LEARN W3.CSS</button>
   </div> -->
</div>
</header>

<!-- Modal -->
<div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-top">
      <header class="w3-container w3-theme-l1"> 
        <span onclick="document.getElementById('id01').style.display='none'"
        class="w3-button w3-display-topright">×</span>
        <h4>Oh snap! We just showed you a modal..</h4>
        <h5>Because we can <i class="fa fa-smile-o"></i></h5>
      </header>
      <div class="w3-padding">
        <p>Cool huh? Ok, enough teasing around..</p>
        <p>Go to our <a class="w3-btn" href="/w3css/default.asp">W3.CSS Tutorial</a> to learn more!</p>
      </div>
      <footer class="w3-container w3-theme-l1">
        <p>Modal footer</p>
      </footer>
    </div>
</div>
<form action="companyResult.jsp" method="post" class="formStyle">

<strong>위치</strong> 
	<select name="location">
		<option value="강남구">강남구</option>
		<option value="강동구">강동구</option>
		<option value="강북구">강북구</option>
		<option value="강서구">강서구</option>
		<option value="관악구">관악구</option>
		<option value="광진구">광진구</option>
		<option value="구로구">구로구</option>
		<option value="금천구">금천구</option>
		<option value="노원구">노원구</option>
		<option value="도봉구">도봉구</option>
		<option value="동대문구">동대문구</option>
		<option value="동작구">동작구</option>
		<option value="서대문구">서대문구</option>
		<option value="서초구">서초구</option>
		<option value="성동구">성동구</option>
		<option value="성북구">성북구</option>
		<option value="송파구">송파구</option>
		<option value="양천구">양천구</option>
		<option value="영등포구">영등포구</option>
		<option value="용산구">용산구</option>
		<option value="은평구">은평구</option>
		<option value="종로구">종로구</option>
		<option value="중구">중구</option>
		<option value="중랑구">중랑구</option>
	</select>
	
	<select name="comStandard">
		<option value="1">총 만족도</option>
		<option value="2">복지 및 급여</option>
		<option value="3">승진 기회 및 가능성</option>
		<option value="4">업무와 삶의 균형</option>
		<option value="5">사내문화</option>
		<option value="6">경영진</option>
		<option value="7">매출액</option>
	</select>
	
	<select name="comStandard2">
		<option value="1">총 만족도</option>
		<option value="2">복지 및 급여</option>
		<option value="3">승진 기회 및 가능성</option>
		<option value="4">업무와 삶의 균형</option>
		<option value="5">사내문화</option>
		<option value="6">경영진</option>
		<option value="7">매출액</option>
	</select>
	<input type="submit" value="검색하기" class="w3-button w3-large w3-white w3-border">
</form>

<%
/*
1 : 총 만족도
2 : 복지 및 급여
3 : 승진 기회 및 가능성
4 : 업무와 삶의 균형
5 : 사내문화
6 : 경영진
*/
request.setCharacterEncoding("utf-8");

String selectValue = request.getParameter("comStandard");
String selectValue2 = request.getParameter("comStandard2");
String selectLocation = request.getParameter("location");

if(selectValue.equals("sales")){
	selectValue.substring(0, selectValue.length()-7);
}
int comNum = Integer.parseInt(selectValue);

String comStandard ="";

switch(comNum){
case 1: 
	comStandard = "rate_tot";
	break;
case 2:
	comStandard = "rate2_salary";
	break;
case 3:
	comStandard = "rate1_promotion";
	break;
case 4:
	comStandard = "rate3_work";
	break;
case 5:
	comStandard = "rate4_culture";
	break;
case 6:
	comStandard = "rate5_manager";
	break;
case 7:
	comStandard = "sales";
	break;
}

if(selectValue2.equals("sales")){
	selectValue2.substring(0, selectValue2.length()-7);
}
int comNum2 = Integer.parseInt(selectValue2);

String comStandard2 ="";

switch(comNum2){
case 1: 
	comStandard2 = "rate_tot";
	break;
case 2:
	comStandard2 = "rate2_salary";
	break;
case 3:
	comStandard2 = "rate1_promotion";
	break;
case 4:
	comStandard2 = "rate3_work";
	break;
case 5:
	comStandard2 = "rate4_culture";
	break;
case 6:
	comStandard2 = "rate5_manager";
	break;
case 7:
	comStandard2 = "sales";
	break;
}
        
        	

//mysql select

String USERNAME = "root";
String PASSWORD = "mirim0316";
String URL = "jdbc:mysql://localhost:3307/company_db";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

String SQL = "SELECT * FROM Company_infomation where address like '%"+selectLocation+"%' order by "+comStandard+" desc, "+comStandard2+" desc;";

try {
	Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);

	stmt = conn.createStatement();

	rs = stmt.executeQuery(SQL);

%>

<div class="w3-row-padding w3-center w3-margin-top">
		<%
			while (rs.next()) {
					String name = rs.getString("name");
					String location = rs.getString("location");
					String salary = rs.getString("salary");
					String rate_tot = rs.getString("rate_tot");
					String rate1_promotion = rs.getString("rate1_promotion");
					String rate2_salary = rs.getString("rate2_salary");
					String rate3_work = rs.getString("rate3_work");
					String rate4_culture = rs.getString("rate4_culture");
					String rate5_manager = rs.getString("rate5_manager");
					String website = rs.getString("website");
					String address = rs.getString("address");
					String sales = rs.getString("sales");
		%>

		<div class="w3-third">
			<div class="w3-card " style="height:520px;">
				<!-- <i class="fa fa-desktop w3-margin-bottom w3-text-theme" style="font-size:120px"></i> -->
				<div class="w3-padding-32">
					<h3><%=name%></h3>
					<br>
					<%-- <button class="w3-btn w3-large w3-white ">
						위치 :
						<%=location%></button><br>
					<button class="w3-btn w3-large w3-white">
						평균연봉 :
						<%=salary%>만원</button><br>
					<button class="w3-btn w3-large w3-white">
						총 만족도 :
						<%=rate_tot%></button><br>
					<button class="w3-btn w3-large w3-white">
						승진 기회 및 가능성 :
						<%=rate1_promotion%></button><br>
					<button class="w3-btn w3-large w3-white">
						복지 및 급여 :
						<%=rate2_salary%></button><br>
					<button class="w3-btn w3-large w3-white">
						업무와 삶의 균형 :
						<%=rate3_work%></button><br>
					<button class="w3-btn w3-large w3-white">
						사내문화 :
						<%=rate4_culture%></button><br>
					<button class="w3-btn w3-large w3-white">
						경영진 :
						<%=rate5_manager%></button><br>
					<button class="w3-btn w3-large w3-white">
						매출액 :
						<%=sales%></button><br>
					<button class="w3-btn w3-large w3-white">
						웹사이트 :
						<a href='<%=website%>'></a></button><br>
					<button class="w3-btn w3-large w3-white">
						주소 :
						<%=address%></button><br>
					 --%>
					 
					 <p class="content">
						위치 :
						<%=location%></p>
					<p class="content">
						평균연봉 :
						<%=salary%>만원</p>
					<p class="content">
						총 만족도 :
						<%=rate_tot%></p>
					<p class="content">
						승진 기회 및 가능성 :
						<%=rate1_promotion%></p>
					<p class="content">
						복지 및 급여 :
						<%=rate2_salary%></p>
					<p class="content">
						업무와 삶의 균형 :
						<%=rate3_work%></p>
					<p class="content">
						사내문화 :
						<%=rate4_culture%></p>
					<p class="content">
						경영진 :
						<%=rate5_manager%></p>
					<p class="content">
						매출액 :
						<%=sales%></p>
					<p class="content">
						웹사이트 :
						<a href='<%=website%>'><%=website%></a></p>
					<p class="content" >
						주소 :
						<%=address%></p>
					
						
				</div>
			</div>
		</div>

		<%
		}
		%>
	</div>
	
	
	
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
</body>
</html>