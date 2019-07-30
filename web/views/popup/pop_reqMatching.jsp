<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String driverName = (String)request.getAttribute("driverName");
String price = (String)request.getAttribute("price");
String drivergrade = (String)request.getAttribute("drivergrade");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>견적 매칭</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<div align="center">
		<span style="font-size: 30px; font-weight: bold">견적 매칭</span>
	</div>
	
	<hr>
	
	<form>
		<div align="center">
			<span style="font-size: 20px; font-weight: bold">기사명 : <%=driverName %> </span><br>
			<span style="font-size: 20px; font-weight: bold">평점 : <%=drivergrade %></span><br>
			<br>
			<br>
			<span style="font-size: 20px; font-weight: bold">가격 : <%=price %></span><br>			
		</div>
		
		<hr>
		<div align="center">
			<input type="submit" value="견적 매칭">
			<input type="button" value="취소">
		</div>
	</form>
	
	
</body>
</html>