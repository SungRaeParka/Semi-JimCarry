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
<title>Insert title here</title>
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

container {
	align: "center";
}

#a {
	list-style-type: none;
	font-size: 15px;
}

a.btn_02 {
	display: inline-block;
	padding: 7px 7px;
	border: 1px solid #3b3c3f;
	background: #4b545e;
	color: #fff;
	text-decoration: none;
	width: 100px;
	height: 50px;
	text-align: center;
	margin-right: 10px;
	margin-left: 10px;
	margin-top: 80px;
}

.outer {
	width: 800px;
	height: 500px;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

table {
	border: 1px solid black;
	text-align: center;
}

.tableArea {
	width: 650px;
	height: 350px;
	margin: 0 auto;
}

.searchArea {
	width: 650px;
	margin: 0 auto;
}

table th, table td {
	text-align: center;
	padding: 3px;
}
</style>
</head>

<body>
	<%@ include file="/views/common/admin_TopBar.jsp"%>

	<div class="container" style="margin-top: 70px;">
		<h2>고객센터 관리</h2>
		<br />

		<ul class="nav nav-tabs">
			<li><a href="admin_CCNo.jsp">공지사항</a></li>
			<li class="active"><a data-toggle="tab" href="#menu1">1:1 문의</a></li>
			<li><a href="admin_CCQa.jsp">Q&A</a></li>
		</ul>

		<div class="tab-content">
			<div id="user" class="tab-pane fade"></div>


			<div id="menu1" class="tab-pane fade in active">
			<br>
				<div id="radio" style="float: right;">
					<form action="">
						<input type="radio" name="sort" id="all" value="all" checked>
						<label for="all">&nbsp;모두 보기&nbsp;&nbsp;</label>
						<input type="radio" name="sort" id="waitAns" value="waitAns">
						<label for="waitAns">&nbsp;답변 대기&nbsp;&nbsp;</label>
					</form>
					<!-- 스크립트로 값에 따른 게시판 리스트 가져오기 고객센터 글도 전체 번호와 텝에따른 번호 달라야 한다. 수업시간 글,사진게시판처럼 -->
				</div>
				<br>
				<div style="margin-top: -62px;">

					<table class="table" style="border: 1px solid; height: 50px;">
						<thead>
							<tr>
								<th>문의유형</th>
								<th>제목</th>
								<th>문의날짜</th>
								<th>답변
							</tr>
						</thead>


						<tbody>
							<tr>
								<td>매칭관련</td>
								<td>매칭 어쩌고</td>
								<td>2091.07.01</td>
								<td><button onclick="">답변완료</button></td>
							</tr>
							<tr>
								<td>이사관련</td>
								<td>이사 어쩌고</td>
								<td>2019.06.01</td>
								<td><button onclick="">답변완료</button></td>
							</tr>
							<tr>
								<td>취소</td>
								<td>취고 어쩌고</td>
								<td>2019.04.28</td>
								<td><button onclick="waitingAns()">답변대기</button></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<div id="menu2" class="tab-pane fade"></div>

		</div>

</body>

</html>