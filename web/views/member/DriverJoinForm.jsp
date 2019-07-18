<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	.main1 {
		display: inline-block;
		margin:50px;
		margin-top:10px;
	}
	#box {
		height:35px;
		width:150px;
	}
	#tel {
		height:30px;
		width:35px;
	}
	#ca {
		height:30px;
		width:70px;
	}
	#join{
		height:40px;
		width:170px;
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
	<h1 align="center">기사 회원가입</h1>
	<br><br>
	<div class="main" align="center">
		<div class="main1">
		<table>
			<tr>
				<td><label>이름</label></td>
				<td><input type="text" name="userName" id="box"></td>
			</tr>
			<tr>
				<td><label>아이디</label>
				<td><input type="text" name="userId" id="box"></td>
				<td><button id="btn" onclick="check();">중복확인</button></td>
			</tr>
			<tr>
				<td><label>비밀번호</label>
				<td><input type="password" name="password" id="box"></td>
			</tr>
			<tr>
				<td><label>비밀번호 재확인</label>
				<td><input type="password" name="password" id="box"></td>
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
				<td><label>대표자</label>
				<td><input type="text" name="delegate" id="box"></td>	
			</tr>
			<tr>
				<td><label>사업자등록번호</label>
				<td><input type="text" name="businessNumber" id="box"></td> 
			</tr>
		</table>
		</div>
		<div class="main1">
		<table>
			<tr>
				<td><label>차총</label>
				<td><input type="text" name="carType" id="box"></td>
			</tr>
			<tr>
				<td><label>차량번호</label>
				<td>
				<input type="text" name="carNumber" id="ca">
				<input type="text" name="carNumber" id="ca">
				</td>
			</tr>
			<tr>
				<td><label>본인사진</label>
				<td><input type="text" name="idPhoto" id="box"></td>
				<td><button id="btn">파일선택</button></td>
			</tr>
			<tr>
				<td><label>차량등록증</label>
				<td><input type="text" name="certificate" id="box"></td>
				<td><button id="btn">파일선택</button></td>
			</tr>
			<tr>
				<td><label>통장사본</label>
				<td><input type="text" name="bankBook" id="box"></td>
				<td><button id="btn">파일선택</button></td>
			</tr>
			<tr>
				<td><label>사업자등록증</label>
				<td><input type="text" name="attestation" id="box"></td>
				<td><button id="btn">파일선택</button></td>
			</tr>
			<tr>
				<td></td>
				<td><a href="/semi/views/member/MemberLoginForm.jsp"><button id="join" onclick="ok();">가입신청</button></a></td>
			</tr>
		</table>
		</div>
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
		window.alert("가입 신청완료!");
	}
	</script>
	
</body>
</html>

