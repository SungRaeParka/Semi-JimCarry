<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jimcarry.member.model.vo.Member"%>
<%
	String password1 = request.getParameter("password1");
	String checkNo = Integer.toString((int)(Math.random()*999999) + 100000);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script>
$(function(){	   
    $("#checkPhone").click(function(){
		var tel1 = $("input[name='tel4']").val();
		var tel2 = $("input[name='tel5']").val();
		var tel3 = $("input[name='tel6']").val();
		
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
	});
});
</script>
<title>Insert title here</title>
<style>
	html, body{
		height:100%;
		margin: 0;
		padding: 0;
	}
	.checkPwd, .updateMemberInfo {
		margin-left:75px;
	}
		
	#main {
		min-height: 100%;
		text-align: center;
	}	
	
	table {
 	 	border-collapse: separate;
 		border-spacing: 0 20px;
 		text-align:center;
	}
	input[type=button]{
		height:30px;
		width:220px;
		border:3px solid #5e5e5e;
		border-radius:10px;
		margin-top:5px;
		margin-left:120px;
		font-size:15px;
		background:#5e5e5e; 
		color:#ffffff;
	}
	#checkPwdbtn {
		margin-left: 80px;
	}
	#tel1 {
		height:30px;
		width:210px;
	}
	#tel {
		height:30px;
		width:57px;
	}
	#checkPhone {
	 	height:40px;
		width:120px;
		border:3px solid #5e5e5e;
		border-radius:5px;
		text-align:center;
		font-size:15px;
		background:#5e5e5e;
		color:#ffffff;
		cursor: pointer;
	 }
	 #checkNumber {
		height:30px;
		width:80px;
		border:3px solid #5e5e5e;
		border-radius:5px;
		text-align:center;
		margin-top:5px;
		font-size:15px;
		background:#5e5e5e;
		color:#ffffff;
		cursor: pointer;
	}
	#main {
		margin-top: 10%;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/user_TopBar.jsp"%>
	
	<div id="main">
		<div style="display: inline-block; padding-top: 7%;">
			<b style="font-size: 50px;">마이 페이지</b>
		</div>
		
		<br>
		<hr>
		<div class="container" style="display: inline-block">
  			<ul class="nav nav-tabs">
    			<li class="active"><a href="/semi/views/member/UserMyPage.jsp">회원정보</a></li>
    			<li><a onclick="userList();">이용내역</a></li>
  			</ul>

  			<div class="tab-content">
    			<div id="home" class="tab-pane fade in active" style="border: 1px solid black">
  			<form action="<%=request.getContextPath()%>/update.me" method="post">
    					<h3 align="center" class=updateMemberInfo>사용자 회원정보 변경</h3>
    					<table align="center">
    					<tr class="updateMemberInfo">
    						<td><label>아이디 : </label></td>
    						<td><input type="text" name="userId" value="<%=loginUser.getUserId() %>" readonly></td>
    						<td><input type="hidden" name="seqNo" value="<%=loginUser.getSeqNo() %>" readonly></td>
    					</tr>
    					<tr class="updateMemberInfo">
    						<td><label>비밀번호 : </label>&nbsp;&nbsp;</td>
    						<td><input type="password" name="password"></td>
    					</tr>      					
    					<tr class="updateMemberInfo">
    						<td><label>이름 : </label></td>
    						<td><input type="text" name="userName" value="<%=loginUser.getUserName() %>" readonly></td>
    					</tr>
    					<tr class="updateMemberInfo">
							<td><label>휴대폰 번호 :</label>&nbsp;&nbsp;</td>
							<td>
								<input type="text" maxlength="3" name="tel4" placeholder="010" id="tel"> -
								<input type="text" maxlength="4" name="tel5" placeholder="0000" id="tel"> -
								<input type="text" maxlength="4" name="tel6" placeholder="0000" id="tel">
							</td>
							<td>
								<span id="checkPhone">인증 번호 발송</span>
							</td>		
						</tr>  
						<tr>
							<td><label>휴대폰 인증</label>
							<td><input type="text" name="checkNo" id="checkNo" placeholder="인증번호 입력"></td>
							<td>
								<input type="hidden" name="action" value="go">      
						        <input type="hidden" name="msg" value="<%=checkNo%>">
						        <input type="hidden" name="rphone" value="" placeholder="받는 번호">
						        <input type="hidden" name="sphone1" value="010">
						        <input type="hidden" name="sphone2" value="6693">
						        <input type="hidden" name="sphone3" value="7764">
						        <span id="checkNumber">인증하기</span>			       
						   </td>			
						</tr> 					
    					<tr class="updateMemberInfo">
    						<td colspan="2"><input type="button" value="수정 완료" id="updateMemberbtn" onclick="updateOk();"></td>    						
    					</tr>
    				</table>
    				</form>
    			</div>
    			<div id="menu1" class="tab-pane fade">
    			<div class="container">
  				</div>
    			</div>    			
  			</div>
		</div>
	</div>

	<script>
		function updateOk(){
			$("form").submit();
		}
	</script>

</body>
</html>