<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>견적입찰내역</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style>
#outer {
	width: 870px;
	margin: 0 auto;
}

#driverImg {
	width: auto;
	height: auto;
	max-width: 130px;
	max-height: 130px;
}
#drivername{
	padding-top:5px;
	padding-left:130px;
}

#rev {
	margin-top:20px;
	padding-left:130px;
}

#price {
	margin-top:-20px;
}
.container{
	padding-right:100px;
	margin-top:-30px;
}

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
<body>
	<%@ include file="/views/common/user_TopBar.jsp" %>

	<div id="outer main">

		<br> <br> <br> <br>

		<h1 style="text-align: center">견적 입찰 내역</h1>
		<hr>

		<div style="text-align: center">
			<h4>현재 최저가</h4>
			<h2>145000원</h2>
			<p style="color: gray;">견적 번호 : A1001</p>
			<h5>남은 입찰 기간 : time</h5>
			<h5>
				<a href="#">내 짐캐리 리스트 확인 하기</a>
			</h5>
			<hr>
		</div>

		<div>
			<img src="../../images/driver.png" style="float:left" id="driverImg">
			<div id="drivername">
				<h3>복권석 기사님</h3>
			</div>
			
			<div id="price" style="float:right">
				<h3>가격 : 145000원</h3>
			</div>
			
			<div id="rev">
				<h4>평점 : 4.2</h4>
				<h4>리뷰  :13건 </h4>
			</div>
			

			<div class="container" align="right">
				<button type="button" class="btn">선택하기</button>
			</div>
			<hr>
		</div>

		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>


	</div>





</body>
</html>