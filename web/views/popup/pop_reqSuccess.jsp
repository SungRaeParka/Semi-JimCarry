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
		<span style="font-size: 30px; font-weight: bold">이용완료</span>
	</div>
	
	<hr>
	
	<form>
		<div align="center">
			<span style="font-size: 20px; font-weight: bold">짐 캐리는 어떠셨나요? </span>
			
			<br>
			<br>
			<br>
			
			
			<label>기사 평점 : </label>
			<select id="driverGrade" name="driverGrade">
				<option value="★★★★★" selected>★★★★★</option>
				<option value="★★★★">★★★★</option>
				<option value="★★★">★★★</option>
				<option value="★★">★★</option>
				<option value="★">★</option>
			</select>
			
			<br>
			<br>
			<br>
			
			<textarea placeholder="이용하신 기사의 리뷰를 작성해주세요." style="width: 300px; height: 150px;"></textarea>
			
						
		</div>
		
		<hr>
		<div align="center">
			<a href="/semi/views/request/jim_CarryList.jsp"><input type="button" value="이용완료"></a>
			<input type="button" value="취소">
		</div>
	</form>
	
	
</body>
</html>