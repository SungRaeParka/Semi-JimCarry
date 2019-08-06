<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.jimcarry.serviceCenter.model.vo.*"%>
	 <%
    Notice n =(Notice) request.getAttribute("n");
	 %>
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
th {
  background-color: #ffd24d;
  color: white;
  }
</style>
<script>
function fnList() {
	//location.href = '<%=request.getContextPath()%>';
	location.href = 'http://localhost:8001/semi/noticelist.no';
	
}
</script>
</head>
<body>
	<%@ include file="/views/common/user_TopBar.jsp"%>
	
	<div class="container" style="margin-top: 22%;">
		<h2>공지사항 상세보기</h2>
		<br>

		<div class="tab-content">
			<div id="user" class="tab-pane fade in active">

				<div class="outer">
					<h3 align="center">공지사항 상세보기</h3>
					<br>
					
							<table border="1px" align="center">
								<tr>
									<th>제목</th>
									<td colspan="3"><input type="text" size="50" name="title"
									value="<%=n.getPostTitle() %>" readonly></td>
								</tr>
								<tr>
									<th>작성자</th>
									<td><input type="text"
										value="<%=n.getUserNo() %>" name="writer"
										readonly> <input type="hidden"
										value="<%=n.getUserNo() %> " name="uno" readonly /></td>
									<th>작성일</th>
									<td><input type="date" name="date" value="<%=n.getPostdate() %>" readonly></td>
								</tr>
								<tr>
									<th colspan="4" >내                            용</th>
								</tr>
								<tr>
									<td colspan="4"><textarea name="content"cols="60"
											rows="15" style="resize: none"  readonly><%=n.getPostContent() %></textarea></td>
								</tr>
							</table>
							<br>
							<div align="center">
								<button onclick="javascript:fnList()">목록</button>
							 
							</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>