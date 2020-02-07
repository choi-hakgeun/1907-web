<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css_responsive</title>
<style media='screen and (min-width:1000px)'>
#main { 
 width:1200px;
 height:300px;
}
#main div{ 
 float:left;
}
#left{
 background-color:red;
 width:200px;
 height:300px;
 float:left;
}
#center{
 background-color:#00ff00;
 width:800px;
 height:300px;
 float:left;
}
#right{
 background-color:#0000ff;
 width:200px;
 height:300px;
 float:left;
}
</style>

<style media='screen and (min-width:800px) and (max-width:999px)'>
#main { 
 width:900px; 
 overflow:hidden;
 margin:auto;
}
#main div{ 
 height:300px;
}
#left{
 width:200px;  
 background-color:red;
}
#center{
 background-color:#00ff00;
 width:100%; 
}
#right{ 
 clear:left;
 background-color:#0000ff;
 width:100%; 
}
</style>
<style media='screen and (min-width:799px)'>
#main { 
 width:100%; 
 overflow:hidden;
 margin:auto;
}
#main div{
 
 height:300px;
}
#left{
 width:100%;  
 background-color:red;
}
#center{
 background-color:#00ff00;
 width:100%; 
}
#right{ 
 clear:left;
 background-color:#0000ff;
 width:100%; 
}
</style>
</head>
<body>
<h3>responsive(반응형 웹)</h3>
<dl>
  <dt>link 태그를 사용한 반응형</dt>
    <dd>media='screen and(최소크기) and (최대크기)'href='path</dd>
  <dt>style 태그를 사용한 반응형</dt>
    <dd>media='screen and(최소크기) and (최대크기)'</dd>
  <dt>가로 | 세로 모드</dt>
    <dd> media='screen and (orientation:portrait(세로) | ㅣlandscape(가로))'</dd>
</dl>
<div id='main'>
  <div id='left'></div>
  <div id='center'></div>
  <div id='right'></div>
</div>

</body>
</html>