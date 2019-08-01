<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
import="java.util.*, com.kh.jimcarry.request.model.vo.*"%>

<%
Request ro = (Request)request.getAttribute("reqOrder");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</head>
<body>
<%@ include file="/views/common/user_TopBar.jsp"%>
<br><br><br><br><br>

<h1>견정 매칭중 ...</h1>

<script>
var IMP = window.IMP; 
IMP.init('imp21035261'); 	

alert("결제 창으로 이동합니다.");

	 IMP.request_pay({ // param //결제에 필요한 정보들
	   pg: 'danal_tpay',
	   pay_method: 'card',
	   merchant_uid: '<%=ro.getReqNo()%>' + new Date().getTime(), //고유주문번호(결제번호 or 견적번호..?)
	   name: '<%=ro.getReqNo()%>',  //상품명 or 주문명
	   amount: <%=ro.getOrderPrice()%>,   //결제금액
	   buyer_name: '<%=ro.getUserName()%>', //결제자명
	   buyer_no : '<%=ro.getUserNo()%>',
	   driver_no  :'<%=ro.getDriverNo()%>',
	   
	   m_redirect_url:'/semi/myJcarrylist.jc' //결제완료후 갈 페이지
	   
	 }, function (rsp) { // callback
	   if (rsp.success) {
		   var msg = '결제가 완료되었습니다.';
			msg += '\n견적번호 : ' + rsp.imp_uid;
			msg += '\n결제금액 : ' + rsp.imp_uid;
	    	
	   } else {
		    var msg = '결제에 실패 하였습니다. ';
		    msg += '에러내용 : ' + rsp.error_msg; 
	       		
	   }
	   alert(msg);
	 });

 



</script>



</body>
</html>