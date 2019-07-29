<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head> 
<style>
	#dateSelect {
		margin: 0 auto;
		text-align: center;
		margin-top: 10%;
	}
</style>
<body>
	<div id="dateSelect">
		<span>예약 날짜 : </span>	
	    <input type="text" id="datepicker" placeholder="날짜를 선택하세요" readonly>
	    <br>
	    <br>
	    <select id="selectAMPM">
	    	<option>오전</option>
	    	<option>오후</option>
	    </select>
	    <select id="selectTime">
	    	<option>시간</option>
	    	<option>1</option>
	    	<option>2</option>
	    	<option>3</option>
	    	<option>4</option>
	    	<option>5</option>
	    	<option>6</option>
	    	<option>7</option>
	    	<option>8</option>
	    	<option>9</option>
	    	<option>10</option>
	    	<option>11</option>
	    	<option>12</option>
	    </select>
	    <br>
	    <br>
	    <input type="button" onclick="selectDate()" value="확인">
    </div>
    
    <script>
        $("#datepicker").datepicker();
        
     	function selectDate(){
        	var showStartPlace = $("#showSelectDate", opener.document);
        	
        	var dateEx = $("#datepicker").val();
        	var dateExrr = dateEx.split("/");
        	var dateInfo1 = dateExrr[2] + "년 " + dateExrr[0] + "월 " + dateExrr[1] + "일";
        	
        	var ampmEx = $("#selectAMPM option:selected").val();        	
        	var timeEx = $("#selectTime option:selected").val();
        	var timeInfo1 = " " + ampmEx + " " + timeEx + "시";     
        	
        	showStartPlace.html(dateInfo1 + timeInfo1);
        	
        	var dateInfo = $("#dateInfo", opener.document);
        	var timeInfo = $("#timeInfo", opener.document);
        	
        	var dateInfo2 = dateExrr[2] + "-" + dateExrr[0] + "-" + dateExrr[1] + " " + timeEx + ":00";        	
        	
        	dateInfo.val(dateInfo2);
        	timeInfo.val(timeEx);
        	
        	var now = new Date();
        	
        	var year = now.getFullYear();
        	var month = now.getMonth() + 1;
        	var day = now.getDate();        	 

        	var todayDate = new Date(year, month-1, day);
        	var selectDate = new Date(dateExrr[2], dateExrr[0]-1, dateExrr[1]);
        	var diff = selectDate - todayDate;
        	
        	var currDay = diff / (24 * 60 * 60 * 1000);
        	
			if(currDay == 0){
				alert("이용 당일은 예약 할 수 없습니다.");
			}else if(currDay <= 2){
				alert("예약 2일 전 ~ 이용 전 날 예약 취소시 50%의 수수료가 부과됩니다. 예약하시겠습니까?");
			}else if(currDay <= 7){
				alert("예약 7일 전 ~ 3일 전 예약 취소시 10%의 수수료가 부과됩니다. 예약하시겠습니까?");
			}
			
        	self.close();
        } 
    </script>
</body>
</html>
