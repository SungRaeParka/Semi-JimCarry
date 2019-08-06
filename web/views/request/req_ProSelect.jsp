<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<style>
	html, body{ 
		height:100%;
		margin: 0;
		padding: 0;				
	}	
	#main {
		min-height: 100%;
	}
	
	.proTd { cursor: pointer; position: relative;}		
	
	#proTdcount1 {position: absolute; top: 45%; left: 45%;}
	#proTdcount2 {position: absolute; top: 45%; left: 45%;}
	#proTdcount3 {position: absolute; top: 45%; left: 45%;}
	#proTdcount4 {position: absolute; top: 45%; left: 45%;}
	#proTdcount5 {position: absolute; top: 45%; left: 45%;}
	#proTdcount6 {position: absolute; top: 45%; left: 45%;}
	#proTdcount7 {position: absolute; top: 45%; left: 45%;}
	#proTdcount8 {position: absolute; top: 45%; left: 45%;}
	#proTdcount9 {position: absolute; top: 45%; left: 45%;}
	#proTdcount10 {position: absolute; top: 45%; left: 45%;}
	#proTdcount11 {position: absolute; top: 45%; left: 45%;}
	#proTdcount12 {position: absolute; top: 45%; left: 45%;}
	#proTdcount13 {position: absolute; top: 45%; left: 45%;}
	#proTdcount14 {position: absolute; top: 45%; left: 45%;}
	#proTdcount15 {position: absolute; top: 45%; left: 45%;}
	#proTdcount16 {position: absolute; top: 45%; left: 45%;}
	#proTdcount17 {position: absolute; top: 45%; left: 45%;}
	#proTdcount18 {position: absolute; top: 45%; left: 45%;}
	#proTdcount19 {position: absolute; top: 45%; left: 45%;}
	#proTdcount20 {position: absolute; top: 45%; left: 45%;}
	
	table td {
		font-family: 'Sunflower', sans-serif;
	}
	

	
</style>
</head>
<body>
	<%@ include file="/views/common/user_TopBar.jsp" %>
	
	<div id="main">		
		<div style="padding-top: 30%; padding-left: 20px;">
			<span style="font-size: 45px; font-weight: bold; font-family: 'Sunflower', sans-serif;">용달차가 필요하세요?</span><br>
			<span style="font-size: 20px; font-family: 'Sunflower', sans-serif;">옮기실 짐을 선택하세요. 짐 캐리가 기사님을 찾아드립니다.</span>
			<br>
			<br>			
		</div>
		
		<hr>
		
		<div align="center">
			<table>
				<tr>
					<td><label style="font-size: 30px; font-weight: bold; font-family: 'Sunflower', sans-serif;">물품 선택</label></td>
					<td><label> → </label></td>
					<td><label>물품 상세 정보 선택</label></td>						
					<td><label> → </label></td>
					<td><label>장소, 날짜 선택</label></td>
					</tr>	
			</table>
		</div>		
				
		<hr>
		
		
		<form action="<%= request.getContextPath()%>/insert.rq" method="post">					
		<div style="padding-left: 20px;">
			<span style="font-size: 30px; font-weight: bold; font-family: 'Sunflower', sans-serif;">가전</span>												
			<table style="width: 500px; height: 300px; border: 1px solid black;">
				<tr>
					<td class="proTd" id="proTd1" style="border: 1px solid black;">						
						<div class="proTdphoto1" align="center">
							<img src="../../images/ref.png" style="width: 100px; height: 100px;">
						</div>
						<div class="proTdminus1">
							<img src="../../images/minus_btn.png" style="width: 30px; height: 30px;">						
						</div>	
						<div class="proTdcount1">
							<span id="proTdcount1"></span>
						</div>
						<div align="center">
							<label>냉장고</label>						
						</div>																		
					</td>					
					<td class="proTd" id="proTd2" style="border: 1px solid black;">						
						<div class="proTdphoto2" align="center">
							<img src="../../images/washing.png" style="width: 100px; height: 100px;">
						</div>
						<div class="proTdminus2">
							<img src="../../images/minus_btn.png" style="width: 30px; height: 30px;">						
						</div>	
						<div class="proTdcount2">
							<span id="proTdcount2"></span>
						</div>
						<div align="center">
							<label>세탁기</label>						
						</div>																		
					</td>
					<td class="proTd" id="proTd3" style="border: 1px solid black;">						
						<div class="proTdphoto3" align="center">
							<img src="../../images/tv.png" style="width: 100px; height: 100px;">
						</div>
						<div class="proTdminus3">
							<img src="../../images/minus_btn.png" style="width: 30px; height: 30px;">						
						</div>	
						<div class="proTdcount3">
							<span id="proTdcount3"></span>
						</div>
						<div align="center">
							<label>TV/모니터</label>						
						</div>																		
					</td>
					<td class="proTd" id="proTd4" style="border: 1px solid black;">						
						<div class="proTdphoto4" align="center">
							<img src="../../images/air.png" style="width: 100px; height: 100px;">
						</div>
						<div class="proTdminus4">
							<img src="../../images/minus_btn.png" style="width: 30px; height: 30px;">						
						</div>	
						<div class="proTdcount4">
							<span id="proTdcount4"></span>
						</div>
						<div align="center">
							<label>에어컨</label>						
						</div>																		
					</td>					
				</tr>
				<tr>
					<td class="proTd" id="proTd5" style="border: 1px solid black;">						
						<div class="proTdphoto5" align="center">
							<img src="../../images/water.png" style="width: 100px; height: 100px;">
						</div>
						<div class="proTdminus5">
							<img src="../../images/minus_btn.png" style="width: 30px; height: 30px;">						
						</div>	
						<div class="proTdcount5">
							<span id="proTdcount5"></span>
						</div>
						<div align="center">
							<label>정수기</label>						
						</div>																		
					</td>
					<td class="proTd" id="proTd6" style="border: 1px solid black;">						
						<div class="proTdphoto6" align="center">
							<img src="../../images/pc.png" style="width: 100px; height: 100px;">
						</div>
						<div class="proTdminus6">
							<img src="../../images/minus_btn.png" style="width: 30px; height: 30px;">						
						</div>	
						<div class="proTdcount6">
							<span id="proTdcount6"></span>
						</div>
						<div align="center">
							<label>PC/노트북</label>						
						</div>																		
					</td>
					<td class="proTd" id="proTd7" style="border: 1px solid black;">						
						<div class="proTdphoto7" align="center">
							<img src="../../images/oven.png" style="width: 100px; height: 100px;">
						</div>
						<div class="proTdminus7">
							<img src="../../images/minus_btn.png" style="width: 30px; height: 30px;">						
						</div>	
						<div class="proTdcount7">
							<span id="proTdcount7"></span>
						</div>
						<div align="center">
							<label>전자레인지</label>						
						</div>																		
					</td>										
				</tr>
			</table>
		</div>
		
		<hr>
			
		<div style="padding-left: 20px;">
			<div style="font-size: 30px; font-weight: bold; font-family: 'Sunflower', sans-serif;">가구</div>
			<table style="width: 500px; height: 300px; border: 1px solid black;">
				<tr>
					<td class="proTd" id="proTd8" style="border: 1px solid black;">						
						<div class="proTdphoto8" align="center">
							<img src="../../images/bed.png" style="width: 100px; height: 100px;">
						</div>
						<div class="proTdminus8">
							<img src="../../images/minus_btn.png" style="width: 30px; height: 30px;">						
						</div>	
						<div class="proTdcount8">
							<span id="proTdcount8"></span>
						</div>
						<div align="center">
							<label>침대</label>						
						</div>																		
					</td>
					<td class="proTd" id="proTd9" style="border: 1px solid black;">						
						<div class="proTdphoto9" align="center">
							<img src="../../images/chair.png" style="width: 100px; height: 100px;">
						</div>
						<div class="proTdminus9">
							<img src="../../images/minus_btn.png" style="width: 30px; height: 30px;">						
						</div>	
						<div class="proTdcount9">
							<span id="proTdcount9"></span>
						</div>
						<div align="center">
							<label>의자</label>						
						</div>																		
					</td>
					<td class="proTd" id="proTd10" style="border: 1px solid black;">						
						<div class="proTdphoto10" align="center">
							<img src="../../images/desk.png" style="width: 100px; height: 100px;">
						</div>
						<div class="proTdminus10">
							<img src="../../images/minus_btn.png" style="width: 30px; height: 30px;">						
						</div>	
						<div class="proTdcount10">
							<span id="proTdcount10"></span>
						</div>
						<div align="center">
							<label>책상/테이블</label>						
						</div>																		
					</td>
					<td class="proTd" id="proTd11" style="border: 1px solid black;">						
						<div class="proTdphoto11" align="center">
							<img src="../../images/bookshelf.png" style="width: 100px; height: 100px;">
						</div>
						<div class="proTdminus11">
							<img src="../../images/minus_btn.png" style="width: 30px; height: 30px;">						
						</div>	
						<div class="proTdcount11">
							<span id="proTdcount11"></span>
						</div>
						<div align="center">
							<label>책장</label>						
						</div>																		
					</td>				
				</tr>
				<tr>
					<td class="proTd" id="proTd12" style="border: 1px solid black;">						
						<div class="proTdphoto12" align="center">
							<img src="../../images/closet.png" style="width: 100px; height: 100px;">
						</div>
						<div class="proTdminus12">
							<img src="../../images/minus_btn.png" style="width: 30px; height: 30px;">						
						</div>	
						<div class="proTdcount12">
							<span id="proTdcount12"></span>
						</div>
						<div align="center">
							<label>옷장</label>						
						</div>																		
					</td>
					<td class="proTd" id="proTd13" style="border: 1px solid black;">						
						<div class="proTdphoto13" align="center">
							<img src="../../images/showcase.png" style="width: 100px; height: 100px;">
						</div>
						<div class="proTdminus13">
							<img src="../../images/minus_btn.png" style="width: 30px; height: 30px;">						
						</div>	
						<div class="proTdcount13">
							<span id="proTdcount13"></span>
						</div>
						<div align="center">
							<label>진열장</label>						
						</div>																		
					</td>
					<td class="proTd" id="proTd14" style="border: 1px solid black;">						
						<div class="proTdphoto14" align="center">
							<img src="../../images/sofa.png" style="width: 100px; height: 100px;">
						</div>
						<div class="proTdminus14">
							<img src="../../images/minus_btn.png" style="width: 30px; height: 30px;">						
						</div>	
						<div class="proTdcount14">
							<span id="proTdcount14"></span>
						</div>
						<div align="center">
							<label>쇼파</label>						
						</div>																		
					</td>
					<td class="proTd" id="proTd15" style="border: 1px solid black;">						
						<div class="proTdphoto15" align="center">
							<img src="../../images/hanger.png" style="width: 100px; height: 100px;">
						</div>
						<div class="proTdminus15">
							<img src="../../images/minus_btn.png" style="width: 30px; height: 30px;">						
						</div>	
						<div class="proTdcount15">
							<span id="proTdcount15"></span>
						</div>
						<div align="center">
							<label>행거</label>						
						</div>																		
					</td>														
				</tr>
				<tr>
					<td class="proTd" id="proTd16" style="border: 1px solid black;">						
						<div class="proTdphoto16" align="center">
							<img src="../../images/mirror.png" style="width: 100px; height: 100px;">
						</div>
						<div class="proTdminus16">
							<img src="../../images/minus_btn.png" style="width: 30px; height: 30px;">						
						</div>	
						<div class="proTdcount16">
							<span id="proTdcount16"></span>
						</div>
						<div align="center">
							<label>거울</label>						
						</div>																		
					</td>
					<td class="proTd" id="proTd17" style="border: 1px solid black;">						
						<div class="proTdphoto17" align="center">
							<img src="../../images/table.png" style="width: 100px; height: 100px;">
						</div>
						<div class="proTdminus17">
							<img src="../../images/minus_btn.png" style="width: 30px; height: 30px;">						
						</div>	
						<div class="proTdcount17">
							<span id="proTdcount17"></span>
						</div>
						<div align="center">
							<label>화장대</label>						
						</div>																		
					</td>
					<td class="proTd" id="proTd18" style="border: 1px solid black;">						
						<div class="proTdphoto18" align="center">
							<img src="../../images/piano.png" style="width: 100px; height: 100px;">
						</div>
						<div class="proTdminus18">
							<img src="../../images/minus_btn.png" style="width: 30px; height: 30px;">						
						</div>	
						<div class="proTdcount18">
							<span id="proTdcount18"></span>
						</div>
						<div align="center">
							<label>피아노</label>						
						</div>																		
					</td>				
				</tr>
			</table>
			
		</div>
			
		<hr>
			
		<div style="padding-left: 20px;">
			<div style="font-size: 30px; font-weight: bold; font-family: 'Sunflower', sans-serif;">기타</div>
			<table style="width: 500px; height: 150px; border: 1px solid black;">
				<tr>
					<td class="proTd" id="proTd19" style="border: 1px solid black;">						
						<div class="proTdphoto19" align="center">
							<img src="../../images/books.png" style="width: 100px; height: 100px;">
						</div>
						<div class="proTdminus19">
							<img src="../../images/minus_btn.png" style="width: 30px; height: 30px;">						
						</div>	
						<div class="proTdcount19">
							<span id="proTdcount19"></span>
							<input type="hidden" id="proTdcount19a" name="proTdcount19a">
						</div>
						<div align="center">
							<label>책</label>						
						</div>																		
					</td>
					<td class="proTd" id="proTd20" style="border: 1px solid black;">						
						<div class="proTdphoto20" align="center">
							<img src="../../images/box.png" style="width: 100px; height: 100px;">
						</div>
						<div class="proTdminus20">
							<img src="../../images/minus_btn.png" style="width: 30px; height: 30px;">						
						</div>	
						<div class="proTdcount20">
							<span id="proTdcount20"></span>
							<input type="hidden" id="proTdcount20a" name="proTdcount20a">
						</div>
						<div align="center">
							<label>상자</label>						
						</div>																		
					</td>					
				</tr>					
			</table>						
		</div>
		
		<hr>
		
		<div align="center" style="margin-bottom: 10px">		
			<span id="insertPro" onclick="insertPro();" style="font-size: 30px; cursor: pointer; font-family: 'Sunflower', sans-serif;">다음 단계로</span>			
		</div>
		</form>		
	</div>
	
	<script>		
		function insertPro(){			
			
			$("form").submit();
			
		}
		
		var count1 = 0;
		$(".proTdminus1").hide();
	
		$(".proTdphoto1").click(function(){			
			
			$(".proTdminus1").show();
			$(".proTdphoto1").css("opacity", "0.2");
			
			count1 += 1;	
			
			$("#proTdcount1").val(count1);
			$("#proTdcount1").html(count1);	
			
			$(".proTdphoto1").append("<input type='hidden' id='proKind' name='proKind' value='가전'>");
			$(".proTdphoto1").append("<input type='hidden' id='proName' name='proName' value='냉장고'>");
			console.log($("#proName").val())
		});
		
		$(".proTdminus1").click(function(){
			count1 -= 1;
			
			$("#proTdcount1").val(count1);
			$("#proTdcount1").html(count1);		
			
			$("#proKind").remove();
			$("#proName").remove();
			console.log($("#proName").val())
			
			if(count1 == 0){
				$(".proTdphoto1").removeAttr("style");
				$("#proTdcount1").html("");
				$(".proTdminus1").hide();
			}
		});		
		
		var count2 = 0;
		$(".proTdminus2").hide();
	
		$(".proTdphoto2").click(function(){			
			
			$(".proTdminus2").show();
			$(".proTdphoto2").css("opacity", "0.2");
			
			count2 += 1;	
			
			$("#proTdcount2").val(count2);
			$("#proTdcount2").html(count2);		
			
			$(".proTdphoto2").append("<input type='hidden' id='proKind' name='proKind' value='가전'>");
			$(".proTdphoto2").append("<input type='hidden' id='proName' name='proName' value='세탁기'>");
			console.log($("#proName").val())
		});	
		
		$(".proTdminus2").click(function(){
			count2 -= 1;
			
			$("#proTdcount2").val(count2);
			$("#proTdcount2").html(count2);	
			
			$("#proKind").remove();
			$("#proName").remove();
			
			console.log($("#proName").val())
			
			if(count2 == 0){
				$(".proTdphoto2").removeAttr("style");
				$("#proTdcount2").html("");
				$(".proTdminus2").hide();
			}
		});	
		
		var count3 = 0;
		$(".proTdminus3").hide();
	
		$(".proTdphoto3").click(function(){			
			
			$(".proTdminus3").show();
			$(".proTdphoto3").css("opacity", "0.2");
			
			count3 += 1;	
			
			$("#proTdcount3").val(count3);
			$("#proTdcount3").html(count3);	
			
			$(".proTdphoto3").append("<input type='hidden' id='proKind' name='proKind' value='가전'>");
			$(".proTdphoto3").append("<input type='hidden' id='proName' name='proName' value='TV/모니터'>");
		});	
		
		$(".proTdminus3").click(function(){
			count3 -= 1;
			
			$("#proTdcount3").val(count3);
			$("#proTdcount3").html(count3);		
			
			$("#proKind").remove();
			$("#proName").remove();
			
			if(count3 == 0){
				$(".proTdphoto3").removeAttr("style");
				$("#proTdcount3").html("");
				$(".proTdminus3").hide();
			}
		});	
		
		var count4 = 0;
		$(".proTdminus4").hide();
	
		$(".proTdphoto4").click(function(){			
			
			$(".proTdminus4").show();
			$(".proTdphoto4").css("opacity", "0.2");
			
			count4 += 1;	
			
			$("#proTdcount4").val(count4);
			$("#proTdcount4").html(count4);	
			
			$(".proTdphoto4").append("<input type='hidden' id='proKind' name='proKind' value='가전'>");
			$(".proTdphoto4").append("<input type='hidden' id='proName' name='proName' value='에어컨'>");
		});	
		
		$(".proTdminus4").click(function(){
			count4 -= 1;
			
			$("#proTdcount4").val(count4);
			$("#proTdcount4").html(count4);	
			
			$("#proKind").remove();
			$("#proName").remove();
			
			if(count4 == 0){
				$(".proTdphoto4").removeAttr("style");
				$("#proTdcount4").html("");
				$(".proTdminus4").hide();
			}
		});	
		
		var count5 = 0;
		$(".proTdminus5").hide();
	
		$(".proTdphoto5").click(function(){			
			
			$(".proTdminus5").show();
			$(".proTdphoto5").css("opacity", "0.2");
			
			count5 += 1;	
			
			$("#proTdcount5").val(count5);
			$("#proTdcount5").html(count5);		
			
			$(".proTdphoto5").append("<input type='hidden' id='proKind' name='proKind' value='가전'>");
			$(".proTdphoto5").append("<input type='hidden' id='proName' name='proName' value='정수기'>");
		});	
		
		$(".proTdminus5").click(function(){
			count5 -= 1;
			
			$("#proTdcount5").val(count5);
			$("#proTdcount5").html(count5);	
			
			$("#proKind").remove();
			$("#proName").remove();
			
			if(count5 == 0){
				$(".proTdphoto5").removeAttr("style");
				$("#proTdcount5").html("");
				$(".proTdminus5").hide();
			}
		});
		
		var count6 = 0;
		$(".proTdminus6").hide();
	
		$(".proTdphoto6").click(function(){			
			
			$(".proTdminus6").show();
			$(".proTdphoto6").css("opacity", "0.2");
			
			count6 += 1;	
			
			$("#proTdcount6").val(count6);
			$("#proTdcount6").html(count6);		
			
			$(".proTdphoto6").append("<input type='hidden' id='proKind' name='proKind' value='가전'>");
			$(".proTdphoto6").append("<input type='hidden' id='proName' name='proName' value='PC/노트북'>");
		});	
		
		$(".proTdminus6").click(function(){
			count6 -= 1;
			
			$("#proTdcount6").val(count6);
			$("#proTdcount6").html(count6);	
			
			$("#proKind").remove();
			$("#proName").remove();
			
			if(count6 == 0){
				$(".proTdphoto6").removeAttr("style");
				$("#proTdcount6").html("");
				$(".proTdminus6").hide();
			}
		});	
		
		var count7 = 0;
		$(".proTdminus7").hide();
	
		$(".proTdphoto7").click(function(){			
			
			$(".proTdminus7").show();
			$(".proTdphoto7").css("opacity", "0.2");
			
			count7 += 1;	
			
			$("#proTdcount7").val(count7);
			$("#proTdcount7").html(count7);	
			
			$(".proTdphoto7").append("<input type='hidden' id='proKind' name='proKind' value='가전'>");
			$(".proTdphoto7").append("<input type='hidden' id='proName' name='proName' value='전자레인지'>");
		});	
		
		$(".proTdminus7").click(function(){
			count7 -= 1;
			
			$("#proTdcount7").val(count7);
			$("#proTdcount7").html(count7);	
			
			$("#proKind").remove();
			$("#proName").remove();
			
			if(count7 == 0){
				$(".proTdphoto7").removeAttr("style");
				$("#proTdcount7").html("");
				$(".proTdminus7").hide();
			}
		});	
		
		var count8 = 0;
		$(".proTdminus8").hide();
	
		$(".proTdphoto8").click(function(){			
			
			$(".proTdminus8").show();
			$(".proTdphoto8").css("opacity", "0.2");
			
			count8 += 1;	
			
			$("#proTdcount8").val(count8);
			$("#proTdcount8").html(count8);	
			
			$(".proTdphoto8").append("<input type='hidden' id='proKind' name='proKind' value='가구'>");
			$(".proTdphoto8").append("<input type='hidden' id='proName' name='proName' value='침대'>");
		});	
		
		$(".proTdminus8").click(function(){
			count8 -= 1;
			
			$("#proTdcount8").val(count8);
			$("#proTdcount8").html(count8);	
			
			$("#proKind").remove();
			$("#proName").remove();
			
			if(count8 == 0){
				$(".proTdphoto8").removeAttr("style");
				$("#proTdcount8").html("");
				$(".proTdminus8").hide();
			}
		});	
		
		var count9 = 0;
		$(".proTdminus9").hide();
	
		$(".proTdphoto9").click(function(){			
			
			$(".proTdminus9").show();
			$(".proTdphoto9").css("opacity", "0.2");
			
			count9 += 1;	
			
			$("#proTdcount9").val(count9);
			$("#proTdcount9").html(count9);	
			
			$(".proTdphoto9").append("<input type='hidden' id='proKind' name='proKind' value='가구'>");
			$(".proTdphoto9").append("<input type='hidden' id='proName' name='proName' value='의자'>");
		});	
		
		$(".proTdminus9").click(function(){
			count9 -= 1;
			
			$("#proTdcount9").val(count9);
			$("#proTdcount9").html(count9);	
			
			$("#proKind").remove();
			$("#proName").remove();
			
			if(count9 == 0){
				$(".proTdphoto9").removeAttr("style");
				$("#proTdcount9").html("");
				$(".proTdminus9").hide();
			}
		});	
		
		var count10 = 0;
		$(".proTdminus10").hide();
	
		$(".proTdphoto10").click(function(){			
			
			$(".proTdminus10").show();
			$(".proTdphoto10").css("opacity", "0.2");
			
			count10 += 1;	
			
			$("#proTdcount10").val(count10);
			$("#proTdcount10").html(count10);
			
			$(".proTdphoto10").append("<input type='hidden' id='proKind' name='proKind' value='가구'>");
			$(".proTdphoto10").append("<input type='hidden' id='proName' name='proName' value='책상/테이블'>");
		});	
		
		$(".proTdminus10").click(function(){
			count10 -= 1;
			
			$("#proTdcount10").val(count10);
			$("#proTdcount10").html(count10);	
			
			$("#proKind").remove();
			$("#proName").remove();
			
			if(count10 == 0){
				$(".proTdphoto10").removeAttr("style");
				$("#proTdcount10").html("");
				$(".proTdminus10").hide();
			}
		});	
		
		var count11 = 0;
		$(".proTdminus11").hide();
	
		$(".proTdphoto11").click(function(){			
			
			$(".proTdminus11").show();
			$(".proTdphoto11").css("opacity", "0.2");
			
			count11 += 1;	
			
			$("#proTdcount11").val(count11);
			$("#proTdcount11").html(count11);	
			
			$(".proTdphoto11").append("<input type='hidden' id='proKind' name='proKind' value='가구'>");
			$(".proTdphoto11").append("<input type='hidden' id='proName' name='proName' value='책장'>");
		});	
		
		$(".proTdminus11").click(function(){
			count11 -= 1;
			
			$("#proTdcount11").val(count11);
			$("#proTdcount11").html(count11);	
			
			$("#proKind").remove();
			$("#proName").remove();
			
			if(count11 == 0){
				$(".proTdphoto11").removeAttr("style");
				$("#proTdcount11").html("");
				$(".proTdminus11").hide();
			}
		});	
		
		var count12 = 0;
		$(".proTdminus12").hide();
	
		$(".proTdphoto12").click(function(){			
			
			$(".proTdminus12").show();
			$(".proTdphoto12").css("opacity", "0.2");
			
			count12 += 1;	
			
			$("#proTdcount12").val(count12);
			$("#proTdcount12").html(count12);
			
			$(".proTdphoto12").append("<input type='hidden' id='proKind' name='proKind' value='가구'>");
			$(".proTdphoto12").append("<input type='hidden' id='proName' name='proName' value='옷장'>");
		});	
		
		$(".proTdminus12").click(function(){
			count12 -= 1;
			
			$("#proTdcount12").val(count12);
			$("#proTdcount12").html(count12);	
			
			$("#proKind").remove();
			$("#proName").remove();
			
			if(count12 == 0){
				$(".proTdphoto12").removeAttr("style");
				$("#proTdcount12").html("");
				$(".proTdminus12").hide();
			}
		});	
		
		var count13 = 0;
		$(".proTdminus13").hide();
	
		$(".proTdphoto13").click(function(){			
			
			$(".proTdminus13").show();
			$(".proTdphoto13").css("opacity", "0.2");
			
			count13 += 1;	
			
			$("#proTdcount13").val(count13);
			$("#proTdcount13").html(count13);	
			
			$(".proTdphoto13").append("<input type='hidden' id='proKind' name='proKind' value='가구'>");
			$(".proTdphoto13").append("<input type='hidden' id='proName' name='proName' value='진열장'>");
		});	
		
		$(".proTdminus13").click(function(){
			count13 -= 1;
			
			$("#proTdcount13").val(count13);
			$("#proTdcount13").html(count13);	
			
			$("#proKind").remove();
			$("#proName").remove();
			
			if(count13 == 0){
				$(".proTdphoto13").removeAttr("style");
				$("#proTdcount13").html("");
				$(".proTdminus13").hide();
			}
		});	
		
		var count14 = 0;
		$(".proTdminus14").hide();
	
		$(".proTdphoto14").click(function(){			
			
			$(".proTdminus14").show();
			$(".proTdphoto14").css("opacity", "0.2");
			
			count14 += 1;	
			
			$("#proTdcount14").val(count14);
			$("#proTdcount14").html(count14);	
			
			$(".proTdphoto14").append("<input type='hidden' id='proKind' name='proKind' value='가구'>");
			$(".proTdphoto14").append("<input type='hidden' id='proName' name='proName' value='쇼파'>");
		});	
		
		$(".proTdminus14").click(function(){
			count14 -= 1;
			
			$("#proTdcount14").val(count14);
			$("#proTdcount14").html(count14);	
			
			$("#proKind").remove();
			$("#proName").remove();
			
			if(count14 == 0){
				$(".proTdphoto14").removeAttr("style");
				$("#proTdcount14").html("");
				$(".proTdminus14").hide();
			}
		});	
		
		var count15 = 0;
		$(".proTdminus15").hide();
	
		$(".proTdphoto15").click(function(){			
			
			$(".proTdminus15").show();
			$(".proTdphoto15").css("opacity", "0.2");
			
			count15 += 1;	
			
			$("#proTdcount15").val(count15);
			$("#proTdcount15").html(count15);	
			
			$(".proTdphoto15").append("<input type='hidden' id='proKind' name='proKind' value='가구'>");
			$(".proTdphoto15").append("<input type='hidden' id='proName' name='proName' value='행거'>");
		});	
		
		$(".proTdminus15").click(function(){
			count15 -= 1;
			
			$("#proTdcount15").val(count15);
			$("#proTdcount15").html(count15);	
			
			$("#proKind").remove();
			$("#proName").remove();
			
			if(count15 == 0){
				$(".proTdphoto15").removeAttr("style");
				$("#proTdcount15").html("");
				$(".proTdminus15").hide();
			}
		});
		
		var count16 = 0;
		$(".proTdminus16").hide();
	
		$(".proTdphoto16").click(function(){			
			
			$(".proTdminus16").show();
			$(".proTdphoto16").css("opacity", "0.2");
			
			count16 += 1;	
			
			$("#proTdcount16").val(count16);
			$("#proTdcount16").html(count16);
			
			$(".proTdphoto16").append("<input type='hidden' id='proKind' name='proKind' value='가구'>");
			$(".proTdphoto16").append("<input type='hidden' id='proName' name='proName' value='거울'>");
		});	
		
		$(".proTdminus16").click(function(){
			count16 -= 1;
			
			$("#proTdcount16").val(count16);
			$("#proTdcount16").html(count16);	
			
			$("#proKind").remove();
			$("#proName").remove();
			
			if(count16 == 0){
				$(".proTdphoto16").removeAttr("style");
				$("#proTdcount16").html("");
				$(".proTdminus16").hide();
			}
		});	
		
		var count17 = 0;
		$(".proTdminus17").hide();
	
		$(".proTdphoto17").click(function(){			
			
			$(".proTdminus17").show();
			$(".proTdphoto17").css("opacity", "0.2");
			
			count17 += 1;	
			
			$("#proTdcount17").val(count17);
			$("#proTdcount17").html(count17);
			
			$(".proTdphoto17").append("<input type='hidden' id='proKind' name='proKind' value='가구'>");
			$(".proTdphoto17").append("<input type='hidden' id='proName' name='proName' value='화장대'>");
		});	
		
		$(".proTdminus17").click(function(){
			count17 -= 1;
			
			$("#proTdcount17").val(count17);
			$("#proTdcount17").html(count17);	
			
			$("#proKind").remove();
			$("#proName").remove();
			
			if(count17 == 0){
				$(".proTdphoto17").removeAttr("style");
				$("#proTdcount17").html("");
				$(".proTdminus17").hide();
			}
		});	
		
		var count18 = 0;
		$(".proTdminus18").hide();
	
		$(".proTdphoto18").click(function(){			
			
			$(".proTdminus18").show();
			$(".proTdphoto18").css("opacity", "0.2");
			
			count18 += 1;	
			
			$("#proTdcount18").val(count18);
			$("#proTdcount18").html(count18);	
			
			$(".proTdphoto18").append("<input type='hidden' id='proKind' name='proKind' value='가구'>");
			$(".proTdphoto1").append("<input type='hidden' id='proName' name='proName' value='피아노'>");
		});	
		
		$(".proTdminus18").click(function(){
			count18 -= 1;
			
			$("#proTdcount18").val(count18);
			$("#proTdcount18").html(count18);	
			
			$("#proKind").remove();
			$("#proName").remove();
			
			if(count18 == 0){
				$(".proTdphoto18").removeAttr("style");
				$("#proTdcount18").html("");
				$(".proTdminus18").hide();
			}
		});	
		
		var count19 = 0;
		$(".proTdminus19").hide();
		$("#proTdcount19a").attr('value', count19);
	
		$(".proTdphoto19").click(function(){			
			
			$(".proTdminus19").show();
			$(".proTdphoto19").css("opacity", "0.2");
			
			count19 += 1;	
			
			$("#proTdcount19").val(count19);
			$("#proTdcount19").html(count19);	
			
			$(".proTdphoto19").append("<input type='hidden' id='proKind' name='proKind' value='기타'>");
			$(".proTdphoto19").append("<input type='hidden' id='proName' name='proName' value='책'>");
			$("#proTdcount19a").attr('value', count19);
		});	
		
		$(".proTdminus19").click(function(){
			count19 -= 1;
			
			$("#proTdcount19").val(count19);
			$("#proTdcount19").html(count19);			
			
			$("#proKind").remove();
			$("#proName").remove();
			$("#proTdcount19a").attr('value', count19);
			
			if(count19 == 0){
				$(".proTdphoto19").removeAttr("style");
				$("#proTdcount19").html("");
				$(".proTdminus19").hide();
			}
		});	
		
		var count20 = 0;
		$(".proTdminus20").hide();
		$("#proTdcount20a").attr('value', count20);
	
		$(".proTdphoto20").click(function(){			
			
			$(".proTdminus20").show();
			$(".proTdphoto20").css("opacity", "0.2");
			
			count20 += 1;	
			
			$("#proTdcount20").val(count20);
			$("#proTdcount20").html(count20);
			
			$(".proTdphoto20").append("<input type='hidden' id='proKind' name='proKind' value='기타'>");
			$(".proTdphoto20").append("<input type='hidden' id='proName' name='proName' value='상자'>");
			$("#proTdcount20a").attr('value', count20);
		});	
		
		$(".proTdminus20").click(function(){
			count20 -= 1;
			
			$("#proTdcount20").val(count20);
			$("#proTdcount20").html(count20);		
			
			$("#proKind").remove();
			$("#proName").remove();	
			$("#proTdcount20a").attr('value', count20);
			
			if(count20 == 0){
				$(".proTdphoto20").removeAttr("style");
				$("#proTdcount20").html("");
				$(".proTdminus20").hide();
			}
		});
		
	</script>
	
</body>
</html>