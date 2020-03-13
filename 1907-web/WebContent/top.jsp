<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <header id='header' >HEADER</header>    
    <nav id='nav' >
      <ul>
        <li><a href='#' onclick="goUrl('./html5/',      'index_html5.jsp', 'canvas.jsp')">HTML</a></li>
			<li><a href='#' onclick="goUrl('./css/',        'index_css.jsp',  'css_list_style.jsp')">CSS</a></li>
			<li><a href='#' onclick="goUrl('./ajax/',       'index_ajax.jsp', 'emp_complete.jsp')">Ajax</a></li>
			<li><a href='#' onclick="goUrl('./ajax_in_jquery/', 'index_ajax_in_jquery.jsp', 'member_main.jsp')">Ajax IN jQuery</a></li>
			<li><a href='#' onclick="goUrl('./javascript/', 'index_javascript.jsp',             'array_1.jsp')">JavaScript</a></li>
			<li><a href='#' onclick="goUrl('./javascript_board/', 'index_javascript_board.jsp', 'select.jsp')">Script Board</a></li>
			<li><a href='#' onclick="goUrl('./jquery/',       'index_jquery.jsp',       'ani_color.jsp')">jQuery</a></li>
			<li><a href='#' onclick="goUrl('./mongo_member/', 'index_mongo_member.jsp', 'select.jsp')">Mongo Member</a></li>
			<li><a href='#' onclick="goUrl('./nodejs/',       'index_nodejs.jsp',       '/begin/test2.js')">nodejs</a></li>
      </ul>
    </nav>


</body>
</html>