<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<style>
table, th {
	border: 1px solid black;
	border-collapse: collapse;
	border-radius: 20%;
	align: ceter;
}

table {
	width: 40%;
	height: 100px;
	margin: auto;
	margin-top: 100px;
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="/views/common/admin_TopBar.jsp"%>
	<h2 style="margin-top: 100px; margin-left: 30px">1:1 문의 답변하기</h2>
	<form action="">
	<table>
		<th>문의 유형</th>
		<th><input type="radio" id="check" value="견적관련">견적관련 <input
			type="radio" id="check" value="운송관련">운송관련 <input type="radio"
			id="check" value="결제관련">결제관련 <input type="radio" id="check"
			value="취소관련">취소관련 <input type="radio" id="check" value="기타">기타
		</th>
		<tr>
			<th>제목</th>
			<th></th>
		</tr>
		<tr>
			<th>내용</th>
			<th></th>
		</tr>
		<tr>
			<th>첨부파일</th>
			<th><input type="button" value="첨부파일"></th>
		</tr>
	</table>
	<br />
	<br />
	<div align="center">
		<button type="reset">취소하기</button>
		<button type="submit">작성하기</button>
	</div>
	</form>

</body>
</html>