<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#box {
  width: 400px;
  height: 200px;
  border: 5px solid gray;
  border-radius:10px;
  margin:auto;
}
	#btn{
		height:30px;
		width:80px;
		border:3px solid #5e5e5e;
		border-radius:10px;
		margin-top:5px;
		font-size:15px;
		background:#5e5e5e;
		color:#ffffff;
	}
</style>
</head>
<body>
	<br><br><br><br><br>
	<div align="center">
	<h2>아이디 확인</h2>
	<div id="box" align="left">
		
		<p>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		짐캐리님의 아이디는<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		_________입니다.<br>
		<br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		로그인 창으로 돌아가시겠습니까?
 		</p>
 		<br>
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		<a href="/semi/views/member/MemberLoginForm.jsp"><button id="btn">네</button></a>&nbsp;&nbsp;
 		<button id="btn">아니요</button>
	</div>
	</div>
</body>
</html>