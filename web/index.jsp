<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>  
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
	html, body{
		height:100%;
		margin: 0;
		padding: 0;		
	}	
	#main {
		min-height: 100%;
	}
</style>
</head>
<body id="body">
	<%@ include file="../views/common/main_TopBar.jsp" %>
	
	<!-- 메인 첫 번째 줄 -->
	<div id="main">
	<div style="display: table; border: 1px solid black; margin-top: 0%; width:100%; height: 450px;">
		<div class="first_font" style="float: left; padding-top: 20%; padding-left: 2%;">
			<span style="font-size: 30px;">당신의 짐을 캐리 합니다.</span><br>&nbsp;	<sub>간편	운송 짐 캐리로 친절한 기사님을 만나보세요.</sub><br>
		</div>
		<div class="first_photo">
			<img src="images/main_1.png" style="width: 60%; height: 60%; float: right; padding-left: 3%; position: absolute; bottom: 29%">
		</div>
	</div>

	<!-- 메인 두 번째 줄 -->
	<div class="main_2" style="display: table; width: 100%; height: 450px; background: #E3E3E3; border: 1px solid black;">
		<div id="main_2_photo" style="float: left; margin-left: 60px; margin-top: 50px;">
			<img src="images/main_2.png" style="width: 150px; height: 150px; margin-top: 50px;">
			<h2>짐 목록 입력</h2>
		</div>
		<div id="main_2_photo" style="float: left; margin-left: 60px; margin-top: 50px;">
			<img src="images/main_5.png" style="width: 150px; height: 150px; margin-top: 50px;">
			<h2>날짜/지역 입력</h2>
		</div>
		<div id="main_2_photo" style="float: left; margin-left: 60px; margin-top: 50px;">
			<img src="images/main_4.png" style="width: 150px; height: 150px; margin-top: 50px;">
			<h2>기사 선택</h2>
		</div>
		<div id="main_2_photo" style="float: left; margin-left: 60px; margin-top: 50px;">
			<img src="images/main_3.png" style="width: 150px; height: 150px; margin-top: 50px;">
			<h2>이용 완료</h2>
		</div>
	</div>

	<!-- 메인 세번째 줄 -->
	<div class="main_3"
		style="display: table; width: 100%; height: 100%; border: 1px solid black;">
		<div class="3_photo">
			<img src="images/main_8.jpg"
				style="width: 40%; height: 50%; padding-top: 70px; padding-left: 100px; float: left;">
		</div>
		<div class="3_font"
			style="float: right; padding-top: 15%; padding-right: 10%; height: 450px">
			<span style="font-size: 30px;">예상 못한 추가금액, 불편하셨죠?</span><br>&nbsp;
			<sub>짐 캐리는 한번 결정된 금액만으로 결제가 진행됩니다.<br>&nbsp;&nbsp;&nbsp;추가
				금액 없는 투명한 가격으로 용달 서비스를 이용해보세요.
			</sub><br>
		</div>
	</div>

	<!-- 메인 네번째 줄 -->

	<div class="container" style="display: table; width: 100%; height: 100%; background: #E3E3E3; border: 1px solid black;">
		<div id="myCarousel" class="carousel slide" data-ride="carousel" style="width: 50%; height: 100%; margin: 0 auto;">
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<div class="carousel-inner" style="width: 100%; height: 100%;">
				<div class="item active" style="width: 100%; height: 100%;">
					<img src="images/test1.PNG">
				</div>

				<div class="item" style="width: 100%; height: 100%;">
					<img src="images/test2.PNG">
				</div>

				<div class="item" style="width: 100%; height: 100%;">
					<img src="images/test3.PNG">
				</div>
			</div>

			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span>
				<span class="sr-only">Previous</span>
			</a> 
			<a class="right carousel-control" href="#myCarousel" data-slide="next"> 
				<span class="glyphicon glyphicon-chevron-right"></span> 
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
	</div>
	
	<%@ include file="../views/common/main_BottomBar.jsp" %>
	<%@ include file="../views/common/topButton.jsp" %>
	
</body>
</html>