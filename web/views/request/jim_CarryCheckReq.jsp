<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, java.text.SimpleDateFormat, com.kh.jimcarry.request.model.vo.*"%>
	
<% 
Request req = (Request)request.getAttribute("r");
ArrayList<Product> plist = (ArrayList<Product>)request.getAttribute("plist");
%>	
	

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
		Date startDay = req.getReqStart(); //견적매칭 시작일
		Date finishDay = req.getReqFinish(); //견적매칭 종료일
		Date nowDay = new Date(); //현재날짜
		String moveDay = req.getReservationDate(); //예약일(짐옮기는 날)
		  
		
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			
			long startTime = startDay.getTime();
			//견적매칭 시작일 getTime
			
			nowDay = dateFormat.parse(dateFormat.format(nowDay));
			long nowTime = nowDay.getTime();
			//오늘 날,시간 getTime

			long finishTime = finishDay.getTime();
			//견적매칭 종료일 getTime
			
			
			
			long timeRemain = finishTime+86400000-nowTime;
			long timeReH = (timeRemain/60000)/60;
			long timeReM = (timeRemain/60000)%60;
			
			long dayCount =  (finishTime-startTime)/86400000;
			
			
		%>

		<h1 align="center">최종 견적서</h1>
		<hr>
		<div>
			<h3>예정일</h3>
			<p><%=req.getReservationDate() %>
			</p>
		</div>
		<hr>

		<div>
			<h3>출발지</h3>
			<p><%=req.getStartPoint() %></p>
		</div>
		<hr>

		<div>
			<h3>도착지</h3>
			<p><%=req.getArrivalPoint() %></p>
		</div>
		<hr>
		
		
		<%
		Product p = new Product();
		
		for(int i=0 ; i<plist.size() ; i++){
			p = plist.get(i);
		%>
			
			
			
		<%	
		}
		%>

		<!-- <div>
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
 -->
		<div>
			<h3>메모</h3>
			<p>앞에 메모란에 입력한 내용</p>

		</div>
		<hr>

		<div>
			<h3>입찰 받을 기간</h3>
			<p><%=req.getReqStart() %> ~ <%=req.getReqFinish() %> (총<%= dayCount %>일)</p>
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