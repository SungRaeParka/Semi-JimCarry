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
        width:1117px;
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
        width:1117px;
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
        width:1117px;
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
        width:1117px;
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
</style>
</head>
<body>
	<%@ include file="/views/common/admin_TopBar.jsp" %>

	<div class="container" style="margin-top: 70px;">
	<h2>회원 관리</h2>
	<br />

		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#user">사용자</a></li>
			<li><a data-toggle="tab" href="#menu1">기사</a></li>
			<li><a data-toggle="tab" href="#menu2">블랙리스트 관리</a></li>
			<li><a data-toggle="tab" href="#menu3">신고내역 관리</a></li>
		</ul>

		<div class="tab-content">
			<div id="user" class="tab-pane fade in active">
				<table id="tblBackground" cellspacing="0">
					<tr>
						<td>
							<div id="divHeadScroll">
								<table id="tblHead" border="0">
									<colgroup>
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 10px;" />
									</colgroup>
									<tr>
										<td class="title">번호</td>
										<td class="title">가입날짜</td>
										<td class="title">아이디</td>
										<td class="title">이름</td>
										<td class="title">이메일</td>
										<td class="title">휴대폰번호</td>
										<td class="title">이용건수</td>
										<td></td>
									</tr>
								</table>
							</div>
							<div id="divBodyScroll">
								<table id="tblBody" border="0">
									<colgroup>
										<col style="width: 100px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
									</colgroup>
									<tr>
										<td class="content right_border">1</td>
										<td class="content right_border">2019/07/16</td>
										<td class="content right_border">user01</td>
										<td class="content right_border">홍길동</td>
										<td class="content right_border">user01@user.com</td>
										<td class="content right_border">010-1234-5678</td>
										<td class="content right_border">2건</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</div>

			<div id="menu1" class="tab-pane fade">
				<table id="tblBackground2" cellspacing="0">
					<tr>
						<td>
							<div id="divHeadScroll2">
								<table id="tblHead2" border="0">
									<colgroup>
										<col style="width: 100px;" />
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
							<div id="divBodyScroll2">
								<table id="tblBody2" border="0">
									<colgroup>
										<col style="width: 100px;" class="right_border" />
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
			<div id="menu2" class="tab-pane fade">
				<table id="tblBackground3" cellspacing="0">
					<tr>
						<td>
							<div id="divHeadScroll3">
								<table id="tblHead3" border="0">
									<colgroup>
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 10px;" />
									</colgroup>
									<tr>
										<td class="title">기사번호</td>
										<td class="title">기사명</td>
										<td class="title">정지일</td>
										<td class="title">정지사유</td>
										<td class="title">해제사유</td>
										<td class="title">해제일</td>
										<td></td>
									</tr>
								</table>
							</div>
							<div id="divBodyScroll3">
								<table id="tblBody3" border="0">
									<colgroup>
										<col style="width: 100px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
									</colgroup>
									<tr>
										<td class="content right_border">D1001</td>
										<td class="content right_border">무권석</td>
										<td class="content right_border">2019/07/16</td>
										<td class="content right_border">평점미달</td>
										<td class="content right_border">NULL</td>
										<td class="content right_border">NULL</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</div>
			<div id="menu3" class="tab-pane fade">
				<table id="tblBackground4" cellspacing="0">
					<tr>
						<td>
							<div id="divHeadScroll4">
								<table id="tblHead4" border="0">
									<colgroup>
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 10px;" />
									</colgroup>
									<tr>
										<td class="title">신고번호</td>
										<td class="title">신고자번호</td>
										<td class="title">기사번호</td>
										<td class="title">신고일</td>
										<td class="title">신고사유</td>
										<td></td>
									</tr>
								</table>
							</div>
							<div id="divBodyScroll4">
								<table id="tblBody4" border="0">
									<colgroup>
										<col style="width: 100px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
										<col style="width: 100px;" class="right_border" />
									</colgroup>
									<tr>
										<td class="content right_border">DC1001</td>
										<td class="content right_border">U1001</td>
										<td class="content right_border">D1001</td>
										<td class="content right_border">2019/07/16</td>
										<td class="content right_border">추가금 요구</td>
									</tr>
								</table>
							</div>
						</td>
					</tr>
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