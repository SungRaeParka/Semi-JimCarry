<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% %>
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
			<li><a href="/semi/views/admin/accounting/admin_AccountPeriod.jsp">기간</a></li>
			<li><a href="/semi/views/admin/accounting/admin_AccountMember.jsp">맴버</a></li>
			<li class="active"><a data-toggle="tab" href="#menu2">환불관리</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade"></div>
			<div id="menu1" class="tab-pane fade"></div>
			<div id="menu2" class="tab-pane fade in active">
				<select id="refund" name="refund">
					<option value="allRefund">전체</option>
					<option value="Refunding">환불 대기</option>
					<option value="yesRefund">완료</option>
					<option value="noRefund">반려</option>
				</select>
				<div class="refundT">
					<table border="1">
						<tr>
							<th>회원명</th>
							<th>이용일자</th>
							<th>이용금환</th>
							<th>환불일</th>
							<th>환불사유</th>
							<th>환불상태</th>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
			<script>
				$('#period').change(function () {
					var state = $('#refund option:selected').val();
					if (state == 'all') {
						$().show(); //모두 보여줘
					}

					if (state == 'Refunding') {
						$('').show(); //환불 처리 대기 중인 것만 보여줘
					} else {
						$('').hide();
					}
					if (state == 'yesRefund') {
						$('').show(); //환불 완료 된 것만 보여줘
					} else {
						$('').hide();
					}
					if (state == 'noRefund') {
						$('').show(); //환불 반려 된 것만 보여줘
					} else {
						$('').hide();
					}
				});
			</script>
		</div>
	</div>


</body>

</html>