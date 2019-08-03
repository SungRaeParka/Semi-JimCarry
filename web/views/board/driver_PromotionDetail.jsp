<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.kh.jimcarry.board.model.vo.*"%>
<%
	DP dpOne = (DP) request.getAttribute("dpOne");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<style>
	.outer {
		margin-top: 90px;		
	}
	
	#titleArea {
		background: #F1F1F1;
		height: 50px;
		width: 800px;
	}
	
	#dpTitle {
		font-size: 25px;
		float: left;
		margin-top: 5px;
		margin-left: 10px;
	}
	
	#dpDate {
		font-size: 14px;
		float: right;
		margin-top: 30px;
	}
	
	#dpWriter {
		font-size: 15px;
		float: left;
		margin-top: 13px;
		margin-left: 20px;
		color: #C9CDD0;
	}
	
	#infoArea {
		background: white;
		height: 50px;
		width: 800px;
		border-bottom : 1px solid #F1F1F1;
		border-left : 1px solid #F1F1F1;
		border-right : 1px solid #F1F1F1;
	}
	
	#dpCount {
		color: black;
	}
	
	#contentArea {
		width: 800px;
		border-bottom : 1px solid #F1F1F1;
		border-left : 1px solid #F1F1F1;
		border-right : 1px solid #F1F1F1;
	}
	
	#dpContent {
	
	}
</style>
</head>
<body>
	<%@ include file="/views/common/user_TopBar.jsp"%>
	<div class="outer" align="center">
		<div id="titleArea">
			<span id="dpTitle"><%=dpOne.getPostTitle() %></span>
			<span id="dpDate"><%=dpOne.getPostDate() %></span>
		</div>
		<div id="infoArea">
			<span id="dpWriter">작성자 : <span style="color: black;">운영자</span></span>
			<span style="color: #C9CDD0; float: right; margin-top: 13px;">조회수 : <span id="dpCount"><%=dpOne.getbCount()%></span></span>			
		</div>
		<div id="contentArea">
			<img src="/semi/images/air.png" style="width: 500px; height: 300px;">
			<br>
			<span id="dpContent"><%=dpOne.getPostContents() %></span>
			<br>
			<br>
		</div>
	</div>
</body>
</html>