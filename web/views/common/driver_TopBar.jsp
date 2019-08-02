<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jimcarry.member.model.vo.*"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
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
			<a href="/semi/views/driver_MainPage.jsp" class="w3-bar-item w3-button" style="text-decoration:none"><b>짐 캐리</b></a>
			<div class="w3-right w3-hide-small">
				<a onclick="goDriverOrder();"class="w3-bar-item w3-button" style="text-decoration:none">견적매칭</a>
				<a onclick="goDriverBoard();" class="w3-bar-item w3-button" style="text-decoration:none">사용후기</a>
				<a href="#"	class="w3-bar-item w3-button" style="text-decoration:none">기사홍보</a>
				<a class="w3-bar-item w3-button" style="text-decoration:none" onclick="myJimcarry();">내 짐 캐리 리스트</a> 
				<a href="/semi/noticelist.no" class="w3-bar-item w3-button" style="text-decoration:none">고객센터</a> 
				<a href="/semi/views/member/DriverMyPage.jsp" class="w3-bar-item w3-button" style="text-decoration:none">마이페이지</a>
				<a class="w3-bar-item w3-button" style="text-decoration:none" onclick="logout();">로그아웃</a>
			</div>
		</div>
	</div>

	<script>
		function logout(){
			alert("로그아웃 하시겠습니까?");
			location.href="<%=request.getContextPath()%>/logout.me";
		};

		function myJimcarry(){
			location.href="/semi/driverJcarrylist.jc";
		};

		function goDriverOrder(){
			location.href="<%=request.getContextPath()%>/driverOrder.rq";
		};
		function goDriverBoard(){
			location.href="/semi/selectList.bo";
		};

	</script>
</body>
</html>