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
table, th {
	border:1px solid black;
	border-collapse:collapse;
	border-radius:20%;
	align:ceter;
	}
table {

		width:100%;
		height: 100px;
		margin: auto;
		text-align: center;
	}
th {
	padding:15px;
	}
select{
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
    <li><a data-toggle="tab" href="#menu1">사용자</a></li>
    <li><a data-toggle="tab" href="#menu2">환불관리</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
    <select>
    <option value="">전체</option>
  	<option value="월">월</option>
  	<option value="분기">분기</option>
  	<option value="년도">년도</option>
  	<%-- <%if(){ %> --%>
  	<table>
  	<tr>
  		<th>월</th>
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
  <table>
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
  	<table>
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
  </select>

    </div>
    <div id="menu1" class="tab-pane fade">
    <select>
    <option value="">전체</option>
  	<option value="월">기사</option>
  	<option value="분기">사용자</option>
  </select>
    <table>
  	<tr>
  		<th>회원명</th>
  		<th>회원구분</th>
  		<th>이용일자</th>
  		<th>이용금액</th>
  		<th>정산금액</th>
  		<th>정산일</th>
  	</tr>
  	<tr>
  		<th></th>
  		<th></th>
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
  		<th></th>
  		<th></th>
  	</tr>

  </table>
    </div>
    <div id="menu2" class="tab-pane fade">
    <select>
    <option value="">전체</option>
  	<option value="월">완료</option>
  	<option value="분기">반려</option>
  </select>
    <table>
  	<tr>
  		<th>회원명</th>
  		<th>이용일자</th>
  		<th>이용금환</th>
  		<th>환불일</th>
  		<th>환불사유</th>
  		<th>환불상태</th>
  	</tr>
  	<tr>
  		<th></th>
  		<th></th>
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
  		<th></th>
  		<th></th>
  	</tr>

  </table>
    </div>
  </div>
</div>


</body>
</html>