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
	<br><br>

<h1 align="center">신고합니다</h1>
<form action="<%=request.getContextPath() %>/declaration.de" method="post">
<table>
	<tr>
		<th>신고내용</th>
		<th colspan='3'>
			<input type="hidden" name="postType" value="유형">
			<input type="hidden" name="answerCheck">
			<input type="radio" id="check" name="rbtn" value="불친절">불친절
			<input type="radio" id="check" name="rbtn" value="시간지연">시간지연
			<input type="radio" id="check" name="rbtn" value="추가금요구">추가금 요구
			<input type="radio" id="check" name="rbtn" value="기타">기타
		</th>
	</tr>
	<tr>
		<th>신고날짜</th>
		<th colspan='3'>
		<input type="date" name="date">
		</th>
	</tr>
	<tr>
		<th>기사님 성함</th>
		<td><input type="text" name="drivername"></td>
		<th>신고자 성함</th>
		<td><input type="text" name="username"></td>
		</tr>

	<tr>
		<th>상세내용</th>
		<th colspan='3'>
			<textarea name="Content" rows="20" placeholder="내용을 입력해주세요." ></textarea>
		</th>
	</tr>
	
</table>

	<div align="center" style="margin-top: 10px;">
	<input type="hidden" name="name" id="name" value="<%=loginUser.getSeqNo()%>"> 
	
		<button type="submit" value="문의하기"> 신고하기</button>&nbsp;
		<button type="reset" value="취소하기"> 취소하기</button>
	</div>
	</form>
	
</body>
</html>