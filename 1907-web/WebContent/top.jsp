<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='styleSheet' type='text/css' href='./css/index.css' />
<script src='./lib/jquery-3.4.1.js'></script>
</head>
<body>
	<div id='Login'>
	<% if(session.getAttribute("mId") == null){ %>
		<input type='button' value='로그인' id='btnLogin'>
	<%		
	}else{
	%>
		<output>[<%=session.getAttribute("mId") %>]</output>				
		<input type='button' value='로그아웃' id='btnLogout'>		
	<%} %>
	</div>

    <header id='header' >HEADER</header>
    <nav id='nav' >
      <ul>
        	<li><a href='#' onclick="goUrl('./html5/',      'index_html5.jsp', 'canvas.jsp')">HTML</a></li>
			<li><a href='#' onclick="goUrl('./css/',        'index_css.jsp',  'css_list_style.jsp')">CSS</a></li>
			<li><a href='#' onclick="goUrl('./ajax/',       'index_ajax.jsp', 'emp_complete.jsp')">Ajax</a></li>
			<li><a href='#' onclick="goUrl('./ajax_in_jquery/', 'index_ajax_in_jquery.jsp', 'member_main.jsp')">Ajax IN jQuery</a></li>
			<li><a href='#' onclick="goUrl('./javascript/', 'index_javascript.jsp',             'array_1.jsp')">JavaScript</a></li>
			<li><a href='#' onclick="goUrl('./javascript_board2/', 'index_javascript_board.jsp', 'select.jsp')">Script Board</a></li>
			<li><a href='#' onclick="goUrl('./jquery/',       'index_jquery.jsp',       'ani_color.jsp')">jQuery</a></li>
			<li><a href='#' onclick="goUrl('./mongo_member/', 'index_mongo_member.jsp', 'select.jsp')">Mongo Member</a></li>
			<li><a href='#' onclick="goUrl('./nodejs',       '/http/index_nodejs.jsp',       '/begin/test2.js')">nodejs</a></li>
			<li><a href='#' onclick="goUrl('./jsp/',       'index_jsp.jsp',       'insert.jsp')">jsp</a></li>
      </ul>
    </nav>
<script>
if($('#btnLogin') != null){
	$('#btnLogin').click(function(){
		location.href='./member/login.jsp';
})	
}
if($('#btnLogout') !=null){
	$('#btnLogout').click(function(){
		location.href='./member/logout.jsp';
	})
}
</script>
</body>
</html>