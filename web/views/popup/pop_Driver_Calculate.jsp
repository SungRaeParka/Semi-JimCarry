<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  
    import="java.util.*,com.kh.jimcarry.request.model.vo.*"%>
    
<%
 int price = Integer.parseInt(request.getParameter("price"));
int calc = (int)(price*(0.9));
String driver = request.getParameter("driver");
String reqNo = request.getParameter("reqNo");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<form>
		<div align="center">
			<div>
				<span style="font-size: 30px; font-weight: bold">정산 신청</span>
			</div>
			
			<hr>
			
			<div style="padding-top: 40px; padding-bottom: 40px;">
				<span style="font-size: 20px; font-weight: bold">
					해당 견적의 정산 요금은 <%=calc %>원 입니다.<br>
					정산신청 하시겠습니까?
				</span>
			</div>
			
			<hr>
			
			<div align="center">
			<input type="button" class="done" value="확인">
			<input type="button" class="cancel" value="취소">
		</div>
		</div>	
	</form>
	
	<script>
	$(function(){
		$(".done").click(function(){
			var driver = "<%=driver%>"
			var reqNo = "<%=reqNo%>"
			var price = "<%=price%>"
			var calc = "<%=calc%>"
			
			console.log(driver);
			console.log(reqNo);
			console.log(price);
			console.log(calc);
			
			$.ajax({
				url:"/semi/calcApply.py",
				type:"post",
				data:{
					driver:driver,
					reqNo:reqNo,
					price:price,
					calc:calc
				},
				success:function(data){
					//alert("접속완료");
				},error:function(data){
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