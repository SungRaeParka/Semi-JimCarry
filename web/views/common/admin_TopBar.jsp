<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jimcarry.member.model.vo.*"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
<%-- <% if(loginUser != null && loginUser.getUserId().equals("admin")){ %> --%>
	<div class="w3-top">
		<div class="w3-bar w3-white w3-wide w3-padding w3-card">
			<a href="#" class="w3-bar-item w3-button"><b>짐 캐리</b></a>
			<div class="w3-right w3-hide-small">
				<a href="/semi/selectAll.u" class="w3-bar-item w3-button">회원관리</a>
				<a href="/semi/views/admin/admin_Account.jsp" class="w3-bar-item w3-button">정산관리</a>
				<a href="/semi/views/admin/admin_Statistics.jsp"	class="w3-bar-item w3-button">통계</a>
				<a href="/semi/views/admin/customerCenter/admin_CCNoList.jsp" class="w3-bar-item w3-button">고객센터관리</a>
				<a href="/semi/views/admin/admin_Board.jsp" class="w3-bar-item w3-button">게시판관리</a>
				<a class="w3-bar-item w3-button" onclick="logout();">로그아웃</a>
			</div>
		</div>
	</div>

	<script>
		function logout(){
			alert("로그아웃 하시겠습니까?");
		};
	</script>

 <%-- 	<%}else{
		request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
		request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
	}%> --%>
</body>
</html>