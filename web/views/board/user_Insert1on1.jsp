<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	table, th {
	border:1px solid black;
	border-collapse:collapse;
	border-radius:20%;
	align:ceter;
	}
	table {
		
		width:40%;
		height: 100px;
		margin: auto;
		margin-top:100px;
		text-align: center;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/user_TopBar.jsp"%>

<h1 align="center">1:1 문의</h1>
<table>
		<th>문의 유형</th>
		<th>
			<input type="radio" id="check" value="견적관련">견적관련
			<input type="radio" id="check" value="운송관련">운송관련
			<input type="radio" id="check" value="결제관련">결제관련
			<input type="radio" id="check" value="취소관련">취소관련
			<input type="radio" id="check" value="기타">기타
		</th>
	<tr>
		<th>제목</th>
		<th>
			<input type="text" placeholder="제목을 입력해주세요." >
		</th>
	</tr>
	<tr>
		<th>내용</th>
		<th>
			<textarea name="memo" rows="5" placeholder="내용을 입력해주세요." ></textarea>
		</th>
	</tr>
	<tr>
		<th>첨부파일</th>
		<th>
			<input type="button" value="첨부파일" >
		</th>
	</tr>
</table>
	<div align="center" style="margin-top: 10px;">
		<a href="/semi/views/board/serviceCenter/user_Qna1on1List.jsp"><input type="button" value="문의하기"></a>
	</div>
	
	
</body>
</html>