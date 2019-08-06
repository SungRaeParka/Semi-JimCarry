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
			<select id="driver_filter" name="driver_filter">
				<option value="전체보기" selected>전체보기</option>
				<option value="매칭대기">매칭대기</option>
				<option value="매칭완료">매칭완료</option>
				<option value="이용대기">이용대기</option>
				<option value="이용완료">이용완료</option>
				<option value="정산대기">정산대기</option>
				<option value="정산완료">정산완료</option>
				<option value="취소">취소</option>
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
		long moveTime;
		
		long timeRemain;//남은시간
		long timeReH; //남은시간_시간
		long timeReM; //남은시간_분
		

		for (int i = 0; i < list.size(); i++) {
			req = list.get(i);
			
			finishDay = req.getReqFinish();  //견적매칭 종료일
			moveDay = req.getReservationDate(); //예약일(짐옮기는 날)
			
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			
			nowDay = dateFormat.parse(dateFormat.format(nowDay));
			nowTime = nowDay.getTime();
			
			Date moveDay2 = dateFormat.parse(moveDay);
			moveDay2 = dateFormat.parse(dateFormat.format(moveDay2));
			moveTime = moveDay2.getTime();
		
			finishDay = dateFormat.parse(dateFormat.format(finishDay));
			finishTime = finishDay.getTime();
				
			timeRemain = finishTime+86400000-nowTime;
			timeReH = (timeRemain/60000)/60;
			timeReM = (timeRemain/60000)%60;
			
			if (req.getConditionDo().equals("매칭대기")) {
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
					<span class="reqInfoBtn" style="cursor: pointer">상세짐보기 →</span>
					<input type="hidden" id="reqInfo" name="reqInfo" value="<%=req.getReqNo() %>">
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
			} else if (req.getConditionDo().equals("취소")) {
		%>
		
		<div class="matchCancel">
			<img src="/semi/images/mc7.png" class="imgs" style="float: left">

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
					<span class="reqInfoBtn" style="cursor: pointer">상세짐보기 →</span>
					<input type="hidden" id="reqInfo" name="reqInfo" value="<%=req.getReqNo() %>">
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
					<span class="reqInfoBtn" style="cursor: pointer">상세짐보기 →</span>
					<input type="hidden" id="reqInfo" name="reqInfo" value="<%=req.getReqNo() %>">
				</h3>

			</div>

			<hr>
		</div>





		<%
			} else if (req.getConditionDo().equals("이용대기")) {
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
					<span class="reqInfoBtn" style="cursor: pointer">상세짐보기 →</span>
					<input type="hidden" id="reqInfo" name="reqInfo" value="<%=req.getReqNo() %>">
				</h3>

			</div>

			<hr>
		</div>


		<%
			} else if (req.getConditionDo().equals("이용완료")) {
		%>
		<div class="usingOk">
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
					<span class="calculate" style="cursor: pointer">정산신청 →</span>
					<input type="hidden" id="price" name="price" value="<%=req.getOrderPrice()%>">
					<input type="hidden" id="reqNo" name="reqNo" value="<%=req.getReqNo() %>">
				</h3>

			</div>

			<hr>
		</div>
		

		<%
			} else if (req.getConditionDo().equals("정산대기")) {
		%>
		<div class="calWait">
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
			} else if(req.getConditionDo().equals("정산완료")){
		%>
		<div  class="calOk">
			<img src="/semi/images/mc6.png" class="imgs" style="float: left">

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

				<h3>정산이 완료 되었습니다.</h3>

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
				onclick="location.href='<%=request.getContextPath()%>/driverJcarrylist.jc?currentPage=1'"> << </button>

			<%
				if (currentPage <= 1) {
			%>
			<button disabled><</button>
			<%
				} else {
			%>
			<button
				onclick="location.href='<%=request.getContextPath()%>/driverJcarrylist.jc?currentPage=<%=currentPage - 1%>'"><</button>
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
				onclick="location.href='<%=request.getContextPath()%>/driverJcarrylist.jc?currentPage=<%=p%>'"><%=p%></button>
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
				onclick="location.href='<%=request.getContextPath()%>/driverJcarrylist.jc?currentPage=<%=currentPage + 1%>'">
				></button>
			<%} %>
			<button
				onclick="location.href='<%=request.getContextPath() %>/driverJcarrylist.jc?currentPage=<%=maxPage %>'">
				>></button>
		</div>
	</div>
	<script>
	
	$(function(){//견적상세보기
		$(".reqInfoBtn").click(function(){
			var no = $(this).next().val();
			var driver = '<%=loginUser.getSeqNo()%>';
			
			console.log(no);
			
			//$("#reqInfo").val(no);
			
			location.href="<%=request.getContextPath()%>/driverJcCheckReq.jc?no=" + no+"&driver="+driver;
		});
	});
	
	
	$(function(){
		$(".calculate").click(function(){ //정산신청 버튼
			var price = $(this).next().val();
			var driver = '<%=loginUser.getSeqNo()%>'
			var reqNo = $(this).next().next().val();
		
			

			var url = "/semi/views/popup/pop_Driver_Calculate.jsp?price="+price+"&driver="+driver+"&reqNo="+reqNo;

			var name = "calcPopup";
			var option = "with=300, height=250, top=30, left=50";
				

			window.open(url,name,option);

		})
	});
	
	
	$(function(){
		$("#driver_filter").change(function(){
			var status = $("#driver_filter").val();
			
			console.log(status);
			
			
			var matchWait = $(".matchWait");
			var matchOk = $(".matchOk");
			var usingWait = $(".usingWait");
			var usingOk = $(".usingOk");
			var calWait = $(".calWait");
			var calOk = $(".calOk");
			var matchCancel = $(".matchCancel");
			
			if(status == "전체보기"){
				matchWait.show();
				matchOk.show();
				usingWait.show();
				usingOk.show();
				calWait.show();
				calOk.show();
				matchCancel.show();
			}else if(status == "매칭대기"){
				matchWait.show();
				matchOk.hide();
				usingWait.hide();
				usingOk.hide();
				calWait.hide();
				calOk.hide();
				matchCancel.hide();
			}else if(status == "매칭완료"){
				matchWait.hide();
				matchOk.show();
				usingWait.hide();
				usingOk.hide();
				calWait.hide();
				calOk.hide();
				matchCancel.hide();
			}else if(status == "이용대기"){
				matchWait.hide();
				matchOk.hide();
				usingWait.show();
				usingOk.hide();
				calWait.hide();
				calOk.hide();
				matchCancel.hide();
			}else if(status == "이용완료"){
				matchWait.hide();
				matchOk.hide();
				usingWait.hide();
				usingOk.show();
				calWait.hide();
				calOk.hide();
				matchCancel.hide();
			}else if(status == "취소"){
				matchWait.hide();
				matchOk.hide();
				usingWait.hide();
				usingOk.hide();
				calWait.hide();
				calOk.hide();
				matchCancel.show();
			}else if(status == "정산완료"){
				matchWait.hide();
				matchOk.hide();
				usingWait.hide();
				usingOk.hide();
				calWait.hide();
				calOk.show();
				matchCancel.hide();
			}else if(status == "정산대기"){
				matchWait.hide();
				matchOk.hide();
				usingWait.hide();
				usingOk.hide();
				calWait.show();
				calOk.hide();
				matchCancel.hide();
			}									
		});
	});
	</script>
		
		
</body>
</html>