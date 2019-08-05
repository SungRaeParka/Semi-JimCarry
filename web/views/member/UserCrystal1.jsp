<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jimcarry.member.model.vo.Member"%>
<%
	String password1 = request.getParameter("password1");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
							<input type="text" maxlength="3" name="tel4" value="010" id="tel"> -
							<input type="text" maxlength="4" name="tel5" value="0000" id="tel"> -
							<input type="text" maxlength="4" name="tel6" value="0000" id="tel"></td>
							<td><button id="btn" onclick="Confirm();">인증</button></td>			
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