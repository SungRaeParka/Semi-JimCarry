<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  import="java.util.*, com.kh.jimcarry.serviceCenter.model.vo.*"%>
<%
    OneQ one =(OneQ) request.getAttribute("one");
	 %>
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
	<tr>
		<th>문의유형</th>
		<th>
			<input type="hidden" name="postType" value="유형">
			<input type="hidden" name="answerCheck">
			<input type="radio" id="check" name="questionCheck" value="<%=one.getQuestionType() %>" readonly>견적관련
			<input type="radio" id="check" name="questionCheck" value="<%=one.getQuestionType() %>" readonly>운송관련
			<input type="radio" id="check" name="questionCheck" value="<%=one.getQuestionType() %>" readonly>결제관련
			<input type="radio" id="check" name="questionCheck" value="<%=one.getQuestionType() %>" readonly>취소관련
			<input type="radio" id="check" name="questionCheck" value="<%=one.getQuestionType() %>" readonly>기타
		</th>
	</tr>
	<tr>
		<th>제목</th>
		<th>
			<input type="text" placeholder="제목을 입력해주세요." name="postTitle" value="<%=one.getPostTitle() %>" readonly>
		</th>
	</tr>
	<tr>
		<th>내용</th>
		<th>
			<textarea  name="postContent" rows="5" placeholder="내용을 입력해주세요." readonly><%=one.getPostContent() %></textarea>
		</th>
	</tr>
	<tr>
		<th>첨부파일</th>
		<th>
			<input type="file" value="<%=one.getAttachment() %>" name="attachment"  readonly>
		</th>
	</tr>
</table>

	<div align="center" style="margin-top: 10px;">
	
		<button onclick="location.href='<%=request.getContextPath()%>/noticelist.no'">메뉴로 돌아가기</button>
		 <% if(loginUser != null && loginUser.getUserId().equals("admin")){ %>
					<button onclick="location.href='<%=request.getContextPath()%>/selectOne.no?num1=<%=one.getPostcode()%>'">수정하기</button>
					<% } %> 
	</div>
	
</body>
</html>