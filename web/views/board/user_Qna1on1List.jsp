<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
container{
	align:"center";
}
#a{
 list-style-type: none;
 font-size: 15px;
}
</style>
</head>
<body>
	<%@ include file="/views/common/user_TopBar.jsp"%>
<div class="container" style="padding-top: 100px;">
  <h1>Q&A</h1>
  <h3>자주 묻는 질문</h3>
  <p>무엇이 궁금하신가요?!</p>

  <ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#home">견적/운송</a></li>
    <li><a data-toggle="tab" href="#menu1">결제/진행</a></li>
    <li><a data-toggle="tab" href="#menu2">변경/취소</a></li>
    <li><a data-toggle="tab" href="#menu3">기타문의</a></li>
  </ul>

  <div class="tab-content">
    <div id="home" class="tab-pane fade in active">
      
      <ul id="a">
      	<li>Q이사를 취소 하고 싶어요.</li>
      	<li>Q 이사 날짜를 변경하고 싶어요.</li>
      	<li>Q 짐이 추가 되었어요</li>
      </ul>
    </div>
    
    <div id="menu1" class="tab-pane fade">
      <ul id="a">
      	<li>Q이사를 취소 하고 싶어요.</li>
      	<li>Q 이사 날짜를 변경하고 싶어요.</li>
      	<li>Q 짐이 추가 되었어요</li>
      </ul>
    </div>
    
    <div id="menu2" class="tab-pane fade">
     <ul id="a">
      	<li>Q이사를 취소 하고 싶어요.</li>
      	<li>Q 이사 날짜를 변경하고 싶어요.</li>
      	<li>Q 짐이 추가 되었어요</li>
      </ul>
    </div>
    <div id="menu3" class="tab-pane fade">
      <ul id="a">
      	<li>Q이사를 취소 하고 싶어요.</li>
      	<li>Q 이사 날짜를 변경하고 싶어요.</li>
      	<li>Q 짐이 추가 되었어요</li>
      </ul>
    </div>
  </div>
</div>

<br><br><br>

<div class="container">
  <h2>1:1문의</h2>
  <p style="float:left">내가 문의한 내용 보기</p>  
  <a href="/semi/views/board/serviceCenter/user_Insert1on1.jsp"><button style="float:right;">문의하기</button></a>  
  <br><br><br>   
  <table class="table">
    <thead>
      <tr>
        <th>문의내역</th> 
        <th>제목</th>
        <th>문의날짜</th>
        <th>답변
      </tr>
    </thead>
    <tbody>
      <tr>
        <td>매칭관련</td>
        <td>매칭 어쩌고</td>
        <td>2091.07.01</td>
        <td>답변완료</td>
      </tr>
      <tr>
        <td>이사관련</td>
        <td>이사 어쩌고</td>
        <td>2019.06.01</td>
        <td>답변완료</td>
      </tr>
      <tr>
        <td>취소</td>
        <td>취고 어쩌고</td>
        <td>2019.04.28</td>
        <td>답변대기</td>
      </tr>
    </tbody>
  </table>
</div>

</body>
</html>