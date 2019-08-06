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
<style>

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
    height: 500px;
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
			<li><a href="/semi/selectAll.u">사용자</a></li>
			<li class="active"><a href="/semi/selectAll.d">기사</a></li>
			<li><a href="/semi/approve.d">신청한 기사 관리</a></li>
			<li><a href="/semi/blackList.d">블랙리스트 관리</a></li>
			<li><a href="/semi/dclare.d">신고내역 관리</a></li>
		</ul>

		<div class="tab-content">
			<div id="user" class="tab-pane fade"></div>

			<div id="menu1" class="tab-pane fade in active">
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
										<col style="width: 150px;" />
										<col style="width: 50px;" />
										<col style="width: 70px;" />
										<col style="width: 100px;" />
										<col style="width: 150px;" />
										<col style="width: 300px;" />
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 50px;" />
										<col style="width: 150px;" />
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 200px;" />
										<col style="width: 200px;" />
										<col style="width: 200px;" />
										<col style="width: 200px;" />
										<col style="width: 200px;" />
										<col style="width: 17px;" />
									</colgroup>
									<tr>
										<td class="title">회원번호</td>
										<td class="title">가입일</td>
										<td class="title">아이디</td>
										<td class="title">이름</td>
										<td class="title">연락처</td>
										<td class="title">탈퇴여부</td>
										<td class="title">이용건수</td>
										<td class="title">대표자</td>
										<td class="title">사업자등록번호</td>
										<td class="title">사업장주소</td>
										<td class="title">차종</td>
										<td class="title">차량번호</td>
										<td class="title">은행명</td>
										<td class="title">계좌번호</td>
										<td class="title">블랙리스트 여부</td>
										<td class="title">가입승인</td>
										<td class="title">거절사유</td>
										<td class="title">기사사진</td>
										<td class="title">차량 등록증</td>
										<td class="title">통장사본</td>
										<td class="title">사업자 등록증</td>
										<td></td>
									</tr>
								</table>
							</div>
							<div id="divBodyScroll2">
								<table id="tblBody2" border="0">
									<colgroup>
										<col style="width: 100px;" class="right_border"/>
										<col style="width: 100px;" class="right_border"/>
										<col style="width: 100px;" class="right_border"/>
										<col style="width: 100px;" class="right_border"/>
										<col style="width: 150px;" class="right_border"/>
										<col style="width: 70px;" class="right_border"/>
										<col style="width: 50px;" class="right_border"/>
										<col style="width: 100px;" class="right_border"/>
										<col style="width: 150px;" class="right_border"/>
										<col style="width: 300px;" class="right_border"/>
										<col style="width: 100px;" class="right_border"/>
										<col style="width: 100px;" class="right_border"/>
										<col style="width: 50px;" class="right_border"/>
										<col style="width: 150px;" class="right_border"/>
										<col style="width: 100px;" class="right_border"/>
										<col style="width: 100px;" class="right_border"/>
										<col style="width: 200px;" class="right_border"/>
										<col style="width: 200px;" class="right_border"/>
										<col style="width: 200px;" class="right_border"/>
										<col style="width: 200px;" class="right_border"/>
										<col style="width: 200px;" class="right_border"/>
									</colgroup>
									<% for(Member m : list){ %>
									<tr>
										<td class="content right_border"><%=m.getSeqNo()%></td>
										<td class="content right_border"><%=m.getEnrollDate()%></td>
										<td class="content right_border"><%=m.getUserId() %></td>
										<td class="content right_border"><%=m.getUserName() %></td>
										<td class="content right_border"><%=m.getPhone() %></td>
										<td class="content right_border"><%=m.getStatusCheck() %></td>
										<td class="content right_border"><%=m.getUsingCount() %></td>
										<td class="content right_border"><%=m.getAgent() %></td>
										<td class="content right_border"><%=m.getBusinessNo() %></td>
										<td class="content right_border"><%=m.getBusinessAddress() %></td>
										<td class="content right_border"><%=m.getCarType() %></td>
										<td class="content right_border"><%=m.getCarNo() %></td>
										<td class="content right_border"><%=m.getBankName() %></td>
										<td class="content right_border"><%=m.getAccountNo() %></td>
										<td class="content right_border"><%=m.getBlacklistCheck() %></td>
										<td class="content right_border"><%=m.getJoinCheck() %></td>
										<td class="content right_border"><%=m.getRefuseReason() %></td>

										<td class="content right_border">views/images/aa.png</td>
										<td class="content right_border">views/images/aa.png</td>
										<td class="content right_border">views/images/aa.png</td>
										<td class="content right_border">views/images/aa.png</td>
									</tr>
									<% } %>
								</table>
							</div>
						</td>
					</tr>
				</table>
			</div>

			<div id="menu2" class="tab-pane fade"></div>

			<div id="menu3" class="tab-pane fade"></div>

			<div id="menu4" class="tab-pane fade"></div>

		</div>
	</div>

	<script>
		$(function() {
			// divBodyScroll의 스크롤이 동작할때에 함수를 불러옵니다.
			$('#divBodyScroll2').scroll(function() {
				// divBodyScroll의 x좌표가 움직인 거리를 가져옵니다.
				var xPoint = $('#divBodyScroll2').scrollLeft();

				// 가져온 x좌표를 divHeadScroll에 적용시켜 같이 움직일수 있도록 합니다.
				$('#divHeadScroll2').scrollLeft(xPoint);
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