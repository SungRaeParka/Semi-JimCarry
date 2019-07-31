<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<form action="<%=request.getContextPath() %>/insertReqPrice.rq" method="post">	
		<input type="hidden" id="priceReqNo" name="priceReqNo" value="<%=request.getParameter("priceReqNo")%>">
		<input type="hidden" id="driverNo" name="driverNo" value="<%=request.getParameter("driverNo")%>">
		<div align="center">
			<span style="font-size: 30px; font-weight: bold">견적 보내기</span>
		</div>
			
		<hr>
		
		<div align="center" style="padding-top: 50px; padding-bottom: 50px;">			
			<span style="font-size: 20px;">요금 입력 : </span>
			<input type="number" name="reqPrice">
		</div>	
		
		<hr>	
		
		<div align="center">
			<span style="font-size: 20px; font-weight: bold">총 용달 비용은 <label id="price"></label>원 입니다.<br>
			견적을 보내시겠습니까?</span>
		</div>
		
		<hr>
		
		<div align="center">
				<span style="font-size: 30px; cursor: pointer;"> 취소 </span>
				<span style="font-size: 30px; cursor: pointer; padding-left: 60px;" onclick="sendPrice()"> 보내기 </span>
		</div>	
	</form>
	<script>
		$(function(){
			$("input[name='reqPrice']").on("change keyup paste input", function(){
				$("#price").html($("input[name='reqPrice']").val())
			});
		});	
		
		function sendPrice(){
			$("form").submit();
			opener.location.href="/semi/driverJcarrylist.jc";
			window.close();
		}
	</script>
</body>
</html>