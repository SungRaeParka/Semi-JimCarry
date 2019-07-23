<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jimcarry.member.model.vo.Member"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	input {
		height:55px;
		width:300px;
		border:3px solid lightgray;
		border-radius:10px;
		margin-top:10px;
		font-size:15px;
	}
	#join{
		margin-top:2px;
	}
	#login{
		height:50px;
		width:300px;
		border:3px solid #5e5e5e;
		border-radius:10px;
		margin-top:5px;
		font-size:15px;
		background:#5e5e5e;
		color:#ffffff;
	}
	#naver{
		height:50px;
		width:300px;
		margin-top:5px;
	}
	#kakao{
		height:50px;
		width:300px;
		margin-top:5px;
	}
	#ot{
		height:15px;
		width:20px;
	}
</style>
</head>
<body>
<br><br><br>
	<div align="center">
		<h1>짐캐리</h1>
	</div>
	<form action="<%= request.getContextPath()%>/login.me" method="post" id="loginForm">
	<div align="center">
		<input type="text" id="userId" value="아이디">
	</div>
	<div align="center">
		<input type="password" id="password" value="비밀번호">
	</div>
	<div align="center" id="ch">
		<input type="checkbox" name="ot" id="ot" checked="checked">로그인 상태유지
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
	<div align="center" id="join">
		<a href="/semi/views/member/MemberSearchIdForm.jsp">아이디 찾기</a>&nbsp;
		<a href="/semi/views/member/MemberSearchPwdForm.jsp">비밀번호 찾기</a>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/semi/views/member/MemberJoinMenuForm.jsp">회원가입</a>
	</div>
	<div align="center">
		<a href="/semi/views/mainPage.jsp"><button id="login">로그인</button></a><br>
		<a href=http://www.naver.com><img src="../../images/naver.png" id="naver"></a><br>
		<a href="#"><img src="../../images/kakao.png" id="kakao"></a>
	</div>
	</form>
</body>
</html>