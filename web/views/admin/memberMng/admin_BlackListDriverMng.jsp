<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8" import="java.util.*, com.kh.jimcarry.admin.member.model.vo.*"%>
<%
		ArrayList<BlackList> list = (ArrayList<BlackList>) request.getAttribute("list");
		/* BlackList b = (BlackList) request.getAttribute("b"); */
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
			width: 947px;
			height: 30px;
			border-collapse: collapse;
		}

		#divBodyScroll3 {
			width: 100%;
			height: 500px;
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
			<li><a href="/semi/approve.d">신청한 기사 관리</a></li>
			<li class="active"><a href="/semi/blackList.d">블랙리스트 관리</a></li>
			<li><a href="/semi/dclare.d">신고내역 관리</a></li>
		</ul>

		<div class="tab-content">
			<div id="user" class="tab-pane fade"></div>

			<div id="menu1" class="tab-pane fade"></div>

			<div id="menu2" class="tab-pane fade"></div>

			<div id="menu3" class="tab-pane fade in active">
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
										<col style="width: 300px;" />
										<col style="width: 100px;" />
										<col style="width: 300px;" />
										<col style="width: 100px;" />
										<col style="width: 100px;" />
										<col style="width: 10px;" />
									</colgroup>
									<tr>
										<td class="title">상태</td>
										<td class="title">블랙리스트번호</td>
										<td class="title">기사번호</td>
										<td class="title">평점</td>
										<td class="title">정지사유</td>
										<td class="title">정지일</td>
										<td class="title">해제사유</td>
										<td class="title">해제일</td>
										<td class="title">신고번호</td>
										<td></td>
									</tr>
								</table>
							</div>
							<div id="divBodyScroll3">
								<form id="blForm">
									<table id="tblBody3" border="0">
										<colgroup>
											<col style="width: 100px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 300px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 300px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
											<col style="width: 100px;" class="right_border" />
										</colgroup>
										<% for(BlackList b : list){index++;%>
										<tr>
											<td class="content right_border">
												<button type="button" id="activation" name="resultD" value="0" onclick="removeBL('<%=index %>');">해제</button>
												<input type="hidden" id="prompt" name="prompt">
												<input type="hidden" id="resultD" name="resultD">
												<input type="hidden" id="driverNo<%=index%>" value="<%=b.getDriverNo()%>">
												<input type="hidden" id="driverNoResult" name="driverNo">
											</td>
											<td class="content right_border"><%= b.getBlackNo()%></td>
											<td class="content right_border"><%= b.getDriverNo() %></td>
											<td class="content right_border"><%= b.getGradeAvg()%></td>
											<td class="content right_border"><%= b.getStopReason()%></td>
											<td class="content right_border"><%= b.getStopDate()%></td>
											<td class="content right_border"><%= b.getActivationReason()%></td>
											<td class="content right_border"><%= b.getActivationDate()%></td>
											<td class="content right_border"><%= b.getDeclNo()%></td>
										</tr>
										<% } %>
									</table>
								</form>
							</div>
						</td>
					</tr>
				</table>
			</div>

			<div id="menu4" class="tab-pane fade"></div>

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


		function removeBL(num) {
			var result = window.prompt("해당 기사님에게 블랙리스트 해제 사유를 남겨주세요.")
			var prompt = document.getElementById("prompt");
			var resultD = document.getElementById("activation").value;
			$("#prompt").attr('value', result);
			$("#resultD").attr('value', resultD);
			// console.log("resultD" + resultD);
			// console.log("result : " + result);

			var driverNo = $("#driverNo" + num).val();
			$("#driverNoResult").attr('value', driverNo);
			// alert(driverNo);
			if (result != null) {
				//해당 기사에게 블랙리스트 해제 사유 메시지 보내기
				//DB 해당사유 컬럼에도 저장. 같은 기사가 서로 다른 사유로 오게 되면 따로 관리하여 계속 같은 기사 아이디로 새로 생긴다.
				$("#blForm").attr("action", "<%=request.getContextPath()%>/updateBlackList.d")
				$("#blForm").submit()

			} else {
				//해당 작업 취소
				location.href = "/semi/blackList.d";
			}
		};
	</script>

</body>

</html>