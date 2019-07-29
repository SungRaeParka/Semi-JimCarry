<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jimcarry.request.model.vo.*, java.util.*"%>
<%
	Product r = (Product) session.getAttribute("r");
	
	String[] proKind = r.getProKind().split(", ");
	String[] proName = r.getProName().split(", ");	
	
	int bookCount = r.getBookCount();
	int boxCount = r.getBoxCount(); 
	
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
	<form action="<%=request.getContextPath()%>/updateAll.pr" method="post" id="frm">
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
		
		<div style="padding-left: 20px" id="refDiv">
			<input type="hidden" name="reqNo" value="<%=r.getReqNo()%>">
			<input type="hidden" name="proNo" value="<%=r.getProNo()%>">
			<input type="hidden" name="proName" value="<%=r.getProName()%>">
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
					<span class="refDetailInfo">상세 정보</span>
					<% }else if(proName[i].equals("세탁기")){%>
					<span id="proName" data-toggle="modal" data-target="#pop_wash" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span class="washDetailInfo">상세 정보</span>					
					<% }else if(proName[i].equals("TV/모니터")){%>
					<span id="proName" data-toggle="modal" data-target="#pop_tv" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span class="tvDetailInfo">상세 정보</span>					
					<% }else if(proName[i].equals("에어컨")){%>	
					<span id="proName" data-toggle="modal" data-target="#pop_air" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span class="airDetailInfo">상세 정보</span>				
					<% }else if(proName[i].equals("정수기")){%>	
					<span id="proName" data-toggle="modal" data-target="#pop_water" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span class="waterDetailInfo">상세 정보</span>				
					<% }else if(proName[i].equals("PC/노트북")){%>
					<span id="proName" data-toggle="modal" data-target="#pop_pc" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span class="pcDetailInfo">상세 정보</span>					
					<% }else if(proName[i].equals("전자레인지")){%>
					<span id="proName" data-toggle="modal" data-target="#pop_oven" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span class="ovenDetailInfo">상세 정보</span>					
					<% } %>						
				</div>				
			</div>
			
		</div>
		<% } else if(proKind[i].equals("가구") && (proName[i].equals("침대") || proName[i].equals("의자") || proName[i].equals("책상/테이블") || proName[i].equals("책장") || proName[i].equals("옷장") || proName[i].equals("진열장") || proName[i].equals("쇼파") || proName[i].equals("행거") || proName[i].equals("거울") || proName[i].equals("화장대") || proName[i].equals("피아노"))) { %>
			
		<div style="padding-left: 20px">
			<input type="hidden" name="reqNo" value="<%=r.getReqNo()%>">
			<input type="hidden" name="proNo" value="<%=r.getProNo()%>">
			<input type="hidden" name="proName" value="<%=r.getProName()%>">
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
					<span class="bedDetailInfo">상세 정보</span>
					<%}else if(proName[i].equals("의자")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_chair" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span class="chairDetailInfo">상세 정보</span>
					<%}else if(proName[i].equals("책상/테이블")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_table" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span class="tableDetailInfo">상세 정보</span>
					<%}else if(proName[i].equals("책장")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_bookcase" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span class="bcDetailInfo">상세 정보</span>
					<%}else if(proName[i].equals("옷장")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_closet" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span class="cloDetailInfo">상세 정보</span>
					<%}else if(proName[i].equals("진열장")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_showcase" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span class="scDetailInfo">상세 정보</span>
					<%}else if(proName[i].equals("쇼파")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_sofa" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span class="sofaDetailInfo">상세 정보</span>
					<%}else if(proName[i].equals("행거")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_hanger" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span class="hangDetailInfo">상세 정보</span>
					<%}else if(proName[i].equals("거울")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_mirror" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span class="mirDetailInfo">상세 정보</span>
					<%}else if(proName[i].equals("화장대")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_makeup" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span class="makeDetailInfo">상세 정보</span>
					<%}else if(proName[i].equals("피아노")){ %>
					<span id="proName" data-toggle="modal" data-target="#pop_piano" style="font-size: 35px; font-weight: bold"><%=proName[i]%></span><br>
					<span class="pianoDetailInfo">상세 정보</span>
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
					<img src="/semi/images/books.png" style="width: 140px; height: 140px">
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
				<textarea placeholder="요청사항 및 특이사항을 입력하세요." style="width: 300px; height: 200px;" name="memo"></textarea>
			</div>
		</div>
		
		<hr>
		
		<div align="center" style="margin-bottom: 10px">
			<input type="hidden" id="popVal" name="popVal">
			<a href="req_ProSelect.jsp" style="text-decoration: none">
				<span style="font-size: 30px">뒤로가기</span>	
			</a>
			<span id="updateProDetail" onclick="updateProDetail();" style="font-size: 30px; cursor: pointer;" >다음 단계로</span>	
		</div>
		<div class="hiddenArea">
		
		</div>
	</form>	
	</div>
	<!-- 팝업창 -->
	<!-- 팝업창 -->
	<!-- 팝업창 -->
	<!-- 팝업창 -->
	
	<div>
		<!-- 냉장고 팝업창 -->	
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
							<input type="button" value="확인" id="updateRef">
						</div>
					</div>
				</div>
			</div>
	
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
							<input type="button" value="확인" id="updateWash">
						</div>
					</div>
				</div>
			</div>
			
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
							<input type="button" value="확인" id="updateTv">
						</div>
					</div>
				</div>
			</div>
			
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
							<input type="button" value="확인" id="updateAir">
						</div>
					</div>
				</div>
			</div>
			
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
							<input type="button" value="확인" id="updateWater">
						</div>
					</div>
				</div>
			</div>
			
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
							<input type="button" value="확인" id="updatePc">
						</div>
					</div>
				</div>
			</div>
			
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
							<input type="button" value="확인" id="updateOven">
						</div>
					</div>
				</div>
			</div>
			
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
							<input type="button" value="확인" id="updateBed">
						</div>
					</div>
				</div>
			</div>
			
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
							<input type="button" value="확인" id="updateChair">
						</div>
					</div>
				</div>
			</div>
			
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
							<input type="button" value="확인" id="updateTable">
						</div>
					</div>
				</div>
			</div>
			
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
							<input type="button" value="확인" id="updateBc">
						</div>
					</div>
				</div>
			</div>
			
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
							<input type="button" value="확인" id="updateClo">
						</div>
					</div>
				</div>
			</div>
			
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
							<input type="button" value="확인" id="updateSc">
						</div>
					</div>
				</div>
			</div>
			
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
							<input type="button" value="확인" id="updateSofa">
						</div>
					</div>
				</div>
			</div>
			
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
							<input type="button" value="확인" id="updateHang">
						</div>
					</div>
				</div>
			</div>
			
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
							<input type="button" value="확인" id="updateMir">
						</div>
					</div>
				</div>
			</div>
			
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
							<input type="button" value="확인" id="updateMake">
						</div>
					</div>
				</div>
			</div>
			
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
							<input type="button" value="확인" id="updatePiano">
						</div>
					</div>
				</div>	
			</div>
	</div>
	
	
	
	<script>
		function updateProDetail(){
			$("#frm").submit();
		}		
	
		/* 냉장고 */
		 $("#updateRef").click(function() {			 
				 
			var $div = $(".hiddenArea");			
			var $div2 = $("<div>");
			var $inputRefType = $("<input>");
			var $inputRefSize = $("<input>");
			var proType_refval = $(":input:radio[name=proType_ref]:checked").val();
			var proSize_refval = $(":input:radio[name=proSize_ref]:checked").val();					
				
			$inputRefType.attr({
				type: 'hidden',
				name: 'proType_Ref2',
				value: proType_refval
			});
				
			$inputRefSize.attr({
				type: 'hidden',
				name: 'proSize_Ref2',
				value: proSize_refval
			});
	
			$div.html("");				
			
			$div2.append($inputRefType);
			$div2.append($inputRefSize);	
			$div.before($div2);			
			
			$(":input:radio[name=proType_ref]").prop('checked', false);
			$(":input:radio[name=proSize_ref]").prop('checked', false);				
			
			$(function(){
				var i = 0;
				$(".refDetailInfo").eq(i).html(proType_refval + ", " + proSize_refval);
				
				$(document).on("click", "#updateRef", function(event){
					i = i + 1;
					$(".refDetailInfo").eq(i).html(proType_refval + ", " + proSize_refval);
				})	
			});	
			
			$("#pop_ref").modal("hide");		
		});
		
		$("#updateWash").click(function(){
			
			var $div = $(".hiddenArea");
			var $div2 = $("<div>");
			var $inputWashType = $("<input>");
			var $inputWashSize = $("<input>");
			var proType_washval = $(":input:radio[name=proType_wash]:checked").val();
			var proSize_washval = $(":input:radio[name=proSize_wash]:checked").val();
			
			$inputWashType.attr({
				type: 'hidden',
				name: 'proType_Wash2',
				value: proType_washval
			});
			
			$inputWashSize.attr({
				type: 'hidden',
				name: 'proSize_Wash2',
				value: proSize_washval
			});
			
			$div.html("");				
			
			$div2.append($inputWashType);
			$div2.append($inputWashSize);	
			$div.before($div2);
				
			$(":input:radio[name=proType_wash]").prop('checked', false);
			$(":input:radio[name=proSize_wash]").prop('checked', false);
			
			$(function(){
				var i = 0;
				$(".washDetailInfo").eq(i).html(proType_washval + ", " + proSize_washval);
				
				$(document).on("click", "#updateWash", function(event){
					i = i + 1;
					$(".washDetailInfo").eq(i).html(proType_washval + ", " + proSize_washval);
				})	
			});				
				
			$("#pop_wash").modal("hide");
			
		});
		
		$("#updateTv").click(function(){
			
			var $div = $(".hiddenArea");
			var $div2 = $("<div>");
			var $inputTvSize = $("<input>");
			var proSize_tvval = $(":input:radio[name=proSize_tv]:checked").val();
			
			$inputTvSize.attr({
				type: 'hidden',
				name: 'proSize_Tv2',
				value: proSize_tvval
			});			
			
			$div.html("");				
			
			$div2.append($inputTvSize);
			$div.before($div2);
				
			$(":input:radio[name=proSize_tv]").prop('checked', false);
			
			$(function(){
				var i = 0;
				$(".tvDetailInfo").eq(i).html(proSize_tvval);
				
				$(document).on("click", "#updateTv", function(event){
					i = i + 1;
					$(".tvDetailInfo").eq(i).html(proSize_tvval);
				})	
			});		
			
			$("#pop_tv").modal("hide");			
		});
		
		$("#updateAir").click(function(){
			
			var $div = $(".hiddenArea");
			var $div2 = $("<div>");
			var $inputAirType = $("<input>");
			var $inputAirUni = $("<input>");
			var proType_airval = $(":input:radio[name=proType_air]:checked").val();
			var proUni_airval = $(":input:radio[name=proUni_air]:checked").val();
			
			$inputAirType.attr({
				type: 'hidden',
				name: 'proType_Air2',
				value: proType_airval
			});
			
			$inputAirUni.attr({
				type: 'hidden',
				name: 'proUni_Air2',
				value: proUni_airval
			});
			
			$div.html("");				
			
			$div2.append($inputAirType);
			$div2.append($inputAirUni);	
			$div.before($div2);
				
			$(":input:radio[name=proType_air]").prop('checked', false);
			$(":input:radio[name=proUni_air]").prop('checked', false);
			
			$(function(){
				var i = 0;
				$(".airDetailInfo").eq(i).html(proType_airval + ", " + proUni_airval);
				
				$(document).on("click", "#updateAir", function(event){
					i = i + 1;
					$(".airDetailInfo").eq(i).html(proType_airval + ", " + proUni_airval);
				})	
			});	
				
			$("#pop_air").modal("hide");
			
		});
		
		$("#updateWater").click(function(){
			
			var $div = $(".hiddenArea");
			var $div2 = $("<div>");
			var $inputWaterSize = $("<input>");
			var $inputWaterUni = $("<input>");
			var proSize_waterval = $(":input:radio[name=proSize_water]:checked").val();
			var proUni_waterval = $(":input:radio[name=proUni_water]:checked").val();
			
			$inputWaterSize.attr({
				type: 'hidden',
				name: 'proSize_Water2',
				value: proSize_waterval
			});
			
			$inputWaterUni.attr({
				type: 'hidden',
				name: 'proUni_Water2',
				value: proUni_waterval
			});
			
			$div.html("");				
			
			$div2.append($inputWaterSize);
			$div2.append($inputWaterUni);	
			$div.before($div2);
				
			$(":input:radio[name=proSize_water]").prop('checked', false);
			$(":input:radio[name=proUni_water]").prop('checked', false);
			
			$(function(){
				var i = 0;
				$(".waterDetailInfo").eq(i).html(proSize_waterval + ", " + proUni_waterval);
				
				$(document).on("click", "#updateWater", function(event){
					i = i + 1;
					$(".waterDetailInfo").eq(i).html(proSize_waterval + ", " + proUni_waterval);
				})	
			});	
				
			$("#pop_water").modal("hide");
			
		});
		
		$("#updatePc").click(function(){
			
			var $div = $(".hiddenArea");
			var $div2 = $("<div>");
			var $inputPcType = $("<input>");
			var proType_pcval = $(":input:radio[name=proType_pc]:checked").val();
			
			$inputPcType.attr({
				type: 'hidden',
				name: 'proType_Pc2',
				value: proType_pcval
			});
			
			$div.html("");				
			
			$div2.append($inputPcType);
			$div.before($div2);
				
			$(":input:radio[name=proType_pc]").prop('checked', false);
			
			$(function(){
				var i = 0;
				$(".pcDetailInfo").eq(i).html(proType_pcval);
				
				$(document).on("click", "#updatePc", function(event){
					i = i + 1;
					$(".pcDetailInfo").eq(i).html(proType_pcval);
				})	
			});	
				
			$("#pop_pc").modal("hide");
			
		});
		
		$("#updateOven").click(function(){
			
			var $div = $(".hiddenArea");
			var $div2 = $("<div>");
			var $inputOvenType = $("<input>");
			var proType_ovenval = $(":input:radio[name=proType_oven]:checked").val();
			
			$inputOvenType.attr({
				type: 'hidden',
				name: 'proType_Oven2',
				value: proType_ovenval
			});
			
			$div.html("");				
			
			$div2.append($inputOvenType);
			$div.before($div2);
				
			$(":input:radio[name=proType_oven]").prop('checked', false);
			
			$(function(){
				var i = 0;
				$(".ovenDetailInfo").eq(i).html(proType_ovenval);
				
				$(document).on("click", "#updateOven", function(event){
					i = i + 1;
					$(".ovenDetailInfo").eq(i).html(proType_ovenval);
				})	
			});	
				
			$("#pop_oven").modal("hide");
			
		});
		
		$("#updateBed").click(function(){
			
			var $div = $(".hiddenArea");
			var $div2 = $("<div>");
			var $inputBedType = $("<input>");
			var $inputBedSize = $("<input>");
			var proType_bedval = $(":input:radio[name=proType_bed]:checked").val();
			var proSize_bedval = $(":input:radio[name=proSize_bed]:checked").val();
			
			$inputBedType.attr({
				type: 'hidden',
				name: 'proType_Bed2',
				value: proType_bedval
			});
			
			$inputBedSize.attr({
				type: 'hidden',
				name: 'proSize_Bed2',
				value: proSize_bedval
			});
			
			$div.html("");				
			
			$div2.append($inputBedType);
			$div2.append($inputBedSize);
			$div.before($div2);
				
			$(":input:radio[name=proType_bed]").prop('checked', false);
			$(":input:radio[name=proSize_bed]").prop('checked', false);
			
			$(function(){
				var i = 0;
				$(".bedDetailInfo").eq(i).html(proType_bedval + ", " + proSize_bedval);
				
				$(document).on("click", "#updateBed", function(event){
					i = i + 1;
					$(".bedDetailInfo").eq(i).html(proType_bedval + ", " + proSize_bedval);
				})	
			});	
				
			$("#pop_bed").modal("hide");
			
		});
		
		$("#updateChair").click(function(){
			
			var $div = $(".hiddenArea");
			var $div2 = $("<div>");
			var $inputChairType = $("<input>");
			var proType_chairval = $(":input:radio[name=proType_chair]:checked").val();
			
			$inputChairType.attr({
				type: 'hidden',
				name: 'proType_Chair2',
				value: proType_chairval
			});
			
			$div.html("");				
			
			$div2.append($inputChairType);
			$div.before($div2);
				
			$(":input:radio[name=proType_chair]").prop('checked', false);
			
			$(function(){
				var i = 0;
				$(".chairDetailInfo").eq(i).html(proType_chairval);
				
				$(document).on("click", "#updateChair", function(event){
					i = i + 1;
					$(".chairDetailInfo").eq(i).html(proType_chairval);
				})	
			});	
				
			$("#pop_chair").modal("hide");
			
		});
		
		$("#updateTable").click(function(){
			
			var $div = $(".hiddenArea");
			var $div2 = $("<div>");
			var $inputTableType = $("<input>");
			var $inputTableSize = $("<input>");
			var $inputTableMat = $("<input>");
			var $inputTableWidth = $("<input>");
			var proType_tableval = $(":input:radio[name=proType_table]:checked").val();
			var proSize_tableval = $(":input:radio[name=proSize_table]:checked").val();
			var proMat_tableval = $(":input:radio[name=proMat_table]:checked").val();
			var proWidth_tableval = $(":input:radio[name=proWidth_table]:checked").val();
			
			$inputTableType.attr({
				type: 'hidden',
				name: 'proType_Table2',
				value: proType_tableval
			});
			
			$inputTableSize.attr({
				type: 'hidden',
				name: 'proSize_Table2',
				value: proSize_tableval
			});
			
			$inputTableMat.attr({
				type: 'hidden',
				name: 'proMat_Table2',
				value: proMat_tableval
			});
			
			$inputTableWidth.attr({
				type: 'hidden',
				name: 'proWidth_Table2',
				value: proWidth_tableval
			});
			
			$div.html("");				
			
			$div2.append($inputTableType);
			$div2.append($inputTableSize);
			$div2.append($inputTableMat);
			$div2.append($inputTableWidth);
			$div.before($div2);
				
			$(":input:radio[name=proType_table]").prop('checked', false);
			$(":input:radio[name=proSize_table]").prop('checked', false);
			$(":input:radio[name=proMat_table]").prop('checked', false);
			$(":input:radio[name=proWidth_table]").prop('checked', false);
			
			$(function(){
				var i = 0;
				$(".tableDetailInfo").eq(i).html(proType_tableval + ", " + proSize_tableval + ", " + proMat_tableval + ", " + proWidth_tableval);
				
				$(document).on("click", "#updateTable", function(event){
					i = i + 1;
					$(".tableDetailInfo").eq(i).html(proType_tableval + ", " + proSize_tableval + ", " + proMat_tableval + ", " + proWidth_tableval);
				})	
			});	
				
			$("#pop_table").modal("hide");
			
		});
		
		$("#updateBc").click(function(){
			
			var $div = $(".hiddenArea");
			var $div2 = $("<div>");
			var $inputBcWidth = $("<input>");
			var $inputBcHeight = $("<input>");
			var proWidth_bcval = $(":input:radio[name=proWidth_bc]:checked").val();
			var proHeight_bcval = $(":input:radio[name=proHeight_bc]:checked").val();
			
			$inputBcWidth.attr({
				type: 'hidden',
				name: 'proWidth_Bc2',
				value: proWidth_bcval
			});
			
			$inputBcHeight.attr({
				type: 'hidden',
				name: 'proHeight_Bc2',
				value: proHeight_bcval
			});
			
			$div.html("");				
			
			$div2.append($inputBcWidth);
			$div2.append($inputBcHeight);
			$div.before($div2);
				
			$(":input:radio[name=proWidth_bc]").prop('checked', false);
			$(":input:radio[name=proHeight_bc]").prop('checked', false);
			
			$(function(){
				var i = 0;
				$(".bcDetailInfo").eq(i).html(proWidth_bcval + ", " + proHeight_bcval);
				
				$(document).on("click", "#updateBc", function(event){
					i = i + 1;
					$(".bctableDetailInfo").eq(i).html(proWidth_bcval + ", " + proHeight_bcval);
				})	
			});	
				
			$("#pop_bookcase").modal("hide");
			
		});
		
		$("#updateClo").click(function(){
			
			var $div = $(".hiddenArea");
			var $div2 = $("<div>");
			var $inputCloType = $("<input>");
			var $inputCloUni = $("<input>");
			var $inputCloWidth = $("<input>");
			var proType_cloval = $(":input:radio[name=proType_clo]:checked").val();
			var proUni_cloval = $(":input:radio[name=proUni_clo]:checked").val();
			var proWidth_cloval = $(":input:radio[name=proWidth_clo]:checked").val();
			
			$inputCloType.attr({
				type: 'hidden',
				name: 'proType_Clo2',
				value: proType_cloval
			});
			
			$inputCloUni.attr({
				type: 'hidden',
				name: 'proUni_Clo2',
				value: proUni_cloval
			});
			
			$inputCloWidth.attr({
				type: 'hidden',
				name: 'proWidth_Clo2',
				value: proWidth_cloval
			});
			
			$div.html("");				
			
			$div2.append($inputCloType);
			$div2.append($inputCloUni);
			$div2.append($inputCloWidth);
			$div.before($div2);
				
			$(":input:radio[name=proType_clo]").prop('checked', false);
			$(":input:radio[name=proUni_clo]").prop('checked', false);
			$(":input:radio[name=proWidth_clo]").prop('checked', false);
			
			$(function(){
				var i = 0;
				$(".cloDetailInfo").eq(i).html(proType_cloval + ", " + proUni_cloval + ", " + proWidth_cloval);
				
				$(document).on("click", "#updateClo", function(event){
					i = i + 1;
					$(".cloDetailInfo").eq(i).html(proType_cloval + ", " + proUni_cloval + ", " + proWidth_cloval);
				})	
			});	
				
			$("#pop_closet").modal("hide");
			
		});
		
		$("#updateSc").click(function(){
			
			var $div = $(".hiddenArea");
			var $div2 = $("<div>");
			var $inputScgck = $("<input>");
			var $inputScWidth = $("<input>");
			var $inputScHeight = $("<input>");
			var proGck_scval = $(":input:radio[name=glassCheck_sc]:checked").val();
			var proWidth_scval = $(":input:radio[name=proWidth_sc]:checked").val();
			var proHeight_scval = $(":input:radio[name=proHeight_sc]:checked").val();
			
			$inputScgck.attr({
				type: 'hidden',
				name: 'proGck_Sc2',
				value: proGck_scval
			});
			
			$inputScWidth.attr({
				type: 'hidden',
				name: 'proWidth_Sc2',
				value: proWidth_scval
			});
			
			$inputScHeight.attr({
				type: 'hidden',
				name: 'proHeight_Sc2',
				value: proHeight_scval
			});
			
			$div.html("");				
			
			$div2.append($inputScgck);
			$div2.append($inputScWidth);
			$div2.append($inputScHeight);
			$div.before($div2);
				
			$(":input:radio[name=glassCheck_sc]").prop('checked', false);
			$(":input:radio[name=proWidth_sc]").prop('checked', false);
			$(":input:radio[name=proHeight_sc]").prop('checked', false);
			
			$(function(){
				var i = 0;
				$(".scDetailInfo").eq(i).html(proGck_scval + ", " + proWidth_scval + ", " + proHeight_scval);
				
				$(document).on("click", "#updateSc", function(event){
					i = i + 1;
					$(".scDetailInfo").eq(i).html(proGck_scval + ", " + proWidth_scval + ", " + proHeight_scval);
				})	
			});	
				
			$("#pop_showcase").modal("hide");
			
		});
		
		$("#updateSofa").click(function(){
			
			var $div = $(".hiddenArea");
			var $div2 = $("<div>");
			var $inputSofaSize = $("<input>");
			var proSize_sofaval = $(":input:radio[name=proSize_sofa]:checked").val();
			
			$inputSofaSize.attr({
				type: 'hidden',
				name: 'proSize_Sofa2',
				value: proSize_sofaval
			});
			
			$div.html("");				
			
			$div2.append($inputSofaSize);
			$div.before($div2);
				
			$(":input:radio[name=proSize_sofa]").prop('checked', false);
			
			$(function(){
				var i = 0;
				$(".sofaDetailInfo").eq(i).html(proSize_sofaval);
				
				$(document).on("click", "#updateSofa", function(event){
					i = i + 1;
					$(".sofaDetailInfo").eq(i).html(proSize_sofaval);
				})	
			});	
				
			$("#pop_sofa").modal("hide");
			
		});
		
		$("#updateHang").click(function(){
			
			var $div = $(".hiddenArea");
			var $div2 = $("<div>");
			var $inputHangType = $("<input>");
			var $inputHangWidth = $("<input>");
			var proType_hangval = $(":input:radio[name=proType_hang]:checked").val();
			var proWidth_hangval = $(":input:radio[name=proWidth_hang]:checked").val();
			
			$inputHangType.attr({
				type: 'hidden',
				name: 'proType_Hang2',
				value: proType_hangval
			});
			
			$inputHangWidth.attr({
				type: 'hidden',
				name: 'proWidth_Hang2',
				value: proWidth_hangval
			});
			
			$div.html("");				
			
			$div2.append($inputHangType);
			$div2.append($inputHangWidth);
			$div.before($div2);
				
			$(":input:radio[name=proType_hang]").prop('checked', false);
			$(":input:radio[name=proWidth_hang]").prop('checked', false);
			
			$(function(){
				var i = 0;
				$(".hangDetailInfo").eq(i).html(proType_hangval + ", " + proWidth_hangval);
				
				$(document).on("click", "#updateHang", function(event){
					i = i + 1;
					$(".hangDetailInfo").eq(i).html(proType_hangval + ", " + proWidth_hangval);
				})	
			});	
				
			$("#pop_hanger").modal("hide");
			
		});
		
		$("#updateMir").click(function(){
			
			var $div = $(".hiddenArea");
			var $div2 = $("<div>");
			var $inputMirType = $("<input>");
			var $inputMirSize = $("<input>");
			var proType_mirval = $(":input:radio[name=proType_mir]:checked").val();
			var proSize_mirval = $(":input:radio[name=proSize_mir]:checked").val();
			
			$inputMirType.attr({
				type: 'hidden',
				name: 'proType_Mir2',
				value: proType_mirval
			});
			
			$inputMirSize.attr({
				type: 'hidden',
				name: 'proSize_Mir2',
				value: proSize_mirval
			});
			
			$div.html("");				
			
			$div2.append($inputMirType);
			$div2.append($inputMirSize);	
			$div.before($div2);
				
			$(":input:radio[name=proType_mir]").prop('checked', false);
			$(":input:radio[name=proSize_mir]").prop('checked', false);
			
			$(function(){
				var i = 0;
				$(".mirDetailInfo").eq(i).html(proType_mirval + ", " + proSize_mirval);
				
				$(document).on("click", "#updateMir", function(event){
					i = i + 1;
					$(".mirDetailInfo").eq(i).html(proType_mirval + ", " + proSize_mirval);
				})	
			});	
				
			$("#pop_mirror").modal("hide");
			
		});
		
		$("#updateMake").click(function(){
			
			var $div = $(".hiddenArea");
			var $div2 = $("<div>");
			var $inputMakeType = $("<input>");
			var $inputMakeMat = $("<input>");
			var proType_makeval = $(":input:radio[name=proType_make]:checked").val();
			var proMat_makeval = $(":input:radio[name=proMat_make]:checked").val();
			
			$inputMakeType.attr({
				type: 'hidden',
				name: 'proType_Make2',
				value: proType_makeval
			});
			
			$inputMakeMat.attr({
				type: 'hidden',
				name: 'proMat_Make2',
				value: proMat_makeval
			});
			
			$div.html("");				
			
			$div2.append($inputMakeType);
			$div2.append($inputMakeMat);	
			$div.before($div2);
				
			$(":input:radio[name=proType_make]").prop('checked', false);
			$(":input:radio[name=proMat_make]").prop('checked', false);
			
			$(function(){
				var i = 0;
				$(".makeDetailInfo").eq(i).html(proType_makeval + ", " + proMat_makeval);
				
				$(document).on("click", "#updateMake", function(event){
					i = i + 1;
					$(".makeDetailInfo").eq(i).html(proType_makeval + ", " + proMat_makeval);
				})	
			});	
				
			$("#pop_makeup").modal("hide");
			
		});
		
		$("#updatePiano").click(function(){
			
			var $div = $(".hiddenArea");
			var $div2 = $("<div>");
			var $inputPianoType = $("<input>");
			var proType_pianoval = $(":input:radio[name=proType_piano]:checked").val();
			
			$inputPianoType.attr({
				type: 'hidden',
				name: 'proType_Piano2',
				value: proType_pianoval
			});
			
			$div.html("");				
			
			$div2.append($inputPianoType);
			$div.before($div2);
				
			$(":input:radio[name=proType_piano]").prop('checked', false);
			
			$(function(){
				var i = 0;
				$(".pianoDetailInfo").eq(i).html(proType_pianoval);
				
				$(document).on("click", "#updatePiano", function(event){
					i = i + 1;
					$(".pianoDetailInfo").eq(i).html(proType_pianoval);
				})	
			});	
				
			$("#pop_piano").modal("hide");
			
		});
	</script>
	
	
</body>
</html>















































