<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


<title>Insert title here</title>
<style>
/* 사용자 회원 관리 테이블 */
#tblBackground {
	/*
         *  화면에 보여야 할 Table의 가로크기를 잡아줍니다.
         */
	width: 940px;
	table-layout: fixed;
}

#divHeadScroll {
	/*
         *  안의 내용이 790보다 길게 적용이 되므로 overflow-x, overflow-y를 hidden을 걸어줘서 설정한 가로너비만큼만 화면에 보이도록 잡아줍니다.
         */
	width: 100%;
	overflow-x: hidden;
	overflow-y: hidden;
	border-top: 2px solid #d0d0d0;
}

#tblHead {
	/*
         *  Table의 필드명의 너비를 여기에서 지정합니다.
         *  필드명을 보여줄 테이블은 body보다 하나의 td를 더 가지며 마지막 td는 아무것도 입력하지 않고 크기만 잡아줍니다.
         *  이렇게 하는 이유는 데이터를 보여주는 테이블은 세로 스크롤의 가로두께만큼 더 이동하기 때문입니다.
         */
	table-layout: fixed;
	background-color: #efefef;
	padding-top: 4px;
	width: 1117px;
	height: 30px;
	border-collapse: collapse;
}

#divBodyScroll {
	/*
         *  overflow-x, overflow-y는 scroll로 지정하고,
         *  height는 테이블의 데이터가 나올 기본 크기를 잡아줍니다.
         *  세로길이를 잡아주지 않으면 overflow-y가 걸리지 않습니다.
         */
	width: 100%;
	height: 350px;
	overflow-x: scroll;
	overflow-y: scroll;
	border-top: 1px solid #d0d0d0;
}

#tblBody {
	/*
         * tblBody의 데이터는 필요한 열의 수만큼만 만드시고 헤더와 col의 width는 동일해야 합니다.
         */
	width: 1100px;
	table-layout: fixed;
	height: 30px;
	border-collapse: collapse;
}

/* 기사 회원 관리 테이블 */
#tblBackground2 {
	width: 940px;
	table-layout: fixed;
}

#divHeadScroll2 {
	width: 100%;
	overflow-x: hidden;
	overflow-y: hidden;
	border-top: 2px solid #d0d0d0;
}

#tblHead2 {
	table-layout: fixed;
	background-color: #efefef;
	padding-top: 4px;
	width: 1117px;
	height: 30px;
	border-collapse: collapse;
}

#divBodyScroll2 {
	width: 100%;
	height: 350px;
	overflow-x: scroll;
	overflow-y: scroll;
	border-top: 1px solid #d0d0d0;
}

#tblBody2 {
	width: 1100px;
	table-layout: fixed;
	height: 30px;
	border-collapse: collapse;
}

/* 기사 블랙리스트 관리 테이블 */
#tblBackground3 {
	width: 940px;
	table-layout: fixed;
}

#divHeadScroll3 {
	width: 100%;
	overflow-x: hidden;
	overflow-y: hidden;
	border-top: 2px solid #d0d0d0;
}

#tblHead3 {
	table-layout: fixed;
	background-color: #efefef;
	padding-top: 4px;
	width: 1117px;
	height: 30px;
	border-collapse: collapse;
}

#divBodyScroll3 {
	width: 100%;
	height: 350px;
	overflow-x: scroll;
	overflow-y: scroll;
	border-top: 1px solid #d0d0d0;
}

#tblBody3 {
	width: 1100px;
	table-layout: fixed;
	height: 30px;
	border-collapse: collapse;
}

/* 신고내역 관리 테이블 */
#tblBackground4 {
	width: 940px;
	table-layout: fixed;
}

#divHeadScroll4 {
	width: 100%;
	overflow-x: hidden;
	overflow-y: hidden;
	border-top: 2px solid #d0d0d0;
}

#tblHead4 {
	table-layout: fixed;
	background-color: #efefef;
	padding-top: 4px;
	width: 1117px;
	height: 30px;
	border-collapse: collapse;
}

#divBodyScroll4 {
	width: 100%;
	height: 350px;
	overflow-x: scroll;
	overflow-y: scroll;
	border-top: 1px solid #d0d0d0;
}

#tblBody4 {
	width: 1100px;
	table-layout: fixed;
	height: 30px;
	border-collapse: collapse;
}

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
</style>
</head>
<body>
	<%@ include file="/views/common/admin_TopBar.jsp"%>

	<div class="container" style="margin-top: 70px;">
		<h2>고객센터 관리</h2>
		<br />

		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#user">Q&A[견적/운송]</a></li>
			<li><a data-toggle="tab" href="#menu1">Q&A[결제/진행]</a></li>
			<li><a data-toggle="tab" href="#menu2">Q&A[변경/취소]</a></li>
			<li><a data-toggle="tab" href="#menu3">Q&A[기타문의]</a></li>
			<li><a data-toggle="tab" href="#menu4">1:1 문의</a></li>
		</ul>

		<div class="tab-content">
			<div id="user" class="tab-pane fade in active">
				<div class="panel-group" id="accordion">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse1">Q이사를 취소 하고 싶어요.</a>
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
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse2">Q 이사 날짜를 변경하고 싶어요.</a>
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
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse3">Q 짐이 추가 되었어요</a>
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

			<div id="menu1" class="tab-pane fade">
				<div class="panel-group" id="accordion">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse1">Q. 이사를 취소 하고 싶어요.</a>
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
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse2">Q 이사 날짜를 변경하고 싶어요.</a>
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
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse3">Q 짐이 추가 되었어요</a>
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
			<div id="menu2" class="tab-pane fade">
				<div class="panel-group" id="accordion">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse1">Q이사를 취소 하고 싶어요.</a>
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
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse2">Q 이사 날짜를 변경하고 싶어요.</a>
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
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse3">Q 짐이 추가 되었어요</a>
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
			<div id="menu3" class="tab-pane fade">
				<div class="panel-group" id="accordion">
					<div class="panel panel-default">
						<div class="panel-heading">
							<h4 class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse1">Q이사를 취소 하고 싶어요.</a>
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
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse2">Q 이사 날짜를 변경하고 싶어요.</a>
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
								<a data-toggle="collapse" data-parent="#accordion"
									href="#collapse3">Q 짐이 추가 되었어요</a>
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
			<div id="menu4" class="tab-pane fade">
				<div id="check" style="float: right;">
					<input type="checkbox" name="chkbox1" value="checkbox"
						style="margin-right: 1px;"> <label for="">모두보기</label>&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="checkbox" name="chkbox1" value="checkbox"
						style="margin-right: 2px;"> <label for="">답변 대기 목록
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
		</div>

		<script>
		$(function() {
			// divBodyScroll의 스크롤이 동작할때에 함수를 불러옵니다.
			$('#divBodyScroll').scroll(function() {
				// divBodyScroll의 x좌표가 움직인 거리를 가져옵니다.
				var xPoint = $('#divBodyScroll').scrollLeft();

				// 가져온 x좌표를 divHeadScroll에 적용시켜 같이 움직일수 있도록 합니다.
				$('#divHeadScroll').scrollLeft(xPoint);
			});
		});

		$(function() {
			// divBodyScroll의 스크롤이 동작할때에 함수를 불러옵니다.
			$('#divBodyScroll2').scroll(function() {
				// divBodyScroll의 x좌표가 움직인 거리를 가져옵니다.
				var xPoint = $('#divBodyScroll2').scrollLeft();

				// 가져온 x좌표를 divHeadScroll에 적용시켜 같이 움직일수 있도록 합니다.
				$('#divHeadScroll2').scrollLeft(xPoint);
			});
		});

		$(function() {
			// divBodyScroll의 스크롤이 동작할때에 함수를 불러옵니다.
			$('#divBodyScroll3').scroll(function() {
				// divBodyScroll의 x좌표가 움직인 거리를 가져옵니다.
				var xPoint = $('#divBodyScroll3').scrollLeft();

				// 가져온 x좌표를 divHeadScroll에 적용시켜 같이 움직일수 있도록 합니다.
				$('#divHeadScroll3').scrollLeft(xPoint);
			});
		});

		$(function() {
			// divBodyScroll의 스크롤이 동작할때에 함수를 불러옵니다.
			$('#divBodyScroll4').scroll(function() {
				// divBodyScroll의 x좌표가 움직인 거리를 가져옵니다.
				var xPoint = $('#divBodyScroll4').scrollLeft();

				// 가져온 x좌표를 divHeadScroll에 적용시켜 같이 움직일수 있도록 합니다.
				$('#divHeadScroll4').scrollLeft(xPoint);
			});
		});
	</script>
</body>
</html>