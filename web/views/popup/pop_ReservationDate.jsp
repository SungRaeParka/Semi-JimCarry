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
        	
        	showStartPlace.html(dateInfo + timeInfo);
        	
        	var dateInfo = $("#dateInfo", opener.document);
        	var timeInfo = $("#timeInfo", opener.document);
        	
        	var dateFormat = dateInfo1 + timeInfo1;
        	
        	dateInfo.val(dateFormat);
        	timeInfo.val(timeEx);
        	
        	self.close();
        } 
    </script>
</body>
</html>
