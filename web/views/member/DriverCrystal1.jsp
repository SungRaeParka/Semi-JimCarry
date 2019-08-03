<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jimcarry.member.model.vo.*"%>
<%
	Member loginDriver = (Member) session.getAttribute("loginDriver");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>Insert title here</title>
<style>
	html, body{
		height:100%;
		margin: 0;
		padding: 0;
	}
	.checkPwd, .updateMemberInfo {
		margin-left:90px;
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
	#updateMemberbtn, #checkPwdbtn, #updatebtn, #deletebtn {
		height:30px;
		width:220px;
		border:3px solid #5e5e5e;
		border-radius:10px;
		margin-top:5px;
		margin-left:110px;
		font-size:15px;
		background:#5e5e5e; 
		color:#ffffff;
	}
	#checkPwdbtn {
		margin-left: 80px;
	}
	#btn {
		margin-left:-130px;
		border:3px solid #5e5e5e;
		border-radius:10px;
		text-align:center;
		font-size:15px;
		background:#5e5e5e;
		color:#ffffff;
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
	#tel1 {
		height:30px;
		width:210px;
	}
	#tel {
		height:30px;
		width:57px;
	}
	#ca {
		height:30px;
		width:100px;
	}
</style>
</head>
<body>
	<%@ include file="/views/common/driver_TopBar.jsp" %>
	
	<div id="main">
		<div style="display: inline-block; padding-top: 7%;">
			<b style="font-size: 50px;">마이 페이지</b>
		</div>
		
		<br>
		<hr>
		<div class="container" style="display: inline-block">
  			<ul class="nav nav-tabs">
    			<li class="active"><a href="#home">회원정보</a></li>
    			<li><a href="/semi/driverList.me">이용내역</a></li>
  			</ul>

  			<div class="tab-content">
    			<div id="home" class="tab-pane fade in active" style="border: 1px solid black">
    				<form action="<%=request.getContextPath()%>/updateDriver.me" method="post" encType="multipart/form-data">
    				<table align="center">
    					<h3 align="center" class=updateMemberInfo>기사 회원정보 변경</h3>
    					<tr class="updateMemberInfo">
    						<td><label>아이디 : </label></td>
    						<td><input type="text" name="userId" value="<%=loginDriver.getUserId() %>" readonly></td>
    					</tr>
    					<tr class="updateMemberInfo">
    						<td><label>비밀번호 : </label>&nbsp;&nbsp;</td>
    						<td><input type="password" name="password"></td>
    					</tr>      					
    					<tr class="updateMemberInfo">
    						<td><label>이름 : </label></td>
    						<td><input type="text" name="userName" value="<%=loginDriver.getUserName() %>" readonly></td>
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
							<td><label>대표자</label>
							<td><input type="text" name="delegate" id="box" value="<%=loginDriver.getAgent() %>"></td>	
						</tr>
						<tr class="updateMemberInfo">
							<td><label>사업자등록번호</label>
							<td><input type="text" name="businessNumber" id="box" value="<%=loginDriver.getBusinessNo() %>"></td> 
						</tr>
						<tr class="updateMemberInfo">
							<td><label>우편 번호</label></td>
							<td><input type="text" id="sample6_postcode" name = "address1" placeholder="우편번호"></td>
       				  		<td><input type="button" id="btn" name="zipCode"class="btn_overlap" onclick="sample6_execDaumPostcode()"value="검색"></td>
       				  	</tr>
      				   	<tr class="updateMemberInfo">
       				  		<td><label>사업장 주소</label></td>
      				   		<td><input type="text"  id="sample6_address" name="address2" placeholder="주소"></td>
        			 	</tr>
      				   <tr class="updateMemberInfo">
      				   		<td><label>상세주소</label></td>
      				  		<td><input type="text"  id="sample6_detailAddress" name="address3" placeholder="상세주소"></td>
						</tr>
						<tr class="updateMemberInfo">
							<td><label>차총 :</label>
							<td><input type="text" name="carType" id="box" value="<%=loginDriver.getCarType() %>"></td>
						</tr>
						<tr class="updateMemberInfo">
							<td><label>차량번호 :</label>
							<td>
							<input type="text" name="carNumber1" id="ca" value="<%=loginDriver.getCarNo().substring(0, 3) %>">
							<input type="text" name="carNumber2" id="ca" value="<%=loginDriver.getCarNo().substring(3) %>">
						</td>
						</tr>
						<tr class="updateMemberInfo">
							<td><label>본인사진 :</label>
							<td><input type="file" name="idPhoto" value="<%=loginDriver.getIdPhoto() %>"></td>
						</tr>
						<tr class="updateMemberInfo">
							<td><label>차량등록증 :</label>
							<td><input type="file" name="certificate" value="<%=loginDriver.getCertificate() %>"></td>
						</tr>
						<tr class="updateMemberInfo">
							<td><label>통장사본 :</label>
							<td><input type="file" name="bankBook" value="<%=loginDriver.getBankBook() %>"></td>
						</tr>
						<tr class="updateMemberInfo">
							<td><label>사업자등록증 :</label>
							<td><input type="file" name="attestation" value="<%=loginDriver.getAttestation() %>"></td>
						</tr>   					
    					<tr class="updateMemberInfo">
    						<td colspan="2"><input type="button" value="수정 완료" id="updateMemberbtn" onclick="updateOk();"></td>    						
    					</tr>
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
	function sample6_execDaumPostcode(){
	       new daum.Postcode({
	             oncomplete: function(data) {
	                 // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                 // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                 // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                 var addr = ''; // 주소 변수
	                 var extraAddr = ''; // 참고항목 변수

	                 //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                 if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                     addr = data.roadAddress;
	                 } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                     addr = data.jibunAddress;
	                 }

	                 // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                 if(data.userSelectedType === 'R'){
	                     // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                     // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                     if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                         extraAddr += data.bname;
	                     }
	                     // 건물명이 있고, 공동주택일 경우 추가한다.
	                     if(data.buildingName !== '' && data.apartment === 'Y'){
	                         extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                     }
	                     // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                     if(extraAddr !== ''){
	                         extraAddr = ' (' + extraAddr + ')';
	                     }
	                     // 조합된 참고항목을 해당 필드에 넣는다.
	                     document.getElementById("sample6_detailAddress").value = extraAddr;
	                 
	                 } else {
	                     document.getElementById("sample6_detailAddress").value = '';
	                 }

	                 // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                 document.getElementById('sample6_postcode').value = data.zonecode;
	                 document.getElementById("sample6_address").value = addr;
	                 // 커서를 상세주소 필드로 이동한다.
	                 document.getElementById("sample6_detailAddress").focus();
	             }
	         }).open();
		}
	       function updateOk(){
	    	   $("form").submit();
	       };
	</script>

</body>
</html>