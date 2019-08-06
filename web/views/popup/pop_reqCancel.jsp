<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String reqNo = request.getParameter("reqNo");
int tempday = Integer.parseInt(request.getParameter("tempday"));
int price = Integer.parseInt(request.getParameter("price"));
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js" type="application/javascript"></script>

<!-- <dependency>
    <groupId>org.apache.httpcomponents</groupId>
    <artifactId>httpclient</artifactId>
    <version>LATEST</version>
</dependency>
<dependency>
    <groupId>com.google.code.gson</groupId>
    <artifactId>gson</artifactId>
    <version>LATEST</version>
</dependency> -->

</head>

<body>





<%
int refunPri=0;
String msg="";

if(tempday<=0){
	msg = "당일 취소는 불가능 합니다. \n 취소 신청을 하실경우, 환불을 받으실수 없습니다.";
	
}else if(tempday>=1 && tempday<=3){
	msg = "고객님의 남은 예약일수는 "+tempday+"이며, 환불 금액은 "+(int)(price*0.3)+"입니다.  \n 정말 취소신청 하시겠습니까?";
	
}else if(tempday>=4 && tempday<=7){
	msg = "고객님의 남은 예약일수는 "+tempday+"이며, 환불 금액은 "+(int)(price*0.7)+"입니다.  \n 정말 취소신청 하시겠습니까?";
	
}else{
	msg = "고객님의 남은 예약일수는 "+tempday+"이며, 환불 금액은 "+price+"입니다.  \n 정말 취소신청 하시겠습니까?";
}

%>

	<div align="center">
		<span style="font-size: 30px; font-weight: bold">매칭취소 신청</span>
	</div>
	
	<hr>
	
	<form>
			<br><br><br>
		<div align="center">
		<span style="font-size: 20px; font-weight: bold">기사님과 협의 후 취소해주세요. </span><br>
			<br>		
			
			<label>취소 사유 : </label>
			<select id="matchingCancel" name="matchingCancel">
				<option value="이사 정보 재 입력" selected>이사 정보 재 입력</option>
				<option value="단순 가격 확인용">단순 가격 확인용</option>
				<option value="원하는 가격의 견적이 없어서">원하는 가격의 견적이 없어서</option>
				<option value="기타">기타</option>
			</select>
			
			 
			 <h3><%=msg %></h3>
			
			<br><br><br>						
				
		</div>
		
		<hr>
		<div align="center">
			<input type="button" class="done" value="취소신청">
			<input type="button" class="cancel" value="취소">
		</div>
	</form>
	
	
	<script>
	
	/* BootpayApi api;
	api = new BootpayApi(
	        "[5d40ec7602f57e0030f7fe2f]",
	        "[XJwpWcKOKx6ETmPPEKekwG8cVh7zrKbj+BS/GiWKlAM=]");
	
	api.getAccessToken();
	
	Cancel cancel = new Cancel();
	cancel.receipt_id = "[[ receipt_id ]]";
	cancel.name = "관리자 홍길동";
	cancel.reason = "날짜 변경";

	try {
	    HttpResponse res = api.cancel(cancel);
	    String str = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
	    System.out.println(str);
	} catch (Exception e) {
	    e.printStackTrace();
	}

 */
	
	
	
	$(function(){
		$(".done").click(function(){
			alert("취소하기");
			
			var reqNo = '<%=reqNo%>';
			var reason = $("#matchingCancel option:selected").val();
			
			console.log(reqNo);
			console.log(reason);
			
			$.ajax({
				url:"/semi/reqCancelApply.jc",
				type:"post",
				data:{
					reqNo:reqNo,
					reason:reason,
					tempday:<%=tempday%>,
					price:<%=price%>
				},
				sucess:function(data){
					alert("접속완료");
				},
				error:function(data){
					//alert("접속실패");
				}
			})
			window.opener.location.reload();
			window.close();
		})
	})
	
	
	
	$(function(){
		$(".cancel").click(function(){
			window.close();
		})
	})
	
	
	
	</script>
	
	
	
</body>
</html>