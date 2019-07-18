<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	#box {
  width: 400px;
  height: 400px;
  border: 5px solid gray;
  border-radius:10px;
  margin:auto;
}
	#btn{
		height:30px;
		width:80px;
		border:3px solid #5e5e5e;
		border-radius:10px;
		margin-top:100px;
		font-size:15px;
		background:#5e5e5e;
		color:#ffffff;
	}
	input{
		height:40px;
		width:200px;
	}
</style>
</head>
<body>
	<br><br>
	<div align="center">
	<h2>비밀번호 재설정</h2>
	<div id="box" align="center">
	<br><br> 
			<tr>
				<td><label>비밀번호</label><br>
				<td><input type="password" name="password"></td>
			</tr><br><br><br>
			<tr>
				<td><label>비밀번호 재확인</label><br>
				<td><input type="password" name="password"></td>
			</tr>
	
 		<br>
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		&nbsp; 
 		<a href="/semi/views/member/MemberLoginForm.jsp"><button id="btn" onclick="ok();">네</button></a>&nbsp;&nbsp;
 		<button id="btn">아니요</button>
	</div>
	</div>
	<script>
	function ok(){
		window.alert("비밀번호 재설정완료! 로그인 페이지로 돌아가시겠습니까?");
	}
	</script>
</body>
</html>