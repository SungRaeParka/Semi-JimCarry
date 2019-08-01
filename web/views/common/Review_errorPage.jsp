<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String msg = (String) request.getAttribute("msg");
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="/views/common/user_TopBar.jsp"%>
	<br><br><br><br><br>

	<h1 align="center"><%= msg %></h1>

</body>
</html>