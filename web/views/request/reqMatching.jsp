<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.jimcarry.request.model.vo.*"%>
<%
	Request ro = (Request) request.getAttribute("reqOrder");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js" type="application/javascript"></script>

</head>
<body>
	<%@ include file="/views/common/user_TopBar.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>

	<h1>견정 매칭중 ...</h1>

	<script>

BootPay.request({
	price: '3000' <%-- '<%=ro.getOrderPrice()%>' --%>, //실제 결제되는 가격
	application_id: "5d40ec7602f57e0030f7fe2c",
	name: '견적 매칭', //결제창에서 보여질 이름
	pg: 'danal',
	method: 'card', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
	show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
	items: [
		{
			item_name: '<%=ro.getReqNo()%>', //상품명
			qty: 1,
			unique: '<%=ro.getReqNo()%>', //해당 상품을 구분짓는 primary key
			price: 3000<%-- <%=ro.getOrderPrice()%> --%> //상품 단가
			
		}
	],
	user_info: {
		username: '<%=ro.getUserName()%>'
		
	},
	order_id: '<%=ro.getReqNo()%> + new Date().getTime()', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
	params: {reqno: '<%=ro.getReqNo()%>',  //상품명 or 주문명
		  	 price: 3000 <%-- <%=ro.getOrderPrice()%> --%>,   //결제금액
		  	 buyer_name: '<%=ro.getUserName()%>', //결제자명
		  	 buyer_no : '<%=ro.getUserNo()%>',
		  	driver_no  :'<%=ro.getDriverNo()%>'
		   },
	
	
}).error(function (data) {
	//결제 진행시 에러가 발생하면 수행됩니다.
	 var msg = "결제 에러입니다. " 
        alert(msg);
	console.log(data);
}).cancel(function (data) {
	//결제가 취소되면 수행됩니다.
	 var msg = "결제 취소입니다. "
        alert(msg);
	console.log(data);
}).ready(function (data) {
	// 가상계좌 입금 계좌번호가 발급되면 호출되는 함수입니다.
	console.log(data);
}).confirm(function (data) {
	//결제가 실행되기 전에 수행되며, 주로 재고를 확인하는 로직이 들어갑니다.
	//주의 - 카드 수기결제일 경우 이 부분이 실행되지 않습니다.
	console.log(data);
	var enable = true; // 재고 수량 관리 로직 혹은 다른 처리
	if (enable) {
		this.transactionConfirm(data); // 조건이 맞으면 승인 처리를 한다.
	} else {
		this.removePaymentWindow(); // 조건이 맞지 않으면 결제 창을 닫고 결제를 승인하지 않는다.
		var msg = "결제가 승인거절되었습니다." 
        alert(msg);
	}
}).close(function (data) {
    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
    location.href="/semi/myJcarrylist.jc";
    console.log(data);
    
}).done(function (data) {
	//결제가 정상적으로 완료되면 수행됩니다
	//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
	alert("결제가 완료되었습니다.");
	console.log(data);
	
	$.ajax({
		url:"insert.py",
		type:'get',
		data:{
			reqNo:"<%= ro.getReqNo()%>",
			driverNo:"<%=ro.getDriverNo()%>",
			price:"<%=ro.getOrderPrice()%>",
			userNo:"<%=ro.getUserNo()%>",
			userName:"<%=ro.getUserName()%>"
		},
		success:function(data){
			alert("접속완료");
			console.log("접속완료");
			
		},
		error:function(data){
			alert("접속실패");
			console.log("접속실패");
		}
	})

});




</script>




</body>
</html>