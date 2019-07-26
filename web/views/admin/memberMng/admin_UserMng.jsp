<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jimcarry.member.model.vo.*"%>
 <%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="../../../css/admin_MemberMng.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="/web/css/admin_MemberMng.css"> -->
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
    width:947px;
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
    width: 940px;
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

/* 신청 기사 회원 관리 테이블 */
#tblBackground5 {
    width: 940px;
    table-layout: fixed;
}
#divHeadScroll5 {
    width: 100%;
    overflow-x: hidden;
    overflow-y: hidden;
    border-top: 2px solid #d0d0d0;
}
#tblHead5 {
    table-layout: fixed;
    background-color: #efefef;
    padding-top: 4px;
    width:1117px;
    height: 30px;
    border-collapse: collapse;
}
#divBodyScroll5 {
    width: 100%;
    height: 350px;
    overflow-x: scroll;
    overflow-y: scroll;
    border-top: 1px solid #d0d0d0;
}
#tblBody5 {
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
    width:947px;
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
    width: 940px;
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
    width:947px;
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
    width: 940px;
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
	<%-- <% if(loginUser != null && loginUser.getUserId().equals("admin")){ %> --%>

	<div class="container" style="margin-top: 70px;">
	<h2>회원 관리</h2>
	<br />

		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#user">사용자</a></li>
			<li><a href="/semi/selectAll.d">기사</a></li>
			<li><a href="/semi/approve.d">신청한 기사 관리</a></li>
			<li><a href="/semi/blackList.d">블랙리스트 관리</a></li>
			<li><a href="/semi/dclare.d">신고내역 관리</a></li>
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
										<td class="title">회원번호</td>
										<td class="title">가입일</td>
										<td class="title">아이디</td>
										<td class="title">이름</td>
										<td class="title">연락처</td>
										<td class="title">탈퇴 여부</td>
										<td class="title">이용건수(현재UD구분 추후 변경)</td>
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
									<% for(Member m : list){ %>
									<tr>
										<td class="content right_border"><%=m.getSeqNo()%></td>
										<td class="content right_border"><%=m.getEnrollDate()%></td>
										<td class="content right_border"><%=m.getUserId() %></td>
										<td class="content right_border"><%=m.getUserName() %></td>
										<td class="content right_border"><%=m.getPhone() %></td>
										<td class="content right_border"><%=m.getStatusCheck() %></td>
										<td class="content right_border"><%=m.getUdCheck() %></td>
									</tr>
									<% } %>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</div>

			<div id="menu1" class="tab-pane fade"></div>

			<div id="menu2" class="tab-pane fade"></div>

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
 	<%-- <%}else{
		request.setAttribute("msg", "잘못된 경로로 접근하셨습니다.");
		request.getRequestDispatcher("/semi/views/common/errorPage.jsp").forward(request, response);
	}%> --%>

</body>
</html>