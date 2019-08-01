<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jimcarry.member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	<form action="<%=request.getContextPath()%>/login.me" method="post">
	<div align="center">
		<input type="text" name="userId" id="userId" placeholder="아이디">
	</div>
	<div align="center">
		<input type="password" name="password" id="password" placeholder="비밀번호">
	</div>
	<br>
	<div align="center" id="join">
		<a href="/semi/views/member/MemberSearchIdForm.jsp">아이디 찾기</a>&nbsp;
		<a href="/semi/views/member/MemberSearchPwdForm.jsp">비밀번호 찾기</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/semi/views/member/MemberJoinMenuForm.jsp">회원가입</a>
	</div>
	<div align="center">
		<a><button id="login" onclick="ok();">로그인</button></a><br>
		<a href="#"><img src="../../images/logo.PNG" id="logo"></a>
	</div>
	</form>
	<script>
		function ok(){
			$("form").submit();
		}
	</script>
</body>
</html>