<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		google.charts.setOnLoadCallback(drawVisualization2);
		google.charts.setOnLoadCallback(drawVisualization3);
		google.charts.setOnLoadCallback(drawChart);

		function drawVisualization() {
			// Some raw data (not necessarily accurate)
			var data = google.visualization.arrayToDataTable([
				['Month', '사용자', '기사', '블랙리스트', '총인원'],
				['2019.08', 938, 165, 43, 1103],
				['2019.09', 1220, 135, 73, 1355],
				['2019.10', 1050, 189, 23, 1239],
				['2019.11', 1300, 244, 63, 1544],
				['2019.12', 1550, 566, 53, 2116]
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
					3: {
						type: 'line'
					}
				}
			};

			var chart = new google.visualization.ComboChart(document
				.getElementById('chart_div'));
			chart.draw(data, options);
		}



		function drawVisualization2() {
			// Some raw data (not necessarily accurate)
			var data = google.visualization.arrayToDataTable([
				['Month', 'Bolivia', 'Ecuador', 'Madagascar',
					'Papua New Guinea', 'Rwanda', 'Average'],
				['2004/05', 165, 938, 522, 998, 450, 614.6],
				['2005/06', 135, 1120, 599, 1268, 288, 682],
				['2006/07', 157, 1167, 587, 807, 397, 623],
				['2007/08', 139, 1110, 615, 968, 215, 609.4],
				['2008/09', 136, 691, 629, 1026, 366, 569.6]]);

			var options = {
				title: 'Monthly Coffee Production by Country',
				vAxis: {
					title: 'Cups'
				},
				hAxis: {
					title: 'Month'
				},
				seriesType: 'bars',
				series: {
					5: {
						type: 'line'
					}
				}
			};

			var chart = new google.visualization.ComboChart(document
				.getElementById('chart_div2'));
			chart.draw(data, options);
		}



		function drawVisualization3() {
			// Some raw data (not necessarily accurate)
			var data = google.visualization.arrayToDataTable([
				['Month', '블랙리스트', '총인원'],
				['2019.08', 165, 1103],
				['2019.09', 135, 1355],
				['2019.10', 189, 1239],
				['2019.11', 244, 1544],
				['2019.12', 566, 2116]
			]);

			var options = {
				title: '월별 블랙리스트 인원변화',
				vAxis: {
					title: '인원(명)'
				},
				hAxis: {
					title: '기간(월)'
				},
				seriesType: 'bars',
				series: {
					1: {
						type: 'line'
					}
				}
			};

			var chart = new google.visualization.ComboChart(document
				.getElementById('chart_div3'));
			chart.draw(data, options);
		}




		function drawChart() {
			var data = google.visualization.arrayToDataTable([
				['Month', '수익', '총매출'],
				['2019.08', 165, 1103],
				['2019.09', 135, 1355],
				['2019.10', 189, 1239],
				['2019.11', 300, 1544],
				['2019.12', 451, 1544],
				['2020.01', 300, 1101]
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
			<li class="active"><a data-toggle="tab" href="#user">인원 통계</a></li>
			<li><a data-toggle="tab" href="#menu1" id="salesStst">매출 통계</a></li>
		</ul>

		<div class="tab-content">
			<div id="user" class="tab-pane fade in active">
					<select id="memberPeriod" name="memberPeriod">
							<option value="day" selected>일</option>
							<option value="week" selected>주</option>
							<option value="month"> 월 </option>
							<option value="year">년도</option>
						</select>
						<br><br>
				<div id="chart_div" style="width: 900px; height: 500px;"></div>
			</div>
			<script>
					//관리자>정산관리>기간 //클래스 이름등 변경 필요
					$(function () {
						$('.moneyMonth, .moneyQuarter, .moneyYear').hide();
						$('#period option:selected').show();
					});
	
					$('#period').change(function () {
						var state = $('#period option:selected').val();
						if (state == 'day') {
							$('.moneyDay').show();
						} else {
							$('.moneyDay').hide();
						}
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
						if (state == 'year') {
							$('.moneyYear').show();
						} else {
							$('.moneyYear').hide();
						}
					});
				</script>

			<div id="menu1" class="tab-pane fade in active">
					<select id="memberPeriod" name="memberPeriod">
							<option value="day" selected>일</option>
							<option value="week" selected>주</option>
							<option value="month"> 월 </option>
							<option value="year">년도</option>
						</select>
						<br><br>
				<div id="chart_div4" style="width: 100%; height: 500px;"></div>
			</div>
			<script>
					//관리자>정산관리>기간 //클래스 이름등 변경 필요
					$(function () {
						$('.moneyMonth, .moneyQuarter, .moneyYear').hide();
						$('#period option:selected').show();
					});
	
					$('#period').change(function () {
						var state = $('#period option:selected').val();
						if (state == 'day') {
							$('.moneyDay').show();
						} else {
							$('.moneyDay').hide();
						}
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
						if (state == 'year') {
							$('.moneyYear').show();
						} else {
							$('.moneyYear').hide();
						}
					});
				</script>

		</div>
	</div>


</body>

</html>