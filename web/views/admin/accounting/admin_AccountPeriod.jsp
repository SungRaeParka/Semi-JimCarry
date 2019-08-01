<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jimcarry.admin.accounting.model.vo.*, java.text.DecimalFormat"%>
<%
	ArrayList<AccountingPeriod> list = (ArrayList<AccountingPeriod>) request.getAttribute("list");
    String periodSort = list.get(0).getPeriodSort();
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
			<li class="active"><a  href="/semi/accounting.pr">기간</a></li>
			<li><a  href="/semi/accounting.mm">맴버</a></li>
			<li><a  href="/semi/accounting.rf">환불관리</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade in active">
				<br>
				<form id="periodForm">
				<select id="period" name="period">
					<option id="daySelect" value="일"> 일 </option>
					<option id="monthSelect" value="월"> 월 </option>
					<option id="yearSelect" value="년도">년도</option>
				</select>
				</form>
				<br><br>
				<div class="moneyT">
					<%-- <%if(){ %> --%>
					<table class="moneyDay" id="moneyDay" border="1px">
						<tr>
							<th> <%= periodSort %> </th>
							<th>총매출</th>
							<th>이용건수</th>
							<th>순수익</th>
							<!-- <th>환불금액</th> -->
						</tr>
						<% for(AccountingPeriod ap : list){ %>
						<tr>
							<td><%=ap.getAccountDate() %></td>
							<td><%=df.format(ap.getTotalPayAmount()) %></td>
							<td><%=ap.getTotalCount() %></td>
							<td><%=df.format(ap.getTotalFeesIncome()) %></td>
							<%-- <td><%=ap.getTotalRefundFee() %></td> --%>
						</tr>
						<% } %>
					</table>

				</div>
			</div>
			<script>
				//관리자>정산관리>기간
				$(function () {
					var periodResult = "<%= periodSort %>";
					console.log("periodSort : " + periodResult);
					if(periodResult==null || periodResult=="일"){
						$('#daySelect').attr("selected", "selected");
					}else if(periodResult=="월"){
						$('#monthSelect').attr("selected", "selected");
					}else if(periodResult=="년도"){
						$('#yearSelect').attr("selected", "selected");
					}
				});

				$('#period').change(function () {
					var state = $('#period option:selected').val();
					if (state == '일') {
						$("#periodForm").attr("action", "<%=request.getContextPath()%>/accounting.pr");
						$("#periodForm").submit();
					} else if (state == '월') {
						$("#periodForm").attr("action", "<%=request.getContextPath()%>/accounting.pr");
						$("#periodForm").submit();
					} else if (state == '년도') {
						$("#periodForm").attr("action", "<%=request.getContextPath()%>/accounting.pr");
						$("#periodForm").submit();
					}
				});
			</script>
			<div id="menu1" class="tab-pane fade"></div>

			<div id="menu2" class="tab-pane fade"></div>

		</div>
	</div>


</body>

</html>