<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
   <title>SMS</title>
</head>

<body onload="loadJSON()">
    <form method="post" name="smsForm" action="smssend.jsp">
        <input type="hidden" name="action" value="go">      
        <textarea name="msg" cols="30" rows="10" style="width:455px;" placeholder="보낼 내용"></textarea>
        <br>
        <input type="text" name="rphone" value="" placeholder="받는 번호">
        <br>
        <input type="hidden" name="sphone1" value="010">
        <input type="hidden" name="sphone2" value="6693">
        <input type="hidden" name="sphone3" value="7764">
        <input type="submit" value="전송">
    </form>
</body>
</html>
            
