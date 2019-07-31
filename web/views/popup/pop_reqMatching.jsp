<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	%>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>견적 매칭</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js" type="application/javascript"></script>


</head>
<body>


<script>
	/* var driverNameC = opener.document.getElementById("driverName").value;
	console.log(driverNameC);
	var priceC = opener.document.getElementById("price").value;
	var gradeC = opener.document.getElementById("grade").value; */
	
	 var IMP = window.IMP; 
	IMP.init('imp21035261'); 	
	
   
    	 IMP.request_pay({ // param //결제에 필요한 정보들
    	   pg: 'danal_tpay',
    	   pay_method: 'card',
    	   merchant_uid: 'merchant_' + new Date().getTime(), //고유주문번호(결제번호 or 견적번호..?)
    	   name: '주문명 : 결제테스트',  //상품명 or 주문명
    	   amount: 100000,   //결제금액
    	   buyer_name: '구매자이름' //결제자명
    	   
    	   //m_redirect_url:'' //결제완료후 갈 페이지
    	   
    	 }, function (rsp) { // callback
    	   if (rsp.success) {
    		   jQuery.ajax({
    	    		url: "/insertPIMG.rq", 
    	    		type: 'POST',
    	    		dataType: 'json',
    	    		data: {
    		    		imp_uid : rsp.imp_uid
    		    		//기타 필요한 데이터가 있으면 추가 전달
    	    		}
    	    	}).done(function(data) {
    	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
    	    		if ( everythings_fine ) {
    	    			var msg = '결제가 완료되었습니다.';
    	    			msg += '\n고유ID : ' + rsp.imp_uid;
    	    			

    	    			alert(msg);
    	    		} else {
    	    			
    	    			var msg = "왜안ㄷ";
    	    			alert(msg);
    	    			//[3] 아직 제대로 결제가 되지 않았습니다.
    	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
    	    		}
    	    	}); 
    	    	
    	   } else {
    		    var msg = '결제에 실패 하였습니다. ';
    		   msg += '에러내용 : ' + rsp.error_msg; 
    	       		// 결제 실패 시 로직,
    	   }
    	   //alert(msg);
    	 });
   
     
     
/*     
function bootPay(){
    	 
BootPay.request({
	price: '1000', //실제 결제되는 가격
	application_id: "5d40ec7602f57e0030f7fe2c",
	name: '블링블링 마스카라', //결제창에서 보여질 이름
	pg: 'danal',
	method: 'card', //결제수단, 입력하지 않으면 결제수단 선택부터 화면이 시작합니다.
	show_agree_window: 0, // 부트페이 정보 동의 창 보이기 여부
	items: [
		{
			item_name: '나는 아이템', //상품명
			qty: 1, //수량
			unique: '123', //해당 상품을 구분짓는 primary key
			price: 1000, //상품 단가
			cat1: 'TOP', // 대표 상품의 카테고리 상, 50글자 이내
			cat2: '티셔츠', // 대표 상품의 카테고리 중, 50글자 이내
			cat3: '라운드 티', // 대표상품의 카테고리 하, 50글자 이내
		}
	],
	user_info: {
		username: '사용자 이름',
		email: '사용자 이메일',
		addr: '사용자 주소',
		phone: '010-1234-4567'
	},
	order_id: '고유order_id_1234', //고유 주문번호로, 생성하신 값을 보내주셔야 합니다.
	params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
	account_expire_at: '2018-05-25', // 가상계좌 입금기간 제한 ( yyyy-mm-dd 포멧으로 입력해주세요. 가상계좌만 적용됩니다. )
	extra: {
	    start_at: '2019-05-10', // 정기 결제 시작일 - 시작일을 지정하지 않으면 그 날 당일로부터 결제가 가능한 Billing key 지급
		end_at: '2022-05-10', // 정기결제 만료일 -  기간 없음 - 무제한
        vbank_result: 1, // 가상계좌 사용시 사용, 가상계좌 결과창을 볼지(1), 말지(0), 미설정시 봄(1)
        quota: '0,2,3' // 결제금액이 5만원 이상시 할부개월 허용범위를 설정할 수 있음, [0(일시불), 2개월, 3개월] 허용, 미설정시 12개월까지 허용
	}
}).error(function (data) {
	//결제 진행시 에러가 발생하면 수행됩니다.
	console.log(data);
}).cancel(function (data) {
	//결제가 취소되면 수행됩니다.
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
	}
}).close(function (data) {
    // 결제창이 닫힐때 수행됩니다. (성공,실패,취소에 상관없이 모두 수행됨)
    console.log(data);
}).done(function (data) {
	//결제가 정상적으로 완료되면 수행됩니다
	//비즈니스 로직을 수행하기 전에 결제 유효성 검증을 하시길 추천합니다.
	console.log(data);
});
    
}   */
</script>



	<div align="center">
		<span style="font-size: 30px; font-weight: bold">견적 매칭</span>
	</div>

	<hr>

	<form>
		<div align="center">
			<input type="hidden" id="driverNameC"> 
			<span style="font-size: 20px; font-weight: bold">기사명 :<%=request.getParameter("name")%></label></span><br>
			<span style="font-size: 20px; font-weight: bold">평점 : <%=request.getParameter("grade")%></span><br>
			<br> <br> <span style="font-size: 20px; font-weight: bold">가격
				:<%=request.getParameter("price")%>
			</span><br>
		</div>

		<hr>
		<div align="center">
			<button onclick="bootPay()">견적매칭</button> 
			<button onclick="self.close()">취소</button> 
		</div>
	</form>




</body>
</html>