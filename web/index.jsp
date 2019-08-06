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
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
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
		<div style="display: table; background: #F6F4F1; border-bottom: 1px solid #F6F4F1; margin-top: 25%; width:100%; height: 300px;">
			<div class="first_font" style="float: left; padding-top: 10%; padding-left: 1%;">
				<span style="font-size: 40px; font-family: 'Sunflower', sans-serif;">당신의 짐을 캐리 합니다.</span><br>
				<span style="font-size: 15px; font-family: 'Sunflower', sans-serif;">&nbsp;간편 운송 짐 캐리로 친절한 기사님을 만나보세요.</span>
			</div>
			<div class="first_photo">
				<img src="/semi/images/main_1.png" style="width: 55%; height: 50%; float: right; padding-top: 8%; padding-right: 5%">
			</div>
		</div>
	
		<!-- 메인 두 번째 줄 -->
		<div class="main_2" style="width: 100%; height: 300px; background: white; border-bottom: 1px solid #F2F2F2;">
			<div id="main_2_photo" style="float: left; margin-left: 8%">
				<img src="/semi/images/main_2.png" style="width: 150px; height: 150px; margin-top: 50px; display:block;"><br>
				<span style="font-family: 'Sunflower', sans-serif; font-size: 30px; align:center;">짐 목록 입력</span>
			</div>
			<div id="main_2_photo" style="float: left; margin-left: 8%">
				<img src="/semi/images/main_5.png" style="width: 150px; height: 150px; margin-top: 50px; display:block;"><br>
				<span style="font-family: 'Sunflower', sans-serif; font-size: 30px;">날짜/지역 선택</span>
			</div>
		 	<div id="main_2_photo" style="float: left; margin-left: 8%">
				<img src="/semi/images/main_4.png" style="width: 150px; height: 150px; margin-top: 50px; display:block;"><br>
				<span style="font-family: 'Sunflower', sans-serif; font-size: 30px;">기사 선택</span>
			</div>
			<div id="main_2_photo" style="float: left; margin-left: 8%">
				<img src="/semi/images/main_3.png" style="width: 150px; height: 150px; margin-top: 50px; display:block;"><br>
				<span style="font-family: 'Sunflower', sans-serif; font-size: 30px;">이용완료</span>
			</div>
		</div>
	
		<!-- 메인 세번째 줄 -->
		<div class="main_3"
			style="display: table; width: 100%; height: 300px; background: #F6F4F1; border-bottom: 1px solid #F2F2F2;">
			<div class="3_photo">
				<img src="/semi/images/main_8.jpg" style="width: 500px; height: 300px; padding-left: 5%; float: left;">
			</div>
			<div class="3_font" style="float: right; padding-top: 10%; padding-right: 5%;">
				<span style="font-family: 'Sunflower', sans-serif; font-size: 30px;">예상 못한 추가금액, 불편하셨죠?</span><br>
				<span style="font-family: 'Sunflower', sans-serif; font-size: 15px;">짐 캐리는 한번 결정된 금액만으로 결제가 진행됩니다.<br>추가 금액 없는 투명한 가격으로 용달 서비스를 이용해보세요.</span><br>
			</div>
		</div>
	</div>
	
	<%@ include file="../views/common/main_BottomBar.jsp" %>
	<%@ include file="../views/common/topButton.jsp" %>
	
</body>
</html>