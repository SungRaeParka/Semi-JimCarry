<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
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
			<span style="font-size: 45px; font-weight: bold">용달차가 필요하세요?</span><br>
			<span style="font-size: 20px;">옮기실 짐을 선택하세요. 짐 캐리가 기사님을 찾아드립니다.</span>
			<br>
			<br>			
		</div>
		
		<hr>
		
		<div align="center">
			<table>
				<tr>
					<td><label style="font-size: 30px; font-weight: bold;">물품 선택</label></td>
					<td><label> → </label></td>
					<td><label>물품 상세 정보 선택</label></td>						
					<td><label> → </label></td>
					<td><label>장소, 날짜 선택</label></td>
					</tr>	
			</table>
		</div>		
				
		<hr>
			
		<div style="padding-left: 20px;">
			<span style="font-size: 30px; font-weight: bold">가전</span>
			<table style="width: 500px; height: 300px; border: 1px solid black;">
				<tr>
					<td style="border: 1px solid black; text-align: center;">
						<img src="../../images/ref.png" style="width: 100px; height: 100px;"><br><br>
						<label style="padding-bottom: 0px;">냉장고</label>
					</td>
					<td style="border: 1px solid black; text-align: center;">
						<img src="../../images/washing.png" style="width: 100px; height: 100px;"><br><br>
						<label style="padding-bottom: 0px;">세탁기</label>
					</td>
					<td style="border: 1px solid black; text-align: center;">
						<img src="../../images/tv.png" style="width: 100px; height: 100px;"><br><br>
						<label style="padding-bottom: 0px;">TV/모니터</label>
					</td>
					<td style="border: 1px solid black; text-align: center;">
						<img src="../../images/air.png" style="width: 100px; height: 100px;"><br><br>
						<label style="padding-bottom: 0px;">에어컨</label>
					</td>
				</tr>
				<tr>
					<td style="border: 1px solid black; text-align: center;">
						<img src="../../images/water.png" style="width: 100px; height: 100px;"><br><br>
						<label style="padding-bottom: 0px;">정수기</label>
					</td>
					<td style="border: 1px solid black; text-align: center;">
						<img src="../../images/pc.png" style="width: 100px; height: 100px;"><br><br>
						<label style="padding-bottom: 0px;">PC/노트북</label>
					</td>
					<td style="border: 1px solid black; text-align: center;">
						<img src="../../images/oven.png" style="width: 100px; height: 100px;"><br><br>
						<label style="padding-bottom: 0px;">전자레인지</label>
					</td>					
				</tr>
			</table>
		</div>
			
		<hr>
			
		<div style="padding-left: 20px;">
			<span style="font-size: 30px; font-weight: bold">가구</span>
			<table style="width: 500px; height: 300px; border: 1px solid black;">
				<tr>
					<td style="border: 1px solid black; text-align: center;">
						<img src="../../images/bed.png" style="width: 100px; height: 100px;"><br><br>
						<label style="padding-bottom: 0px;">침대</label>
					</td>
					<td style="border: 1px solid black; text-align: center;">
						<img src="../../images/chair.png" style="width: 100px; height: 100px;"><br><br>
						<label style="padding-bottom: 0px;">의자</label>
					</td>
					<td style="border: 1px solid black; text-align: center;">
						<img src="../../images/desk.png" style="width: 100px; height: 100px;"><br><br>
						<label style="padding-bottom: 0px;">책상/테이블</label>
					</td>
					<td style="border: 1px solid black; text-align: center;">
						<img src="../../images/bookshelf.png" style="width: 100px; height: 100px;"><br><br>
						<label style="padding-bottom: 0px;">책장</label>
					</td>
				</tr>
				<tr>
					<td style="border: 1px solid black; text-align: center;">
						<img src="../../images/closet.png" style="width: 100px; height: 100px;"><br><br>
						<label style="padding-bottom: 0px;">옷장</label>
					</td>
					<td style="border: 1px solid black; text-align: center;">
						<img src="../../images/showcase.png" style="width: 100px; height: 100px;"><br><br>
						<label style="padding-bottom: 0px;">진열장</label>
					</td>
					<td style="border: 1px solid black; text-align: center;">
						<img src="../../images/sofa.png" style="width: 100px; height: 100px;"><br><br>
						<label style="padding-bottom: 0px;">쇼파</label>
					</td>	
					<td style="border: 1px solid black; text-align: center;">
						<img src="../../images/hanger.png" style="width: 100px; height: 100px;"><br><br>
						<label style="padding-bottom: 0px;">행거</label>
					</td>										
				</tr>
				<tr>
					<td style="border: 1px solid black; text-align: center;">
						<img src="../../images/mirror.png" style="width: 100px; height: 100px;"><br><br>
						<label style="padding-bottom: 0px;">거울</label>
					</td>
					<td style="border: 1px solid black; text-align: center;">
						<img src="../../images/table.png" style="width: 100px; height: 100px;"><br><br>
						<label style="padding-bottom: 0px;">화장대</label>
					</td>
					<td style="border: 1px solid black; text-align: center;">
						<img src="../../images/piano.png" style="width: 100px; height: 100px;"><br><br>
						<label style="padding-bottom: 0px;">피아노</label>
					</td>	
				</tr>
			</table>
		</div>
			
		<hr>
			
		<div style="padding-left: 20px;">
			<span style="font-size: 30px; font-weight: bold">기타</span>
			<table style="width: 500px; height: 150px; border: 1px solid black;">
				<tr>
					<td style="border: 1px solid black; text-align: center;">
						<img src="../../images/books.png" style="width: 100px; height: 100px;"><br><br>
						<label style="padding-bottom: 0px;">책</label>
					</td>
					<td style="border: 1px solid black; text-align: center;">
						<img src="../../images/box.png" style="width: 100px; height: 100px;"><br><br>
						<label style="padding-bottom: 0px;">상자</label>
					</td>
				</tr>					
			</table>
		</div>		
	</div>
	
	<hr>
	<div align="center" style="margin-bottom: 10px">
		<a href="req_ProDetailSelect.jsp" style="text-decoration: none">
		<span style="font-size: 30px">다음 단계로</span>	
		</a>
	</div>
	
</body>
</html>