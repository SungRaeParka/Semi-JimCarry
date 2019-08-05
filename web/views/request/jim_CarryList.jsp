<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,java.text.SimpleDateFormat, com.kh.jimcarry.request.model.vo.*"%>

<%
	ArrayList<Request> jimList = (ArrayList<Request>) request.getAttribute("jimList");
	HashMap<String,Request> orderMap = (HashMap<String,Request>)request.getAttribute("orderMap");
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
			<select id="driver_filter" name="driver_filter">
				<option value="전체보기" selected>전체보기</option>
				<option value="매칭대기">매칭대기</option>
				<option value="매칭완료">매칭완료</option>
				<option value="이용대기">이용대기</option>
				<option value="이용완료">이용완료</option>
				<option value="취소">취소</option>
			</select>
		</div>

		<hr>

		<%
			Request req = new Request();
			Request reqOrder;

			Date finishDay = new Date(); //견적매칭 종료일
			Date nowDay = new Date(); //현재날짜
			String moveDay;
			
			long nowTime;  //오늘 날,시간 getTime
			long finishTime;  //견적매칭 종료일 getTime
			long moveTime;   //짐옮기는날
			
			long timeRemain;//남은시간
			long timeReH; //남은시간_시간
			long timeReM; //남은시간_분
			

			for (int i = 0; i < jimList.size(); i++) {
				req = jimList.get(i);
				
				finishDay = req.getReqFinish();  //견적매칭 종료일
				moveDay = req.getReservationDate(); //예약일(짐옮기는 날)
				
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				
				nowDay = dateFormat.parse(dateFormat.format(nowDay));
				nowTime = nowDay.getTime();
				System.out.println(nowDay);
				System.out.println(nowTime);
				//오늘 날,시간 getTime
				
				Date moveDay2 = dateFormat.parse(moveDay);
				moveDay2 = dateFormat.parse(dateFormat.format(moveDay2));
				moveTime = moveDay2.getTime();
				System.out.println(moveDay2);
				System.out.println(moveTime);
				//짐옮기는날 getTime
				
				finishDay = dateFormat.parse(dateFormat.format(finishDay));
				finishTime = finishDay.getTime();
				System.out.println(finishDay);
				System.out.println(finishTime);
				//견적매칭 종료일 getTime
				
				//입찰종료까지 남은시간 계산
				timeRemain = finishTime+86400000-nowTime;
				timeReH = (timeRemain/60000)/60;
				timeReM = (timeRemain/60000)%60;
				
				
				
				
				
				if (req.getConditionReq().equals("매칭대기")) {
		%>
		<div class="matchWait">
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
					<span class="reqInfoBtn" style="cursor: pointer">견적확인 →</span>
					<input type="hidden" id="reqInfo" name="reqInfo" value="<%=req.getReqNo() %>">
				</h4>
			</div>
			

			<div id="date" class="text">
				<h3>
					예약일 :
					<%=req.getReservationDate()%>
				</h3>
			</div>
			<div id="reqpri">
				<h4>
					<span class="orderInfoBtn" style="cursor: pointer">입찰내역 확인 →</span>
					<input type="hidden" id="orderInfo" name="orderInfo" value="<%=req.getReqNo() %>">
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
				reqOrder = orderMap.get(req.getReqNo());
		%>
		<div class="matchOk">
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
				<h4>
					이용요금 :
					<%=reqOrder.getOrderPrice()%></h4>
			</div>

			<div id="count" class="text">
				<h3>
					기사명 :
					<%= reqOrder.getDriverName() %>
					&nbsp;&nbsp;평점 :
					<%=reqOrder.getGrade()%></h3>
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
				reqOrder = orderMap.get(req.getReqNo());
				
				if(nowTime < moveTime){
		%>			
		
		<div class="usingWait">
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
				<h4>
					이용요금 :
					<%=reqOrder.getOrderPrice()%>
				</h4>
			</div>

			<div id="count" class="text">
				<h3>
					기사명 :
					<%= reqOrder.getDriverName() %>
					&nbsp;&nbsp;평점 :
					<%=reqOrder.getGrade()%></h3>
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
		<div class="usingWait">
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
				<h4>
					이용요금 :
					<%=reqOrder.getOrderPrice()%></h4>
			</div>

			<div id="count" class="text">
				<h3>
					기사명 :
					<%= reqOrder.getDriverName() %>
					&nbsp;&nbsp;평점 :
					<%=reqOrder.getGrade()%></h3>
			</div>
			<div id="reqcencle" align="right">

				<h3>
					<span id="doneBtn" style="cursor: pointer">완료하기 →</span>
					<input type="hidden" id="reqNo" value="<%=req.getReqNo() %>">
					<input type="hidden" id="driverNo" value="<%=reqOrder.getDriverNo() %>">
				</h3>

			</div>

			<hr>
		</div>
					
					
		<% 			
				}
		%>
		
		<%
			} else if (req.getConditionReq().equals("이용완료")) {
				reqOrder = orderMap.get(req.getReqNo());
		%>

		<div class="usingOk">
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
				<h4>이용요금 : <%=reqOrder.getOrderPrice() %></h4>
			</div>

			<div id="count" class="text">
				<h3>
					기사명 :
					<%= reqOrder.getDriverName() %>
					&nbsp;&nbsp;평점 :
					<%=reqOrder.getGrade()%></h3>
			</div>
			
			<div id="done" align="right">
				<h5>이용 완료된 견적 입니다.</h5>
			</div>

			<hr>
		</div>
		<%
			} else if (req.getConditionReq().equals("취소")) {
				reqOrder = orderMap.get(req.getReqNo());
		%>
		<div class="matchCancel">
			<img src="/semi/images/mc7.png" class="imgs" style="float: left">

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
				<h4>이용요금 : <%=reqOrder.getOrderPrice() %></h4>
			</div>

			<div id="count" class="text">
				<h3>
					기사명 :
					<%= reqOrder.getDriverName() %>
					&nbsp;&nbsp;평점 :
					<%=reqOrder.getGrade()%></h3>
			</div>
			
			<div id="done" align="right">
				<h5>취소된 견적 입니다.</h5>
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
			<button onclick="location.href='<%=request.getContextPath()%>/myJcarrylist.jc?currentPage=1'"> << </button>

			<%
				if (currentPage <= 1) {
			%>
			<button disabled><</button>
			<%
				} else {
			%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/myJcarrylist.jc?currentPage=<%=currentPage - 1%>'"><</button>
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
	$(function(){//견적상세보기
		$(".reqInfoBtn").click(function(){
			var no = $(this).next().val();
			
			console.log(no);
			
			//$("#reqInfo").val(no);
			
			location.href="<%=request.getContextPath()%>/checkReq.jc?no=" + no;
		});
	});

	
	
	$(function(){//입찰내역보기
		$(".orderInfoBtn").click(function(){
			var no = $(this).next().val();
			
			location.href="<%=request.getContextPath()%>/checkOrder.jc?no=" + no;
		});
	});
	
	
	$(function(){//완료버튼
		$("#doneBtn").click(function(){
			var user ='<%=loginUser.getSeqNo()%>';
			var req = $(this).next().val();
			var driver = $(this).next().next().val();
			
			console.log(user);
			console.log(req);
			console.log(driver);
			
			var url = "/semi/views/popup/pop_reqSuccess.jsp?user="+user+"&req="+req+"&driver="+driver;
			var name = "donePopup";
			var option = "with=300, height=350, top=30, left=50";
			
			window.open(url,name,option);
		})
	})
	
	
	
	
	$(function(){
		$("#driver_filter").change(function(){
			var status = $("#driver_filter").val();
			
			console.log(status);
			
			
			var matchWait = $(".matchWait");
			var matchOk = $(".matchOk");
			var usingWait = $(".usingWait");
			var usingOk = $(".usingOk");
			var matchCancel = $(".matchCancel");
			
			if(status == "전체보기"){
				matchWait.show();
				matchOk.show();
				usingWait.show();
				usingOk.show();
				matchCancel.show();
			}else if(status == "매칭대기"){
				matchWait.show();
				matchOk.hide();
				usingWait.hide();
				usingOk.hide();
				matchCancel.hide();
			}else if(status == "매칭완료"){
				matchWait.hide();
				matchOk.show();
				usingWait.hide();
				usingOk.hide();
				matchCancel.hide();
			}else if(status == "이용대기"){
				matchWait.hide();
				matchOk.hide();
				usingWait.show();
				usingOk.hide();
				matchCancel.hide();
			}else if(status == "이용완료"){
				matchWait.hide();
				matchOk.hide();
				usingWait.hide();
				usingOk.show();
				matchCancel.hide();
			}else if(status == "취소"){
				matchWait.hide();
				matchOk.hide();
				usingWait.hide();
				usingOk.hide();
				matchCancel.show();
			}			
		});
	});
	
	
	</script>


</body>
</html>