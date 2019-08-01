<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.jimcarry.admin.accounting.model.vo.*, java.text.DecimalFormat"%>
<%
ArrayList<AccountingRefund> list = (ArrayList<AccountingRefund>) request.getAttribute("list");
String refundMember = list.get(0).getRefundMember();
DecimalFormat df = new DecimalFormat("###,###,###,###");

%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
table, th {
	border: 1px solid black;
	border-collapse: collapse;
	border-radius: 20%;
	align: center;
	text-align: center;
}

table th, table td {
	text-align: center
}

table {
	width: 100%;
	height: 100px;
	margin: auto;
}

th {
	padding: 15px;
}

select {
	float: right;
	margin-top: -30px;
}
</style>

</head>

<body>
	<%@ include file="/views/common/admin_TopBar.jsp"%>

	<div class="container" style="margin-top: 70px;">
		<h2>정산관리</h2>
		<br />

		<ul class="nav nav-tabs">
				<li><a  href="/semi/accounting.pr">기간</a></li>
				<li><a  href="/semi/accounting.mm">맴버</a></li>
				<li class="active"><a  href="/semi/accounting.rf">환불관리</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade"></div>
			<div id="menu1" class="tab-pane fade"></div>
			<div id="menu2" class="tab-pane fade in active">
				<br>
				<form id="refundForm">
					<select id="refund" name="refundSelect">
						<option id="allRefund" value="전체">전체</option>
						<option id="Refunding" value="환불대기">환불대기</option>
						<option id="yesRefund" value="완료">완료</option>
						<option id="noRefund" value="반려">반려</option>
					</select>
				</form>
				<br>
				<br>
				<div class="refundT">
					<table border="1">
						<tr>
							<th>결제이력번호</th>
							<th>예약(이용)일자</th>
							<th>회원명</th>
							<th>환불신청날짜</th>
							<th>결제금액</th>
							<th>환불수수료</th>
							<th>환불사유</th>
							<th>환불상태</th>
							<th>반려사유</th>
						</tr>
						<% for(AccountingRefund ar : list){ %>
						<tr>
							<td><%=ar.getPayNo() %></td>
							<td><%=ar.getReservationDate() %></td>
							<td><%=ar.getMemberName() %></td>
							<td><%=ar.getRefundReqDate() %></td>
							<td><%=df.format(ar.getPayAmount()) %></td>
							<td><%=df.format(ar.getRefundFees()) %></td>
							<td><%=ar.getRefundReason() %></td>
							<td><%=ar.getRefundCondition() %></td>
							<td><%=ar.getCompanionReason() %></td>
						</tr>
						<% } %>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script>
			$(function () {
				var refundMember = "<%= refundMember %>";
				console.log("refundMember : " + refundMember);
				if(refundMember==null || refundMember=="전체"){
					$('#allRefund').attr("selected", "selected");
				}else if(refundMember=="환불대기"){
					$('#Refunding').attr("selected", "selected");
				}else if(refundMember=="완료"){
					$('#yesRefund').attr("selected", "selected");
				}else if(refundMember=="반려"){
					$('#noRefund').attr("selected", "selected");
				}
			});

			$('#refund').change(function () {
				var state = $('#refund option:selected').val();
				if (state == '전체') {
					$("#refundForm").attr("action", "<%=request.getContextPath()%>/accounting.rf");
					$("#refundForm").submit();
				} else if (state == '환불대기') {
					$("#refundForm").attr("action", "<%=request.getContextPath()%>/accounting.rf");
					$("#refundForm").submit();
				} else if (state == '완료') {
					$("#refundForm").attr("action", "<%=request.getContextPath()%>/accounting.rf");
					$("#refundForm").submit();
				}else if (state == '반려') {
					$("#refundForm").attr("action", "<%=request.getContextPath()%>/accounting.rf");
					$("#refundForm").submit();
				}
				});
			</script>


</body>

</html>