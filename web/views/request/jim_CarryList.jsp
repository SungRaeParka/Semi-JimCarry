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
<meta charset="UTF-8">
<title>내 짐캐리 리스트</title>
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
	<%@ include file="/views/common/user_TopBar.jsp"%>

	<div id="outer">
		<br> <br> <br> <br>

		<h1>내 짐캐리 리스트</h1>

		<div id="filt" align="right">
			<select name="driver_filter">
				<option value="전체보기" selected>전체보기</option>
				<option value="매칭대기">매칭대기</option>
				<option value="매칭완료">매칭완료</option>
				<option value="매칭완료">매칭완료</option>
				<option value="이용완료">이용완료</option>
			</select>
		</div>

		<hr>

		<%
			Request req = new Request();

			Date startDay = new Date(); //견적매칭 시작일
			Date finishDay = new Date(); //견적매칭 종료일
			Date nowDay = new Date(); //현재날짜
			Date moveDay = new Date(); //예약일(짐옮기는 날)
			int moveTimeH;  //예약일 짐옮기는 시간
			String ampm;  //오전오후 출력용
			long plusTimeS;  //이용날 + 이용시간 -> 버튼 바뀌는 시점 설정 위해
			
			long startTime; //견적매칭 시작일 getTime
			long nowTime;  //오늘 날,시간 getTime
			long finishTime;  //견적매칭 종료일 getTime
			long moveTime;  //짐옮기는날 getTime
			
			
			long timeRemain;//남은시간
			long timeReH; //남은시간_시간
			long timeReM; //남은시간_분
			

			for (int i = 0; i < list.size(); i++) {
				req = list.get(i);
				
				startDay = req.getReqStart();  //견적매칭 시작일
				finishDay = req.getReqFinish();  //견적매칭 종료일
				moveDay = req.getReservationDate(); //예약일(짐옮기는 날)
				moveTimeH = req.getReservationTime(); //예약일 짐옮기는 시간
				
				//plusTimeS = moveTimeH*3600000;  //이용시간getTime -> 버튼 바뀌는 시점 설정 위해
				//하루 : 86400000 1시간 : 3600000
				
				
				if(moveTimeH<12){
					ampm="오전";
				}else if(moveTimeH==12){
					ampm="오후";
				}else{
					ampm="오후";					
					moveTimeH -=12;
				}
				
				
				
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm");
				
				startTime = startDay.getTime();
				//견적매칭 시작일 getTime
				
				nowDay = dateFormat.parse(dateFormat.format(nowDay));
				nowTime = nowDay.getTime();
				//오늘 날,시간 getTime

				finishTime = finishDay.getTime();
				//견적매칭 종료일 getTime
				
				moveTime = moveDay.getTime();
				//짐옮기는날 getTime
				
				
				timeRemain = finishTime+86400000-nowTime;
				timeReH = (timeRemain/60000)/60;
				timeReM = (timeRemain/60000)%60;
				
				if (req.getConditionReq().equals("매칭대기")) {
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
					<input type="hidden" value="<%=req.getReqNo() %>">
					<a id="reqInfoBtn">견적확인 →</a>
				</h4>
			</div>

			<div id="date" class="text">
				<h3>
					예약일 :
					<%=req.getReservationDate()%>&nbsp;
					<%=ampm %><%=moveTimeH %>시
				</h3>
			</div>
			<div id="reqpri">
				<h4>
					<a href="/semi/views/request/req_ReqList.jsp">입찰내역 확인 →</a>
				</h4>
			</div>

			<div id="count" class="text">
				<h3>
					받은 견적 수 :
					<%=req.getReqCount()%></h3>
			</div>
			<div id="time" align="right">

				<h3>남은 시간 : <%=timeReH %> 시간 &nbsp; <%=timeReM %> 분</h3>

			</div>
			<hr>
		</div>

		<%
			} else if (req.getConditionReq().equals("매칭완료")) {
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
					<%=req.getReservationDate()%>&nbsp;
					<%=ampm %><%=moveTimeH %>시
				</h3>
			</div>
			<div id="reqprice">
				<h4>
					이용요금 :
					<%=req.getOrderPrice()%></h4>
			</div>

			<div id="count" class="text">
				<h3>
					기사명 :
					<%=req.getDriverName()%>
					&nbsp;&nbsp;평점 :
					<%=req.getGrade()%></h3>
			</div>
			<div id="reqcencle" align="right">

				<h3>
					<a href="/semi/views/request/popup/pop_reqCancel.jsp">입찰 취소→</a>
				</h3>

			</div>

			<hr>
		</div>


		<%
			} else if (req.getConditionReq().equals("이용대기")) {
				
				System.out.println(nowTime);
				System.out.println(moveTime+moveTimeH*3600000);
				
				
				if(nowTime < moveTime+moveTimeH*3600000){
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
					<h3>
					예약일 :
					<%=req.getReservationDate()%>&nbsp;
					<%=ampm %><%=moveTimeH %>시
				</h3>
			</div>
			<div id="reqprice">
				<h4>
					이용요금 :
					<%=req.getOrderPrice()%></h4>
			</div>

			<div id="count" class="text">
				<h3>
					기사명 :
					<%=req.getDriverName()%>
					&nbsp;&nbsp;평점 :
					<%=req.getGrade()%></h3>
			</div>
			<div id="reqcencle" align="right">

				<h3>
					<a href="/semi/views/request/popup/pop_reqCancel.jsp">입찰 취소→</a>
				</h3>

			</div>

			<hr>
		</div>
					
		<% 		
				}else{
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
					<%=req.getReservationDate()%>&nbsp;
					<%=ampm %><%=moveTimeH %>시
				</h3>
			</div>
			<div id="reqprice">
				<h4>
					이용요금 :
					<%=req.getOrderPrice()%></h4>
			</div>

			<div id="count" class="text">
				<h3>
					기사명 :
					<%=req.getDriverName()%>
					&nbsp;&nbsp;평점 :
					<%=req.getGrade()%></h3>
			</div>
			<div id="reqcencle" align="right">

				<h3>
					<a href="#">완료하기→</a>
				</h3>

			</div>

			<hr>
		</div>
					
					
		<% 			
				}
		%>
		
		<%
			} else if (req.getConditionReq().equals("이용완료")) {
		%>

		<div>
			<img src="/semi/images/mc4.png" class="imgs" style="float: left">

			<div id="reqno">
				<p>견적번호 : <%=req.getReqNo() %></p>
			</div>

			<div id="title" class="text">
				<h1><%=req.getStartPoint() %> → <%=req.getArrivalPoint() %></h1>
			</div>


			<div id="date" class="text">
				<h3>완료일 : <%=req.getReservationDate() %></h3>
			</div>
			<div id="reqprice">
				<h4>이용요금 : <%=req.getOrderPrice() %></h4>
			</div>

			<div id="count" class="text">
				<h3>기사명 : <%=req.getDriverName() %> &nbsp;&nbsp;평점 : <%=req.getGrade() %></h3>
			</div>
			
			<div id="done" align="right">
				<h5>이용 완료된 견적 입니다.</h5>
			</div>

			<hr>
		</div>
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
	
	
	
	<script>
	$(function(){
		$("#reqInfoBtn").click(function(){
			var no = $(this).parent().children("input").val();
			
			location.href="<%=request.getContextPath()%>/checkReq.jc?no=" + no;
		});
	});
	
	
	
	</script>



</body>
</html>