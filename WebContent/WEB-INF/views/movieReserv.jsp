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
<link rel="stylesheet" href="css/bootstrap.css">
<style type="text/css">
a {color: #000000;}
a:hover {text-decoration: none; color: #000000; }

p:hover {background-color: #e9ecef}

h3 {text-align: center;
 margin-bottom: 20px;
 font-weight: bold;
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
					<li class="nav-item active"><a class="nav-link" href="ticketing.do" style="font-size:15pt">영화 예매</a></li>
					<li class="nav-item"><span style="font-size: 15pt;color: rgba(255, 255, 255, 0.5);line-height:45px">|</span></li>
					<li class="nav-item "><a class="nav-link" href="reservList.do?id=<%=mem.getId() %>" style="font-size:15pt">예매 내역</a></li>
				</ul>
				<% if(mem != null){ %>
					<span class="navbar-text"><button type="button" id="logout" class="btn btn-warning">로그아웃</button></span>
				<%} %>
			</div>
		</nav>
	</div>
	
	     
     <div id="jb-sidebar-left" style="border:2px solid #f44336">
	       <h3>영화</h3>    
		   <% for(int i = 0 ; i < list.size(); i++) { 
				MovieDto dto = list.get(i); %>			      		
	      		<p onclick="theaters('<%=dto.getTitle()%>','<%=dto.getImgUrl()%>')"><%=dto.getTitle()%></p>
	      <% } %>    
	  </div>	 
	  <div id="jb-content" style="border:2px solid #ffc107"><h3>극장</h3></div>
	  <div id="jb-sidebar-right" style="border:2px solid #cddc39"><h3>시간</h3></div> 
	  <div align="center"> 	  
		  <div id="jb-footer1">
			  <div style="line-height:45px">
			  	<input type="hidden" id="imgUrl" value="">
				<div id="movie" style="display: inline;font-size: 15pt">영화선택</div>
				<span>　|　</span>
				<div id="theater" style="display: inline;font-size: 15pt">극장선택</div>
				<span>　|　</span>
				<div id="movTime" style="display: inline;font-size: 15pt">시간선택</div>
				<span>　|　</span>
				<button type="button" class="btn btn-info btn-sm" id="finish" disabled="disabled">예매완료</button>
			  </div>
		  </div>
	  </div>	  
	  <div id="jb-footer">
		<h5>Copyright 2020. JeongWooChul. All rights reserved.</h5>
	  </div>
</div>
<br><br>





<script type="text/javascript">

function theaters(title, imgUrl) {
	//alert(title);
	$("#jb-sidebar-right *").remove();
	$("#jb-sidebar-right").append("<h3 style='text-align: center;'>시간</h3>");

	$("#jb-content *").remove();
	$("#jb-content").append("<h3 style='text-align: center;'>극장</h3>");
	$("#jb-content").append("<p><label><input type='radio' name='theaters' onclick='movTime()' value='CGV 수원'>&nbsp;&nbsp; CGV 수원　　　　　　　　</label></p>");
	$("#jb-content").append("<p><label><input type='radio' name='theaters' onclick='movTime()' value='메가박스 강남'>&nbsp;&nbsp; 메가박스 강남　　　　　　　　</label></p>");
	$("#jb-content").append("<p><label><input type='radio' name='theaters' onclick='movTime()' value='롯데시네마 광교'>&nbsp;&nbsp; 롯데시네마 광교　　　　　　　　</label></p>");

 	//$("#jb-footer1 *").remove();
	
	$("#imgUrl").attr("value",imgUrl);
	$("#movie").text(title);
	$("#theater").text("극장선택");
	$("#movTime").text("시간선택"); 
	$("#finish").attr("disabled",true);
}


function movTime() {
	//alert(theaters);
	var theater = $('input[name="theaters"]:checked').val();
	$("#theater").text(theater);
	$("#movTime").text("시간선택"); 
	$("#finish").attr("type","hidden");
	$("#finish").attr("disabled",true);
	//$("#jb-footer1 *").remove();
	//$("#jb-footer1").append("<span> 극장 : "+theaters+"　|　</span>");	
	
	$("#jb-sidebar-right *").remove();
	$("#jb-sidebar-right").append("<h3 style='text-align: center;'>시간</h3>");
	$("#jb-sidebar-right").append("<p><label><input type='radio' name='movTime' onclick='timeVal()' value='08:00 ~ 09:50'>&nbsp;&nbsp; 08:00 ~ 09:50 　　　　　　　　</label></p>");
	$("#jb-sidebar-right").append("<p><label><input type='radio' name='movTime' onclick='timeVal()' value='10:00 ~ 12:00'>&nbsp;&nbsp; 10:00 ~ 12:00 　　　　　　　　</label></p>");
	$("#jb-sidebar-right").append("<p><label><input type='radio' name='movTime' onclick='timeVal()' value='12:30 ~ 14:30'>&nbsp;&nbsp; 12:30 ~ 14:30 　　　　　　　　</label></p>");
	$("#jb-sidebar-right").append("<p><label><input type='radio' name='movTime' onclick='timeVal()' value='15:00 ~ 17:00'>&nbsp;&nbsp; 15:00 ~ 17:00 　　　　　　　　</label></p>"); 
	$("#jb-sidebar-right").append("<p><label><input type='radio' name='movTime' onclick='timeVal()' value='17:30 ~ 19:45'>&nbsp;&nbsp; 17:30 ~ 19:45 　　　　　　　　</label></p>"); 
	$("#jb-sidebar-right").append("<p><label><input type='radio' name='movTime' onclick='timeVal()' value='20:00 ~ 21:25'>&nbsp;&nbsp; 20:00 ~ 21:25 　　　　　　　　</label></p>");	 
}

function timeVal() {
	var movTime = $('input[name="movTime"]:checked').val();
	$("#movTime").text(movTime); 
	$("#finish").attr("disabled",false);
	
	//$("#jb-footer1").append("<span> 시간 : "+movTime+"</span>");	
	//$("#jb-footer1").append("<button>예약 완료</button>");	
}



$(function() {
	$('#finish').click(function(){
		var _id = "<%=mem.getId()%>";
		var _imgUrl = $('#imgUrl').val();
		var _title = $('#movie').text();
		var _theater = $('#theater').text();
		var _movTime = $('#movTime').text();
		//var result = "imgUrl=_imgUrl&title=_title&theater=_theater&movTime=_movTime"; 
		//alert(_imgUrl);
		
		if( confirm(_title+"\n"+_theater+"\n"+_movTime+" 로 예약합니다.") ) {
			location.href="addReserv.do?id="+_id+"&imgUrl="+ _imgUrl+"&title="+_title+"&theater="+_theater+"&movTime="+_movTime;
		} 

		
		
		
		
		
	});
});

/* 
$(function() {
	$('#finish').click(function(){
		//alert($('#movie').text());
		//alert($('#theater').text());
		//alert($('#movTime').text());

		var _title = $('#movie').text();
		var _theater = $('#theater').text();
		var _movTime = $('#movTime').text();

		var result = "title=_title&theater=_theater&movTime=_movTime"; 
		//location.href="reseltSet.do?="

		$.ajax({
			type:"get",
			//url:"./resultSet.do",
			data:result,
			success:function(){
				
				}
			})
		})
})
 */

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