<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
table th, table td {
	text-align: center;
	padding: 4px;
}
</style>
</head>
<body>
	<%@ include file="/views/common/admin_TopBar.jsp"%>
	<%-- <% if(loginUser != null && loginUser.getUserId().equals("admin")){ %> --%>
	<div class="container" style="margin-top: 70px;">
		<h2>고객센터 관리</h2>
		<br />

		<ul class="nav nav-tabs">
			<li><a href="admin_CCNo.jsp">공지사항</a></li>
			<li><a href="admin_CC1on1.jsp">1:1 문의</a></li>
			<li class="active"><a href="admin_CCQa.jsp">Q&A</a></li>
		</ul>

		<div class="tab-content">
			<div id="user" class="tab-pane fade in active">

				<div class="outer">
					<h3 align="center">Q&A 작성</h3>
					<br />
					<div class="tableArea">
						<form action="<%-- <%=request.getContextPath()%>/insert.no --%>"
							method="post">
							<table border="1px" align="center">
							<tr>
							<th colspan="5">
								<form action="">
									<input type="radio" name="sort" id="견적/운송" value="견적/운송" checked> <label for="견적/운송">&nbsp;견적/운송&nbsp;&nbsp;</label>
									<input type="radio" name="sort" id="결제/진행" value="결제/진행" checked> <label for="결제/진행">&nbsp;결제/진행&nbsp;&nbsp;</label>
									<input type="radio" name="sort" id="변경/취소" value="변경/취소" checked> <label for="변경/취소">&nbsp;변경/취소&nbsp;&nbsp;</label>
									<input type="radio" name="sort" id="기타문의" value="기타문의" checked> <label for="기타문의">&nbsp;기타문의&nbsp;&nbsp;</label>
								</form>
						<!-- 스크립트로 값에 따른 게시판 리스트 가져오기 고객센터 글도 전체 번호와 텝에따른 번호 달라야 한다. 수업시간 글,사진게시판처럼 -->
							</th>
						</tr>
								<tr>
									<td>제목</td>
									<td colspan="3"><input type="text" size="50" name="title"></td>
								</tr>
								<tr>
									<td>작성자</td>
									<td><input type="text"
										value="<%-- <%=loginUser.getNickName()%> --%>" name="writer"
										readonly> <input type="hidden"
										value="<%-- <%=loginUser.getUno() %> --%>" name="uno" /></td>
									<td>작성일</td>
									<td><input type="date" name="date"></td>
								</tr>
								<tr>
									<td colspan="4">내&nbsp;&nbsp;&nbsp;&nbsp;용</td>
								</tr>
								<tr>
									<td colspan="4"><textarea name="content" id="" cols="60"
											rows="15" style="resize: none"></textarea></td>
								</tr>
							</table>
							<br>
							<div align="center">
								<button type="reset">취소하기</button>
								<button type="submit">작성하기</button>
							</div>
						</form>
					</div>


				</div>
			</div>
		</div>
	</div>

	<%-- <%}else{
		request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
		request.getRequestDispatcher("../common/errorPage.jsp").forward(request, response);
	}

	%> --%>
</body>
</html>