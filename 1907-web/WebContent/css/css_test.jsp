<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css_test</title>
<style>
  #div1{
    border : 1px solid #00f;
    background-color : #ccf;
    width : 400px;
    height : 80px;
  }
</style>
<link rel="styleSheet" type='text/css' href='css_test.css' />

</head>
<body>
<h3>CSS 적용방법</h3>
<p>
  <ol>
    <li>&lt style &gt 태그를 사용한 방법</li>
    <li>태그 속성중 style을 사용하는 방법</li>
    <li>외부에 css파일을 작성한 후 link태그를 사용하여 가져다 쓰는 방법</li>
  </ol>
<div id='div1'></div>
<div id='div2' style='border:1px solid #00f; width : 400px; height:80px;'></div>
<div id='div3'></div>

</body>
</html>