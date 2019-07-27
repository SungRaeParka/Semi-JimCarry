<%@page import="com.kh.jimcarry.board.model.vo.Attachment"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sun.xml.internal.bind.v2.runtime.unmarshaller.XsiNilLoader.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
        import="java.util.*,com.kh.jimcarry.board.model.vo.*"%>
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
		height: 650px;
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
		width: 300px;
		height: 190px;
		padding: 1px;
	}

#bContent{
	cursor: default;
}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/views/common/user_TopBar.jsp" %>
	<div class="outer">
		<h2 align="center">게시판 상세 보기</h2>
		<div class="tableArea">
			<table align="center" border="1">
				<tr>
					<td width="50px" height="40px" align="center">제목</td>
					<td colspan="5>">
						<label for=""><%=b.getPostTitle() %></label>
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
						<div id="imgArea" style="border: 1px solid red ; width: 300px; height: 200px;">
							<img src="<%=request.getContextPath() %>/images_uploadFiles/<%=photo1.getChangeName() %>" id="photo1" class="detailImg" />
						</div>
					</td>

					<td colspan="2">
						<div id="imgArea" style="border: 1px solid red ; width: 300px; height: 200px;" >
							<img src="<%=request.getContextPath() %>/images_uploadFiles/<%=photo2.getChangeName() %>" id="photo2" class="detailImg" />
						</div>
					</td>





				</tr>
					<tr>
						<td align="center">내용</td>
						<td colspan="6"><textarea cols="84%" rows="14%"
								maxlength="2048" name="bcontent" readonly="readonly" id="bContent"><%=b.getPostContents() %></textarea>

						</td>

					</tr>

			</table>
		</div>
	</div>


</body>
</html>