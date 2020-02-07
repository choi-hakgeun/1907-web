<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>css_transition</title>
<style>
div{  
  border:2px solid #aaaaff;
  padding:20px;
  width:10px;
  margin:0px;
  background-color:#ddd;
  color:#000;
  transform:rotate(0deg);
  opacity:0.3;
  transition:transform 3s, color 3s, background 3s, opacity 3s, width 1s;
}
div:hover{
 width:120px;
 background-color:#000;
 color:#fff;
 transform:rotate(3deg);
 opacity:.8;
 transition:transform 3s, color 3s, background 3s, width 1s;
}
</style>
</head>
<body>
<h3>transition</h3>
<div>html</div>
<div>css</div>
<div>javascript</div>
<div>jsp</div>
<div>java</div>

</body>
</html>