<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String checkNo = Integer.toString((int)(Math.random()*999999) + 100000);
%>
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
	#conFirm, #passwordCheck, #checkNobtn, #pwdCheck {
		border:3px solid #5e5e5e;
		border-radius:10px;
		text-align:center;
		font-size:15px;
		background:#5e5e5e;
		color:#ffffff;
	}
	#check {
		height:25px;
		width:70px;
		border:3px solid #5e5e5e;
		border-radius:10px;
		text-align:center;
		margin-top:5px;
		font-size:15px;
		background:#5e5e5e;
		color:#ffffff;
		cursor: pointer;
	}
	
	#checkPhone {
		height:25px;
		width:110px;
		border:3px solid #5e5e5e;
		border-radius:10px;
		text-align:center;
		margin-top:5px;
		font-size:15px;
		background:#5e5e5e;
		color:#ffffff;
		cursor: pointer;
	}
	
	#checkNumber {
		height:25px;
		width:70px;
		border:3px solid #5e5e5e;
		border-radius:10px;
		text-align:center;
		margin-top:5px;
		font-size:15px;
		background:#5e5e5e;
		color:#ffffff;
		cursor: pointer;
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
				<td><input type="password" name="password" id="password" placeholder="비밀번호 입력" class="form-control"></td>
			</tr>
			<tr>
				<td><label>비밀번호 재확인</label></td>
				<td><input type="password" name="password1" id="password1" placeholder="비밀번호 재입력" class="form-control"></td>
				<td><font name="check1" size="2" color="red"></font></td>
			</tr>
			<tr>
				<td><label>휴대폰 번호</label></td>
				<td>
					<input type="text" maxlength="3" name="tel1" placeholder="010" id="tel"> -
					<input type="text" maxlength="4" name="tel2" placeholder="0000" id="tel"> -
					<input type="text" maxlength="4" name="tel3" placeholder="0000" id="tel">
				</td>					
				<td>
					<div id="checkPhone">인증 번호 발송</div>
				</td>			
			</tr>
			<tr>
				<td></td>
				<td><input type="text" name="checkNo" id="checkNo" placeholder="인증번호 입력"></td>
				<td>
					<input type="hidden" name="action" value="go">      
			        <input type="hidden" name="msg" value="<%=checkNo%>">
			        <input type="hidden" name="rphone" value="" placeholder="받는 번호">
			        <input type="hidden" name="sphone1" value="010">
			        <input type="hidden" name="sphone2" value="6693">
			        <input type="hidden" name="sphone3" value="7764">
			        <div id="checkNumber">인증하기</div>
			       
			   </td>
			</tr>
			<tr>
				<td></td>
				<td><button id="join">가입하기</button></td>
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

		$("#join").click(function() {
			// if문으로 비밀번호가 틀리면 출력
			var pwd = $("#password").val();
	        var pwd1 = $("#password1").val();
	        if(pwd != pwd1){	
				window.confirm("비밀번호가 틀립니다. 다시입력하세요");	            	
	        }else{
	        	$("form").submit();
	        }
		});	
		
		$("#checkPhone").click(function(){
			var tel1 = $("input[name='tel1']").val();
			var tel2 = $("input[name='tel2']").val();
			var tel3 = $("input[name='tel3']").val();
			
			var rphone = tel1 + "-" + tel2 + "-" + tel3;			
			var sphone1 = $("input[name='sphone1']").val();
			var sphone2 = $("input[name='sphone2']").val();
			var sphone3 = $("input[name='sphone3']").val();
			var msg = $("input[name='msg']").val();
			console.log("msg :::: " + msg);
			var action = $("input[name='action']").val();
			
			
			// 인증번호 입력창
						
			
			$.ajax({
				url:"smssend.jsp",
				data:{rphone:rphone, sphone1:sphone1, sphone2:sphone2, sphone3:sphone3, msg:msg, action:action},
				dataType:"text",
				type:"post",
				success:function(data){
					alert("인증번호가 발송되었습니다.");			
					
					var checkPhone = data;					
					
					$("#checkPhone").hide();
					
					
					$("#checkNumber").on("click", function(){
						
						var checkNo = $("input[name='checkNo']").val();
						
						console.log("checkNo :::: " + checkNo);
						console.log("checkPohne ::::" + checkPhone);
						
						if(checkNo == checkPhone){
							$("#checkNo").attr({"readonly":"true"});
							$("#checkNumber").hide();
							alert("인증이 완료되었습니다.");
						}else{
							alert("인증번호가 틀렸습니다. 다시 입력하세요.");
							$("#checkPhone").show();
						}
								
					});
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			    }			
			});
			

		
		$("#password").keyup(function(){
			$("font[name=check]").text("");
		});
		$("#password1").keyup(function(){
			if($("#password").val()!= $("#password1").val()){
				$("font[name=check1]").text("");
				$("font[name=check1]").html("비밀번호 불일치");
			}else{
				$("font[name=check1]").text("");
				$("font[name=check1]").html("비밀번호 일치");
				$("#join").click(function() {
					$("form").submit();	
				});
			}

		});
		
		</script>
	
</body>
</html>



