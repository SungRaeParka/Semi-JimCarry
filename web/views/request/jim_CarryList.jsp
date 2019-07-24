<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.jimcarry.request.model.vo.*" %>
	
<%
ArrayList<Request> list = (ArrayList<Request>) request.getAttribute("list");
PageInfo pi = (PageInfo) request.getAttribute("pi");
int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartpage();
int endPage = pi.getEndPage();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 짐캐리 리스트</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style>
#outer {
	width: 870px;
	margin: 0 auto;
}

.imgs {
	width: 150px;
	height: 150px;
}

#reqno {
	float: right;
}

.text {
	padding-left: 200px;
}

#title {
	padding-top: 3px;
}

#date {
	padding-top: 5px;
}

#count {
	padding-top: 3px;
}

#reqInfo, #reqpri, #reqprice {
	float: right;
}

#reqInfo {
	margin-top: -10px;
}

#reqpri {
	margin-top: -20px;
}

#reqprice {
	margin-top: -25px;
}

#time, #reqcencle, #done {
	margin-top: -15px;
}
</style>

</head>
<body>
	<%@ include file="/views/common/user_TopBar.jsp"%>

	<div id="outer">
		<br> <br> <br> <br>

		<h1>내 짐캐리 리스트</h1>

		<div id="filt" align="right">
			<select name="national">
				<option value="a">예약중</option>
				<option value="b">매칭전</option>
				<option value="c">완료전</option>
				<option value="d">완료후</option>
			</select>
		</div>

		<hr>

		<div>
			<img src="../../images/box.png" class="imgs" style="float: left">

			<div id="reqno">
				<p>견적번호 : A1001</p>
			</div>

			<div id="title" class="text">
				<h1>서울시 강남구 → 수원시 권선구</h1>
			</div>
			<div id="reqInfo">
				<h4>
					<a href="/semi/views/request/jim_CarryCheckReq.jsp">견적확인 →</a>
				</h4>
			</div>

			<div id="date" class="text">
				<h3>예약일 : 2019-07-13</h3>
			</div>
			<div id="reqpri">
				<h4>
					<a href="/semi/views/request/req_ReqList.jsp">입찰내역 확인 →</a>
				</h4>
			</div>

			<div id="count" class="text">
				<h3>받은 견적 수 : 5개</h3>
			</div>
			<div id="time" align="right">

				<h3>남은 시간 : time</h3>

			</div>

			<hr>
		</div>


		<div>
			<img src="../../images/box.png" class="imgs" style="float: left">

			<div id="reqno">
				<p>견적번호 : A1002</p>
			</div>

			<div id="title" class="text">
				<h1>서울시 강남구 → 용인시 처인구</h1>
			</div>


			<div id="date" class="text">
				<h3>예약일 : 2019-07-13</h3>
			</div>
			<div id="reqprice">
				<h4>이용요금 : 400000</h4>
			</div>

			<div id="count" class="text">
				<h3>기사명 : 박성래 &nbsp;&nbsp;평점 : 5.0</h3>
			</div>
			<div id="reqcencle" align="right">

				<h3>
					<a href="/semi/views/request/popup/pop_reqCancel.jsp">입찰 취소→</a>
				</h3>

			</div>

			<hr>
		</div>



		<div>
			<img src="../../images/box.png" class="imgs" style="float: left">

			<div id="reqno">
				<p>견적번호 : A1002</p>
			</div>

			<div id="title" class="text">
				<h1>서울시 강남구 → 용인시 처인구</h1>
			</div>


			<div id="date" class="text">
				<h3>예약일 : 2019-07-13</h3>
			</div>
			<div id="reqprice">
				<h4>이용요금 : 400000</h4>
			</div>

			<div id="count" class="text">
				<h3>기사명 : 박성래 &nbsp;&nbsp;평점 : 5.0</h3>
			</div>
			<div id="done" align="right">

				<h3>
					<a href="/semi/views/request/popup/pop_reqSuccess.jsp">완료하기→</a>
				</h3>

			</div>

			<hr>
		</div>

		<br>
		<br>
		<br>
		<br>

	</div>

</body>
</html>