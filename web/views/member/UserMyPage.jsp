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
    			<li class="active"><a data-toggle="tab" href="#home">회원정보</a></li>
    			<li><a data-toggle="tab" href="#menu1">이용내역</a></li>
  			</ul>

  			<div class="tab-content">
    			<div id="home" class="tab-pane fade in active" style="border: 1px solid black">
    				<form action="" method="post">
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
							<input type="text" maxlength="3" name="tel1" value="<%=loginUser.getPhone() %>" id="tel" readonly> -
							<input type="text" maxlength="4" name="tel2" value="0000" id="tel" readonly> -
							<input type="text" maxlength="4" name="tel3" value="0000" id="tel" readonly></td>		
						</tr>
    					<tr class="showMemberInfo">
    						<td colspan="2"><input type="button" value="회원정보 변경" id="updatebtn"></td>    						
    					</tr>
    					<tr class="showMemberInfo">
    						<td colspan="2"><input type="button" value="회원 탈퇴" id="deletebtn"></td>
    					</tr>

    					<h3 align="center" class="checkPwd">비밀번호 확인</h3>  					
    					<tr class="checkPwd">
    						<td><label>아이디 : </label></td>
    						<td><input type="text" name="userId" value="<%=loginUser.getUserId() %>" readonly></td>
    					</tr>
    					<tr class="checkPwd">
    						<td><label>비밀번호 :</label>&nbsp;&nbsp;</td>
    						<td><input type="password" name="password1" id="password1"></td>
    						<td><input type="hidden" name="pwd" id="pwd" value="<%=loginUser.getUserPwd()%>"></td>
    					</tr>  
    					<tr class="checkPwd">
    						<td colspan="2"><input type="button" value="비밀번호 확인" id="checkPwdbtn"></td> 						
    					</tr>
    					<h3 align="center" class=updateMemberInfo>사용자 회원정보 변경</h3>
    					<tr class="updateMemberInfo">
    						<td><label>아이디 : </label></td>
    						<td><input type="text" name="userId" value="<%=loginUser.getUserId() %>" readonly></td>
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
							<input type="text" maxlength="3" name="tel1" value="010" id="tel"> -
							<input type="text" maxlength="4" name="tel2" value="0000" id="tel"> -
							<input type="text" maxlength="4" name="tel3" value="0000" id="tel"></td>
							<td><button id="btn" onclick="Confirm();">인증</button></td>			
						</tr>   					
    					<tr class="updateMemberInfo">
    						<td colspan="2"><input type="button" value="수정 완료" id="updateMemberbtn" onclick="location.href='<%=request.getContextPath() %>/update.me'"></td>    						
    					</tr>
    				</table>
    				</form>
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
      				<tr>
        				<td>1</td>
        				<td>손흥민</td>
        				<td></td>
        				<td></td>
        				<td></td>
        				<td>매칭대기</td>
        				<td><button id="btn" onclick="check();">환불</button></td>
      				</tr>
      				<tr>
        				<td>2</td>
        				<td>이강인</td>
        				<td>2019-06-10</td>
        				<td>2019-06-13</td>
        				<td>75,000</td>
        				<td>매칭완료</td>
        				<td><button id="btn" onclick="check();">환불</button></td>
      				</tr>
      				<tr>
        				<td>3</td>
        				<td>백승호</td>
        				<td>2019-06-13</td>
        				<td>2019-06-17</td>
        				<td>80,000</td>
        				<td>이용대기<button id="btn1" onclick="ok();">완료</button></td>
        				<td><button id="btn" onclick="check();">환불</button></td>
      				</tr>
      				<tr>
        				<td>4</td>
        				<td>이승우</td>
        				<td>2019-06-20</td>
        				<td>2019-06-24</td>
        				<td>73,000</td>
        				<td>이용완료</td>
        				<td><button id="btn" onclick="check();">환불</button></td>
      				</tr>
    				</tbody>
  				</table>
  				</div>
    			</div>    			
  			</div>
		</div>
	</div>

	<script>
		$(function() {
			$(".updateMemberInfo").hide();
			$(".checkPwd").hide();

			$("#updatebtn").click(function() {
				$(".showMemberInfo").hide();
				$(".updateMemberInfo").hide();
				$(".checkPwd").show();
			});
			
			$("#checkPwdbtn").click(function() {
				// if문으로 비밀번호가 틀리면 출력
				var pwd = $('#pwd').val();
	            var pwd1 = $('#password1').val();
	            if(pwd != pwd1){	
					window.confirm("비밀번호가 틀립니다. 다시입력하세요");
					$("#password1").val("").focus();	            	
	            }else{
					$(".showMemberInfo").hide();
					$(".updateMemberInfo").show();
					$(".checkPwd").hide();
	            }
			});
			
			/* $("#updateMemberbtn").click(function() {
				window.confirm("회원정보가 수정되었습니다.");
				$(".showMemberInfo").show();
				$(".updateMemberInfo").hide();
				$(".checkPwd").hide();
			}); */
			
			$("#deletebtn").click(function(){
				window.confirm("회원을 탈퇴하시겠습니까?");
				location.href = "../main/mainPage.jsp";
			});
		});
		function check(){
			window.alert("환불신청!");
		}
		function ok(){
			window.alert("이용완료!");
		}
	</script>

</body>
</html>