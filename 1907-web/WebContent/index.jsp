<!-- 
1. header
  1) 바탕이미지 설정
2. nav
  1) 메뉴를 오른쪽 배치
  2) hover 효과 지정
  3) menu1->html으로 변경한 후 <a/>사용하여 index_html.jsp연결
  4) menu2->css로 변경한 후 <a/>사용하여 index_css.jsp 연결
3.aside
  -/WebContedt/aside.jsp를 추가 작성(aside영역에 표시할 것임)
4.footer
  -회사 정보를 간단히 표시 
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1907-web</title>
<link rel='styleSheet' type='text/css' href='./css/index.css?Ver=1' />
</head>
<body>

<div id='main'>
    <header id='header' >HEADER</header>
    <nav id='nav' >
      <ul>
        <li><a href= './html5/index_html5.jsp'>HTML</a></li>
        <li><a href='./css/index_css.jsp'>CSS</a></li>
        <li><a href='#'>menu3</a></li>
        <li><a href='#'>menu4</a></li>
        <li><a href='#'>menu5</a></li>
      </ul>
    </nav>
    
    <div id='center'>
       <div id='sub_menu'>SUB MENU</div>
       <div id='main_content'>Main Content</div>
       <aside id='aside'>ASIDE</aside>
    </div>
    <footer id='footer'>naver</footer>
</div>


</body>
</html>