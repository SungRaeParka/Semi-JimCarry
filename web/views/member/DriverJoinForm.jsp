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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
	.main1 {
		display: inline-block;
		margin:50px;
		margin-top:10px;
	}

	#box , #userId, #password1, #password, #checkNo{

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
	input[type=file]{
		height:35px;
		width:200px; 
		border:1px solid white;
		margin-top:5px;
		font-size:15px;
		background:white;
		color:black;
	}
	.table1 {
		margin-bottom:50px;
	}
	#check{
		height:25px;
		width:60px;
		border:3px solid #5e5e5e;
		border-radius:10px;
		text-align:center;
		margin-top:5px;
		font-size:15px;
		background:#5e5e5e;
		color:#ffffff;
	}
	#btn {
		border:3px solid #5e5e5e;
		border-radius:10px;
		text-align:center;
		margin-top:5px;
		font-size:15px;
		background:#5e5e5e;
		color:#ffffff;
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
</style>
</head>
<body>
	<h1 align="center">기사 회원가입</h1>
	<br><br>
	<div class="main" align="center">
		<form action="<%=request.getContextPath()%>/insertDriver.me" method="post" encType="multipart/form-data">
		<div class="main1">
		<table class="table1">
			<tr>
				<td><label>이름</label></td>
				<td><input type="text" name="userName" id="box" placeholder="이름"></td>
			</tr>
			<tr>
				<td><label>아이디</label>
				<td><input type="text" name="userId" id="userId" placeholder="아이디 입력"></td>
				<td><div id="check">중복확인</div></td>
			</tr>
			<tr>
				<td><label>비밀번호</label>
				<td><input type="password" name="password" id="password" placeholder="비밀번호"></td>
			</tr>
			<tr>
				<td><label>비밀번호 재확인</label>
				<td><input type="password" name="password1" id="password1" placeholder="비밀번호 재입력"></td>
				<td><font name="check1" size="2" color="red"></font></td>
			</tr>
			<tr>
				<td><label>휴대폰 번호</label></td>
				<td>
					<input type="text" maxlength="3" name="tel1" id="tel" placeholder="010"> -
					<input type="text" maxlength="4" name="tel2" id="tel" placeholder="0000"> -
					<input type="text" maxlength="4" name="tel3" id="tel" placeholder="0000">
				</td>
				<td>
					<div id="checkPhone">인증 번호 발송</div>
				</td>				
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
			        <div id="checkNumber">인증하기</div>			       
			   </td>			
			</tr>
			<tr>
				<td><label>대표자</label>
				<td><input type="text" name="agent" id="box" placeholder="대표자"></td>	
			</tr>
			<tr>
				<td><label>사업자등록번호</label>
				<td><input type="text" name="businessNumber" id="box" placeholder="사업자등록번호"></td> 
			</tr>
			<tr>
				<td><label>우편 번호</label></td>
				<td><input type="text" id="sample6_postcode" name = "address1" placeholder="우편번호" style="width:150px; height:20px;"></td>
         		<td><input type="button" id="btn" name="zipCode"class="btn_overlap" onclick="sample6_execDaumPostcode()"value="검색"></td>
         	</tr>
         	<tr>
         		<td><label>사업장 주소</label></td>
         		<td><input type="text"  id="sample6_address" name="address2" placeholder="주소" style="width:150px; height:20px;"></td>
         	</tr>
         	<tr>
         		<td><label>상세주소</label></td>
        		<td><input type="text"  id="sample6_detailAddress" name="address3" placeholder="상세주소" style="width:150px; height:20px;"></td>
			</tr>
		</table>
		</div>
		<div class="main1">
		<table>
			<tr>
				<td><label>차총</label>
				<td><input type="text" name="carType" id="box" placeholder="차종"></td>
			</tr>
			<tr>
				<td><label>차량크기</label>
				<td><input type="text" name="carSize" id="box" placeholder="차량크기"></td>
			</tr>
			<tr>
				<td><label>차량번호</label>
				<td>
				<input type="text" name="carNo1" id="ca" placeholder="00가">
				<input type="text" name="carNo2" id="ca" placeholder="9999">
				</td>
			</tr>
			<tr>
				<td><label>은행명</label>
				<td><input type="text" name="bankName" id="box" placeholder="은행명"></td>
			</tr>
			<tr>
				<td><label>계좌번호</label>
				<td><input type="text" name="accountNo" id="box" placeholder="계좌번호"></td>
			</tr>
			<tr>
				<td><label>본인사진</label>
				<td><input type="file" name="idPhoto"></td>
			</tr>
			<tr>
				<td><label>차량등록증</label>
				<td><input type="file" name="certificate"></td>
			</tr>
			<tr>
				<td><label>통장사본</label>
				<td><input type="file" name="bankBook"></td>
			</tr>
			<tr>
				<td><label>사업자등록증</label>
				<td><input type="file" name="attestation"></td>
			</tr>
			<tr>
				<td></td>
				<td><button id="join" onclick="ok();">가입신청</button></td>
			</tr>
			</table>
		</div>
		</form>
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
	$(function(){
		$("#check").click(function(){
			var userId = $("#userId").val();
			
			$.ajax({
				url:"/semi/driverIdCheck.me",
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
		});
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

























