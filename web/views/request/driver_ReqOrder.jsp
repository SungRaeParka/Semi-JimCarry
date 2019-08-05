<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>   
<%
	ArrayList<HashMap<String, Object>> reqNoList = (ArrayList<HashMap<String, Object>>) request.getAttribute("reqNoList");
	ArrayList<HashMap<String, Object>> reqList = (ArrayList<HashMap<String, Object>>) request.getAttribute("reqList");
%>
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
							<option selected>출발지를 선택하세요.</option>
							<option value="전체보기">전체보기</option>
							<option value="서울시 강남구" >서울시 강남구</option>
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
				</tr>
				<tr>	
					<td>
						<span>도착지 검색 : </span>
						<select id="arrive_point" name="arrive_point">
							<option selected>도착지를 선택하세요.</option>
							<option value="전체보기">전체보기</option>
							<option value="서울시 강남구" >서울시 강남구</option>
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
				</tr>
			</table>
		</div>			
		
		<hr>
		
		<form action="<%=request.getContextPath()%>/driverckureq.rq?reqNo0=" method="get">
		<%for(int i = 0; i < reqNoList.size(); i++) {
			HashMap<String, Object> hmap = reqList.get(i);
			HashMap<String, Object> hmap2 = reqNoList.get(i);
		%>
			<div class="filterdiv" style="display: inline-block; border: 1px solid lightgray">
				<div style="float: left; padding-top: 30px;">
					<img src="/semi/images/mc1.png" style="width: 120px; height: 120px; margin-left: 50px; margin-top: 20px; margin-bottom: 30px;">
				</div>
				<div style="float: left; padding-left: 20px; padding-top: 30px;">
					<span class="startspan" style="font-size: 40px; font-weight: bold;"><%=hmap.get("reqStart")%></span>
					<span style="font-size: 40px; font-weight: bold;">→</span>
					<span class="arrivespan" style="font-size: 40px; font-weight: bold;"><%=hmap.get("reqArrive")%></span>				
					<br>
					<span style="font-size: 20px;">예약일 : <%=hmap.get("reservDate")%></span>
					<br>
					<span style="font-size: 20px;">고객명 : <%=hmap.get("memberName")%></span>
					<br>
					<span style="font-size: 20px;">받은 견적수 : <%=hmap.get("reqCount")%>건</span>
				</div>
				<div style="float: right; font-size: 20px; padding-right: 30px">
					<span><%=hmap2.get("reqNo")%></span>
				</div>
				<div style="float: right; padding-right: 100px;">
					<span style="font-size: 30px; cursor: pointer;" class="lastReq">상세 견적 보기</span>
					<input type="hidden" name="tempReq" id="tempReq" value=<%=hmap2.get("reqNo")%>>
				</div>	
			</div>
		<%} %>
		<input type="hidden" name="reqNo" id="reqNo">
		</form>
	</div>
	<script>		
		
		$(function(){
			$(".lastReq").click(function(){
				
				var reqNoVal = $(this).next().val();				
				
				$("#reqNo").val(reqNoVal);
				
				$("form").submit();			
				
			});
		});
		
		// 필터기능 제이쿼리로 하게되면 쓸거
		$(function(){
			$("#start_point").change(function(){
				var spoint = $("#start_point").val();
				var apoint = $("#arrive_point").val();
				
				console.log(spoint);
				console.log(apoint);
				
				var filterDiv = $(".filterdiv");
				
				if((!(spoint == "출발지를 선택하세요.")) && (apoint == "전체보기" || apoint == "도착지를 선택하세요.")){
					if(spoint == "전체보기"){
							filterDiv.show();
					}else if(spoint == "서울시 강동구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('강동구')")).show();
					}else if(spoint == "서울시 강북구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('강북구')")).show();
					}else if(spoint == "서울시 강서구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('강서구')")).show();
					}else if(spoint == "서울시 관악구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('관악구')")).show();
					}else if(spoint == "서울시 광진구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('광진구')")).show();
					}else if(spoint == "서울시 구로구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('구로구')")).show();
					}else if(spoint == "서울시 금천구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('금천구')")).show();
					}else if(spoint == "서울시 노원구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('노원구')")).show();
					}else if(spoint == "서울시 도봉구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('도봉구')")).show();
					}else if(spoint == "서울시 동대문구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('동대문구')")).show();
					}else if(spoint == "서울시 동작구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('동작구')")).show();
					}else if(spoint == "서울시 마포구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('마포구')")).show();
					}else if(spoint == "서울시 서대문구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('서대문구')")).show();
					}else if(spoint == "서울시 서초구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('서초구')")).show();
					}else if(spoint == "서울시 성동구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('성동구')")).show();
					}else if(spoint == "서울시 성북구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('성북구')")).show();
					}else if(spoint == "서울시 송파구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('송파구')")).show();
					}else if(spoint == "서울시 양천구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('양천구')")).show();
					}else if(spoint == "서울시 영등포구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('영등포구')")).show();
					}else if(spoint == "서울시 용산구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('용산구')")).show();
					}else if(spoint == "서울시 은평구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('은평구')")).show();
					}else if(spoint == "서울시 종로구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('종로구')")).show();
					}else if(spoint == "서울시 중구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('중구')")).show();
					}else if(spoint == "서울시 중랑구"){	
						filterDiv.hide();					
						filterDiv.has($(".startspan").filter(":contains('중랑구')")).show();
					}	
				}else if(!(spoint == "출발지를 선택하세요.") && !(apoint == "도착지를 선택하세요.")){		
					if(spoint == "전체보기" || apoint == "전체보기"){
						filterDiv.show();
						
					}else if(spoint == "서울시 강남구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('강남구')")).show();							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('강동구')")).show();
					
					}else if(spoint == "서울시 강남구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 중랑구"){
							filterDiv.hide();
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();
					}else if(spoint == "서울시 강동구" && apoint == "서울시 강남구"){
						filterDiv.hide();							
						filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 강동구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('강동구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 강동구" && spoint == "서울시 마포구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 강북구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 강서구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
				
					}else if(spoint == "서울시 관악구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('강남구')")).show();	
					
					}else if(spoint == "서울시 관악구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 광진구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 구로구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 금천구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
						
					}else if(spoint == "서울시 금천구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
						
					}else if(spoint == "서울시 금천구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					
					}else if(spoint == "서울시 노원구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 노원구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
						
					}else if(spoint == "서울시 노원구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 동작구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 마포구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
						
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					
					}else if(spoint == "서울시 서초구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
			
					}else if(spoint == "서울시 서초구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					
					}else if(spoint == "서울시 성동구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 성동구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
						
					}else if(spoint == "서울시 성북구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 성북구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
						
					}else if(spoint == "서울시 송파구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 송파구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
						
					}else if(spoint == "서울시 양천구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 양천구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
						
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
						
					}else if(spoint == "서울시 용산구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('강남구')")).show();	
					
					}else if(spoint == "서울시 용산구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
						
					}else if(spoint == "서울시 은평구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 은평구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
						
					}else if(spoint == "서울시 종로구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 종로구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
						
					}else if(spoint == "서울시 중구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 중구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 중구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
						
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('강남구')")).show();	
					
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					}
				}
			});	
			
			$("#arrive_point").change(function(){
				var spoint = $("#start_point").val();
				var apoint = $("#arrive_point").val();
				
				console.log(spoint);
				console.log(apoint);
				
				var filterDiv = $(".filterdiv");
				
				if((spoint == "전체보기" || spoint == "출발지를 선택하세요.") && !(apoint == "도착지를 선택하세요.")){					
					if(apoint == "전체보기"){
						filterDiv.show();
					}else if(apoint == "서울시 강동구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('강동구')")).show();
					}else if(apoint == "서울시 강북구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('강북구')")).show();
					}else if(apoint == "서울시 강서구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('강서구')")).show();
					}else if(apoint == "서울시 관악구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('관악구')")).show();
					}else if(apoint == "서울시 광진구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('광진구')")).show();
					}else if(apoint == "서울시 구로구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('구로구')")).show();
					}else if(apoint == "서울시 금천구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('금천구')")).show();
					}else if(apoint == "서울시 노원구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('노원구')")).show();
					}else if(apoint == "서울시 도봉구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('도봉구')")).show();
					}else if(apoint == "서울시 동대문구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('동대문구')")).show();
					}else if(apoint == "서울시 동작구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('동작구')")).show();
					}else if(apoint == "서울시 마포구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('마포구')")).show();
					}else if(apoint == "서울시 서대문구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('서대문구')")).show();
					}else if(apoint == "서울시 서초구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('서초구')")).show();
					}else if(apoint == "서울시 성동구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('성동구')")).show();
					}else if(apoint == "서울시 성북구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('성북구')")).show();
					}else if(apoint == "서울시 송파구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('송파구')")).show();
					}else if(apoint == "서울시 양천구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('양천구')")).show();
					}else if(apoint == "서울시 영등포구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('영등포구')")).show();
					}else if(apoint == "서울시 용산구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('용산구')")).show();
					}else if(apoint == "서울시 은평구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('은평구')")).show();
					}else if(apoint == "서울시 종로구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('종로구')")).show();
					}else if(apoint == "서울시 중구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('중구')")).show();
					}else if(apoint == "서울시 중랑구"){	
						filterDiv.hide();					
						filterDiv.has($(".arrivespan").filter(":contains('중랑구')")).show();
					}
				}else if(!(spoint == "출발지를 선택하세요.") && !(apoint == "도착지를 선택하세요.")){		
					if(spoint == "전체보기" || apoint == "전체보기"){
						filterDiv.show();
						
					}else if(spoint == "서울시 강남구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('강남구')")).show();							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('강동구')")).show();
					
					}else if(spoint == "서울시 강남구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 강남구" && apoint == "서울시 중랑구"){
							filterDiv.hide();
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();
					}else if(spoint == "서울시 강동구" && apoint == "서울시 강남구"){
						filterDiv.hide();							
						filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 강동구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('강동구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 강동구" && spoint == "서울시 마포구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 강동구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강동구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 강북구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 강북구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강북구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 강서구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 강서구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('강서구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
				
					}else if(spoint == "서울시 관악구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('강남구')")).show();	
					
					}else if(spoint == "서울시 관악구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 관악구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('관악구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 광진구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 광진구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('광진구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 구로구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 구로구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('구로구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 금천구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
						
					}else if(spoint == "서울시 금천구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
						
					}else if(spoint == "서울시 금천구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 금천구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('금천구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					
					}else if(spoint == "서울시 노원구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 노원구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
						
					}else if(spoint == "서울시 노원구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 노원구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('노원구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 도봉구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('도봉구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 동대문구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동대문구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 동작구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 동작구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('동작구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 마포구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 마포구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('마포구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
						
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 서대문구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서대문구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					
					}else if(spoint == "서울시 서초구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
			
					}else if(spoint == "서울시 서초구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 서초구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('서초구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					
					}else if(spoint == "서울시 성동구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 성동구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 성동구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
						
					}else if(spoint == "서울시 성북구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 성북구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성동구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 성북구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('성북구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
						
					}else if(spoint == "서울시 송파구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 송파구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 송파구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('송파구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
						
					}else if(spoint == "서울시 양천구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 양천구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 양천구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('양천구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
						
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 영등포구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('영등포구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
						
					}else if(spoint == "서울시 용산구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('강남구')")).show();	
					
					}else if(spoint == "서울시 용산구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 용산구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('용산구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
						
					}else if(spoint == "서울시 은평구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 은평구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 은평구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('은평구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
						
					}else if(spoint == "서울시 종로구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 종로구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 종로구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('종로구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
						
					}else if(spoint == "서울시 중구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('강남구')")).show();
					
					}else if(spoint == "서울시 중구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 중구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 중구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
						
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 강남구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('강남구')")).show();	
					
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 강동구"){
							filterDiv.hide();							
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('강동구')")).show();							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 강북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('강북구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 강서구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('강서구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 관악구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('관악구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 광진구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('광진구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 구로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('구로구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 금천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('금천구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 노원구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('노원구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 도봉구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('도봉구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 동대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('동대문구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 동작구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('동작구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 마포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('마포구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 서대문구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('서대문구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 서초구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('서초구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 성동구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('성동구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 성북구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('성북구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 송파구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('송파구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 양천구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('양천구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 영등포구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('영등포구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 용산구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('용산구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 은평구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('은평구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 종로구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('종로구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 중구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('중구')")).show();
							
					}else if(spoint == "서울시 중랑구" && apoint == "서울시 중랑구"){
							filterDiv.hide();					
							filterDiv.has($(".startspan").filter(":contains('중랑구')")).has($(".arrivespan").filter(":contains('중랑구')")).show();							
					}
				}
			});	
		});
		
		
	</script>
</body>
</html>