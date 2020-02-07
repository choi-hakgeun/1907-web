<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css_transform</title>
<style>
div{
  border:2px solid #aaaaff;
  width:400px; height:150px;
  margin-bottom:20px;
}
#rotate>span{
  position:absolute;
  margin:30px;
  font-size:30px;
  -webkit-transform-origin : 50% 50%;
  -webkit-transform:rotate(15deg);
}
#scale{
  height:600px;  
  }
#scale>.a{
transform:scale(0.5);
}
#scale>.b{
position:relative;
top:50px; left:50px;
transform:scale(1.2);
}
#skew>span{
  position:absolute;
  font-size:50px;
  transform:skew(40deg, 10deg);
}
#translate>span{
  font-size:50px;
  position:absolute;
  transform:translate(100px, 30px);
}
</style>

</head>
<body>
<h3>transform</h3>
<ul>
  <li>rotate</li>
  <li>scale</li>
  <li>skew</li>
  <li>translate</li>  
</ul>
</hr>
<div id='rotate'>
  <span>화이팅 1907</span>
  </div>  
<div id='scale'>
  <img src='../images/test.png' />
  <img src='../images/test.png' class='a' />
  <img src='../images/test.png' class='b' />
</div>
<div id='skew'></div>
  <span>화이팅 1907</span>
<div id='translate'></div>
  <span>화이팅 1907</span>
</body>
</html>