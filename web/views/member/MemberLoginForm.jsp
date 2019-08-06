<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jimcarry.member.model.vo.Member"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Cute+Font&display=swap&subset=korean" rel="stylesheet">
<style>

	input {
		height:55px;
		width:300px;
		border:3px solid lightgray;
		border-radius:10px;
		margin-top:10px;
		font-size:15px;
		font-family: 'Sunflower', sans-serif;"
	}
	#join{
		margin-top:2px;
		font-family: 'Sunflower', sans-serif;"
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
		font-family: 'Sunflower', sans-serif;"
	}
	#naver{
		height:50px;
		width:300px;
		margin-top:5px;
		font-family: 'Sunflower', sans-serif;"
	}
	#kakao{
		height:50px;
		width:300px;
		margin-top:5px;
		font-family: 'Sunflower', sans-serif;"
	}
	#ot{
		height:15px;
		width:20px;
		font-family: 'Sunflower', sans-serif;"
	}
</style>
</head>
<body>
<br><br><br>
	<div align="center">
			<img src="/semi/images/main_logo.png" style="width: 350px; height: 200px; display: block; margin-left: auto; margin-right: auto;">			
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
	</div>
	</form>
	<script>
		function ok(){
			$("form").submit();
		}
	</script>
</body>
</html>