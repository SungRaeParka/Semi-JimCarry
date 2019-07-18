<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Insert title here</title>
</head>
<body>
	<form>	
		<!-- 냉장고 팝업창 -->
		<div class="pop_ref">
			<div align="center">
				<span style="font-size: 30px; font-weight: bold">냉장고</span>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">종류</span><br>
				<input type="radio" id="refrigerator1" name="refrigerator" value="일반형">
				<label for="refrigerator1">일반형</label>
				<input type="radio" id="refrigerator2" name="refrigerator" value="양문형">
				<label for="refrigerator2">양문형</label>
				<input type="radio" id="refrigerator3" name="refrigerator" value="김치냉장고">
				<label for="refrigerator3">김치 냉장고</label>
				<input type="radio" id="refrigerator4" name="refrigerator" value="기타">
				<label for="refrigerator4">기타</label>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">용량</span><br>
				<input type="radio" id="refrigerator_liter1" name="refrigerator_liter" value="130리터 미만">
				<label for="refrigerator_liter1">130리터 미만</label>
				<input type="radio" id="refrigerator_liter2" name="refrigerator_liter" value="130~250리터">
				<label for="refrigerator_liter2">130~250리터</label>
				<input type="radio" id="refrigerator_liter3" name="refrigerator_liter" value="251~450리터">
				<label for="refrigerator_liter3">251~450리터</label>
				<br>
				<input type="radio" id="refrigerator_liter4" name="refrigerator_liter" value="451~600리터">
				<label for="refrigerator_liter4">451~600리터</label>
				<input type="radio" id="refrigerator_liter5" name="refrigerator_liter" value="600리터 초과">
				<label for="refrigerator_liter5">600리터 초과</label>
			</div>
			
			<hr>
			
			<div align="center">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</div>
		</div>
			
		<!-- 세탁기 팝업창 -->
		<div class="pop_wash">
			<div align="center">
				<span style="font-size: 30px; font-weight: bold">세탁기</span>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">종류</span><br>
				<input type="radio" id="washing1" name="washing" value="통돌이">
				<label for="washing1">일반형</label>
				<input type="radio" id="washing2" name="washing" value="드럼">
				<label for="washing2">양문형</label>
				<input type="radio" id="washing3" name="washing" value="기타">
				<label for="washing3">기타</label>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">용량</span><br>
				<input type="radio" id="washing_Liter1" name="washing_Liter" value="10kg미만">
				<label for="washing_Liter1">10kg 미만</label>
				<input type="radio" id="washing_Liter2" name="washing_Liter" value="10kg이상">
				<label for="washing_Liter2">10kg 이상</label>
			</div>
			
			<hr>
			
			<div align="center">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</div>
		</div>
			
		<!-- tv 팝업창 -->
		<div class="pop_tv">
			<div align="center">
				<span style="font-size: 30px; font-weight: bold">TV/모니터</span>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">크기</span><br>
				<input type="radio" id="TV1" name="TV" value="30인치 미만">
				<label for="TV1">30인치미만</label>
				<input type="radio" id="TV2" name="TV" value="30~39인치">
				<label for="TV2">30~39인치</label>
				<input type="radio" id="TV3" name="TV" value="40~49인치">
				<label for="TV3">40~49인치</label>
				<input type="radio" id="TV4" name="TV" value="50인치 이상">
				<label for="TV4">50인치 이상</label>
				<input type="radio" id="TV5" name="TV" value="기타">
				<label for="TV5">기타</label>
			</div>
			
			<hr>
			
			<div align="center">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</div>
		</div>
			
		<!-- 에어컨 팝업창 -->
		<div  class="pop_air">
			<div align="center">
				<span style="font-size: 30px; font-weight: bold">에어컨</span>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">종류</span><br>
				<input type="radio" id="Air1" name="Air" value="벽걸이">
				<label for="Air1">벽걸이</label>
				<input type="radio" id="Air2" name="Air" value="스탠딩">
				<label for="Air2">스탠딩</label>
				<input type="radio" id="Air3" name="Air" value="기타">
				<label for="Air3">기타</label>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">출발지 분리 필요 여부</span><br>
				<input type="radio" id="Air_check1" name="Air_check" value="분리 필요">
				<label for="Air_check1">분리 필요</label>
				<input type="radio" id="Air_check2" name="Air_check" value="분리 필요 없음">
				<label for="Air_check2">분리 필요 없음</label>
			</div>
			
			<hr>
			
			<div align="center">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</div>
		</div>
			
		<!-- 정수기 팝업창 -->
		<div class="pop_water">
			<div align="center">
				<span style="font-size: 30px; font-weight: bold">정수기</span>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">크기</span><br>
				<input type="radio" id="Water1" name="Water" value="탁상용(미니)">
				<label for="Water1">탁상용(미니)</label>
				<input type="radio" id="Water2" name="Water" value="스탠딩(일반)">
				<label for="Water2">스탠딩(일반)</label>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">출발지 분리 필요 여부</span><br>
				<input type="radio" id="Water_check1" name="Water_check" value="분리 필요">
				<label for="Water_check1">분리 필요</label>
				<input type="radio" id="Water_check2" name="Water_check" value="분리 필요 없음">
				<label for="Water_check2">분리 필요 없음</label>
			</div>
			
			<hr>
			
			<div align="center">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</div>
		</div>
			
		<!-- 전자레인지 팝업창 -->
		<div class="pop_oven">
			<div align="center">
				<span style="font-size: 30px; font-weight: bold">전자레인지</span>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">종류</span><br>
				<input type="radio" id="Water1" name="oven" value="일반형">
				<label for="oven1">일반형</label>
				<input type="radio" id="Water2" name="oven" value="오븐형">
				<label for="oven2">오븐형</label>
			</div>
			
			<hr>			
			
			<div align="center">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</div>
		</div>
		
		<!-- 침대 팝업창 -->
		<div class="pop_bed">
			<div align="center">
				<span style="font-size: 30px; font-weight: bold">침대</span>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">크기</span><br>
				<input type="radio" id="bed1" name="bed" value="싱글/슈퍼싱글">
				<label for="bed1">싱글/슈퍼싱글</label>
				<input type="radio" id="bed2" name="bed" value="더블">
				<label for="bed2">더블</label>
				<input type="radio" id="bed3" name="bed" value="퀸">
				<label for="bed3">퀸</label>
				<input type="radio" id="bed4" name="bed" value="킹">
				<label for="bed4">킹</label>
				<input type="radio" id="bed5" name="bed" value="기타">
				<label for="bed5">기타</label>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">종류</span><br>
				<input type="radio" id="bed_kind1" name="bed_kind" value="프레임 없음">
				<label for="bed_kind1">프레임 없음</label>
				<input type="radio" id="bed_kind2" name="bed_kind" value="일반 프레임">
				<label for="bed_kind2">일반 프레임</label>
				<input type="radio" id="bed_kind3" name="bed_kind" value="통 프레임">
				<label for="bed_kind3">통 프레임</label>
				<br>
				<input type="radio" id="bed_kind4" name="bed_kind" value="서랍/수납형">
				<label for="bed_kind4">서랍/수납형</label>
				<input type="radio" id="bed_kind5" name="bed_kind" value="2층 침대">
				<label for="bed_kind5">2층 침대</label>
				<input type="radio" id="bed_kind6" name=bed_kind value="기타">
				<label for="bed_kind6">기타</label>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">특이사항</span><br>
				<input type="radio" id="bed_type1" name="bed_type" value="일반침대">
				<label for="bed_type1">일반침대</label>
				<input type="radio" id="bed_type2" name="bed_type" value="라텍스">
				<label for="bed_type2">라텍스</label>
				<input type="radio" id="bed_type3" name="bed_type" value="돌침대">
				<label for="bed_type3">돌침대</label>
				<br>
				<input type="radio" id="bed_type4" name="bed_type" value="물침대">
				<label for="bed_type4">물침대</label>
				<input type="radio" id="bed_type5" name="bed_type" value="기타">
				<label for="bed_type5">기타</label>
			</div>
			
			<hr>
			
			<div align="center">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</div>			
		</div>
		
		<!-- 책상/테이블 팝업창 -->
		<div class="pop_table">
			<div align="center">
				<span style="font-size: 30px; font-weight: bold">책상/테이블</span>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">모양</span><br>
				<input type="radio" id="table1" name="table" value="원형">
				<label for="table1">원형</label>
				<input type="radio" id="table2" name="table" value="일반형">
				<label for="table2">일반형</label>
				<input type="radio" id="table3" name="table" value="ㄱ자형">
				<label for="table3">ㄱ자형</label>
				<input type="radio" id="table4" name="table" value="서랍형">
				<label for="table4">서랍형</label>
				<input type="radio" id="table5" name="table" value="기타">
				<label for="table5">기타</label>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">재질</span><br>
				<input type="radio" id="table_material1" name="table_material" value="나무">
				<label for="table_material1">나무</label>
				<input type="radio" id="table_material2" name="table_material" value="철제">
				<label for="table_material2">철제</label>
				<input type="radio" id="table_material3" name="table_material" value="대리석">
				<label for="table_material3">대리석</label>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">사이즈</span><br>
				<input type="radio" id="table_size1" name="table_size" value="1~2인용">
				<label for="table_size1">1~2인용</label>
				<input type="radio" id="table_size2" name="table_size" value="3~4인용">
				<label for="table_size2">3~4인용</label>
				<input type="radio" id="table_size3" name="table_size" value="5~6인용">
				<label for="table_size3">5~6인용</label>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">너비</span><br>
				<input type="radio" id="table_width1" name="table_width" value="50cm미만">
				<label for="table_width1">50cm미만</label>
				<input type="radio" id="table_width2" name="table_width" value="50~100cm">
				<label for="table_width2">50~100cm</label>
				<input type="radio" id="table_width3" name="table_width" value="100~150cm">
				<label for="table_width3">100~150cm</label>
				<input type="radio" id="table_width4" name="table_width" value="150cm초과">
				<label for="table_width4">150cm초과</label>
			</div>
			
			<hr>
			
			<div align="center">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</div>			
		</div>
		
		<!-- 의자 팝업창 -->
		<div class="pop_chair">
			<div align="center">
				<span style="font-size: 30px; font-weight: bold">의자</span>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">종류</span><br>
				<input type="radio" id="chair1" name="chair" value="가정용">
				<label for="chair1">가정용</label>
				<input type="radio" id="chair2" name="chair" value="사무용">
				<label for="chair2">사무용</label>
				<input type="radio" id="chair3" name="chair" value="기타">
				<label for="chair3">기타</label>
			</div>		
			
			<hr>
			
			<div align="center">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</div>			
		</div>
		
		<!-- 책장 팝업창 -->
		<div class="pop_bookcase">
			<div align="center">
				<span style="font-size: 30px; font-weight: bold">책장</span>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">너비</span><br>
				<input type="radio" id="bookcase_width1" name="bookcase_width" value="50cm미만">
				<label for="bookcase_width1">50cm미만</label>
				<input type="radio" id="bookcase_width2" name="bookcase_width" value="50~100cm">
				<label for="bookcase_width2">50~100cm</label>
				<input type="radio" id="bookcase_width3" name="bookcase_width" value="100~150cm">
				<label for="bookcase_width3">100~150cm</label>
				<input type="radio" id="bookcase_width4" name="bookcase_width" value="150cm초과">
				<label for="bookcase_width4">150cm초과</label>
			</div>	
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">높이</span><br>
				<input type="radio" id="bookcase_height1" name="bookcase_height" value="50cm미만">
				<label for="bookcase_height1">50cm미만</label>
				<input type="radio" id="bookcase_height2" name="bookcase_height" value="50~100cm">
				<label for="bookcase_height2">50~100cm</label>
				<input type="radio" id="bookcase_height3" name="bookcase_height" value="100~150cm">
				<label for="bookcase_height3">100~150cm</label>
				<input type="radio" id="bookcase_heighte4" name="bookcase_height" value="150cm초과">
				<label for="bookcase_height4">150cm초과</label>
			</div>		
			
			<hr>
			
			<div align="center">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</div>			
		</div>
		
		<!-- 옷장 팝업창 -->
		<div class="pop_closet">
			<div align="center">
				<span style="font-size: 30px; font-weight: bold">옷장</span>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">종류</span><br>
				<input type="radio" id="closet1" name="closet" value="단품형">
				<label for="closet1">단품형</label>
				<input type="radio" id="closet2" name="closet" value="조립형">
				<label for="closet2">조립형</label>
				<input type="radio" id="closet3" name="closet" value="슬라이드장">
				<label for="closet3">슬라이드장</label>
				<input type="radio" id="closet4" name="closet" value="붙박이">
				<label for="closet4">붙박이</label>
				<input type="radio" id="closet5" name="closet" value="기타">
				<label for="closet5">기타</label>
			</div>	
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">옷장 문 수</span><br>
				<input type="radio" id="closet_door1" name="closet_door" value="1개">
				<label for="closet_door1">1개</label>
				<input type="radio" id="closet_door2" name="closet_door" value="2개">
				<label for="closet_door2">2개</label>
				<input type="radio" id="closet_door3" name="closet_door" value="3~4개">
				<label for="closet_door3">3~4개</label>
				<input type="radio" id="closet_door4" name="closet_door" value="5개 이상">
				<label for="closet_door4">5개 이상</label>
				<input type="radio" id="closet_door5" name="closet_door" value="기타">
				<label for="closet_door5">기타</label>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">개별 옷장 너비</span><br>
				<input type="radio" id="closet_width1" name="closet_width" value="1m이하">
				<label for="closet_width1">1m이하</label>
				<input type="radio" id="closet_width2" name="closet_width" value="1~1.5m">
				<label for="closet_width2">1~1.5m</label>
				<input type="radio" id="closet_width3" name="closet_width" value="1.5~3m">
				<label for="closet_width3">1.5~3m</label>
				<input type="radio" id="closet_width4" name="closet_width" value="3m이상">
				<label for="closet_width4">3m이상</label>
				<input type="radio" id="closet_width5" name="closet_width" value="기타">
				<label for="closet_width5">기타</label>
			</div>			
			
			<hr>
			
			<div align="center">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</div>			
		</div>
		
		<!-- 수납장 팝업창 -->
		<div class="pop_storage">
			<div align="center">
				<span style="font-size: 30px; font-weight: bold">수납장</span>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">재질</span><br>
				<input type="radio" id="storage_mat1" name="storage_mat" value="플라스틱">
				<label for="storage_mat1">플라스틱</label>
				<input type="radio" id="storage_mat2" name="storage_mat" value="나무">
				<label for="storage_mat2">나무</label>
				<input type="radio" id="storage_mat3" name="storage_mat" value="철제">
				<label for="storage_mat3">철제</label>
				<input type="radio" id="storage_mat4" name="storage_mat" value="기타">
				<label for="storage_mat4">기타</label>
			</div>	
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">너비</span><br>
				<input type="radio" id="storage_width1" name="storage_width" value="50cm미만">
				<label for="storage_width1">50cm미만</label>
				<input type="radio" id="storage_width2" name="storage_width" value="50~100cm">
				<label for="storage_width2">50~100cm</label>
				<input type="radio" id="storage_width3" name="storage_width" value="100~150cm">
				<label for="storage_width3">100~150cm</label>
				<input type="radio" id="storage_width4" name="storage_width" value="150cm초과">
				<label for="storage_width4">150cm초과</label>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">높이</span><br>
				<input type="radio" id="storage_height1" name="storage_height" value="50cm미만">
				<label for="storage_height1">50cm미만</label>
				<input type="radio" id="storage_height2" name="storage_height" value="50~100cm">
				<label for="storage_height2">50~100cm</label>
				<input type="radio" id="storage_height3" name="storage_height" value="100~150cm">
				<label for="storage_height3">100~150cm</label>
				<input type="radio" id="storage_height4" name="storage_height" value="150cm초과">
				<label for="storage_height4">150cm초과</label>
			</div>		
			
			<hr>
			
			<div align="center">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</div>			
		</div>
		
		<!-- 진열장 팝업창 -->
		<div class="pop_showcase">
			<div align="center">
				<span style="font-size: 30px; font-weight: bold">진열장</span>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">유리 구성 여부</span><br>
				<input type="radio" id="showcase1" name="showcase" value="유리 있음">
				<label for="showcase1">유리 있음</label>
				<input type="radio" id="showcase2" name="showcase" value="유리 없음">
				<label for="showcase2">유리 없음</label>
			</div>	
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">너비</span><br>
				<input type="radio" id="showcase_width1" name="showcase_width" value="50cm미만">
				<label for="showcase_width1">50cm미만</label>
				<input type="radio" id="showcase_width2" name="showcase_width" value="50~100cm">
				<label for="showcase_width2">50~100cm</label>
				<input type="radio" id="showcase_width3" name="showcase_width" value="100~150cm">
				<label for="showcase_width3">100~150cm</label>
				<input type="radio" id="showcase_width4" name="showcase_width" value="150cm초과">
				<label for="showcase_width4">150cm초과</label>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">높이</span><br>
				<input type="radio" id="showcase_height1" name="showcase_height" value="50cm미만">
				<label for="showcase_height1">50cm미만</label>
				<input type="radio" id="showcase_height2" name="showcase_height" value="50~100cm">
				<label for="showcase_height2">50~100cm</label>
				<input type="radio" id="showcase_height3" name="showcase_height" value="100~150cm">
				<label for="showcase_height3">100~150cm</label>
				<input type="radio" id="showcase_height4" name="showcase_height" value="150cm초과">
				<label for="showcase_height4">150cm초과</label>
			</div>		
			
			<hr>
			
			<div align="center">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</div>			
		</div>
		
		<!-- 쇼파 팝업창 -->
		<div class="pop_sofa">
			<div align="center">
				<span style="font-size: 30px; font-weight: bold">쇼파</span>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">크기</span><br>
				<input type="radio" id="sofa1" name="sofa" value="1인용">
				<label for="sofa1">1인용</label>
				<input type="radio" id="sofa2" name="sofa" value="2인용">
				<label for="sofa2">2인용</label>
				<input type="radio" id="sofa3" name="sofa" value="3인용">
				<label for="sofa3">2인용</label>
			</div>	
			
			<hr>			
			
			<div align="center">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</div>			
		</div>
		
		<!-- 행거 팝업창 -->
		<div class="pop_hanger">
			<div align="center">
				<span style="font-size: 30px; font-weight: bold">행거</span>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">종류</span><br>
				<input type="radio" id="hanger1" name="hanger" value="이동형">
				<label for="hanger1">이동형</label>
				<input type="radio" id="hanger2" name="hanger" value="설치형">
				<label for="hanger2">설치형</label>
				<input type="radio" id="hanger3" name="hanger" value="기타">
				<label for="hanger3">기타</label>
			</div>	
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">너비</span><br>
				<input type="radio" id="hanger_width1" name="hanger_width" value="50cm미만">
				<label for="hanger_width1">50cm미만</label>
				<input type="radio" id="hanger_width2" name="hanger_width" value="50~100cm">
				<label for="hanger_width2">50~100cm</label>
				<input type="radio" id="hanger_width3" name="hanger_width" value="100~150cm">
				<label for="hanger_width3">100~150cm</label>
				<input type="radio" id="hanger_width4" name="hanger_width" value="150cm초과">
				<label for="hanger_width4">150cm초과</label>
			</div>			
			
			<hr>
			
			<div align="center">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</div>			
		</div>
		
		<!-- 거울 팝업창 -->
		<div class="pop_mirror">
			<div align="center">
				<span style="font-size: 30px; font-weight: bold">거울</span>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">종류</span><br>
				<input type="radio" id="mirror1" name="mirror" value="벽걸이형">
				<label for="mirror1">벽걸이형</label>
				<input type="radio" id="mirror2" name="mirror" value="스탠딩형">
				<label for="mirror2">스탠딩형</label>
				<input type="radio" id="mirror3" name="mirror" value="기타">
				<label for="mirror3">기타</label>
			</div>	
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">크기</span><br>
				<input type="radio" id="mirror_size1" name="mirror_size" value="반전신">
				<label for="mirror_size1">반전신</label>
				<input type="radio" id="mirror_size2" name="mirror_size" value="전신">
				<label for="mirror_size2">전신</label>
			</div>			
			
			<hr>
			
			<div align="center">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</div>			
		</div>
		
		<!-- 화장대 팝업창 -->
		<div class="pop_makeup">
			<div align="center">
				<span style="font-size: 30px; font-weight: bold">화장대</span>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">재질</span><br>
				<input type="radio" id="makeup_mat1" name="makeup_mat" value="플라스틱">
				<label for="makeup_mat1">플라스틱</label>
				<input type="radio" id="makeup_mat2" name="makeup_mat" value="나무">
				<label for="makeup_mat2">나무</label>
				<input type="radio" id="makeup_mat3" name="makeup_mat" value="철제">
				<label for="makeup_mat3">철제</label>
				<input type="radio" id="makeup_mat4" name="makeup_mat" value="기타">
				<label for=makeup_mat4>기타</label>
			</div>	
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">종류</span><br>
				<input type="radio" id="makeup_kind1" name="makeup_kind" value="미니화장대">
				<label for="makeup_kind1">미니화장대</label>
				<input type="radio" id="makeup_kind2" name="makeup_kind" value="1~2단서랍형">
				<label for="makeup_kind2">1~2단서랍형</label>
				<input type="radio" id="makeup_kind3" name="makeup_kind" value="3단이상 수납형">
				<label for="makeup_kind3">3단이상 수납형</label>
			</div>			
			
			<hr>
			
			<div align="center">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</div>			
		</div>
		
		<!-- 피아노 팝업창 -->
		<div class="pop_piano">
			<div align="center">
				<span style="font-size: 30px; font-weight: bold">피아노</span>
			</div>
			
			<hr>
			
			<div align="center">
				<span style="font-size: 20px;">종류</span><br>
				<input type="radio" id="piano1" name="piano" value="디지털 피아노">
				<label for="piano1">디지털 피아노</label>
				<input type="radio" id="piano2" name="piano" value="일반 피아노">
				<label for="piano2">일반 피아노</label>
				<input type="radio" id="piano3" name="piano" value="그랜드 피아노">
				<label for="piano3">그랜드 피아노</label>
				<input type="radio" id="piano4" name="piano" value="기타">
				<label for=piano4>기타</label>
			</div>						
			
			<hr>
			
			<div align="center">
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</div>			
		</div>
	</form>
</body>
</html>