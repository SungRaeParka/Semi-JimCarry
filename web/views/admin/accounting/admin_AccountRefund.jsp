<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.jimcarry.admin.accounting.model.vo.*, java.text.DecimalFormat"%>
<%
ArrayList<AccountingRefund> list = (ArrayList<AccountingRefund>) request.getAttribute("list");
String refundMember = list.get(0).getRefundMember();
DecimalFormat df = new DecimalFormat("###,###,###,###");
int index = 0;
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
	<title>Insert title here</title>
	<style>
		select {
			float: right;
			margin-top: -30px;
		}

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
		.button {
		background-color: #e7e7e7; color: black;
		border-radius: 8px;
		}

</style>

</head>

<body>
	<%@ include file="/views/common/admin_TopBar.jsp"%>

	<div class="container" style="margin-top: 70px;">
		<h2>정산관리</h2>
		<br />

		<ul class="nav nav-tabs">
			<li><a href="/semi/accounting.pr">기간</a></li>
			<li><a href="/semi/accounting.mm">맴버</a></li>
			<li class="active"><a href="/semi/accounting.rf">환불관리</a></li>
		</ul>

		<div class="tab-content">
			<div id="home" class="tab-pane fade"></div>
			<div id="menu1" class="tab-pane fade"></div>
			<div id="menu2" class="tab-pane fade in active">
				<br>
				<form id="refundForm">
					<select id="refund" name="refundSelect">
						<option id="allRefund" value="전체">전체</option>
						<option id="Refunding" value="환불대기">환불대기</option>
						<option id="yesRefund" value="완료">완료</option>
						<option id="noRefund" value="반려">반려</option>
					</select> <br> <br>
					<table id="tblBackground" cellspacing="0">
						<tr>
							<td>
								<div id="divHeadScroll">
									<table id="tblHead" border="0">
										<colgroup>
											<col style="width: 150px;" />
											<col style="width: 100px;" />
											<col style="width: 100px;" />
											<col style="width: 100px;" />
											<col style="width: 100px;" />
											<col style="width: 100px;" />
											<col style="width: 100px;" />
											<col style="width: 100px;" />
											<col style="width: 300px;" />
											<col style="width: 300px;" />
											<col style="width: 17px;" />
										</colgroup>
										<tr>
											<td class="title">상태</td>
											<td class="title">환불상태</td>
											<td class="title">결제이력번호</td>
											<td class="title">예약(이용)일자</td>
											<td class="title">회원명</td>
											<td class="title">환불신청날짜</td>
											<td class="title">결제금액</td>
											<td class="title">환불수수료</td>
											<td class="title">환불사유</td>
											<td class="title">반려사유</td>
											<td></td>
										</tr>
									</table>
								</div>
								<div id="divBodyScroll">
									<!-- <form id="yesnoForm" action="<%= request.getContextPath()%>/updateApprove.d"> -->
									<table id="tblBody" border="0">
										<colgroup>
											<col style="width: 150px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 300px;" class="right_border" />
											<col style="width: 300px;" class="right_border" />
										</colgroup>
										<% for(AccountingRefund ar : list){index++; %>
										<tr>

											<td class="content right_border">
											<%if(ar.getRefundCondition().equals("대기")) {%>
												<button type="button" id="yesRefundBtn" class="button" name="refundBtn" value="승인" onclick="yes('<%=index %>');">승인</button>&nbsp;
												<button type="button"id="noRefundBtn" class="button" name="refundBtn" value="거절" onclick="no('<%=index %>');">거절</button>
												<input type="hidden" id="refundBtnVal" name="refundBtnVal">

												<input type="hidden" id="payNo<%=index%>" value="<%=ar.getPayNo() %>">
												<input type="hidden" id="payNoVal" name="payNoVal">

												<input type="hidden" id="promptVal" name="promptVal">
												<%}else{ %>
												-
												<%} %>
											</td>
											<td class="content right_border">
													<%=ar.getRefundCondition() %>
											</td>
											<td class="content right_border">
												<%=ar.getPayNo() %>
											</td>
											<td class="content right_border">
												<%=ar.getReservationDate() %>
											</td>
											<td class="content right_border">
												<%=ar.getMemberName() %>
											</td>
											<td class="content right_border">
												<%=ar.getRefundReqDate() %>
											</td>
											<td class="content right_border">
												<%=df.format(ar.getPayAmount()) %>
											</td>
											<td class="content right_border">
												<%=df.format(ar.getRefundFees()) %>
											</td>
											<td class="content right_border">
												<%=ar.getRefundReason() %>
											</td>

											<td class="content right_border">
												<%=ar.getCompanionReason() %>
											</td>
										</tr>
										<% } %>
									</table>
								</div>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<script>
		$(function () {
			var refundMember = "<%= refundMember %>";
			console.log("refundMember : " + refundMember);
			if (refundMember == null || refundMember == "전체") {
				$('#allRefund').attr("selected", "selected");
			} else if (refundMember == "환불대기") {
				$('#Refunding').attr("selected", "selected");
			} else if (refundMember == "완료") {
				$('#yesRefund').attr("selected", "selected");
			} else if (refundMember == "반려") {
				$('#noRefund').attr("selected", "selected");
			}
		});

		$('#refund').change(function () {
			var state = $('#refund option:selected').val();
			if (state == '전체') {
				$("#refundForm").attr("action", "<%=request.getContextPath()%>/accounting.rf");
				$("#refundForm").submit();
			} else if (state == '환불대기') {
				$("#refundForm").attr("action", "<%=request.getContextPath()%>/accounting.rf");
				$("#refundForm").submit();
			} else if (state == '완료') {
				$("#refundForm").attr("action", "<%=request.getContextPath()%>/accounting.rf");
				$("#refundForm").submit();
			} else if (state == '반려') {
				$("#refundForm").attr("action", "<%=request.getContextPath()%>/accounting.rf");
				$("#refundForm").submit();
			}




		});
			//환불신청 상태 결정 버튼
			function yes(num) {
			var refundMember = "<%= refundMember %>";
			var confirm = window.confirm("해당 환불건을 승인하시겠습니까?");
			var refundBtnVal = $("#yesRefundBtn").val();
			$("#refundBtnVal").attr('value', refundBtnVal);

			var payNoVal = $("#payNo" + num).val();
			$("#payNoVal").attr('value', payNoVal);
			// alert(driverNo);

			if (confirm == true) {
				//해당 기사를 기사 db에 추가 후 기사에게 메시지 보내기
				// alert("승인을 승인한다")
				$("#refundForm").attr("action", "<%= request.getContextPath()%>/accountingUpdate.rf")
				$("#refundForm").submit()
			} else {
				//해당 작업 취소
				// alert("해당작업 취소")
				location.href = "/semi/accounting.rf?refundSelect="+refundMember;
			}
		};

		function no(num) {
			var refundMember = "<%= refundMember %>";
			var promptVal = window.prompt("환불 반려 사유를 해당 고객님에게 남겨주세요.");
			$("#promptVal").attr('value', promptVal);
			// var promptVal = document.getElementById("promptVal");
			var refundBtnVal = document.getElementById("noRefundBtn").value;
			$("#refundBtnVal").attr('value', refundBtnVal);

			console.log("promptVal" + promptVal);
			console.log("refundBtnVal : " + refundBtnVal);

			var payNoVal = $("#payNo" + num).val();
			$("#payNoVal").attr('value', payNoVal);

			// alert(driverNo);
			if (promptVal != null) {
				//해당 기사에게 거절 사유 메시지 보내기
				// alert("notNull");
				$("#refundForm").attr("action", "<%= request.getContextPath()%>/accountingUpdate.rf")
				$("#refundForm").submit()
			} else {
				// alert("null");
				//해당 작업 취소
				location.href = "/semi/accounting.rf?refundSelect="+refundMember;
			}
		};
	</script>

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