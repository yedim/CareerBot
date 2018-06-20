<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-amber.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
<script src="style.js"></script>
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

</style>
<title>회사정보</title>
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

<form action="companyResult.jsp" method="post" class="formStyle">

		<strong>위치 </strong>
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

</body>
</html>