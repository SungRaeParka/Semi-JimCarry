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
		height: 500px;

		margin-left: auto;
		margin-right: auto;
		margin-top: auto;
	}

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

.imgrog{
	margin-left: auto;
	margin-right: auto;
	text-align: center;
	width:85px;
	margin-left: 100px;
}
button{
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
	padding:1px 8px;
	text-decoration:none;
	text-shadow:0px 1px 0px #ffffff;


}


.emdfhr{
	-moz-box-shadow: 0px 1px 0px 0px #f0f7fa;
	-webkit-box-shadow: 0px 1px 0px 0px #f0f7fa;
	box-shadow: 0px 1px 0px 0px #f0f7fa;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #00bfff), color-stop(1, #00bbff));
	background:-moz-linear-gradient(top, #00bfff 5%, #00bbff 100%);
	background:-webkit-linear-gradient(top, #00bfff 5%, #00bbff 100%);
	background:-o-linear-gradient(top, #00bfff 5%, #00bbff 100%);
	background:-ms-linear-gradient(top, #00bfff 5%, #00bbff 100%);
	background:linear-gradient(to bottom, #00bfff 5%, #00bbff 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#00bfff', endColorstr='#00bbff',GradientType=0);
	background-color:#00bfff;
	-moz-border-radius:6px;
	-webkit-border-radius:6px;
	border-radius:6px;
	border:1px solid #009dff;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;

	text-decoration:none;
	text-shadow:0px -1px 0px #5b6178;
	height: 54px;


}


</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<title>Insert title here</title>
</head>

<body>
	<%@include file="/views/common/driver_TopBar.jsp" %>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br><br><br><br><br><br><br><br><br><br>
		<div
			style="margin: 0 auto; width: 300px; height: 100px;">
			<img src="/semi/images/main_logo.png" class="imgrog"><h2 style="text-align: center;">짐캐리 사용후기 작성</h2>
		</div>
		<br>

	<%if(loginUser != null){ %>

	<input type="hidden" id="loginUser" value="<%=loginUser.getSeqNo()%>">
	<div class="outer">
		<div class="tableArea">
			<table align="center" border="1" class="table1">
				<tr>
					<td width="50px" height="40px" align="center" style="background:#abccff;">제목</td>
					<td colspan="5">
						<label for=""><%=b.getPostTitle() %></label>
					</td>
				</tr>

				<tr align="center">
					<td width="50px" height="40px" style="background:#abccff;">작성자</td>
					<td style="background:#e3f2fd;"><label for=""><%=b.getWriter() %></label></td>
					<td style="background:#abccff;">조회수</td>
					<td style="background:#e3f2fd;"><label for=""><%=b.getbCount() %></label></td>
					<td style="background:#abccff;" >작성일</td>
					<td style="background:#e3f2fd;"><label for=""><%=b.getPostDate() %></label></td>

				</tr>

				<tr>
					<td style="background:#abccff;">이미지</td>
					<td colspan="3">
						<div id="imgArea">
							<img src="<%=request.getContextPath() %>/images_uploadFiles/<%=photo1.getChangeName() %>" id="photo1" class="detailImg" />
						</div>
					</td>

					<td colspan="2" >
						<div id="imgArea">
							<img src="<%=request.getContextPath() %>/images_uploadFiles/<%=photo2.getChangeName() %>" id="photo2" class="detailImg" />
						</div>
					</td>

				</tr>
					<tr>
						<td align="center" style="background:#abccff;">내용</td>
						<td colspan="6"><textarea cols="69%" rows="6%"
								maxlength="2048" name="bcontent" readonly="readonly" id="bContent"><%=b.getPostContents() %></textarea>

						</td>

					</tr>
			</table>




		</div>
	</div>

	<div class="replyArea">
		<div class="replyWriteArea">
			<table align="center" border="1">
				<tr>
					<td>댓글 작성</td>
					<td><textarea rows="3" cols="80" id="replyContent"></textarea></td>
					<td><button id="addReply">댓글 등록</button></td>
				</tr>
			</table>
		</div>
		<div>
			<table id="replySelectTable" border="1" align="center">
				<tbody></tbody>
			</table>
		</div>
	</div>
	<script>
	$(function(){
		$(document).ready(function(){
			var bcode = "<%=b.getPostCode()%>";

			$.ajax({
				url:"/semi/selectReply.bo",
				data:{bcode:bcode},
				type:"get",
				success:function(data){
					var $replySelectTable = $("#replySelectTable tbody");
					$replySelectTable.html("");

				for(var key in data) {
					var $tr = $("<tr>");
					var $writeTd = $("<td>").text(data[key].writer).css("width","100px");
					var $contentTd = $("<td>").text(data[key].commentContents).css("width","400px");
					var $dateTd = $("<td>").text(data[key].commentDate).css("width","200px");
					var $btn1Td =  $("<td><button id='addUsers' class='btn2' onclick='addUsers();'>삭제</button></td>");
					var $btn2Td =  $("<td><button id='addUsers' class='btn2' onclick='addUsers();'>수정</button></td>");



					//console.log($writeTd)

					$tr.append($writeTd);
					$tr.append($contentTd);
					$tr.append($dateTd);
					$tr.append($btn1Td);
					$tr.append($btn2Td);

					$replySelectTable.append($tr);

					}
				},
				error:function(){
					console.log("실패!!!");
				}
			});
		});

		$("#addReply").click(function(){
			var writer ="<%=loginUser.getSeqNo()%>";
			var bcode = "<%=b.getPostCode()%>";
			var content = $("#replyContent").val();
			var reply = document.getElementById("replyContent");
			$.ajax({
				url:"/semi/insertReply.bo",
				data:{writer:writer, bcode:bcode, content:content},
				type:"post",
				success:function(data){
					//console.log(data);

					var $replySelectTable = $("#replySelectTable tbody");
					$replySelectTable.html("");

				for(var key in data) {
					var $tr = $("<tr>");
					var $writeTd = $("<td>").text(data[key].writer).css("width","100px");
					var $contentTd = $("<td>").text(data[key].commentContents).css("width","400px");
					var $dateTd = $("<td>").text(data[key].commentDate).css("width","200px");
					var $btn1Td =  $("<td><button id='addUsers' class='btn2' onclick='addUsers();'>삭제</button></td>");
					var $btn2Td =  $("<td><button id='addUsers' class='btn2' onclick='addUsers();'>수정</button></td>");



					//console.log($writeTd)

					$tr.append($writeTd);
					$tr.append($contentTd);
					$tr.append($dateTd);
					$tr.append($btn1Td);
					$tr.append($btn2Td);

					$replySelectTable.append($tr);

				}
				reply.value = "";
				},
				error:function(){
					console.log("실패!!!");
				}
			});
		});
	});


	</script>


	<% } else {
		request.setAttribute("msg", "로그인을 하셔야 볼 수 있습니다.");
		request.getRequestDispatcher("../common/Review_errorPage.jsp").forward(request, response);
	}
	%>


</body>
</html>