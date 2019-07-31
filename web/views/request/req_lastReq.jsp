<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, java.text.SimpleDateFormat, com.kh.jimcarry.request.model.vo.*"%>
<%
	ShowRP requestInfo = (ShowRP) session.getAttribute("requestInfo");
	ArrayList<HashMap<String, Object>> requestImg = (ArrayList<HashMap<String, Object>>) session.getAttribute("requestImg");
	ArrayList<HashMap<String, Object>> productInfo = (ArrayList<HashMap<String, Object>>)session.getAttribute("productInfo");
%>

	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>최종견적서</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style>
#outer {
	width: 870px;
	margin: 0 auto;
}

#imgs {
	width: auto;
	height: auto;
	max-width: 100px;
	max-height: 100px;
	border: 1px solid black;
}

.container {
	padding-left: 330px;
}
</style>

</head>
<body>
	<%@ include file="/views/common/user_TopBar.jsp" %>

	<div id="outer">

		<br> <br> <br> <br>	
	

		<h1 align="center">최종 견적서</h1>
		<hr>
		<div>
			<h3>예정일</h3>
			<p><%=requestInfo.getReservDate() %></p>
		</div>
		
		<hr>

		<div>
			<h3>출발지</h3>
			<p><%=requestInfo.getStartPoint() %></p>
		</div>

		<hr>

		<div>
			<h3>도착지</h3>
			<p><%=requestInfo.getArrivePoint() %></p>
		</div>
		
		<hr>
		
		<div>
			<h3>짐 정보</h3>
			<%for(int i = 0; i < productInfo.size(); i++) {
				HashMap<String, Object> hmap = productInfo.get(i);%>
				
				<%if(hmap.get("proName").equals("냉장고")){ %>
				<p><%=hmap.get("proKind")%>, <%=hmap.get("proName")%>, <%=hmap.get("proType")%>, <%=hmap.get("proSize")%></p>
				<%}else if(hmap.get("proName").equals("세탁기")) {%>
				<p><%=hmap.get("proKind")%>, <%=hmap.get("proName")%>, <%=hmap.get("proType")%>, <%=hmap.get("proSize")%></p>
				<%}else if(hmap.get("proName").equals("TV/모니터")) {%>
				<p><%=hmap.get("proKind")%>, <%=hmap.get("proName")%>, <%=hmap.get("proSize")%></p>
				<%}else if(hmap.get("proName").equals("에어컨")) {%>
				<p><%=hmap.get("proKind")%>, <%=hmap.get("proName")%>, <%=hmap.get("proType")%>, <%=hmap.get("proUni")%></p>
				<%}else if(hmap.get("proName").equals("정수기")) {%>
				<p><%=hmap.get("proKind")%>, <%=hmap.get("proName")%>, <%=hmap.get("proSize")%>, <%=hmap.get("proUni")%></p>
				<%}else if(hmap.get("proName").equals("PC/데스크탑")) {%>
				<p><%=hmap.get("proKind")%>, <%=hmap.get("proName")%>, <%=hmap.get("proType")%></p>
				<%}else if(hmap.get("proName").equals("전자레인지")) {%>
				<p><%=hmap.get("proKind")%>, <%=hmap.get("proName")%>, <%=hmap.get("proType")%></p>
				<%}else if(hmap.get("proName").equals("침대")) {%>
				<p><%=hmap.get("proKind")%>, <%=hmap.get("proName")%>, <%=hmap.get("proType")%>, <%=hmap.get("proSize")%></p>
				<%}else if(hmap.get("proName").equals("의자")) {%>
				<p><%=hmap.get("proKind")%>, <%=hmap.get("proName")%>, <%=hmap.get("proType")%></p>
				<%}else if(hmap.get("proName").equals("책상/테이블")) {%>
				<p><%=hmap.get("proKind")%>, <%=hmap.get("proName")%>, <%=hmap.get("proType")%>, <%=hmap.get("proSize")%>, <%=hmap.get("proMat")%>, <%=hmap.get("proWidth")%></p>
				<%}else if(hmap.get("proName").equals("책장")) {%>
				<p><%=hmap.get("proKind")%>, <%=hmap.get("proName")%>, <%=hmap.get("proWidth")%>, <%=hmap.get("proHeight")%></p>
				<%}else if(hmap.get("proName").equals("옷장")) {%>
				<p><%=hmap.get("proKind")%>, <%=hmap.get("proName")%>, <%=hmap.get("proType")%>, <%=hmap.get("proUni")%>, <%=hmap.get("proWidth")%></p>
				<%}else if(hmap.get("proName").equals("진열장")) {%>
				<p><%=hmap.get("proKind")%>, <%=hmap.get("proName")%>, <%=hmap.get("proWidth")%>, <%=hmap.get("proHeight")%>, <%=hmap.get("proGck")%></p>
				<%}else if(hmap.get("proName").equals("쇼파")) {%>
				<p><%=hmap.get("proKind")%>, <%=hmap.get("proName")%>, <%=hmap.get("proSize")%></p>
				<%}else if(hmap.get("proName").equals("행거")) {%>
				<p><%=hmap.get("proKind")%>, <%=hmap.get("proName")%>, <%=hmap.get("proType")%>, <%=hmap.get("proWidth")%></p>
				<%}else if(hmap.get("proName").equals("거울")) {%>
				<p><%=hmap.get("proKind")%>, <%=hmap.get("proName")%>, <%=hmap.get("proType")%>, <%=hmap.get("proSize")%></p>
				<%}else if(hmap.get("proName").equals("화장대")) {%>
				<p><%=hmap.get("proKind")%>, <%=hmap.get("proName")%>, <%=hmap.get("proType")%>, <%=hmap.get("proMat")%></p>
				<%}else if(hmap.get("proName").equals("피아노")) {%>				
				<p><%=hmap.get("proKind")%>, <%=hmap.get("proName")%>, <%=hmap.get("proType")%></p>
				<%} %>
			<%} %>
		</div>
		
		<hr>

		<div>
			<h3>사진 정보</h3>
			<%for(int i = 0; i < requestImg.size(); i++){
				HashMap<String, Object>hmap = requestImg.get(i);	
			%>	
			<img src="/semi/images_uploadFiles/<%=hmap.get("changeName") %>" id="imgs">
			<%} %>
		</div>
				
		<hr>	
		
		<div>
			<h3>메모</h3>
			<p><%=requestInfo.getMemo() %></p>

		</div>
		
		<hr>

		<div>
			<h3>입찰 받을 기간</h3>
			<p><%=requestInfo.getReqStart()%> ~ <%=requestInfo.getReqFinish() %></p>
		</div>
		
		<hr>

		<br> <br>

		<div align="center" style="margin-bottom: 10px">
				<span style="font-size: 30px; cursor: pointer;" onclick="goReqList()">확인</span>	
		</div>
	</div>

	<script>
		function goReqList(){
			location.href = "<%=request.getContextPath()%>/myJcarrylist.jc";
		}
	</script>



</body>
</html>