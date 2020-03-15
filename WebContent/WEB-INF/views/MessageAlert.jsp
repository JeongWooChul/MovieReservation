<%@page import="com.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String message = (String)request.getAttribute("message");
	System.out.println("message : " + message);
%>

<% 
if(message.trim().equals("loginT")){
	MemberDto login = (MemberDto)session.getAttribute("login");	
	%>
	<script type="text/javascript">
		alert('<%=login.getId() %>' + "님 환영합니다");
		location.href = "movieChart.do";
	</script>
	<%
} else if (message.trim().equals("loginF")) {
	%>
	<script type="text/javascript">
		alert("아이디 또는 비밀번호를 다시 확인하세요");
		location.href = "login.do";
	</script>
	<%	
}	



if(message.trim().equals("regiT")){
	MemberDto login = (MemberDto)session.getAttribute("login");	
	%>
	<script type="text/javascript">
		alert('<%=login.getId() %>' + "님 회원가입이 완료 되었습니다");
		location.href = "login.do";
	</script>
	<%
} else if (message.trim().equals("regiF")) {
	%>
	<script type="text/javascript">
		alert("회원가입에 실패 하였습니다");
		location.href = "regi.do";
	</script>
	<%	
}	
%>


<% if(message.trim().equals("logout")){ %>
	<script type="text/javascript">
		if( confirm("로그아웃 합니다")==true ) {
			location.href = "login.do";
		} else {
			history.back();
		}
	</script>
	<%
}
%>

<% if(message.trim().equals("addRevF")) {%>
	<script type="text/javascript">
		alert("예매에 실패하였습니다");
		history.back();		
	</script>
<% }%>
