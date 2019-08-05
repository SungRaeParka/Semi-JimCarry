<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  
    import="java.util.*,com.kh.jimcarry.request.model.vo.*"%>
    
<%
 int price = Integer.parseInt(request.getParameter("price"));
int calc = (int)(price*(0.9));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
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
			
			<div>
				<a style="text-decoration: none">
					<span style="font-size: 30px; font-weight: bold;">확인</span>
					<span style="font-size: 30px; font-weight: bold;">취소</span>
				</a>
			</div>
		</div>	
	</form>
</body>
</html>