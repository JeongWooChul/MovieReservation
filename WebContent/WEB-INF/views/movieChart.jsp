<%@page import="com.model.MemberDto"%>
<%@page import="com.model.MovieDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
List<MovieDto> list = (List<MovieDto>)request.getAttribute("movieChart");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- Bootstrap CSS -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="css/bootstrap.css">
<link href="https://fonts.googleapis.com/css?family=Gamja+Flower&display=swap&subset=korean" rel="stylesheet">

<style type="text/css">
.popover {
    white-space: pre-wrap;    
}

</style>


</head>
<body>
<%
MemberDto mem = (MemberDto)session.getAttribute("login");

/* 
if(mem == null){
	response.sendRedirect("login.jsp");

	<script type="text/javascript">
		location.href = "login.do";
	</script>

}
 */
%> 

<!-- &#10;&#13; -->
<br>
<div id="jb-container">

	
	<div style="margin-bottom: 25px;">
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark" style="height: 70px; border-radius: 0.5rem;">
			<a class="navbar-brand" href="#">
   				 <img src="./image/Ticket.png" width="45" alt="">
  			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarText" aria-controls="navbarText"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarText">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" href="movieChart.do" style="font-size:15pt">영화 목록</a></li>
					<li class="nav-item"><span style="font-size: 15pt;color: rgba(255, 255, 255, 0.5);line-height:45px">|</span></li>
					<li class="nav-item"><a class="nav-link" href="ticketing.do" style="font-size:15pt">영화 예매</a></li>
					<li class="nav-item"><span style="font-size: 15pt;color: rgba(255, 255, 255, 0.5);line-height:45px">|</span></li>
					<li class="nav-item "><a class="nav-link" href="reservList.do?id=<%=mem.getId() %>" style="font-size:15pt">예매 내역</a></li>
				</ul>
				<% if(mem != null){ %>
					<span class="navbar-text"><button type="button" id="logout" class="btn btn-warning">로그아웃</button></span>
				<%} %>
			</div>
		</nav>
	</div>
	
	
	
	<div align="center">	
	<div style="width: 90%">
		<div class="row row-cols-1 row-cols-md-4">
			<%
				for (int i = 0; i < list.size(); i++) {
					MovieDto dto = list.get(i);
			%>
			<div class="col mb-4" >
				<div class="card h-100" style="border-radius:1rem">
					<img src="<%=dto.getImgUrl()%>" class="card-img-top" style="border-radius:1rem" > 
					<%-- <input type="hidden" id="detailUrl" value="<%=dto.getDetailUrl() + '_' + i%>"> --%>
					<div class="card-body" style="padding: 1rem">
						<h5 class="card-title"><%=dto.getTitle()%></h5>
						<p class="card-text"><%=dto.getoDate() %></p>
						<input type="button" class="btn btn-danger" id="reservBtn" value="예매하기" onclick="ticketingBtn()">
					</div>
					<button type="button" style="border-radius:0.25rem 0.25rem 1rem 1rem " class="btn btn-light"
						onclick="movieDetail('<%=dto.getDetailUrl() + '_' + i%>')"
						id="detail<%=i%>" data-toggle="popover" data-placement="top"
						data-original-title="" data-content="">
						상세정보</button>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
	</div>
	
	
	<div id="jb-footer">
		<p>Copyright 2020. JeongWooChul. All rights reserved.</p>
	</div>
	
	
</div>
<br><br>


<!-- 디테일 Ajax 처리-->
<script type="text/javascript">

/* 상세보기  */
function movieDetail(detailUrl) {
	// alert(detailUrl);
	
	var tempArray = detailUrl.split("_");
	var url = tempArray[0];
	var index = tempArray[1];

	$.ajax({
		url:"./movieDetail.do",
		type:"get",
		data:"detailUrl=" + url,
		async:true,
		
		success:function( map ) {

			var content = "감독 : " + map.director+"\n";
			content += "배우 : " + map.actor+"\n";
			content += map.genre+"\n";
			content += "기타 : " + map.content+"\n";
			content += "개봉일 : " + map.oDate+"\n";
			content += "추천 : " + map.like +" 명";
			
			$('#detail'+index).attr("title",map.title);
			$('#detail'+index).attr('data-content',content);
			//$('#test'+index).data("content",map.actor);

			$('#detail'+index).popover();
			// $('[data-toggle="popover"]').popover()
		},
		error:function() {
			alert("error");
		}
	});		
}

/* 예매 버튼 */
function ticketingBtn(){
	//alert(detailUrl);
	location.href = "ticketing.do";
}


$(function() {
	$('#login').click(function() {
		//alert("확인");
		location.href="login.do";
		});

	$('#logout').click(function() {
		//alert("확인");
		if( confirm("로그아웃 합니다") ) {
			location.href = "logout.do";
		} 
	});
});

</script>


</body>
</html>