c<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jimcarry.member.model.vo.Member,com.kh.jimcarry.board.model.vo.*"
						 import="java.util.Date"
						 import="java.text.SimpleDateFormat" %>



	<%
		Member loginUser = (Member) session.getAttribute("loginUser");
		Board b = (Board) request.getAttribute("b");

		Date now = new Date();
		String date1 = String.format("%tF",now);

/*
		SimpleDateFormat postDate = new SimpleDateFormat("yyyy-MM-dd");
		Date date = postDate.parse(date1);
 */

	%>

<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Cute+Font&display=swap&subset=korean" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style>
.outer {
	width: 800px;
	height: 650px;

	color: black;
	margin-left: auto;
	margin-right: auto;
	margin-top: auto;
}


table {
	border: 4px solid #FFDEAB;

}

.insertform {
	width: 500px;
	height: 450px;
	margin: 0 auto;
}

.btnArea {
	color: white;
	margin: 0 auto;
	text-align: center;
}
.wr {
   background: #abccff;
}
.btn1{

	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffffff), color-stop(1, #f6f6f6));
	background:-moz-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-webkit-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-o-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-ms-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#f6f6f6',GradientType=0);
	background-color:#ffffff;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:6px 24px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;
}
.btn1:hover {
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6', endColorstr='#ffffff',GradientType=0);
	background-color:#f6f6f6;
}
.imgrog{
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	width:85px;
	margin-left: 100px;




}
</style>





<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/views/common/main_TopBar.jsp"%>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br><br><br><br><br><br><br><br>


		<div
			style="margin: 0 auto; width: 300px; height: 100px;">
			<img src="/semi/images/main_logo.png" class="imgrog"><h2 style="text-align: center;">짐캐리 사용후기 작성</h2>
		</div>
	<br><br>



	<div class="outer">
		<form action="<%=request.getContextPath()%>/insert.bo" method="post" enctype="multipart/form-data">
			<div class="insertArea">
				<table align="center" border=1>
					<tr>
						<td width="100px" height="50px"align="center" style="background: #abccff;" >제목</td>
						<td colspan="4"><input type="text" size=40 name="btitle" style=background:#eeeeee;></td>

					</tr>
					<tr align="center">
						<td height="50x" class="wr">작성자</td>
						<td style="width: 150px; background: #e3f2fd;" ><label for="" ><%=loginUser.getUserId() %></label></td>
						<td style="background: #abccff;">작성일자</td>
						<td style="background: #e3f2fd;"><label for="" ><%=date1%></label></td>
					</tr>

					<tr>
						<td style="background:#abccff; height: 50px;" align="center">이미지

						</td>
						<td colspan="3">
							<input type="file"  name=photo1 id="contentImgArea1"  />
						</td>

					</tr>


				 	<tr>
						<td height="100px" style="background:#abccff; height: 50px;" align="center">이미지

						</td>
						<td colspan="3">
							<input type="file"  name=photo2 id="contentImgArea2"  />
						</td>

					</tr>



					<tr>
						<th align="center" style="background: #abccff;">내용</th>
						<td colspan="4"><textarea cols="40%" rows="10%"
								maxlength="2048" placeholder="글 내용" name="bcontent"></textarea>

						</td>

					</tr>
				</table>
				<br>
				<div class="btnArea" >
					<button type="reset" class="btn1">취소하기</button>
					&nbsp; &nbsp; &nbsp;
					<button type="submit" class="btn1">작성하기</button>
				</div>

			</div>


		</form>

	</div>

	<script>
	function loadImg(value, num) {
		if(value.files && value.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				switch(num){
					case 1 : $("#contentImg1").attr("src", e.target.result); break;
					case 2 : $("#contentImg2").attr("src", e.target.result); break;
				}
			}

			reader.readAsDataURL(value.files[0]);
		}
	}
	</script>


</body>
</html>