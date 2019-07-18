<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	ul {
		list-style-type: none;
	}
	
	li {
		display: inline;
		border-left: 1px solid black;
		padding: 0px 10px 0px 10px;
		margin: 5px 0px 5px 0px;		
	}
	
	#li2 {
		border-right: 1px solid black;	
	}
</style>
</head>
<body>
	<hr>
	<div style="width:100%; height:30px; background:white;">
		<div style="display: inline; float:left; margin-left: 3%">
			<h2>짐 캐리</h2>
		</div>		
		<div style="display: inline; float:left; margin-top: 2%; margin-left: 2%;">
			<p>당신의 짐을 캐리 합니다. 추가 금액 없는 투명한 가격으로 친절한 기사님을 만나보세요. </p>
		</div>
		<div style="float: right; padding-top: 10px; padding-right: 10px;">
			<ul>
				<li id="li1"><a href="main_Terms.jsp" style="text-decoration:none">이용약관</a></li>
				<li id="li2"><a href="main_Terms.jsp" style="text-decoration:none">개인정보 보호방침</a></li>
			</ul>
		</div>		
	</div> 

</body>
</html>