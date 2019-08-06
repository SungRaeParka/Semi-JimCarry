<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
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
	<div style="width:100%; height:30px; background:white;">
		<div style="display: inline; float:left; margin-left: 3%">
			<img src="/semi/images/main_logo.png" style="width: 150px; height: 100px;">
		</div>		
		<div style="display: inline; float:left; margin-top: 5%; margin-left: 2%;">
			<span style="font-family: 'Sunflower', sans-serif; font-weight: bold;">당신의 짐을 캐리 합니다. 추가 금액 없는 투명한 가격으로 친절한 기사님을 만나보세요. </span>
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