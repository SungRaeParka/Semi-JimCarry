<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.jimcarry.request.model.vo.*"%>
	
	
	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최종견적서</title>
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

#imgs {
	width: auto;
	height: auto;
	max-width: 100px;
	max-height: 100px;
}

.container {
	padding-left: 330px;
}
</style>

</head>
<body>
	<%@ include file="/views/common/user_TopBar.jsp" %>

	<div id="outer">

		<br> <br> <br> <br>
		
		
		<%
		
		
		
		%>

		<h1 align="center">최종 견적서</h1>
		<hr>
		<div>
			<h3>예정일</h3>
			<p><%= %></p>
		</div>
		<hr>

		<div>
			<h3>출발지</h3>
			<p>경기도 용인시 어쩌고 저쩌고 3층, 엘리베이터O, 주차가능</p>
		</div>
		<hr>

		<div>
			<h3>도착지</h3>
			<p>경기도 용인시 어쩌고 저쩌고 3층, 엘리베이터O, 주차가능</p>
		</div>
		<hr>

		<div>
			<h3>짐 정보</h3>
			<p>
				가구 : 어쩌고 저쩌고<br> 짐박스 : 몇개
			</p>
		</div>
		<hr>

		<div>
			<h3>사진 정보</h3>
			<img src="/semi/images/box.png" id="imgs">

		</div>
		<hr>

		<div>
			<h3>짐 정보</h3>
			<p>
				가구 : 어쩌고 저쩌고<br> 짐박스 : 몇개
			</p>
		</div>
		<hr>

		<div>
			<h3>메모</h3>
			<p>앞에 메모란에 입력한 내용</p>

		</div>
		<hr>

		<div>
			<h3>입찰 받을 기간</h3>
			<p>2019-07-02 ~ 2019-07-04 (총 2일)</p>
		</div>
		<hr>

		<br> <br>

		<div align="center" style="margin-bottom: 10px">
			<a href="/semi/myJcarrylist.jc" style="text-decoration: none; padding-left: 40px;">
				<span style="font-size: 30px">확인</span>	
			</a>
		</div>
	</div>





</body>
</html>