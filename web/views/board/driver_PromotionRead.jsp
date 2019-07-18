<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<title>게시판 상세보기</title>
<style type="text/css">
	* {font-size: 9pt;}
	p {width: 600px; text-align: right;margin: 0 auto;}
	table tbody tr th {background-color: gray;}


	.con{

		margin:0 auto;
		padding: 1px;
		text-align: center;


	}
</style>
<script type="text/javascript">
	function goUrl(url) {
		location.href=url;
	}
</script>
</head>
<body>
	<%@ include file="/views/common/user_TopBar.jsp"%>
		<br><br><br><br><br>

	<form name="searchForm" action="" method="get">
	<p>
		<select name="searchType">
			<option value="ALL">전체검색</option>
			<option value="SUBJECT">제목</option>
			<option value="WRITER">작성자</option>
			<option value="CONTENTS">내용</option>
		</select>
		<input type="text" name="searchText" value="" />
		<input type="submit" value="검색" />
	</p>
	</form>
	<table align="center" border="1" summary="게시판 목록">
		<caption>게시판 목록</caption>
		<colgroup>
			<col width="50" />
			<col width="300" />
			<col width="80" />
			<col width="100" />
			<col width="70" />
		</colgroup>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록 일시</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td align="center" colspan="5">등록된 게시물이 없습니다.</td>
			</tr>
			<tr>
				<td align="center">1</td>
				<td><a href="boardView.jsp">동해물과 백두산이 마르고 닳도록 하...</a></td>
				<td align="center">김연석</td>
				<td align="center">2013.06.24</td>
				<td align="center">10</td>
			</tr>
		</tbody>

		<tbody>

			<tr>
				<td align="center">1</td>
				<td><a href="../boardlist.jsp">동해물과 백두산이 마르고 닳도록 하...</a></td>
				<td align="center">김연석</td>
				<td align="center">2013.06.24</td>
				<td align="center">10</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				 <td colspan="5">
				 	<div class="con">
	  <ul class="pagination">
	    <li><a href="#">1</a></li>
	    <li class="active"><a href="#">2</a></li>
	    <li><a href="#">3</a></li>
	    <li><a href="#">4</a></li>
	    <li><a href="#">5</a></li>
	     <li><a href="#">다음</a></li>
	      <li><a href="#">맨끝</a></li>
	  </ul>
	</div>
				 </td>

				</tr>
		</tfoot>
	</table>
	<p>
		<select>
			<option>5줄로 보기</option>
			<option>10줄로 보기</option>

		</select>

		<input type="button" value="글쓰기" onclick="goUrl('boardWriteForm.jsp');" />
	</p>

		<table align="center" border="1" summary="게시판 상세조회">
		<caption>게시판 상세조회</caption>
		<colgroup>
			<col width="100" />
			<col width="500" />
		</colgroup>
		<tbody>
			<tr>
				<th align="center">제목</th>
				<td>[3월의 기사님] 짧은 기간에도 불구하고 이사 진행 건수가 많았던 진짜 이유 - 이현우 기사님</td>
			</tr>
			<tr>
				<th align="center">작성자/조회수</th>
				<td>관리자 / 11</td>
			</tr>
			<tr>
				<td colspan="2">
				<img src="../board/images/driver1.png" width="300px" height="300px"  />
				빠르게 옮기는 것도 좋지만, 그보다 중요한 건 안전이에요. 우선 첫째로 사람이 다치지 않아야 하고, 둘째로 물건이 다치지 않아야 해요. 하루는 고객 이사를 도와주러 온 남자분이 힘도 넘치고 의욕도 넘쳐서 여기저기 엄청 뛰어다니는 거예요. 저러다 다칠까 봐 걱정되더라구요. 아니나 다를까, 지하 주차장에 대있던 트럭에 폴짝 뛰어 올라서더니 ‘억!’ 하는 소리를 내는거에요. 주차장 천장에 머리가 부딪힌 거죠. 남자분이 괜찮다고 얘기하는데 머리에서 피가 주르륵 흐르는 거에요. 놀라서  마무리는 혼자 할 테니 얼른 짐내려두고 얼른 병원 갔다 오라고 했던 일이 있었어요. 기분 좋은 이삿날 사람이든 물건이든 다치면 마음이 아프잖아요. 그래서 항상 이사하러 갈 때마다 고객한테 신신당부해요. 천천히 하더라도 안전하고 기분 좋게 이사를 마치자고.
				</td>
			</tr>
		</tbody>
	</table>

<!-- 	<table align="center" border="1" summary="게시판 상세조회">
	 <caption>이 달의 기사</caption>
		<colgroup>
			<col width="100" />
			<col width="500" />
		</colgroup>
		<tbody>
			<tr>
				<th align="center">제목</th>
				<td>동해물과 백두산이 마르고 닳도록 하느님이 보우하사</td>
			</tr>
			<tr>
				<th align="center">작성자/조회수</th>
				<td>김연석 / 11</td>
			</tr>
			<tr>
				<td colspan="2">동해물과 백두산이</td>
			</tr>
		</tbody>




	</table>  -->
	<p>

		<input type="button" value="목록" onclick="goUrl('boardList.jsp');" />
		<input type="button" value="수정" onclick="goUrl('boardModifyForm.jsp');" />
		<input type="button" value="삭제" onclick="goUrl('boardProcess.jsp');" />
	</p>
</body>
</html>