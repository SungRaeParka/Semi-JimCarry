<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String userNo = request.getParameter("user");
	String reqNo = request.getParameter("req");
	String driverNo = request.getParameter("driver");
	
	System.out.println(userNo);
	System.out.println(reqNo);
	System.out.println(driverNo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
				<option value="5" selected>★★★★★</option>
				<option value="4">★★★★</option>
				<option value="3">★★★</option>
				<option value="2">★★</option>
				<option value="1">★</option>
			</select>
			
			<br>
			<br>
			<br>
			
			<textarea id="review" placeholder="이용하신 기사님의 리뷰를 작성해주세요." style="width: 300px; height: 150px;"></textarea>
			
						
		</div>
		
		<hr>
		<div align="center">
			<input type="button" class="done" value="이용완료">
			<input type="button" class="cancel" value="취소">
		</div>
	</form>
	
	<script>
	$(function(){
		$(".done").click(function(){
			alert("이용완료");
			var grade = $("#driverGrade option:selected").val();
			var review = $("#review").val();
			var userNo = '<%=userNo%>';
			var reqNo = '<%=reqNo%>';
			var driverNo = '<%=driverNo%>';
			
			console.log(grade);
			console.log(review);
			console.log(userNo);
			console.log(reqNo);
			console.log(driverNo);
			
			$.ajax({
				url:"/semi/reqCompleted.jc?userNo="+userNo+"&reqNo="+reqNo+"&driverNo="+driverNo+"&grade="+grade+"&review="+review,
				/* type:"get",
				data:{
					grade:"grade",
					review:"review",
					userNo:"userNo",
					reqNo:"reqNo",
					driverNo:"driverNo"
				}, */
				/* contentType: false,

				processData: false, */
				

				sucess:function(data){
					alert("접속완료");
				},
				error:function(data){
					alert("접속실패");
				}
			})
			
			
		})
	})
	
	
	
	$(function(){
		$(".cancel").click(function(){
			window.close();
		})
	})
	
	</script>
	
	
</body>
</html>