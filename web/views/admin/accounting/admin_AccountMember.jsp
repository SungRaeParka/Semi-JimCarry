<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jimcarry.admin.accounting.model.vo.*, java.text.DecimalFormat"%>
<%
	ArrayList<AccountingMember> list = (ArrayList<AccountingMember>) request.getAttribute("list");
	String userDriver = list.get(0).getUserDriver();
	DecimalFormat df = new DecimalFormat("###,###,###,###");
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
		table,
		th {
			border: 1px solid black;
			border-collapse: collapse;
			border-radius: 20%;
			align: center;
			text-align: center;
		}

		table th,
		table td {
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
	<%@ include file="/views/common/admin_TopBar.jsp" %>

	<div class="container" style="margin-top: 70px;">
		<h2>정산관리</h2>
		<br />

		<ul class="nav nav-tabs">
			<li><a  href="/semi/accounting.pr">기간</a></li>
			<li class="active"><a  href="/semi/accounting.mm">맴버</a></li>
			<li><a  href="/semi/accounting.rf">환불관리</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade"></div>
			<div id="menu1" class="tab-pane fade in active">
		<br>
				<form id="memberForm">
				<select id="memberSelect" name="memberSelect">
					<option id="user" value="사용자">사용자</option>
					<option id="driver" value="기사">기사</option>
				</select>
				</form>
				<br><br>
				<div class="memberT">
					<table border="1px">
						<tr>
							<th>회원명</th>
							<th>회원번호</th>
							<th>아이디</th>
							<th>결제이력번호</th>
							<th>예약(이용)일자</th>
							<th>
							<%if(userDriver=="사용자"){%>
								결제금액
							<%}else{ %>
								정산금액
							<%} %>
							</th>
							<th>결제일</th>
							<th>환불상태</th>
						</tr>
						<% for(AccountingMember am : list){ %>
						<tr>
								<td><%=am.getMemberName() %></td>
								<td><%=am.getMemberNo() %></td>
								<td><%=am.getMemberId() %></td>
								<td><%=am.getPayNo() %></td>
								<td><%=am.getReservationDate() %></td>
								<td><%if(userDriver=="사용자"){%>
									<%=am.getPayAmount() %>
									<%}else{ %>
									<%=am.getDriverPay() %>
									<%} %>
								</td>
								<td><%=am.getPayDate() %></td>
								<td><%=am.getRefundReq() %></td>
						</tr>
						<% } %>
					</table>
				</div>
			</div>
			<script>
				//관리자>정산관리>멤버
				$(function () {
				var userDriver = "<%= userDriver %>";
				console.log("userDriver : " + userDriver);
				if(userDriver==null || userDriver=="사용자"){
					$('#user').attr("selected", "selected");
				}else if(userDriver=="기사"){
					$('#driver').attr("selected", "selected");
				}
			});

			$('#memberSelect').change(function () {
				var state = $('#memberSelect option:selected').val();
				if (state == '사용자') {
					$("#memberForm").attr("action", "<%=request.getContextPath()%>/accounting.mm");
					$("#memberForm").submit();
				} else if (state == '기사') {
					$("#memberForm").attr("action", "<%=request.getContextPath()%>/accounting.mm");
					$("#memberForm").submit();
				}
				});
			</script>
			<div id="menu2" class="tab-pane fade"></div>
		</div>
	</div>


</body>

</html>