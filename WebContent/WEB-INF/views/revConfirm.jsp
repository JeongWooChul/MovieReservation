<%@page import="com.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
 #jb-revContent {
    width: 70%;
    /* min-height: 400px;
    max-height: 400px; */
    padding: 20px;
    
    /* padding-top: unset; */
    margin: 70px;
    /* float: left; */
    border: 1.5px solid #bcbcbc;
    overflow:auto;
    border-radius: 1rem;
  }


</style>

</head>
<body>
<%
MemberDto mem = (MemberDto)session.getAttribute("login");


if(mem == null){
	response.sendRedirect("login.jsp");
	%>
	<script type="text/javascript">
		alert("로그인 후  이용 가능합니다")
		location.href = "login.do";
	</script>
<%
}

%>


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
					<li class="nav-item"><a class="nav-link" href="movieChart.do" style="font-size:15pt">영화 목록</a></li>
					<li class="nav-item"><span style="font-size: 15pt;color: rgba(255, 255, 255, 0.5);line-height:45px">|</span></li>
					<li class="nav-item"><a class="nav-link" href="ticketing.do" style="font-size:15pt">영화 예매</a></li>
					<li class="nav-item"><span style="font-size: 15pt;color: rgba(255, 255, 255, 0.5);line-height:45px">|</span></li>
					<li class="nav-item"><a class="nav-link" href="reservList.do?id=<%=mem.getId() %>" style="font-size:15pt">예매 내역</a></li>
				</ul>
				<% if(mem != null){ %>
					<span class="navbar-text"><button type="button" id="logout" class="btn btn-warning">로그아웃</button></span>
				<%} %>
			</div>
		</nav>
	</div>
	
    <div align="center"> 
	  <div id="jb-revContent">
	  	<h3>예매가 완료 되었습니다.</h3>
	  	<div style="overflow: auto; padding: 20px">
		  	<div style="float: left;width: auto;padding-left: 70px">
			  	<img src="${revMovie.imgUrl}" class="card-img-top" style="border-radius:1rem; width:200px; float: left; " >
		  	</div>
		  	
		  	<div align="justify" style="float:left; width:280px;height:280px;padding-top: 50px; padding-left: 50px">
			  	<h5>예매자 : ${revMovie.id}</h5>
			  	<h5>제목 : ${revMovie.title}</h5>
			  	<h5>극장 : ${revMovie.theater}</h5>
			  	<h5>상영시간 : ${revMovie.movTime}</h5>
			  	<button type="button" class="btn btn-info" onclick="location.href='movieChart.do'">영화 목록</button>
			  	<button type="button" class="btn btn-info" onclick="location.href='reservList.do?id=<%=mem.getId() %>'">모든 예약 확인</button>
		  	</div>
	  	</div>
	  </div>
	 </div>
	  	  
	  <div id="jb-footer">
		<h5>Copyright 2020. JeongWooChul. All rights reserved.</h5>
	  </div>
</div>
<br><br>

</body>



<script type="text/javascript">

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


</html>