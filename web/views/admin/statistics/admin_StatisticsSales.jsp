<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.jimcarry.admin.statistics.model.vo.*"%>
<%
	ArrayList<StatisticsSales> list = (ArrayList<StatisticsSales>) request.getAttribute("list");
%>

<!DOCTYPE html>
<html>

<head>
	<meta charset=UTF-8>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript"></script>
	<title>Insert title here</title>

	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', { 'packages': ['corechart'] });
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {
			var data = google.visualization.arrayToDataTable([
				['Month', '수익', '총매출'],
				<% for(StatisticsSales ss : list){ %>
				['<%=ss.getPeriod()%>', <%=ss.getProfit()%>, <%=ss.getSales()%>],
				<% } %>
			]);

			var options = {
				title: '매출액 및 수익 변화',
				hAxis: { title: 'Month', titleTextStyle: { color: '#333' } },
				vAxis: { title: '(단위: 천원)', minValue: 0 }
			};

			var chart = new google.visualization.AreaChart(document.getElementById('chart_div4'));
			chart.draw(data, options);
		}
	</script>

	<style>

		/* 테이블 스타일용 */
		.title {
			text-align: center;
			font-weight: bold;
		}

		.content {
			border-bottom: 1px solid #efefef;
			padding: 10px 10px 10px 10px;
			text-align: center;
			white-space: nowrap;
			text-overflow: ellipsis;
			overflow: hidden;
		}
		select {
			float: right;
			margin-top: -30px;
			margin-right: 10px;
		}
	</style>
</head>

<body>
	<%@ include file="/views/common/admin_TopBar.jsp"%>

	<div class="container" style="margin-top: 100px;">
		<h2>통계</h2>

		<ul class="nav nav-tabs">
			<li><a href="/semi/statistics.mm">인원 통계</a></li>
			<li class="active"><a href="/semi/statistics.sl" id="salesStst">매출 통계</a></li>
		</ul>

		<div class="tab-content">
			<div id="user" class="tab-pane fade"></div>

			<div id="menu1" class="tab-pane fade in active">
					<!-- <select id="memberPeriod" name="memberPeriod">
						<option value="day" selected>일</option>
						<option value="week" selected>주</option>
						<option value="month"> 월 </option>
						<option value="year">년도</option>
					</select> -->
					
					<div id="chart_div4" style="width: 100%; height: 500px;"></div>
				</div>

	</div>


</body>

</html>