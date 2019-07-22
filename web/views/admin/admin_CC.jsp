<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset=UTF-8>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<title>Insert title here</title>
	<style>
    /* 테이블 스타일용 */
    .title {
			text-align: center;
			font-weight: bold;
    }
    .content {
			border-bottom: 1px solid #efefef;
			padding: 10px 10px 10px 10px;
			text-align: center;
			white-space: nowrap;
			text-overflow: ellipsis;
			overflow: hidden;
    }
		container {
			align: "center";
		}
		#a {
			list-style-type: none;
			font-size: 15px;
		}

		a.btn_02 {
			display: inline-block;
			padding: 7px 7px;
			border: 1px solid #3b3c3f;
			background: #4b545e;
			color: #fff;
			text-decoration: none;
			width: 100px;
			height: 50px;
			text-align: center;
			margin-right: 10px;
			margin-left: 10px;
			margin-top: 80px;
		}
		.outer {
			width: 800px;
			height: 500px;
			margin-left: auto;
			margin-right: auto;
			margin-top: 50px;
		}
		table {
			border: 1px solid black;
			text-align: center;
		}
		.tableArea {
			width: 650px;
			height: 350px;
			margin: 0 auto;
		}
		.searchArea {
			width: 650px;
			margin: 0 auto;
		}
		table th, table td{
			text-align: center;
			padding: 3px;
		}
	</style>
</head>

<body>
	<%@ include file="/views/common/admin_TopBar.jsp"%>

	<div class="container" style="margin-top: 70px;">
		<h2>고객센터 관리</h2>
		<br />

		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#user">공지사항</a></li>
			<li><a data-toggle="tab" href="#menu1">1:1 문의</a></li>
			<li><a data-toggle="tab" href="#menu2">Q&A</a></li>
		</ul>

		<div class="tab-content">
			<div id="user" class="tab-pane fade in active">
				<br /><br />
				<div class="tableArea">
					<table align="center" id="listArea" border="1">
						<tr>
							<th>글번호</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
						<%-- <% for(Notice n : list){ %> --%>
						<tr>
							<td>1</td>
							<td>hidddfasfdqa</td>
							<td>josh</td>
							<td>3</td>
							<td>2019</td>
							<%-- <td><%= n.getNno() %>
							</td>
							<td>
								<%= n.getnTitle() %>
							</td>
							<td>
								<%= n.getnWriter() %>
							</td>
							<td>
								<%= n.getnCount() %>
							</td>
							<td>
								<%= n.getnDate() %>
							</td> --%>
						</tr>
						<%-- <% } %> --%>
					</table>
					<div class="searchArea" align="center">
						<select id="searchCondition" name="searchCondition">
							<option value="writer">작성자</option>
							<option value="title">제목</option>
							<option value="content">내용</option>
						</select>
						<input type="search">
						<button type="submit">검색하기</button>
						<%--  <% if(loginUser != null && loginUser.getUserId().equals("admin")){ %> --%>
						<button onclick="location.href='admin_CCNoInsertForm.jsp'">작성하기</button>
						<%-- <% } %> --%>
					</div>
				</div>
			</div>


			<script>
				//글 번호로 해당글 세부보기 함수
				$("#listArea td").mouseenter(function () {
					$(this).parent().css({ "background": "darkgray", "cursor": "pointer" });
				}).mouseout(function () {
					$(this).parent().css({ "background": "white" });
				}).click(function () {
					var num = $(this).parent().children().eq(0).text();

					// console.log(num);

					location.href = "<%=request.getContextPath() %>/selectOne.no?num=" + num; //?가 쿼리문>
				});
			</script>


		<div id="menu1" class="tab-pane fade">
			<div id="check" style="float: right;">
				<input type="checkbox" name="chkbox1" value="checkbox" style="margin-right: 1px;"> <label for="">모두보기</label>&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="checkbox" name="chkbox1" value="checkbox" style="margin-right: 2px;"> <label for="">답변 대기 목록
					보기</label>&nbsp;&nbsp;
			</div>
			<br> <br> <br>
			<div style="margin-top: -62px;">

				<table class="table" style="border: 1px solid; height: 50px;">
					<thead>
						<tr>
							<th>문의유형</th>
							<th>제목</th>
							<th>문의날짜</th>
							<th>답변
						</tr>
					</thead>


					<tbody>
						<tr>
							<td>매칭관련</td>
							<td>매칭 어쩌고</td>
							<td>2091.07.01</td>
							<td><button onclick="">답변완료</button></td>
						</tr>
						<tr>
							<td>이사관련</td>
							<td>이사 어쩌고</td>
							<td>2019.06.01</td>
							<td><button onclick="">답변완료</button></td>
						</tr>
						<tr>
							<td>취소</td>
							<td>취고 어쩌고</td>
							<td>2019.04.28</td>
							<td><button onclick="">답변대기</button></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>


		<div id="menu2" class="tab-pane fade">
			<div class="panel-group" id="accordion">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Q이사를 취소 하고 싶어요.</a>
						</h4>
					</div>
					<div id="collapse1" class="panel-collapse collapse in">
						<div class="panel-body">
							<form action="">
								<span>안녕하세요</span>
								<button onclick="" style="float: right;">
									<a href="#"></a>수정
								</button>
							</form>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Q 이사 날짜를 변경하고 싶어요.</a>
						</h4>
					</div>
					<div id="collapse2" class="panel-collapse collapse">
						<div class="panel-body">
							<form action="">
								<span>Lorem ipsum dolor sit amet, consectetur
									adipisicing elit, sed do eiusmod tempor incididunt ut labore
									et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
									exercitation ullamco laboris nisi ut aliquip ex ea commodo
									consequat.</span>
								<button onclick="" style="float: right;">
									<a href="#"></a>수정
								</button>
							</form>
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						<h4 class="panel-title">
							<a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Q 짐이 추가 되었어요</a>
						</h4>
					</div>
					<div id="collapse3" class="panel-collapse collapse">
						<div class="panel-body">
							<form action="">
								<span>Lorem ipsum dolor sit amet, consectetur
									adipisicing elit, sed do eiusmod tempor incididunt ut labore
									et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
									exercitation ullamco laboris nisi ut aliquip ex ea commodo
									consequat.</span>
								<button onclick="" style="float: right;">
									<a href="#"></a>수정
								</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
	<script>
		$(function () {
			// divBodyScroll의 스크롤이 동작할때에 함수를 불러옵니다.
			$('#divBodyScroll').scroll(function () {
				// divBodyScroll의 x좌표가 움직인 거리를 가져옵니다.
				var xPoint = $('#divBodyScroll').scrollLeft();

				// 가져온 x좌표를 divHeadScroll에 적용시켜 같이 움직일수 있도록 합니다.
				$('#divHeadScroll').scrollLeft(xPoint);
			});
		});

		$(function () {
			// divBodyScroll의 스크롤이 동작할때에 함수를 불러옵니다.
			$('#divBodyScroll2').scroll(function () {
				// divBodyScroll의 x좌표가 움직인 거리를 가져옵니다.
				var xPoint = $('#divBodyScroll2').scrollLeft();

				// 가져온 x좌표를 divHeadScroll에 적용시켜 같이 움직일수 있도록 합니다.
				$('#divHeadScroll2').scrollLeft(xPoint);
			});
		});

		$(function () {
			// divBodyScroll의 스크롤이 동작할때에 함수를 불러옵니다.
			$('#divBodyScroll3').scroll(function () {
				// divBodyScroll의 x좌표가 움직인 거리를 가져옵니다.
				var xPoint = $('#divBodyScroll3').scrollLeft();

				// 가져온 x좌표를 divHeadScroll에 적용시켜 같이 움직일수 있도록 합니다.
				$('#divHeadScroll3').scrollLeft(xPoint);
			});
		});

		$(function () {
			// divBodyScroll의 스크롤이 동작할때에 함수를 불러옵니다.
			$('#divBodyScroll4').scroll(function () {
				// divBodyScroll의 x좌표가 움직인 거리를 가져옵니다.
				var xPoint = $('#divBodyScroll4').scrollLeft();

				// 가져온 x좌표를 divHeadScroll에 적용시켜 같이 움직일수 있도록 합니다.
				$('#divHeadScroll4').scrollLeft(xPoint);
			});
		});

		$(function () {
			// divBodyScroll의 스크롤이 동작할때에 함수를 불러옵니다.
			$('#divBodyScroll5').scroll(function () {
				// divBodyScroll의 x좌표가 움직인 거리를 가져옵니다.
				var xPoint = $('#divBodyScroll5').scrollLeft();

				// 가져온 x좌표를 divHeadScroll에 적용시켜 같이 움직일수 있도록 합니다.
				$('#divHeadScroll5').scrollLeft(xPoint);
			});
		});
	</script>
</body>

</html>