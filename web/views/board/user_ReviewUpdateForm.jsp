<%@page import="com.kh.jimcarry.board.model.vo.Attachment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
        import="java.util.*,com.kh.jimcarry.board.model.vo.*"
        import="com.kh.jimcarry.member.model.vo.Member"%>
<!DOCTYPE html>
	<%
		Board b = (Board) request.getAttribute("b");
		ArrayList<Attachment> fileList = (ArrayList<Attachment>) request.getAttribute("fileList");
		System.out.println("views  : "  + b );

		Attachment photo1 = fileList.get(0);
		Attachment photo2 = fileList.get(1);
	%>
<html>
<head>
<style>
	.outer {
		width: 800px;
		height: 600px;
		border: 1px solid red;
		margin-left: auto;
		margin-right: auto;
		margin-top: auto;
	}
/* 	#imgArea td {
		width: 200px;
		height: 250px;
		background: 3px solid red;

	} */

	.detailImg{
		width: 320px;
		height: 190px;
		padding: 1px;
	}

#bContent{
	cursor: default;
}
.btn1{
	text-align: right;
	padding: 2px;

}

</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8"> 
<title>Insert title here</title>
</head>

<body>
	<%@include file="/views/common/user_TopBar.jsp" %>

	<div class="outer">
		<h2 align="center">게시판 수정 폼</h2>
		<div class="tableArea">
			<form id="updateForm" method="post" enctype="multipart/form-data">
			<table align="center" border="1">
				<tr>
					<td width="50px" height="40px" align="center">제목</td>
					<td colspan="5>">
						<input type="text" size="50" name="title" value="<%=b.getPostTitle()%>">
						<input type="hidden" name="pagebno" value="<%=b.getPostCode()%>"/>
					</td>
				</tr>

				<tr align="center">
					<td width="50px" height="40px">작성자</td>
					<td><label for=""><%=b.getWriter() %></label></td>
					<td>조회수</td>
					<td><label for=""><%=b.getbCount() %></label></td>
					<td>작성일</td>
					<td><label for=""><%=b.getPostDate() %></label></td>

				</tr>

				<tr>
					<td>이미지</td>
					<td colspan="3">
						<div id="imgArea">
							<img src="<%=request.getContextPath() %>/images_uploadFiles/<%=photo1.getChangeName() %>" id="photo1" class="detailImg" name="img1" />
						</div>
					</td>

					<td colspan="2">
						<div id="imgArea">
							<img src="<%=request.getContextPath() %>/images_uploadFiles/<%=photo2.getChangeName() %>" id="photo2" class="detailImg" name="img2" />
						</div>
					</td>

				</tr>
					<tr>
						<td align="center">내용</td>
						<td colspan="6"><textarea cols="69%" rows="6%"
								maxlength="2048" name="bcontent" id="bContent"><%=b.getPostContents() %></textarea>

						</td>

					</tr>
			</table>


			<div style="border: 1px solid white; width: 760px; text-align: right;">

			<button onclick="">취소</button>&nbsp;&nbsp;
			<button onclick="complete();">수정완료</button>&nbsp;

			</div>
		</form>
		<script>
			function complete(){
				$("#updateForm").attr("action","<%=request.getContextPath()%>/update.bo");
			}

		</script>

		</div>
	</div>



</body>
</html>