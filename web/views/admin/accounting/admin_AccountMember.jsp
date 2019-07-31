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
			<li class="active"><a data-toggle="tab" href="#menu1">맴버</a></li>
			<li><a href="/semi/views/admin/accounting/admin_AccountRefund.jsp">환불관리</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade"></div>
			<div id="menu1" class="tab-pane fade in active">
				<select id="member" name="member">
					<option value="allM" selected>전체</option>
					<option value="user">사용자</option>
					<option value="driver">기사</option>
				</select>
				<div class="memberT">
					<table border="1px">
						<tr>
							<th>회원명</th>
							<th>회원구분</th>
							<th>이용일자</th>
							<th>이용금액</th>
							<th>정산금액</th>
							<th>정산일</th>
						</tr>
						<tr>
							<td>문호석</td>
							<td class="UorD">사용자</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
						<tr>
							<td>박성래</td>
							<td class="UorD">기사</td>
							<td></td>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
			<script>
				//관리자>정산관리>사용자
				$('#member').change(function () {
					var state = $('#member option:selected').val();
					var UorD = $('.UorD[text="사용자"').parent();
					console.log("UorD : " + UorD);
					// if (state == 'allM') {
					// 	$('.memberT').show();
					// } else {
					// if (state == 'user') {
					// 	$(.parent().show();
					// 	$('.UorD[text="기사"]').parent().hide();
					// } else {
					// 	$('.UorD[text="기사"').parent().show();
					// 	$('.UorD[text="사용자"').parent().hide();
					// }
					// }
				});
			</script>
			<div id="menu2" class="tab-pane fade"></div>
		</div>
	</div>


</body>

</html>