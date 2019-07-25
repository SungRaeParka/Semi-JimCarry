

<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.jimcarry.board.model.vo.*"
                         import="com.kh.jimcarry.member.model.vo.Member"%>
	<%
		ArrayList<Board> list = (ArrayList<Board>) request.getAttribute("list");
		PageInfo pi = (PageInfo) request.getAttribute("pi");
		int listCount = pi.getListCount();
		int currentPage = pi.getCurrentPage();
		int maxPage = pi.getMaxPage();
		int startPage = pi.getStartPage();
		int endPage = pi.getEndPage();

		Member loginUser = (Member) session.getAttribute("loginUser");

	%>

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

.boardcss_list_table, list_table, table, list_table, thead{
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
		<div>
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


			<% for(Board b : list) { %>
				<tr>
					<input type="hidden" value="<%=b.getPostCode() %>" />
					<td><%=b.getPostNo() %></td>
					<td><%=b.getPostTitle() %></td>
					<td><%=b.getWriter() %></td>
					<td><%=b.getPostDate() %></td>
					<td><%=b.getbCount() %></td>
				</tr>
			<% } %>

		</table>
		</div>

		<%-- 페이징처리 --%>
		<div class="panginArea" align="center">
			<button onclick="location.href'<%=request.getContextPath()%>/selectList.bo?currentPage=1'"><<</button>
			<%if(currentPage <= 1) { %>
				<button disabled><<</button>
			<% }else { %>
				<button onclick="location.href='<%=request.getContextPath()%>/selectList.bo?currentPage=<%=currentPage -1%>'"><</button>
			<% } %>
				<button onclick="location.href'<%=request.getContextPath()%>/selectList.bo?currentPage=<%=currentPage -1%>'"><</button>
		
		
		
		</div>



		<!-- <div class="con">
			<ul class="pagination">
				<li><a href="#">1</a></li>
				<li class="active"><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">다음</a></li>
				<li><a href="#">맨끝</a></li>
			</ul>
		</div> -->


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