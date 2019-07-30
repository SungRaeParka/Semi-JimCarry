<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, java.text.SimpleDateFormat, com.kh.jimcarry.request.model.vo.*"%>

<%
	ArrayList<Request> rolist = (ArrayList<Request>) request.getAttribute("rolist");
	String reqno = (String)request.getAttribute("no");
	int minPrice = (int)request.getAttribute("minPrice");
%>




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

#drivername {
	padding-top: 5px;
	padding-left: 130px;
}

#rev {
	margin-top: 20px;
	padding-left: 130px;
}

#price {
	margin-top: -20px;
}

.container {
	padding-right: 100px;
	margin-top: -30px;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#main {
	min-height: 100%;
}
</style>

</head>
<body>
	<%@ include file="/views/common/user_TopBar.jsp"%>


	<div id="outer main">

		<br> <br> <br> <br>
		
		
		<%
		Request ro = new Request();
		ro = rolist.get(0);
		
		Date finishDay = ro.getReqFinish(); //견적매칭 종료일
		Date nowDay = new Date(); //현재날짜
		String moveDay = ro.getReservationDate(); //예약일(짐옮기는 날)
		  
		
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			
			nowDay = dateFormat.parse(dateFormat.format(nowDay));
			long nowTime = nowDay.getTime();
			//오늘 날,시간 getTime

			long finishTime = finishDay.getTime();
			//견적매칭 종료일 getTime
			
			
			
			long timeRemain = finishTime+86400000-nowTime;
			long timeReH = (timeRemain/60000)/60;
			long timeReM = (timeRemain/60000)%60;
			
		%>

		<h1 style="text-align: center">견적 입찰 내역</h1>
		<hr>

		<div style="text-align: center">
			<h4>현재 최저가</h4>
			<h2><%=minPrice %>원</h2>
			<p style="color: gray;">
				견적 번호 :
				<%=reqno%></p>
			<h5>남은 입찰 기간 : <%=timeReH %> 시간 &nbsp; <%=timeReM %> 분</h5>
			<h5>
				<a onclick="myJimcarry();">내 짐캐리 리스트 확인 하기</a>
			</h5>
			<hr>
		</div>
		
		<script>
		function myJimcarry(){
			location.href="/semi/myJcarrylist.jc";
		};
		
		</script>
		
		<%
		
			for (int i = 0; i < rolist.size(); i++) {
				ro = rolist.get(i);
		%>
		
		<div>
			<img src="../../images/driver.png" style="float: left" id="driverImg">
			<div id="drivername">
				<h3><%=ro.getDriverName() %></h3>
			</div>

			<div id="price" style="float: right">
				<h3>가격 : <%=ro.getOrderPrice() %>원</h3>
			</div>

			<div id="rev">
				<h4>평점 : <%=ro.getGrade() %></h4>
				<h4>리뷰 :<%=ro.getReview() %></h4>
			</div>


			<div class="container" align="right">
				<button type="button" class="btn" onclick="selectReqOrder();">선택하기</button>
			</div>
			<hr>
		</div>
		
		<% 
			}
		%>

		<br> <br> <br> <br> <br> <br> <br>
		<script>
		function selectReqOrder(){
			var url = "/semi/views/popup/pop_reqMatching.jsp";
			var winWidth = 400;
			var winHeight = 530;
			var popupW = (screen.availWidth - winWidth) / 2;
			var popupH = (screen.availHeight - winHeight) / 2;			
			var popOption = "status=no, width=" + winWidth + ", height=" + winHeight + ", top=" + popupH + ", left=" + popupW;			
			
			window.open(url,"",popOption);
		}
		
		</script>


	</div>





</body>
</html>