<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.kh.jimcarry.member.model.vo.*"%>
<%
	String password1 = request.getParameter("password1");
	ArrayList<UserList> list = (ArrayList<UserList>) session.getAttribute("list");
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
	input[type=file]{
		height:35px;
		width:300px; 
		border:1px solid white;
		margin-top:5px;
		margin-left:90px;
		font-size:15px;
		background:white;
		color:black;
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
    			<li><a href="/semi/views/member/UserMyPage.jsp">회원정보</a></li>
    			<li class="active"><a onclick="userList();">이용내역</a></li>
  			</ul>

  			<div class="tab-content">
    			<div id="home" class="tab-pane fade in active" style="border: 1px solid black">			
    				<table align="center">
    					<tr class="showMemberInfo">
    						<td><label>아이디 : </label></td>
    						<td><input type="text" name="userId" value="<%=loginUser.getUserId() %>" readonly></td>
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
    				<table class="table">
  				 	<thead>
					<tr>
						<td>견적번호</td>
 				        <td>기사명</td>
   					    <td>매칭일자</td>
   					    <td>예약일자</td>
   					    <td>견적금액</td>
   					    <td>매칭상태</td>
   					    <td>환불</td>
    				</tr>
    				</thead>
    				<tbody>
    				<% for(UserList ul : list) { %>
      				<tr>
        				<td><%=ul.getReqNo() %></td>
        				<td><%=ul.getUserName() %></td>
        				<td><%=ul.getMatchingDate() %></td>
        				<td><%=ul.getReservattonDate() %></td>
        				<td><%=ul.getOrderPrice() %></td>
        				<td><%=ul.getConditionReq() %></td>
      				</tr>
      				<% } %>
    				</tbody>
      				</table>
  				</div>
    			</div>    			
  			</div>
		</div>
	</div>

	<script>
		$(function() {
			$("#deletebtn").click(function(){
				window.confirm("회원을 탈퇴하시겠습니까?");
				location.href = "../main/mainPage.jsp";
			});
			$("#updatebtn").click(function(){
				location.href = "UserCrystal.jsp";
			});
		});

	</script>

</body>
</html>