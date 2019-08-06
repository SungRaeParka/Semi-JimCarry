<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
	#logoDiv {
		width: 100%; 
		height:205px; 
		background: white;
		position: relative;
	}
	
	.front {
		position: absolute;
		left: 50%;
		transform: translateX(-50%);
	}
	
	.back {
		margin-top: 10%;
	}
	
	.w3-bar {
		font-family: 'Sunflower', sans-serif;
		font-size: 15px;
	}
	
	.w3-white {
		background-color: #FFC730!important;
		color:white!important;
	}
	.w3-button:hover {
		color: black;	
		background: #FFC730!important;
	}
</style>
</head>
<body>
	<!-- 상단 고정바 -->
	<div class="w3-top" align="center">
		<div id="logoDiv">
			<div class="front">
				<img src="/semi/images/main_logo.png" style="width: 350px; height: 200px; display: block; margin-left: auto; margin-right: auto;">			
			</div>
			<div class="back" style="float:left;">			
				<img src="/semi/images/logo_gif.gif">
			</div>
		</div>
		<div class="w3-bar w3-white w3-wide w3-padding w3-card">
			<a href="/semi/index.jsp" class="w3-bar-item w3-button" style="text-decoration:none"><b>짐 캐리</b></a>
			<div class="w3-right w3-hide-small">
				<a href="#" class="w3-bar-item w3-button" style="text-decoration:none">견적신청</a>
				<a onclick="goBoard();" class="w3-bar-item w3-button" style="text-decoration:none">사용후기</a>
				<a href="#"	class="w3-bar-item w3-button" style="text-decoration:none">기사홍보</a>
				<a href="#" class="w3-bar-item w3-button" style="text-decoration:none">내 짐 캐리 리스트</a>
				<a href="#" class="w3-bar-item w3-button" style="text-decoration:none">고객센터</a>
				<a href="/semi/views/member/MemberLoginForm.jsp" class="w3-bar-item w3-button" style="text-decoration:none">로그인</a>
			</div>
		</div>
	</div>
	<script>

	/* 사용후기 */
	function goBoard(){
		location.href="/semi/selectList.bo";
		}

	</script>
</body>
</html>