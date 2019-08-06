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
 <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<title>Insert title here</title>
<style>
	html, body{
		height:100%;
		margin: 0;
		padding: 0;
	}
	.checkPwd, .updateMemberInfo {
		margin-left:75px;
		font-family: 'Sunflower', sans-serif;"
	}
		
	#main {
		min-height: 100%;
		text-align: center;
		font-family: 'Sunflower', sans-serif;"
	}	
	
	table {
 	 	border-collapse: separate;
 		border-spacing: 0 20px;
 		text-align:center;
 		font-family: 'Sunflower', sans-serif;"
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
		font-family: 'Sunflower', sans-serif;"
	}
	#checkPwdbtn {
		margin-left: 80px;
		font-family: 'Sunflower', sans-serif;"
	}
	#tel1 {
		height:30px;
		width:210px;
		font-family: 'Sunflower', sans-serif;"
	}
	#tel {
		height:30px;
		width:57px;
		font-family: 'Sunflower', sans-serif;"
	}
	input[type=file]{
		height:35px;
		width:300px; 
		border:1px solid white;
		margin-top:5px;
		margin-left:90px;
		font-size:15px;
		background:white;
		color:black;
		font-family: 'Sunflower', sans-serif;"
	}
	#main {
		margin-top: 8%;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/user_TopBar.jsp"%>
	
	<div id="main" style="font-family: 'Sunflower', sans-serif;">
		<div style="display: inline-block; padding-top: 7%;">
			<b style="font-size: 50px;">마이 페이지</b>
		</div>
		<form action="<%=request.getContextPath()%>/select.me" method="post">
		<br>
		<hr>
		<div class="container" style="display: inline-block">
  			<ul class="nav nav-tabs">
    			<li class="active"><a href="/semi/views/member/UserMyPage.jsp">회원정보</a></li>
    			<li><a onclick="userList();">이용내역</a></li>
  			</ul>

  			<div class="tab-content">
    			<div id="home" class="tab-pane fade in active" style="border: 1px solid black">
    				<table align="center">
    					<tr class="showMemberInfo">
    						<td><label>아이디 : </label></td>
    						<td><input type="text" name="userId" value="<%=loginUser.getUserId() %>" readonly></td>
    						<td><input type="hidden" name="hid" value="<%=loginUser.getSeqNo() %>"></td>
    					</tr>    					
    					<tr class="showMemberInfo">
    						<td><label>이름 : </label></td>
    						<td><input type="text" name="userName" value="<%=loginUser.getUserName() %>" readonly></td>
    					</tr>
    					<tr class="showMemberInfo">
							<td><label>휴대폰 번호 :</label>&nbsp;&nbsp;</td>
							<td>
							<input type="text" maxlength="3" name="tel1" id="tel" value="<%=loginUser.getPhone().substring(0, 3) %>"> -
							<input type="text" maxlength="4" name="tel2" id="tel" value="<%=loginUser.getPhone().substring(4, 8) %>"> -
							<input type="text" maxlength="4" name="tel3" id="tel" value="<%=loginUser.getPhone().substring(9, 13) %>">
							</td>		
						</tr>
    					<tr class="showMemberInfo">
    						<td colspan="2"><input type="button" value="회원정보 변경" id="updatebtn"></td>    						
    					</tr>
    					<tr class="showMemberInfo">
    						<td colspan="2"><input type="button" value="회원 탈퇴" id="deletebtn"></td>
    					</tr>
    				</table>
    			</div>
    			<div id="menu1" class="tab-pane fade">
    			<div class="container">
  				</div>
    			</div>    			
  			</div>
		</div>
		</form>
	</div>

	<script>
		$(function() {
			$("#deletebtn").click(function(){
				window.confirm("회원을 탈퇴하시겠습니까?");
				location.href = "UserDelete.jsp";
			});
			$("#updatebtn").click(function(){
				location.href = "UserCrystal.jsp";
			});
		});
		function userList(){
			$("form").submit();
		}
	</script>

</body>
</html>