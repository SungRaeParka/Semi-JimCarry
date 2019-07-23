<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jimcarry.member.model.vo.Member"%>

<!DOCTYPE html>
<html>
<head>

<style>
.outer {
	width: 500px;
	height: 500px;
	border: 1px solid red;
	color: white;
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
}

table {
	border: 5px solid #eeeeee;
	width: 100%;
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
						<td align="center" width="100px" height="50px" style="color: red;">제목</td>
						<td rowspan="1"><input type="text" placeholder="제목" name="btitle" /></td>

					</tr>
					<tr>
						<td align="center" height="50px" style="color: red;">작성자</td>
						<td><input type="text" /></td>

					</tr>

					<tr>
						<th height="100px" style="color: red; height: 50px;">이미지 :

						</th>
						<td colspan="1" style="color:red;">
							<input type="file" multiple="multiple" name=pho  />
						</td>


					</tr>

					<tr>
						<th align="center" style="color: red">내용</th>
						<td colspan="4"><textarea name="" id="" cols="40%" rows="10%"
								maxlength="2048" placeholder="글 내용" name="content"></textarea>

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