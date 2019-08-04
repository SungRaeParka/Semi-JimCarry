<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jimcarry.board.model.vo.*"%>
<%
	ArrayList<DP> dpList = (ArrayList<DP>) request.getAttribute("dpList");
	DPPageInfo pi = (DPPageInfo) request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<head>
<title>게시판 목록</title>
<style>
	.outer {
		margin-top: 90px;
	}
	
	.tableArea {
		width: 800px;
	}
	
	#topArea {
		height: 30px;
		width: 800px;
		background: #EFEFEF;
	}
	
	#listArea {
		width: 800px;
		display: inline-block;
		border-bottom: 1px solid #F2F2F2;
	}
	
	#imgArea {
		width: 70px;
		height: 70px;
		text-align: left;	
		margin-left: 10px;
		float: left;
	}	
	
	#title {
		color: #4D85FD;
		font-size: 25px;
	}
	
	#titleArea {
		float: left;
		margin-left: 10px;
	}
	
	.pagingArea > span {
		padding-left: 30px;
		padding-bottom: 30px;
		padding-top: 30px;
		color:lightgray;
	}
	
	.pagingArea > span:hover{
		color:black;
	}
	
</style>
</head>
<body>
	<%@ include file="/views/common/user_TopBar.jsp"%>
		
	<div class="outer" align="center">		
		<h2>기사 홍보 게시판</h2>
		<div class="tableArea">
			<div id="topArea">
			</div>
		<%for(DP dp : dpList){ %>
			<div id="listArea">
				<div id="imgArea">
					<img src="/semi/images_uploadFiles/<%=dp.getChangeName()%>" style="width: 70px; height: 70px;">
				</div>
				<div id="titleArea" class="titleArea2">
				<input type="hidden" name="postNo" value="<%=dp.getPostNo() %>">
					<span class="titleSpan" id="title"><%=dp.getPostTitle() %></span>
					<br>
					<span style="float: left;">작성자 : 운영자</span>	
					<br>	
					<span style="float: left;">작성일 : <%=dp.getPostDate() %></span>			
				</div>
			</div>	
		<%} %>		
		</div>
		
		<div class="pagingArea" align="center">
			<span class="span" style="cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/selectList.dp?currentPage=1'">첫 페이지로</span>
			
			<!-- currentPage가 1페이지인 경우 -->
			<% if(currentPage <= 1) { %>
			<!-- 버튼 비 활성화 -->
			<span class="span" style="cursor: pointer;">이전 페이지</span>
			<% }else{ %>
			<!-- 1페이지가 아닐 경우 이전으로 이동 -->
			<span class="span" style="cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/selectList.dp?currentPage=<%=currentPage-1%>'">이전 페이지로</span>
			<% } %>
			
			<% for(int p = startPage; p <= endPage; p++) {
				if(currentPage == p){
			%>
				<span class="span" style="cursor: pointer;"><%= p %></span>
			<%  }else { %>
				<span class="span" style="cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/selectList.dp?currentPage=<%=p%>'"><%=p %></span>
			<%  }
			   } %>
			   
			<!-- 다음 페이지 -->
			<% if(currentPage >= maxPage) { %>
			<span class="span" style="cursor: pointer;">다음 페이지</span>
			<% }else{ %>
			<span class="span" style="cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/selectList.dp?currentPage=<%=currentPage+1%>'">다음 페이지</span>
			<% } %>
			
			
			<span class="span" style="cursor: pointer;" onclick="location.href='<%=request.getContextPath()%>/selectList.dp?currentPage=<%=maxPage%>'">끝 페이지로</span>		
		</div>
		
	</div>
	
	<script>
	$(function(){
		$(".titleArea2").mouseenter(function(){
			$(this).parent().css({"background":"#FAFAFA", "cursor":"pointer"});
		}).mouseout(function(){
			$(this).parent().css({"background":"white"});
		}).click(function(){
			var num = $(this).children().eq(0).val();	
			
			console.log(num);
			
			location.href="<%=request.getContextPath()%>/selectOne.dp?num=" + num;
		});
	});
	

	</script>
	
</body>
</html>



