<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jimcarry.member.model.vo.Member"%>

<!DOCTYPE html>
<html>
<head>

<style>
.outer {
	width: 800px;
	height: 650px;
	border: 1px solid red;
	color: black;
	margin-left: auto;
	margin-right: auto;
	margin-top: auto;
}

table {
	border: 5px solid #eeeeee;
	/* width: 100%; */
}

.insertform {
	width: 500px;
	height: 450px;
	margin: 0 auto;
}

.btnArea {
	color: white;
	margin: 0 auto;
	width: 200px;
}
</style>



<!-- <style>
#div1 {
	margin: 0 auto;
	height: 700px;
	width: 50%;
}

table {
	margin: 0 auto;
	width: 60%;
}

h2 {
	text-align: center;
}

td {
	border: 4px solid #eeeeee;
	background-color: #dddddd;
}

.wo {
	border: 1px solid skyblue;
	background-color: rgba(0, 0, 0, 0);
	color: skyblue;
	padding: 5px;
}

.wo:hover {
	color: white;
	background-color: skyblue;
}
</style> -->
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/views/common/user_TopBar.jsp"%>

	<br>
	<br>
	<br>
	<br>

	<h2 align="center">짐캐리 사용후기</h2>

	<br>
	<br>


	<div class="outer">
		<form action="<%=request.getContextPath()%>/insert.bo" method="post" encType="multipart/form-data">
			<div class="insertArea">
				<table align="center" border=1>
					<tr>
						<td width="100px" height="50px"align="center" >제목</td>
						<td colspan="4"><label>hhh</label></td>

					</tr>
					<tr align="center">
						<td height="50x">작성자</td>
						<td style="width: 150px"><label for="" >cdfx</label></td>
						<td>작성일자</td>
						<td><label for="">2096-12-42</label></td>
					</tr>

					<tr>
						<td style="color: red; height: 50px;" align="center">이미지

						</td>
						<td colspan="3" style="color:red;">
							<input type="file" multiple="multiple" name=pho  />
						</td>

					</tr>


					<tr>
						<td height="100px" style="color: red; height: 50px;" align="center">이미지

						</td>
						<td colspan="3" style="color:red;">
							<input type="file" multiple="multiple" name=pho  />
						</td>

					</tr>



					<tr>
						<th align="center" style="color: red">내용</th>
						<td colspan="4"><textarea name="" id="" cols="40%" rows="10%"
								maxlength="2048" placeholder="글 내용" name="bcontent"></textarea>

						</td>

					</tr>
				</table>
				<div class="btnArea">
					<button type="reset">취소하기</button>
					&nbsp; &nbsp;
					<button type="submit">작성하기</button>
				</div>

			</div>


		</form>

	</div>


</body>
</html>