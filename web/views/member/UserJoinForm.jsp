<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	input {
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
	#conFirm, #passwordCheck, #checkNobtn {
		border:3px solid #5e5e5e;
		border-radius:10px;
		text-align:center;
		font-size:15px;
		background:#5e5e5e;
		color:#ffffff;
	}
	#check{
		height:25px;
		width:70px;
		border:3px solid #5e5e5e;
		border-radius:10px;
		text-align:center;
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
		<form action="<%=request.getContextPath()%>/insert.me" method="post">
		<table>
			<tr>
				<td><label>이름</label></td>
				<td><input type="text" name="userName" placeholder="이름 입력" id="userName"></td>
			</tr>
			<tr>
				<td><label>아이디</label></td>
				<td><input type="text" name="userId" placeholder="아이디 입력" id="userId"></td>
				<td><div id="check">중복확인</div></td>
			</tr>
			<tr>
				<td><label>비밀번호</label></td>
				<td><input type="password" name="password" id="password" placeholder="비밀번호 입력"></td>
			</tr>
			<tr>
				<td><label>비밀번호 재확인</label></td>
				<td><input type="password" name="password1" id="password1" placeholder="비밀번호 재입력"></td>
			</tr>
			<tr>
				<td><label>휴대폰 번호</label></td>
				<td>
					<input type="text" maxlength="3" name="tel1" placeholder="010" id="tel"> -
					<input type="text" maxlength="4" name="tel2" placeholder="0000" id="tel"> -
					<input type="text" maxlength="4" name="tel3" placeholder="0000" id="tel"></td>
					<td><button id="conFirm" onclick="Confirm();">인증</button></td>			
			</tr>
			<tr>
				<td></td>
				<td><input type="text" name="checkNo" id="checkNo" placeholder="인증번호 입력"></td>
				<td><button id="checkNobtn" onclick="checkNobtn();">확인</button></td>
			</tr>
			<tr>
				<td></td>
				<td><button id="join" onclick="ok();">가입하기</button></td>
			</tr>
		</table>
		</form>
		</div>
		<script>
		$(function(){
			$("#check").click(function(){
				var userId = $("#userId").val();
				
				$.ajax({
					url:"/semi/userIdCheck.me",
					type:"post",
					data:{userId:userId},
					success:function(data){
						
						if(data === "fail"){
							alert("아이디가 중복됩니다.");
							$("#userId").val("").focus();
						}else{
							alert("사용 가능합니다.");
						}
					},
					error:function(){
						console.log("실패!");
					}
				});
			});
		});
		

		/* $("#passwordCheck").click(function(){
				
			if($("#password").val() != ($("#password1").val())){
			     alert("비밀번호를 확인하세요");
			      $("#password").val("");
			      $("#password1").val("");
			      $("#password").focus();
			      return false;
			   }else{
				   alert("확인완료");
			   }
			}); */
		function ok(){
			$("form").submit();
		};
		</script>
	
</body>
</html>



