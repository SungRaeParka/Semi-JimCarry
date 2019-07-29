<%@page import="com.kh.jimcarry.serviceCenter.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jimcarry.serviceCenter.model.vo.*"%>
    <%
    ArrayList<Notice> list=(ArrayList<Notice>) request.getAttribute("list"); 
    ArrayList<QandA> list1=(ArrayList<QandA>)request.getAttribute("list1");
    ArrayList<OneQ> list2=(ArrayList<OneQ>)request.getAttribute("list2");
    %>
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
	
<div class="container">
<br><br><br>
  <h2>공지사항</h2>
  <table class="table table-hover">
    <thead>
      <tr>
      	<th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일자</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody>
    <%for(Notice n : list) {%>
      <tr>
      <td><%=n.getPostcode() %></td>
      <td><%=n.getPostTitle() %></td>
      <td><%=n.getUserNo() %></td>
      <td><%=n.getPostdate() %></td>
      <td><%=n.getbCount() %></td>
      
      <%} %>
      
       <!--  <td>1</td>
        <td>2</td>
        <td>3</td>
        <td>r</td>
        <td>s</td>
      </tr>
      <tr>
        <td>4</td>
        <td>5</td>
        <td>6</td>
        <td>t</td>
        <td>d</td>
      </tr>
      <tr>
        <td>7</td>
        <td>8</td>
        <td>9</td>
        <td>q</td>
        <td>a</td>
	</tr> -->
    </tbody>
  </table>
</div>
<br><br><br>
<div class="container">
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
    <%for(QandA qa : list1) {%>
  <div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
        
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1"><%=qa.getPostTitle() %></a>
        </h4>
      </div>
      <div id="collapse1" class="panel-collapse collapse in">
        <div class="panel-body"><%=qa.getPostContent() %></div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2"><%=qa.getPostTitle() %></a>
        </h4>
      </div>
      <div id="collapse2" class="panel-collapse collapse">
        <div class="panel-body"><%=qa.getPostContent() %></div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse3"><%=qa.getPostTitle() %></a>
        </h4>
      </div>
      <div id="collapse3" class="panel-collapse collapse">
        <div class="panel-body"><%=qa.getPostContent() %></div>
      </div>
    </div>
  </div>
  <%} %> 
</div>

	<div id="menu1" class="tab-pane fade">
	<%for(QandA qa : list1) {%>
	<div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse4"><%=qa.getPostTitle() %></a>
        </h4>
      </div>
      <div id="collapse4" class="panel-collapse collapse in">
        <div class="panel-body"><%=qa.getPostContent() %></div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse5"><%=qa.getPostTitle() %></a>
        </h4>
      </div>
      <div id="collapse5" class="panel-collapse collapse">
        <div class="panel-body"><%=qa.getPostContent() %></div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse6"><%=qa.getPostTitle() %></a>
        </h4>
      </div>
      <div id="collapse6" class="panel-collapse collapse">
        <div class="panel-body"><%=qa.getPostContent() %></div>
      </div>
    </div>
  </div>
  <%} %>
	</div>
	
	<div id="menu2" class="tab-pane fade">
	<%for(QandA qa : list1) {%>
	<div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse7"><%=qa.getPostTitle() %></a>
        </h4>
      </div>
      <div id="collapse7" class="panel-collapse collapse in">
        <div class="panel-body"><%=qa.getPostContent() %></div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse8"><%=qa.getPostTitle() %></a>
        </h4>
      </div>
      <div id="collapse8" class="panel-collapse collapse">
        <div class="panel-body"><%=qa.getPostContent() %></div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse9"><%=qa.getPostTitle() %></a>
        </h4>
      </div>
      <div id="collapse9" class="panel-collapse collapse">
        <div class="panel-body"><%=qa.getPostContent() %></div>
      </div>
    </div>
  </div>
  <%} %>
	</div>
	
	<div id="menu3" class="tab-pane fade">
	<%for(QandA qa : list1) {%>
	<div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse10"><%=qa.getPostTitle() %></a>
        </h4>
      </div>
      <div id="collapse10" class="panel-collapse collapse in">
        <div class="panel-body"><%=qa.getPostContent() %></div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse11"><%=qa.getPostTitle() %></a>
        </h4>
      </div>
      <div id="collapse11" class="panel-collapse collapse">
        <div class="panel-body"><%=qa.getPostContent() %></div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapse12"><%=qa.getPostTitle() %></a>
        </h4>
      </div>
      <div id="collapse12" class="panel-collapse collapse">
        <div class="panel-body"><%=qa.getPostContent() %></div>
      </div>
    </div>
    <%} %>
  </div>
	</div>

</div>
</div>

<br><br><br>

<div class="container">
  <h2>1:1문의</h2>
  <p style="float:left">내가 문의한 내용 보기</p>  
  <a href="/semi/views/board/user_Insert1on1.jsp"><button  style="float:right;">문의하기</button></a>     
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
     <%for(OneQ one : list2) {%>
      <tr>
      <th><%=one.getQuestionType() %></th>
      <th><%=one.getPostTitle() %></th>
      <%-- <th><%=one.getPostDate() %></th>
      <th><%=one.getAnswer() %></th> --%>
      
      <%} %>
    </tbody>
  </table>
</div>

</body>
</html>