<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<style>
#search {
	clear: both;
}

#search>div {
	margin: 0 auto;
	margin-top: 30px;
	width: auto;
	height: 100px;
}

ul, li {list-style-none;
	text-align: center;
	padding: 0px;
	margin-top: 200px;
}

.boardcss_list_table, list_table, table, list_table, thead, tbody {
	text-align: center;
	font-size: 14pt;
	height: 40px;
	vertical-align: middle;
	line-height: 30px;
}

.boardcss_list_table {
	
}

.list_table {
	border: 1px solid #dddddd;
	margin: 0 auto;
	border-collapse: collapse;
	width: 100%;
}

th {
	padding: 2px;
	border-bottom: 1px solid #eeeeee;
	background: #E5ecef;
	text-align: center;
}

td {
	padding: 2px;
	border-bottom: 1px solid #eeeeee
}

a.btn_02 {
	display: inline-block;
	padding: 7px 7px;
	border: 1px solid #3b3c3f;
	background: #4b545e;
	color: #fff;
	text-decoration: none;
	float: right;
}

.con {
	border: 1px solid red;
	margin: 0 auto;
	padding: 1px;
}
</style>

<title>Insert title here</title>
</head>
<body>

	<%@ include file="/views/common/user_TopBar.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="boardcss_list_table"
		style="margin: 0 auto; border: 1px solid red; width: 700px; height: 600px;">

		<div
			style="margin: 0 auto; border: 1px solid red; width: 300px; height: 100px;">
			<h2>짐캐리 사용후기</h2>
		</div>
		<div>
			<a href="/semi/views/board/review/user_ReviewInsert.jsp" class="btn_02">글쓰기</a>
		</div>
		<br>
		<br>

		<table class="list_table">

			<colgroup>
				<col width="10%" />
				<col width="45%" />
				<col width="15%" />
				<col width="20%" />
				<col width="10%" />
			</colgroup>

			<thead class="thead">


				<tr>
					<th scope="col">번호</th>
					<th scope="col">제목</th>
					<th scope="col">작성자</th>
					<th scope="col">일자</th>
					<th scope="col">조회수</th>
				</tr>
			</thead>

			<tbody class="tbody" style="color: red;">
				<tr>
					<td style="color: red;">공지</td>
					<td>정신차리자!</td>
					<td>user</td>
					<td>2019-07-12</td>
					<td>10</td>
				</tr>
			</tbody>

			<tbody>
				<tr>
					<td>1</td>
					<td>짐캐리 짱짱</td>
					<td>user</td>
					<td>2019-07-12</td>
					<td>10</td>
				</tr>
			</tbody>

			<tbody>
				<tr>
					<td>1</td>
					<td>짐캐리 짱짱</td>
					<td>user</td>
					<td>2019-07-12</td>
					<td>10</td>
				</tr>
			</tbody>

			<tbody>
				<tr>
					<td>1</td>
					<td>짐캐리 짱짱</td>
					<td>user</td>
					<td>2019-07-12</td>
					<td>10</td>
				</tr>
			</tbody>

			<tbody>
				<tr>
					<td>1</td>
					<td>짐캐리 짱짱</td>
					<td>user</td>
					<td>2019-07-12</td>
					<td>10</td>
				</tr>
			</tbody>

		</table>

		<div class="con">
			<ul class="pagination">
				<li><a href="#">1</a></li>
				<li class="active"><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">다음</a></li>
				<li><a href="#">맨끝</a></li>
			</ul>
		</div>

		<div>
			<select id='search'>
				<option value='A'>제목</option>
				<option value='T'>작성자</option>
				<option value='C'>내용</option>
			</select> <input id='txtKeyWord' /> <input type='button' value='검색' />
		</div>
	</div>
	
</body>
</html>