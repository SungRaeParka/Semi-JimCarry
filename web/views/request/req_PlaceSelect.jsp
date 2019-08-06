<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jimcarry.request.model.vo.*, java.util.*"%>
	
<%
	Product p = (Product) session.getAttribute("p");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출발지 도착지 선택</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 <link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
 <script>
 	$(function(){
		$("#insertPIMG").click(function(event){			
			
			var form = $("#insertPIMGForm")[0];
			
			var data = new FormData(form);
			
			$.ajax({
				type: "post",				
				url: "<%=request.getContextPath()%>/insertPIMG.rq",
				data: data,
				processData: false,
				contentType: false,				
				success: function(data){
					console.log("성공!");				
				},
				error: function(){
					console.log("실패!");
				}
			});	
		});
 	});
 </script>
<style>
  
  #imgs{
  	width: auto; height: auto;
    max-width: 50px;
    max-height: 50px;
  }
  #att{
  	padding-top:20px;
  	padding-left:170px;
  	color:gray;
  }
  
  .selectInfo{ 
  	cursor: pointer;
  	font-size: 20px;
  	display: block;
  	float: right;
  	padding-right: 200px;
  	padding-top: 15px;
  }
  
  .container{
  	padding-left:330px;
  }
  
  #productImgArea1, #productImgArea2, #productImgArea3, #productImgArea4, #productImgArea5{
  	display: table-cell;
  	padding-left: 2px;
  }
  
   #productImgArea1:hover, #productImgArea2:hover, #productImgArea3:hover, #productImgArea4:hover, #productImgArea5:hover{
   	cursor: pointer;
   }
   
   span {
   	font-family: 'Sunflower', sans-serif;
   }
  
</style>

</head>
<body>

	<%@ include file="/views/common/user_TopBar.jsp" %>


	<div id="main">
		<div style="padding-top: 30%; padding-left: 20px;">
			<span style="font-size: 45px; font-weight: bold">출발지, 도착지, 날짜를 선택하세요.</span><br>
			<span>상세정보입력을 클릭하시면 주소를 검색할 수 있습니다.</span>
		</div>
		
		<hr>
				
		<div align="center">
			<table>
				<tr>
					<td><label>물품 선택</label></td>
					<td><label> → </label></td>
					<td><label>물품 상세 정보 선택</label></td>						
					<td><label> → </label></td>
					<td><label style="font-size: 30px; font-weight: bold;">장소, 날짜 선택</label></td>
					</tr>	
			</table>
		</div>		
		
		<hr>
		<form action="<%=request.getContextPath() %>/insertreq.rq" method ="post" id="firstForm">
			<div style="padding-left: 50px; padding-top: 10px; padding-bottom: 50px;">
				<input type="hidden" id="reqNo" name="reqNo" value="<%=p.getReqNo()%>">
				<input type="hidden" id="proNo" name="proNo" value="<%=p.getProNo()%>">
				<input type="hidden" id="memberNo" name="memberNo" value="<%=loginUser.getSeqNo()%>">
				<input type="hidden" id="memo" name="memo" value="<%=p.getMemo()%>">
				<input type="hidden" id="spInfo" name="spInfo">
				<div style="float: left">		
					<img src="/semi/images/pointer.PNG" id="imgs">				
				</div>
				<div>
					<span style="font-size: 30px; font-weight: bold">출발지 정보</span>
					<span>출발지를 선택하세요.</span>	
				</div>
				<div style="padding-top: 10px; float: left;">
					<span id="showStartPlace"></span><br>
					<span id="showSPDetail"></span>
				</div>
				<div>
					<span class="selectInfo" onclick="selectStartPlace()">상세정보입력</span>
				</div>
			</div>
			
			<hr>
	
			<div style="padding-left: 50px; padding-top: 10px; padding-bottom: 50px;">
				<input type="hidden" id="apInfo" name="apInfo">
				<div style="float: left">		
					<img src="/semi/images/pointer.PNG" id="imgs">				
				</div>
				<div>
					<span style="font-size: 30px; font-weight: bold">도착지 정보</span>	
					<span>도착지를 선택하세요.</span>	
				</div>
				<div style="padding-top: 10px; float: left;">
					<span id="showArrivePlace"></span><br>
					<span id="showAPDetail"></span>
				</div>
				<div>
					<span class="selectInfo" onclick="selectArrivePlace()">상세정보입력</span>
				</div>
			</div>
			
			<hr>
	
			<div style="padding-left: 50px; padding-top: 10px; padding-bottom: 50px;">
				<input type="hidden" id="dateInfo" name="dateInfo">
				<input type="hidden" id="timeInfo" name="timeInfo">
				<div style="float: left">		
					<img src="/semi/images/cal.PNG" id="imgs">				
				</div>
				<div>
					<span style="font-size: 30px; font-weight: bold">날짜,시간 선택</span>	
					<span>이용하실 날짜와 시간을 선택하세요.</span>	
				</div>
				<div style="padding-top: 10px; float: left;">
					<span id="showSelectDate"></span>
				</div>
				<div>
					<span class="selectInfo" onclick="selectDate()">상세정보입력</span>
				</div>
			</div>
			
			<hr>
			
			<div style="padding-left: 50px; padding-top: 10px; padding-bottom: 50px;">
				<div style="float: left">		
					<img src="/semi/images/imgatt.PNG" id="imgs">				
				</div>
				<div>
					<span style="font-size: 30px; font-weight: bold">견적 입찰 기간</span>
					<span>견적을 받을 일수를 선택하세요.</span>	
				</div>
				<div>
					<input type="radio" id="date1" name="finishDate" value="1"> 
					<label for="date1">1일</label>&emsp;&emsp; 
					<input type="radio" id="date2" name="finishDate" value="2"> 
					<label for="date2">2일</label> &emsp;&emsp; 
					<input type="radio" id="date3" name="finishDate" value="3"> 
					<label for="date3">3일</label>
				</div>
			</div>
		</form>
		
			<hr>
						
		<form id="insertPIMGForm" action="<%=request.getContextPath()%>/insertPIMG.rq" method="post" encType="multipart/form-data">	
			<div style="padding-left: 50px; padding-top: 10px; padding-bottom: 50px;">
				<div style="float: left">		
					<img src="/semi/images/imgatt.PNG" id="imgs">				
				</div>
				<div>
					<span style="font-size: 30px; font-weight: bold">사진 첨부</span>
					<span>상세한 짐 사진을 올려주세요.</span>
					<input style="margin-left: 120px;" type="button" id="insertPIMG" value="사진 업로드">
				</div>
				<div style="padding-top: 10px;">
					<div id="productImgArea1">
						<img id="productImg1" width="120" height="120">
					</div>
					<div id="productImgArea2">
				  		<img id="productImg2" width="120" height="120">
					</div>
					<div id="productImgArea3">
						<img id="productImg3" width="120" height="120">
					</div>
					<div id="productImgArea4">
						<img id="productImg4" width="120" height="120">
					</div>
					<div id="productImgArea5">
						<img id="productImg5" width="120" height="120">
					</div>
				</div>
				<div id="fileArea">
					<input type="file" id="thumbnailImg1" name="thumbnailImg1" onchange="loadImg(this, 1)">
					<input type="file" id="thumbnailImg2" name="thumbnailImg2" onchange="loadImg(this, 2)">
					<input type="file" id="thumbnailImg3" name="thumbnailImg3" onchange="loadImg(this, 3)">
					<input type="file" id="thumbnailImg4" name="thumbnailImg4" onchange="loadImg(this, 4)">
					<input type="file" id="thumbnailImg5" name="thumbnailImg5" onchange="loadImg(this, 5)">
				</div>
			</div>
		</form>
						
			<hr>
			
			<div align="center" style="margin-bottom: 10px">
				<a href="req_ProDetailSelect.jsp" style="text-decoration: none">
					<span style="font-size: 30px">뒤로가기</span>	
				</a>
					<span style="font-size: 30px; cursor: pointer; padding-left: 30px" onclick="insertReq()">다음 단계로</span>	
			</div>				
		
	</div>
	
	<script>	 
		function selectStartPlace(){
			var url = "/semi/views/popup/pop_StartPlace.jsp";
			var winWidth = 400;
			var winHeight = 530;
			var popupW = (screen.availWidth - winWidth) / 2;
			var popupH = (screen.availHeight - winHeight) / 2;			
			var popOption = "status=no, width=" + winWidth + ", height=" + winHeight + ", top=" + popupH + ", left=" + popupW;			
			
			window.open(url,"",popOption);
		}
		
		function selectArrivePlace(){
			var url = "/semi/views/popup/pop_ArrivePlace.jsp";
			var winWidth = 400;
			var winHeight = 530;
			var popupW = (screen.availWidth - winWidth) / 2;
			var popupH = (screen.availHeight - winHeight) / 2;			
			var popOption = "status=no, width=" + winWidth + ", height=" + winHeight + ", top=" + popupH + ", left=" + popupW;			
			
			window.open(url,"",popOption);
		}
		
		function selectDate(){
			var url = "/semi/views/popup/pop_ReservationDate.jsp";
			var winWidth = 550;
			var winHeight = 200;
			var popupW = (screen.availWidth - winWidth) / 2;
			var popupH = (screen.availHeight - winHeight) / 2;			
			var popOption = "status=no, width=" + winWidth + ", height=" + winHeight + ", top=" + popupH + ", left=" + popupW;			
			
			window.open(url,"",popOption);
		}
		
		$(function(){
			$("#fileArea").hide();
			
			$("#productImgArea1").click(function(){
				$("#thumbnailImg1").click();
			});
			
			$("#productImgArea2").click(function(){
				$("#thumbnailImg2").click();
			});
			
			$("#productImgArea3").click(function(){
				$("#thumbnailImg3").click();				
			});
			
			$("#productImgArea4").click(function(){
				$("#thumbnailImg4").click();
			});
			
			$("#productImgArea5").click(function(){
				$("#thumbnailImg5").click();
			});
		});
		
		function loadImg(value, num){
			if(value.files && value.files[0]){
				var reader = new FileReader();
				
				reader.onload = function(e){
					switch(num){
						case 1: $("#productImg1").attr("src", e.target.result); break;
						case 2: $("#productImg2").attr("src", e.target.result); break;
						case 3: $("#productImg3").attr("src", e.target.result); break;
						case 4: $("#productImg4").attr("src", e.target.result); break;
						case 5: $("#productImg5").attr("src", e.target.result); break;
					}
				}				
				reader.readAsDataURL(value.files[0]); 
			};
		};	
		
		
		/* $("#insertPIMG").click(function(){			
			$("#insertPIMGForm").submit();			
		}); */
		
		function insertReq(){
			$("#firstForm").submit();
		}
	</script>	
		
		
</body>
</html>