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
	<br><br><br><br><br>
	<h1 align="center">아이디 찾기</h1>
	<br><br>
		<div align="center">
		<table>
			<tr>
				<td><label>이름</label></td>
				<td><input type="text" name="userName" id="box"></td>
			</tr>
			<tr>
				<td><label>휴대폰 번호</label></td>
				<td>
					<input type="text" maxlength="3" name="tel1" value="010" id="tel"> -
					<input type="text" maxlength="4" name="tel2" value="0000" id="tel"> -
					<input type="text" maxlength="4" name="tel3" value="0000" id="tel">
				</td>
					<td><button id="btn" onclick="Confirm();">인증</button></td>	
			</tr>
			<tr>
				<td></td>
				<td><input type="password" name="confirm" id="box"></td>
			</tr>
			<tr>
				<td></td>
				<td><a href="/semi/views/member/popup/MemberIdView.jsp"><button id="join" onclick="ok();">완료</button></a></td>
			</tr>
		</table>
		</div>
		<script>
			function send(){
				window.alert("전송완료! 이메일 확인하세요!");
			}
			function Confirm(){
				window.alert("인증완료!");
			}
			function ok(){
				window.alert("가입완료!");
			}
		</script>
		
	
</body>
</html>