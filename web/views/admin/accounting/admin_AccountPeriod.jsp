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
	<script src="../../js/admin.js"></script>
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
			<li class="active"><a data-toggle="tab" href="#home">기간</a></li>
			<li><a data-toggle="tab" href="#menu1">맴버</a></li>
			<li><a data-toggle="tab" href="#menu2">환불관리</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<br>
				<select id="period" name="period">
					<option value="week" selected> 주 </option>
					<option value="month"> 월 </option>
					<option value="quarter">분기</option>
					<option value="year">년도</option>
				</select>
				<br>
				<div class="moneyT">
					<%-- <%if(){ %> --%>
					<table class="moneyWeek" border="1px">
						<tr>
							<th> 주 </th>
							<th>총매출</th>
							<th>환불금액</th>
							<th>순수익</th>
						</tr>
						<tr>
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
						</tr>
					</table>
					<table class="moneyMonth" border="1px">
						<tr>
							<th> 월 </th>
							<th>총매출</th>
							<th>환불금액</th>
							<th>순수익</th>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</table>
					<%--  <%}else if() {%> --%>
					<table class="moneyQuarter" border="1px">
						<tr>
							<th>분기</th>
							<th>총매출</th>
							<th>환불금액</th>
							<th>순수익</th>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</table>
					<%-- 	<%}else{ %> --%>
					<table class="moneyYear" border="1px">
						<tr>
							<th>년도</th>
							<th>총매출</th>
							<th>환불금액</th>
							<th>순수익</th>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
						<tr>
							<th></th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
					</table>
					<%--   <%} %> --%>
				</div>
			</div>
			<script>
				//관리자>정산관리>기간
				$(function () {
					$('.moneyMonth, .moneyQuarter, .moneyYear').hide();
					$('#period option:selected').show();
				});

				$('#period').change(function () {
					var state = $('#period option:selected').val();
					if (state == 'week') {
						$('.moneyWeek').show();
					} else {
						$('.moneyWeek').hide();
					}
					if (state == 'month') {
						$('.moneyMonth').show();
					} else {
						$('.moneyMonth').hide();
					}
					if (state == 'quarter') {
						$('.moneyQuarter').show();
					} else {
						$('.moneyQuarter').hide();
					}
					if (state == 'year') {
						$('.moneyYear').show();
					} else {
						$('.moneyYear').hide();
					}
				});
			</script>
			<div id="menu1" class="tab-pane fade"></div>

			<div id="menu2" class="tab-pane fade"></div>

		</div>
	</div>


</body>

</html>