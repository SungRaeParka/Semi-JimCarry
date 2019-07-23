<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Insert title here</title>
</head>
<body>
	<!-- 상단 고정바 -->
	<div class="w3-top">
		<div class="w3-bar w3-white w3-wide w3-padding w3-card">
			<a href="/semi/views/mainPage.jsp" class="w3-bar-item w3-button" style="text-decoration:none"><b>짐 캐리</b></a>
			<div class="w3-right w3-hide-small">
				<a href="/semi/views/request/req_ProSelect.jsp" class="w3-bar-item w3-button" style="text-decoration:none">견적신청</a> 
				<a href="/semi/views/board/review/user_ReviewList.jsp" class="w3-bar-item w3-button" style="text-decoration:none">사용후기</a>
				<a href="/semi/views/board/driverPromotion/driver_PromotionList.jsp"	class="w3-bar-item w3-button" style="text-decoration:none">기사홍보</a>
				<a class="w3-bar-item w3-button" style="text-decoration:none" onclick="myJimcarry();">내 짐 캐리 리스트</a> 
				<a href="/semi/views/board/serviceCenter/user_Qna1on1List.jsp" class="w3-bar-item w3-button" style="text-decoration:none">고객센터</a> 
				<a href="#" class="w3-bar-item w3-button" style="text-decoration:none">마이페이지</a>
				<a class="w3-bar-item w3-button" style="text-decoration:none" onclick="logout();">로그아웃</a>
			</div>
		</div>
	</div>
	
	<script>
		function logout(){
			alert("로그아웃 하시겠습니까?");
		};
		
		function myJimcarry(){
			location.href="/semi/myJcarrylist.jc";
		}
		
		
		
	</script>	
</body>
</html>