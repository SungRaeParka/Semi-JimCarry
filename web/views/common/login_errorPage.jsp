<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String msg = (String) request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>

<br><br><br><br><br>

	 <h1 align="center"><%= msg %></h1>
   
   <% if(msg.equals("로그인 실패")){   %>
      <div align="center">
         <button onclick="goLoginPage()">로그인 화면으로 돌아가기</button>
      </div>
   <% } %>
   
   <script>
      function goLoginPage(){
         location.href = "/semi/views/member/MemberLoginForm.jsp"
      }
   </script>
   
	
</body>
</html>