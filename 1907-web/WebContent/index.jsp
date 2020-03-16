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
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1907-web</title>
<link rel='styleSheet' type='text/css' href='./css/index.css?Ver=1' />
</head>
<body>
<%
String inc = "./html5/index_html5.jsp";
String sp = "./html5/anchor.jsp";

if(request.getParameter("inc") != null){
	inc = request.getParameter("inc");
}
if(request.getParameter("sp") != null){
	sp = request.getParameter("sp");
}
%>
<div id='main'>
    <!-- top.jsp -->
    <%@include file="top.jsp" %>
    <div id='center'>
       <div id='sub_menu'>
       	<jsp:include page="<%=inc %>"/>
       </div>
        <div id='main_content'>
        <jsp:include page="<%=sp %>"/>
		</div>
       <aside id='aside'>ASIDE</aside>
    </div>
    <%@include file="bottom.jsp" %>
    <!-- bottom.jsp -->
</div>
<script>
var path;
var inc;
function goUrl(p, i, sp){
	localStorage.setItem('path', p);
	localStorage.setItem('inc', i);
	path = p;
	inc = i;
	let url = 'index.jsp?inc='+ path + inc + '&sp=' + path + sp;
	location.href = url;
}
function goSub(sp){
	path = localStorage.getItem('path');
	inc  = localStorage.getItem('inc');
	let url = 'index.jsp?inc='+ path + inc + '&sp=' + path + sp;
	location.href = url;	//단순히 유알엘만 바뀜
}
function goSubmit(frm, sp){
	path = localStorage.getItem('path');
	inc  = localStorage.getItem('inc');
	let url = 'index.jsp?inc='+ path + inc + '&sp=' + path + sp;
	frm.action = url; //실제 값이 넘어감?
	frm.submit();//포스트타입으로 넘어감
}
</script>

</body>
</html>