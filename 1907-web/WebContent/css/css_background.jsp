<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css_background</title>
<style>
/* 1)모든 div의 넓이와 높이를 설정(250x50)
   2)적당한 여백
   3)display : inline-block 수정 
   4)외각선 처리
   */
   
   div{
   width:700px; height:400px;
   margin:10px;
   display: inline-block;
   border : 2px solid #ff0000;
   }
   #div1{
   overflow:auto;
   background-image:url(../images/test.png);
   background-attachment:fixed;
   }
   #div2{
   background-image:url(../images/test.png);
   background-repeat:no-repeat;
   background-position : 20px 20px;
   }
   #div3{
   background-image:url(../images/test.png);
   background-repeat:repeat-x;
   }
   #div4{
   background-image:url(../images/test.png);
   background-repeat:repeat-y;
   }
   #div5{
   width:500px;
   background-image:url(../images/test.png);
   background-size:100% 100%;
   }
</style>
</head>
<body>
<h3>바탕 이미지</h3>
  <ul>
    <li>background-image:url(path) </li>
    <li>background-attachement :fixed | scroll</li>
    <li>background-position : x y | left | right | bottom | top | cent </li>
    <li>background-repeat : repeat-x | repeat-y | no-repeat </li>
    <li>background-size : sizeX sizeY </li>
  </ul>
<hr/>
<div id='div1'>
엄청 많은 내용이 있는 영역.
엄청 많은 내용이 있는 영역.
엄청 많은 내용이 있는 영역.
엄청 많은 내용이 있는 영역.
엄청 많은 내용이 있는 영역.
엄청 많은 내용이 있는 영역.
엄청 많은 내용이 있는 영역.
엄청 많은 내용이 있는 영역.
엄청 많은 내용이 있는 영역.
엄청 많은 내용이 있는 영역.
엄청 많은 내용이 있는 영역.
엄청 많은 내용이 있는 영역.
엄청 많은 내용이 있는 영역.
엄청 많은 내용이 있는 영역.
엄청 많은 내용이 있는 영역.
</div>
<div id='div2'></div>
<div id='div3'></div>
<div id='div4'></div>
<div id='div5'></div>
</body>
</html>