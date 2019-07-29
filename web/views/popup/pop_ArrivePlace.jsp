<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head> 
<body>
	<form>
		<div align="center">
			<span style="font-size:40px; font-weight: bold">출발지 검색</span>
		</div>
		
		<hr>
		
		<div align="center">
			<table>
				<tr>
					<td>
						<input type="text" id="start_postcode" placeholder="우편번호">						
					</td>					
				</tr>
				<tr>
					<td>
						<input type="text" id="start_address" placeholder="주소">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="start_detailAddress" placeholder="상세주소">
					</td>
				</tr>
				<tr>
					<td>
						<input type="text" id="start_extraAddress" placeholder="참고항목">
					</td>
				</tr>
				<tr>
					<td align="center">
						<input type="button" onclick="postCode()" value="주소 검색 하기">
					</td>
				</tr>
			</table>
		</div>
		
		<hr>
		
		<!-- 집 형태 선택 -->
		<div class="home_type">		
			<div align="center">
				<span style="font-size: 20px;">종류</span><br>
				<input type="radio" id="home_type1" name="home_type" value="빌라">
				<label for="home_type1">빌라</label>
				<input type="radio" id="home_type2" name="home_type" value="오피스텔">
				<label for="home_type2">오피스텔</label>
				<input type="radio" id="home_type3" name="home_type" value="주택">
				<label for="home_type3">주택</label>
				<input type="radio" id="home_type4" name="home_type" value="아파트">
				<label for="home_type4">아파트</label>
			</div>
		</div>
		
		<hr>
		
		<div class="floor">		
			<div align="center">
				<span style="font-size: 20px;">층 수</span><br>
				<input type="radio" id="floor1" name="floor" value="지하">
				<label for="floor1">지하</label>
				<input type="radio" id="floor2" name="floor" value="1층(계단x)">
				<label for="floor2">1층(계단x)</label>
				<input type="radio" id="floor3" name="floor" value="1층(계단o)">
				<label for="floor3">1층(계단o)</label>
				<input type="radio" id="floor4" name="floor" value="2층이상">
				<label for="floor4">2층이상</label>							
			</div>
		</div>
			
		<hr>
		
		<div class="elevator">		
			<div align="center">
				<span style="font-size: 20px;">엘리베이터 유무</span><br>
				<input type="radio" id="elevator1" name="elevator" value="있음">
				<label for="elevator1">있음</label>
				<input type="radio" id="elevator2" name="elevator" value="없음">
				<label for="elevator2">없음</label>											
			</div>
		</div>
		
		<hr>
		
		<div class="parking">		
			<div align="center">
				<span style="font-size: 20px;">주차가능 유무</span><br>
				<input type="radio" id="parking1" name="parking" value="가능">
				<label for="parking1">가능</label>
				<input type="radio" id="parking2" name="parking" value="불가능">
				<label for="parking2">불가능</label>											
			</div>
		</div>
		
		<hr>
		
		<div>		
			<div align="center">
				<input type="button" value="확인" onclick="returnAPData()">
				<input type="reset" value="취소" onclick="window.close()">
			</div>
		</div>
	</form>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function postCode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("start_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("start_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('start_postcode').value = data.zonecode;
                document.getElementById("start_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("start_detailAddress").focus();
            }
        }).open();
    }
    
	function returnAPData(){
    	
    	var showArrivePlace = $("#showArrivePlace", opener.document);/* opener.document.getElementById("showStartPlace").html; */
    	var showAPDetail = $("#showAPDetail", opener.document);
    	
    	var ArrivePlaceVal = document.getElementById("start_address").value + " " + document.getElementById("start_detailAddress").value
    	
    	var homeType = $("input[name='home_type']:checked").val();
    	var floor = $("input[name='floor']:checked").val();
    	var elevator = $("input[name='elevator']:checked").val();
    	var parking = $("input[name='parking']:checked").val();
    	
    	var APDetail = "집 종류 : " + homeType + ", 층수 : " + floor + ", 엘리베이터 : " + elevator + ", 주차 여부 : " + parking; 
    	    	
    	showArrivePlace.html(ArrivePlaceVal);
    	showAPDetail.html(APDetail);
    	
    	var apInfo = $("#apInfo", opener.document);
    	var apInfoAll = ArrivePlaceVal + ", " + APDetail;
    	
    	apInfo.val(apInfoAll);
    	
    	self.close();
    }
</script>
</body>
</html>