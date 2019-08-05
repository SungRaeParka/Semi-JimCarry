<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<span style="font-size: 30px; font-weight: bold">매칭 취소</span>
	</div>
	
	<hr>
	
	<form>
		<div align="center">
			<span style="font-size: 20px; font-weight: bold">기사님과 협의 후 취소해주세요. </span><br>
			<span style="font-size: 15px;">아래 취소 사유를 선택해주세요. </span>
			
			<br>
			<br>
			<br>		
			
			<label>취소 사유 : </label>
			<select id="matchingCancel" name="matchingCancel">
				<option value="이사 정보 재 입력" selected>이사 정보 재 입력</option>
				<option value="단순 가격 확인용">단순 가격 확인용</option>
				<option value="원하는 가격의 견적이 없어서">원하는 가격의 견적이 없어서</option>
				<option value="기타">기타</option>
			</select>
		
			<br>
			<br>
			<br>						
				
		</div>
		
		<hr>
		<div align="center">
			<a href="/semi/views/request/jim_CarryList.jsp"><input type="button" value="매칭취소"></a>
			<input type="button" value="취소">
		</div>
	</form>
	
	
	
</body>
</html>