<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.jimcarry.admin.statistics.model.vo.*"%>
<%
	ArrayList<StatisticsMember> list = (ArrayList<StatisticsMember>) request.getAttribute("list");
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
		google.charts.setOnLoadCallback(drawVisualization);

		function drawVisualization() {
			// Some raw data (not necessarily accurate)
			var data = google.visualization.arrayToDataTable([
				['Month', '사용자', '기사', '총인원'],
				<% for(StatisticsMember sm : list){ %>

				['<%= sm.getPeriod()%>', <%= sm.getUserCount()%>,<%= sm.getDriverCount()%>, <%= sm.getMemberCount()%>],
				<% } %>
			]);

			var options = {
				title: '월별 사용자 인원변화',
				vAxis: {
					title: '인원(명)'
				},
				hAxis: {
					title: '기간(월)'
				},
				seriesType: 'bars',
				series: {
					2: {
						type: 'line'
					}
				}
			};

			var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
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
			<li class="active"><a href="/semi/statistics.mm">인원 통계</a></li>
			<li><a href="/semi/statistics.sl" id="salesStst">매출 통계</a></li>
		</ul>

		<div class="tab-content">
			<div id="user" class="tab-pane fade in active">
				<!-- <select id="memberPeriod" name="memberPeriod">
					<option value="day" selected>일</option>
					<option value="week" selected>주</option>
					<option value="month"> 월 </option>
					<option value="year">년도</option>
				</select> -->
				
				<div id="chart_div" style="width: 900px; height: 500px;"></div>
			</div>

			<div id="menu1" class="tab-pane fade"></div>

		</div>
	</div>


</body>

</html>