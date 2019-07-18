<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
	html, body{
		height:100%;
		margin: 0;
		padding: 0;		
	}	
	#main {
		min-height: 100%;
	}	
	
</style>
</head>
<body>
	<%@ include file="/views/common/user_TopBar.jsp" %>
	<div id="main">
		<div style="padding-top: 65px; padding-left: 20px;">
			<span style="font-size: 45px; font-weight: bold">선택한 짐들의 상세정보를 선택하세요.</span><br>
			<span>물품명을 선택하시면 상세정보를 선택 할 수 있습니다.</span>
		</div>
		
		<hr>
		
		<div align="center">
			<table>
				<tr>
					<td><label>물품 선택</label></td>
					<td><label> → </label></td>
					<td><label style="font-size: 30px; font-weight: bold;">물품 상세 정보 선택</label></td>						
					<td><label> → </label></td>
					<td><label>장소, 날짜 선택</label></td>
					</tr>	
			</table>
		</div>	
		
		<hr>
		
		<div style="padding-left: 20px">
			<span style="font-size: 30px; font-weight: bold">가전</span>
			
			<div style="border: 1px solid black; width: 500px;">
				<div style="padding: 30px 0px 30px 40px; display: inline-block;">
					<img src="../../images/washing.png" style="width: 140px; height: 140px">
				</div>
				
				<div style="display: inline-block; padding-left: 20px;">
					<a href="#" style="text-decoration: none;">
						<span style="font-size: 35px; font-weight: bold">세탁기</span><br>
					</a>
					<span>상세 정보</span>
				</div>				
			</div>		
		</div>
		
		<hr>
		
		<div style="padding-left: 20px">
			<span style="font-size: 30px; font-weight: bold">메모</span>			
			<div>
				<textarea placeholder="요청사항 및 특이사항을 입력하세요." style="width: 300px; height: 200px;"></textarea>
			</div>
		</div>
		
		<hr>
		
		<div align="center" style="margin-bottom: 10px">
			<a href="req_ProSelect.jsp" style="text-decoration: none">
				<span style="font-size: 30px">뒤로가기</span>	
			</a>
			<a href="req_PlaceSelect.jsp" style="text-decoration: none; padding-left: 40px;">
				<span style="font-size: 30px">다음 단계로</span>	
			</a>
		</div>
	</div>
	
</body>
</html>