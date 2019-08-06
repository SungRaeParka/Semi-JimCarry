

<%@page import="sun.util.logging.resources.logging"%>
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

		//Member loginDriver = (Member) session.getAttribute("loginDriver");


		System.out.println("listCount : " + listCount);
		System.out.println("currentPage : " + currentPage);
		System.out.println("maxPage : " + maxPage);
		System.out.println("startPage : " + startPage);
		System.out.println("endPage : " + endPage);




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

.searchArea {
		width: 650px;
		margin: 0 auto;
	}


</style>

<title>Insert title here</title>
</head>
<body>

	<%@ include file="/views/common/driver_TopBar.jsp"%>
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

			<%if(loginUser.getUdCheck().equalsIgnoreCase("U")){ %>
			<a onclick="location.href='views/board/user_ReviewInsert.jsp'" class="btn_02">글쓰기</a>



			<%} %>

		</div>

		<br>
		<br>
		<div>
		<table class="list_table" id="listArea">

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
			<button onclick="location.href'<%=request.getContextPath()%>/detailDriver.bo?currentPage=1'"><<</button>
		<% if(currentPage <= 1) { %>
					<button disabled><<</button>
					<% }else { %>
					<button onclick="location.href='<%=request.getContextPath() %>/detailDriver.bo?currentPage=<%=currentPage -1%>'"><</button>
				 <% } %>

			<% for(int p = startPage; p <= endPage; p++){
				if(currentPage == p){
			%>
					<button disabled style="color:red;"><%= p %></button>
			<% } else { %>
					<button onclick="location.href='<%=request.getContextPath()%>/detailDriver.bo?currentPage=<%=p%>'"><%= p %></button>
			<%
				}
			   }
			%>

				 <% if(currentPage >= maxPage) { %>

				  <% }else {%>
				  	<button onclick="location.href='<%=request.getContextPath() %>/detailDriver.bo?currentPage=<%=currentPage +1%>'">></button>

				  <% } %>
			<button onclick="location.href='<%=request.getContextPath()%>/detailDriver.bo?currentPage=<%=maxPage%>'">>></button>
		</div>

	</div>

	<%-- 검색영역 --%>
		<div class="searchArea" align="center">
	<form action="<%=request.getContextPath()%>/boardSerachDriver" method="get">
			<select name="searchCondition" id="searchCondition">
				<option value="title">제목</option>
				<option value="writer">작성자</option>
			</select>

			<input type="search" name="word" placeholder="특수문자는 사용할수 없습니다."/>
			<button type="submit">검색하기</button>

	</form>
		</div>
	<script>
	$(function(){
		$("#listArea td").mouseenter(function(){
			$(this).parent().css({"background":"darkgray", "cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background":"white"});
		}).click(function(){
			var num = $(this).parent().children("input").val();

			location.href="<%=request.getContextPath()%>/detailDriver.bo?num=" + num;
		});
	});
	</script>


</body>
</html>