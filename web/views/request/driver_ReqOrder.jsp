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
	<%@ include file="/views/common/driver_TopBar.jsp" %>
	<div id="main">	
		<div style="padding-top: 65px; padding-left: 20px;">
			<span style="font-size: 45px; font-weight: bold">옮기고 싶은 짐을 선택하세요.</span><br>
			<span style="font-size: 20px;">사용자가 당신의 견적을 기다립니다.</span>
			<br>
			<br>
		</div>
			
		<hr>
		
		<div align="center">
			<table>
				<tr>
					<td>
						<span>출발지 검색 : </span>
						<select id="start_point" name="start_point">
							<option value="서울시 강남구" selected>서울시 강남구</option>
							<option value="서울시 강동구" >서울시 강동구</option>
							<option value="서울시 강북구" >서울시 강북구</option>
							<option value="서울시 강서구" >서울시 강서구</option>
							<option value="서울시 관악구" >서울시 관악구</option>
							<option value="서울시 광진구" >서울시 광진구</option>
							<option value="서울시 구로구" >서울시 구로구</option>
							<option value="서울시 금천구" >서울시 금천구</option>
							<option value="서울시 노원구" >서울시 노원구</option>
							<option value="서울시 도봉구" >서울시 도봉구</option>
							<option value="서울시 동대문구" >서울시 동대문구</option>
							<option value="서울시 동작구" >서울시 동작구</option>
							<option value="서울시 마포구" >서울시 마포구</option>
							<option value="서울시 서대문구" >서울시 서대문구</option>
							<option value="서울시 서초구" >서울시 서초구</option>
							<option value="서울시 성동구" >서울시 성동구</option>
							<option value="서울시 성북구" >서울시 성북구</option>
							<option value="서울시 송파구" >서울시 송파구</option>
							<option value="서울시 양천구" >서울시 양천구</option>
							<option value="서울시 영등포구" >서울시 영등포구</option>
							<option value="서울시 용산구" >서울시 용산구</option>
							<option value="서울시 은평구" >서울시 은평구</option>
							<option value="서울시 종로구" >서울시 종로구</option>
							<option value="서울시 중구" >서울시 중구</option>
							<option value="서울시 중랑구" >서울시 중랑구</option>				
						</select>
					</td>				
					<td>
						<span>도착지 검색 : </span>
						<select id="arrive_point" name="arrive_point">
							<option value="서울시 강남구" selected>서울시 강남구</option>
							<option value="서울시 강동구" >서울시 강동구</option>
							<option value="서울시 강북구" >서울시 강북구</option>
							<option value="서울시 강서구" >서울시 강서구</option>
							<option value="서울시 관악구" >서울시 관악구</option>
							<option value="서울시 광진구" >서울시 광진구</option>
							<option value="서울시 구로구" >서울시 구로구</option>
							<option value="서울시 금천구" >서울시 금천구</option>
							<option value="서울시 노원구" >서울시 노원구</option>
							<option value="서울시 도봉구" >서울시 도봉구</option>
							<option value="서울시 동대문구" >서울시 동대문구</option>
							<option value="서울시 동작구" >서울시 동작구</option>
							<option value="서울시 마포구" >서울시 마포구</option>
							<option value="서울시 서대문구" >서울시 서대문구</option>
							<option value="서울시 서초구" >서울시 서초구</option>
							<option value="서울시 성동구" >서울시 성동구</option>
							<option value="서울시 성북구" >서울시 성북구</option>
							<option value="서울시 송파구" >서울시 송파구</option>
							<option value="서울시 양천구" >서울시 양천구</option>
							<option value="서울시 영등포구" >서울시 영등포구</option>
							<option value="서울시 용산구" >서울시 용산구</option>
							<option value="서울시 은평구" >서울시 은평구</option>
							<option value="서울시 종로구" >서울시 종로구</option>
							<option value="서울시 중구" >서울시 중구</option>
							<option value="서울시 중랑구" >서울시 중랑구</option>				
						</select>
					</td>				
					<td align="right">
						<input type="submit" value="검색">
					</td>
				</tr>
			</table>
		</div>
		
		<hr>
		
		<div style="display: table">
			<div style="float: left">
				<img src="../../images/main_4.png" style="width: 120px; height: 120px; margin-left: 50px; margin-top: 30px; margin-bottom: 30px;">
			</div>
			<div style="float: left; padding-left: 20px; padding-top: 30px;">
				<span style="font-size: 40px; font-weight: bold; ">출발지</span>
				<span style="font-size: 40px; font-weight: bold; ">→</span>
				<span style="font-size: 40px; font-weight: bold; ">도착지</span>
				<br>
				<span style="font-size: 20px;">고객명 : 박성래</span>
				<br>
				<span style="font-size: 20px;">받은 견적수 : 5건</span>
			</div>	
			<div style="float: left; padding-left: 230px; padding-top: 100px;">
				<a href="driver_CheckReq.jsp" style="text-decoration: none;">
					<span style="font-size: 30px">상세 견적 보기</span>
				</a>
			</div>		
		</div>
		
		<hr>
		
		
		
		
	</div>
</body>
</html>