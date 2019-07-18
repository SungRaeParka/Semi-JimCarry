<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	#div1{
		margin:0 auto;
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

		 .wo{
            border: 1px solid skyblue;
            background-color: rgba(0,0,0,0);
            color: skyblue;
            padding: 5px;
        }
        .wo:hover{
            color:white;
            background-color: skyblue;
        }





</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/views/common/user_TopBar.jsp"%>

	<br><br><br><br>

		<h2>짐캐리 사용후기</h2>

		<br><br>

	<div id="div1">
		<div class="row">
		<form action="" method="">
			<table class="table talbe-stripeb"
				style="bodber: 1px solid #dddddd">


				<tbody>

					<tr>
						<td><label for="">글제목 : </label><input type="text"
							class="form-cont" placeholder="글제목" name="title" maxlength="40">
					</tr>

					<tr>
						<td><label for="">작성자 : </label><input type="text"
							class="form-cont" name="title" maxlength="40"></td>
					</tr>

					<tr>
						<td><input type="file" name="pho"></td>

					</tr>

					<tr>
						<td><textarea type="text" class="form-control" placeholder="글 내용" id="control" maxlength="2048" style="height: 450px; width: 500px"></textarea></td>
					</tr>



				</tbody>
			</table>
						<center>
						<input type="submit" class="wo" value="취소" />&nbsp;&nbsp;&nbsp;
						<input type="submit" class="wo"value="수정" />
						<input style="float: right;" type="submit" class="wo"value="삭제" />
						</center>

			</form>

		</div>

	</div>
	

</body>
</html>