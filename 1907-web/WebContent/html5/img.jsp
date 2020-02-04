<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>이미지 경로를 절대|상대 경로 지정</h3>
<img src='../images/abc.png'><br/>
<img src='/1907-web/images/abc.png'><br/>
<h3>이미지 표시 사이즈 변경</h3>h3>
<img src='../images/abc.png' width='100px'><br/>
<img src='../images/abc.png' width='50%'><br/>
<img src='../images/abc.png' width='150px' height='50px'/><br/>

<h3>문자와 이미지의 배치</h3>
<p>
    <img src='../images/abc.png' align='left'>
    align='left'속성은 이미지가 문자의 왼쪽에 배치된다는 의미임.
</p>

<p>
    <img src='../images/abc.png' align='right'>
    align='right'속성은 이미지가 문자의 오른쪽에 배치된다는 의미임.
</p>

<p>
<h4>use map</h4>
    <img src='../images/test.png' usemap='#usemap_image'>    
    <map name='usemap_image'>
        <area shape="rect" coords = '0,0,110,130' title='폰트연습페이지' href='font.jsp'>
        <area shape="rect" coords = '0,111,130,200' title='문단연습페이지' href='paragraph.jsp'>
        <area shape="rect" coords = '0,201,130,310' title='앵커연습페이지' href='anchor.jsp'>
    </map>
</p>

</body>
</html>