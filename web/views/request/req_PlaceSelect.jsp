<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출발지 도착지 선택</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style>
  
  #imgs{
  	width: auto; height: auto;
    max-width: 50px;
    max-height: 50px;
  }
  #att{
  	padding-top:20px;
  	padding-left:170px;
  	color:gray;
  }
  
  .selectInfo{ 
  	cursor: pointer;
  	font-size: 20px;
  	display: block;
  	float: right;
  	padding-right: 200px;
  	padding-top: 15px;
  }
  
  .container{
  	padding-left:330px;
  }
  
 
  
</style>

</head>
<body>

	<%@ include file="/views/common/user_TopBar.jsp" %>


	<div id="main">
		<div style="padding-top: 65px; padding-left: 20px;">
			<span style="font-size: 45px; font-weight: bold">출발지, 도착지, 날짜를 선택하세요.</span><br>
			<span>상세정보입력을 클릭하시면 주소를 검색할 수 있습니다.</span>
		</div>
		
		<hr>
				
		<div align="center">
			<table>
				<tr>
					<td><label>물품 선택</label></td>
					<td><label> → </label></td>
					<td><label>물품 상세 정보 선택</label></td>						
					<td><label> → </label></td>
					<td><label style="font-size: 30px; font-weight: bold;">장소, 날짜 선택</label></td>
					</tr>	
			</table>
		</div>		
		
		<hr>
		
		<div style="padding-left: 50px; padding-top: 10px; padding-bottom: 50px;">
			<div style="float: left">		
				<img src="/semi/images/pointer.PNG" id="imgs">				
			</div>
			<div>
				<span style="font-size: 30px; font-weight: bold">출발지 정보</span>
				<span>출발지를 선택하세요.</span>	
			</div>
			<div style="padding-top: 10px; float: left;">
				<span>경기도 성남시</span>
			</div>
			<div>
				<span class="selectInfo" id="startPlace" onclick="selectStartPlace()">상세정보입력</span>
			</div>
		</div>
		
		<hr>

		<div style="padding-left: 50px; padding-top: 10px; padding-bottom: 50px;">
			<div style="float: left">		
				<img src="/semi/images/pointer.PNG" id="imgs">				
			</div>
			<div>
				<span style="font-size: 30px; font-weight: bold">도착지 정보</span>	
				<span>도착지를 선택하세요.</span>	
			</div>
			<div style="padding-top: 10px; float: left;">
				<span>경기도 성남시</span>
			</div>
			<div>
				<span class="selectInfo" id="arrivePlace" onclick="selectArrivePlace()">상세정보입력</span>
			</div>
		</div>
		
		<hr>

		<div style="padding-left: 50px; padding-top: 10px; padding-bottom: 50px;">
			<div style="float: left">		
				<img src="/semi/images/cal.PNG" id="imgs">				
			</div>
			<div>
				<span style="font-size: 30px; font-weight: bold">날짜,시간 선택</span>	
				<span>이용하실 날짜와 시간을 선택하세요.</span>	
			</div>
			<div style="padding-top: 10px; float: left;">
				<span>2018년 1월 1일</span>
			</div>
			<div>
				<span class="selectInfo" id="selectDate" onclick="selectDate()">상세정보입력</span>
			</div>
		</div>
		
		<hr>

		<div style="padding-left: 50px; padding-top: 10px; padding-bottom: 50px;">
			<div style="float: left">		
				<img src="/semi/images/imgatt.PNG" id="imgs">				
			</div>
			<div>
				<span style="font-size: 30px; font-weight: bold">사진 첨부</span>
				<span>상세한 짐 사진을 올려주세요.</span>	
			</div>
			<div style="padding-top: 10px; float: left;">
				<span>2018년 1월 1일</span>
			</div>
			<div>
				<span class="selectInfo" id="selectDate" onclick="selectDate()">상세정보입력</span>
			</div>
		</div>
		
		<hr>

		<div style="padding-left: 50px; padding-top: 10px; padding-bottom: 50px;">
			<div style="float: left">		
				<img src="/semi/images/imgatt.PNG" id="imgs">				
			</div>
			<div>
				<span style="font-size: 30px; font-weight: bold">견적 입찰 기간</span>
				<span>견적을 받을 일수를 선택하세요.</span>	
			</div>
			<div>
				<input type="radio" id="date1" name="date"> 
				<label for="date1">1일</label>&emsp;&emsp; 
				<input type="radio" id="date2" name="date"> 
				<label for="date2">2일</label> &emsp;&emsp; 
				<input type="radio" id="date3" name="date"> 
				<label for="date3">3일</label>
			</div>
		</div>
		
		<hr>
		
		<div align="center" style="margin-bottom: 10px">
			<a href="req_ProDetailSelect.jsp" style="text-decoration: none">
				<span style="font-size: 30px">뒤로가기</span>	
			</a>
			<a href="req_lastReq.jsp" style="text-decoration: none; padding-left: 40px;">
				<span style="font-size: 30px">다음 단계로</span>	
			</a>
		</div>				
	</div>
	
	<script>	 
		function selectStartPlace(){
			var url = "/semi/views/popup/pop_StartPlace.jsp";
			var winWidth = 400;
			var winHeight = 530;
			var popupW = (screen.availWidth - winWidth) / 2;
			var popupH = (screen.availHeight - winHeight) / 2;			
			var popOption = "status=no, width=" + winWidth + ", height=" + winHeight + ", top=" + popupH + ", left=" + popupW;			
			
			window.open(url,"",popOption);
		}
		
		function selectArrivePlace(){
			var url = "/semi/views/popup/pop_ArrivePlace.jsp";
			var winWidth = 400;
			var winHeight = 530;
			var popupW = (screen.availWidth - winWidth) / 2;
			var popupH = (screen.availHeight - winHeight) / 2;			
			var popOption = "status=no, width=" + winWidth + ", height=" + winHeight + ", top=" + popupH + ", left=" + popupW;			
			
			window.open(url,"",popOption);
		}
		
		function selectDate(){
			var url = "/semi/views/popup/pop_ReservationDate.jsp";
			var winWidth = 400;
			var winHeight = 200;
			var popupW = (screen.availWidth - winWidth) / 2;
			var popupH = (screen.availHeight - winHeight) / 2;			
			var popOption = "status=no, width=" + winWidth + ", height=" + winHeight + ", top=" + popupH + ", left=" + popupW;			
			
			window.open(url,"",popOption);
		}
	</script>	
		
		
</body>
</html>