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
  
  #input{
  padding-top:22px;
  padding-right:20px;
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
			<img src="../../images/pointer.PNG" style="float:left" id="imgs">
			<h3 style="float: left">출발지 정보</h3>
			<h5 id="input" align="right" style="padding-right: 150px;"><a href="#">상세정보입력</a></h5>
		</div>
		
		<hr>

		<div style="padding-left: 50px; padding-top: 10px; padding-bottom: 50px;">
			<img src="../../images/pointer.PNG" style="float:left" id="imgs">
			<h3 style="float: left">도착지 정보</h3>
			<h5 id="input" align="right" style="padding-right: 150px;"><a href="#">상세정보입력</a></h5>
		</div>
		
		<hr>

		<div style="padding-left: 50px; padding-top: 10px; padding-bottom: 50px;">
			<img src="../../images/cal.PNG" style="float: left" id="imgs">
			<h3 style="float: left">날짜 선택</h3>
			<h5 id="input" align="right" style="padding-right: 150px;"><a href="#">상세정보입력</a></h5>
		</div>
		
		<hr>

		<div style="padding-left: 50px; padding-top: 10px; padding-bottom: 50px;">
			<img src="../../images/imgatt.PNG" style="float: left" id="imgs">
			<h3 style="float: left">사진 첨부</h3>
			<p id="att">상세한 짐 사진을 올려주세요</p>
			<div id="input" align="right" style="padding-right: 150px;"><button>파일첨부</button></div>
		</div>
		
		<hr>

		<div style="padding-left: 50px; padding-top: 10px; padding-bottom: 50px;">
			<h3>견적 입찰 기간</h3>
			<input type="radio" id="date1" name="date"> 
			<label for="date1">1일</label>&emsp;&emsp; 
			<input type="radio" id="date2" name="date"> 
			<label for="date2">2일</label> &emsp;&emsp; 
			<input type="radio" id="date3" name="date"> 
			<label for="date3">3일</label>
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
		
		
		
</body>
</html>