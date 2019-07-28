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
	#selectDate {
		margin: 0 auto;
		text-align: center;
		margin-top: 10%;
	}
</style>
<body>
	<div id="selectDate">
		<span>예약 날짜 : </span>	
	    <input type="text" id="datepicker" placeholder="날짜를 선택하세요" readonly>
	    <br>
	    <select class="selectTime">
	    	<option>오전</option>
	    	<option>오후</option>
	    </select>
	    <select class="selectTime">
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
	    <select class="selectTime">
	    	<option>분</option>
	    	<option>00</option>
	    	<option>10</option>
	    	<option>20</option>
	    	<option>30</option>
	    	<option>40</option>
	    	<option>50</option>
	    </select>
    </div>
    
    <script>
        $("#datepicker").datepicker();
    </script>
</body>
</html>
