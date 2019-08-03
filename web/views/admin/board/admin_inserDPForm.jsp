<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<h2>기사홍보 게시판 글 작성</h2>
		<form action="<%=request.getContextPath()%>/insert.dp" method="post" encType="multipart/form-data">
			<table>
				<tr>
					<td width="100px">제목</td>
					<td colspan="3"><input type="text" size="99" name="title"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td colspan="3">
						<textarea cols="100" rows="30" style="resize: none;"></textarea>
					</td>
				</tr>
				<tr>
					<td>파일첨부</td>
					<td colspan="3">
						<input type="file">
					</td>
				</tr>
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