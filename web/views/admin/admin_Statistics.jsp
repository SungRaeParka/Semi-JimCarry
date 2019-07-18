<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
<title>Insert title here</title>

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages' : [ 'corechart' ]});
	google.charts.setOnLoadCallback(drawVisualization);
	google.charts.setOnLoadCallback(drawVisualization2);
	google.charts.setOnLoadCallback(drawVisualization3);
	google.charts.setOnLoadCallback(drawChart);

	function drawVisualization() {
		// Some raw data (not necessarily accurate)
		var data = google.visualization.arrayToDataTable([
				[ 'Month', '사용자', '기사', '블랙리스트','총인원' ],
				[ '2019.08', 938, 165, 43, 1103 ],
				[ '2019.09', 1220, 135, 73, 1355 ],
				[ '2019.10', 1050, 189, 23, 1239 ],
				[ '2019.11', 1300, 244, 63, 1544 ],
				[ '2019.12', 1550, 566, 53, 2116 ]
				]);

		var options = {
			title : '월별 사용자 인원변화',
			vAxis : {
				title : '인원(명)'
			},
			hAxis : {
				title : '기간(월)'
			},
			seriesType : 'bars',
			series : {
				3 : {
					type : 'line'
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
				[ 'Month', 'Bolivia', 'Ecuador', 'Madagascar',
						'Papua New Guinea', 'Rwanda', 'Average' ],
				[ '2004/05', 165, 938, 522, 998, 450, 614.6 ],
				[ '2005/06', 135, 1120, 599, 1268, 288, 682 ],
				[ '2006/07', 157, 1167, 587, 807, 397, 623 ],
				[ '2007/08', 139, 1110, 615, 968, 215, 609.4 ],
				[ '2008/09', 136, 691, 629, 1026, 366, 569.6 ] ]);

		var options = {
			title : 'Monthly Coffee Production by Country',
			vAxis : {
				title : 'Cups'
			},
			hAxis : {
				title : 'Month'
			},
			seriesType : 'bars',
			series : {
				5 : {
					type : 'line'
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
			[ 'Month', '블랙리스트','총인원' ],
			[ '2019.08', 165, 1103 ],
			[ '2019.09', 135, 1355 ],
			[ '2019.10', 189, 1239 ],
			[ '2019.11', 244, 1544 ],
			[ '2019.12', 566, 2116 ]
			]);

		var options = {
			title : '월별 블랙리스트 인원변화',
			vAxis : {
				title : '인원(명)'
			},
			hAxis : {
				title : '기간(월)'
			},
			seriesType : 'bars',
			series : {
				1 : {
					type : 'line'
				}
			}
		};

		var chart = new google.visualization.ComboChart(document
				.getElementById('chart_div3'));
		chart.draw(data, options);
	}




	 function drawChart() {
	        var data = google.visualization.arrayToDataTable([
	        	[ 'Month', '수익','총매출' ],
						[ '2019.08', 165, 1103 ],
						[ '2019.09', 135, 1355 ],
						[ '2019.10', 189, 1239 ],
						[ '2019.11', 300, 1544 ],
						[ '2019.12', 451, 1544 ],
						[ '2020.01', 300, 1101 ]
						]);

	        var options = {
	          title: '매출액 및 수익 변화',
	          hAxis: {title: 'Month',  titleTextStyle: {color: '#333'}},
	          vAxis: {title: '(단위: 천원)', minValue: 0}
	        };

	        var chart = new google.visualization.AreaChart(document.getElementById('chart_div4'));
	        chart.draw(data, options);
	      }
</script>

<style>
/* 사용자 회원 관리 테이블 */
#tblBackground {
	/*
         *  화면에 보여야 할 Table의 가로크기를 잡아줍니다.
         */
	width: 940px;
	table-layout: fixed;
}

#divHeadScroll {
	/*
         *  안의 내용이 790보다 길게 적용이 되므로 overflow-x, overflow-y를 hidden을 걸어줘서 설정한 가로너비만큼만 화면에 보이도록 잡아줍니다.
         */
	width: 100%;
	overflow-x: hidden;
	overflow-y: hidden;
	border-top: 2px solid #d0d0d0;
}

#tblHead {
	/*
         *  Table의 필드명의 너비를 여기에서 지정합니다.
         *  필드명을 보여줄 테이블은 body보다 하나의 td를 더 가지며 마지막 td는 아무것도 입력하지 않고 크기만 잡아줍니다.
         *  이렇게 하는 이유는 데이터를 보여주는 테이블은 세로 스크롤의 가로두께만큼 더 이동하기 때문입니다.
         */
	table-layout: fixed;
	background-color: #efefef;
	padding-top: 4px;
	width: 1117px;
	height: 30px;
	border-collapse: collapse;
}

#divBodyScroll {
	/*
         *  overflow-x, overflow-y는 scroll로 지정하고,
         *  height는 테이블의 데이터가 나올 기본 크기를 잡아줍니다.
         *  세로길이를 잡아주지 않으면 overflow-y가 걸리지 않습니다.
         */
	width: 100%;
	height: 350px;
	overflow-x: scroll;
	overflow-y: scroll;
	border-top: 1px solid #d0d0d0;
}

#tblBody {
	/*
         * tblBody의 데이터는 필요한 열의 수만큼만 만드시고 헤더와 col의 width는 동일해야 합니다.
         */
	width: 1100px;
	table-layout: fixed;
	height: 30px;
	border-collapse: collapse;
}

/* 기사 회원 관리 테이블 */
#tblBackground2 {
	width: 940px;
	table-layout: fixed;
}

#divHeadScroll2 {
	width: 100%;
	overflow-x: hidden;
	overflow-y: hidden;
	border-top: 2px solid #d0d0d0;
}

#tblHead2 {
	table-layout: fixed;
	background-color: #efefef;
	padding-top: 4px;
	width: 1117px;
	height: 30px;
	border-collapse: collapse;
}

#divBodyScroll2 {
	width: 100%;
	height: 350px;
	overflow-x: scroll;
	overflow-y: scroll;
	border-top: 1px solid #d0d0d0;
}

#tblBody2 {
	width: 1100px;
	table-layout: fixed;
	height: 30px;
	border-collapse: collapse;
}

/* 기사 블랙리스트 관리 테이블 */
#tblBackground3 {
	width: 940px;
	table-layout: fixed;
}

#divHeadScroll3 {
	width: 100%;
	overflow-x: hidden;
	overflow-y: hidden;
	border-top: 2px solid #d0d0d0;
}

#tblHead3 {
	table-layout: fixed;
	background-color: #efefef;
	padding-top: 4px;
	width: 1117px;
	height: 30px;
	border-collapse: collapse;
}

#divBodyScroll3 {
	width: 100%;
	height: 350px;
	overflow-x: scroll;
	overflow-y: scroll;
	border-top: 1px solid #d0d0d0;
}

#tblBody3 {
	width: 1100px;
	table-layout: fixed;
	height: 30px;
	border-collapse: collapse;
}

/* 신고내역 관리 테이블 */
#tblBackground4 {
	width: 940px;
	table-layout: fixed;
}

#divHeadScroll4 {
	width: 100%;
	overflow-x: hidden;
	overflow-y: hidden;
	border-top: 2px solid #d0d0d0;
}

#tblHead4 {
	table-layout: fixed;
	background-color: #efefef;
	padding-top: 4px;
	width: 1117px;
	height: 30px;
	border-collapse: collapse;
}

#divBodyScroll4 {
	width: 100%;
	height: 350px;
	overflow-x: scroll;
	overflow-y: scroll;
	border-top: 1px solid #d0d0d0;
}

#tblBody4 {
	width: 1100px;
	table-layout: fixed;
	height: 30px;
	border-collapse: collapse;
}

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
</style>
</head>
<body>
	<%@ include file="/views/common/admin_TopBar.jsp"%>

	<div class="container" style="margin-top: 100px;">
		<h2>통계</h2>

		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#user">인원 통계</a></li>
			<li><a data-toggle="tab" href="#menu1">매출 통계</a></li>
		</ul>

		<div class="tab-content">
			<div id="user" class="tab-pane fade in active">
				<div id="chart_div" style="width: 900px; height: 500px;"></div>
			</div>

			<div id="menu1" class="tab-pane fade in active">
				<div id="chart_div4" style="width: 100%; height: 500px;"></div>
			</div>

		</div>
	</div>

	<script>
		$(function() {
			// divBodyScroll의 스크롤이 동작할때에 함수를 불러옵니다.
			$('#divBodyScroll').scroll(function() {
				// divBodyScroll의 x좌표가 움직인 거리를 가져옵니다.
				var xPoint = $('#divBodyScroll').scrollLeft();

				// 가져온 x좌표를 divHeadScroll에 적용시켜 같이 움직일수 있도록 합니다.
				$('#divHeadScroll').scrollLeft(xPoint);
			});
		});

		$(function() {
			// divBodyScroll의 스크롤이 동작할때에 함수를 불러옵니다.
			$('#divBodyScroll2').scroll(function() {
				// divBodyScroll의 x좌표가 움직인 거리를 가져옵니다.
				var xPoint = $('#divBodyScroll2').scrollLeft();

				// 가져온 x좌표를 divHeadScroll에 적용시켜 같이 움직일수 있도록 합니다.
				$('#divHeadScroll2').scrollLeft(xPoint);
			});
		});

		$(function() {
			// divBodyScroll의 스크롤이 동작할때에 함수를 불러옵니다.
			$('#divBodyScroll3').scroll(function() {
				// divBodyScroll의 x좌표가 움직인 거리를 가져옵니다.
				var xPoint = $('#divBodyScroll3').scrollLeft();

				// 가져온 x좌표를 divHeadScroll에 적용시켜 같이 움직일수 있도록 합니다.
				$('#divHeadScroll3').scrollLeft(xPoint);
			});
		});

		$(function() {
			// divBodyScroll의 스크롤이 동작할때에 함수를 불러옵니다.
			$('#divBodyScroll4').scroll(function() {
				// divBodyScroll의 x좌표가 움직인 거리를 가져옵니다.
				var xPoint = $('#divBodyScroll4').scrollLeft();

				// 가져온 x좌표를 divHeadScroll에 적용시켜 같이 움직일수 있도록 합니다.
				$('#divHeadScroll4').scrollLeft(xPoint);
			});
		});
	</script>

</body>
</html>