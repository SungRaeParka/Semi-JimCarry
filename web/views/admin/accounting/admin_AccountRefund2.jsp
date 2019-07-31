<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.jimcarry.admin.accounting.model.vo.*, java.text.DecimalFormat"%>
<%
ArrayList<AccountingRefund> list = (ArrayList<AccountingRefund>) request.getAttribute("list");
String refundMember = list.get(0).getRefundMember();
DecimalFormat df = new DecimalFormat("###,###,###,###");
int index = 0;
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
			<li><a href="/semi/views/admin/accounting/admin_AccountPeriod.jsp">기간</a></li>
			<li><a href="/semi/views/admin/accounting/admin_AccountMember.jsp">맴버</a></li>
			<li class="active"><a data-toggle="tab" href="#menu2">환불관리</a></li>
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
							<% for(AccountingRefund ar : list){index++; %>
							<tr>
								<td>
									<%=ar.getPayNo() %>
								</td>
								<td>
									<%=ar.getReservationDate() %>
								</td>
								<td>
									<%=ar.getMemberName() %>
								</td>
								<td>
									<%=ar.getRefundReqDate() %>
								</td>
								<td>
									<%=df.format(ar.getPayAmount()) %>
								</td>
								<td>
									<%=df.format(ar.getRefundFees()) %>
								</td>
								<td>
									<%=ar.getRefundReason() %>
								</td>
								<td>
									<!-- <button type="button" id="activation" name=upRefund value="0" onclick="upRefund('<%=index%>')">
										<%=ar.getRefundCondition() %></button>
									<input type="hidden" id="prompt" name="prompt">
									<input type="hidden" id="resultR" name="resultR">
									<input type="hidden" id="payNo<%=index%>" value="<%=ar.getPayNo()%>">
									<input type="hidden" id="upRefundResult" name="payNo"> -->
									<button type="button" id="activation" name="resultD" value="0" onclick="removeBL('<%=index %>');">
										<%=ar.getRefundCondition() %></button>
									<input type="hidden" id="prompt" name="prompt">
									<input type="hidden" id="resultD" name="resultD">
									<input type="hidden" id="driverNo<%=index%>" value="<%=ar.getPayNo()%>">
									<input type="hidden" id="buttonText<%=index%>" value="<%=ar.getRefundCondition()%>">
									<input type="hidden" id="driverNoResult" name="driverNo">

								</td>
								<td>
									<%=ar.getCompanionReason() %>
								</td>
							</tr>
							<% } %>
						</table>
				</form>
			</div>
		</div>
	</div>
	</div>
	<script>
		//관리자>정산관리>환
		$(function () {
			var refundMember = "<%= refundMember %>";
			console.log("refundMember : " + refundMember);
			if (refundMember == null || refundMember == "전체") {
				$('#allRefund').attr("selected", "selected");
			} else if (refundMember == "환불대기") {
				$('#Refunding').attr("selected", "selected");
			} else if (refundMember == "완료") {
				$('#yesRefund').attr("selected", "selected");
			} else if (refundMember == "반려") {
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
			} else if (state == '반려') {
				$("#refundForm").attr("action", "<%=request.getContextPath()%>/accounting.rf");
				$("#refundForm").submit();
			}
		});



		// function upRefund(num) {
		// 	var buttonText = document.getElementById("activation").innerText;
		// 	if (buttonText == "대기") {

		// 		var result = window.prompt("해당 고객님에게 환불 반려 사유를 남겨주세요.")
		// 		var prompt = document.getElementById("prompt");
		// 		var upRefund = document.getElementById("activation").value;
		// 		$("#prompt").attr('value', result);
		// 		$("#resultD").attr('value', upRefund);
		// 		// console.log("resultD" + resultD);
		// 		// console.log("result : " + result);

		// 		var payNo = $("#payNo" + num).val();
		// 		$("#upRefundResult").attr('value', payNo);
		// 		// alert(driverNo);
		// 		if (result != null) {
		// 			//해당 기사에게 블랙리스트 해제 사유 메시지 보내기
		// 			//DB 해당사유 컬럼에도 저장. 같은 기사가 서로 다른 사유로 오게 되면 따로 관리하여 계속 같은 기사 아이디로 새로 생긴다.
		// 			$("#refundForm").attr("action", "<%=request.getContextPath()%>/updateRefund")
		// 			$("#refundForm").submit()

		// 		} else {
		// 			//해당 작업 취소
		// 			location.href = "/semi/blackList.d";
		// 		}
		// 	}
		// };

		function removeBL(num) {
			var buttonText = $("#buttonText" + num).val();
			console.log("buttonText: " + buttonText);
			if (buttonText == "대기") {
				var result = window.prompt("해당 고객님에게 환불 반려 사유를 남겨주세요.")
				var prompt = document.getElementById("prompt");
				var resultD = document.getElementById("activation").value;
				$("#prompt").attr('value', result);
				$("#resultD").attr('value', resultD);
				console.log("resultD" + resultD);
				console.log("result : " + result);

				var driverNo = $("#driverNo" + num).val();
				$("#driverNoResult").attr('value', driverNo);
				alert(driverNo);
				if (result != null) {
					//해당 기사에게 블랙리스트 해제 사유 메시지 보내기
					//DB 해당사유 컬럼에도 저장. 같은 기사가 서로 다른 사유로 오게 되면 따로 관리하여 계속 같은 기사 아이디로 새로 생긴다.
					$("#refundForm").attr("action", "<%=request.getContextPath()%>/accountingUpdate.rf")
					$("#refundForm").submit()

				} else {
					//해당 작업 취소
					location.href = "/semi/accounting.rf";
				}
			}
		}


	</script>


</body>

</html>