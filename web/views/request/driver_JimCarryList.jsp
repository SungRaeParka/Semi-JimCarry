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
		<div align="center" style="padding-top: 100px;">
			<span style="font-size: 45px; font-weight: bold">기사 짐 캐리 리스트</span><br>
			<br>
			<br>
		</div>
		
		<div align="right">
			<select id="driver_filter" name="driver_filter" style="height: 50px;">
				<option value="전체 보기" selected>전체 보기</option>
				<option value="매칭대기">매칭대기</option>
				<option value="매칭완료">매칭완료</option>
				<option value="이용대기">이용대기</option>
				<option value="이용완료">이용완료</option>
				<option value="정산대기">정산대기</option>
				<option value="정산완료">정산완료</option>
			</select>
		</div>
		
		<hr>
		
		<div style="display: table">
			<div style="float: left">
				<img src="../../images/main_4.png" style="width: 120px; height: 120px; margin-left: 50px; margin-top: 30px; margin-bottom: 30px;">
			</div>
			<div style="float: left; padding-left: 20px; padding-top: 20px;">
				<span style="font-size: 40px; font-weight: bold;">출발지</span>
				<span style="font-size: 40px; font-weight: bold;">→</span>
				<span style="font-size: 40px; font-weight: bold;">도착지</span>
				<br>
				<span style="font-size: 20px;">고객명 : 박성래</span>
				<br>
				<span style="font-size: 20px;">받은 견적수 : 5건</span>
				<br>
				<span style="font-size: 20px;">입찰 요금 : 140,000원</span>
			</div>	
			<div style="float: left; padding-left: 230px; padding-top: 100px;">
				<a href="#" style="text-decoration: none;">
					<span style="font-size: 30px">상세 견적 보기</span>
				</a>
			</div>
			<div style="float: right;">
				<span style="font-size: 30px">남은 시간 : 10시간 12분</span>
			</div>		
		</div>
		
		<hr>
		
		<div style="display: table">
			<div style="float: left">
				<img src="../../images/main_4.png" style="width: 120px; height: 120px; margin-left: 50px; margin-top: 30px; margin-bottom: 30px;">
			</div>
			<div style="float: left; padding-left: 20px; padding-top: 20px;">
				<span style="font-size: 40px; font-weight: bold;">출발지</span>
				<span style="font-size: 40px; font-weight: bold;">→</span>
				<span style="font-size: 40px; font-weight: bold;">도착지</span>
				<br>
				<span style="font-size: 20px;">고객명 : 박성래</span>
				<br>
				<span style="font-size: 20px;">이용일 : 2019-07-02</span>
				<br>
				<span style="font-size: 20px;">입찰 요금 : 140,000원</span>
			</div>	
			<div style="float: left; padding-left: 230px; padding-top: 100px;">
				<a href="#" style="text-decoration: none;">
					<span style="font-size: 30px">이용 완료 처리</span>
				</a>
			</div>				
		</div>
		
		<hr>
		
		<div style="display: table">
			<div style="float: left">
				<img src="../../images/main_4.png" style="width: 120px; height: 120px; margin-left: 50px; margin-top: 30px; margin-bottom: 30px;">
			</div>
			<div style="float: left; padding-left: 20px; padding-top: 20px;">
				<span style="font-size: 40px; font-weight: bold;">출발지</span>
				<span style="font-size: 40px; font-weight: bold;">→</span>
				<span style="font-size: 40px; font-weight: bold;">도착지</span>
				<br>
				<span style="font-size: 20px;">고객명 : 박성래</span>
				<br>
				<span style="font-size: 20px;">이용일 : 2019-07-02</span>
				<br>
				<span style="font-size: 20px;">입찰 요금 : 140,000원</span>
			</div>	
			<div style="float: left; padding-left: 200px; padding-top: 100px;">
				<span style="font-size: 15px">고객이 완료 처리시 정산 신청이 가능합니다.</span>
			</div>				
		</div>
		
		<hr>
		
		<div style="display: table">
			<div style="float: left">
				<img src="../../images/main_4.png" style="width: 120px; height: 120px; margin-left: 50px; margin-top: 30px; margin-bottom: 30px;">
			</div>
			<div style="float: left; padding-left: 20px; padding-top: 20px;">
				<span style="font-size: 40px; font-weight: bold;">출발지</span>
				<span style="font-size: 40px; font-weight: bold;">→</span>
				<span style="font-size: 40px; font-weight: bold;">도착지</span>
				<br>
				<span style="font-size: 20px;">고객명 : 박성래</span>
				<br>
				<span style="font-size: 20px;">이용일 : 2019-07-02</span>
				<br>
				<span style="font-size: 20px;">입찰 요금 : 140,000원</span>
			</div>	
			<div style="float: left; padding-left: 230px; padding-top: 100px;">
				<a href="/semi/views/request/popup/pop_Driver_Calculate.jsp" style="text-decoration: none;">
					<span style="font-size: 30px">정산 신청</span>
				</a>
			</div>			
		</div>
		
		<hr>
		
		<div style="display: table">
			<div style="float: left">
				<img src="../../images/main_4.png" style="width: 120px; height: 120px; margin-left: 50px; margin-top: 30px; margin-bottom: 30px;">
			</div>
			<div style="float: left; padding-left: 20px; padding-top: 20px;">
				<span style="font-size: 40px; font-weight: bold;">출발지</span>
				<span style="font-size: 40px; font-weight: bold;">→</span>
				<span style="font-size: 40px; font-weight: bold;">도착지</span>
				<br>
				<span style="font-size: 20px;">고객명 : 박성래</span>
				<br>
				<span style="font-size: 20px;">이용일 : 2019-07-02</span>
				<br>
				<span style="font-size: 20px;">입찰 요금 : 140,000원</span>
				<br>
				<span style="font-size: 20px;">정산 요금 : 120,000원</span>
			</div>	
			<div style="float: left; padding-left: 200px; padding-top: 100px;">
				<span style="font-size: 15px">정산이 완료된 내역입니다.</span>
			</div>			
		</div>
		
		<hr>
	</div>
</body>
</html>