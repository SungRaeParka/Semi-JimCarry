<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
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

table * {
	text-align: center;
}

.tableArea {
	width: 45opx;
	height: 350px;
	margin: 0 auto;
}
</style>
</head>
<body>
	<%@ include file="/views/common/admin_TopBar.jsp"%>
	<%-- 	<% if(loginUser != null && loginUser.getUserId().equals("admin")){ %> --%>
	<div class="container" style="margin-top: 70px;">
		<h2>고객센터 관리</h2>
		<br />
		<ul class="nav nav-tabs">
			<li class="active"><a href="admin_CCNo.jsp">공지사항</a></li>
			<li><a href="admin_CC1on1.jsp">1:1 문의</a></li>
			<li><a href="admin_CCQa.jsp">Q&A</a></li>
		</ul>
		<div class="tab-content">
			<div id="user" class="tab-pane fade in active">

				<div class="outer">
					<h3 align="center">공지사항 수정</h3>
					<br />
					<div class="tableArea">
						<form id="updateForm" method="post">
							<table border="1px" align="center">
								<tr>
									<td>제목</td>
									<td colspan="3"><input type="text" size="50" name="title"
										value="<%-- <%=n.getnTitle()%> --%>"> <input
										type="hidden" name="nno" value="<%-- <%=n.getNno()%> --%>" /></td>
								</tr>
								<tr>
									<td>작성자</td>
									<td><input type="text"
										value="<%-- <%=n.getnWriter()%> --%>" name="writer" readonly></td>
									<td>작성일</td>
									<td><input type="date" name="date"
										value="<%-- <%=n.getnDate()%> --%>"></td>
								</tr>
								<tr>
									<td colspan="4">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
								</tr>
								<tr>
									<td colspan="4"><textarea name="content" cols="60"
											rows="15" style="resize: none;"><%-- <%=n.getnContent()%> --%></textarea>
									</td>
								</tr>
							</table>
							<br>
							<div align="center">
								<button onclick="cancle();">취소하기</button>&nbsp;
								<button onclick="complete();">작성완료</button>&nbsp;
								<button onclick="deleteNotice();">삭제하기</button>
							</div>
						</form>
						<script>
						function cancle(){}
						function complete(){
							<%-- $("#updateForm").attr("action", "<%= request.getContextPath()%>/update.no") --%>
						}
						function deleteNotice(){
							$("#updateForm").attr("action", "<%-- <%= request.getContextPath()%>/deleteNotice.no --%>")
						}
					</script>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%-- <% } else{
		request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
		request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);

		}
		%> --%>

</body>
</html>