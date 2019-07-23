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
<link rel="stylesheet" type="text/css" href="../../../css/admin_MemberMng.css">
</head>
<body>
	<%@ include file="/views/common/admin_TopBar.jsp" %>

	<div class="container" style="margin-top: 70px;">
	<h2>회원 관리</h2>
	<br />

		<ul class="nav nav-tabs">
			<li><a href="admin_UserMng.jsp">사용자</a></li>
			<li><a href="admin_DriverMng.jsp">기사</a></li>
			<li class="active"><a data-toggle="tab" href="#menu2">신청한 기사 관리</a></li>
			<li><a href="admin_BlackListDriverMng.jsp">블랙리스트 관리</a></li>
			<li><a href="admin_DelareDriverMng.jsp">신고내역 관리</a></li>
		</ul>

		<div class="tab-content">
			<div id="user" class="tab-pane fade"></div>

			<div id="menu1" class="tab-pane fade"></div>

			<div id="menu2" class="tab-pane fade in active">
				<table id="tblBackground5" cellspacing="0">
					<tr>
						<td>
							<div id="divHeadScroll5">
								<table id="tblHead5" border="0">
									<colgroup>
										<col style="width: 150px;" />
										<col style="width: 40px;" />
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 200px;" />
										<col style="width: 200px;" />
										<col style="width: 250px;" />
										<col style="width: 200px;" />
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 200px;" />
										<col style="width: 200px;" />
										<col style="width: 200px;" />
										<col style="width: 200px;" />
										<col style="width: 60px;" />
										<col style="width: 17px;" />
									</colgroup>
									<tr>
										<td class="title">상태</td>
										<td class="title">번호</td>
										<td class="title">가입날짜</td>
										<td class="title">아이디</td>
										<td class="title">이름</td>
										<td class="title">대표자이름</td>
										<td class="title">이메일</td>
										<td class="title">휴대폰번호</td>
										<td class="title">사업지 주소</td>
										<td class="title">사업자 등록번호</td>
										<td class="title">차종</td>
										<td class="title">차량번호</td>
										<td class="title">기사사진</td>
										<td class="title">차량 등록증</td>
										<td class="title">통장사본</td>
										<td class="title">사업자 등록증</td>
										<td class="title">이용건수</td>
										<td></td>
									</tr>
								</table>
							</div>
							<div id="divBodyScroll5">
								<table id="tblBody5" border="0">
									<colgroup>
										<col style="width: 150px;" class="right_border" />
										<col style="width: 40px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
										<col style="width: 200px;" class="right_border" />
										<col style="width: 200px;" class="right_border" />
										<col style="width: 250px;" class="right_border" />
										<col style="width: 200px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
										<col style="width: 200px;" class="right_border" />
										<col style="width: 200px;" class="right_border" />
										<col style="width: 200px;" class="right_border" />
										<col style="width: 200px;" class="right_border" />
										<col style="width: 60px;" class="right_border" />
									</colgroup>
									<tr>
										<td class="content right_border"><button onclick="yesD()">승인</button>&nbsp; <button onclick="noD()">거절</button></td>
										<td class="content right_border">1</td>
										<td class="content right_border">2019/07/16</td>
										<td class="content right_border">user01</td>
										<td class="content right_border">홍길동</td>
										<td class="content right_border">홍길동</td>
										<td class="content right_border">user01@user.com</td>
										<td class="content right_border">010-1234-5678</td>
										<td class="content right_border">서울시 강남구 역삼동 kh정보교육원</td>
										<td class="content right_border">123-456-7890</td>
										<td class="content right_border">포터</td>
										<td class="content right_border">05도0123</td>
										<td class="content right_border">views/images/aa.png</td>
										<td class="content right_border">views/images/aa.png</td>
										<td class="content right_border">views/images/aa.png</td>
										<td class="content right_border">views/images/aa.png</td>
										<td class="content right_border">2건</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</div>

			<div id="menu3" class="tab-pane fade"></div>

			<div id="menu4" class="tab-pane fade"></div>

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

		$(function() {
			// divBodyScroll의 스크롤이 동작할때에 함수를 불러옵니다.
			$('#divBodyScroll5').scroll(function() {
				// divBodyScroll의 x좌표가 움직인 거리를 가져옵니다.
				var xPoint = $('#divBodyScroll5').scrollLeft();

				// 가져온 x좌표를 divHeadScroll에 적용시켜 같이 움직일수 있도록 합니다.
				$('#divHeadScroll5').scrollLeft(xPoint);
			});
		});

		//신청 기사관리 탭의 상태 결정 버튼
		function yesD(){
			var result = window.confirm("해당 기사님을 짐캐리 기사로 승인하시겠습니까?")
			if(result == true){
				//해당 기사를 기사 db에 추가 후 기사에게 메시지 보내기
			}else{
				//해당 작업 취소
			}
		};
		function noD(){
			var result = window.prompt("거절 사유를 해당 기사님에게 남겨주세요.")
			if(result == true){
				//해당 기사에게 거절 사유 메시지 보내기
			}else{
				//해당 작업 취소
			}
		};
		function removeBL(){
			var result = window.prompt("해당 기사님에게 블랙리스트 해제 사유를 남겨주세요.")
			if(result == true){
				//해당 기사에게 블랙리스트 해제 사유 메시지 보내기
				//DB 해당사유 컬럼에도 저장. 같은 기사가 서로 다른 사유로 오게 되면 따로 관리하여 계속 같은 기사 아이디로 새로 생긴다.
			}else{
				//해당 작업 취소
			}
		};

	</script>

</body>
</html>