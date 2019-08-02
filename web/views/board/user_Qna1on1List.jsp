<%@page import="com.kh.jimcarry.serviceCenter.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jimcarry.serviceCenter.model.vo.*"%>
    <%
    ArrayList<Notice> list=(ArrayList<Notice>) request.getAttribute("list"); 
     ArrayList<QandA> list1=(ArrayList<QandA>)request.getAttribute("list1");
    ArrayList<OneQ> list2=(ArrayList<OneQ>)request.getAttribute("list2"); 
    
    PageInfo pi = (PageInfo) request.getAttribute("pi");
    int listCount = pi.getListCount();
    int currentPage = pi.getCurrentPage();
    int maxPage=pi.getMaxPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();
   PageInfo pi1 =(PageInfo) request.getAttribute("pi1");
    int listCount1 = pi1.getListCount1();
    int currentPage1 = pi1.getCurrentPage1();
    int maxPage1=pi1.getMaxPage1();
    int startPage1 = pi1.getStartPage1();
    int endPage1 = pi1.getEndPage1();
    PageInfo pi2=(PageInfo) request.getAttribute("pi2");
    int listCount2 = pi2.getListCount();
    int currentPage2 = pi2.getCurrentPage();
    int maxPage2=pi2.getMaxPage();
    int startPage2 = pi2.getStartPage();
    int endPage2 = pi2.getEndPage();  
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
  <table class="table table-hover" >
    <thead>
      <tr>
      	<th>번호</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일자</th>
        <th>조회수</th>
      </tr>
    </thead>
    <tbody id="listArea">
     <%for(Notice n : list) {%>
     
      <tr>
      <td><%=n.getPostNo() %></td>
      <td><%=n.getPostTitle() %></td>
      <td><%=n.getUserNo() %></td>
      <td><%=n.getPostdate() %></td>
      <td><%=n.getbCount() %></td>
      </tr>
      
      <%
      System.out.println("번호"+n.getPostNo());
      System.out.println("제목"+n.getPostTitle());
      System.out.println("작성자"+n.getUserNo() );
      System.out.println("날짜"+n.getPostdate());
      System.out.println("조회수"+n.getbCount());
    } %> 
      
     <!--  <tr>
         <td>1</td>
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
      </tr> -->
     <!-- <tr>
        <td>7</td>
        <td>8</td>
        <td>9</td>
        <td>q</td>
        <td>a</td>
	</tr> -->
    </tbody>
  </table>

<!-- ㅠㅔ이징 처리 -->
<div class="pagingArea" align="center">
	<button onclick="location.href='<%=request.getContextPath() %>/noticelist.no?currentPage=1'">처음으로</button>
	
	<%if(currentPage <= 1) {%>
	<button disabled>이전</button>
	<%}else { %>
	<button onclick="location.href='<%=request.getContextPath() %>/noticelist.no?currentPage=<%=currentPage - 1 %>'">이전</button>
	<%} %>
	
	<%for(int p=startPage; p<=endPage;p++){
		if(currentPage == p){
		%>
		<button disabled><%=p %></button>
	<% }else {%>
		<button onclick="location.href='<%=request.getContextPath()%>/noticelist.no?currentPage=<%=p%>'"><%=p%></button>
	<%}} %>
	
	<%if(currentPage >= maxPage){ %>
	<button disabled>다음</button>
	<%}else { %>
	<button onckick="location.href='<%=request.getContextPath() %>/noticelist.no?currentPage=<%=currentPage + 1 %>'">다음</button>
	<%} %>
	
	<button onclick="location.href='<%=request.getContextPath() %>/noticelist.no?currentPage=<%=maxPage %>'">끝으로</button>
</div>

</div>
<script>
		$("#listArea td").mouseenter(function(){
			$(this).parent().css({"background":"yellow", "cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background":"white"});
		}).click(function(){
			var num = $(this).parent().children().eq(0).text();
			
			//console.log(num);
			
			location.href="<%=request.getContextPath()%>/selectOne.no?num=" + num;
		});
	</script>

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
  <table class="table" >
    <thead>
      <tr>
        <th>문의내역</th> 
        <th>제목</th>
        <th>문의날짜</th>
        <th>답변
      </tr>
    </thead>
    <tbody id="listArea">
     <%for(OneQ one : list2) {%>
      <tr>
      <input type="hidden">
      <th><%=one.getQuestionType() %></th>
      <th><%=one.getPostTitle() %></th>
      <th><%=one.getPostDate() %></th>
       <th><%=one.getAnswerCheck() %></th>  
      
      <% } %>
    </tbody>
  </table>
<!-- ㅠㅔ이징 처리 -->
<div class="pagingArea" align="center">
	<button onclick="location.href='<%=request.getContextPath() %>/noticelist.no?currentPage2=1'">처음으로</button>
	
	<%if(currentPage <= 1) {%>
	<button disabled>이전</button>
	<%}else { %>
	<button onclick="location.href='<%=request.getContextPath() %>/noticelist.no?currentPage2=<%=currentPage2 - 1 %>'">끝으로</button>
	<%} %>
	
	<%for(int p=startPage2; p<=endPage2;p++){
		if(currentPage2 == p){%>
		<button disabled><%=p %></button>
	<% }else {%>
		<button onclick="location.href='<%=request.getContextPath()%>/noticelist.no2?currentPage2=<%=p%>'"><%=p%></button>
	<%}} %>
	
	<%if(currentPage2 >= maxPage2){ %>
	<button disabled>다음</button>
	<%}else { %>
	<button onckick="location.href='<%=request.getContextPath() %>/noticelist.no2?currentPage2=<%=currentPage2 + 1 %>'">다음</button>
	<%} %>
	
	<button onclick="location.href='<%=request.getContextPath() %>/noticelist.no2?currentPage2=<%=maxPage2 %>'">끝으로</button>
</div>
</div>  

<script>
		$(function(){
			$("#listArea th").mouseenter(function(){
				$(this).parent().css({"background":"yellow", "cursor":"pointer"});
			}).mouseout(function(){
				$(this).parent().css({"background":"white"});
			}).click(function(){
				var num = $(this).parent().children("input").val();
				
				location.href="<%=request.getContextPath()%>/selectOne.no?num=" + num;
			});
		});
	</script>

</body>
</html>