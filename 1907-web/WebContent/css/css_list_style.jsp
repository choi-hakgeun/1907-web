<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css_list_style</title>
<style>
  #ul1, #ul2{
    list-style-image:url(../images/icon.png);    
  }
  #ul2{
    list-style-position:inside;
  }
</style>

</head>
<body>
<h3>list_style</h3>
  <ul>
    <li>list-style-image:url(path)</li>
    <li>list-style-position : inside | outside </li>
  </ul>
<hr/>
<ul id='ul1'>
  <li>
  백두산백두산백두산백두산백두산백두산백두산백두산백두산백두산백두산백두산백두산
  백두산백두산백두산백두산백두산백두산백두산백두산백두산백두산백두산백두산백두산
  백두산백두산백두산백두산백두산백두산백두산백두산백두산백두산
  </li>
  <li>한라산</li>
  <li>설악산</li>
  <li>금강산</li>
  <li>치악산</li>
</ul>
<ul id='ul2'>
  <li>
    강아지강아지강아지강아지강아지강아지강아지강아지
    강아지강아지강아지강아지강아지강아지강아지강아지
    강아지강아지강아지강아지강아지강아지강아지강아지
  </li>
  <li>송아지</li>
  <li>망아지</li>  
</ul>

</body>
</html>