<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jimcarry.request.model.vo.*, java.util.*"%>
<%
	Request r = (Request) session.getAttribute("r");
	String[] proKind = r.getProKind().split(", ");
	String[] proName = r.getProName().split(", ");	
	int bookCount = r.getBookCount();
	int boxCount = r.getBoxCount();
	
	ArrayList<Request> list = (ArrayList<Request>) request.getAttribute("list");
%>    

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<style>
	html, body{
		height:100%;
		margin: 0;
		padding: 0;		
	}	
	#main {
		min-height: 100%;
	}	
	
	#proName:hover{
		cursor: pointer;
	}   
	
	.modal {
		background: white;
		margin: 0 auto;
		width: 600px;
		height: 500px;
	} 
	
     
</style>
</head>
<body>
	<%@ include file="/views/common/user_TopBar.jsp" %>
	<div id="main">
	<form action="" method="post">
		<div style="padding-top: 65px; padding-left: 20px;">
			<span style="font-size: 45px; font-weight: bold">선택한 짐들의 상세정보를 선택하세요.</span><br>
			<span>물품명을 선택하시면 상세정보를 선택 할 수 있습니다.</span>
		</div>
		
		<hr>
		
		<div align="center">
			<table>
				<tr>
					<td><label>물품 선택</label></td>
					<td><label> → </label></td>
					<td><label style="font-size: 30px; font-weight: bold;">물품 상세 정보 선택</label></td>						
					<td><label> → </label></td>
					<td><label>장소, 날짜 선택</label></td>
					</tr>	
			</table>
		</div>	
		
		<hr>
		
		<% for(int i = 0; i < proKind.length; i++) { %>				
		<%if(proKind[i].equals("가전") && (proName[i].equals("냉장고") || proName[i].equals("세탁기") || proName[i].equals("TV/모니터") || proName[i].equals("에어컨") || proName[i].equals("정수기") || proName[i].equals("PC/노트북") || proName[i].equals("전자레인지"))) { %>
		
		<div style="padding-left: 20px">
			<span style="font-size: 30px; font-weight: bold"><%= proKind[i] %></span>	
			<div style="border: 1px solid black; width: 500px;">
				<div style="padding: 30px 0px 30px 40px; display: inline-block;">
					<% if(proName[i].equals("냉장고")){ %>
					<img src="/semi/images/ref.png" style="width: 140px; height: 140px">
					<% }else if(proName[i].equals("세탁기")){%>					
					<img src="/semi/images/washing.png" style="width: 140px; height: 140px">
					<% }else if(proName[i].equals("TV/모니터")){%>					
					<img src="/semi/images/tv.png" style="width: 140px; height: 140px">
					<% }else if(proName[i].equals("에어컨")){%>					
					<img src="/semi/images/air.png" style="width: 140px; height: 140px">
					<% }else if(proName[i].equals("정수기")){%>					
					<img src="/semi/images/water.png" style="width: 140px; height: 140px">
					<% }else if(proName[i].equals("PC/노트북")){%>					
					<img src="/semi/images/pc.png" style="width: 140px; height: 140px">
					<% }else if(proName[i].equals("전자레인지")){%>					
					<img src="/semi/images/oven.png" style="width: 140px; height: 140px">
					<% } %>			
				</div>
				
				<div style="display: inline-block; padding-left: 20px;">
					<% if(proName[i].equals("냉장고")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_ref" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span>상세 정보</span>
					<% }else if(proName[i].equals("세탁기")){%>
					<span id="proName" data-toggle="modal" data-target="#pop_wash" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span>상세 정보</span>					
					<% }else if(proName[i].equals("TV/모니터")){%>
					<span id="proName" data-toggle="modal" data-target="#pop_tv" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span>상세 정보</span>					
					<% }else if(proName[i].equals("에어컨")){%>	
					<span id="proName" data-toggle="modal" data-target="#pop_air" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span>상세 정보</span>				
					<% }else if(proName[i].equals("정수기")){%>	
					<span id="proName" data-toggle="modal" data-target="#pop_water" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span>상세 정보</span>				
					<% }else if(proName[i].equals("PC/노트북")){%>
					<span id="proName" data-toggle="modal" data-target="#pop_pc" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span>상세 정보</span>					
					<% }else if(proName[i].equals("전자레인지")){%>
					<span id="proName" data-toggle="modal" data-target="#pop_oven" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span>상세 정보</span>					
					<% } %>						
				</div>				
			</div>
			
		</div>
		<% } else if(proKind[i].equals("가구") && (proName[i].equals("침대") || proName[i].equals("의자") || proName[i].equals("책상/테이블") || proName[i].equals("책장") || proName[i].equals("옷장") || proName[i].equals("진열장") || proName[i].equals("쇼파") || proName[i].equals("행거") || proName[i].equals("거울") || proName[i].equals("화장대") || proName[i].equals("피아노"))) { %>
			
		<div style="padding-left: 20px">
			<span style="font-size: 30px; font-weight: bold"><%= proKind[i] %></span>		
			<div style="border: 1px solid black; width: 500px;">
				<div style="padding: 30px 0px 30px 40px; display: inline-block;">
					<% if(proName[i].equals("침대")) { %>
					<img src="/semi/images/bed.png" style="width: 140px; height: 140px">
					<%}else if(proName[i].equals("의자")){ %>
					<img src="/semi/images/chair.png" style="width: 140px; height: 140px">
					<%}else if(proName[i].equals("책상/테이블")){ %>
					<img src="/semi/images/desk.png" style="width: 140px; height: 140px">
					<%}else if(proName[i].equals("책장")){ %>
					<img src="/semi/images/bookshelf.png" style="width: 140px; height: 140px">
					<%}else if(proName[i].equals("옷장")){ %>
					<img src="/semi/images/closet.png" style="width: 140px; height: 140px">
					<%}else if(proName[i].equals("진열장")){ %>
					<img src="/semi/images/showcase.png" style="width: 140px; height: 140px">
					<%}else if(proName[i].equals("쇼파")){ %>
					<img src="/semi/images/sofa.png" style="width: 140px; height: 140px">
					<%}else if(proName[i].equals("행거")){ %>
					<img src="/semi/images/hanger.png" style="width: 140px; height: 140px">
					<%}else if(proName[i].equals("거울")){ %>
					<img src="/semi/images/mirror.png" style="width: 140px; height: 140px">
					<%}else if(proName[i].equals("화장대")){ %>
					<img src="/semi/images/table.png" style="width: 140px; height: 140px">
					<%}else if(proName[i].equals("피아노")){ %>
					<img src="/semi/images/piano.png" style="width: 140px; height: 140px">
					<%} %>
				</div>
				
				<div style="display: inline-block; padding-left: 20px;">
					<% if(proName[i].equals("침대")) { %>
					<span id="proName" data-toggle="modal" data-target="#pop_bed" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span>상세 정보</span>
					<%}else if(proName[i].equals("의자")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_chair" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span>상세 정보</span>
					<%}else if(proName[i].equals("책상/테이블")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_table" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span>상세 정보</span>
					<%}else if(proName[i].equals("책장")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_bookcase" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span>상세 정보</span>
					<%}else if(proName[i].equals("옷장")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_closet" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span>상세 정보</span>
					<%}else if(proName[i].equals("진열장")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_showcase" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span>상세 정보</span>
					<%}else if(proName[i].equals("쇼파")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_sofa" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span>상세 정보</span>
					<%}else if(proName[i].equals("행거")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_hanger" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span>상세 정보</span>
					<%}else if(proName[i].equals("거울")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_mirror" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span>상세 정보</span>
					<%}else if(proName[i].equals("화장대")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_makeup" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span>상세 정보</span>
					<%}else if(proName[i].equals("피아노")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_piano" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span>상세 정보</span>
					<%} %>
				</div>				
			</div>
		</div>
			<% } %>			
		<% } %>
		
		<% if(bookCount > 0) { %>
		<div style="padding-left: 20px;">
			<span style="font-size: 30px; font-weight: bold">기타</span>				
			<div style="border: 1px solid black; width: 500px;">
				<div style="padding: 30px 0px 30px 40px; display: inline-block;">
					<img src="/semi./images/books.png" style="width: 140px; height: 140px">
				</div>
				
				<div style="display: inline-block; padding-left: 20px;">
					<span style="font-size: 35px; font-weight: bold">책</span><br>
					<span>개수 : <%= r.getBookCount() %></span>
				</div>				
			</div>
		</div>
		<% } %>
		
		<% if(boxCount > 0) { %>
		<div style="padding-left: 20px;">	
			<span style="font-size: 30px; font-weight: bold">기타</span>	
			<div style="border: 1px solid black; width: 500px;">
				<div style="padding: 30px 0px 30px 40px; display: inline-block;">
					<img src="/semi/images/box.png" style="width: 140px; height: 140px">
				</div>
				
				<div style="display: inline-block; padding-left: 20px;">
					<span style="font-size: 35px; font-weight: bold">상자</span><br>
					<span>개수 : <%= r.getBoxCount() %></span>
				</div>				
			</div>
		</div>	
		<% } %>
		
		<hr>
		
		<div style="padding-left: 20px">
			<span style="font-size: 30px; font-weight: bold">메모</span>			
			<div>
				<textarea placeholder="요청사항 및 특이사항을 입력하세요." style="width: 300px; height: 200px;"></textarea>
			</div>
		</div>
		
		<hr>
		
		<div align="center" style="margin-bottom: 10px">
			<input type="hidden" id="popVal" name="popVal">
			<a href="req_ProSelect.jsp" style="text-decoration: none">
				<span style="font-size: 30px">뒤로가기</span>	
			</a>
			<a href="req_PlaceSelect.jsp" style="text-decoration: none; padding-left: 40px;">
				<span id="updateProDetail" onclick="updateProDetail();" style="font-size: 30px" >다음 단계로</span>	
			</a>
		</div>
	</form>
	<% for(Request r2 : list){ %>
		<input type="text" name="rNo[]" value="<%=r2.getReqNo() %>">
		<input type="text" name="pNo[]" value="<%=r2.getProNo() %>">
		<input type="text" name="pName[]" value="<%=r2.getProName() %>">		
	<% } %>
	<button onclick="testHidden()">확인하기</button>
	</div>
	<!-- 팝업창 -->
	<!-- 팝업창 -->
	<!-- 팝업창 -->
	<!-- 팝업창 -->
	
	<div>
		<!-- 냉장고 팝업창 -->
		<form action="<%=request.getContextPath()%>/updatePopup.rq" method="post">		
			<div class="modal fade" id="pop_ref" tabindex="-1" role="dialog" aria-labelledby="popRefLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
						<div align="center">
							<span style="font-size: 30px; font-weight: bold">냉장고</span>
						</div>
					</div>
					<div class="modal-body">						
						<div align="center">
							<span style="font-size: 20px;">종류</span><br><br>
							<input type="radio" id="refrigerator1" name="proType_ref" value="일반형">
							<label for="refrigerator1">일반형</label><br>
							<input type="radio" id="refrigerator2" name="proType_ref" value="양문형">
							<label for="refrigerator2">양문형</label><br>
							<input type="radio" id="refrigerator3" name="proType_ref" value="김치냉장고">
							<label for="refrigerator3">김치냉장고</label><br>
							<input type="radio" id="refrigerator4" name="proType_ref" value="기타">
							<label for="refrigerator4">기타</label><br>
						</div>
						
						<hr>
						
						<div align="center">
							<span style="font-size: 20px;">용량</span><br><br>
							<input type="radio" id="refrigerator_liter1" name="proSize_ref" value="130리터 미만">
							<label for="refrigerator_liter1">130리터 미만</label><br>
							<input type="radio" id="refrigerator_liter2" name="proSize_ref" value="130~250리터">
							<label for="refrigerator_liter2">130~250리터</label><br>
							<input type="radio" id="refrigerator_liter3" name="proSize_ref" value="251~450리터">
							<label for="refrigerator_liter3">251~450리터</label><br>
							<input type="radio" id="refrigerator_liter4" name="proSize_ref" value="451~600리터">
							<label for="refrigerator_liter4">451~600리터</label><br>
							<input type="radio" id="refrigerator_liter5" name="proSize_ref" value="600리터 초과">
							<label for="refrigerator_liter5">600리터 초과</label><br>
						</div>
					</div>
					<div class="modal-footer">
						<div align="center">
							<input type="submit" value="확인">
						</div>
					</div>
				</div>
				<% for(Request r2 : list){ %>
					<input type="hidden" name="rNo[]" value="<%=r2.getReqNo() %>">
					<input type="hidden" name="pNo[]" value="<%=r2.getProNo() %>">
					<input type="hidden" name="pName[]" value="<%=r2.getProName() %>">		
				<% } %>
			</div>
		</form>
		<form action="<%=request.getContextPath()%>/updatePopup.rq" method="post">			
		<!-- 세탁기 팝업창  -->
			<div class="modal fade" id="pop_wash" tabindex="-1" role="dialog" aria-labelledby="popRefLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
						<div align="center">
							<span style="font-size: 30px; font-weight: bold">세탁기</span>
						</div>
					</div>
					<div class="modal-body">						
						<div align="center">
							<span style="font-size: 20px;">종류</span><br><br>
							<input type="radio" id="washing1" name="proType_wash" value="통돌이">
							<label for="washing1">통돌이</label><br>
							<input type="radio" id="washing2" name="proType_wash" value="드럼">
							<label for="washing2">드럼</label><br>
							<input type="radio" id="washing3" name="proType_wash" value="기타">
							<label for="washing3">기타</label><br>
						</div>
						
						<hr>
						
						<div align="center">
							<span style="font-size: 20px;">용량</span><br><br>
							<input type="radio" id="washing_Liter1" name="proSize_wash" value="10kg미만">
							<label for="washing_Liter1">10kg 미만</label><br>
							<input type="radio" id="washing_Liter2" name="proSize_wash" value="10kg이상">
							<label for="washing_Liter2">10kg 이상</label><br>
						</div>
					</div>
					<div class="modal-footer">
						<div align="center">
							<input type="button" value="확인" onclick="sendValue();">
						</div>
					</div>
				</div>
				<% for(Request r2 : list){ %>
					<input type="hidden" name="rNo[]" value="<%=r2.getReqNo() %>">
					<input type="hidden" name="pNo[]" value="<%=r2.getProNo() %>">
					<input type="hidden" name="pName[]" value="<%=r2.getProName() %>">		
				<% } %>			
			</div>
		</form>
		<form action="<%=request.getContextPath()%>/updatePopup.rq" method="post">	
		<!-- tv 팝업창  -->
			<div class="modal fade" id="pop_tv" tabindex="-1" role="dialog" aria-labelledby="popRefLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
						<div align="center">
							<span style="font-size: 30px; font-weight: bold">TV/모니터</span>
						</div>
					</div>
					<div class="modal-body">						
						<div align="center">
							<span style="font-size: 20px;">크기</span><br><br>
							<input type="radio" id="TV1" name="proSize_tv" value="30인치 미만">
							<label for="TV1">30인치미만</label><br>
							<input type="radio" id="TV2" name="proSize_tv" value="30~39인치">
							<label for="TV2">30~39인치</label><br>
							<input type="radio" id="TV3" name="proSize_tv" value="40~49인치">
							<label for="TV3">40~49인치</label><br>
							<input type="radio" id="TV4" name="proSize_tv" value="50인치 이상">
							<label for="TV4">50인치 이상</label><br>
							<input type="radio" id="TV5" name="proSize_tv" value="기타">
							<label for="TV5">기타</label><br>
						</div>						
					</div>
					<div class="modal-footer">
						<div align="center">
							<input type="button" value="확인" onclick="sendValue();">
						</div>
					</div>
				</div>
				<% for(Request r2 : list){ %>
					<input type="hidden" name="rNo[]" value="<%=r2.getReqNo() %>">
					<input type="hidden" name="pNo[]" value="<%=r2.getProNo() %>">
					<input type="hidden" name="pName[]" value="<%=r2.getProName() %>">		
				<% } %>			
			</div>
		</form>
		<form action="<%=request.getContextPath()%>/updatePopup.rq" method="post">	
		<!-- 에어컨 팝업창  -->
			<div class="modal fade" id="pop_air" tabindex="-1" role="dialog" aria-labelledby="popRefLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
						<div align="center">
							<span style="font-size: 30px; font-weight: bold">에어컨</span>
						</div>
					</div>
					<div class="modal-body">						
						<div align="center">
							<span style="font-size: 20px;">종류</span><br><br>
							<input type="radio" id="Air1" name="proType_air" value="벽걸이">
							<label for="Air1">벽걸이</label><br>
							<input type="radio" id="Air2" name="proType_air" value="스탠딩">
							<label for="Air2">스탠딩</label><br>
							<input type="radio" id="Air3" name="proType_air" value="기타">
							<label for="Air3">기타</label><br>
						</div>
						
						<hr>
			
						<div align="center">
							<span style="font-size: 20px;">출발지 분리 필요 여부</span><br><br>
							<input type="radio" id="Air_check1" name="proUni_air" value="분리 필요">
							<label for="Air_check1">분리 필요</label><br>
							<input type="radio" id="Air_check2" name="proUni_air" value="분리 필요 없음">
							<label for="Air_check2">분리 필요 없음</label><br>
						</div>					
					</div>
					<div class="modal-footer">
						<div align="center">
							<input type="button" value="확인" onclick="sendValue();">
						</div>
					</div>
				</div>
				<% for(Request r2 : list){ %>
					<input type="hidden" name="rNo[]" value="<%=r2.getReqNo() %>">
					<input type="hidden" name="pNo[]" value="<%=r2.getProNo() %>">
					<input type="hidden" name="pName[]" value="<%=r2.getProName() %>">		
				<% } %>			
			</div>
		</form>
		<form action="<%=request.getContextPath()%>/updatePopup.rq" method="post">	
		<!-- 정수기 팝업창  -->
			<div class="modal fade" id="pop_water" tabindex="-1" role="dialog" aria-labelledby="popRefLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
						<div align="center">
							<span style="font-size: 30px; font-weight: bold">정수기</span>
						</div>
					</div>
					<div class="modal-body">						
						<div align="center">
							<span style="font-size: 20px;">크기</span><br><br>
							<input type="radio" id="Water1" name="proSize_water" value="탁상용(미니)">
							<label for="Water1">탁상용(미니)</label><br>
							<input type="radio" id="Water2" name="proSize_water" value="스탠딩(일반)">
							<label for="Water2">스탠딩(일반)</label><br>
						</div>
						
						<hr>
			
						<div align="center">
							<span style="font-size: 20px;">출발지 분리 필요 여부</span><br><br>
							<input type="radio" id="Water_check1" name="proUni_water" value="분리 필요">
							<label for="Water_check1">분리 필요</label><br>
							<input type="radio" id="Water_check2" name="proUni_water" value="분리 필요 없음">
							<label for="Water_check2">분리 필요 없음</label><br>
						</div>				
					</div>
					<div class="modal-footer">
						<div align="center">
							<input type="button" value="확인" onclick="sendValue();">
						</div>
					</div>
				</div>
				<% for(Request r2 : list){ %>
					<input type="hidden" name="rNo[]" value="<%=r2.getReqNo() %>">
					<input type="hidden" name="pNo[]" value="<%=r2.getProNo() %>">
					<input type="hidden" name="pName[]" value="<%=r2.getProName() %>">		
				<% } %>			
			</div>
		</form>
		<form action="<%=request.getContextPath()%>/updatePopup.rq" method="post">	
		<!-- PC/노트북 팝업창  -->
			<div class="modal fade" id="pop_pc" tabindex="-1" role="dialog" aria-labelledby="popRefLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
						<div align="center">
							<span style="font-size: 30px; font-weight: bold">PC/노트북</span>
						</div>
					</div>
					<div class="modal-body">						
						<div align="center">
							<span style="font-size: 20px;">종류</span><br><br>
							<input type="radio" id="pc1" name="proType_pc" value="데스크탑">
							<label for="pc1">데스크탑</label><br>
							<input type="radio" id="pc2" name="proType_pc" value="노트북">
							<label for="pc2">노트북</label><br>
						</div>
					</div>						
					<div class="modal-footer">
						<div align="center">
							<input type="button" value="확인" onclick="sendValue();">
						</div>
					</div>
				</div>
				<% for(Request r2 : list){ %>
					<input type="hidden" name="rNo[]" value="<%=r2.getReqNo() %>">
					<input type="hidden" name="pNo[]" value="<%=r2.getProNo() %>">
					<input type="hidden" name="pName[]" value="<%=r2.getProName() %>">		
				<% } %>			
			</div>
		</form>
		<form action="<%=request.getContextPath()%>/updatePopup.rq" method="post">	
		<!-- 전자레인지 팝업창  -->
			<div class="modal fade" id="pop_oven" tabindex="-1" role="dialog" aria-labelledby="popRefLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
						<div align="center">
							<span style="font-size: 30px; font-weight: bold">전자레인지</span>
						</div>
					</div>
					<div class="modal-body">						
						<div align="center">
							<span style="font-size: 20px;">종류</span><br><br>
							<input type="radio" id="oven1" name="proType_oven" value="일반형">
							<label for="oven1">일반형</label><br>
							<input type="radio" id="oven2" name="proType_oven" value="오븐형">
							<label for="oven2">오븐형</label><br>
						</div>
					</div>						
					<div class="modal-footer">
						<div align="center">
							<input type="button" value="확인" onclick="sendValue();">
						</div>
					</div>
				</div>
				<% for(Request r2 : list){ %>
					<input type="hidden" name="rNo[]" value="<%=r2.getReqNo() %>">
					<input type="hidden" name="pNo[]" value="<%=r2.getProNo() %>">
					<input type="hidden" name="pName[]" value="<%=r2.getProName() %>">		
				<% } %>			
			</div>
		</form>
		<form action="<%=request.getContextPath()%>/updatePopup.rq" method="post">	
		<!-- 침대 팝업창  -->
			<div class="modal fade" id="pop_bed" tabindex="-1" role="dialog" aria-labelledby="popRefLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
						<div align="center">
							<span style="font-size: 30px; font-weight: bold">침대</span>
						</div>
					</div>
					<div class="modal-body">						
						<div align="center">
							<span style="font-size: 20px;">크기</span><br><br>
							<input type="radio" id="bed1" name="proSize_bed" value="싱글/슈퍼싱글">
							<label for="bed1">싱글/슈퍼싱글</label><br>
							<input type="radio" id="bed2" name="proSize_bed" value="더블">
							<label for="bed2">더블</label><br>
							<input type="radio" id="bed3" name="proSize_bed" value="퀸">
							<label for="bed3">퀸</label><br>
							<input type="radio" id="bed4" name="proSize_bed" value="킹">
							<label for="bed4">킹</label><br>
							<input type="radio" id="bed5" name="proSize_bed" value="기타">
							<label for="bed5">기타</label><br>
						</div>	
						
						<hr>						
									
						<div align="center">
							<span style="font-size: 20px;">종류</span><br><br>
							<input type="radio" id="bed_kind1" name="proType_bed" value="프레임 없음">
							<label for="bed_kind1">프레임 없음</label><br>
							<input type="radio" id="bed_kind2" name="proType_bed" value="일반 프레임">
							<label for="bed_kind2">일반 프레임</label><br>
							<input type="radio" id="bed_kind3" name="proType_bed" value="통 프레임">
							<label for="bed_kind3">통 프레임</label><br>
							<input type="radio" id="bed_kind4" name="proType_bed" value="서랍/수납형">
							<label for="bed_kind4">서랍/수납형</label><br>
							<input type="radio" id="bed_kind5" name="proType_bed" value="2층 침대">
							<label for="bed_kind5">2층 침대</label><br>
							<input type="radio" id="bed_kind6" name="proType_bed" value="기타">
							<label for="bed_kind6">기타</label><br>
						</div>
					</div>					
					<div class="modal-footer">
						<div align="center">
							<input type="button" value="확인" onclick="sendValue();">
						</div>
					</div>
				</div>
				<% for(Request r2 : list){ %>
					<input type="hidden" name="rNo[]" value="<%=r2.getReqNo() %>">
					<input type="hidden" name="pNo[]" value="<%=r2.getProNo() %>">
					<input type="hidden" name="pName[]" value="<%=r2.getProName() %>">		
				<% } %>			
			</div>
		</form>
		<form action="<%=request.getContextPath()%>/updatePopup.rq" method="post">	
		<!-- 의자 팝업창  -->
			<div class="modal fade" id="pop_chair" tabindex="-1" role="dialog" aria-labelledby="popRefLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
						<div align="center">
							<span style="font-size: 30px; font-weight: bold">의자</span>
						</div>
					</div>
					<div class="modal-body">						
						<div align="center">
							<span style="font-size: 20px;">종류</span><br><br>
							<input type="radio" id="chair1" name="proType_chair" value="가정용">
							<label for="chair1">가정용</label><br>
							<input type="radio" id="chair2" name="proType_chair" value="사무용">
							<label for="chair2">사무용</label><br>
							<input type="radio" id="chair3" name="proType_chair" value="기타">
							<label for="chair3">기타</label><br>
						</div>
					</div>					
					<div class="modal-footer">
						<div align="center">
							<input type="button" value="확인" onclick="sendValue();">
						</div>
					</div>
				</div>
				<% for(Request r2 : list){ %>
					<input type="hidden" name="rNo[]" value="<%=r2.getReqNo() %>">
					<input type="hidden" name="pNo[]" value="<%=r2.getProNo() %>">
					<input type="hidden" name="pName[]" value="<%=r2.getProName() %>">		
				<% } %>			
			</div>
		</form>
		<form action="<%=request.getContextPath()%>/updatePopup.rq" method="post">	
		<!-- 책상/테이블 팝업창  -->
			<div class="modal fade" id="pop_table" tabindex="-1" role="dialog" aria-labelledby="popRefLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
						<div align="center">
							<span style="font-size: 30px; font-weight: bold">책상/테이블</span>
						</div>
					</div>
					<div class="modal-body">						
						<div align="center">
							<span style="font-size: 20px;">모양</span><br><br>
							<input type="radio" id="table1" name="proType_table" value="원형">
							<label for="table1">원형</label><br>
							<input type="radio" id="table2" name="proType_table" value="일반형">
							<label for="table2">일반형</label><br>
							<input type="radio" id="table3" name="proType_table" value="ㄱ자형">
							<label for="table3">ㄱ자형</label><br>
							<input type="radio" id="table4" name="proType_table" value="서랍형">
							<label for="table4">서랍형</label><br>
							<input type="radio" id="table5" name="proType_table" value="기타">
							<label for="table5">기타</label><br>
						</div>
						
						<hr>
						
						<div align="center">
							<span style="font-size: 20px;">재질</span><br><br>
							<input type="radio" id="table_material1" name="proMat_table" value="나무">
							<label for="table_material1">나무</label><br>
							<input type="radio" id="table_material2" name="proMat_table" value="철제">
							<label for="table_material2">철제</label><br>
							<input type="radio" id="table_material3" name="proMat_table" value="대리석">
							<label for="table_material3">대리석</label><br>
						</div>
						
						<hr>
						
						<div align="center">
							<span style="font-size: 20px;">사이즈</span><br><br>
							<input type="radio" id="table_size1" name="proSize_table" value="1~2인용">
							<label for="table_size1">1~2인용</label><br>
							<input type="radio" id="table_size2" name="proSize_table" value="3~4인용">
							<label for="table_size2">3~4인용</label><br>
							<input type="radio" id="table_size3" name="proSize_table" value="5~6인용">
							<label for="table_size3">5~6인용</label><br>
						</div>
						
						<hr>
						
						<div align="center">
							<span style="font-size: 20px;">너비</span><br><br>
							<input type="radio" id="table_width1" name="proWidth_table" value="50cm미만">
							<label for="table_width1">50cm미만</label><br>
							<input type="radio" id="table_width2" name="proWidth_table" value="50~100cm">
							<label for="table_width2">50~100cm</label><br>
							<input type="radio" id="table_width3" name="proWidth_table" value="100~150cm">
							<label for="table_width3">100~150cm</label><br>
							<input type="radio" id="table_width4" name="proWidth_table" value="150cm초과">
							<label for="table_width4">150cm초과</label><br>
						</div>
					</div>					
					<div class="modal-footer">
						<div align="center">
							<input type="button" value="확인" onclick="sendValue();">
						</div>
					</div>
				</div>
				<% for(Request r2 : list){ %>
					<input type="hidden" name="rNo[]" value="<%=r2.getReqNo() %>">
					<input type="hidden" name="pNo[]" value="<%=r2.getProNo() %>">
					<input type="hidden" name="pName[]" value="<%=r2.getProName() %>">		
				<% } %>			
			</div>
		</form>
		<form action="<%=request.getContextPath()%>/updatePopup.rq" method="post">	
		<!-- 책장 팝업창  -->
			<div class="modal fade" id="pop_bookcase" tabindex="-1" role="dialog" aria-labelledby="popRefLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
						<div align="center">
							<span style="font-size: 30px; font-weight: bold">책장</span>
						</div>
					</div>
					<div class="modal-body">						
						<div align="center">
							<span style="font-size: 20px;">너비</span><br><br>
							<input type="radio" id="bookcase_width1" name="proWidth_bc" value="50cm미만">
							<label for="bookcase_width1">50cm미만</label><br>
							<input type="radio" id="bookcase_width2" name="proWidth_bc" value="50~100cm">
							<label for="bookcase_width2">50~100cm</label><br>
							<input type="radio" id="bookcase_width3" name="proWidth_bc" value="100~150cm">
							<label for="bookcase_width3">100~150cm</label><br>
							<input type="radio" id="bookcase_width4" name="proWidth_bc" value="150cm초과">
							<label for="bookcase_width4">150cm초과</label><br>
						</div>	
						
						<hr>
						
						<div align="center">
							<span style="font-size: 20px;">높이</span><br><br>
							<input type="radio" id="bookcase_height1" name="proHeight_bc" value="50cm미만">
							<label for="bookcase_height1">50cm미만</label><br>
							<input type="radio" id="bookcase_height2" name="proHeight_bc" value="50~100cm">
							<label for="bookcase_height2">50~100cm</label><br>
							<input type="radio" id="bookcase_height3" name="proHeight_bc" value="100~150cm">
							<label for="bookcase_height3">100~150cm</label><br>
							<input type="radio" id="bookcase_heighte4" name="proHeight_bc" value="150cm초과">
							<label for="bookcase_height4">150cm초과</label><br>
						</div>	
					</div>					
					<div class="modal-footer">
						<div align="center">
							<input type="button" value="확인" onclick="sendValue();">
						</div>
					</div>
				</div>
				<% for(Request r2 : list){ %>
					<input type="hidden" name="rNo[]" value="<%=r2.getReqNo() %>">
					<input type="hidden" name="pNo[]" value="<%=r2.getProNo() %>">
					<input type="hidden" name="pName[]" value="<%=r2.getProName() %>">		
				<% } %>			
			</div>
		</form>
		<form action="<%=request.getContextPath()%>/updatePopup.rq" method="post">	
		<!-- 옷장 팝업창  -->
			<div class="modal fade" id="pop_closet" tabindex="-1" role="dialog" aria-labelledby="popRefLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
						<div align="center">
							<span style="font-size: 30px; font-weight: bold">옷장</span>
						</div>
					</div>
					<div class="modal-body">						
						<div align="center">
							<span style="font-size: 20px;">종류</span><br><br>
							<input type="radio" id="closet1" name="proType_clo" value="단품형">
							<label for="closet1">단품형</label><br>
							<input type="radio" id="closet2" name="proType_clo" value="조립형">
							<label for="closet2">조립형</label><br>
							<input type="radio" id="closet3" name="proType_clo" value="슬라이드장">
							<label for="closet3">슬라이드장</label><br>
							<input type="radio" id="closet4" name="proType_clo" value="붙박이">
							<label for="closet4">붙박이</label><br>
							<input type="radio" id="closet5" name="proType_clo" value="기타">
							<label for="closet5">기타</label><br>
						</div>	
						
						<hr>
						
						<div align="center">
							<span style="font-size: 20px;">옷장 문 수</span><br><br>
							<input type="radio" id="closet_door1" name="proUni_clo" value="문 1개">
							<label for="closet_door1">1개</label><br>
							<input type="radio" id="closet_door2" name="proUni_clo" value="문 2개">
							<label for="closet_door2">2개</label><br>
							<input type="radio" id="closet_door3" name="proUni_clo" value="문 3~4개">
							<label for="closet_door3">3~4개</label><br>
							<input type="radio" id="closet_door4" name="proUni_clo" value="문 5개 이상">
							<label for="closet_door4">5개 이상</label><br>
							<input type="radio" id="closet_door5" name="proUni_clo" value="기타">
							<label for="closet_door5">기타</label><br>
						</div>
						
						<hr>
						
						<div align="center">
							<span style="font-size: 20px;">개별 옷장 너비</span><br><br>
							<input type="radio" id="closet_width1" name="proWidth_clo" value="1m이하">
							<label for="closet_width1">1m이하</label><br>
							<input type="radio" id="closet_width2" name="proWidth_clo" value="1~1.5m">
							<label for="closet_width2">1~1.5m</label><br>
							<input type="radio" id="closet_width3" name="proWidth_clo" value="1.5~3m">
							<label for="closet_width3">1.5~3m</label><br>
							<input type="radio" id="closet_width4" name="proWidth_clo" value="3m이상">
							<label for="closet_width4">3m이상</label><br>
							<input type="radio" id="closet_width5" name="proWidth_clo" value="기타">
							<label for="closet_width5">기타</label><br>
						</div>	
					</div>					
					<div class="modal-footer">
						<div align="center">
							<input type="button" value="확인" onclick="sendValue();">
						</div>
					</div>
				</div>
				<% for(Request r2 : list){ %>
					<input type="hidden" name="rNo[]" value="<%=r2.getReqNo() %>">
					<input type="hidden" name="pNo[]" value="<%=r2.getProNo() %>">
					<input type="hidden" name="pName[]" value="<%=r2.getProName() %>">		
				<% } %>			
			</div>
		</form>
		<form action="<%=request.getContextPath()%>/updatePopup.rq" method="post">	
		<!-- 진열장 팝업창  -->
			<div class="modal fade" id="pop_showcase" tabindex="-1" role="dialog" aria-labelledby="popRefLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
						<div align="center">
							<span style="font-size: 30px; font-weight: bold">진열장</span>
						</div>
					</div>
					<div class="modal-body">						
						<div align="center">
							<span style="font-size: 20px;">유리 구성 여부</span><br><br>
							<input type="radio" id="showcase1" name="glassCheck_sc" value="유리 있음">
							<label for="showcase1">유리 있음</label><br>
							<input type="radio" id="showcase2" name="glassCheck_sc" value="유리 없음">
							<label for="showcase2">유리 없음</label><br>
						</div>	
						
						<hr>
						
						<div align="center">
							<span style="font-size: 20px;">너비</span><br><br>
							<input type="radio" id="showcase_width1" name="proWidth_sc" value="50cm미만">
							<label for="showcase_width1">50cm미만</label><br>
							<input type="radio" id="showcase_width2" name="proWidth_sc" value="50~100cm">
							<label for="showcase_width2">50~100cm</label><br>
							<input type="radio" id="showcase_width3" name="proWidth_sc" value="100~150cm">
							<label for="showcase_width3">100~150cm</label><br>
							<input type="radio" id="showcase_width4" name="proWidth_sc" value="150cm초과">
							<label for="showcase_width4">150cm초과</label><br>
						</div>
						
						<hr>
						
						<div align="center">
							<span style="font-size: 20px;">높이</span><br><br>
							<input type="radio" id="showcase_height1" name="proHeight_sc" value="50cm미만">
							<label for="showcase_height1">50cm미만</label><br>
							<input type="radio" id="showcase_height2" name="proHeight_sc" value="50~100cm">
							<label for="showcase_height2">50~100cm</label><br>
							<input type="radio" id="showcase_height3" name="proHeight_sc" value="100~150cm">
							<label for="showcase_height3">100~150cm</label><br>
							<input type="radio" id="showcase_height4" name="proHeight_sc" value="150cm초과">
							<label for="showcase_height4">150cm초과</label><br>
						</div>	
					</div>					
					<div class="modal-footer">
						<div align="center">
							<input type="button" value="확인" onclick="sendValue();">
						</div>
					</div>
				</div>
				<% for(Request r2 : list){ %>
					<input type="hidden" name="rNo[]" value="<%=r2.getReqNo() %>">
					<input type="hidden" name="pNo[]" value="<%=r2.getProNo() %>">
					<input type="hidden" name="pName[]" value="<%=r2.getProName() %>">		
				<% } %>			
			</div>
		</form>
		<form action="<%=request.getContextPath()%>/updatePopup.rq" method="post">	
		<!-- 쇼파 팝업창  -->
			<div class="modal fade" id="pop_sofa" tabindex="-1" role="dialog" aria-labelledby="popRefLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
						<div align="center">
							<span style="font-size: 30px; font-weight: bold">쇼파</span>
						</div>
					</div>
					<div class="modal-body">						
						<div align="center">
							<span style="font-size: 20px;">크기</span><br><br>
							<input type="radio" id="sofa1" name="proSize_sofa" value="1인용">
							<label for="sofa1">1인용</label><br>
							<input type="radio" id="sofa2" name="proSize_sofa" value="2인용">
							<label for="sofa2">2인용</label><br>
							<input type="radio" id="sofa3" name="proSize_sofa" value="3인용">
							<label for="sofa3">2인용</label><br>
						</div>
					</div>					
					<div class="modal-footer">
						<div align="center">
							<input type="button" value="확인" onclick="sendValue();">
						</div>
					</div>
				</div>
				<% for(Request r2 : list){ %>
					<input type="hidden" name="rNo[]" value="<%=r2.getReqNo() %>">
					<input type="hidden" name="pNo[]" value="<%=r2.getProNo() %>">
					<input type="hidden" name="pName[]" value="<%=r2.getProName() %>">		
				<% } %>			
			</div>
		</form>
		<form action="<%=request.getContextPath()%>/updatePopup.rq" method="post">	
		<!-- 행거 팝업창  -->
			<div class="modal fade" id="pop_hanger" tabindex="-1" role="dialog" aria-labelledby="popRefLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
						<div align="center">
							<span style="font-size: 30px; font-weight: bold">행거</span>
						</div>
					</div>
					<div class="modal-body">						
						<div align="center">
							<span style="font-size: 20px;">종류</span><br><br>
							<input type="radio" id="hanger1" name="proType_hang" value="이동형">
							<label for="hanger1">이동형</label><br>
							<input type="radio" id="hanger2" name="proType_hang" value="설치형">
							<label for="hanger2">설치형</label><br>
							<input type="radio" id="hanger3" name="proType_hang" value="기타">
							<label for="hanger3">기타</label><br>
						</div>	
						
						<hr>
						
						<div align="center">
							<span style="font-size: 20px;">너비</span><br><br>
							<input type="radio" id="hanger_width1" name="proWidth_hang" value="50cm미만">
							<label for="hanger_width1">50cm미만</label><br>
							<input type="radio" id="hanger_width2" name="proWidth_hang" value="50~100cm">
							<label for="hanger_width2">50~100cm</label><br>
							<input type="radio" id="hanger_width3" name="proWidth_hang" value="100~150cm">
							<label for="hanger_width3">100~150cm</label><br>
							<input type="radio" id="hanger_width4" name="proWidth_hang" value="150cm초과">
							<label for="hanger_width4">150cm초과</label><br>
						</div>	
					</div>					
					<div class="modal-footer">
						<div align="center">
							<input type="button" value="확인" onclick="sendValue();">
						</div>
					</div>
				</div>
				<% for(Request r2 : list){ %>
					<input type="hidden" name="rNo[]" value="<%=r2.getReqNo() %>">
					<input type="hidden" name="pNo[]" value="<%=r2.getProNo() %>">
					<input type="hidden" name="pName[]" value="<%=r2.getProName() %>">		
				<% } %>			
			</div>
		</form>
		<form action="<%=request.getContextPath()%>/updatePopup.rq" method="post">	
		<!-- 거울 팝업창  -->
			<div class="modal fade" id="pop_mirror" tabindex="-1" role="dialog" aria-labelledby="popRefLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
						<div align="center">
							<span style="font-size: 30px; font-weight: bold">거울</span>
						</div>
					</div>
					<div class="modal-body">						
						<div align="center">
							<span style="font-size: 20px;">종류</span><br><br>
							<input type="radio" id="mirror1" name="proType_mir" value="벽걸이형">
							<label for="mirror1">벽걸이형</label><br>
							<input type="radio" id="mirror2" name="proType_mir" value="스탠딩형">
							<label for="mirror2">스탠딩형</label><br>
							<input type="radio" id="mirror3" name="proType_mir" value="기타">
							<label for="mirror3">기타</label><br>
						</div>	
						
						<hr>
						
						<div align="center">
							<span style="font-size: 20px;">크기</span><br><br>
							<input type="radio" id="mirror_size1" name="proSize_mir" value="반전신">
							<label for="mirror_size1">반전신</label><br>
							<input type="radio" id="mirror_size2" name="proSize_mir" value="전신">
							<label for="mirror_size2">전신</label><br>
						</div>
					</div>					
					<div class="modal-footer">
						<div align="center">
							<input type="button" value="확인" onclick="sendValue();">
						</div>
					</div>
				</div>
				<% for(Request r2 : list){ %>
					<input type="hidden" name="rNo[]" value="<%=r2.getReqNo() %>">
					<input type="hidden" name="pNo[]" value="<%=r2.getProNo() %>">
					<input type="hidden" name="pName[]" value="<%=r2.getProName() %>">		
				<% } %>			
			</div>
		</form>
		<form action="<%=request.getContextPath()%>/updatePopup.rq" method="post">	
		<!-- 화장대 팝업창  -->
			<div class="modal fade" id="pop_makeup" tabindex="-1" role="dialog" aria-labelledby="popRefLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
						<div align="center">
							<span style="font-size: 30px; font-weight: bold">화장대</span>
						</div>
					</div>
					<div class="modal-body">						
						<div align="center">
							<span style="font-size: 20px;">재질</span><br><br>
							<input type="radio" id="makeup_mat1" name="proMat_make" value="플라스틱">
							<label for="makeup_mat1">플라스틱</label><br>
							<input type="radio" id="makeup_mat2" name="proMat_make" value="나무">
							<label for="makeup_mat2">나무</label><br>
							<input type="radio" id="makeup_mat3" name="proMat_make" value="철제">
							<label for="makeup_mat3">철제</label><br>
							<input type="radio" id="makeup_mat4" name="proMat_make" value="기타">
							<label for=makeup_mat4>기타</label><br>
						</div>	
						
						<hr>
						
						<div align="center">
							<span style="font-size: 20px;">종류</span><br><br>
							<input type="radio" id="makeup_kind1" name="proType_make" value="미니화장대">
							<label for="makeup_kind1">미니화장대</label><br>
							<input type="radio" id="makeup_kind2" name="proType_make" value="1~2단서랍형">
							<label for="makeup_kind2">1~2단서랍형</label><br>
							<input type="radio" id="makeup_kind3" name="proType_make" value="3단이상 수납형">
							<label for="makeup_kind3">3단이상 수납형</label><br>
						</div>
					</div>					
					<div class="modal-footer">
						<div align="center">
							<input type="button" value="확인" onclick="sendValue();">
						</div>
					</div>
				</div>
				<% for(Request r2 : list){ %>
					<input type="hidden" name="rNo[]" value="<%=r2.getReqNo() %>">
					<input type="hidden" name="pNo[]" value="<%=r2.getProNo() %>">
					<input type="hidden" name="pName[]" value="<%=r2.getProName() %>">		
				<% } %>			
			</div>
		</form>
		<form action="<%=request.getContextPath()%>/updatePopup.rq" method="post">	
		<!-- 피아노 팝업창  -->
			<div class="modal fade" id="pop_piano" tabindex="-1" role="dialog" aria-labelledby="popRefLabel" aria-hidden="true">
				<div class="modal-dialog modal-sm" role="document">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">x</span>
						</button>
						<div align="center">
							<span style="font-size: 30px; font-weight: bold">피아노</span>
						</div>
					</div>
					<div align="center">
						<span style="font-size: 20px;">종류</span><br><br>
						<input type="radio" id="piano1" name="proType_piano" value="디지털 피아노">
						<label for="piano1">디지털 피아노</label><br>
						<input type="radio" id="piano2" name="proType_piano" value="일반 피아노">
						<label for="piano2">일반 피아노</label><br>
						<input type="radio" id="piano3" name="proType_piano" value="그랜드 피아노">
						<label for="piano3">그랜드 피아노</label><br>
						<input type="radio" id="piano4" name="proType_piano" value="기타">
						<label for=piano4>기타</label><br>
					</div>
					<div class="modal-footer">
						<div align="center">
							<input type="button" value="확인" onclick="sendValue();">
						</div>
					</div>
				</div>	
				<% for(Request r2 : list){ %>
					<input type="hidden" name="rNo[]" value="<%=r2.getReqNo() %>">
					<input type="hidden" name="pNo[]" value="<%=r2.getProNo() %>">
					<input type="hidden" name="pName[]" value="<%=r2.getProName() %>">		
				<% } %>		
			</div>
		</form>
	</div>
	
	<script>		
		/* function sendValue(){			
			
			var proType_ref = $("input[name=proType_ref]:checked").val()
			var proType_wash = $("input[name=proType_wash]:checked").val();		
			var proType_air = $("input[name=proType_air]:checked").val();		
			var proType_pc = $("input[name=proType_pc]:checked").val();		
			var proType_oven = $("input[name=proType_oven]:checked").val();		
			var proType_bed = $("input[name=proType_bed]:checked").val();		
			var proType_chair = $("input[name=proType_chair]:checked").val();		
			var proType_table = $("input[name=proType_table]:checked").val();		
			var proType_clo = $("input[name=proType_clo]:checked").val();		
			var proType_hang = $("input[name=proType_hang]:checked").val();		
			var proType_mir = $("input[name=proType_mir]:checked").val();		
			var proType_make = $("input[name=proType_make]:checked").val();		
			var proType_piano = $("input[name=proType_piano]:checked").val();		
			
			var a = new Array(proType_ref, proType_wash, proType_air, proType_pc, proType_oven, proType_bed, proType_chair, proType_table, proType_clo, proType_hang, proType_mir, proType_make, proType_piano);
			var proType = new Array();
			
			for(var i = 0; i < a.length; i++){
				if(a[i] != null){
					proType.push(a[i]);
				}
			}			
			
			$(document).find("#popVal").val(proType);
			
		} */		
	</script>
</body>
</html>