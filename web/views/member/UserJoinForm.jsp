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
		height:40px;
		width:200px;
	}
	#tel {
		height:40px;
		width:52px;
	}
	
	#join{
		height:50px;
		width:200px;
		border:3px solid #5e5e5e;
		border-radius:10px;
		margin-top:5px;
		font-size:15px;
		background:#5e5e5e;
		color:#ffffff;
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
	<h1 align="center">사용자 회원가입</h1>
	<br><br>
		<div align="center">
		<form action="<%=request.getContextPath() %>/insert.me" method="post">
		<table>
			<tr>
				<td><label>이름</label></td>
				<td><input type="text" name="userName" value="아이디 입력하세요" id="box"></td>
			</tr>
			<tr>
				<td><label>아이디</label></td>
				<td><input type="text" name="userId" value="아이디 입력하세요" id="box"></td>
				<td><button id="btn" onclick="check();">중복확인</button></td>
			</tr>
			<tr>
				<td><label>비밀번호</label></td>
				<td><input type="password" name="password" value="아이디 입력하세요" id="box"></td>
			</tr>
			<tr>
				<td><label>비밀번호 재확인</label></td>
				<td><input type="password" name="password" value="아이디 입력하세요" id="box"></td>
			</tr>
			<tr>
				<td><label>휴대폰 번호</label></td>
				<td>
					<input type="text" maxlength="3" name="tel1" value="010" id="tel"> -
					<input type="text" maxlength="4" name="tel2" value="0000" id="tel"> -
					<input type="text" maxlength="4" name="tel3" value="0000" id="tel"></td>
					<td><button id="btn" onclick="Confirm();">인증</button></td>			
			</tr>
			<tr>
				<td></td>
				<td><button id="join" onclick="ok();">가입하기</button></td>
			</tr>
		</table>
		</form>
		</div>
		<script>
		function check(){
			window.alert("중복확인!");
		}
		function send(){
			window.alert("전송완료!");
		}
		function Confirm(){
			window.alert("인증완료!");
		}
		function ok(){
			$("form").submit();
		}
		</script>
	
</body>
</html>



