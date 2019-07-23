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
			<li class="active"><a data-toggle="tab" href="#user">공지사항</a></li>
			<li><a href="admin_CC1on1List.jsp">1:1 문의</a></li>
			<li><a href="admin_CCQaList.jsp">Q&A</a></li>
		</ul>

		<div class="tab-content">
			<div id="user" class="tab-pane fade in active">
				<br />
				<br />
				<div class="tableArea">
					<table align="center" id="listArea" border="1">
						<tr>
							<th>글번호</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
						<%-- <% for(Notice n : list){ %> --%>
						<tr>
							<td>1</td>
							<td>hidddfasfdqa</td>
							<td>josh</td>
							<td>3</td>
							<td>2019</td>
							<%-- <td><%= n.getNno() %>
							</td>
							<td>
								<%= n.getnTitle() %>
							</td>
							<td>
								<%= n.getnWriter() %>
							</td>
							<td>
								<%= n.getnCount() %>
							</td>
							<td>
								<%= n.getnDate() %>
							</td> --%>
						</tr>
						<%-- <% } %> --%>
					</table>
					<br>
					<div class="searchArea" align="center">
						<select id="searchCondition" name="searchCondition">
							<option value="writer">작성자</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select> <input type="search">
						<button type="submit">검색하기</button>
						<%--  <% if(loginUser != null && loginUser.getUserId().equals("admin")){ %> --%>
						<button onclick="location.href='admin_CCNoInsertForm.jsp'">작성하기</button>
						<%-- <% } %> --%>
					</div>
				</div>
			</div>


			<script>
				//글 번호로 해당글 세부보기 함수
				$("#listArea td").mouseenter(function () {
					$(this).parent().css({ "background": "darkgray", "cursor": "pointer" });
				}).mouseout(function () {
					$(this).parent().css({ "background": "white" });
				}).click(function () {
					var num = $(this).parent().children().eq(0).text();

					// console.log(num);

					location.href = "<%=request.getContextPath() %>/selectOne.no?num=" + num; //?가 쿼리문>
				});
			</script>


			<div id="menu1" class="tab-pane fade"></div>


			<div id="menu2" class="tab-pane fade"></div>



		</div>
</body>

</html>