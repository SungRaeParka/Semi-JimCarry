<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.kh.jimcarry.board.model.vo.*"%>

<%
	ArrayList<DP> selectDPList = (ArrayList<DP>) session.getAttribute("selectDPList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<style>
	table {
		border: 1px solid lightgray;
	}
	tr {
		border: 1px solid lightgray;
		text-align: center;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/admin_TopBar.jsp"%>
	
	<div class="outer" align="center" style="margin-top: 100px;">
		<h2>기사홍보 게시판 글 수정</h2>
		<form action="<%=request.getContextPath()%>/update.dp" method="post" encType="multipart/form-data">
			<table>
				<tr>
					<td width="100px">제목</td>
					<%for(DP dp : selectDPList) {%>
					<td colspan="3"><input type="text" size="99" name="title" value="<%=dp.getPostTitle()%>"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3">
						<textarea cols="100" rows="30" style="resize: none;" id="content" name="content"><%=dp.getPostContents()%></textarea>
					</td>
				</tr>
				<tr>
					<td>파일첨부</td>
					<td colspan="3">
						<input type="file" name="img">
					</td>
				</tr>
					<input type="hidden" id="postNo" name="postNo" value="<%=dp.getPostNo()%>">
					<input type="hidden" id="postCode" name="postCode" value="<%=dp.getPostCode()%>">
				<%} %>
				<tr>
					<td colspan="3"><button type="submit">확인</button></td>
				</tr>
			</table>
		</form>
	</div>
	<br>
	<br>
</body>
</html>