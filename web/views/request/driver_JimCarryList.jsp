<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,java.text.SimpleDateFormat, com.kh.jimcarry.request.model.vo.*"%>

<%
	ArrayList<Request> list = (ArrayList<Request>) request.getAttribute("list");
	PageInfo pi = (PageInfo) request.getAttribute("pi");
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartpage();
	int endPage = pi.getEndPage();
%>


<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>기사 짐캐리 리스트</title>
<!-- 
<style>
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#main {
	min-height: 100%;
}
</style>
 -->
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

.imgs {
	width: 150px;
	height: 150px;
}

#reqno {
	float: right;
}

.text {
	padding-left: 200px;
}

#title {
	padding-top: 3px;
}

#date {
	padding-top: 5px;
}

#count {
	padding-top: 3px;
}

#reqInfo, #reqpri, #reqprice {
	float: right;
}

#reqInfo {
	margin-top: -10px;
}

#reqpri {
	margin-top: -20px;
}

#reqprice {
	margin-top: -25px;
}

#time, #reqcencle, #done {
	margin-top: -15px;
}
</style>
 
 
 
</head>
<body>
	<%@ include file="/views/common/driver_TopBar.jsp"%>

	<div id="outer">
	<br> <br> <br> <br>
	
	
		<h1>기사 짐캐리 리스트</h1>

		<div id="filt" align="right">
			<select name="driver_filter">
				<option value="전체 보기" selected>전체 보기</option>
				<option value="매칭대기">매칭대기</option>
				<option value="매칭완료">매칭완료</option>
				<option value="이용대기">이용대기</option>
				<option value="이용완료">이용완료</option>
				<option value="정산대기">정산대기</option>
				<option value="정산완료">정산완료</option>
				<option value="매칭취소">매칭취소</option>
			</select>
		</div>

		<hr>

		<%
		Request req = new Request();

		Date finishDay = new Date(); 
		Date nowDay = new Date(); 
		String moveDay;
		
		long nowTime;  
		long finishTime; 
		
		long timeRemain;//남은시간
		long timeReH; //남은시간_시간
		long timeReM; //남은시간_분
		

		for (int i = 0; i < list.size(); i++) {
			req = list.get(i);
			
			finishDay = req.getReqFinish();  //견적매칭 종료일
			moveDay = req.getReservationDate(); //예약일(짐옮기는 날)
			
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			
			nowDay = dateFormat.parse(dateFormat.format(nowDay));
			nowTime = nowDay.getTime();
		
			finishTime = finishDay.getTime();
				
			timeRemain = finishTime+86400000-nowTime;
			timeReH = (timeRemain/60000)/60;
			timeReM = (timeRemain/60000)%60;
			
			if (req.getConditionDo().equals("매칭대기")) {
	%>
		<div>
			<img src="/semi/images/mc1.png" class="imgs" style="float: left">

			<div id="reqno">
				<p>
					견적번호 :
					<%=req.getReqNo()%></p>
			</div>

			<div id="title" class="text">
				<h1><%=req.getStartPoint()%>
					→
					<%=req.getArrivalPoint()%></h1>
			</div>
			
			<div id="reqInfo">
				<h4>
					<a href="#">상세 짐보기→</a>
				</h4>
			</div>
			
			<div id="date" class="text">
				<h3>
					예약일 :
					<%=req.getReservationDate()%>
				</h3>
			</div>
			
			<div id="reqprice">
				<h4>
					이용요금 :
					<%=req.getOrderPrice()%></h4>
			</div>
			
			
			<div id="count" class="text">
				<h3>
					입찰 견적 수 :
					<%=req.getReqCount()%></h3>
			</div>
			<div id="time" align="right">

				<h3>남은 시간 : <%=timeReH %> 시간 &nbsp; <%=timeReM %> 분</h3>

			</div>
			<hr>
		</div>
		
		
		

		<%
			} else if (req.getConditionDo().equals("매칭취소")) {
		%>
		
		<div>
			<img src="/semi/images/mc1.png" class="imgs" style="float: left">

			<div id="reqno">
				<p>
					견적번호 :
					<%=req.getReqNo()%></p>
			</div>

			<div id="title" class="text">
				<h1><%=req.getStartPoint()%>
					→
					<%=req.getArrivalPoint()%></h1>
			</div>
			

			<div id="date" class="text">
				<h3>
					예약일 :
					<%=req.getReservationDate()%>
				</h3>
			</div>
			
			<div id="reqprice">
				<h3>
					<a href="#">상세 짐 보기→</a>
				</h3>
			</div>

			<div id="count" class="text">
				<h3>
					입찰 견적 수 :
					<%=req.getReqCount()%></h3>
			</div>
			<div id="time" align="right">
				<h3>입찰 취소된 내역 입니다.</h3>
			</div>
			<hr>
		</div>
		
		
		<%
			} else if (req.getConditionDo().equals("매칭완료")) {
		%>
		<div>
			<img src="/semi/images/mc2.png" class="imgs" style="float: left">

			<div id="reqno">
				<p>
					견적번호 :
					<%=req.getReqNo()%></p>
			</div>

			<div id="title" class="text">
				<h1><%=req.getStartPoint()%>
					→
					<%=req.getArrivalPoint()%></h1>
			</div>


			<div id="date" class="text">
				<h3>
					예약일 :
					<%=req.getReservationDate()%>
				</h3>
			</div>
			<div id="reqprice">
				<h3>
					이용요금 :
					<%=req.getOrderPrice()%></h3>
			</div>

			<div id="count" class="text">
				<h3>
					고객명 :
					<%=req.getUserName()%>
				</h3>
			</div>
			<div id="reqcencle" align="right">

				<h3>
					<a href="#">상세 짐보기→</a>
				</h3>

			</div>

			<hr>
		</div>





		<%
			} else if (req.getConditionDo().equals("이용대기")) {
		%>
		<div>
			<img src="/semi/images/mc3.png" class="imgs" style="float: left">

			<div id="reqno">
				<p>
					견적번호 :
					<%=req.getReqNo()%></p>
			</div>

			<div id="title" class="text">
				<h1><%=req.getStartPoint()%>
					→
					<%=req.getArrivalPoint()%></h1>
			</div>


			<div id="date" class="text">
				<h3>
					예약일 :
					<%=req.getReservationDate()%>
				</h3>
			</div>
			<div id="reqprice">
				<h3>
					이용요금 :
					<%=req.getOrderPrice()%></h3>
			</div>

			<div id="count" class="text">
				<h3>
					고객명 :
					<%=req.getUserName()%>
				</h3>
			</div>
			<div id="reqcencle" align="right">

				<h3>
					<a href="#">상세 짐보기→</a>
				</h3>

			</div>

			<hr>
		</div>


		<%
			} else if (req.getConditionDo().equals("이용완료")) {
		%>
		<div>
			<img src="/semi/images/mc4.png" class="imgs" style="float: left">

			<div id="reqno">
				<p>
					견적번호 :
					<%=req.getReqNo()%></p>
			</div>

			<div id="title" class="text">
				<h1><%=req.getStartPoint()%>
					→
					<%=req.getArrivalPoint()%></h1>
			</div>


			<div id="date" class="text">
				<h3>
					완료일 :
					<%=req.getReservationDate()%>
				</h3>
			</div>
			<div id="reqprice">
				<h3>
					이용요금 :
					<%=req.getOrderPrice()%></h3>
			</div>

			<div id="count" class="text">
				<h3>
					고객명 :
					<%=req.getUserName()%>
				</h3>
			</div>
			<div id="reqcencle" align="right">

				<h3>
					<a href="#">정산신청→</a>
				</h3>

			</div>

			<hr>
		</div>
		

		<%
			} else if (req.getConditionDo().equals("정산대기")) {
		%>
		<div>
			<img src="/semi/images/mc5.png" class="imgs" style="float: left">

			<div id="reqno">
				<p>
					견적번호 :
					<%=req.getReqNo()%></p>
			</div>

			<div id="title" class="text">
				<h1><%=req.getStartPoint()%>
					→
					<%=req.getArrivalPoint()%></h1>
			</div>


			<div id="date" class="text">
				<h3>
					완료일 :
					<%=req.getReservationDate()%>
				</h3>
			</div>
			<div id="reqprice">
				<h3>
					이용요금 :
					<%=req.getOrderPrice()%></h3>
			</div>

			<div id="count" class="text">
				<h3>
					고객명 :
					<%=req.getUserName()%>
				</h3>
			</div>
			<div id="reqcencle" align="right">

				<h3>정산 신청이 완료 되었습니다.</h3>

			</div>

			<hr>
		</div>
		

		<%
			} else {
		%>
		

		<%
			}

			}
		%>

		<br> <br> <br> <br>
		
		<%-- 페이징처리 --%>
		<div class="pagingArea" align="center">
			<button
				onclick="location.href='<%=request.getContextPath()%>/myJcarrylist.jc?currentPage=1'">
				<<</button>

			<%
				if (currentPage <= 1) {
			%>
			<button disabled><</button>
			<%
				} else {
			%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/myJcarrylist.jc?currentPage=<%=currentPage - 1%>'">
				<</button>
			<%
				}
			%>


			<%
				for (int p = startPage; p <= endPage; p++) {
					if (currentPage == p) {
			%>
			<button disabled><%=p%></button>
			<%
				} else {
			%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/myJcarrylist.jc?currentPage=<%=p%>'"><%=p%></button>
			<%
				}
				}
			%>

			<%
				if (currentPage >= maxPage) {
			%>
			<button disabled>></button>
			<%
				} else {
			%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/myJcarrylist.jc?currentPage=<%=currentPage + 1%>'">
				></button>
			<%} %>
			<button
				onclick="location.href='<%=request.getContextPath() %>/myJcarrylist.jc?currentPage=<%=maxPage %>'">
				>></button>

		</div>


	</div>
	
	


<%-- 
	<hr><hr><hr><hr>
	<div style="display: table">
			<div style="float: left">
				<img src="/semi/images/mc1.png"
					style="width: 120px; height: 120px; margin-left: 50px; margin-top: 30px; margin-bottom: 30px;">
			</div>
			<div style="float: left; padding-left: 20px; padding-top: 20px;">
				<span style="font-size: 40px; font-weight: bold;"><%=req.getStartPoint() %></span> 
				<span style="font-size: 40px; font-weight: bold;">→</span> 
				<span style="font-size: 40px; font-weight: bold;"><%=req.getArrivalPoint() %></span> <br> <span
					style="font-size: 20px;">고객명 : <%=req.getUserName() %></span> <br> <span
					style="font-size: 20px;">받은 견적수 : <%=req.getReqCount() %></span> <br> <span
					style="font-size: 20px;">입찰 요금 : <%=req.getOrderPrice() %></span>
			</div>
			<div style="float: left; padding-left: 230px; padding-top: 100px;">
				<a href="#" style="text-decoration: none;"> <span
					style="font-size: 30px">상세 견적 보기</span>
				</a>
			</div>
			<div style="float: right;">
				<span style="font-size: 30px">남은 시간 : <%=timeReH %>시간 &nbsp; <%=timeReM %> 분</span>
			</div>
		</div>

		<hr>
		
	
	
		
		<div style="display: table">
			<div style="float: left">
				<img src="../../images/main_4.png"
					style="width: 120px; height: 120px; margin-left: 50px; margin-top: 30px; margin-bottom: 30px;">
			</div>
			<div style="float: left; padding-left: 20px; padding-top: 20px;">
				<span style="font-size: 40px; font-weight: bold;">출발지</span> <span
					style="font-size: 40px; font-weight: bold;">→</span> <span
					style="font-size: 40px; font-weight: bold;">도착지</span> <br> <span
					style="font-size: 20px;">고객명 : 박성래</span> <br> <span
					style="font-size: 20px;">이용일 : 2019-07-02</span> <br> <span
					style="font-size: 20px;">입찰 요금 : 140,000원</span>
			</div>
			<div style="float: left; padding-left: 230px; padding-top: 100px;">
				<a href="#" style="text-decoration: none;"> <span
					style="font-size: 30px">이용 완료 처리</span>
				</a>
			</div>
		</div>

		<hr>

		<div style="display: table">
			<div style="float: left">
				<img src="../../images/main_4.png"
					style="width: 120px; height: 120px; margin-left: 50px; margin-top: 30px; margin-bottom: 30px;">
			</div>
			<div style="float: left; padding-left: 20px; padding-top: 20px;">
				<span style="font-size: 40px; font-weight: bold;">출발지</span> <span
					style="font-size: 40px; font-weight: bold;">→</span> <span
					style="font-size: 40px; font-weight: bold;">도착지</span> <br> <span
					style="font-size: 20px;">고객명 : 박성래</span> <br> <span
					style="font-size: 20px;">이용일 : 2019-07-02</span> <br> <span
					style="font-size: 20px;">입찰 요금 : 140,000원</span>
			</div>
			<div style="float: left; padding-left: 200px; padding-top: 100px;">
				<span style="font-size: 15px">고객이 완료 처리시 정산 신청이 가능합니다.</span>
			</div>
		</div>

		<hr>

		<div style="display: table">
			<div style="float: left">
				<img src="../../images/main_4.png"
					style="width: 120px; height: 120px; margin-left: 50px; margin-top: 30px; margin-bottom: 30px;">
			</div>
			<div style="float: left; padding-left: 20px; padding-top: 20px;">
				<span style="font-size: 40px; font-weight: bold;">출발지</span> <span
					style="font-size: 40px; font-weight: bold;">→</span> <span
					style="font-size: 40px; font-weight: bold;">도착지</span> <br> <span
					style="font-size: 20px;">고객명 : 박성래</span> <br> <span
					style="font-size: 20px;">이용일 : 2019-07-02</span> <br> <span
					style="font-size: 20px;">입찰 요금 : 140,000원</span>
			</div>
			<div style="float: left; padding-left: 230px; padding-top: 100px;">
				<a href="/semi/views/request/popup/pop_Driver_Calculate.jsp"
					style="text-decoration: none;"> <span style="font-size: 30px">정산
						신청</span>
				</a>
			</div>
		</div>

		<hr>

		<div style="display: table">
			<div style="float: left">
				<img src="../../images/main_4.png"
					style="width: 120px; height: 120px; margin-left: 50px; margin-top: 30px; margin-bottom: 30px;">
			</div>
			<div style="float: left; padding-left: 20px; padding-top: 20px;">
				<span style="font-size: 40px; font-weight: bold;">출발지</span> <span
					style="font-size: 40px; font-weight: bold;">→</span> <span
					style="font-size: 40px; font-weight: bold;">도착지</span> <br> <span
					style="font-size: 20px;">고객명 : 박성래</span> <br> <span
					style="font-size: 20px;">이용일 : 2019-07-02</span> <br> <span
					style="font-size: 20px;">입찰 요금 : 140,000원</span> <br> <span
					style="font-size: 20px;">정산 요금 : 120,000원</span>
			</div>
			<div style="float: left; padding-left: 200px; padding-top: 100px;">
				<span style="font-size: 15px">정산이 완료된 내역입니다.</span>
			</div>
		</div>

		<hr>
		 --%>
		
		
		
	</div>
</body>
</html>