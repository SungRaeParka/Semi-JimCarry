<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jimcarry.member.model.vo.*"%>
<%
	ArrayList<Member> list = (ArrayList<Member>) request.getAttribute("list");
	int index = 0;
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
			width: 947px;
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
			height: 500px;
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
			width: 1117px;
			height: 30px;
			border-collapse: collapse;
		}

		#divBodyScroll5 {
			width: 100%;
			height: 500px;
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
			<li><a href="/semi/selectAll.u">사용자</a></li>
			<li><a href="/semi/selectAll.d">기사</a></li>
			<li class="active"><a href="/semi/approve.d">신청한 기사 관리</a></li>
			<li><a href="/semi/blackList.d">블랙리스트 관리</a></li>
			<li><a href="/semi/dclare.d">신고내역 관리</a></li>
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
										<td class="title">상태</td>
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
							<div id="divBodyScroll5">
								<!-- <form id="yesnoForm" action="<%= request.getContextPath()%>/updateApprove.d"> -->
								<form id="yesnoForm">
									<table id="tblBody5" border="0">
										<colgroup>
											<col style="width: 150px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 150px;" class="right_border" />
											<col style="width: 70px;" class="right_border" />
											<col style="width: 50px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 150px;" class="right_border" />
											<col style="width: 300px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 50px;" class="right_border" />
											<col style="width: 150px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 200px;" class="right_border" />
											<col style="width: 200px;" class="right_border" />
											<col style="width: 200px;" class="right_border" />
											<col style="width: 200px;" class="right_border" />
											<col style="width: 200px;" class="right_border" />
										</colgroup>
										<% for(Member m : list){index++;%>
										<tr>

											<td class="content right_border">
												<button type="button" id="yesD" name="resultD" value="승인" onclick="yes('<%=index %>');">승인</button> &nbsp;
												<button type="button" id="noD" name="resultD" value="거절" onclick="no('<%=index %>');">거절</button>
												<input type="hidden" id="prompt" name="prompt">
												<input type="hidden" id="resultD" name="resultD">
												<input type="hidden" id="driverNo<%=index%>" value="<%=m.getSeqNo()%>">
												<input type="hidden" id="driverNoResult" name="driverNo">
											</td>
											<td class="content right_border">
												<%=m.getSeqNo()%>
											</td>
											<td class="content right_border">
												<%=m.getEnrollDate()%>
											</td>
											<td class="content right_border">
												<%=m.getUserId() %>
											</td>
											<td class="content right_border">
												<%=m.getUserName() %>
											</td>
											<td class="content right_border">
												<%=m.getPhone() %>
											</td>
											<td class="content right_border">
												<%=m.getStatusCheck() %>
											</td>
											<td class="content right_border">
												<%=m.getUdCheck() %>
											</td>
											<td class="content right_border">
												<%=m.getAgent() %>
											</td>
											<td class="content right_border">
												<%=m.getBusinessNo() %>
											</td>
											<td class="content right_border">
												<%=m.getBusinessAddress() %>
											</td>
											<td class="content right_border">
												<%=m.getCarType() %>
											</td>
											<td class="content right_border">
												<%=m.getCarNo() %>
											</td>
											<td class="content right_border">
												<%=m.getBankName() %>
											</td>
											<td class="content right_border">
												<%=m.getAccountNo() %>
											</td>
											<td class="content right_border">
												<%=m.getBlacklistCheck() %>
											</td>
											<td class="content right_border">
												<%=m.getJoinCheck() %>
											</td>
											<td class="content right_border">
												<%=m.getRefuseReason() %>
											</td>

											<td class="content right_border">views/images/aa.png</td>
											<td class="content right_border">views/images/aa.png</td>
											<td class="content right_border">views/images/aa.png</td>
											<td class="content right_border">views/images/aa.png</td>
										</tr>
										<% } %>
									</table>
								</form>
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
	<script>
		//신청 기사관리 탭의 상태 결정 버튼 3
		function yes(num) {
			var result = window.confirm("해당 기사님을 짐캐리 기사로 승인하시겠습니까?");
			var resultD = $("#yesD").val();
			$("#resultD").attr('value', resultD);

			var driverNo = $("#driverNo" + num).val();
			$("#driverNoResult").attr('value', driverNo);
			// alert(driverNo);

			if (result == true) {
				//해당 기사를 기사 db에 추가 후 기사에게 메시지 보내기
				// alert("승인을 승인한다")
				$("#yesnoForm").attr("action", "<%= request.getContextPath()%>/updateApprove.d")
				$("#yesnoForm").submit()
			} else {
				//해당 작업 취소
				// alert("해당작업 취소")
				location.href = "/semi/approve.d";
			}
		};

		function no(num) {
			var result = window.prompt("거절 사유를 해당 기사님에게 남겨주세요.")
			var prompt = document.getElementById("prompt");
			var resultD = document.getElementById("noD").value;
			$("#prompt").attr('value', result);
			$("#resultD").attr('value', resultD);
			console.log("resultD" + resultD);
			console.log("result : " + result);

			var driverNo = $("#driverNo" + num).val();
			$("#driverNoResult").attr('value', driverNo);
			// alert(driverNo);
			if (result != null) {
				//해당 기사에게 거절 사유 메시지 보내기
				// alert("notNull");
				$("#yesnoForm").attr("action", "<%= request.getContextPath()%>/updateApprove.d")
				$("#yesnoForm").submit()
			} else {
				// alert("null");
				//해당 작업 취소
				location.href = "/semi/approve.d";
			}
		};

	</script>

</body>

</html>